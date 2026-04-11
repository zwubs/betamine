import betamine/entity_region/factory
import betamine/entity_region/manager
import gleam/erlang/process
import gleam/otp/static_supervisor
import gleam/otp/supervision

pub fn supervised(manager_name: manager.Name) {
  supervision.supervisor(fn() { start(manager_name) })
}

pub fn start(manager_name: manager.Name) {
  let factory_name = process.new_name("entity_region_factory")
  let factory = factory.supervised(factory_name)
  let manager = manager.supervised(manager_name, factory_name)

  static_supervisor.new(static_supervisor.OneForOne)
  |> static_supervisor.add(factory)
  |> static_supervisor.add(manager)
  |> static_supervisor.start()
}
