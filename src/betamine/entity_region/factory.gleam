import betamine/entity_region/region
import gleam/erlang/process
import gleam/otp/factory_supervisor
import gleam/otp/supervision

pub type Message =
  factory_supervisor.Message(region.Requiring, region.Returning)

pub type Supervisor =
  factory_supervisor.Supervisor(region.Requiring, region.Returning)

pub type Name =
  process.Name(Message)

pub fn supervised(name: Name) {
  supervision.supervisor(fn() { start(name) })
}

pub fn start(name: Name) {
  factory_supervisor.worker_child(region.start)
  |> factory_supervisor.named(name)
  |> factory_supervisor.start()
}
