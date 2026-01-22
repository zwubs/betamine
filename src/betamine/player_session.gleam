import betamine/common/difficulty
import betamine/common/entity/entity_hand
import betamine/common/entity/entity_handedness
import betamine/common/entity/player/player_interaction
import betamine/common/entity/player/player_model_customization
import betamine/common/math/vector3
import betamine/common/profile
import betamine/common/rotation
import betamine/common/uuid
import betamine/constants
import betamine/handlers/entity_handler
import betamine/handlers/player_handler
import betamine/message
import betamine/mojang
import betamine/protocol
import betamine/protocol/common/game_event
import betamine/protocol/packets/clientbound
import betamine/protocol/packets/serverbound
import betamine/protocol/phase
import betamine/protocol/registry
import gleam/erlang/process.{type Subject}
import gleam/function
import gleam/io
import gleam/list
import gleam/otp/actor
import gleam/result
import gleam/string
import glisten

pub type Packet {
  ServerBoundPacket(data: BitArray)
  GameUpdate(message.PlayerSessionMessage)
  Disconnect
}

type State {
  State(
    subject_for_host: Subject(Packet),
    game_subject: Subject(message.GameMessage),
    subject_for_game: Subject(message.PlayerSessionMessage),
    world_subject: Subject(message.WorldMessage),
    subject_for_world: Subject(message.PlayerSessionMessage),
    connection: glisten.Connection(BitArray),
    phase: phase.Phase,
    last_keep_alive: Int,
    profile: profile.Profile,
    uuid: uuid.Uuid,
    main_hand: entity_handedness.EntityHandedness,
    model_customization: player_model_customization.PlayerModelCustomization,
    ignore_position_packets: Bool,
  )
}

type Error {
  UnknownServerBoundPacket(phase: phase.Phase, packet: serverbound.Packet)
  UnknownProtocolState(state: Int)
}

pub fn start(
  game_subject: Subject(message.GameMessage),
  world_subject: Subject(message.WorldMessage),
  connection: glisten.Connection(BitArray),
) -> Result(actor.Started(Subject(Packet)), actor.StartError) {
  actor.new_with_initialiser(1000, fn(subject_for_host) {
    let subject_for_world = process.new_subject()
    let subject_for_game = process.new_subject()
    let selector =
      process.new_selector()
      |> process.select_map(subject_for_host, function.identity)
      |> process.select_map(subject_for_game, GameUpdate)
    Ok(
      actor.initialised(State(
        subject_for_host:,
        game_subject:,
        subject_for_game:,
        world_subject:,
        subject_for_world:,
        connection:,
        phase: phase.Handshaking,
        last_keep_alive: now_seconds(),
        profile: profile.default(),
        uuid: uuid.default,
        main_hand: entity_handedness.Right,
        model_customization: player_model_customization.default(),
        ignore_position_packets: True,
      ))
      |> actor.selecting(selector)
      |> actor.returning(subject_for_host),
    )
  })
  |> actor.on_message(handle_message)
  |> actor.start()
}

fn handle_message(state: State, packet: Packet) -> actor.Next(State, Packet) {
  let result = case packet {
    ServerBoundPacket(data) -> {
      case protocol.decode_serverbound(state.phase, data) {
        Ok(packet) -> handle_server_bound(packet, state)
        Error(error) -> {
          echo error
          Ok(state)
        }
      }
    }
    GameUpdate(update) -> handle_game_update(update, state)
    Disconnect -> {
      process.send(state.game_subject, message.RemovePlayer(state.uuid))
      Ok(state)
    }
  }
  case result {
    Ok(state) -> actor.continue(state)
    Error(error) -> handle_error(error, state)
  }
}

fn handle_error(error: Error, state: State) {
  case error {
    UnknownServerBoundPacket(_, _) -> {
      actor.continue(state)
    }
    UnknownProtocolState(phase) -> {
      io.println_error(
        "Client Requested An Unknown Protocol State: " <> string.inspect(phase),
      )
      actor.continue(state)
    }
  }
}

@external(erlang, "betamine_ffi", "now_seconds")
pub fn now_seconds() -> Int

fn handle_server_bound(packet: serverbound.Packet, state: State) {
  // Logic for handling keep alives
  // I know I can figure out a way to utilize OTP for this
  // but I just need something to work for now
  let offset = now_seconds() - state.last_keep_alive
  let state = case state.phase {
    phase.Play if offset >= 15 -> {
      send(state, [
        clientbound.PlayKeepAlive(clientbound.PlayKeepAlivePacket(0)),
      ])
      State(..state, last_keep_alive: now_seconds())
    }
    _ -> state
  }

  case packet {
    serverbound.Handshake(packet) -> {
      case packet.next_phase {
        1 -> Ok(State(..state, phase: phase.Status))
        2 -> Ok(State(..state, phase: phase.Login))
        phase -> Error(UnknownProtocolState(phase))
      }
    }
    serverbound.StatusRequest -> {
      send(state, [
        clientbound.StatusResponse(clientbound.StatusResponsePacket(
          version_name: constants.mc_version_name,
          version_protocol: constants.mc_version_protocol,
          max_player_count: constants.mc_max_player_count,
          online_player_count: 0,
          players: [#("zwubs", "0c3456dc-85a0-4baf-89b4-db008ec1c749")],
          description: "Hello Betamine!",
          favicon: constants.mc_favicon,
          enforces_secure_chat: False,
        )),
      ])
      Ok(state)
    }
    serverbound.StatusPing(packet) -> {
      send(state, [
        clientbound.StatusPong(clientbound.StatusPongPacket(packet.id)),
      ])
      Ok(state)
    }
    serverbound.LoginStart(packet) -> {
      let assert Ok(profile) = mojang.fetch_profile(packet.uuid)
      send(state, [
        clientbound.LoginSuccess(clientbound.LoginSuccessPacket(profile)),
      ])
      Ok(State(..state, profile:, uuid: packet.uuid))
    }
    serverbound.LoginAcknowledged ->
      Ok(State(..state, phase: phase.Configuration))
    serverbound.ClientInformation(packet) -> {
      case state.phase {
        phase.Configuration -> {
          send(state, [
            clientbound.FeatureFlags(
              clientbound.FeatureFlagsPacket([#("minecraft", "vanilla")]),
            ),
            clientbound.UpdateTags(
              clientbound.UpdateTagsPacket([
                #(#("minecraft", "fluid"), [
                  // References to the minecraft:fluid registry
                  #(#("minecraft", "lava"), [3, 4]),
                  #(#("minecraft", "water"), [1, 2]),
                ]),
              ]),
            ),
            clientbound.KnownDataPacks(
              clientbound.KnownDataPacksPacket([
                clientbound.KnownDataPack(
                  "minecraft",
                  "core",
                  constants.mc_version_name,
                ),
              ]),
            ),
          ])
        }
        _ -> {
          process.send(
            state.game_subject,
            message.UpdatePlayerMainHand(state.uuid, packet.main_hand),
          )
          process.send(
            state.game_subject,
            message.UpdatePlayerModelCustomization(
              state.uuid,
              packet.model_customizations,
            ),
          )
        }
      }
      Ok(
        State(
          ..state,
          main_hand: packet.main_hand,
          model_customization: packet.model_customizations,
        ),
      )
    }
    serverbound.Plugin(_) -> {
      send(state, [
        clientbound.Plugin(
          clientbound.PluginPacket(#("minecraft", "brand"), <<
            8, "betamine":utf8,
          >>),
        ),
      ])
      Ok(state)
    }
    serverbound.KnownDataPacks(_) -> {
      // Finish Configuration
      send(state, registry.get_packets())
      send(state, [clientbound.FinishConfiguration])
      Ok(state)
    }
    // Acknowledge Finish Configuration
    serverbound.AcknowledgeFinishConfiguration -> {
      let player =
        process.call(state.game_subject, 1000, message.SpawnPlayer(
          state.subject_for_game,
          _,
          state.uuid,
        ))
      process.send(
        state.game_subject,
        message.UpdatePlayerMainHand(state.uuid, state.main_hand),
      )
      process.send(
        state.game_subject,
        message.UpdatePlayerModelCustomization(
          state.uuid,
          state.model_customization,
        ),
      )

      let chunk_range = list.range(-2, 1)
      let chunk_packets =
        list.fold(chunk_range, [], fn(packets, x) {
          list.fold(chunk_range, packets, fn(packets, z) {
            process.call(state.world_subject, 1000, message.GetChunk(_, x, z))
            |> result.map(fn(chunk) {
              [
                clientbound.LevelChunkWithLight(
                  clientbound.LevelChunkWithLightPacket(
                    ..clientbound.default_level_chunk_with_light_packet(),
                    x:,
                    z:,
                    chunk:,
                  ),
                ),
                ..packets
              ]
            })
            |> result.unwrap(packets)
          })
        })

      send(state, [
        clientbound.Login(
          clientbound.LoginPacket(
            ..clientbound.default_login,
            entity_id: player.entity.id,
          ),
        ),
        player_handler.handle_add(player.profile),
        clientbound.ChangeDifficulty(clientbound.ChangeDifficultyPacket(
          difficulty: difficulty.Easy,
          locked: False,
        )),
        clientbound.GameEvent(clientbound.GameEventPacket(
          game_event: game_event.WaitForChunks,
        )),
        clientbound.SetCenterChunk(clientbound.SetCenterChunkPacket(0, 0)),
        clientbound.SetDefaultSpawnPosition(
          clientbound.SetDefaultSpawnPositionPacket(
            dimension: #("minecraft", "overworld"),
            position: vector3.truncate(constants.mc_player_spawn_point),
            rotation: rotation.Rotation(0.0, 0.0),
          ),
        ),
        clientbound.SynchronizePlayerPosition(
          clientbound.SynchronizePlayerPositionPacket(
            0,
            player.entity.position,
            player.entity.velocity,
            player.entity.rotation,
            0,
          ),
        ),
        ..chunk_packets
      ])
      Ok(State(..state, phase: phase.Play, ignore_position_packets: True))
    }
    serverbound.ConfirmTeleport(_) -> {
      Ok(State(..state, ignore_position_packets: False))
    }
    serverbound.PlayerPosition(packet) -> {
      case state.ignore_position_packets {
        True -> Nil
        False -> {
          process.send(
            state.game_subject,
            message.MovePlayer(state.uuid, packet.position, packet.on_ground),
          )
        }
      }
      Ok(state)
    }
    serverbound.PlayerPositionAndRotation(packet) -> {
      case state.ignore_position_packets {
        True -> Nil
        False -> {
          process.send(
            state.game_subject,
            message.MovePlayer(state.uuid, packet.position, packet.on_ground),
          )
        }
      }
      process.send(
        state.game_subject,
        message.RotatePlayer(state.uuid, packet.rotation, packet.on_ground),
      )
      Ok(state)
    }
    serverbound.PlayerRotation(packet) -> {
      process.send(
        state.game_subject,
        message.RotatePlayer(state.uuid, packet.rotation, packet.on_ground),
      )
      Ok(state)
    }
    serverbound.PlayerInput(packet) -> {
      process.send(
        state.game_subject,
        message.UpdatePlayerSneaking(state.uuid, packet.sneak),
      )
      Ok(state)
    }
    serverbound.PlayerLoaded -> {
      process.call(state.game_subject, 1000, message.GetAllPlayers)
      |> list.filter(fn(other_player) {
        other_player.profile.id != state.profile.id
      })
      |> list.map(player_handler.handle_spawn)
      |> list.flatten
      |> send_bundle(state, _)
      process.send(
        state.game_subject,
        message.StartRecievingUpdates(state.profile.id),
      )
      Ok(state)
    }
    serverbound.Interact(packet) -> {
      case packet.interaction {
        player_interaction.Attack -> {
          process.send(
            state.game_subject,
            message.SwingPlayerArm(state.uuid, True),
          )
        }
        _ -> Nil
      }
      Ok(state)
    }
    serverbound.SwingArm(packet) -> {
      process.send(
        state.game_subject,
        message.SwingPlayerArm(state.uuid, packet.hand == entity_hand.Dominant),
      )
      Ok(state)
    }
    _ -> Ok(state)
  }
}

fn send(state: State, packets: List(clientbound.Packet)) {
  list.each(packets, fn(packet) {
    let encoded_packet = protocol.encode_clientbound(packet)
    let assert Ok(Nil) = glisten.send(state.connection, encoded_packet)
  })
}

fn send_bundle(state: State, packets: List(clientbound.Packet)) {
  list.each(
    [clientbound.BundleDelimiter, ..packets]
      |> list.append([clientbound.BundleDelimiter]),
    fn(packet) {
      let encoded_packet = protocol.encode_clientbound(packet)
      let assert Ok(Nil) = glisten.send(state.connection, encoded_packet)
    },
  )
}

fn handle_game_update(message: message.PlayerSessionMessage, state: State) {
  case message {
    message.PlayerSpawned(player) -> {
      send_bundle(state, player_handler.handle_spawn(player))
      Ok(state)
    }
    message.EntityMetadataUpdated(entity_id, metadata) -> {
      send(state, [entity_handler.handle_metadata_update(entity_id, metadata)])
      Ok(state)
    }
    message.EntityPositionUpdated(id, delta, on_ground) -> {
      send(state, [entity_handler.handle_move(id, delta, on_ground)])
      Ok(state)
    }
    message.EntityRotationUpdated(id, rotation, on_ground) -> {
      send(state, entity_handler.handle_rotate(id, rotation, on_ground))
      Ok(state)
    }
    message.PlayerDisconnected(uuid, entity_id) -> {
      send(state, player_handler.handle_disconnect(uuid, entity_id))
      Ok(state)
    }
    message.EntityAnimationTriggered(id, animation) -> {
      send(state, [entity_handler.handle_animation(id, animation)])
      Ok(state)
    }
  }
}
