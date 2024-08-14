import betamine/common/entity.{type Entity}
import betamine/common/player.{type Player}
import betamine/common/position.{type Position}
import betamine/common/rotation.{type Rotation}

pub type Update {
  PlayerSpawned(player: Player, entity: Entity)
  PlayerDisconnected(player: Player)
  EntityPosition(
    entity_id: Int,
    old_position: Position,
    new_position: Position,
    on_ground: Bool,
  )
  EntityRotation(entity_id: Int, rotation: Rotation, on_ground: Bool)
}
