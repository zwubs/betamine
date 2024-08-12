import betamine/encoder as encode
import gleam/bytes_builder

pub fn serialize(uuid: Int, name: String) {
  bytes_builder.new()
  // Action (Add Player)
  |> encode.byte(0b00000001)
  // Player Count
  |> encode.var_int(1)
  // Player UUID
  |> encode.uuid(uuid)
  // Player Actions
  // Name
  |> encode.string(name)
  // Properties
  |> encode.var_int(0)
}
