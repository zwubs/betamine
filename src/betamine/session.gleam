import betamine/common/player.{type Player, Player}
import betamine/common/position
import betamine/constants
import betamine/decoder as decode
import betamine/encoder as encode
import betamine/game
import betamine/game/command
import betamine/game/update
import betamine/protocol
import betamine/protocol/brand
import betamine/protocol/change_difficulty
import betamine/protocol/chunk_data
import betamine/protocol/client_information
import betamine/protocol/confirm_teleportation
import betamine/protocol/feature_flags
import betamine/protocol/game_event
import betamine/protocol/keep_alive
import betamine/protocol/known_packs
import betamine/protocol/login
import betamine/protocol/login_play
import betamine/protocol/phase
import betamine/protocol/ping
import betamine/protocol/player_info_remove
import betamine/protocol/player_info_update
import betamine/protocol/registry
import betamine/protocol/remove_entities
import betamine/protocol/set_center_chunk
import betamine/protocol/set_head_rotation
import betamine/protocol/set_player_position
import betamine/protocol/set_player_position_and_rotation
import betamine/protocol/set_player_rotation
import betamine/protocol/spawn_entity
import betamine/protocol/status
import betamine/protocol/synchronize_player_position
import betamine/protocol/update_entity_position
import betamine/protocol/update_entity_rotation
import gleam/bytes_builder
import gleam/erlang/process.{type Subject}
import gleam/function
import gleam/int
import gleam/io
import gleam/list
import gleam/otp/actor
import gleam/string
import glisten
import protocol/packets/serverbound

pub type Packet {
  ServerBoundPacket(data: BitArray)
  ClientBoundPacket(id: Int, length: Int, data: BitArray)
  GameUpdate(update.Update)
  Disconnect
}

type State {
  State(
    subject_for_host: Subject(Packet),
    game_subject: Subject(command.Command),
    subject_for_game: Subject(update.Update),
    connection: glisten.Connection(BitArray),
    phase: phase.Phase,
    last_keep_alive: Int,
    player: Player,
  )
}

type Error {
  UnknownServerBoundPacket(state: phase.Phase, serverbound.Packet)
  UnknownProtocolState(state: Int)
}

pub fn start(
  host_subject: Subject(Subject(Packet)),
  game_subject: Subject(command.Command),
  connection: glisten.Connection(BitArray),
) -> Result(Subject(Packet), actor.StartError) {
  actor.start_spec(actor.Spec(
    init: fn() {
      let subject_for_host = process.new_subject()
      process.send(host_subject, subject_for_host)

      let subject_for_game = process.new_subject()

      let selector =
        process.new_selector()
        |> process.selecting(subject_for_host, function.identity)
        |> process.selecting(subject_for_game, fn(msg) { GameUpdate(msg) })

      actor.Ready(
        State(
          subject_for_host,
          game_subject,
          subject_for_game,
          connection,
          phase.Handshaking,
          now_seconds(),
          Player("", 0, 0),
        ),
        selector,
      )
    },
    init_timeout: 1000,
    loop: handle_message,
  ))
}

fn handle_message(packet: Packet, state: State) -> actor.Next(Packet, State) {
  let result = case packet {
    ServerBoundPacket(data) -> {
      let assert Ok(packet) = protocol.decode_serverbound(state.phase, data)
      handle_server_bound(packet, state)
    }
    ClientBoundPacket(id, _, data) -> Ok(state)
    GameUpdate(update) -> handle_game_update(update, state)
    Disconnect -> {
      process.send(
        state.game_subject,
        command.RemovePlayer(state.player.uuid, state.subject_for_game),
      )
      Ok(state)
    }
  }
  case result {
    Ok(state) -> actor.continue(state)
    Error(error) -> handle_error(error, state)
  }
}

fn handle_error(error: Error, state: State) {
  case error {
    UnknownServerBoundPacket(phase, packet) -> {
      io.debug(
        "Unhandled Packet w/ Phase: "
        <> string.inspect(phase)
        <> " & Packet:"
        <> string.inspect(packet),
      )
      actor.continue(state)
    }
    UnknownProtocolState(phase) -> {
      io.debug(
        "Client Requested An Unknown Protocol State: " <> string.inspect(phase),
      )
      actor.continue(state)
    }
  }
}

@external(erlang, "now_ffi", "now_seconds")
pub fn now_seconds() -> Int

fn handle_server_bound(packet: serverbound.Packet, state: State) {
  // Logic for handling keep alives
  // I know I can figure out a way to utilize OTP for this
  // but I just need something to work for now
  let offset = now_seconds() - state.last_keep_alive
  let state = case state.phase {
    phase.Play if offset >= 15 -> {
      let _ = send(state, keep_alive.serialize(), 0x26)
      State(..state, last_keep_alive: now_seconds())
    }
    _ -> state
  }

  io.debug("Receivied Packet: " <> string.inspect(packet))

  case packet {
    serverbound.Handshake(packet) -> {
      case packet.next_phase {
        1 -> Ok(State(..state, phase: phase.Status))
        2 -> Ok(State(..state, phase: phase.Login))
        phase -> Error(UnknownProtocolState(phase))
      }
    }
    serverbound.StatusRequest -> {
      let status_response = status.serialize()
      let _ = send(state, status_response, 0)
      Ok(state)
    }
    serverbound.StatusPing(packet) -> {
      let ping_response = ping.serialize(packet.id)
      let _ = send(state, ping_response, 1)
      Ok(state)
    }
    serverbound.LoginStart(packet) -> {
      let _ = send(state, login.serialize(packet.name, packet.uuid), 2)
      Ok(State(..state, player: Player(packet.name, packet.uuid, 0)))
    }
    serverbound.LoginAcknowledged ->
      Ok(State(..state, phase: phase.Configuration))
    serverbound.ClientInformation(_) -> {
      let _ = send(state, feature_flags.serialize(), 0x0C)
      let _ = send(state, known_packs.serialize(), 0x0E)
      Ok(state)
    }
    serverbound.Plugin(_) -> {
      let _ = send(state, brand.serialize(), 0x01)
      Ok(state)
    }
    serverbound.KnownDataPacks(_) -> {
      // Finish Configuration
      registry.send(state.connection)
      // let _ = send(state, registry.serialize(), 7)
      let _ = send(state, bytes_builder.new(), 3)
      Ok(state)
    }
    // Acknowledge Finish Configuration
    serverbound.AcknowledgeFinish -> {
      let #(player, entity) =
        process.call(
          state.game_subject,
          command.SpawnPlayer(
            state.subject_for_game,
            _,
            state.player.uuid,
            state.player.name,
          ),
          1000,
        )
      let _ =
        send(
          state,
          login_play.serialize(
            login_play.Request(
              ..login_play.default,
              entity_id: player.entity_id,
            ),
          ),
          0x2B,
        )
      let _ = send(state, change_difficulty.serialize(), 0x0B)
      let _ = send(state, game_event.serialize(), 0x22)
      let _ = send(state, set_center_chunk.serialize(), 0x54)
      let _ = send(state, chunk_data.serialize(), 0x27)
      let _ = send(state, synchronize_player_position.serialize(entity), 0x40)
      let players =
        process.call(state.game_subject, command.GetAllPlayers, 1000)
      let _ = send(state, player_info_update.serialize(players), 0x3E)
      let entities =
        process.call(state.game_subject, command.GetAllEntities, 1000)
      list.filter(entities, fn(entity) { entity.id != player.entity_id })
      |> list.map(fn(entity) {
        send(state, spawn_entity.serialize(entity), 0x01)
      })
      Ok(State(..state, phase: phase.Play, player:))
    }
    serverbound.ConfirmTeleport(_) -> Ok(state)
    serverbound.KeepAlive(_) -> Ok(state)
    serverbound.PlayerPosition(position, on_ground) -> {
      process.send(
        state.game_subject,
        command.MoveEntity(state.player.entity_id, position, on_ground),
      )
      Ok(state)
    }
    serverbound.PlayerPositionAndRotation(position, rotation, on_ground) -> {
      process.send(
        state.game_subject,
        command.MoveEntity(state.player.entity_id, position, on_ground),
      )
      process.send(
        state.game_subject,
        command.RotateEntity(state.player.entity_id, rotation, on_ground),
      )
      Ok(state)
    }
    serverbound.PlayerRotation(rotation, on_ground) -> {
      process.send(
        state.game_subject,
        command.RotateEntity(state.player.entity_id, rotation, on_ground),
      )
      Ok(state)
    }
  }
}

fn send(state: State, builder: bytes_builder.BytesBuilder, packet_id: Int) {
  let response_builder =
    bytes_builder.new()
    |> encode.var_int(packet_id)

  let response_builder =
    bytes_builder.prepend_builder(builder, response_builder)

  io.println(
    "Sending Packet To: "
    <> state.player.name
    <> " w/ State: "
    <> string.inspect(state.phase)
    <> " & Id: 0x"
    <> int.to_base16(packet_id),
  )

  let builder_size = bytes_builder.byte_size(response_builder)
  let size_as_bytes_builder = encode.var_int(bytes_builder.new(), builder_size)

  let response_builder =
    bytes_builder.prepend_builder(response_builder, size_as_bytes_builder)

  glisten.send(state.connection, response_builder)
}

fn handle_game_update(update: update.Update, state: State) {
  case update {
    update.PlayerSpawned(player, entity) -> {
      let _ = send(state, player_info_update.serialize([player]), 0x3E)
      let _ = send(state, spawn_entity.serialize(entity), 0x01)
      io.debug(player)
      Ok(state)
    }
    update.EntityPosition(entity_id, old_position, new_position, on_ground) -> {
      let request =
        update_entity_position.UpdateEntityPosition(
          entity_id,
          old_position,
          new_position,
          on_ground,
        )
      let _ = send(state, update_entity_position.serialize(request), 0x2E)
      Ok(state)
    }
    update.EntityRotation(entity_id, rotation, on_ground) -> {
      let request =
        update_entity_rotation.Request(entity_id, rotation, on_ground)
      let _ = send(state, update_entity_rotation.serialize(request), 0x30)
      let request = set_head_rotation.Request(entity_id, rotation.yaw)
      let _ = send(state, set_head_rotation.serialize(request), 0x48)
      Ok(state)
    }
    update.PlayerDisconnected(player) -> {
      let _ = send(state, player_info_remove.serialize([player.uuid]), 0x3D)
      let _ = send(state, remove_entities.serialize([player.entity_id]), 0x42)
      Ok(state)
    }
    _ -> Ok(state)
  }
}
