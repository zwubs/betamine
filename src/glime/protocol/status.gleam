import gleam/bytes_builder
import gleam/json.{array, bool, int, object, string}
import glime/encoder as encode

pub fn serialize(protocol_version: Int) {
  let status =
    object([
      #(
        "version",
        object([
          #("name", string("1.21.0")),
          #("protocol", int(protocol_version)),
        ]),
      ),
      #(
        "players",
        object([
          #("max", int(2)),
          #("online", int(2)),
          #(
            "sample",
            array(
              [
                [
                  #("name", string("Wintermonster")),
                  #("id", string("7123b2bc-730d-4308-a81b-ae612ec1eeff")),
                ],
                [
                  #("name", string("zwubs")),
                  #("id", string("0c3456dc-85a0-4baf-89b4-db008ec1c749")),
                ],
              ],
              of: object,
            ),
          ),
        ]),
      ),
      #("description", object([#("text", string("Hello Lindsey!"))])),
      #(
        "favicon",
        string(
          "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABAAQMAAACQp+OdAAAABlBMVEX6PvcAAAAUzqtJAAAAFklEQVQoz2P4DwQMIDDKwMoYDQi8DADzAv8BKis8ZwAAAABJRU5ErkJggg==",
        ),
      ),
      #("enforcesSecureChat", bool(False)),
      #("previewsChat", bool(False)),
    ])
    |> json.to_string

  encode.string(bytes_builder.new(), status)
}
