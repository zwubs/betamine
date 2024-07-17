import betamine/decoder as decode
import gleam/result

pub fn deserialize(bit_array: BitArray) {
  use #(teleport_id, _) <- result.try(decode.var_int(bit_array))
  Ok(teleport_id)
}
