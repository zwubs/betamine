import betamine/decoder
import betamine/encoder
import betamine/protocol/brand
import betamine/protocol/change_difficulty
import betamine/protocol/chunk_data
import betamine/protocol/client_information
import betamine/protocol/confirm_teleportation
import betamine/protocol/feature_flags
import betamine/protocol/game_event
import betamine/protocol/handshake
import betamine/protocol/keep_alive
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
import gleam/erlang/process.{type Selector, type Subject}
import gleam/int
import gleam/io
import gleam/option.{None}
import gleam/otp/actor
import gleam/result
import gleam/string
import glisten.{
  type Connection, type Message as GlistenMessage, Packet as GlistenPacket,
}
import glisten/socket/options.{ActiveMode, Passive}
import glisten/tcp

pub fn main() {
  // use listener <- result.then(tcp.listen(25_565, [ActiveMode(Passive)]))
  // use socket <- result.then(tcp.accept(listener))
  // use msg <- result.then(tcp.receive(socket, 0))
  // io.debug(#("got a msg", msg))
  // let _ = tcp.shutdown(socket)

  // Ok(Nil)
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

@external(erlang, "now_ffi", "now_seconds")
pub fn now_seconds() -> Int

type Client {
  Client(state: state.State, last_keep_alive: Int)
}

fn connect() {
  let assert Ok(_server) =
    glisten.handler(
      fn(_connection) { #(Client(state.Handshaking, now_seconds()), None) },
      fn(message, client, connection) {
        let packet = deserialize_server_bound_packet(message)
        io.println("")
        io.debug(
          "Receiving Packet w/ State: "
          <> string.inspect(client.state)
          <> " & Id: 0x"
          <> int.to_base16(packet.id),
        )
        // Logic for handling keep alives
        // I know I can figure out a way to utilize OTP for this
        // but I just need something to work for now
        let now = now_seconds()
        let offset = now - client.last_keep_alive
        let client = case client.state {
          state.Play if offset >= 15 -> {
            let _ = send(connection, keep_alive.serialize(), 0x26)
            Client(client.state, now_seconds())
          }
          _ -> {
            client
          }
        }
        io.debug(bit_array.inspect(packet.data))

        case client.state, packet.id {
          state.Handshaking, 0 -> {
            let assert Ok(handshake) = handshake.deserialize(packet.data)
            io.debug(handshake)
            case handshake.next_state {
              1 -> actor.continue(Client(state.Status, client.last_keep_alive))
              2 -> actor.continue(Client(state.Login, client.last_keep_alive))
              _ -> actor.continue(client)
            }
          }
          state.Status, 0 -> {
            let status_response = status.serialize(version)
            let _ = send(connection, status_response, 0)
            actor.continue(client)
          }
          state.Status, 1 -> {
            let assert Ok(ping_request) = ping.deserialize(packet.data)
            let ping_response = ping.serialize(ping_request)
            let _ = send(connection, ping_response, 1)
            actor.continue(client)
          }
          // Login Request
          state.Login, 0 -> {
            let assert Ok(login_request) = login.deserialize(packet.data)
            io.debug(login_request)
            let _ = send(connection, login.serialize(login_request), 2)
            actor.continue(client)
          }
          // Login Confirmation
          state.Login, 3 -> {
            actor.continue(Client(state.Configuration, client.last_keep_alive))
          }
          // Client Information
          state.Configuration, 0 -> {
            let assert Ok(client_information_request) =
              client_information.deserialize(packet.data)
            io.debug(client_information_request)
            let _ = send(connection, feature_flags.serialize(), 0x0C)
            let _ = send(connection, known_packs.serialize(), 0x0E)
            actor.continue(client)
          }
          // Plugin Channels
          state.Configuration, 2 -> {
            let assert Ok(brand_request) = brand.deserialize(packet.data)
            io.debug(brand_request)
            let _ = send(connection, brand.serialize(), 0x01)
            actor.continue(client)
          }
          state.Configuration, 7 -> {
            let assert Ok(known_packs) = known_packs.deserialize(packet.data)
            io.debug(known_packs)
            // Finish Configuration
            registry.send(connection)
            let _ = send(connection, registry.serialize(), 7)
            let _ = send(connection, bytes_builder.new(), 3)
            actor.continue(client)
          }
          // Acknowledge Finish Configuration
          state.Configuration, 3 -> {
            let _ = send(connection, login_play.serialize(), 0x2B)
            let _ = send(connection, change_difficulty.serialize(), 0x0B)
            let _ = send(connection, game_event.serialize(), 0x22)
            let _ = send(connection, set_center_chunk.serialize(), 0x54)
            let _ = send(connection, chunk_data.serialize(), 0x27)
            let _ =
              send(connection, synchronize_player_position.serialize(), 0x40)
            actor.continue(Client(state.Play, client.last_keep_alive))
          }
          state.Play, 0 -> {
            let assert Ok(confirm_teleport) =
              confirm_teleportation.deserialize(packet.data)
            io.debug(confirm_teleport)
            actor.continue(client)
          }
          state.Play, 0x1A -> {
            let assert Ok(player_position) =
              set_player_position.deserialize(packet.data)
            io.debug(player_position)
            actor.continue(client)
          }
          state.Play, 0x18 -> {
            let assert Ok(keep_alive_id) = keep_alive.deserialize(packet.data)
            io.debug("Keep Alive Id: " <> string.inspect(keep_alive_id))
            actor.continue(client)
          }
          state, packet_id -> {
            io.debug(
              "Unhandled Packet w/ State: "
              <> string.inspect(client.state)
              <> " & Id: 0x"
              <> int.to_base16(packet_id),
            )
            actor.continue(client)
          }
        }
      },
    )
    |> glisten.with_pool_size(0)
    |> glisten.serve(25_565)
  io.println("Listening on port: 25565")

  process.sleep_forever()
}

fn send(connection: Connection(String), builder: BytesBuilder, packet_id: Int) {
  let response_builder =
    bytes_builder.new()
    |> encoder.var_int(packet_id)

  let response_builder =
    bytes_builder.prepend_builder(builder, response_builder)

  let builder_size = bytes_builder.byte_size(response_builder)
  io.debug(
    "Sending Packet w/ State: "
    <> string.inspect(connection.subject)
    <> " & Id: 0x"
    <> int.to_base16(packet_id),
  )

  let response_builder =
    bytes_builder.prepend(response_builder, encoder.signed_encode(builder_size))
  io.debug(bit_array.inspect(bytes_builder.to_bit_array(response_builder)))
  glisten.send(connection, response_builder)
}
