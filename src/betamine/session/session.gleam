import betamine/common/chunk_position
import betamine/common/difficulty
import betamine/common/text_component
import betamine/common/uuid
import betamine/constant
import betamine/player/message as player_message
import betamine/protocol
import betamine/protocol/common/chunk
import betamine/protocol/common/game_event
import betamine/protocol/error
import betamine/protocol/packets/clientbound
import betamine/protocol/packets/serverbound
import betamine/protocol/phase
import betamine/protocol/registry
import betamine/session/message
import gleam/bit_array
import gleam/erlang/process
import gleam/int
import gleam/list
import gleam/option
import gleam/otp/actor
import gleam/result
import gleam/set
import gleam/string
import glisten
import glisten/socket
import logging

type Connection =
  glisten.Connection(message.Message)

pub type State {
  State(
    buffer: BitArray,
    subject: process.Subject(message.Message),
    phase: phase.Phase,
    ip_address: String,
    keep_alive_timer: process.Timer,
    player_uuid: option.Option(uuid.Uuid),
    player_subject: option.Option(player_message.PlayerSubject),
    player_manager_subject: player_message.ManagerSubject,
    chunk_subject: process.Subject(chunk.Chunk),
  )
}

pub fn init(
  connection: Connection,
  player_manager_name: player_message.ManagerName,
) -> #(State, option.Option(process.Selector(message.Message))) {
  let assert Ok(connection_info) = glisten.get_client_info(connection)
  let ip_address = glisten.ip_address_to_string(connection_info.ip_address)
  logging.log(logging.Debug, "Starting connection w/ " <> ip_address)
  let player_manager_subject = process.named_subject(player_manager_name)

  let subject = process.new_subject()
  let keep_alive_timer = process.send_after(subject, 15_000, message.KeepAlive)
  let chunk_subject: process.Subject(chunk.Chunk) = process.new_subject()

  let state =
    State(
      buffer: <<>>,
      subject:,
      phase: phase.Handshaking,
      player_uuid: option.None,
      player_subject: option.None,
      keep_alive_timer:,
      ip_address:,
      player_manager_subject:,
      chunk_subject:,
    )

  #(state, option.Some(process.select(process.new_selector(), subject)))
}

pub fn close(state: State) {
  logging.log(logging.Debug, "Closing connection w/ " <> state.ip_address)
  case state.player_uuid {
    option.Some(uuid) ->
      process.send(
        state.player_manager_subject,
        player_message.StopPlayer(uuid),
      )
    option.None -> Nil
  }
}

pub fn loop(
  state: State,
  message: glisten.Message(message.Message),
  connection: Connection,
) -> glisten.Next(State, glisten.Message(message.Message)) {
  let message_result = case message {
    glisten.Packet(chunk) -> {
      let state = State(..state, buffer: bit_array.append(state.buffer, chunk))
      handle_buffer(state, connection)
    }
    glisten.User(message) -> handle_message(state, message, connection)
  }

  case message_result {
    Ok(state) -> glisten.continue(state)
    Error(error) -> {
      let reason = string.inspect(error)
      echo "Disconnecting: " <> reason
      let _ = send_disconnect(connection, state.phase, reason)
      // Ensure enough time for the disconnect to send
      process.sleep(100)
      glisten.stop_abnormal(reason)
    }
  }
}

type PacketError {
  InvalidPacket(phase: phase.Phase, packet: serverbound.Packet)
  InvalidProtocolPhase(state: Int)
  ProtocolError(error: error.ProtocolError)
  InvalidFrame
  SocketError(reason: socket.SocketReason)
  PlayerNotStarted(error: actor.StartError)
  PlayerNotFound
}

fn handle_buffer(state: State, connection: Connection) {
  case protocol.split_frames(state.buffer) {
    Ok(#(frames, buffer)) -> {
      list.try_fold(frames, State(..state, buffer:), fn(state, frame) {
        logging.log(logging.Debug, "Frame: " <> bit_array.inspect(frame))
        case protocol.decode_serverbound(state.phase, frame) {
          Ok(#(packet, _)) -> handle_packet(state, packet, connection)
          Error(error.DecodeError(_, id, error.UnhandledPacket)) -> {
            logging.log(
              logging.Warning,
              "Unhandled Packet: " <> int.to_string(id),
            )
            Ok(state)
          }
          Error(error) -> Error(ProtocolError(error))
        }
      })
    }
    Error(_) -> Error(InvalidFrame)
  }
}

fn handle_packet(
  state: State,
  packet: serverbound.Packet,
  connection: Connection,
) -> Result(State, PacketError) {
  let State(phase: current_phase, player_manager_subject:, ..) = state
  case current_phase {
    phase.Handshaking -> {
      case packet {
        serverbound.Handshake(packet) -> {
          case packet.next_phase {
            1 -> Ok(State(..state, phase: phase.Status))
            2 -> Ok(State(..state, phase: phase.Login))
            next_phase -> Error(InvalidProtocolPhase(next_phase))
          }
        }
        _ -> Error(InvalidPacket(state.phase, packet))
      }
    }
    phase.Status -> {
      case packet {
        serverbound.StatusRequest -> {
          let player_list =
            process.call(state.player_manager_subject, 1000, fn(return_subject) {
              player_message.GetPlayerList(return_subject)
            })
          use _ <- result.try(send_packet(
            connection,
            clientbound.StatusResponse(clientbound.StatusResponsePacket(
              version_name: constant.mc_version_name,
              version_protocol: constant.mc_version_protocol,
              max_player_count: constant.mc_max_player_count,
              online_player_count: list.length(player_list),
              players: player_list,
              description: constant.mc_server_description,
              favicon: constant.mc_favicon,
              enforces_secure_chat: False,
            )),
          ))
          Ok(state)
        }
        serverbound.StatusPing(packet) -> {
          use _ <- result.try(send_packet(
            connection,
            clientbound.StatusPong(clientbound.StatusPongPacket(packet.id)),
          ))
          Ok(state)
        }
        _ -> Error(InvalidPacket(state.phase, packet))
      }
    }
    phase.Login -> {
      case packet {
        serverbound.LoginStart(packet) -> {
          let new_player_result =
            process.call(player_manager_subject, 10_000, fn(return_subject) {
              player_message.NewPlayer(
                return_subject,
                packet.uuid,
                state.subject,
              )
            })
          case new_player_result {
            Ok(#(player_subject, profile)) -> {
              use _ <- result.try(send_packet(
                connection,
                clientbound.LoginSuccess(clientbound.LoginSuccessPacket(profile)),
              ))
              Ok(
                State(
                  ..state,
                  player_subject: option.Some(player_subject),
                  player_uuid: option.Some(profile.id),
                ),
              )
            }
            Error(actor_start_error) ->
              Error(PlayerNotStarted(actor_start_error))
          }
        }
        serverbound.LoginAcknowledged ->
          Ok(State(..state, phase: phase.Configuration))
        _ -> Error(InvalidPacket(state.phase, packet))
      }
    }
    phase.Configuration -> {
      case packet {
        serverbound.ClientInformation(client_information) -> {
          use _ <- result.try(send_player_message(
            state.player_subject,
            player_message.UpdateClientInformation(client_information),
          ))

          use _ <- result.try(
            send_packets(connection, [
              clientbound.default_feature_flags,
              clientbound.default_update_tags,
              clientbound.default_known_data_packs,
            ]),
          )
          Ok(state)
        }
        serverbound.Plugin(_) -> {
          use _ <- result.try(send_packet(
            connection,
            clientbound.default_plugin(),
          ))
          Ok(state)
        }
        serverbound.KnownDataPacks(_) -> {
          use _ <- result.try(send_packets(connection, registry.get_packets()))
          use _ <- result.try(send_packet(
            connection,
            clientbound.FinishConfiguration,
          ))
          Ok(state)
        }
        serverbound.AcknowledgeFinishConfiguration -> {
          let phase = phase.Play
          use #(profile, _, entity) <- result.try(call_player(
            state.player_subject,
            1000,
            player_message.GetSpawnInformation,
          ))

          use _ <- result.try(send_player_message(
            state.player_subject,
            player_message.LoadInitialChunks,
          ))

          use _ <- result.try(
            send_packets(connection, [
              clientbound.Login(
                clientbound.LoginPacket(
                  ..clientbound.default_login,
                  entity_id: entity.id,
                ),
              ),
              clientbound.ChangeDifficulty(clientbound.ChangeDifficultyPacket(
                difficulty: difficulty.Easy,
                locked: False,
              )),
              clientbound.GameEvent(clientbound.GameEventPacket(
                game_event.WaitForChunks,
              )),
              clientbound.SetCenterChunk(clientbound.SetCenterChunkPacket(
                chunk_position.default,
              )),
              clientbound.SynchronizePlayerPosition(
                clientbound.SynchronizePlayerPositionPacket(
                  0,
                  entity.position,
                  entity.velocity,
                  entity.rotation,
                  0,
                ),
              ),
              // Is this packet needed?
              clientbound.PlayerInfoUpdate(
                clientbound.PlayerInfoUpdatePacket(
                  actions: set.from_list([
                    clientbound.AddPlayer,
                    clientbound.UpdateListed,
                    clientbound.UpdateHat,
                  ]),
                  entries: [
                    clientbound.PlayerInfoUpdateEntry(
                      uuid: profile.id,
                      name: profile.name,
                      latency: 0,
                      visible_on_player_list: True,
                      profile: profile,
                      game_mode: constant.mc_player_game_mode,
                      chat_session: option.None,
                      display_name: option.Some(profile.name),
                      hat_visible: True,
                    ),
                  ],
                ),
              ),
            ]),
          )
          Ok(State(..state, phase:))
        }
        _ -> Error(InvalidPacket(state.phase, packet))
      }
    }
    phase.Play -> {
      case packet {
        serverbound.ConfirmTeleport(_) -> {
          Ok(state)
        }
        serverbound.PlayerPosition(on_ground:, against_wall:, ..)
        | serverbound.PlayerPositionAndRotation(on_ground:, against_wall:, ..)
        | serverbound.PlayerRotation(on_ground:, against_wall:, ..) -> {
          let position = case packet {
            serverbound.PlayerPosition(position:, ..)
            | serverbound.PlayerPositionAndRotation(position:, ..) ->
              option.Some(position)
            _ -> option.None
          }
          let rotation = case packet {
            serverbound.PlayerRotation(rotation:, ..)
            | serverbound.PlayerPositionAndRotation(rotation:, ..) ->
              option.Some(rotation)
            _ -> option.None
          }
          use _ <- result.try(send_player_message(
            state.player_subject,
            player_message.Move(position:, rotation:, on_ground:, against_wall:),
          ))
          Ok(state)
        }
        _ -> Ok(state)
      }
    }
  }
}

fn send_player_message(
  subject: option.Option(player_message.PlayerSubject),
  message: player_message.PlayerMessage,
) {
  case subject {
    option.Some(player_subject) -> Ok(process.send(player_subject, message))
    option.None -> Error(PlayerNotFound)
  }
}

fn call_player(
  player_subject: option.Option(player_message.PlayerSubject),
  timeout: Int,
  make_request: fn(process.Subject(reply)) -> player_message.PlayerMessage,
) {
  case player_subject {
    option.Some(player_subject) ->
      Ok(process.call(player_subject, timeout, make_request))
    option.None -> Error(PlayerNotFound)
  }
}

fn send_disconnect(
  connection: glisten.Connection(message.Message),
  phase: phase.Phase,
  reason: String,
) {
  let packets = case phase {
    phase.Login -> [
      clientbound.LoginDisconnect(
        clientbound.LoginDisconnectPacket(text_component.TextComponent(reason)),
      ),
    ]
    phase.Configuration -> [
      clientbound.ConfigurationDisconnect(
        clientbound.DisconnectPacket(text_component.TextComponent(reason)),
      ),
    ]
    phase.Play -> [
      clientbound.PlayDisconnect(
        clientbound.DisconnectPacket(text_component.TextComponent(reason)),
      ),
    ]
    _ -> []
  }

  send_packets(connection, packets)
}

fn handle_message(
  state: State,
  message: message.Message,
  connection: Connection,
) -> Result(State, PacketError) {
  case message {
    message.KeepAlive -> handle_keep_alive(state, connection)
    message.ChunkLoaded(chunk) -> {
      logging.log(
        logging.Debug,
        "Loading Chunk: " <> chunk_position.to_string(chunk.position),
      )
      use _ <- result.try(send_packet(
        connection,
        clientbound.LevelChunkWithLight(
          clientbound.LevelChunkWithLightPacket(
            ..clientbound.default_level_chunk_with_light_packet(),
            chunk:,
          ),
        ),
      ))
      Ok(state)
    }
    message.ChunkUnloaded(position) -> {
      logging.log(
        logging.Debug,
        "Unloading Chunk: " <> chunk_position.to_string(position),
      )
      use _ <- result.try(send_packet(
        connection,
        clientbound.ForgetLevelChunk(clientbound.ForgetLevelChunkPacket(
          position:,
        )),
      ))
      Ok(state)
    }
    message.CenterChunkChanged(position) -> {
      logging.log(
        logging.Debug,
        "Updating Center Chunk: " <> chunk_position.to_string(position),
      )
      use _ <- result.try(send_packet(
        connection,
        clientbound.SetCenterChunk(clientbound.SetCenterChunkPacket(position)),
      ))
      Ok(state)
    }
    message.EntitySpawned(entity:) -> {
      use _ <- result.try(send_packet(
        connection,
        clientbound.SpawnEntity(clientbound.SpawnEntityPacket(
          id: entity.id,
          uuid: entity.uuid,
          entity_type: entity.kind,
          position: entity.position,
          rotation: entity.rotation,
          head_rotation: entity.head_rotation,
          velocity: entity.velocity,
        )),
      ))
      Ok(state)
    }
    message.EntityMoved(id:, position_delta:, rotation:, on_ground:) -> {
      case position_delta, rotation {
        option.Some(delta), option.Some(rotation) -> {
          let packet =
            clientbound.MoveEntityPositionRotationPacket(
              id,
              delta,
              rotation,
              on_ground,
            )
          send_packet(
            connection,
            clientbound.MoveEntityPositionRotation(packet),
          )
        }
        option.Some(delta), option.None -> {
          let packet =
            clientbound.MoveEntityPositionPacket(id, delta, on_ground)
          send_packet(connection, clientbound.MoveEntityPosition(packet))
        }
        option.None, option.Some(rotation) -> {
          let packet =
            clientbound.MoveEntityRotationPacket(id, rotation, on_ground)
          send_packet(connection, clientbound.MoveEntityRotation(packet))
        }
        option.None, option.None -> Ok(Nil)
      }
      |> result.replace(state)
    }
  }
}

fn handle_keep_alive(state: State, connection: Connection) {
  logging.log(logging.Debug, "Received Keep Alive")
  use _ <- result.try(send_keep_alive(state.phase, connection))
  let keep_alive_timer =
    process.send_after(state.subject, 15_000, message.KeepAlive)
  Ok(State(..state, keep_alive_timer:))
}

fn send_keep_alive(phase: phase.Phase, connection: Connection) {
  case phase {
    phase.Configuration -> {
      send_packet(
        connection,
        clientbound.ConfigurationKeepAlive(clientbound.KeepAlivePacket(0)),
      )
    }
    phase.Play -> {
      send_packet(
        connection,
        clientbound.PlayKeepAlive(clientbound.KeepAlivePacket(0)),
      )
    }
    _ -> Ok(Nil)
  }
}

fn send_packet(connection: Connection, packet: clientbound.Packet) {
  protocol.encode_clientbound(packet)
  |> glisten.send(connection, _)
  |> result.map_error(SocketError)
}

fn send_packets(connection: Connection, packets: List(clientbound.Packet)) {
  list.try_each(packets, send_packet(connection, _))
}
