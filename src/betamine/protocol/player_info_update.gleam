import betamine/encoder as encode
import gleam/bytes_builder

pub fn serialize() {
  bytes_builder.new()
  // Action (Add Player)
  |> encode.byte(0b00000001)
  // Player Count
  |> encode.var_int(1)
  // Player UUID
  |> encode.uuid(0x000003e8532721efb600325096b39f47)
  // Player Actions
  // Name
  |> encode.string("NPC")
  // Properties
  |> encode.var_int(0)
}
