import betamine/common/entity.{type Entity}
import betamine/common/rotation
import betamine/common/vector3
import betamine/protocol/packets/clientbound.{type Packet}

pub fn handle_spawn(entity: Entity) -> Packet {
  clientbound.SpawnEntity(clientbound.SpawnEntityPacket(
    id: entity.id,
    uuid: entity.uuid,
    entity_type: entity.entity_type,
    position: entity.position,
    rotation: entity.rotation,
    head_rotation: entity.head_rotation,
    velocity: entity.velocity,
  ))
}

pub fn handle_move(id, delta, on_ground) {
  clientbound.UpdateEntityPosition(clientbound.UpdateEntityPositionPacket(
    id:,
    delta:,
    is_grounded: on_ground,
  ))
}

pub fn handle_rotate(id, rotation: rotation.Rotation, on_ground) {
  [
    clientbound.UpdateEntityRotation(clientbound.UpdateEntityRotationPacket(
      id:,
      pitch: rotation.pitch,
      yaw: rotation.yaw,
      is_grounded: on_ground,
    )),
    clientbound.SetHeadRotation(clientbound.SetHeadRotationPacket(
      id:,
      head_yaw: rotation.yaw,
    )),
  ]
}
