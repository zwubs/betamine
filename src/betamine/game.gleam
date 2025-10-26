import betamine/common/entity.{type Entity}
import betamine/common/entity/entity_animation
import betamine/common/entity/entity_kind
import betamine/common/entity/entity_metadata
import betamine/common/entity/player
import betamine/common/math/vector3
import betamine/common/profile
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
    sessions: dict.Dict(uuid.Uuid, #(Subject(Update), Int)),
    profiles: dict.Dict(uuid.Uuid, profile.Profile),
    entities: dict.Dict(Int, Entity),
  )
}

pub fn start() -> Result(Subject(Command), actor.StartError) {
  let start_result =
    actor.new(Game(
      sessions: dict.new(),
      profiles: dict.new(),
      entities: dict.new(),
    ))
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
      list.filter_map(dict.to_list(game.profiles), fn(tuple) {
        let #(uuid, profile) = tuple
        case get_player_entity(game, uuid) {
          Ok(entity) -> Ok(player.Player(profile:, entity:))
          Error(_) -> Error(Nil)
        }
      })
      |> process.send(subject, _)
      actor.continue(game)
    }
    command.SpawnPlayer(subject, player_subject, uuid) -> {
      let assert Ok(profile) = mojang.fetch_profile(uuid)
      let entity =
        entity.Entity(
          ..entity.new(entity_kind.Player),
          id: dict.size(game.entities),
          uuid:,
          position: constants.mc_player_spawn_point,
        )
      let player = player.Player(profile:, entity:)
      process.send(player_subject, player)
      update_sessions(game, update.PlayerSpawned(player))
      actor.continue(Game(
        sessions: dict.insert(game.sessions, uuid, #(subject, entity.id)),
        profiles: dict.insert(game.profiles, uuid, profile),
        entities: dict.insert(game.entities, entity.id, entity),
      ))
    }
    command.MovePlayer(uuid, new_position, on_ground) -> {
      case get_player_entity(game, uuid) {
        Ok(entity) -> {
          case vector3.equal(entity.position, new_position) {
            True -> game
            False -> {
              update_sessions(
                game,
                update.EntityPosition(
                  entity.id,
                  vector3.subtract(new_position, entity.position),
                  on_ground,
                ),
              )
              Game(
                ..game,
                entities: dict.insert(
                  game.entities,
                  entity.id,
                  entity.Entity(..entity, position: new_position),
                ),
              )
            }
          }
        }
        Error(_) -> game
      }
      |> actor.continue()
    }
    command.RotatePlayer(uuid, rotation, on_ground) -> {
      case get_player_entity(game, uuid) {
        Ok(entity) -> {
          update_sessions(
            game,
            update.EntityRotation(entity.id, rotation, on_ground),
          )
          Game(
            ..game,
            entities: dict.insert(
              game.entities,
              entity.id,
              entity.Entity(..entity, rotation:),
            ),
          )
        }
        Error(_) -> game
      }
      |> actor.continue()
    }
    command.RemovePlayer(uuid) -> {
      case get_player_entity_id(game, uuid) {
        Ok(entity_id) -> {
          update_sessions(game, update.PlayerDisconnected(uuid, entity_id))
          Game(
            sessions: dict.delete(game.sessions, uuid),
            profiles: dict.delete(game.profiles, uuid),
            entities: dict.delete(game.entities, entity_id),
          )
        }
        Error(_) -> game
      }
      |> actor.continue()
    }
    command.UpdatePlayerSneaking(uuid, sneaking) -> {
      case get_player_entity(game, uuid) {
        Ok(entity) -> {
          let entity =
            entity.Entity(
              ..entity,
              metadata: entity_metadata.set(
                  entity.metadata,
                  entity_metadata.sneaking,
                  sneaking,
                )
                |> result.unwrap(entity.metadata),
            )
          update_sessions(
            game,
            update.PlayerMetadataUpdated(entity.id, entity.metadata),
          )
          Game(..game, entities: dict.insert(game.entities, entity.id, entity))
        }
        Error(_) -> game
      }
      |> actor.continue()
    }
    command.SwingPlayerArm(uuid, is_dominant) -> {
      case get_player_entity_id(game, uuid) {
        Ok(entity_id) -> {
          let animation = case is_dominant {
            True -> entity_animation.SwingDominantArm
            False -> entity_animation.SwingNonDominantArm
          }
          update_other_sessions(
            game,
            uuid,
            update.EntityAnimation(entity_id, animation),
          )
        }
        Error(_) -> Nil
      }
      actor.continue(game)
    }
    command.Tick -> actor.continue(game)
    command.Shutdown -> todo
  }
}

fn get_player_entity_id(game: Game, uuid: uuid.Uuid) {
  dict.get(game.sessions, uuid)
  |> result.map(pair.second)
}

fn get_player_entity(game: Game, uuid: uuid.Uuid) {
  get_player_entity_id(game, uuid)
  |> result.map(dict.get(game.entities, _))
  |> result.flatten
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
  |> dict.to_list
  |> list.each(fn(session) {
    let other_uuid = pair.first(session)
    case uuid.is_equal(current_uuid, other_uuid) {
      True -> Nil
      False -> pair.second(session) |> pair.first() |> process.send(update)
    }
  })
}
