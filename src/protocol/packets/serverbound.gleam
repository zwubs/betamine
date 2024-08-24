import betamine/common/position.{type Position, Position}
import betamine/common/rotation.{type Rotation, Rotation}
import betamine/protocol/phase
import gleam/result
import protocol/common/chat_mode
import protocol/common/handedness
import protocol/decoder

pub type Packet {
  Handshake(HandshakePacket)
  StatusRequest
  StatusPing(PingPacket)
  LoginStart(LoginStartPacket)
  LoginAcknowledged
  ClientInformation(ClientInformationPacket)
  Plugin(PluginPacket)
  AcknowledgeFinish
  KnownDataPacks(KnownDataPacksPacket)
  ConfirmTeleport(id: Int)
  KeepAlive(id: Int)
  PlayerPosition(position: Position, on_ground: Bool)
  PlayerPositionAndRotation(
    position: Position,
    rotation: Rotation,
    on_ground: Bool,
  )
  PlayerRotation(rotation: Rotation, on_ground: Bool)
}

pub fn decode(
  phase: phase.Phase,
  id: Int,
  data: BitArray,
) -> Result(Packet, Nil) {
  case phase {
    phase.Handshaking -> {
      case id {
        0x00 -> decode_handshake(data)
        _ -> Error(Nil)
      }
    }
    phase.Status -> {
      case id {
        0x00 -> Ok(StatusRequest)
        0x01 -> decode_ping(data, StatusPing)
        _ -> Error(Nil)
      }
    }
    phase.Login -> {
      case id {
        0x00 -> decode_login_start(data)
        0x03 -> Ok(LoginAcknowledged)
        _ -> Error(Nil)
      }
    }
    phase.Configuration -> {
      case id {
        0x00 -> decode_client_information(data)
        0x02 -> decode_plugin(data)
        0x03 -> Ok(AcknowledgeFinish)
        0x07 -> decode_known_data_packs(data)
        _ -> Error(Nil)
      }
    }
    phase.Play -> {
      case id {
        0x00 -> decode_confirm_teleport(data)
        0x18 -> decode_keep_alive(data)
        0x1A -> decode_player_position(data)
        0x1B -> decode_player_position_and_rotation(data)
        0x1C -> decode_player_rotation(data)
        _ -> Error(Nil)
      }
    }
  }
}

pub type HandshakePacket {
  HandshakePacket(
    protocol_version: Int,
    address: String,
    port: Int,
    next_phase: Int,
  )
}

pub fn decode_handshake(bit_array: BitArray) {
  use #(protocol_version, bit_array) <- result.try(decoder.var_int(bit_array))
  use #(address, bit_array) <- result.try(decoder.string(bit_array))
  use #(port, bit_array) <- result.try(decoder.unsigned_short(bit_array))
  use #(next_state, _) <- result.try(decoder.var_int(bit_array))
  Ok(Handshake(HandshakePacket(protocol_version, address, port, next_state)))
}

pub type PingPacket {
  PingPacket(id: Int)
}

pub fn decode_ping(bit_array: BitArray, wrapper: fn(PingPacket) -> Packet) {
  use #(id, _) <- result.try(decoder.long(bit_array))
  Ok(wrapper(PingPacket(id)))
}

pub type LoginStartPacket {
  LoginStartPacket(name: String, uuid: Int)
}

pub fn decode_login_start(bit_array: BitArray) {
  use #(name, bit_array) <- result.try(decoder.string(bit_array))
  use #(uuid, _) <- result.try(decoder.uuid(bit_array))
  Ok(LoginStart(LoginStartPacket(name, uuid)))
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

pub type KnownDataPack {
  KnownDataPack(namespace: String, id: String, version: String)
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

pub fn decode_confirm_teleport(data: BitArray) {
  use #(id, _) <- result.try(decoder.var_int(data))
  Ok(ConfirmTeleport(id))
}

pub fn decode_keep_alive(data: BitArray) {
  use #(id, _) <- result.try(decoder.var_int(data))
  Ok(KeepAlive(id))
}

pub fn decode_player_position(data: BitArray) {
  use #(x, data) <- result.try(decoder.double(data))
  use #(y, data) <- result.try(decoder.double(data))
  use #(z, data) <- result.try(decoder.double(data))
  let position = position.Position(x, y, z)
  use #(on_ground, _) <- result.try(decoder.boolean(data))
  Ok(PlayerPosition(position, on_ground))
}

pub fn decode_player_position_and_rotation(data: BitArray) {
  use #(x, data) <- result.try(decoder.double(data))
  use #(y, data) <- result.try(decoder.double(data))
  use #(z, data) <- result.try(decoder.double(data))
  let position = Position(x, y, z)
  use #(yaw, data) <- result.try(decoder.float(data))
  use #(pitch, data) <- result.try(decoder.float(data))
  let rotation = Rotation(pitch, yaw)
  use #(on_ground, _) <- result.try(decoder.boolean(data))
  Ok(PlayerPositionAndRotation(position, rotation, on_ground))
}

pub fn decode_player_rotation(data: BitArray) {
  use #(yaw, data) <- result.try(decoder.float(data))
  use #(pitch, data) <- result.try(decoder.float(data))
  let rotation = Rotation(pitch, yaw)
  use #(on_ground, _) <- result.try(decoder.boolean(data))
  Ok(PlayerRotation(rotation, on_ground))
}
