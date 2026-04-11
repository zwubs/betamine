import betamine/common/entity
import betamine/entity_region/message
import gleam/dict
import gleam/erlang/process
import gleam/otp/actor

pub type Requiring {
  Requiring
}

pub type Returning {
  Returning
}

type State {
  State(entities: dict.Dict(Int, entity.Entity))
}

pub fn start(requiring: Requiring) {
  let Requiring(..) = requiring
  actor.new_with_initialiser(10_000, fn(subject) {
    let state: State = State(dict.new())
    actor.initialised(state)
    |> actor.selecting(process.select(process.new_selector(), subject))
    |> actor.returning(Returning)
    |> Ok
  })
  |> actor.on_message(handle_message)
  |> actor.start
}

fn handle_message(
  state: State,
  message: message.RegionMessage,
) -> actor.Next(State, message.RegionMessage) {
  case message {
    message.AddEntity -> actor.continue(state)
  }
}
