import betamine/decoder
import gleam/result

pub type Handedness {
  Right
  Left
}

pub fn decode(bit_array: BitArray) -> Result(#(Handedness, BitArray), Nil) {
  use #(handedness, bit_array) <- result.try(decoder.var_int(bit_array))
  case handedness {
    0 -> Ok(#(Left, bit_array))
    1 -> Ok(#(Right, bit_array))
    _ -> Error(Nil)
  }
}
