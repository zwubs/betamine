import betamine/client/protocol/error
import gleam/bytes_tree
import gleam/list

pub type Serverbound {
  ServerboundHello
  ServerboundKey
  ServerboundCustomQueryAnswer
  ServerboundLoginAcknowledged
  ServerboundCookieResponse
}

pub fn decode(
  id: Int,
  bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  case id {
    0 -> decode_hello(bit_array)
    1 -> decode_key(bit_array)
    2 -> decode_custom_query_answer(bit_array)
    3 -> decode_login_acknowledged(bit_array)
    4 -> decode_cookie_response(bit_array)
    _ -> Error(error.InvalidPacketId(id))
  }
}

fn decode_hello(_bit_array: BitArray) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundHello)
}

fn decode_key(_bit_array: BitArray) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundKey)
}

fn decode_custom_query_answer(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundCustomQueryAnswer)
}

fn decode_login_acknowledged(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundLoginAcknowledged)
}

fn decode_cookie_response(
  _bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  Ok(ServerboundCookieResponse)
}

pub type Clientbound {
  ClientboundLoginDisconnect
  ClientboundHello
  ClientboundLoginFinished
  ClientboundLoginCompression
  ClientboundCustomQuery
  ClientboundCookieRequest
}

pub fn clientbound_packet_id(packet: Clientbound) -> Int {
  case packet {
    ClientboundLoginDisconnect -> 0
    ClientboundHello -> 1
    ClientboundLoginFinished -> 2
    ClientboundLoginCompression -> 3
    ClientboundCustomQuery -> 4
    ClientboundCookieRequest -> 5
  }
}

pub fn encode(packet: Clientbound) -> bytes_tree.BytesTree {
  case packet {
    ClientboundLoginDisconnect -> []
    ClientboundHello -> []
    ClientboundLoginFinished -> []
    ClientboundLoginCompression -> []
    ClientboundCustomQuery -> []
    ClientboundCookieRequest -> []
  }
  |> list.fold(bytes_tree.new(), bytes_tree.append)
}
