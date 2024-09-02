import betamine/common/rotation.{type Rotation, Rotation}
import betamine/common/vector3.{type Vector3, Vector3}
import betamine/protocol/common/chat_mode
import betamine/protocol/common/handedness
import betamine/protocol/decoder
import betamine/protocol/error.{InvalidPacket, UnhandledPacket}
import betamine/protocol/phase
import gleam/io
import gleam/result

pub type Packet {
  Handshake(HandshakePacket)
  StatusRequest
  StatusPing(PingPacket)
  LoginStart(LoginStartPacket)
  LoginAcknowledged
  ClientInformation(ClientInformationPacket)
  Plugin(PluginPacket)
  AcknowledgeFinishConfiguration
  KnownDataPacks(KnownDataPacksPacket)
  ConfirmTeleport(ConfirmTeleportPacket)
  KeepAlive(KeepAlivePacket)
  PlayerPosition(PlayerPositionPacket)
  PlayerPositionAndRotation(PlayerPositionAndRotationPacket)
  PlayerRotation(PlayerRotationPacket)
}

pub fn decode(
  phase: phase.Phase,
  id: Int,
  data: BitArray,
) -> Result(Packet, error.ProtocolError) {
  case phase {
    phase.Handshaking -> {
      case id {
        0x00 -> decode_handshake(data)
        _ -> Error(InvalidPacket(phase, id))
      }
    }
    phase.Status -> {
      case id {
        0x00 -> Ok(StatusRequest)
        0x01 -> decode_ping(data, StatusPing)
        _ -> Error(InvalidPacket(phase, id))
      }
    }
    phase.Login -> {
      case id {
        0x00 -> decode_login_start(data)
        0x03 -> Ok(LoginAcknowledged)
        _ -> Error(InvalidPacket(phase, id))
      }
    }
    phase.Configuration -> {
      case id {
        0x00 -> decode_client_information(data)
        0x02 -> decode_plugin(data)
        0x03 -> Ok(AcknowledgeFinishConfiguration)
        0x07 -> {
          decode_known_data_packs(data)
          |> result.map(KnownDataPacks)
        }
        _ -> Error(InvalidPacket(phase, id))
      }
    }
    phase.Play -> {
      case id {
        0x00 -> decode_confirm_teleport(data)
        0x18 -> decode_keep_alive(data)
        0x1A -> decode_player_position(data)
        0x1B -> decode_player_position_and_rotation(data)
        0x1C -> decode_player_rotation(data)
        _ -> Error(InvalidPacket(phase, id))
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
  use #(next_phase, _) <- result.try(decoder.var_int(bit_array))
  Ok(Handshake(HandshakePacket(protocol_version, address, port, next_phase)))
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

fn decode_known_data_packs(bit_array: BitArray) {
  use #(length, bit_array) <- result.try(decoder.var_int(bit_array))
  use #(data_packs, _) <- result.try(decoder.array(
    bit_array,
    decode_known_data_pack,
    length,
  ))
  Ok(KnownDataPacksPacket(data_packs))
}

pub type KnownDataPacksPacket {
  KnownDataPacksPacket(data_packs: List(KnownDataPack))
}

fn decode_known_data_pack(bit_array: BitArray) {
  use #(namespace, bit_array) <- result.try(decoder.string(bit_array))
  use #(id, bit_array) <- result.try(decoder.string(bit_array))
  use #(version, bit_array) <- result.try(decoder.string(bit_array))
  Ok(#(KnownDataPack(namespace, id, version), bit_array))
}

pub type ConfirmTeleportPacket {
  ConfirmTeleportPacket(id: Int)
}

pub fn decode_confirm_teleport(data: BitArray) {
  use #(id, _) <- result.try(decoder.var_int(data))
  Ok(ConfirmTeleport(ConfirmTeleportPacket(id)))
}

pub type KeepAlivePacket {
  KeepAlivePacket(id: Int)
}

pub fn decode_keep_alive(data: BitArray) {
  use #(id, _) <- result.try(decoder.var_int(data))
  Ok(KeepAlive(KeepAlivePacket(id)))
}

pub type PlayerPositionPacket {
  PlayerPositionPacket(position: Vector3(Float), on_ground: Bool)
}

pub fn decode_player_position(data: BitArray) {
  use #(x, data) <- result.try(decoder.double(data))
  use #(y, data) <- result.try(decoder.double(data))
  use #(z, data) <- result.try(decoder.double(data))
  let position = Vector3(x, y, z)
  use #(on_ground, _) <- result.try(decoder.boolean(data))
  Ok(PlayerPosition(PlayerPositionPacket(position, on_ground)))
}

pub type PlayerPositionAndRotationPacket {
  PlayerPositionAndRotationPacket(
    position: Vector3(Float),
    rotation: Rotation,
    on_ground: Bool,
  )
}

pub fn decode_player_position_and_rotation(data: BitArray) {
  use #(x, data) <- result.try(decoder.double(data))
  use #(y, data) <- result.try(decoder.double(data))
  use #(z, data) <- result.try(decoder.double(data))
  let position = Vector3(x, y, z)
  use #(yaw, data) <- result.try(decoder.float(data))
  use #(pitch, data) <- result.try(decoder.float(data))
  let rotation = Rotation(pitch, yaw)
  use #(on_ground, _) <- result.try(decoder.boolean(data))
  Ok(
    PlayerPositionAndRotation(PlayerPositionAndRotationPacket(
      position,
      rotation,
      on_ground,
    )),
  )
}

pub type PlayerRotationPacket {
  PlayerRotationPacket(rotation: Rotation, on_ground: Bool)
}

pub fn decode_player_rotation(data: BitArray) {
  use #(yaw, data) <- result.try(decoder.float(data))
  use #(pitch, data) <- result.try(decoder.float(data))
  let rotation = Rotation(pitch, yaw)
  use #(on_ground, _) <- result.try(decoder.boolean(data))
  Ok(PlayerRotation(PlayerRotationPacket(rotation, on_ground)))
}
