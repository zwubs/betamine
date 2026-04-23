import betamine/common/text_component
import betamine/common/uuid
import betamine/constant
import gleam/json
import gleam/list
import gleam/option

pub type Status {
  Status(
    description: text_component.TextComponent,
    version: option.Option(Version),
    players: option.Option(Players),
    favicon: option.Option(String),
    enforces_secure_chat: Bool,
  )
}

pub type Version {
  ServerVersion(name: String, protocol: Int)
}

pub type Players {
  Players(max: Int, online: Int, sample: List(#(uuid.Uuid, String)))
}

pub fn default() {
  Status(
    description: text_component.TextComponent(""),
    version: option.Some(ServerVersion(
      constant.mc_version_name,
      constant.mc_version_protocol,
    )),
    players: option.None,
    favicon: option.Some(constant.mc_favicon),
    enforces_secure_chat: False,
  )
}

pub fn to_json(status: Status) {
  json.object([
    #("description", text_component.to_json(status.description)),
    #(
      "version",
      json.nullable(status.version, fn(version) {
        json.object([
          #("name", json.string(version.name)),
          #("protocol", json.int(version.protocol)),
        ])
      }),
    ),
    #(
      "players",
      json.nullable(status.players, fn(players) {
        json.object([
          #("max", json.int(players.max)),
          #("online", json.int(players.online)),
          #(
            "sample",
            json.array(
              list.map(players.sample, fn(player) {
                [
                  #("id", json.string(uuid.to_string(player.0))),
                  #("name", json.string(player.1)),
                ]
              }),
              of: json.object,
            ),
          ),
        ])
      }),
    ),
    #("favicon", json.nullable(status.favicon, json.string)),
    #("enforcesSecureChat", json.bool(status.enforces_secure_chat)),
  ])
  |> json.to_string()
}
