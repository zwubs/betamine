import betamine/common/profile
import betamine/common/uuid
import betamine/player/player
import gleam/erlang/process
import gleam/otp/factory_supervisor
import gleam/otp/supervision

pub type Message =
  factory_supervisor.Message(
    uuid.Uuid,
    #(process.Subject(player.Message), profile.Profile),
  )

pub type Name =
  process.Name(Message)

pub fn supervised(name: Name) {
  supervision.supervisor(fn() { start(name) })
}

pub fn start(name: Name) {
  factory_supervisor.worker_child(player.start)
  |> factory_supervisor.named(name)
  |> factory_supervisor.start()
}
