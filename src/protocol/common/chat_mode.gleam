import betamine/decoder
import gleam/result

pub type ChatMode {
  Enabled
  CommandsOnly
  Hidden
}

pub fn decode(bit_array: BitArray) -> Result(#(ChatMode, BitArray), Nil) {
  use #(chat_mode, bit_array) <- result.try(decoder.var_int(bit_array))
  case chat_mode {
    0 -> Ok(#(Enabled, bit_array))
    1 -> Ok(#(CommandsOnly, bit_array))
    2 -> Ok(#(Hidden, bit_array))
    _ -> Error(Nil)
  }
}
