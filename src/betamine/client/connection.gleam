//// A client connections acts as a resource owner within Betamine.
//// It's main responsibility is holding the connection to the client,
//// along with any other necessary state needed to maintain the connection.

import betamine/client/protocol/buffer
import betamine/client/protocol/encoder
import betamine/client/protocol/error
import betamine/client/protocol/packet
import betamine/client/protocol/packet/configuration
import betamine/client/protocol/packet/play
import betamine/client/protocol/phase
import betamine/client/router
import gleam/bytes_tree
import gleam/erlang/process
import gleam/list
import gleam/option
import gleam/result
import glisten

@internal
pub type Message {
  KeepAlive
  SendPacket(BitArray)
}

@internal
pub type State {
  State(
    subject: process.Subject(Message),
    router_subject: router.Subject,
    buffer: buffer.Buffer,
    phase: phase.Phase,
    last_keep_alive_id: Int,
    keep_alive_timer: process.Timer,
  )
}

pub const keep_alive_delay = 15_000

/// Called whenever a new client connection is initialized.
/// This is responsible for setting up the inital state of the connection.
pub fn init(
  router_name: router.Name,
) -> #(State, option.Option(process.Selector(_))) {
  let subject = process.new_subject()
  let state =
    State(
      subject:,
      router_subject: process.named_subject(router_name),
      buffer: buffer.new(),
      phase: phase.Handshake,
      last_keep_alive_id: 0,
      keep_alive_timer: process.send_after(subject, keep_alive_delay, KeepAlive),
    )

  let selector = process.new_selector() |> process.select(subject)
  #(state, option.Some(selector))
}

// Called whenever a client connection is closed.
// whether the closure was initiated by us or the client.
pub fn close(state: State) -> Nil {
  process.cancel_timer(state.keep_alive_timer)
  Nil
}

pub fn loop(
  state: State,
  message: glisten.Message(Message),
  connection: glisten.Connection(Message),
) -> glisten.Next(State, glisten.Message(Message)) {
  let result = case message {
    glisten.Packet(packet) -> handle_tcp_packet(state, packet)
    glisten.User(message) -> handle_message(state, message, connection)
  }

  case result {
    Ok(state) -> glisten.continue(state)
    Error(error) -> {
      let reason = error.to_string(error)
      echo "Disconnecting: " <> reason
      let _ = send_disconnect(connection, state.phase, reason)
      // Ensure enough time for the disconnect to send
      process.sleep(100)
      glisten.stop_abnormal(reason)
    }
  }
}

fn handle_tcp_packet(
  state: State,
  packet: BitArray,
) -> Result(State, error.Error) {
  let state = State(..state, buffer: buffer.append(state.buffer, packet))
  handle_buffer(state)
}

fn handle_buffer(state: State) {
  case buffer.split_frames(state.buffer) {
    Ok(#(frames, buffer)) ->
      list.try_fold(frames, State(..state, buffer:), handle_frame)
    Error(_) -> Error(error.InvalidFrame)
  }
}

pub fn handle_frame(state: State, frame: BitArray) {
  use packet <- result.try(packet.decode(state.phase, frame))
  process.call(state.router_subject, 1000, fn(subject) { #(subject, packet) })
  |> result.map(fn(phase) { State(..state, phase:) })
}

fn handle_message(
  state: State,
  message: Message,
  connection: glisten.Connection(_),
) -> Result(State, error.Error) {
  case message {
    KeepAlive ->
      handle_keep_alive(state, connection)
      |> result.map_error(error.SocketError)
    SendPacket(_) -> Error(error.UnhandledError)
  }
}

fn send_disconnect(
  connection: glisten.Connection(_),
  phase: phase.Phase,
  _: String,
) {
  let packets = case phase {
    phase.Login -> []
    phase.Configuration -> []
    phase.Play -> []
    _ -> []
  }

  send_packets(connection, packets)
}

fn handle_keep_alive(state: State, connection: glisten.Connection(_)) {
  use _ <- result.try(send_keep_alive(state.phase, connection))
  let keep_alive_timer = process.send_after(state.subject, 15_000, KeepAlive)
  Ok(State(..state, keep_alive_timer:))
}

fn send_keep_alive(phase: phase.Phase, connection: glisten.Connection(_)) {
  case phase {
    phase.Configuration -> {
      packet.ConfigurationClientbound(configuration.ClientboundKeepAlive(0))
      |> send_packet(connection, _)
    }
    phase.Play -> {
      packet.PlayClientbound(play.ClientboundKeepAlive(0))
      |> send_packet(connection, _)
    }
    _ -> Ok(Nil)
  }
}

fn send_packet(connection: glisten.Connection(_), packet: packet.Clientbound) {
  let encoded_packet = packet.encode(packet)
  let encoded_size = encoder.var_int(bytes_tree.byte_size(encoded_packet))
  bytes_tree.prepend(encoded_packet, encoded_size)
  |> glisten.send(connection, _)
}

fn send_packets(
  connection: glisten.Connection(_),
  packets: List(packet.Clientbound),
) {
  list.try_each(packets, send_packet(connection, _))
}
