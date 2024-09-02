import betamine/common/entity.{type Entity}
import betamine/common/entity_type
import betamine/common/player.{type Player}
import betamine/common/vector3
import betamine/constants
import betamine/game/command.{type Command}
import betamine/game/update.{type Update}
import gleam/dict
import gleam/erlang/process.{type Subject}
import gleam/function
import gleam/io
import gleam/list
import gleam/otp/actor
import gleam/pair

type Game {
  Game(
    sessions: dict.Dict(Int, #(Subject(Update), Player)),
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

        actor.Ready(Game(dict.new(), dict.new()), selector)
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
    command.GetAllPlayers(subject) -> {
      dict.values(game.sessions)
      |> list.map(pair.second)
      |> list.map(fn(player) {
        case dict.get(game.entities, player.entity_id) {
          Ok(entity) -> #(player, entity)
          Error(_) -> #(player, entity.default)
        }
      })
      |> process.send(subject, _)
      actor.continue(game)
    }
    command.SpawnPlayer(subject, player_subject, uuid, name) -> {
      let entity =
        entity.Entity(
          ..entity.default,
          id: dict.size(game.entities),
          uuid:,
          entity_type: entity_type.Player,
          position: constants.mc_player_spawn_point,
        )
      let player = player.Player(name, uuid, entity.id)
      process.send(player_subject, #(player, entity))
      update_sessions(game, update.PlayerSpawned(player, entity))
      actor.continue(Game(
        sessions: dict.insert(game.sessions, player.uuid, #(subject, player)),
        entities: dict.insert(game.entities, entity.id, entity),
      ))
    }
    command.MoveEntity(entity_id, new_position, on_ground) -> {
      let entity = case dict.get(game.entities, entity_id) {
        Ok(entity) -> {
          let old_position = entity.position
          let entity = case vector3.equal(old_position, new_position) {
            True -> entity
            False -> {
              update_sessions(
                game,
                update.EntityPosition(
                  entity.id,
                  vector3.subtract(new_position, old_position),
                  on_ground,
                ),
              )
              entity.Entity(..entity, position: new_position)
            }
          }
          entity
        }
        Error(_) -> todo
      }
      actor.continue(
        Game(..game, entities: dict.insert(game.entities, entity.id, entity)),
      )
    }
    command.RotateEntity(entity_id, rotation, on_ground) -> {
      let entity = case dict.get(game.entities, entity_id) {
        Ok(entity) -> {
          update_sessions(
            game,
            update.EntityRotation(entity.id, rotation, on_ground),
          )
          entity.Entity(..entity, rotation:)
        }
        Error(_) -> todo
      }
      actor.continue(
        Game(..game, entities: dict.insert(game.entities, entity.id, entity)),
      )
    }
    command.RemovePlayer(uuid, subject) -> {
      let session = dict.get(game.sessions, uuid)
      let game = case session {
        Error(_) -> game
        Ok(#(_subject, player)) -> {
          update_sessions(game, update.PlayerDisconnected(player))
          Game(
            sessions: dict.delete(game.sessions, uuid),
            entities: dict.delete(game.entities, player.entity_id),
          )
        }
      }

      actor.continue(game)
    }
    _ -> actor.continue(game)
  }
}

fn update_sessions(game: Game, update: update.Update) {
  game.sessions
  |> dict.values
  |> list.each(fn(session) { process.send(session.0, update) })
}
