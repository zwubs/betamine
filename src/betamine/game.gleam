import gleam/erlang/process.{type Subject}
import gleam/function
import gleam/otp/actor

pub type Command {
  Tick
  Shutdown
}

pub type Update

type State {
  State
}

// actor functions
pub fn start() -> Result(Subject(Command), actor.StartError) {
  let parent_subject = process.new_subject()
  let start_result =
    actor.start_spec(actor.Spec(
      init: fn() {
        // create the subject the main process to send control messages on
        let sim_subject = process.new_subject()
        process.send(parent_subject, sim_subject)

        let selector =
          process.new_selector()
          |> process.selecting(sim_subject, function.identity)

        actor.Ready(State, selector)
      },
      init_timeout: 1000,
      loop: loop,
    ))

  let assert Ok(sim_subject) = process.receive(parent_subject, 1000)

  case start_result {
    Ok(_) -> Ok(sim_subject)
    Error(err) -> Error(err)
  }
}

fn loop(message: Command, state: State) -> actor.Next(Command, State) {
  case message {
    _ -> actor.continue(state)
  }
}
