import betamine/decoder
import glisten.{type Message as GlistenMessage, Packet as GlistenPacket}

pub type Packet {
  Packet(id: Int, length: Int, data: BitArray)
}

pub fn parse_packet(message: GlistenMessage(String)) -> Packet {
  let assert GlistenPacket(bit_array) = message
  let assert Ok(#(length, bit_array)) = decoder.var_int(bit_array)
  let assert Ok(#(id, bit_array)) = decoder.var_int(bit_array)
  Packet(id, length, bit_array)
}
