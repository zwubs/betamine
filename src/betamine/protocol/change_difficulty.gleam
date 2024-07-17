import betamine/encoder as encode
import gleam/bytes_builder

pub fn serialize() {
  encode.byte(bytes_builder.new(), 1)
  |> encode.bool(False)
}
