import betamine/common/chat/chat_mode
import betamine/common/client_information
import betamine/common/entity/entity_hand
import betamine/common/entity/entity_handedness
import betamine/common/entity/player/player_command_action
import betamine/common/entity/player/player_interaction
import betamine/common/entity/player/player_model_customization
import betamine/common/math/vector3.{type Vector3, Vector3}
import betamine/common/particle_status
import betamine/common/rotation.{type Rotation, Rotation}
import betamine/common/uuid
import betamine/protocol/common
import betamine/protocol/decoder
import betamine/protocol/error
import betamine/protocol/phase
import gleam/result

pub type Packet {
  Handshake(HandshakePacket)
  StatusRequest
  StatusPing(PingPacket)
  LoginStart(LoginStartPacket)
  LoginAcknowledged
  ClientInformation(client_information.ClientInformation)
  Plugin(PluginPacket)
  AcknowledgeFinishConfiguration
  KnownDataPacks(KnownDataPacksPacket)
  ConfirmTeleport(ConfirmTeleportPacket)
  ClientTickEnd
  Interact(InteractPacket)
  KeepAlive(KeepAlivePacket)
  PlayerPosition(position: Vector3(Float), on_ground: Bool, against_wall: Bool)
  PlayerPositionAndRotation(
    position: Vector3(Float),
    rotation: Rotation,
    on_ground: Bool,
    against_wall: Bool,
  )
  PlayerRotation(rotation: Rotation, on_ground: Bool, against_wall: Bool)
  PlayerCommand(PlayerCommandPacket)
  PlayerInput(PlayerInputPacket)
  PlayerLoaded
  SwingArm(SwingArmPacket)
}

pub fn decode(
  phase: phase.Phase,
  id: Int,
  data: BitArray,
) -> Result(Packet, error.ProtocolError) {
  case phase {
    phase.Handshaking -> {
      case id {
        0 -> decode_handshake(data)
        _ -> Error(error.InvalidPacket)
      }
    }
    phase.Status -> {
      case id {
        0 -> Ok(StatusRequest)
        1 -> decode_ping(data, StatusPing)
        _ -> Error(error.InvalidPacket)
      }
    }
    phase.Login -> {
      case id {
        0 -> decode_login_start(data)
        3 -> Ok(LoginAcknowledged)
        id if id <= 4 -> Error(error.UnhandledPacket)
        _ -> Error(error.InvalidPacket)
      }
    }
    phase.Configuration -> {
      case id {
        0 -> decode_client_information(data)
        2 -> decode_plugin(data)
        3 -> Ok(AcknowledgeFinishConfiguration)
        7 -> {
          decode_known_data_packs(data)
          |> result.map(KnownDataPacks)
        }
        id if id <= 7 -> Error(error.UnhandledPacket)
        _ -> Error(error.InvalidPacket)
      }
    }
    phase.Play -> {
      case id {
        00 -> decode_confirm_teleport(data)
        12 -> Ok(ClientTickEnd)
        13 -> decode_client_information(data)
        25 -> decode_interact(data)
        27 -> decode_keep_alive(data)
        29 -> decode_player_position(data)
        30 -> decode_player_position_and_rotation(data)
        31 -> decode_player_rotation(data)
        41 -> decode_player_command(data)
        42 -> decode_player_input(data)
        43 -> Ok(PlayerLoaded)
        60 -> decode_swing_arm(data)
        id if id <= 63 -> Error(error.UnhandledPacket)
        _ -> Error(error.InvalidPacket)
      }
    }
  }
  |> result.map_error(error.DecodeError(phase, id, _))
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
  LoginStartPacket(name: String, uuid: uuid.Uuid)
}

pub fn decode_login_start(bit_array: BitArray) {
  use #(name, bit_array) <- result.try(decoder.string(bit_array))
  use #(uuid, _) <- result.try(common.decode_uuid(bit_array))
  Ok(LoginStart(LoginStartPacket(name, uuid)))
}

pub fn decode_client_information(bit_array: BitArray) {
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
    use #(main_hand, bit_array) <- result.try(decoder.var_int(bit_array))
    result.map(entity_handedness.from_int(main_hand), fn(hand) {
      #(hand, bit_array)
    })
  })
  use #(text_filtering_enabled, bit_array) <- result.try(decoder.boolean(
    bit_array,
  ))
  use #(allows_listing, bit_array) <- result.try(decoder.boolean(bit_array))
  use #(particle_status, _) <- result.try({
    use #(particle_status, _) <- result.try({ decoder.var_int(bit_array) })
    result.map(particle_status.from_int(particle_status), fn(hand) {
      #(hand, bit_array)
    })
  })
  Ok(
    ClientInformation(client_information.ClientInformation(
      locale,
      view_distance,
      chat_mode,
      chat_colors,
      model_customizations,
      main_hand,
      text_filtering_enabled,
      allows_listing,
      particle_status,
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

pub type InteractPacket {
  InteractPacket(
    entity_id: Int,
    interaction: player_interaction.PlayerInteraction,
    sneaking: Bool,
  )
}

pub fn decode_interact(data: BitArray) {
  use #(entity_id, data) <- result.try(decoder.var_int(data))
  use #(interaction, data) <- result.try(player_interaction.decode(data))
  use #(sneaking, _) <- result.try(decoder.boolean(data))
  Ok(Interact(InteractPacket(entity_id, interaction, sneaking)))
}

pub type KeepAlivePacket {
  KeepAlivePacket(id: Int)
}

pub fn decode_keep_alive(data: BitArray) {
  use #(id, _) <- result.try(decoder.var_int(data))
  Ok(KeepAlive(KeepAlivePacket(id)))
}

type PlayerMovementFlags {
  PlayerMovementFlags(on_ground: Bool, against_wall: Bool)
}

fn decode_player_movement_flags(data: BitArray) {
  use #(flags, _) <- result.try(decoder.bytes_of_length(data, 1))
  case flags {
    <<_:6-int, on_ground:1-int, against_wall:1-int>> ->
      Ok(#(PlayerMovementFlags(on_ground == 1, against_wall == 1), data))
    _ -> Error(error.EndOfData)
  }
}

pub type PlayerPositionPacket {
  PlayerPositionPacket(
    position: Vector3(Float),
    on_ground: Bool,
    against_wall: Bool,
  )
}

pub fn decode_player_position(data: BitArray) {
  use #(x, data) <- result.try(decoder.double(data))
  use #(y, data) <- result.try(decoder.double(data))
  use #(z, data) <- result.try(decoder.double(data))
  let position = Vector3(x, y, z)
  use #(flags, _) <- result.try(decode_player_movement_flags(data))
  Ok(PlayerPosition(position, flags.on_ground, flags.against_wall))
}

pub type PlayerPositionAndRotationPacket {
  PlayerPositionAndRotationPacket(
    position: Vector3(Float),
    rotation: Rotation,
    on_ground: Bool,
    against_wall: Bool,
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
  use #(flags, _) <- result.try(decode_player_movement_flags(data))
  Ok(PlayerPositionAndRotation(
    position,
    rotation,
    flags.on_ground,
    flags.against_wall,
  ))
}

pub type PlayerRotationPacket {
  PlayerRotationPacket(rotation: Rotation, on_ground: Bool, against_wall: Bool)
}

pub fn decode_player_rotation(data: BitArray) {
  use #(yaw, data) <- result.try(decoder.float(data))
  use #(pitch, data) <- result.try(decoder.float(data))
  let rotation = Rotation(pitch, yaw)
  use #(flags, _) <- result.try(decode_player_movement_flags(data))
  Ok(PlayerRotation(rotation, flags.on_ground, flags.against_wall))
}

pub type PlayerCommandPacket {
  PlayerCommandPacket(
    entity_id: Int,
    action: player_command_action.PlayerCommandAction,
    jump_boost: Int,
  )
}

pub fn decode_player_command(data: BitArray) {
  use #(entity_id, data) <- result.try(decoder.var_int(data))
  use #(action, data) <- result.try(player_command_action.decode(data))
  use #(jump_boost, _) <- result.try(decoder.var_int(data))
  Ok(PlayerCommand(PlayerCommandPacket(entity_id, action, jump_boost)))
}

pub type PlayerInputPacket {
  PlayerInputPacket(
    forward: Bool,
    backward: Bool,
    left: Bool,
    right: Bool,
    jump: Bool,
    sneak: Bool,
    sprint: Bool,
  )
}

pub fn decode_player_input(data: BitArray) {
  use #(flags, _) <- result.try(decoder.bytes_of_length(data, 1))
  case flags {
    <<
      0:int-size(1),
      sprint:int-size(1),
      sneak:int-size(1),
      jump:int-size(1),
      right:int-size(1),
      left:int-size(1),
      backward:int-size(1),
      forward:int-size(1),
    >> ->
      Ok(
        PlayerInput(PlayerInputPacket(
          forward == 1,
          backward == 1,
          left == 1,
          right == 1,
          jump == 1,
          sneak == 1,
          sprint == 1,
        )),
      )
    _ -> Error(error.EndOfData)
  }
}

pub type SwingArmPacket {
  SwingArmPacket(hand: entity_hand.EntityHand)
}

pub fn decode_swing_arm(data: BitArray) {
  use #(hand, _) <- result.try(entity_hand.decode(data))
  Ok(SwingArm(SwingArmPacket(hand)))
}
