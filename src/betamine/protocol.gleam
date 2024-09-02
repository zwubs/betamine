import betamine/protocol/decoder
import betamine/protocol/encoder
import betamine/protocol/packets/clientbound
import betamine/protocol/packets/serverbound
import betamine/protocol/phase
import gleam/bytes_builder
import gleam/int
import gleam/io
import gleam/string

pub fn decode_serverbound(phase: phase.Phase, data: BitArray) {
  let assert Ok(#(_length, data)) = decoder.var_int(data)
  // TODO: Add check for accurate length
  let assert Ok(#(id, data)) = decoder.var_int(data)
  io.debug(
    "Receiving Packet w/ Phase:"
    <> string.inspect(phase)
    <> ", Id: 0x"
    <> int.to_base16(id),
  )
  serverbound.decode(phase, id, data)
}

pub fn encode_clientbound(packet: clientbound.Packet) {
  let builder = clientbound.encode(packet)
  let size =
    bytes_builder.new()
    |> encoder.var_int(bytes_builder.byte_size(builder))
  bytes_builder.prepend_builder(builder, size)
}
