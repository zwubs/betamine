import betamine/common/profile
import betamine/common/uuid
import betamine/player/factory
import betamine/player/manager_message as message
import betamine/player/message as player_message
import betamine/session/message as session_message
import gleam/dict
import gleam/erlang/process
import gleam/list
import gleam/otp/actor
import gleam/otp/factory_supervisor
import gleam/otp/supervision
import gleam/pair

type PlayerSubject =
  process.Subject(player_message.SessionCommand)

pub type Message {
  SessionCommand(message.SessionCommand)
}

pub type Name =
  process.Name(Message)

type PlayerInstance {
  PlayerInstance(name: String, subject: PlayerSubject)
}

type State {
  State(
    players: dict.Dict(uuid.Uuid, PlayerInstance),
    player_factory: factory_supervisor.Supervisor(
      #(uuid.Uuid, process.Subject(session_message.PlayerEvent)),
      #(PlayerSubject, profile.Profile),
    ),
  )
}

pub fn supervised(
  name: Name,
  factory_name: process.Name(factory.Message),
) -> supervision.ChildSpecification(process.Subject(Message)) {
  supervision.worker(fn() { start(name, factory_name) })
}

pub fn start(
  name: Name,
  factory_name: process.Name(factory.Message),
) -> Result(actor.Started(process.Subject(Message)), actor.StartError) {
  let factory = factory_supervisor.get_by_name(factory_name)
  actor.new(State(dict.new(), factory))
  |> actor.on_message(handle_message)
  |> actor.named(name)
  |> actor.start()
}

fn handle_message(state: State, message: Message) {
  case message {
    SessionCommand(session_command) ->
      handle_session_command(state, session_command)
  }
}

fn handle_session_command(state: State, session_command: message.SessionCommand) {
  let State(players:, player_factory:) = state
  case session_command {
    message.New(return_subject:, uuid:, session_subject:) -> {
      case
        factory_supervisor.start_child(player_factory, #(uuid, session_subject))
      {
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
    message.GetAll(return_subject:) -> {
      let players =
        dict.to_list(state.players)
        |> list.map(pair.map_second(_, fn(instance) { instance.name }))
      process.send(return_subject, players)
      state
    }
  }
  |> actor.continue()
}
