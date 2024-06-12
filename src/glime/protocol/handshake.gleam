import gleam/result
import glime/decoder

pub type Handshake {
  Handshake(protocol_version: Int, address: String, port: Int, next_state: Int)
}

pub fn deserialize(bit_array: BitArray) {
  use #(protocol_version, bit_array) <- result.try(decoder.var_int(bit_array))
  use #(address, bit_array) <- result.try(decoder.string(bit_array))
  use #(port, bit_array) <- result.try(decoder.unsigned_short(bit_array))
  use #(next_state, _) <- result.try(decoder.var_int(bit_array))
  Ok(Handshake(protocol_version, address, port, next_state))
}
