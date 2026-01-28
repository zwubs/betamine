import betamine/constant
import betamine/game
import betamine/host
import betamine/player
import betamine/session
import betamine/world
import gleam/erlang/process
import gleam/int
import gleam/io
import gleam/otp/factory_supervisor as factory
import gleam/otp/static_supervisor as supervisor
import gleam/otp/supervision
import glisten

pub fn main() {
  let world_name = process.new_name("world")
  let world = world.supervised(world_name)

  let game_name = process.new_name("game")
  let game = game.supervised(game_name)

  let players_name = process.new_name("players")
  let players =
    factory.worker_child(player.start)
    |> factory.named(players_name)
    |> factory.supervised()

  let http_server =
    glisten.new(session.init(_, players_name), session.loop)
    |> glisten.bind(constant.default_server_interface)
    |> glisten.supervised(constant.default_server_port)

  let assert Ok(_sup_tree) =
    supervisor.new(supervisor.OneForOne)
    |> supervisor.add(world)
    |> supervisor.add(game)
    |> supervisor.add(players)
    |> supervisor.add(http_server)
    |> supervisor.start()

  io.println(
    "Betamine listening on "
    <> constant.default_server_interface
    <> ":"
    <> int.to_string(constant.default_server_port),
  )
  process.sleep_forever()
}
