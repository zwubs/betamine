import betamine/constants
import betamine/game/command
import betamine/session
import gleam/erlang/process.{type Subject}
import gleam/io
import gleam/option.{type Option, None}
import gleam/otp/actor
import glisten.{Packet}

pub fn start(game_subject: Subject(command.Command)) {
  start_with_port(game_subject, constants.default_host_port)
}

pub fn start_with_port(game_subject: Subject(command.Command), port: Int) {
  glisten.handler(init(_, game_subject), handler)
  |> glisten.with_close(fn(subject) {
    io.debug("Closing Connection.")
    process.send(subject, session.Disconnect)
  })
  |> glisten.serve(port)
}

fn init(
  conn,
  sim_subject: Subject(command.Command),
) -> #(Subject(session.Packet), Option(process.Selector(b))) {
  let subject = process.new_subject()
  let assert Ok(_subject) = session.start(subject, sim_subject, conn)
  let assert Ok(session_subject) = process.receive(subject, 1000)
  #(session_subject, None)
}

fn handler(message, session_subject: Subject(session.Packet), _conn) {
  let assert Packet(bit_array) = message
  let packet = session.deserialize_server_bound_packet(bit_array)
  process.send(session_subject, packet)
  actor.continue(session_subject)
}
