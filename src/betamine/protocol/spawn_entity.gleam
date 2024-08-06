import betamine/encoder as encode
import gleam/bytes_builder

pub fn serialize() {
  bytes_builder.new()
  // Entity Id
  |> encode.var_int(1)
  // Entity UUID
  |> encode.uuid(0x000003e8532721efb600325096b39f47)
  // Type
  |> encode.var_int(128)
  // Position
  // X
  |> encode.double(6.0)
  // Y
  |> encode.double(-48.0)
  // Z
  |> encode.double(6.0)
  // Rotaation
  // Pitch
  |> encode.byte(0)
  // Yaw
  |> encode.byte(0)
  // Head Yaw
  |> encode.byte(0)
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
