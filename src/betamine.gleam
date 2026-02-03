import betamine/constant
import betamine/game
import betamine/player/player_supervisor
import betamine/session
import betamine/world
import gleam/erlang/process
import gleam/int
import gleam/io
import gleam/otp/static_supervisor
import glisten
import logging

pub fn main() {
  logging.configure()

  let world_name = process.new_name("world")
  let world = world.supervised(world_name)

  let game_name = process.new_name("game")
  let game = game.supervised(game_name)

  let player_factory_name = process.new_name("player_factory")
  let player_manager_name = process.new_name("player_manager")
  let player_supervisor =
    player_supervisor.supervised(player_factory_name, player_manager_name)

  let http_server =
    glisten.new(session.init(_, player_manager_name), session.loop)
    |> glisten.bind(constant.default_server_interface)
    |> glisten.with_close(session.close)
    |> glisten.supervised(constant.default_server_port)

  let assert Ok(_) =
    static_supervisor.new(static_supervisor.OneForOne)
    |> static_supervisor.add(world)
    |> static_supervisor.add(game)
    |> static_supervisor.add(player_supervisor)
    |> static_supervisor.add(http_server)
    |> static_supervisor.start()

  io.println(
    "Betamine listening on "
    <> constant.default_server_interface
    <> ":"
    <> int.to_string(constant.default_server_port),
  )
  process.sleep_forever()
}
