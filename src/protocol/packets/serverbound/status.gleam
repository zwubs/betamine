import betamine/decoder
import gleam/result

pub type Packet {
  Status
  Ping(PingPacket)
}

pub type PingPacket {
  PingPacket(id: Int)
}

pub fn decode(id: Int, data: BitArray) -> Result(Packet, Nil) {
  let packet = case id {
    0x00 -> Ok(Status)
    0x01 -> decode_ping(data)
    _ -> todo
  }
}

pub fn decode_ping(bit_array: BitArray) {
  use #(id, _) <- result.try(decoder.long(bit_array))
  Ok(Ping(PingPacket(id)))
}
