import betamine/decoder
import betamine/encoder
import gleam/bytes_builder
import gleam/result

pub fn deserialize(bit_array: BitArray) {
  use #(long, _) <- result.try(decoder.long(bit_array))
  Ok(long)
}

pub fn serialize(ping_value: Int) {
  encoder.long(bytes_builder.new(), ping_value)
}
