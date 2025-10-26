import betamine/common/entity.{type Entity}
import betamine/common/entity/entity_animation
import betamine/common/entity/entity_kind
import betamine/common/entity/entity_metadata
import betamine/common/entity/player.{type Player}
import betamine/common/math/vector3
import betamine/common/uuid
import betamine/constants
import betamine/game/command.{type Command}
import betamine/game/update.{type Update}
import betamine/mojang
import gleam/dict
import gleam/erlang/process.{type Subject}
import gleam/list
import gleam/otp/actor
import gleam/pair
import gleam/result

type Game {
  Game(
    sessions: dict.Dict(uuid.Uuid, #(Subject(Update), Player)),
    entities: dict.Dict(Int, Entity),
  )
}

pub fn start() -> Result(Subject(Command), actor.StartError) {
  let start_result =
    actor.new(Game(sessions: dict.new(), entities: dict.new()))
    |> actor.on_message(loop)
    |> actor.start()

  case start_result {
    Ok(started) -> Ok(started.data)
    Error(err) -> Error(err)
  }
}

fn loop(game: Game, command: Command) -> actor.Next(Game, Command) {
  case command {
    command.GetAllPlayers(subject) -> {
      dict.values(game.sessions)
      |> list.map(pair.second)
      |> process.send(subject, _)
      actor.continue(game)
    }
    command.SpawnPlayer(subject, player_subject, uuid, name) -> {
      let assert Ok(profile) = mojang.fetch_profile(uuid)
      let entity =
        entity.Entity(
          ..entity.new(entity_kind.Player),
          id: dict.size(game.entities),
          uuid:,
          position: constants.mc_player_spawn_point,
        )
      let player = player.Player(name, entity, profile)
      process.send(player_subject, player)
      update_sessions(game, update.PlayerSpawned(player))
      actor.continue(Game(
        sessions: dict.insert(game.sessions, player.entity.uuid, #(
          subject,
          player,
        )),
        entities: dict.insert(game.entities, entity.id, entity),
      ))
    }
    command.MovePlayer(uuid, new_position, on_ground) -> {
      let entity = case dict.get(game.sessions, uuid) {
        Ok(#(_subject, player)) -> {
          case vector3.equal(player.entity.position, new_position) {
            True -> player.entity
            False -> {
              update_sessions(
                game,
                update.EntityPosition(
                  player.entity.id,
                  vector3.subtract(new_position, player.entity.position),
                  on_ground,
                ),
              )
              entity.Entity(..player.entity, position: new_position)
            }
          }
        }
        Error(_) -> todo
      }
      actor.continue(
        Game(..game, entities: dict.insert(game.entities, entity.id, entity)),
      )
    }
    command.RotatePlayer(uuid, rotation, on_ground) -> {
      let entity = case dict.get(game.sessions, uuid) {
        Ok(#(_subject, player)) -> {
          update_sessions(
            game,
            update.EntityRotation(player.entity.id, rotation, on_ground),
          )
          entity.Entity(..player.entity, rotation:)
        }
        Error(_) -> todo
      }
      actor.continue(
        Game(..game, entities: dict.insert(game.entities, entity.id, entity)),
      )
    }
    command.RemovePlayer(uuid, _subject) -> {
      case dict.get(game.sessions, uuid) {
        Error(_) -> game
        Ok(#(_subject, player)) -> {
          update_sessions(game, update.PlayerDisconnected(player))
          Game(
            sessions: dict.delete(game.sessions, uuid),
            entities: dict.delete(game.entities, player.entity.id),
          )
        }
      }
      |> actor.continue()
    }
    command.UpdatePlayerSneaking(uuid, sneaking) -> {
      let session = dict.get(game.sessions, uuid)
      let game = case session {
        Error(_) -> game
        Ok(#(subject, player)) -> {
          let metadata =
            entity_metadata.set(
              player.entity.metadata,
              entity_metadata.sneaking,
              sneaking,
            )
            |> result.unwrap(player.entity.metadata)

          let player =
            player.Player(
              ..player,
              entity: entity.Entity(..player.entity, metadata:),
            )

          update_sessions(game, update.PlayerMetadataUpdated(player))
          Game(
            sessions: dict.insert(game.sessions, uuid, #(subject, player)),
            entities: game.entities,
          )
        }
      }
      actor.continue(game)
    }
    command.SwingPlayerArm(uuid, is_dominant) -> {
      let session = dict.get(game.sessions, uuid)
      case session {
        Error(_) -> Nil
        Ok(#(_, player)) -> {
          let animation = case is_dominant {
            True -> entity_animation.SwingDominantArm
            False -> entity_animation.SwingNonDominantArm
          }
          update_other_sessions(
            game,
            player.entity.uuid,
            update.EntityAnimation(player.entity.id, animation),
          )
        }
      }
      actor.continue(game)
    }
    command.Tick -> actor.continue(game)
    command.Shutdown -> todo
  }
}

fn update_sessions(game: Game, update: update.Update) {
  game.sessions
  |> dict.values
  |> list.each(fn(session) { process.send(session.0, update) })
}

fn update_other_sessions(
  game: Game,
  current_uuid: uuid.Uuid,
  update: update.Update,
) {
  game.sessions
  |> dict.values
  |> list.each(fn(session) {
    case uuid.is_equal(current_uuid, { session.1 }.entity.uuid) {
      True -> Nil
      False -> process.send(session.0, update)
    }
  })
}
