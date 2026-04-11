import betamine/client/protocol/decoder
import betamine/client/protocol/error
import betamine/client/protocol/types/intention
import gleam/result

pub type Serverbound {
  ServerboundIntention(
    protocol_version: Int,
    address: String,
    port: Int,
    intention: intention.Intention,
  )
}

pub fn decode(
  id: Int,
  bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  case id {
    0 -> decode_intention(bit_array)
    _ -> Error(error.InvalidPacketId(id))
  }
}

fn decode_intention(
  bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  use #(protocol_version, bit_array) <- result.try(decoder.var_int(bit_array))
  use #(address, bit_array) <- result.try(decoder.string(bit_array))
  use #(port, bit_array) <- result.try(decoder.unsigned_short(bit_array))
  use intention <- result.try({
    use #(int, _) <- result.try(decoder.var_int(bit_array))
    intention.from_int(int)
  })
  Ok(ServerboundIntention(protocol_version:, address:, port:, intention:))
}
