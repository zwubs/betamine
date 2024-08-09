import betamine/constants
import betamine/encoder as encode
import gleam/bytes_builder
import gleam/json.{array, bool, int, object, string}

pub fn serialize() {
  let status =
    object([
      #(
        "version",
        object([
          #("name", string(constants.mc_version_name)),
          #("protocol", int(constants.mc_version_protocol)),
        ]),
      ),
      #(
        "players",
        object([
          #("max", int(10)),
          #("online", int(1)),
          #(
            "sample",
            array(
              [
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
      #("description", object([#("text", string("Hello Betamine!"))])),
      #(
        "favicon",
        string(
          "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAMAAACdt4HsAAABSlBMVEUAAAAjbWEirmgjbmEirWgirmgjbWEjf2O174ksqmcvhmNOwm8imGYjgmMilWW16IiF3mmG2mkimmYikWUjdWK17IgipmcioGYii2QjhWQjfGIim2Yii2QjbWFOvG9Dp2VEnGUjbmEje2MirmhOs25Pq21PpWxPnmtDsWcjbWEio2cik2UjdGIirmgirmgjcGEiq2giqWctgmI/jmMjbWFPl2tDumdDt2dNk2ojbWEjgWMjg2Mip2cjbWEjbWEirmiV6GrT/JMjbWEipWcimWYjhmQjgWMjfGMjc2IiqGcinWYikGUiqmgiomcjiWQiq2gik2UjcGEirWgil2UijmQji2Qjd2IjbmEjeWIioGYjhGMjdWIim2bN+pDH+Iy89IYss2jC9oug7HGb6m6z74ig54Kp73d21Xak7XRq0HNdynBSxm1IwGyq64Yq/LamAAAAP3RSTlMA+/sgIJua/vz829sgIP78/Pz7+/v8+/v7+/ubm/Tb29ubmtzb29vb27ybm5uEgfvi4uDf3Nvb29qrm5qXhIHRcwTeAAACG0lEQVRYw+3WV1MiURCGYRF32QAbGJYk4KqbDGvO6egAAiKCmHPO+v9v7R4YzwzN2IxUWV7Q9+9Tp87V1/TGr+XdwOBMSx15czGfyfi73S/NBfbxXC7Q6n5RLkRxOROP53aW9r2E4HO8PADQLyUSa0qP22aOvf6AxNqXQlaJeOzlCPhjsYD2gEI2u74RlASfaz8Q+7Cw8OOXFx8A/cpKMjTlqTkXzZ8hhwMCegSSu4uL4Q6PzVwjfivYA+BKpXy9Thu5JIL4AAC2N/d87U4+J/f1TwgfAEA6veqoJP4zeZlwaQ9Ir26pqjpp7Pu4XCf+hrUHqHjtBqCTzSXhwwfgRQ2AOWeI0X4A8Aggc4aYsADmLw9q6Q+ujq2A+RqIw6tjIawAvOtniZMbyJ8FkDhkcgaAO61KHN0KOAawJs4h5wEjcWLK72TNAPLOjvT8QeY8QImLe1myACVIzgDkhGgADaABvDaQrxMo1g0sj32rDfj4iQDYw6bzj1OiSu5QCdCpj9LAv0rCMldHzAMDHlAatRWERQ43Z544hlHaZiSscsds5cjywywvjdKC0vbdDND8fZWd1h0or2IctU8En8tzt3r1VQyj9meJYHJKlFcxjlKNYHJK9CjaA5I4SsNAsDklIkFcxeVROzxEcv48kRA8ICVHKcl5YtoFqxh6CZCcIzrC8gEyt0f48AEyt3/O3lIvc/tEVzTa5Wx62/cIgWlqwdNLKqAAAAAASUVORK5CYII=",
        ),
      ),
      #("enforcesSecureChat", bool(False)),
      #("previewsChat", bool(False)),
    ])
    |> json.to_string

  encode.string(bytes_builder.new(), status)
}
