import betamine/common/profile
import betamine/common/uuid
import betamine/player/factory
import betamine/player/message
import betamine/player/player
import betamine/world/message as world_message
import gleam/bool
import gleam/dict
import gleam/erlang/process
import gleam/list
import gleam/otp/actor
import gleam/otp/factory_supervisor
import gleam/otp/supervision

type Message =
  message.ManagerMessage

type Subject =
  message.ManagerSubject

type Name =
  message.ManagerName

type PlayerInstance {
  PlayerInstance(
    profile: profile.Profile,
    subject: message.PlayerSubject,
    pid: process.Pid,
  )
}

type State {
  State(
    subject: Subject,
    players: dict.Dict(uuid.Uuid, PlayerInstance),
    player_factory: factory.Supervisor,
    world_subject: world_message.Subject,
  )
}

pub fn supervised(
  name: Name,
  factory_name: factory.Name,
  world_name: world_message.Name,
) -> supervision.ChildSpecification(Subject) {
  supervision.worker(fn() { start(name, factory_name, world_name) })
}

pub fn start(
  name: Name,
  factory_name: factory.Name,
  world_name: world_message.Name,
) -> Result(actor.Started(Subject), actor.StartError) {
  let factory = factory_supervisor.get_by_name(factory_name)
  let world_subject = process.named_subject(world_name)
  actor.new_with_initialiser(1000, fn(subject) {
    actor.initialised(State(subject, dict.new(), factory, world_subject))
    |> actor.selecting(process.select(process.new_selector(), subject))
    |> actor.returning(subject)
    |> Ok
  })
  |> actor.on_message(handle_message)
  |> actor.named(name)
  |> actor.start()
}

fn handle_message(state: State, message: Message) {
  case message {
    message.NewPlayer(return_subject:, uuid:, session_subject:) -> {
      case
        factory_supervisor.start_child(
          state.player_factory,
          player.Requiring(
            uuid:,
            session_subject:,
            world_subject: state.world_subject,
            manager_subject: state.subject,
          ),
        )
      {
        Ok(actor.Started(pid, returning)) -> {
          let player.Returning(profile:, subject:) = returning
          process.send(return_subject, Ok(#(subject, profile)))
          let player_instance = PlayerInstance(profile, subject, pid)
          let players = dict.insert(state.players, uuid, player_instance)
          actor.continue(State(..state, players:))
        }
        Error(actor_error) -> {
          process.send(return_subject, Error(actor_error))
          actor.continue(state)
        }
      }
    }
    message.StopPlayer(uuid:) -> {
      case dict.get(state.players, uuid) {
        Ok(PlayerInstance(subject:, ..)) -> process.send(subject, message.Stop)
        _ -> Nil
      }
      let players = dict.delete(state.players, uuid)
      actor.continue(State(..state, players:))
    }
    message.GetPlayerList(return_subject:) -> {
      let player_list =
        dict.values(state.players)
        |> list.map(fn(instance) {
          #(instance.profile.id, instance.profile.name)
        })
      process.send(return_subject, player_list)
      actor.continue(state)
    }
    message.GetAllPlayers(..) -> actor.continue(state)
    message.MessageOtherPlayers(uuid:, message:) -> {
      let _ =
        dict.each(state.players, fn(player_uuid, player_instance) {
          use <- bool.guard(player_uuid == uuid, Nil)
          process.send(player_instance.subject, message)
        })
      actor.continue(state)
    }
  }
}
