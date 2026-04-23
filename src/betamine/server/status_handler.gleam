import betamine/player/manager as player_manager
import betamine/server/status
import gleam/erlang/process
import gleam/otp/actor
import gleam/otp/supervision

pub type Message {
  GetStatus(return_subject: process.Subject(status.Status))
}

pub type Subject =
  process.Subject(Message)

pub type Name =
  process.Name(Message)

type State {
  State(status: status.Status, player_manager_subject: player_manager.Subject)
}

pub fn supervised(
  name: Name,
  player_manager_name: player_manager.Name,
) -> supervision.ChildSpecification(Subject) {
  supervision.worker(fn() { start(name, player_manager_name) })
}

pub fn start(
  name: Name,
  player_manager_name: player_manager.Name,
) -> Result(actor.Started(Subject), actor.StartError) {
  let player_manager_subject = process.named_subject(player_manager_name)
  actor.new_with_initialiser(1000, fn(subject) {
    actor.initialised(State(status.default(), player_manager_subject))
    |> actor.selecting(process.select(process.new_selector(), subject))
    |> actor.returning(subject)
    |> Ok
  })
  |> actor.on_message(handle_message)
  |> actor.named(name)
  |> actor.start()
}

fn handle_message(state: State, message: Message) -> actor.Next(State, Message) {
  case message {
    GetStatus(return_subject:) -> {
      process.send(return_subject, state.status)
    }
  }
  actor.continue(state)
}
