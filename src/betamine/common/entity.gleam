import betamine/common/entity_type.{type EntityType}
import betamine/common/rotation.{type Rotation, Rotation}
import betamine/common/vector3.{type Vector3, Vector3}

pub type Entity {
  Entity(
    id: Int,
    uuid: Int,
    entity_type: EntityType,
    position: Vector3(Float),
    rotation: Rotation,
    head_rotation: Float,
    velocity: Vector3(Float),
  )
}

pub const default = Entity(
  id: 0,
  uuid: 0,
  entity_type: entity_type.Player,
  position: Vector3(0.0, 0.0, 0.0),
  rotation: Rotation(0.0, 0.0),
  head_rotation: 0.0,
  velocity: Vector3(0.0, 0.0, 0.0),
)
