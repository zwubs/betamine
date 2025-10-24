import betamine/protocol/decoder
import betamine/protocol/encoder
import betamine/protocol/packets/clientbound
import betamine/protocol/packets/serverbound
import betamine/protocol/phase
import gleam/bytes_tree
import gleam/int
import gleam/string

pub fn decode_serverbound(phase: phase.Phase, data: BitArray) {
  let assert Ok(#(_length, data)) = decoder.var_int(data)
  // TODO: Add check for accurate length
  let assert Ok(#(id, data)) = decoder.var_int(data)
  serverbound.decode(phase, id, data)
}

pub fn encode_clientbound(packet: clientbound.Packet) {
  let tree = clientbound.encode(packet)
  let size =
    bytes_tree.new()
    |> encoder.var_int(bytes_tree.byte_size(tree))
  bytes_tree.prepend_tree(tree, size)
}
