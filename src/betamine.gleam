import betamine/client/connection as client_connection
import betamine/client/router as client_router
import betamine/constant
import betamine/entity_region/supervisor as entity_region_supervisor
import betamine/player/supervisor as player_supervisor
import betamine/world/world
import gleam/erlang/process
import gleam/int
import gleam/otp/static_supervisor
import glisten
import logging

pub fn main() {
  logging.configure()
  logging.set_level(logging.Info)

  let world_name = process.new_name("world")
  let world = world.supervised(world_name)

  let entity_region_manager_name = process.new_name("entity_region_manager")
  let entity_region_supervisor =
    entity_region_supervisor.supervised(entity_region_manager_name)

  let player_manager_name = process.new_name("player_manager")
  let player_supervisor =
    player_supervisor.supervised(player_manager_name, world_name)

  let client_router_name = process.new_name("client_router")
  let client_router = client_router.supervised(client_router_name)

  let http_server =
    glisten.new(
      fn(_) { client_connection.init(client_router_name) },
      client_connection.loop,
    )
    |> glisten.bind(constant.default_server_interface)
    |> glisten.with_close(client_connection.close)
    |> glisten.supervised(constant.default_server_port)

  let assert Ok(_) =
    static_supervisor.new(static_supervisor.OneForOne)
    |> static_supervisor.add(world)
    |> static_supervisor.add(entity_region_supervisor)
    |> static_supervisor.add(player_supervisor)
    |> static_supervisor.add(client_router)
    |> static_supervisor.add(http_server)
    |> static_supervisor.start()

  logging.log(
    logging.Info,
    "Betamine listening on "
      <> constant.default_server_interface
      <> ":"
      <> int.to_string(constant.default_server_port),
  )
  process.sleep_forever()
}
