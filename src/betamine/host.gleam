import betamine/constants
import betamine/game/command
import betamine/session
import gleam/erlang/process.{type Subject}
import gleam/option.{type Option, None}
import glisten.{Packet}

pub fn start(game_subject: Subject(command.Command)) {
  start_with_port(game_subject, constants.default_host_port)
}

pub fn start_with_port(game_subject: Subject(command.Command), port: Int) {
  glisten.new(init(_, game_subject), loop)
  |> glisten.with_close(fn(subject) {
    process.send(subject, session.Disconnect)
  })
  |> glisten.start(port)
}

fn init(
  conn,
  game_subject: Subject(command.Command),
) -> #(Subject(session.Packet), Option(process.Selector(b))) {
  let assert Ok(started) = session.start(game_subject, conn)
  #(started.data, None)
}

fn loop(session_subject: Subject(session.Packet), message, _) {
  let assert Packet(data) = message
  process.send(session_subject, session.ServerBoundPacket(data))
  glisten.continue(session_subject)
}
