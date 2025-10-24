pub type Identifier =
  #(String, String)

pub const default_prefix = "minecraft"

pub fn get_prefix(identifier: Identifier) {
  identifier.0
}

pub fn get_suffix(identifier: Identifier) {
  identifier.1
}

pub fn to_string(identifier: Identifier) {
  let prefix = get_prefix(identifier)
  case prefix == default_prefix {
    True -> get_suffix(identifier)
    False -> get_prefix(identifier) <> ":" <> get_suffix(identifier)
  }
}
