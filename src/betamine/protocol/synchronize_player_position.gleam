import betamine/common/entity.{type Entity}
import betamine/encoder as encode
import gleam/bytes_builder

pub fn serialize(entity: Entity) {
  bytes_builder.new()
  // X
  |> encode.double(entity.position.x)
  // Y
  |> encode.double(entity.position.y)
  // Z
  |> encode.double(entity.position.z)
  // Yaw
  |> encode.float(entity.rotation.yaw)
  // Pitch
  |> encode.float(entity.rotation.pitch)
  // Flags
  |> encode.byte(0)
  // Teleport Id
  |> encode.var_int(0)
}
