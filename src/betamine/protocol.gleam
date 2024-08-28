import betamine/decoder as decode
import betamine/encoder as encode
import betamine/protocol/phase
import gleam/bytes_builder
import protocol/packets/clientbound
import protocol/packets/serverbound

pub fn decode_serverbound(phase: phase.Phase, data: BitArray) {
  let assert Ok(#(_length, data)) = decode.var_int(data)
  // TODO: Add check for accurate length
  let assert Ok(#(id, data)) = decode.var_int(data)
  serverbound.decode(phase, id, data)
}

pub fn encode_clientbound(packet: clientbound.Packet) {
  let builder = clientbound.encode(packet)
  let size =
    bytes_builder.new()
    |> encode.var_int(bytes_builder.byte_size(builder))
  bytes_builder.prepend_builder(builder, size)
}
