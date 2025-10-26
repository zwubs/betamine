import betamine/common/entity/entity_animation
import betamine/common/entity/entity_metadata
import betamine/common/entity/player.{type Player}
import betamine/common/math/vector3.{type Vector3}
import betamine/common/rotation.{type Rotation}
import betamine/common/uuid

pub type Update {
  PlayerSpawned(player: Player)
  PlayerDisconnected(uuid: uuid.Uuid, entity_id: Int)
  EntityMetadataUpdated(
    entity_id: Int,
    metadata: entity_metadata.EntityMetadata,
  )
  EntityPosition(entity_id: Int, delta: Vector3(Float), on_ground: Bool)
  EntityRotation(entity_id: Int, rotation: Rotation, on_ground: Bool)
  EntityAnimation(entity_id: Int, animation: entity_animation.EntityAnimation)
}
