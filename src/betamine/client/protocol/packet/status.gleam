import betamine/client/protocol/decoder
import betamine/client/protocol/encoder
import betamine/client/protocol/error
import betamine/common/text_component
import gleam/bytes_tree
import gleam/json
import gleam/list
import gleam/result
import youid/uuid

pub type Serverbound {
  ServerboundStatusRequest
  ServerboundPingRequest(timestamp: Int)
}

pub fn decode(
  id: Int,
  bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  case id {
    0 -> Ok(ServerboundStatusRequest)
    1 -> decode_ping_request(bit_array)
    _ -> Error(error.InvalidPacketId(id))
  }
}

fn decode_ping_request(
  bit_array: BitArray,
) -> Result(Serverbound, error.DecodeError) {
  use #(timestamp, _) <- result.try(decoder.long(bit_array))
  Ok(ServerboundPingRequest(timestamp:))
}

pub type Clientbound {
  ClientboundStatusResponse(
    version_name: String,
    version_protocol: Int,
    max_player_count: Int,
    online_player_count: Int,
    players: List(#(uuid.Uuid, String)),
    description: text_component.TextComponent,
    favicon: String,
    enforces_secure_chat: Bool,
  )
  ClientboundPongResponse(timestamp: Int)
}

pub fn clientbound_packet_id(packet: Clientbound) {
  case packet {
    ClientboundStatusResponse(..) -> 0
    ClientboundPongResponse(..) -> 0
  }
}

pub fn encode(packet: Clientbound) -> bytes_tree.BytesTree {
  case packet {
    ClientboundStatusResponse(..) -> {
      [
        json.object([
          #(
            "version",
            json.object([
              #("name", json.string(packet.version_name)),
              #("protocol", json.int(packet.version_protocol)),
            ]),
          ),
          #(
            "players",
            json.object([
              #("max", json.int(packet.max_player_count)),
              #("online", json.int(packet.online_player_count)),
              #(
                "sample",
                json.array(
                  list.map(packet.players, fn(player) {
                    [
                      #("id", json.string(uuid.to_string(player.0))),
                      #("name", json.string(player.1)),
                    ]
                  }),
                  of: json.object,
                ),
              ),
            ]),
          ),
          #("description", text_component.to_json(packet.description)),
          #("favicon", json.string(packet.favicon)),
          #("enforcesSecureChat", json.bool(packet.enforces_secure_chat)),
        ])
        |> json.to_string
        |> encoder.string,
      ]
    }
    ClientboundPongResponse(..) -> {
      [encoder.long(packet.timestamp)]
    }
  }
  |> list.fold(bytes_tree.new(), bytes_tree.append)
}
