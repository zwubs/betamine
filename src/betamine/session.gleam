import betamine/common/difficulty
import betamine/common/game_mode
import betamine/common/player.{type Player, Player}
import betamine/common/profile
import betamine/constants
import betamine/game/command
import betamine/game/update
import betamine/handlers/entity_handler
import betamine/handlers/player_handler
import betamine/protocol
import betamine/protocol/common/game_event
import betamine/protocol/packets/clientbound
import betamine/protocol/packets/serverbound
import betamine/protocol/phase
import betamine/protocol/registry
import gleam/bit_array
import gleam/bytes_builder
import gleam/erlang/process.{type Subject}
import gleam/function
import gleam/io
import gleam/list
import gleam/option
import gleam/otp/actor
import gleam/set
import gleam/string
import glisten

pub type Packet {
  ServerBoundPacket(data: BitArray)
  GameUpdate(update.Update)
  Disconnect
}

type State {
  State(
    subject_for_host: Subject(Packet),
    game_subject: Subject(command.Command),
    subject_for_game: Subject(update.Update),
    connection: glisten.Connection(BitArray),
    phase: phase.Phase,
    last_keep_alive: Int,
    player: Player,
  )
}

type Error {
  UnknownServerBoundPacket(state: phase.Phase, serverbound.Packet)
  UnknownProtocolState(state: Int)
}

pub fn start(
  host_subject: Subject(Subject(Packet)),
  game_subject: Subject(command.Command),
  connection: glisten.Connection(BitArray),
) -> Result(Subject(Packet), actor.StartError) {
  actor.start_spec(actor.Spec(
    init: fn() {
      let subject_for_host = process.new_subject()
      process.send(host_subject, subject_for_host)

      let subject_for_game = process.new_subject()

      let selector =
        process.new_selector()
        |> process.selecting(subject_for_host, function.identity)
        |> process.selecting(subject_for_game, fn(msg) { GameUpdate(msg) })

      actor.Ready(
        State(
          subject_for_host,
          game_subject,
          subject_for_game,
          connection,
          phase.Handshaking,
          now_seconds(),
          Player("", 0, 0),
        ),
        selector,
      )
    },
    init_timeout: 1000,
    loop: handle_message,
  ))
}

fn handle_message(packet: Packet, state: State) -> actor.Next(Packet, State) {
  let result = case packet {
    ServerBoundPacket(data) -> {
      case protocol.decode_serverbound(state.phase, data) {
        Ok(packet) -> handle_server_bound(packet, state)
        Error(error) -> {
          io.debug(error)
          Ok(state)
        }
      }
    }
    GameUpdate(update) -> handle_game_update(update, state)
    Disconnect -> {
      process.send(
        state.game_subject,
        command.RemovePlayer(state.player.uuid, state.subject_for_game),
      )
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
    UnknownServerBoundPacket(phase, packet) -> {
      io.debug(
        "Unhandled Packet w/ Phase: "
        <> string.inspect(phase)
        <> " & Packet:"
        <> string.inspect(packet),
      )
      actor.continue(state)
    }
    UnknownProtocolState(phase) -> {
      io.debug(
        "Client Requested An Unknown Protocol State: " <> string.inspect(phase),
      )
      actor.continue(state)
    }
  }
}

@external(erlang, "now_ffi", "now_seconds")
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

  io.debug("Receivied Packet: " <> string.inspect(packet))

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
      send(state, [
        clientbound.LoginSuccess(clientbound.LoginSuccessPacket(
          username: packet.name,
          uuid: packet.uuid,
          properties: [],
          strict_error_handling: False,
        )),
      ])
      Ok(State(..state, player: Player(packet.name, packet.uuid, 0)))
    }
    serverbound.LoginAcknowledged ->
      Ok(State(..state, phase: phase.Configuration))
    serverbound.ClientInformation(_) -> {
      send(state, [
        clientbound.FeatureFlags(
          clientbound.FeatureFlagsPacket([#("minecraft", "vanilla")]),
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
      Ok(state)
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
      registry.send(state.connection)
      // let _ = send(state, registry.serialize(), 7)
      let _ = send(state, [clientbound.FinishConfiguration])
      Ok(state)
    }
    // Acknowledge Finish Configuration
    serverbound.AcknowledgeFinishConfiguration -> {
      let #(player, entity) =
        process.call(
          state.game_subject,
          command.SpawnPlayer(
            state.subject_for_game,
            _,
            state.player.uuid,
            state.player.name,
          ),
          1000,
        )
      send(state, [
        clientbound.Login(
          clientbound.LoginPacket(
            ..clientbound.default_login,
            entity_id: player.entity_id,
          ),
        ),
        clientbound.ChangeDifficulty(clientbound.ChangeDifficultyPacket(
          difficulty: difficulty.Easy,
          locked: False,
        )),
        clientbound.GameEvent(clientbound.GameEventPacket(
          game_event: game_event.WaitForChunks,
        )),
        clientbound.SetCenterChunk(clientbound.SetCenterChunkPacket(0, 0)),
        clientbound.default_level_chunk_with_light,
        clientbound.SynchronizePlayerPosition(
          clientbound.SynchronizePlayerPositionPacket(
            entity.position,
            entity.rotation,
            0,
            0,
          ),
        ),
      ])

      process.call(state.game_subject, command.GetAllPlayers, 1000)
      |> list.filter(fn(player) { { player.0 }.uuid != state.player.uuid })
      |> list.map(fn(player) { player_handler.handle_spawn(player.0, player.1) })
      |> list.flatten
      |> send(state, _)
      Ok(State(..state, phase: phase.Play, player:))
    }
    serverbound.ConfirmTeleport(_) -> Ok(state)
    serverbound.KeepAlive(_) -> Ok(state)
    serverbound.PlayerPosition(packet) -> {
      process.send(
        state.game_subject,
        command.MoveEntity(
          state.player.entity_id,
          packet.position,
          packet.on_ground,
        ),
      )
      Ok(state)
    }
    serverbound.PlayerPositionAndRotation(packet) -> {
      process.send(
        state.game_subject,
        command.MoveEntity(
          state.player.entity_id,
          packet.position,
          packet.on_ground,
        ),
      )
      process.send(
        state.game_subject,
        command.RotateEntity(
          state.player.entity_id,
          packet.rotation,
          packet.on_ground,
        ),
      )
      Ok(state)
    }
    serverbound.PlayerRotation(packet) -> {
      process.send(
        state.game_subject,
        command.RotateEntity(
          state.player.entity_id,
          packet.rotation,
          packet.on_ground,
        ),
      )
      Ok(state)
    }
  }
}

fn send(state: State, packets: List(clientbound.Packet)) {
  io.println(
    "Sending Packets To: "
    <> state.player.name
    <> " w/ State: "
    <> string.inspect(state.phase),
  )

  list.each(packets, fn(packet) {
    io.debug(packet)
    let encoded_packet = protocol.encode_clientbound(packet)
    io.debug(bit_array.inspect(bytes_builder.to_bit_array(encoded_packet)))
    let assert Ok(Nil) = glisten.send(state.connection, encoded_packet)
  })
}

fn handle_game_update(update: update.Update, state: State) {
  case update {
    update.PlayerSpawned(player, entity) -> {
      send(state, player_handler.handle_spawn(player, entity))
      Ok(state)
    }
    update.EntityPosition(id, delta, on_ground) -> {
      send(state, [entity_handler.handle_move(id, delta, on_ground)])
      Ok(state)
    }
    update.EntityRotation(id, rotation, on_ground) -> {
      send(state, entity_handler.handle_rotate(id, rotation, on_ground))
      Ok(state)
    }
    update.PlayerDisconnected(player) -> {
      send(state, player_handler.handle_disconnect(player))
      Ok(state)
    }
  }
}
