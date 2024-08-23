import betamine/decoder as decode
import betamine/protocol/phase
import protocol/packets/serverbound

pub fn decode_serverbound(phase: phase.Phase, data: BitArray) {
  let assert Ok(#(_length, data)) = decode.var_int(data)
  // TODO: Add check for accurate length
  let assert Ok(#(id, data)) = decode.var_int(data)
  serverbound.decode(phase, id, data)
}
