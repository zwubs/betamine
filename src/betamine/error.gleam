import glisten

pub type Error {
  FailedToSendPacket(glisten.SocketReason)
}
