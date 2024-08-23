import betamine/decoder
import gleam/result
import protocol/common/chat_mode
import protocol/common/handedness

pub type KnownDataPack {
  KnownDataPack(namespace: String, id: String, version: String)
}

pub type Packet {
  ClientInformation(ClientInformationPacket)
  Plugin(PluginPacket)
  AcknowledgeFinish
  KnownDataPacks(KnownDataPacksPacket)
}

pub fn decode(id: Int, data: BitArray) -> Result(Packet, Nil) {
  case id {
    0x00 -> decode_client_information(data)
    0x02 -> decode_plugin(data)
    0x03 -> Ok(AcknowledgeFinish)
    0x07 -> decode_known_data_packs(data)
    _ -> todo
  }
}

pub type ClientInformationPacket {
  ClientInformationPacket(
    locale: String,
    view_distance: Int,
    chat_mode: chat_mode.ChatMode,
    chat_colors: Bool,
    model_customizations: Int,
    main_hand: handedness.Handedness,
    text_filtering_enabled: Bool,
    allow_server_listings: Bool,
  )
}

pub fn decode_client_information(bit_array: BitArray) {
  use #(locale, bit_array) <- result.try(decoder.string(bit_array))
  use #(view_distance, bit_array) <- result.try(decoder.byte(bit_array))
  use #(chat_mode, bit_array) <- result.try(chat_mode.decode(bit_array))
  use #(chat_colors, bit_array) <- result.try(decoder.boolean(bit_array))
  use #(model_customizations, bit_array) <- result.try(decoder.unsigned_byte(
    bit_array,
  ))
  use #(main_hand, bit_array) <- result.try(handedness.decode(bit_array))
  use #(text_filtering_enabled, bit_array) <- result.try(decoder.boolean(
    bit_array,
  ))
  use #(allow_server_listings, _) <- result.try(decoder.boolean(bit_array))
  Ok(
    ClientInformation(ClientInformationPacket(
      locale,
      view_distance,
      chat_mode,
      chat_colors,
      model_customizations,
      main_hand,
      text_filtering_enabled,
      allow_server_listings,
    )),
  )
}

pub type PluginPacket {
  PluginPacket(channel: String, implementation: String)
}

pub fn decode_plugin(bit_array: BitArray) {
  use #(channel, bit_array) <- result.try(decoder.string(bit_array))
  use #(implementation, _) <- result.try(decoder.string(bit_array))
  Ok(Plugin(PluginPacket(channel, implementation)))
}

pub type KnownDataPacksPacket {
  KnownDataPacksPacket(data_packs: List(KnownDataPack))
}

pub fn decode_known_data_packs(bit_array: BitArray) {
  use #(length, bit_array) <- result.try(decoder.var_int(bit_array))
  use #(data_packs, _) <- result.try(decoder.array(
    bit_array,
    decode_known_data_pack,
    length,
  ))
  Ok(KnownDataPacks(KnownDataPacksPacket(data_packs)))
}

pub fn decode_known_data_pack(
  bit_array: BitArray,
) -> Result(#(KnownDataPack, BitArray), Nil) {
  use #(namespace, bit_array) <- result.try(decoder.string(bit_array))
  use #(id, bit_array) <- result.try(decoder.string(bit_array))
  use #(version, bit_array) <- result.try(decoder.string(bit_array))
  let known_pack = KnownDataPack(namespace, id, version)
  Ok(#(known_pack, bit_array))
}
