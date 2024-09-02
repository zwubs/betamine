import betamine/protocol/decoder
import betamine/protocol/error.{type ProtocolError}
import gleam/result

pub type ChatMode {
  Enabled
  CommandsOnly
  Hidden
}

pub fn decode(
  bit_array: BitArray,
) -> Result(#(ChatMode, BitArray), ProtocolError) {
  use #(chat_mode, bit_array) <- result.try(decoder.var_int(bit_array))
  case chat_mode {
    0 -> Ok(#(Enabled, bit_array))
    1 -> Ok(#(CommandsOnly, bit_array))
    2 -> Ok(#(Hidden, bit_array))
    _ -> Error(error.InvalidEnumValue(min: 0, max: 2, value: chat_mode))
  }
}
