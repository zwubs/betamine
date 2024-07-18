import betamine/decoder
import betamine/encoder
import betamine/protocol/brand
import betamine/protocol/change_difficulty
import betamine/protocol/client_information
import betamine/protocol/confirm_teleportation
import betamine/protocol/feature_flags
import betamine/protocol/game_event
import betamine/protocol/handshake
import betamine/protocol/known_packs
import betamine/protocol/login
import betamine/protocol/login_play
import betamine/protocol/ping
import betamine/protocol/registry
import betamine/protocol/set_center_chunk
import betamine/protocol/set_player_position
import betamine/protocol/status
import betamine/protocol/synchronize_player_position
import betamine/state
import gleam/bit_array
import gleam/bytes_builder.{type BytesBuilder}
import gleam/erlang/process
import gleam/int
import gleam/io
import gleam/option.{None}
import gleam/otp/actor
import gleam/string
import glisten.{
  type Connection, type Message as GlistenMessage, Packet as GlistenPacket,
}

pub fn main() {
  connect()
}

const version = 767

pub type ServerBoundPacket {
  ServerBoundPacket(id: Int, length: Int, data: BitArray)
}

pub type ClientBoundPacket {
  ClientBoundPacket(id: Int, length: Int, data: BytesBuilder)
}

pub fn deserialize_server_bound_packet(
  message: GlistenMessage(String),
) -> ServerBoundPacket {
  let assert GlistenPacket(bit_array) = message
  let assert Ok(#(length, bit_array)) = decoder.var_int(bit_array)
  let assert Ok(#(id, bit_array)) = decoder.var_int(bit_array)
  ServerBoundPacket(id, length, bit_array)
}

fn connect() {
  let assert Ok(_server) =
    glisten.handler(
      fn(_conn) { #(state.Handshaking, None) },
      fn(message, state, connection) {
        let packet = deserialize_server_bound_packet(message)
        io.debug("")
        io.debug(
          "Receiving Packet w/ State: "
          <> string.inspect(state)
          <> " & Id: 0x"
          <> int.to_base16(packet.id),
        )
        io.debug(bit_array.inspect(packet.data))
        case state, packet.id {
          state.Handshaking, 0 -> {
            let assert Ok(handshake) = handshake.deserialize(packet.data)
            io.debug(handshake)
            case handshake.next_state {
              1 -> actor.continue(state.Status)
              2 -> actor.continue(state.Login)
              _ -> actor.continue(state)
            }
          }
          state.Status, 0 -> {
            let status_response = status.serialize(version)
            let _ = send(connection, status_response, 0)
            actor.continue(state)
          }
          state.Status, 1 -> {
            let assert Ok(ping_request) = ping.deserialize(packet.data)
            let ping_response = ping.serialize(ping_request)
            let _ = send(connection, ping_response, 1)
            actor.continue(state)
          }
          // Login Request
          state.Login, 0 -> {
            let assert Ok(login_request) = login.deserialize(packet.data)
            io.debug(login_request)
            let _ = send(connection, login.serialize(login_request), 2)
            actor.continue(state)
          }
          // Login Confirmation
          state.Login, 3 -> {
            actor.continue(state.Configuration)
          }
          // Client Information
          state.Configuration, 0 -> {
            let assert Ok(client_information_request) =
              client_information.deserialize(packet.data)
            io.debug(client_information_request)
            let _ = send(connection, feature_flags.serialize(), 0x0C)
            let _ = send(connection, known_packs.serialize(), 0x0E)
            actor.continue(state)
          }
          // Plugin Channels
          state.Configuration, 2 -> {
            let assert Ok(brand_request) = brand.deserialize(packet.data)
            io.debug(brand_request)
            let _ = send(connection, brand.serialize(), 0x01)
            actor.continue(state)
          }
          state.Configuration, 7 -> {
            let assert Ok(known_packs) = known_packs.deserialize(packet.data)
            io.debug(known_packs)
            // Finish Configuration
            registry.send(connection)
            // let _ = send(connection, registry.serialize(), 7)
            let _ = send(connection, bytes_builder.new(), 3)
            actor.continue(state)
          }
          // Acknowledge Finish Configuration
          state.Configuration, 3 -> {
            let _ = send(connection, login_play.serialize(), 0x2B)
            let _ = send(connection, change_difficulty.serialize(), 0x0B)
            let _ = send(connection, game_event.serialize(), 0x22)
            let _ = send(connection, set_center_chunk.serialize(), 0x54)
            let _ =
              send(connection, synchronize_player_position.serialize(), 0x40)
            actor.continue(state.Play)
          }
          state.Play, 0 -> {
            let assert Ok(confirm_teleport) =
              confirm_teleportation.deserialize(packet.data)
            io.debug(confirm_teleport)
            actor.continue(state)
          }
          state.Play, 0x1A -> {
            let assert Ok(player_position) =
              set_player_position.deserialize(packet.data)
            io.debug(player_position)
            actor.continue(state)
          }
          state, packet_id -> {
            let statement =
              "Unhandled state: \""
              <> string.inspect(state)
              <> "\" or packet id: \""
              <> string.inspect(packet_id)
              <> "\"."
            io.debug(statement)
            actor.continue(state)
          }
        }
      },
    )
    |> glisten.serve(25_565)
  io.println("Listening on port: 25565")

  process.sleep_forever()
}

// fn send_packet(connection: Connection(String), packet: ClientBoundPacket) {
//   todo
// }

fn send(connection: Connection(String), builder: BytesBuilder, packet_id: Int) {
  let response_builder =
    bytes_builder.new()
    |> encoder.var_int(packet_id)

  let response_builder =
    bytes_builder.prepend_builder(builder, response_builder)

  let builder_size = bytes_builder.byte_size(response_builder)
  io.debug("SENDING PACKET")
  io.debug("Packet Id: " <> int.to_string(packet_id))
  io.debug("Packet Size: " <> int.to_string(builder_size))
  let response_builder =
    bytes_builder.prepend(response_builder, encoder.signed_encode(builder_size))
  io.debug(bit_array.inspect(bytes_builder.to_bit_array(response_builder)))
  glisten.send(connection, response_builder)
}
