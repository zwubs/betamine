import betamine/common/entity/entity_animation
import betamine/common/entity/entity_metadata
import betamine/common/entity/player
import betamine/common/math/vector3
import betamine/common/rotation
import betamine/common/uuid
import gleam/erlang/process

pub type PlayerSessionMessage {
  PlayerSpawned(player: player.Player)
  PlayerDisconnected(uuid: uuid.Uuid, entity_id: Int)
  EntityMetadataUpdated(
    entity_id: Int,
    metadata: entity_metadata.EntityMetadata,
  )
  EntityPositionUpdated(
    entity_id: Int,
    delta: vector3.Vector3(Float),
    on_ground: Bool,
  )
  EntityRotationUpdated(
    entity_id: Int,
    rotation: rotation.Rotation,
    on_ground: Bool,
  )
  EntityAnimationTriggered(
    entity_id: Int,
    animation: entity_animation.EntityAnimation,
  )
}

pub type GameMessage {
  SpawnPlayer(
    session_subject: process.Subject(PlayerSessionMessage),
    player_subject: process.Subject(player.Player),
    uuid: uuid.Uuid,
  )
  StartRecievingUpdates(uuid: uuid.Uuid)
  RemovePlayer(uuid: uuid.Uuid)
  MovePlayer(uuid: uuid.Uuid, position: vector3.Vector3(Float), on_ground: Bool)
  RotatePlayer(uuid: uuid.Uuid, rotation: rotation.Rotation, on_ground: Bool)
  GetAllPlayers(subject: process.Subject(List(player.Player)))
  UpdatePlayerSneaking(uuid: uuid.Uuid, sneaking: Bool)
  SwingPlayerArm(uuid: uuid.Uuid, is_dominant: Bool)
}
