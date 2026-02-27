import betamine/entity_region/factory
import betamine/entity_region/message
import gleam/dict
import gleam/erlang/process
import gleam/otp/actor
import gleam/otp/factory_supervisor
import gleam/otp/supervision

type Message =
  message.ManagerMessage

pub type Subject =
  message.ManagerSubject

pub type Name =
  process.Name(Message)

type State {
  State(
    factory: factory.Supervisor,
    regions: dict.Dict(#(Int, Int), message.RegionSubject),
  )
}

pub fn supervised(
  name: Name,
  factory_name: factory.Name,
) -> supervision.ChildSpecification(message.ManagerSubject) {
  supervision.worker(fn() { start(name, factory_name) })
}

pub fn start(
  name: Name,
  factory_name: factory.Name,
) -> Result(actor.Started(Subject), actor.StartError) {
  let factory = factory_supervisor.get_by_name(factory_name)
  actor.new_with_initialiser(1000, fn(subject) {
    actor.initialised(State(factory, dict.new()))
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
    message.SpawnEntity(entity) -> todo
  }
}
