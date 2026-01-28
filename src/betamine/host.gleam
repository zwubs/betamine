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
  glisten.new(init(_, game_subject, world_subject), loop)
  |> glisten.bind(constant.default_server_interface)
  |> glisten.with_close(fn(subject) {
    process.send(subject, player_session.Disconnect)
  })
  |> glisten.start(constant.default_server_port)
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
