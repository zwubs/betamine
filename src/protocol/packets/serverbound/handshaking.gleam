import betamine/decoder
import gleam/result

pub type Packet {
  Handshake(HandshakePacket)
}

pub fn decode(id: Int, data: BitArray) -> Result(Packet, Nil) {
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
