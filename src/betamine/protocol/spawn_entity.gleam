import betamine/common/entity.{type Entity}
import betamine/common/entity_type
import betamine/encoder as encode
import gleam/bytes_builder

pub fn serialize(entity: Entity) {
  bytes_builder.new()
  // Entity Id
  |> encode.var_int(entity.id)
  // Entity UUID
  |> encode.uuid(entity.uuid)
  // Type
  |> encode.var_int(entity.entity_type |> entity_type.to_id)
  // Position
  // X
  |> encode.double(entity.position.x)
  // Y
  |> encode.double(entity.position.y)
  // Z
  |> encode.double(entity.position.z)
  // Rotaation
  // Pitch
  |> encode.angle(entity.rotation.pitch)
  // Yaw
  |> encode.angle(entity.rotation.yaw)
  // Head Yaw
  |> encode.angle(entity.head_rotation)
  // Data (reference https://wiki.vg/Object_Data)
  |> encode.var_int(0)
  // Velocity
  // X
  |> encode.short(0)
  // Y
  |> encode.short(0)
  // Z
  |> encode.short(0)
}
