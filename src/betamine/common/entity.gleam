import betamine/common/entity/entity_kind
import betamine/common/entity/entity_metadata
import betamine/common/math/vector3
import betamine/common/rotation
import betamine/common/uuid

pub type Entity {
  Entity(
    id: Int,
    uuid: uuid.Uuid,
    kind: entity_kind.EntityKind,
    position: vector3.Vector3(Float),
    velocity: vector3.Vector3(Float),
    rotation: rotation.Rotation,
    head_rotation: Float,
    metadata: entity_metadata.EntityMetadata,
  )
}

pub fn new(kind: entity_kind.EntityKind) {
  Entity(
    id: 0,
    uuid: uuid.default,
    kind:,
    position: vector3.Vector3(0.0, 0.0, 0.0),
    velocity: vector3.Vector3(0.0, 0.0, 0.0),
    rotation: rotation.Rotation(0.0, 0.0),
    head_rotation: 0.0,
    metadata: entity_metadata.new(kind),
  )
}

pub fn with_uuid(entity: Entity, uuid: uuid.Uuid) {
  Entity(..entity, uuid:)
}
