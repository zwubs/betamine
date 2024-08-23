import betamine/decoder
import gleam/result

pub type Packet {
  Login(name: String, uuid: Int)
  Acknowledged
}

pub fn decode(id: Int, data: BitArray) -> Result(Packet, Nil) {
  case id {
    0x00 -> decode_login(data)
    0x03 -> Ok(Acknowledged)
    _ -> todo
  }
}

pub fn decode_login(bit_array: BitArray) {
  use #(name, bit_array) <- result.try(decoder.string(bit_array))
  use #(uuid, _) <- result.try(decoder.uuid(bit_array))
  Ok(Login(name, uuid))
}
