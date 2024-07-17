import betamine/encoder as encode
import gleam/bytes_builder

pub fn serialize() {
  bytes_builder.new()
  // X
  |> encode.double(0.0)
  // Y
  |> encode.double(0.0)
  // Z
  |> encode.double(0.0)
  // Yaw
  |> encode.float(0.0)
  // Pitch
  |> encode.float(0.0)
  // Flags
  |> encode.byte(0)
  // Teleport Id
  |> encode.var_int(0)
}
