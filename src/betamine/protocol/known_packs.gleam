import betamine/decoder as decode
import betamine/encoder as encode
import gleam/bytes_builder
import gleam/result

pub type KnownPack {
  KnownPack(namespace: String, id: String, version: String)
}

pub fn deserialize(bit_array: BitArray) -> Result(List(KnownPack), Nil) {
  use #(length, bit_array) <- result.try(decode.var_int(bit_array))
  use #(known_packs, _) <- result.try(decode.array(
    bit_array,
    deserialize_known_pack,
    length,
  ))
  Ok(known_packs)
}

pub fn deserialize_known_pack(
  bit_array: BitArray,
) -> Result(#(KnownPack, BitArray), Nil) {
  use #(namespace, bit_array) <- result.try(decode.string(bit_array))
  use #(id, bit_array) <- result.try(decode.string(bit_array))
  use #(version, bit_array) <- result.try(decode.string(bit_array))
  let known_pack = KnownPack(namespace, id, version)
  Ok(#(known_pack, bit_array))
}

pub fn serialize() {
  encode.var_int(bytes_builder.new(), 1)
  |> encode.string("minecraft")
  |> encode.string("core")
  |> encode.string("1.21")
}
