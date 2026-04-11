import betamine/client/protocol/decoder
import betamine/client/protocol/encoder
import betamine/client/protocol/error
import betamine/common/chat/chat_mode
import betamine/common/entity/entity_handedness
import betamine/common/entity/player/player_model_customization
import betamine/common/identifier
import betamine/common/particle_status
import betamine/common/text_component
import gleam/bytes_tree
import gleam/list
import gleam/result

pub type Serverbound {
  ServerboundClientInformation(
    locale: String,
    view_distance: Int,
    chat_mode: chat_mode.ChatMode,
    chat_colors: Bool,
    model_customizations: player_model_customization.PlayerModelCustomization,
    main_hand: entity_handedness.EntityHandedness,
    text_filtering_enabled: Bool,
    allows_listing: Bool,
    particle_status: particle_status.ParticleStatus,
  )
  ServerboundCookieResponse
  ServerboundCustomPayload
  ServerboundFinishConfiguration
  ServerboundKeepAlive
  ServerboundPong
  ServerboundResourcePack
  ServerboundSelectKnownPacks
  ServerboundCustomClickAction
  ServerboundAcceptCodeOfConduct
}

pub fn decode(
  id: Int,
  bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  case id {
    0 -> decode_client_information(bit_array)
    1 -> decode_cookie_response(bit_array)
    2 -> decode_custom_payload(bit_array)
    3 -> decode_finish_configuration(bit_array)
    4 -> decode_keep_alive(bit_array)
    5 -> decode_pong(bit_array)
    6 -> decode_resource_pack(bit_array)
    7 -> decode_select_known_packs(bit_array)
    8 -> decode_custom_click_action(bit_array)
    9 -> decode_accept_code_of_conduct(bit_array)
    _ -> Error(error.InvalidPacketId(id))
  }
}

fn decode_client_information(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  use #(locale, bit_array) <- result.try(decoder.string(bit_array))
  use #(view_distance, bit_array) <- result.try(decoder.byte(bit_array))
  use #(chat_mode, bit_array) <- result.try(chat_mode.decode(bit_array))
  use #(chat_colors, bit_array) <- result.try(decoder.boolean(bit_array))
  use #(model_customizations, bit_array) <- result.try(decoder.unsigned_byte(
    bit_array,
  ))
  let model_customizations =
    player_model_customization.from_int(model_customizations)
  use #(main_hand, bit_array) <- result.try({
    use #(main_hand, _) <- result.try(decoder.var_int(bit_array))
    result.map(entity_handedness.from_int(main_hand), fn(hand) {
      #(hand, bit_array)
    })
  })
  use #(text_filtering_enabled, bit_array) <- result.try(decoder.boolean(
    bit_array,
  ))
  use #(allows_listing, bit_array) <- result.try(decoder.boolean(bit_array))
  use particle_status <- result.try({
    use #(particle_status, _) <- result.try(decoder.var_int(bit_array))
    particle_status.from_int(particle_status)
  })
  Ok(ServerboundClientInformation(
    locale,
    view_distance,
    chat_mode,
    chat_colors,
    model_customizations,
    main_hand,
    text_filtering_enabled,
    allows_listing,
    particle_status,
  ))
}

fn decode_cookie_response(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundCookieResponse)
}

fn decode_custom_payload(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundCustomPayload)
}

fn decode_finish_configuration(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundFinishConfiguration)
}

fn decode_keep_alive(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundKeepAlive)
}

fn decode_pong(_bit_array: BitArray) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundPong)
}

fn decode_resource_pack(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundResourcePack)
}

fn decode_select_known_packs(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundSelectKnownPacks)
}

fn decode_custom_click_action(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundCustomClickAction)
}

fn decode_accept_code_of_conduct(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundAcceptCodeOfConduct)
}

pub type Clientbound {
  ClientboundCookieRequest
  ClientboundCustomPayload(identifier: identifier.Identifier, data: BitArray)
  ClientboundDisconnect(reason: text_component.TextComponent)
  ClientboundFinishConfiguration
  ClientboundKeepAlive(id: Int)
  ClientboundPing(id: Int)
  ClientboundResetChat
  ClientboundRegistryData
  ClientboundResourcePackPop
  ClientboundResourcePackPush
  ClientboundStoreCookie
  ClientboundTransfer
  ClientboundUpdateEnabledFeatures
  ClientboundUpdateTags
  ClientboundSelectKnownPacks
  ClientboundCustomReportDetails
  ClientboundServerLinks
  ClientboundClearDialog
  ClientboundShowDialog
  ClientboundCodeOfConduct
}

pub fn clientbound_packet_id(packet: Clientbound) -> Int {
  case packet {
    ClientboundCookieRequest(..) -> 0
    ClientboundCustomPayload(..) -> 1
    ClientboundDisconnect(..) -> 2
    ClientboundFinishConfiguration(..) -> 3
    ClientboundKeepAlive(..) -> 4
    ClientboundPing(..) -> 5
    ClientboundResetChat(..) -> 6
    ClientboundRegistryData(..) -> 7
    ClientboundResourcePackPop(..) -> 8
    ClientboundResourcePackPush(..) -> 9
    ClientboundStoreCookie(..) -> 10
    ClientboundTransfer(..) -> 11
    ClientboundUpdateEnabledFeatures(..) -> 12
    ClientboundUpdateTags(..) -> 13
    ClientboundSelectKnownPacks(..) -> 14
    ClientboundCustomReportDetails(..) -> 15
    ClientboundServerLinks(..) -> 16
    ClientboundClearDialog(..) -> 17
    ClientboundShowDialog(..) -> 18
    ClientboundCodeOfConduct(..) -> 19
  }
}

pub fn encode(packet: Clientbound) -> bytes_tree.BytesTree {
  case packet {
    ClientboundCookieRequest(..) -> []
    ClientboundCustomPayload(..) -> []
    ClientboundDisconnect(..) -> [
      encoder.nbt(text_component.to_nbt(packet.reason)),
    ]
    ClientboundFinishConfiguration(..) -> []
    ClientboundKeepAlive(..) -> [encoder.long(packet.id)]
    ClientboundPing(..) -> [encoder.int(packet.id)]
    ClientboundResetChat(..) -> []
    ClientboundRegistryData(..) -> []
    ClientboundResourcePackPop(..) -> []
    ClientboundResourcePackPush(..) -> []
    ClientboundStoreCookie(..) -> []
    ClientboundTransfer(..) -> []
    ClientboundUpdateEnabledFeatures(..) -> []
    ClientboundUpdateTags(..) -> []
    ClientboundSelectKnownPacks(..) -> []
    ClientboundCustomReportDetails(..) -> []
    ClientboundServerLinks(..) -> []
    ClientboundClearDialog(..) -> []
    ClientboundShowDialog(..) -> []
    ClientboundCodeOfConduct(..) -> []
  }
  |> list.fold(bytes_tree.new(), bytes_tree.append)
}
