import betamine/common/entity.{type Entity}
import betamine/common/entity/entity_animation
import betamine/common/entity/entity_kind
import betamine/common/entity/entity_metadata
import betamine/common/entity/entity_pose
import betamine/common/entity/player
import betamine/common/math/vector3
import betamine/common/profile
import betamine/common/uuid
import betamine/constant
import betamine/message
import betamine/mojang
import gleam/dict
import gleam/erlang/process.{type Subject}
import gleam/list
import gleam/otp/actor
import gleam/result

type Game {
  Game(
    sessions: dict.Dict(uuid.Uuid, Session),
    profiles: dict.Dict(uuid.Uuid, profile.Profile),
    entities: dict.Dict(Int, Entity),
  )
}

type Session {
  Session(
    subject: Subject(message.PlayerSessionMessage),
    entity_id: Int,
    is_recieving: Bool,
  )
}

pub fn start() -> Result(Subject(message.GameMessage), actor.StartError) {
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

fn loop(
  game: Game,
  message: message.GameMessage,
) -> actor.Next(Game, message.GameMessage) {
  case message {
    message.GetAllPlayers(subject) -> {
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
    message.SpawnPlayer(subject, player_subject, uuid) -> {
      let assert Ok(profile) = mojang.fetch_profile(uuid)
      let entity =
        entity.Entity(
          ..entity.new(entity_kind.Player),
          id: dict.size(game.entities),
          uuid:,
          position: constant.mc_player_spawn_point,
        )
      let player = player.Player(profile:, entity:)
      process.send(player_subject, player)
      update_sessions(game, message.PlayerSpawned(player))
      let session = Session(subject, entity.id, False)
      actor.continue(Game(
        sessions: dict.insert(game.sessions, uuid, session),
        profiles: dict.insert(game.profiles, uuid, profile),
        entities: dict.insert(game.entities, entity.id, entity),
      ))
    }
    message.MovePlayer(uuid, new_position, on_ground) -> {
      case get_player_entity(game, uuid) {
        Ok(entity) -> {
          case vector3.equal(entity.position, new_position) {
            True -> game
            False -> {
              update_sessions(
                game,
                message.EntityPositionUpdated(
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
    message.RotatePlayer(uuid, rotation, on_ground) -> {
      case get_player_entity(game, uuid) {
        Ok(entity) -> {
          update_sessions(
            game,
            message.EntityRotationUpdated(entity.id, rotation, on_ground),
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
    message.RemovePlayer(uuid) -> {
      case get_player_entity_id(game, uuid) {
        Ok(entity_id) -> {
          update_sessions(game, message.PlayerDisconnected(uuid, entity_id))
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
    message.UpdatePlayerSneaking(uuid, sneaking) -> {
      let pose = case sneaking {
        True -> entity_pose.Crouching
        False -> entity_pose.Standing
      }
      let game =
        game
        |> set_player_metadata(uuid, entity_metadata.sneaking, sneaking)
        |> result.unwrap(game)
        |> set_player_metadata(uuid, entity_metadata.pose, pose)
        |> result.unwrap(game)
      send_player_metadata_update(game, uuid)
      actor.continue(game)
    }
    message.SwingPlayerArm(uuid, is_dominant) -> {
      case get_player_entity_id(game, uuid) {
        Ok(entity_id) -> {
          let animation = case is_dominant {
            True -> entity_animation.SwingDominantArm
            False -> entity_animation.SwingNonDominantArm
          }
          update_other_sessions(
            game,
            uuid,
            message.EntityAnimationTriggered(entity_id, animation),
          )
        }
        Error(_) -> Nil
      }
      actor.continue(game)
    }
    message.UpdatePlayerModelCustomization(uuid, model_customization) -> {
      let game =
        set_player_metadata(
          game,
          uuid,
          entity_metadata.player_model_customization,
          model_customization,
        )
        |> result.unwrap(game)
      send_player_metadata_update(game, uuid)
      actor.continue(game)
    }
    message.UpdatePlayerMainHand(uuid, handedness) -> {
      let game =
        set_player_metadata(game, uuid, entity_metadata.main_hand, handedness)
        |> result.unwrap(game)
      send_player_metadata_update(game, uuid)
      actor.continue(game)
    }
    message.StartRecievingUpdates(uuid) -> {
      case dict.get(game.sessions, uuid) {
        Ok(session) -> {
          Game(
            ..game,
            sessions: dict.insert(
              game.sessions,
              uuid,
              Session(..session, is_recieving: True),
            ),
          )
        }
        Error(_) -> game
      }
      |> actor.continue()
    }
  }
}

fn get_player_entity_id(game: Game, uuid: uuid.Uuid) {
  dict.get(game.sessions, uuid)
  |> result.map(fn(session) { session.entity_id })
}

fn get_player_entity(game: Game, uuid: uuid.Uuid) {
  get_player_entity_id(game, uuid)
  |> result.map(dict.get(game.entities, _))
  |> result.flatten
}

fn set_player_metadata(
  game: Game,
  uuid: uuid.Uuid,
  accessor: entity_metadata.MetadataAccessor(value),
  value: value,
) {
  get_player_entity(game, uuid)
  |> result.map(fn(entity) {
    let metadata =
      entity_metadata.set(entity.metadata, accessor, value)
      |> result.unwrap(entity.metadata)
    let entity = entity.Entity(..entity, metadata:)
    let entities = dict.insert(game.entities, entity.id, entity)
    Game(..game, entities:)
  })
}

fn send_player_metadata_update(game: Game, uuid: uuid.Uuid) {
  case get_player_entity(game, uuid) {
    Ok(entity) -> {
      update_sessions(
        game,
        message.EntityMetadataUpdated(entity.id, entity.metadata),
      )
    }
    Error(_) -> Nil
  }
}

fn update_sessions(game: Game, message: message.PlayerSessionMessage) {
  game.sessions
  |> dict.values
  |> list.each(fn(session) {
    case session.is_recieving {
      True -> process.send(session.subject, message)
      False -> Nil
    }
  })
}

fn update_other_sessions(
  game: Game,
  current_uuid: uuid.Uuid,
  message: message.PlayerSessionMessage,
) {
  game.sessions
  |> dict.to_list
  |> list.each(fn(pair) {
    let #(other_uuid, other_session) = pair
    case uuid.is_equal(current_uuid, other_uuid), other_session.is_recieving {
      False, True -> process.send(other_session.subject, message)
      _, _ -> Nil
    }
  })
}
