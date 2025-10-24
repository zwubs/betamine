import betamine/protocol/packets/clientbound
import gleam/list
import gleam/option

const registries = [
  #("dimension_type", ["overworld"]),
  #("worldgen/biome", ["plains"]),
  #("cat_variant", ["siamese"]),
  #("chicken_variant", ["temperate"]),
  #("cow_variant", ["temperate"]),
  #("pig_variant", ["temperate"]),
  #("frog_variant", ["temperate"]),
  #("wolf_variant", ["pale"]),
  #("wolf_sound_variant", ["classic"]),
  #("painting_variant", ["unpacked"]),
  #(
    "damage_type",
    [
      "arrow",
      "bad_respawn_point",
      "cactus",
      "campfire",
      "cramming",
      "dragon_breath",
      "drown",
      "dry_out",
      "ender_pearl",
      "explosion",
      "fall",
      "falling_anvil",
      "falling_block",
      "falling_stalactite",
      "fireball",
      "fireworks",
      "fly_into_wall",
      "freeze",
      "generic",
      "generic_kill",
      "hot_floor",
      "indirect_magic",
      "in_fire",
      "in_wall",
      "lava",
      "lightning_bolt",
      "mace_smash",
      "magic",
      "mob_attack",
      "mob_attack_no_aggro",
      "mob_projectile",
      "on_fire",
      "outside_border",
      "out_of_world",
      "player_attack",
      "player_explosion",
      "sonic_boom",
      "spit",
      "stalagmite",
      "starve",
      "sting",
      "sweet_berry_bush",
      "thorns",
      "thrown",
      "trident",
      "unattributed_fireball",
      "wind_charge",
      "wither",
      "wither_skull",
    ],
  ),
]

pub fn get_packets() {
  list.map(registries, fn(registry) {
    clientbound.Registry(clientbound.RegistryPacket(
      #("minecraft", registry.0),
      list.map(registry.1, fn(entry) {
        clientbound.RegistryEntry(#("minecraft", entry), option.None)
      }),
    ))
  })
}
