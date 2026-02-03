import betamine/common/client_information
import betamine/common/profile
import betamine/common/uuid
import betamine/mojang
import gleam/erlang/process
import gleam/otp/actor

pub type Message {
  UpdateClientInformation(
    client_information: client_information.ClientInformation,
  )
}

pub type State {
  State(
    profile: profile.Profile,
    client_information: client_information.ClientInformation,
  )
}

pub fn start(
  uuid: uuid.Uuid,
) -> Result(
  actor.Started(#(process.Subject(Message), profile.Profile)),
  actor.StartError,
) {
  actor.new_with_initialiser(10_000, fn(subject) {
    let assert Ok(profile) = mojang.fetch_profile(uuid)
    let state: State = State(profile, client_information.default())
    actor.initialised(state)
    |> actor.returning(#(subject, profile))
    |> Ok
  })
  |> actor.on_message(handle_message)
  |> actor.start
}

fn handle_message(state: State, message: Message) -> actor.Next(State, Message) {
  case message {
    UpdateClientInformation(client_information:) ->
      State(..state, client_information:)
  }
  |> actor.continue()
}
