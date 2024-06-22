import gleam/bit_array
import gleam/bytes_builder.{type BytesBuilder}
import gleam/erlang/process
import gleam/io
import gleam/option.{None}
import gleam/otp/actor
import gleam/string
import glime/decoder
import glime/encoder
import glime/protocol/brand
import glime/protocol/client_information
import glime/protocol/handshake
import glime/protocol/login
import glime/protocol/ping
import glime/protocol/status
import glime/state
import glisten.{type Connection, Packet}

pub fn main() {
  connect()
}

const version = 767

fn connect() {
  let assert Ok(_server) =
    glisten.handler(
      fn(_conn) { #(state.Handshaking, None) },
      fn(message, state, connection) {
        io.debug("State: " <> string.inspect(state))
        let assert Packet(message) = message
        let assert Ok(#(_message_size, bit_array)) = decoder.var_int(message)
        let assert Ok(#(packet_id, bit_array)) = decoder.var_int(bit_array)
        io.debug("Packet Id: " <> string.inspect(packet_id))
        io.debug(bit_array.inspect(message))
        case state, packet_id {
          state.Handshaking, 0 -> {
            let assert Ok(handshake) = handshake.deserialize(bit_array)
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
            let assert Ok(ping_request) = ping.deserialize(bit_array)
            let ping_response = ping.serialize(ping_request)
            let _ = send(connection, ping_response, 1)
            actor.continue(state)
          }
          // Login Request
          state.Login, 0 -> {
            let assert Ok(login_request) = login.deserialize(bit_array)
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
              client_information.deserialize(bit_array)
            io.debug(client_information_request)
            actor.continue(state)
          }
          // Plugin Channels
          state.Configuration, 2 -> {
            let assert Ok(brand_request) = brand.deserialize(bit_array)
            io.debug(brand_request)
            actor.continue(state)
          }
          state, packet_id -> {
            let statement =
              "Unhandled state: \""
              <> string.inspect(state)
              <> "\" or packet id: \""
              <> string.inspect(packet_id)
              <> "\"."
            panic as statement
          }
        }
      },
    )
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
  let response_builder =
    bytes_builder.prepend(response_builder, encoder.signed_encode(builder_size))
  io.debug(bit_array.inspect(bytes_builder.to_bit_array(response_builder)))
  glisten.send(connection, response_builder)
}
