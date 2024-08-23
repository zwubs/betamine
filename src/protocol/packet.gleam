import protocol/common/client_intention

pub type Packet {
  ServerboundIntent(
    protocol_version: Int,
    host_name: String,
    port: Int,
    intention: client_intention.Intention,
  )
}
