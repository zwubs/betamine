//// The client router is responsible for routing all requests from clients to their required systems.
//// This includes sending packets back to the connection to be sent to the client.

import betamine/client/protocol/error
import betamine/client/protocol/packet
import betamine/client/protocol/packet/configuration as configuration_packet
import betamine/client/protocol/packet/handshake as handshake_packet
import betamine/client/protocol/packet/login as login_packet
import betamine/client/protocol/packet/play as play_packet
import betamine/client/protocol/packet/status as status_packet
import betamine/client/protocol/phase
import betamine/client/protocol/types/intention
import betamine/server/status_handler as server_status_handler
import gleam/erlang/process
import gleam/otp/actor
import gleam/otp/supervision

type Message =
  #(process.Subject(Result(phase.Phase, error.Error)), packet.Serverbound)

pub type Subject =
  process.Subject(Message)

pub type Name =
  process.Name(Message)

type State {
  State(server_status_handler_subject: server_status_handler.Subject)
}

pub fn supervised(
  name: Name,
  server_status_handler_name: server_status_handler.Name,
) -> supervision.ChildSpecification(Subject) {
  supervision.worker(fn() { start(name, server_status_handler_name) })
}

pub fn start(
  name: Name,
  server_status_handler_name: server_status_handler.Name,
) -> Result(actor.Started(Subject), actor.StartError) {
  let server_status_handler_subject =
    process.named_subject(server_status_handler_name)
  actor.new_with_initialiser(1000, fn(subject) {
    actor.initialised(State(server_status_handler_subject:))
    |> actor.selecting(process.select(process.new_selector(), subject))
    |> actor.returning(subject)
    |> Ok
  })
  |> actor.on_message(handle_message)
  |> actor.named(name)
  |> actor.start()
}

fn handle_message(state: State, message: Message) -> actor.Next(State, Message) {
  let #(return_subject, packet) = message
  case packet {
    packet.HandshakeServerbound(packet) ->
      handle_handshake_packet(state, packet)
    packet.StatusServerbound(packet) -> handle_status_packet(state, packet)
    packet.LoginServerbound(packet) -> handle_login_packet(state, packet)
    packet.ConfigurationServerbound(packet) ->
      handle_configuration_packet(state, packet)
    packet.PlayServerbound(packet) -> handle_play_packet(state, packet)
  }
  |> process.send(return_subject, _)
  actor.continue(state)
}

fn handle_handshake_packet(_state: State, packet: handshake_packet.Serverbound) {
  case packet {
    handshake_packet.ServerboundIntention(..) -> {
      case packet.intention {
        intention.Status -> Ok(phase.Status)
        intention.Login -> Ok(phase.Login)
        intention.Transfer -> Ok(phase.Login)
      }
    }
  }
}

fn handle_status_packet(_state: State, packet: status_packet.Serverbound) {
  case packet {
    status_packet.ServerboundStatusRequest -> {
      Ok(phase.Status)
    }
    status_packet.ServerboundPingRequest(..) -> {
      Ok(phase.Status)
    }
  }
}

fn handle_login_packet(_state: State, packet: login_packet.Serverbound) {
  case packet {
    login_packet.ServerboundHello -> todo
    login_packet.ServerboundKey -> todo
    login_packet.ServerboundCustomQueryAnswer -> todo
    login_packet.ServerboundLoginAcknowledged -> todo
    login_packet.ServerboundCookieResponse -> todo
  }
  Ok(phase.Login)
}

fn handle_configuration_packet(
  _state: State,
  _packet: configuration_packet.Serverbound,
) {
  Ok(phase.Configuration)
}

fn handle_play_packet(_state: State, _packet: play_packet.Serverbound) {
  Ok(phase.Play)
}
