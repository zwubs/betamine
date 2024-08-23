import betamine/protocol/phase
import gleam/result
import protocol/decoder
import protocol/packets/serverbound/configuration
import protocol/packets/serverbound/handshaking
import protocol/packets/serverbound/login
import protocol/packets/serverbound/play
import protocol/packets/serverbound/status

pub type Packet {
  Handshaking(HandshakingPacket)
  Status(status.Packet)
  Login(login.Packet)
  Configuration(configuration.Packet)
  Play(play.Packet)
}

pub type HandshakingPacket =
  handshaking.Packet

pub fn decode(
  phase: phase.Phase,
  id: Int,
  data: BitArray,
) -> Result(Packet, Nil) {
  case phase {
    phase.Handshaking -> {
      use packet <- result.try(decode_handshaking(id, data))
      Ok(Handshaking(packet))
    }
    phase.Status -> {
      use packet <- result.try(status.decode(id, data))
      Ok(Status(packet))
    }
    phase.Login -> {
      use packet <- result.try(login.decode(id, data))
      Ok(Login(packet))
    }
    phase.Configuration -> {
      use packet <- result.try(configuration.decode(id, data))
      Ok(Configuration(packet))
    }
    phase.Play -> {
      use packet <- result.try(play.decode(id, data))
      Ok(Play(packet))
    }
  }
}

pub fn decode_handshaking(
  id: Int,
  data: BitArray,
) -> Result(HandshakingPacket, Nil) {
  case id {
    0x00 -> decode_handshake(data)
    _ -> todo
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
