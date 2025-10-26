import betamine/common/entity.{type Entity}
import betamine/common/entity/entity_animation
import betamine/common/entity/player.{type Player}
import betamine/common/rotation.{type Rotation}
import betamine/common/vector3.{type Vector3}

pub type Update {
  PlayerSpawned(player: Player)
  PlayerDisconnected(player: Player)
  PlayerMetadataUpdated(player: Player)
  EntityPosition(entity_id: Int, delta: Vector3(Float), on_ground: Bool)
  EntityRotation(entity_id: Int, rotation: Rotation, on_ground: Bool)
  EntityAnimation(entity_id: Int, animation: entity_animation.EntityAnimation)
}
