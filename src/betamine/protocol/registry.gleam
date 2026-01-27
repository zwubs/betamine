import betamine/protocol/packets/clientbound
import gleam/list
import gleam/option
import nbeet

const damage_types = [
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
  "spear",
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
]

fn registries() {
  [
    #("cat_variant", [#("siamese", option.None)]),
    #("chicken_variant", [#("temperate", option.None)]),
    #("cow_variant", [#("temperate", option.None)]),
    #("pig_variant", [#("temperate", option.None)]),
    #("frog_variant", [#("temperate", option.None)]),
    #("zombie_nautilus_variant", [#("temperate", option.None)]),
    #("wolf_variant", [#("pale", option.None)]),
    #("wolf_sound_variant", [#("classic", option.None)]),
    #("painting_variant", [#("unpacked", option.None)]),
    #("worldgen/biome", [
      #(
        "plains",
        option.Some(
          nbeet.root([
            #("has_precipitation", nbeet.byte(1)),
            #("temperature", nbeet.float(0.8)),
            #("downfall", nbeet.float(0.4)),
            #(
              "effects",
              nbeet.compound([
                #("water_color", nbeet.string("#3f76e4")),
              ]),
            ),
          ]),
        ),
      ),
    ]),
    #("dimension_type", [
      #(
        "overworld",
        option.Some(
          nbeet.root([
            #("ambient_light", nbeet.float(0.0)),
            #("coordinate_scale", nbeet.double(1.0)),
            #("has_ceiling", nbeet.byte(0)),
            #("has_skylight", nbeet.byte(1)),
            #("height", nbeet.int(384)),
            #("logical_height", nbeet.int(384)),
            #("infiniburn", nbeet.string("#minecraft:infiniburn_overworld")),
            #("min_y", nbeet.int(-64)),
            #("monster_spawn_block_light_limit", nbeet.int(0)),
            #(
              "monster_spawn_light_level",
              nbeet.compound([
                #("type", nbeet.string("minecraft:uniform")),
                #("max_inclusive", nbeet.int(7)),
                #("min_inclusive", nbeet.int(0)),
              ]),
            ),
            #(
              "attributes",
              nbeet.compound([
                #("minecraft:visual/fog_color", nbeet.string("#c0d8ff")),
                #("minecraft:visual/sky_color", nbeet.string("#78a7ff")),
              ]),
            ),
          ]),
        ),
      ),
    ]),
    #(
      "damage_type",
      list.map(damage_types, fn(damage_type) { #(damage_type, option.None) }),
    ),
  ]
}

pub fn get_packets() {
  list.map(registries(), fn(registry) {
    clientbound.Registry(clientbound.RegistryPacket(
      #("minecraft", registry.0),
      list.map(registry.1, fn(entry) {
        clientbound.RegistryEntry(
          #("minecraft", entry.0),
          option.map(entry.1, fn(nbt) {
            let assert Ok(nbt) = nbeet.java_network_encode(nbt)
            nbt
          }),
        )
      }),
    ))
  })
}
