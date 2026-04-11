import betamine/client/protocol/phase
import gleam/string
import glisten

pub type Error {
  UnhandledError
  InvalidFrame
  SocketError(glisten.SocketReason)
  InvalidPacket(phase.Phase, DecodeError)
  UnableToDecodePacket(phase.Phase, Int, DecodeError)
  InvalidProtocolPhase(phase: phase.Phase)
}

pub type DecodeError {
  UnhandledPacket
  InvalidPhase(value: Int)
  InvalidPacketId(value: Int)
  InvalidPacketLength(length: Int)
  InvalidByteRange(data: BitArray, byte_count: Int)
  InvalidVarInt
  InvalidString(data: BitArray)
  InvalidUUID(data: BitArray)
  InvalidBoolean(value: Int)
  InvalidEnumValue(name: String, min: Int, max: Int, value: Int)
  EndOfData
}

pub fn to_string(error: Error) -> String {
  string.inspect(error)
}
