import betamine/mojang/profile_cache
import betamine/player/factory
import betamine/player/manager
import betamine/player/message
import betamine/world/message as world_message
import gleam/erlang/process
import gleam/otp/static_supervisor
import gleam/otp/supervision

pub fn supervised(
  manager_name: message.ManagerName,
  world_name: world_message.Name,
  profile_cache_name: profile_cache.Name,
) {
  supervision.supervisor(fn() {
    start(manager_name, world_name, profile_cache_name)
  })
}

pub fn start(
  manager_name: message.ManagerName,
  world_name: world_message.Name,
  profile_cache_name: profile_cache.Name,
) {
  let factory_name = process.new_name("player_factory")
  let factory = factory.supervised(factory_name)
  let manager =
    manager.supervised(
      manager_name,
      factory_name,
      world_name,
      profile_cache_name,
    )

  static_supervisor.new(static_supervisor.OneForOne)
  |> static_supervisor.add(factory)
  |> static_supervisor.add(manager)
  |> static_supervisor.start()
}
