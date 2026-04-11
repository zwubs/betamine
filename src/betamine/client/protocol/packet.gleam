import betamine/client/protocol/decoder
import betamine/client/protocol/encoder
import betamine/client/protocol/error
import betamine/client/protocol/packet/configuration
import betamine/client/protocol/packet/handshake
import betamine/client/protocol/packet/login
import betamine/client/protocol/packet/play
import betamine/client/protocol/packet/status
import betamine/client/protocol/phase
import gleam/bytes_tree
import gleam/result

pub type Serverbound {
  HandshakeServerbound(handshake.Serverbound)
  StatusServerbound(status.Serverbound)
  LoginServerbound(login.Serverbound)
  ConfigurationServerbound(configuration.Serverbound)
  PlayServerbound(play.Serverbound)
}

pub fn decode(phase: phase.Phase, bit_array: BitArray) {
  use #(id, bit_array) <- result.try(
    decoder.var_int(bit_array)
    |> result.map_error(error.InvalidPacket(phase, _)),
  )
  case phase {
    phase.Handshake ->
      result.map(handshake.decode(id, bit_array), HandshakeServerbound)
    phase.Status -> result.map(status.decode(id, bit_array), StatusServerbound)
    phase.Login -> result.map(login.decode(id, bit_array), LoginServerbound)
    phase.Configuration ->
      result.map(configuration.decode(id, bit_array), ConfigurationServerbound)
    phase.Play -> result.map(play.decode(id, bit_array), PlayServerbound)
  }
  |> result.map_error(error.UnableToDecodePacket(phase, id, _))
}

pub type Clientbound {
  StatusClientbound(status.Clientbound)
  LoginClientbound(login.Clientbound)
  ConfigurationClientbound(configuration.Clientbound)
  PlayClientbound(play.Clientbound)
}

pub fn encode(packet: Clientbound) -> bytes_tree.BytesTree {
  case packet {
    StatusClientbound(packet) -> encode_status(packet)
    LoginClientbound(packet) -> encode_login(packet)
    ConfigurationClientbound(packet) -> encode_configuration(packet)
    PlayClientbound(packet) -> encode_play(packet)
  }
}

pub fn encode_status(packet: status.Clientbound) {
  encoder.var_int(status.clientbound_packet_id(packet))
  |> bytes_tree.prepend(status.encode(packet), _)
}

pub fn encode_login(packet: login.Clientbound) {
  encoder.var_int(login.clientbound_packet_id(packet))
  |> bytes_tree.prepend(login.encode(packet), _)
}

pub fn encode_configuration(packet: configuration.Clientbound) {
  encoder.var_int(configuration.clientbound_packet_id(packet))
  |> bytes_tree.prepend(configuration.encode(packet), _)
}

pub fn encode_play(packet: play.Clientbound) {
  encoder.var_int(play.clientbound_packet_id(packet))
  |> bytes_tree.prepend(play.encode(packet), _)
}
