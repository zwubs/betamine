import betamine/common/profile
import betamine/common/uuid
import betamine/mojang
import gleam/erlang/process
import gleam/otp/actor

pub type Message

pub type State {
  State(profile: profile.Profile)
}

pub fn start(
  uuid: uuid.Uuid,
) -> Result(
  actor.Started(#(process.Subject(Message), profile.Profile)),
  actor.StartError,
) {
  actor.new_with_initialiser(10_000, fn(subject) {
    let assert Ok(profile) = mojang.fetch_profile(uuid)
    let state: State = State(profile)
    actor.initialised(state)
    |> actor.returning(#(subject, profile))
    |> Ok
  })
  |> actor.on_message(handle_message)
  |> actor.start
}

fn handle_message(state: State, message: Message) -> actor.Next(State, Message) {
  actor.continue(state)
}
