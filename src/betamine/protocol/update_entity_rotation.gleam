import betamine/common/rotation.{type Rotation}
import betamine/encoder as encode
import gleam/bytes_builder

pub type Request {
  Request(entity_id: Int, rotation: Rotation, is_grounded: Bool)
}

pub fn serialize(request: Request) {
  bytes_builder.new()
  // Entity Id
  |> encode.var_int(request.entity_id)
  // Delta Position
  |> encode.angle(request.rotation.yaw)
  |> encode.angle(request.rotation.pitch)
  // Is On Ground
  |> encode.bool(request.is_grounded)
}
