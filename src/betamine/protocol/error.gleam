import betamine/protocol/phase

pub type ProtocolError {
  DecodeError(phase.Phase, Int, DecodeError)
}

pub type DecodeError {
  UnhandledPacket
  InvalidPacket
  InvalidByteRange(data: BitArray, byte_count: Int)
  InvalidVarInt
  InvalidString(data: BitArray)
  InvalidUUID(data: BitArray)
  InvalidBoolean(value: Int)
  InvalidEnumValue(name: String, min: Int, max: Int, value: Int)
  EndOfData
}
