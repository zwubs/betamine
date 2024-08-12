import betamine/common/entity.{type Entity}
import betamine/common/entity_type
import betamine/common/player.{type Player}
import betamine/common/position.{Position}
import betamine/game/command.{type Command}
import betamine/game/update.{type Update}
import gleam/dict
import gleam/erlang/process.{type Subject}
import gleam/function
import gleam/list
import gleam/otp/actor
import gleam/set

type Game {
  Game(
    sessions: set.Set(Subject(Update)),
    players: dict.Dict(Int, Player),
    entities: dict.Dict(Int, Entity),
  )
}

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

        actor.Ready(Game(set.new(), dict.new(), dict.new()), selector)
      },
      init_timeout: 1000,
      loop: loop,
    ))

  let assert Ok(game_subject) = process.receive(parent_subject, 1000)

  case start_result {
    Ok(_) -> Ok(game_subject)
    Error(err) -> Error(err)
  }
}

fn loop(command: Command, game: Game) -> actor.Next(Command, Game) {
  case command {
    command.SpawnPlayer(subject, player_subject, uuid, name) -> {
      let entity =
        entity.Entity(
          ..entity.default,
          id: dict.size(game.entities),
          uuid:,
          entity_type: entity_type.Player,
          position: Position(6.0, -48.0, 6.0),
        )
      let player = player.Player(name, uuid, entity.id)
      process.send(player_subject, player)
      update_sessions(game, update.PlayerSpawned(player, entity))
      actor.continue(Game(
        sessions: set.insert(game.sessions, subject),
        players: dict.insert(game.players, player.uuid, player),
        entities: dict.insert(game.entities, entity.id, entity),
      ))
    }
    _ -> actor.continue(game)
  }
}

fn update_sessions(game: Game, update: update.Update) -> Game {
  game.sessions
  |> set.to_list
  |> list.each(fn(subject) { process.send(subject, update) })
  game
}
