import betamine/common/profile
import betamine/common/uuid
import betamine/player/player
import betamine/player/player_manager
import betamine/world
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

pub fn supervised(
  name: Name,
  manager_name: player_manager.Name,
  world_name: world.Name,
) {
  supervision.supervisor(fn() { start(name, manager_name, world_name) })
}

pub fn start(
  name: Name,
  manager_name: player_manager.Name,
  world_name: world.Name,
) {
  factory_supervisor.worker_child(fn(uuid) { player.start(uuid, world_name) })
  |> factory_supervisor.named(name)
  |> factory_supervisor.start()
}
