import betamine/common/profile
import betamine/common/uuid
import betamine/player/message as player_message
import betamine/player/player
import betamine/session/message as session_message
import betamine/world/world
import gleam/erlang/process
import gleam/otp/factory_supervisor
import gleam/otp/supervision

pub type Message =
  factory_supervisor.Message(
    #(uuid.Uuid, process.Subject(session_message.PlayerEvent)),
    #(process.Subject(player_message.SessionCommand), profile.Profile),
  )

pub type Name =
  process.Name(Message)

pub fn supervised(name: Name, world_name: world.Name) {
  supervision.supervisor(fn() { start(name, world_name) })
}

pub fn start(name: Name, world_name: world.Name) {
  factory_supervisor.worker_child(fn(pair) {
    let #(uuid, session_subject) = pair
    player.start(uuid, session_subject, world_name)
  })
  |> factory_supervisor.named(name)
  |> factory_supervisor.start()
}
