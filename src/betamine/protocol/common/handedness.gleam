import betamine/protocol/decoder
import betamine/protocol/error.{type ProtocolError}
import gleam/result

pub type Handedness {
  Right
  Left
}

pub fn decode(
  bit_array: BitArray,
) -> Result(#(Handedness, BitArray), ProtocolError) {
  use #(handedness, bit_array) <- result.try(decoder.var_int(bit_array))
  case handedness {
    0 -> Ok(#(Left, bit_array))
    1 -> Ok(#(Right, bit_array))
    _ -> Error(error.InvalidEnumValue(min: 0, max: 1, value: handedness))
  }
}
