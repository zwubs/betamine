import gleam/result
import glime/decoder as decode

pub type ChatMode {
  Enabled
  CommandsOnly
  Hidden
}

pub type Handedness {
  Right
  Left
}

pub type ClientInformation {
  ClientInformation(
    locale: String,
    view_distance: Int,
    chat_mode: ChatMode,
    chat_colors: Bool,
    model_customizations: Int,
    main_hand: Handedness,
    text_filtering_enabled: Bool,
    allow_server_listings: Bool,
  )
}

fn deserialize_chat_mode(
  bit_array: BitArray,
) -> Result(#(ChatMode, BitArray), Nil) {
  use #(chat_mode, bit_array) <- result.try(decode.var_int(bit_array))
  case chat_mode {
    0 -> Ok(#(Enabled, bit_array))
    1 -> Ok(#(CommandsOnly, bit_array))
    2 -> Ok(#(Hidden, bit_array))
    _ -> Error(Nil)
  }
}

fn deserialize_handedness(
  bit_array: BitArray,
) -> Result(#(Handedness, BitArray), Nil) {
  use #(handedness, bit_array) <- result.try(decode.var_int(bit_array))
  case handedness {
    0 -> Ok(#(Left, bit_array))
    1 -> Ok(#(Right, bit_array))
    _ -> Error(Nil)
  }
}

pub fn deserialize(bit_array: BitArray) {
  use #(locale, bit_array) <- result.try(decode.string(bit_array))
  use #(view_distance, bit_array) <- result.try(decode.byte(bit_array))
  use #(chat_mode, bit_array) <- result.try(deserialize_chat_mode(bit_array))
  use #(chat_colors, bit_array) <- result.try(decode.boolean(bit_array))
  use #(model_customizations, bit_array) <- result.try(decode.unsigned_byte(
    bit_array,
  ))
  use #(main_hand, bit_array) <- result.try(deserialize_handedness(bit_array))
  use #(text_filtering_enabled, bit_array) <- result.try(decode.boolean(
    bit_array,
  ))
  use #(allow_server_listings, _) <- result.try(decode.boolean(bit_array))
  Ok(ClientInformation(
    locale,
    view_distance,
    chat_mode,
    chat_colors,
    model_customizations,
    main_hand,
    text_filtering_enabled,
    allow_server_listings,
  ))
}
