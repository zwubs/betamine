import betamine/protocol/phase

pub type ProtocolError {
  UnhandledPacket(phase.Phase, Int)
  InvalidPacket(phase.Phase, Int)
  InvalidByteRange(data: BitArray, byte_count: Int)
  InvalidVarInt
  InvalidString(data: BitArray)
  InvalidBoolean
  EndOfData
  InvalidEnumValue(min: Int, max: Int, value: Int)
}
