import betamine/common/rotation.{type Rotation}
import betamine/encoder as encode
import gleam/bytes_builder

pub type Request {
  Request(entity_id: Int, head_yaw: Float)
}

pub fn serialize(request: Request) {
  bytes_builder.new()
  |> encode.var_int(request.entity_id)
  |> encode.angle(request.head_yaw)
}
