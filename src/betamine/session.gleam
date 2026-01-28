import betamine/common/uuid
import betamine/constant
import betamine/player
import betamine/protocol
import betamine/protocol/error
import betamine/protocol/packets/clientbound
import betamine/protocol/packets/serverbound
import betamine/protocol/phase
import gleam/erlang/process
import gleam/list
import gleam/option
import gleam/otp/actor
import gleam/otp/factory_supervisor
import gleam/result
import gleam/string
import glisten
import glisten/socket

pub type Clientbound

pub type State {
  State(
    phase: phase.Phase,
    last_keep_alive: Int,
    ip_address: String,
    players: factory_supervisor.Supervisor(
      uuid.Uuid,
      process.Subject(player.Message),
    ),
  )
}

pub fn init(
  connection: glisten.Connection(Clientbound),
  players_name: process.Name(
    factory_supervisor.Message(uuid.Uuid, process.Subject(player.Message)),
  ),
) -> #(State, option.Option(process.Selector(Clientbound))) {
  let assert Ok(connection_info) = glisten.get_client_info(connection)
  let ip_address = glisten.ip_address_to_string(connection_info.ip_address)

  let players = factory_supervisor.get_by_name(players_name)

  let self = process.new_subject()

  let state =
    State(
      phase: phase.Handshaking,
      last_keep_alive: now_seconds(),
      ip_address:,
      players:,
    )

  let selector =
    process.new_selector()
    |> process.select(self)

  #(state, option.Some(selector))
}

@external(erlang, "betamine_ffi", "now_seconds")
pub fn now_seconds() -> Int

pub fn loop(
  state: State,
  message: glisten.Message(Clientbound),
  connection: glisten.Connection(Clientbound),
) -> glisten.Next(State, glisten.Message(Clientbound)) {
  case message {
    glisten.Packet(bit_array) -> {
      case handle_packet(state, bit_array, connection) {
        Ok(state) -> glisten.continue(state)
        Error(error) -> glisten.stop_abnormal(string.inspect(error))
      }
    }
    glisten.User(clientbound) ->
      handle_clientbound(state, clientbound, connection)
  }
}

type ServerboundError {
  InvalidPacket(phase: phase.Phase, packet: serverbound.Packet)
  InvalidProtocolPhase(state: Int)
  ProtocolError(error: error.ProtocolError)
  SocketError(reason: socket.SocketReason)
}

fn handle_packet(
  state: State,
  bit_array: BitArray,
  connection: glisten.Connection(Clientbound),
) -> Result(State, ServerboundError) {
  let server_bound = protocol.decode_serverbound(state.phase, bit_array)
  use packet <- result.try(server_bound |> result.map_error(ProtocolError))
  case state.phase {
    phase.Handshaking -> {
      case packet {
        serverbound.Handshake(packet) -> {
          case packet.next_phase {
            1 -> Ok(State(..state, phase: phase.Status))
            2 -> Ok(State(..state, phase: phase.Login))
            phase -> Error(InvalidProtocolPhase(phase))
          }
        }
        _ -> Error(InvalidPacket(state.phase, packet))
      }
    }
    phase.Status -> {
      case packet {
        serverbound.StatusRequest -> {
          use _ <- result.try(send_packet(
            connection,
            clientbound.StatusResponse(clientbound.StatusResponsePacket(
              version_name: constant.mc_version_name,
              version_protocol: constant.mc_version_protocol,
              max_player_count: constant.mc_max_player_count,
              online_player_count: 0,
              players: [#("zwubs", "0c3456dc-85a0-4baf-89b4-db008ec1c749")],
              description: "Hello Betamine!",
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
    phase.Login -> todo
    phase.Configuration -> todo
    phase.Play -> todo
  }
}

pub fn handle_clientbound(
  state: State,
  clientbound: Clientbound,
  connection: glisten.Connection(Clientbound),
) {
  todo
}

fn send_packet(
  connection: glisten.Connection(Clientbound),
  packet: clientbound.Packet,
) {
  protocol.encode_clientbound(packet)
  |> glisten.send(connection, _)
  |> result.map_error(SocketError)
}

fn send_packets(
  connection: glisten.Connection(Clientbound),
  packets: List(clientbound.Packet),
) {
  list.try_each(packets, send_packet(connection, _))
}
