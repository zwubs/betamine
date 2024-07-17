import betamine/encoder as encode
import gleam/bytes_builder

pub fn serialize() {
  encode.var_int(bytes_builder.new(), 1)
  |> encode.identifier("minecraft", "vanilla")
}
