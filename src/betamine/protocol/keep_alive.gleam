import betamine/decoder as decode
import betamine/encoder as encode
import gleam/bytes_builder
import gleam/result

pub fn serialize() {
  bytes_builder.new()
  |> encode.long(0)
}

pub fn deserialize(bit_array: BitArray) -> Result(Int, Nil) {
  use #(id, _) <- result.try(decode.var_int(bit_array))
  Ok(id)
}
