import betamine/common/profile
import betamine/common/uuid
import betamine/player/player
import gleam/dict
import gleam/erlang/process
import gleam/otp/actor
import gleam/otp/factory_supervisor
import gleam/otp/supervision

pub type Message {
  New(
    return_subject: process.Subject(
      Result(
        #(process.Subject(player.Message), profile.Profile),
        actor.StartError,
      ),
    ),
    uuid: uuid.Uuid,
  )
}

pub type Name =
  process.Name(Message)

type PlayerInstance {
  PlayerInstance(name: String, subject: process.Subject(player.Message))
}

type State {
  State(
    players: dict.Dict(uuid.Uuid, PlayerInstance),
    player_factory: factory_supervisor.Supervisor(
      uuid.Uuid,
      #(process.Subject(player.Message), profile.Profile),
    ),
  )
}

pub fn supervised(
  name: Name,
  factory_name: process.Name(
    factory_supervisor.Message(
      uuid.Uuid,
      #(process.Subject(player.Message), profile.Profile),
    ),
  ),
) -> supervision.ChildSpecification(process.Subject(Message)) {
  supervision.worker(fn() { start(name, factory_name) })
}

pub fn start(
  name: Name,
  factory_name: process.Name(
    factory_supervisor.Message(
      uuid.Uuid,
      #(process.Subject(player.Message), profile.Profile),
    ),
  ),
) -> Result(actor.Started(process.Subject(Message)), actor.StartError) {
  let factory = factory_supervisor.get_by_name(factory_name)
  actor.new(State(dict.new(), factory))
  |> actor.on_message(message_handler)
  |> actor.named(name)
  |> actor.start()
}

fn message_handler(state: State, message: Message) -> actor.Next(State, Message) {
  let State(players:, player_factory:) = state
  case message {
    New(return_subject:, uuid:) -> {
      case factory_supervisor.start_child(player_factory, uuid) {
        Ok(actor.Started(_pid, data)) -> {
          process.send(return_subject, Ok(data))
          let #(player_subject, profile.Profile(id:, name:, ..)) = data
          let player_instance = PlayerInstance(name, player_subject)
          let players = dict.insert(players, id, player_instance)
          State(..state, players:)
        }
        Error(actor_error) -> {
          process.send(return_subject, Error(actor_error))
          state
        }
      }
    }
  }
  |> actor.continue()
}
