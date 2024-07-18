import betamine/encoder as encode
import gleam/bytes_builder

pub fn serialize() {
  encode.var_int(bytes_builder.new(), 0)
  |> encode.var_int(0)
}
