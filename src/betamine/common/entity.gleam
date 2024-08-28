import betamine/common/entity_type.{type EntityType}
import betamine/common/position.{type Position, Position}
import betamine/common/rotation.{type Rotation, Rotation}
import betamine/common/velocity.{type Velocity, Velocity}

pub type Entity {
  Entity(
    id: Int,
    uuid: Int,
    entity_type: EntityType,
    position: Position,
    rotation: Rotation,
    head_rotation: Float,
    velocity: Velocity,
  )
}

pub const default = Entity(
  id: 0,
  uuid: 0,
  entity_type: entity_type.Player,
  position: Position(0.0, 0.0, 0.0),
  rotation: Rotation(0.0, 0.0),
  head_rotation: 0.0,
  velocity: Velocity(0.0, 0.0, 0.0),
)
