import betamine/encoder
import gleam/bytes_builder.{type BytesBuilder}
import gleam/option.{type Option}

pub type Profile {
  Profile(id: Int, name: String, properties: List(ProfileProperty))
}

pub type ProfileProperty {
  ProfileProperty(name: String, value: String, signature: Option(String))
}

pub fn encode_profile_property(builder: BytesBuilder, property: ProfileProperty) {
  builder
  |> encoder.string(property.name)
  |> encoder.string(property.value)
  |> encoder.optional(property.signature, encoder.string)
}
