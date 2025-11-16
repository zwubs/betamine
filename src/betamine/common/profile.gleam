import betamine/common/uuid
import gleam/dynamic/decode
import gleam/option.{type Option}

pub type ProfileProperty {
  ProfileProperty(name: String, value: String, signature: Option(String))
}

pub fn property_decoder() -> decode.Decoder(ProfileProperty) {
  use name <- decode.field("name", decode.string)
  use value <- decode.field("value", decode.string)
  use signature <- decode.optional_field(
    "signature",
    option.None,
    decode.map(decode.string, option.Some),
  )
  decode.success(ProfileProperty(name:, value:, signature:))
}

pub type Profile {
  Profile(id: uuid.Uuid, name: String, properties: List(ProfileProperty))
}

pub fn default() {
  Profile(uuid.default, "", [])
}

pub fn decoder() {
  use id <- decode.field("id", uuid.decoder())
  use name <- decode.field("name", decode.string)
  use properties <- decode.field("properties", decode.list(property_decoder()))
  decode.success(Profile(id:, name:, properties:))
}
