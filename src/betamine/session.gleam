import betamine/constants
import betamine/decoder as decode
import betamine/encoder as encode
import betamine/game
import betamine/protocol
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
import betamine/protocol/player_info_update
import betamine/protocol/registry
import betamine/protocol/set_center_chunk
import betamine/protocol/set_player_position
import betamine/protocol/spawn_entity
import betamine/protocol/status
import betamine/protocol/synchronize_player_position
import gleam/bytes_builder
import gleam/erlang/process.{type Subject}
import gleam/function
import gleam/int
import gleam/io
import gleam/otp/actor
import gleam/string
import glisten

pub type Packet {
  ServerBoundPacket(id: Int, length: Int, data: BitArray)
  ClientBoundPacket(id: Int, length: Int, data: BitArray)
}

pub fn deserialize_server_bound_packet(bit_array: BitArray) -> Packet {
  let assert Ok(#(length, bit_array)) = decode.var_int(bit_array)
  let assert Ok(#(id, bit_array)) = decode.var_int(bit_array)
  ServerBoundPacket(id, length, bit_array)
}

type State {
  State(
    host_subject: Subject(Packet),
    game_subject: Subject(game.Command),
    connection: glisten.Connection(BitArray),
    protocol_state: protocol.State,
    last_keep_alive: Int,
  )
}

type Error {
  UnknownServerBoundPacket(state: protocol.State, id: Int)
  UnknownProtocolState(state: Int)
}

pub fn start(
  host_subject: Subject(Subject(Packet)),
  game_subject: Subject(game.Command),
  connection: glisten.Connection(BitArray),
) -> Result(Subject(Packet), actor.StartError) {
  actor.start_spec(actor.Spec(
    init: fn() {
      let subject = process.new_subject()
      process.send(host_subject, subject)

      let selector =
        process.new_selector()
        |> process.selecting(subject, function.identity)

      actor.Ready(
        State(
          subject,
          game_subject,
          connection,
          protocol.Handshaking,
          now_seconds(),
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
    ServerBoundPacket(id, _, data) -> handle_server_bound(id, data, state)
    ClientBoundPacket(id, _, data) -> todo
  }
  case result {
    Ok(state) -> actor.continue(state)
    Error(error) -> handle_error(error, state)
  }
}

fn handle_error(error: Error, state: State) {
  case error {
    UnknownServerBoundPacket(protocol_state, id) -> {
      io.debug(
        "Unhandled Packet w/ State: "
        <> string.inspect(protocol_state)
        <> " & Id: 0x"
        <> int.to_base16(id),
      )
      actor.continue(state)
    }
    UnknownProtocolState(protocol_state) -> {
      io.debug(
        "Client Requested An Unknown Protocol State: "
        <> string.inspect(protocol_state),
      )
      actor.continue(state)
    }
  }
}

@external(erlang, "now_ffi", "now_seconds")
pub fn now_seconds() -> Int

fn handle_server_bound(id: Int, data: BitArray, state: State) {
  // Logic for handling keep alives
  // I know I can figure out a way to utilize OTP for this
  // but I just need something to work for now
  let offset = now_seconds() - state.last_keep_alive
  let state = case state.protocol_state {
    protocol.Play if offset >= 15 -> {
      let _ = send(state, keep_alive.serialize(), 0x26)
      State(..state, last_keep_alive: now_seconds())
    }
    _ -> state
  }

  case state.protocol_state {
    protocol.Handshaking -> handle_server_bound_handshaking(id, data, state)
    protocol.Status -> handle_server_bound_status(id, data, state)
    protocol.Login -> handle_server_bound_login(id, data, state)
    protocol.Configuration -> handle_server_bound_configuration(id, data, state)
    protocol.Play -> handle_server_bound_play(id, data, state)
  }
}

fn handle_server_bound_handshaking(id: Int, data: BitArray, state: State) {
  case id {
    0x00 -> {
      let assert Ok(handshake) = handshake.deserialize(data)
      case handshake.next_state {
        1 -> Ok(State(..state, protocol_state: protocol.Status))
        2 -> Ok(State(..state, protocol_state: protocol.Login))
        _ -> Error(UnknownProtocolState(handshake.next_state))
      }
    }
    _ -> Error(UnknownServerBoundPacket(state.protocol_state, id))
  }
}

fn handle_server_bound_status(id: Int, data: BitArray, state: State) {
  case id {
    0x00 -> {
      let status_response = status.serialize()
      let _ = send(state, status_response, 0)
      Ok(state)
    }
    0x01 -> {
      let assert Ok(ping_request) = ping.deserialize(data)
      let ping_response = ping.serialize(ping_request)
      let _ = send(state, ping_response, 1)
      Ok(state)
    }
    _ -> Error(UnknownServerBoundPacket(state.protocol_state, id))
  }
}

fn handle_server_bound_login(id: Int, data: BitArray, state: State) {
  case id {
    0x00 -> {
      let assert Ok(login_request) = login.deserialize(data)
      io.debug(login_request)
      let _ = send(state, login.serialize(login_request), 2)
      Ok(state)
    }
    0x03 -> {
      Ok(State(..state, protocol_state: protocol.Configuration))
    }
    _ -> Error(UnknownServerBoundPacket(state.protocol_state, id))
  }
}

fn handle_server_bound_configuration(id: Int, data: BitArray, state: State) {
  case id {
    0x00 -> {
      let assert Ok(client_information_request) =
        client_information.deserialize(data)
      io.debug(client_information_request)
      let _ = send(state, feature_flags.serialize(), 0x0C)
      let _ = send(state, known_packs.serialize(), 0x0E)
      Ok(state)
    }
    // Plugin Channels
    0x02 -> {
      let assert Ok(brand_request) = brand.deserialize(data)
      io.debug(brand_request)
      let _ = send(state, brand.serialize(), 0x01)
      Ok(state)
    }
    0x07 -> {
      let assert Ok(known_packs) = known_packs.deserialize(data)
      io.debug(known_packs)
      // Finish Configuration
      registry.send(state.connection)
      let _ = send(state, registry.serialize(), 7)
      let _ = send(state, bytes_builder.new(), 3)
      Ok(state)
    }
    // Acknowledge Finish Configuration
    0x03 -> {
      let _ = send(state, login_play.serialize(), 0x2B)
      let _ = send(state, change_difficulty.serialize(), 0x0B)
      let _ = send(state, game_event.serialize(), 0x22)
      let _ = send(state, set_center_chunk.serialize(), 0x54)
      let _ = send(state, chunk_data.serialize(), 0x27)
      let _ = send(state, synchronize_player_position.serialize(), 0x40)
      let _ = send(state, player_info_update.serialize(), 0x3E)
      let _ = send(state, spawn_entity.serialize(), 0x01)
      Ok(State(..state, protocol_state: protocol.Play))
    }
    _ -> Error(UnknownServerBoundPacket(state.protocol_state, id))
  }
}

fn handle_server_bound_play(id: Int, data: BitArray, state: State) {
  case id {
    0x00 -> {
      let assert Ok(confirm_teleport) = confirm_teleportation.deserialize(data)
      io.debug(confirm_teleport)
      Ok(state)
    }
    0x1A -> {
      let assert Ok(player_position) = set_player_position.deserialize(data)
      io.debug(player_position)
      Ok(state)
    }
    0x18 -> {
      let assert Ok(keep_alive_id) = keep_alive.deserialize(data)
      io.debug("Keep Alive Id: " <> string.inspect(keep_alive_id))
      Ok(state)
    }
    _ -> Error(UnknownServerBoundPacket(state.protocol_state, id))
  }
}

fn send(state: State, builder: bytes_builder.BytesBuilder, packet_id: Int) {
  let response_builder =
    bytes_builder.new()
    |> encode.var_int(packet_id)

  let response_builder =
    bytes_builder.prepend_builder(builder, response_builder)

  io.println(
    "Sending Packet w/ State: "
    <> string.inspect(state.protocol_state)
    <> " & Id: 0x"
    <> int.to_base16(packet_id),
  )

  let builder_size = bytes_builder.byte_size(response_builder)
  let size_as_bytes_builder = encode.var_int(bytes_builder.new(), builder_size)

  let response_builder =
    bytes_builder.prepend_builder(response_builder, size_as_bytes_builder)

  glisten.send(state.connection, response_builder)
}
