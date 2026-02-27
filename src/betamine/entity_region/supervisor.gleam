import betamine/entity_region/factory
import betamine/entity_region/manager
import gleam/otp/static_supervisor
import gleam/otp/supervision

pub fn supervised(factory_name: factory.Name, manager_name: manager.Name) {
  supervision.supervisor(fn() { start(factory_name, manager_name) })
}

pub fn start(factory_name: factory.Name, manager_name: manager.Name) {
  let factory = factory.supervised(factory_name)
  let manager = manager.supervised(manager_name, factory_name)

  static_supervisor.new(static_supervisor.OneForOne)
  |> static_supervisor.add(factory)
  |> static_supervisor.add(manager)
  |> static_supervisor.start()
}
