import betamine/protocol/phase
import gleam/result
import protocol/decoder
import protocol/packets/serverbound/configuration
import protocol/packets/serverbound/handshaking
import protocol/packets/serverbound/login
import protocol/packets/serverbound/play
import protocol/packets/serverbound/status

pub type Packet {
  Handshaking(handshaking.Packet)
  Status(status.Packet)
  Login(login.Packet)
  Configuration(configuration.Packet)
  Play(play.Packet)
}

pub type HandshakingPacket =
  handshaking.Packet

pub fn decode(
  phase: phase.Phase,
  id: Int,
  data: BitArray,
) -> Result(Packet, Nil) {
  case phase {
    phase.Handshaking -> {
      use packet <- result.try(handshaking.decode(id, data))
      Ok(Handshaking(packet))
    }
    phase.Status -> {
      use packet <- result.try(status.decode(id, data))
      Ok(Status(packet))
    }
    phase.Login -> {
      use packet <- result.try(login.decode(id, data))
      Ok(Login(packet))
    }
    phase.Configuration -> {
      use packet <- result.try(configuration.decode(id, data))
      Ok(Configuration(packet))
    }
    phase.Play -> {
      use packet <- result.try(play.decode(id, data))
      Ok(Play(packet))
    }
  }
}
