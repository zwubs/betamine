import betamine/constant
import betamine/message
import betamine/player_session
import gleam/erlang/process.{type Subject}
import gleam/option.{type Option, None}
import glisten.{Packet}

pub fn start(
  game_subject: Subject(message.GameMessage),
  world_subject: Subject(message.WorldMessage),
) {
  start_with_port(game_subject, world_subject, constant.default_host_port)
}

pub fn start_with_port(
  game_subject: Subject(message.GameMessage),
  world_subject: Subject(message.WorldMessage),
  port: Int,
) {
  glisten.new(init(_, game_subject, world_subject), loop)
  |> glisten.bind("0.0.0.0")
  |> glisten.with_close(fn(subject) {
    process.send(subject, player_session.Disconnect)
  })
  |> glisten.start(port)
}

fn init(
  conn,
  game_subject: Subject(message.GameMessage),
  world_subject: Subject(message.WorldMessage),
) -> #(Subject(player_session.Packet), Option(process.Selector(b))) {
  let assert Ok(started) =
    player_session.start(game_subject, world_subject, conn)
  #(started.data, None)
}

fn loop(player_session_subject: Subject(player_session.Packet), message, _) {
  let assert Packet(data) = message
  process.send(player_session_subject, player_session.ServerBoundPacket(data))
  glisten.continue(player_session_subject)
}
