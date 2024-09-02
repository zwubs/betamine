import gleam/bytes_builder
import gleam/io
import glisten.{type Connection}
import simplifile

pub fn send(connection: Connection(BitArray)) {
  send_registry(connection, [
    "biome_registry.bin", "chat_type_registry.bin",
    "armor_trim_pattern_registry.bin", "armor_trim_material_registry.bin",
    "wolf_variant_registry.bin", "painting_variant_registry.bin",
    "dimension_registry.bin", "damage_type_registry.bin",
    "banner_pattern_registry.bin", "enchantment_registry.bin",
    "jukebox_registry.bin", "item_registry.bin",
  ])
}

pub fn send_registry(
  connection: Connection(BitArray),
  registry_paths: List(String),
) {
  case registry_paths {
    [registry_path, ..registry_paths] -> {
      let assert Ok(registry) =
        simplifile.read_bits(
          "src/betamine/protocol/registries/" <> registry_path,
        )
      io.debug("REGISTRY:")
      io.debug(registry_path)
      io.debug(registry)
      let _ = glisten.send(connection, bytes_builder.from_bit_array(registry))
      send_registry(connection, registry_paths)
    }
    [] -> Nil
  }
}
