import betamine/common/profile
import betamine/common/uuid
import betamine/mojang
import gleam/erlang/process
import gleam/otp/actor
import gleam/otp/factory_supervisor

pub type Message

pub type Name =
  process.Name(factory_supervisor.Message(uuid.Uuid, process.Subject(Message)))

pub type State {
  State(profile: profile.Profile)
}

pub fn start(
  uuid: uuid.Uuid,
) -> Result(actor.Started(process.Subject(Message)), actor.StartError) {
  actor.new_with_initialiser(1000, fn(self) {
    let assert Ok(profile) = mojang.fetch_profile(uuid)
    let state: State = State(profile)
    actor.initialised(state)
    |> actor.returning(self)
    |> Ok
  })
  |> actor.on_message(handle_message)
  |> actor.start
}

fn handle_message(state: State, message: Message) -> actor.Next(State, Message) {
  actor.continue(state)
}
