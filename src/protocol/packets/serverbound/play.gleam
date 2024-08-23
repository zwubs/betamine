import betamine/common/position.{type Position, Position}
import betamine/common/rotation.{type Rotation, Rotation}
import betamine/decoder
import gleam/result

pub type Packet {
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

pub fn decode(id: Int, data: BitArray) -> Result(Packet, Nil) {
  case id {
    0x00 -> decode_confirm_teleport(data)
    0x18 -> decode_keep_alive(data)
    0x1A -> decode_player_position(data)
    0x1B -> decode_player_position_and_rotation(data)
    0x1C -> decode_player_rotation(data)
    _ -> todo
  }
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
