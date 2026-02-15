import betamine/player/factory
import betamine/player/manager
import betamine/world/world
import gleam/otp/static_supervisor
import gleam/otp/supervision

pub fn supervised(
  factory_name: factory.Name,
  manager_name: manager.Name,
  world_name: world.Name,
) {
  supervision.supervisor(fn() { start(factory_name, manager_name, world_name) })
}

pub fn start(
  factory_name: factory.Name,
  manager_name: manager.Name,
  world_name: world.Name,
) {
  let factory = factory.supervised(factory_name, world_name)

  let manager = manager.supervised(manager_name, factory_name)

  static_supervisor.new(static_supervisor.OneForOne)
  |> static_supervisor.add(factory)
  |> static_supervisor.add(manager)
  |> static_supervisor.start()
}
