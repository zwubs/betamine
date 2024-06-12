import gleam/bytes_builder
import gleam/result
import glime/decoder as decode
import glime/encoder as encode

pub type BrandRequest {
  BrandRequest(channel: String, implementation: String)
}

pub fn deserialize(bit_array: BitArray) {
  use #(key, bit_array) <- result.try(decode.string(bit_array))
  use #(value, _) <- result.try(decode.string(bit_array))
  Ok(BrandRequest(key, value))
}

pub fn serialize() {
  encode.string(bytes_builder.new(), "minecraft:brand")
  |> encode.string("vanilla")
}
