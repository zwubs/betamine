import betamine/protocol/packets/clientbound
import gleam/list
import gleam/option
import nbeet

fn registries() {
  let damage_type =
    option.Some(
      nbeet.root([
        #("exhaustion", nbeet.float(0.1)),
        #("message_id", nbeet.string("inFire")),
        #("scaling", nbeet.string("when_caused_by_living_non_player")),
      ]),
    )
  [
    #("cat_variant", [
      #(
        "siamese",
        option.Some(
          nbeet.root([
            #("asset_id", nbeet.string("minecraft:entity/cat/siamese")),
          ]),
        ),
      ),
    ]),
    #("chicken_variant", [
      #(
        "temperate",
        option.Some(
          nbeet.root([
            #(
              "asset_id",
              nbeet.string("minecraft:entity/chicken/temperate_chicken"),
            ),
          ]),
        ),
      ),
    ]),
    #("cow_variant", [
      #(
        "temperate",
        option.Some(
          nbeet.root([
            #("asset_id", nbeet.string("minecraft:entity/cow/temperate_cow")),
          ]),
        ),
      ),
    ]),
    #("pig_variant", [
      #(
        "temperate",
        option.Some(
          nbeet.root([
            #("asset_id", nbeet.string("minecraft:entity/pig/temperate_pig")),
          ]),
        ),
      ),
    ]),
    #("frog_variant", [
      #(
        "temperate",
        option.Some(
          nbeet.root([
            #("asset_id", nbeet.string("minecraft:entity/frog/temperate_frog")),
          ]),
        ),
      ),
    ]),
    #("zombie_nautilus_variant", [
      #(
        "temperate",
        option.Some(
          nbeet.root([
            #(
              "asset_id",
              nbeet.string(
                "minecraft:entity/zombie_nautilus/temperate_zombie_nautilus",
              ),
            ),
          ]),
        ),
      ),
    ]),
    #("wolf_variant", [
      #(
        "pale",
        option.Some(
          nbeet.root([
            #(
              "assets",
              nbeet.compound([
                #("angry", nbeet.string("minecraft:entity/wolf/wolf_angry")),
                #("tame", nbeet.string("minecraft:entity/wolf/wolf_tame")),
                #("wild", nbeet.string("minecraft:entity/wolf/wolf")),
              ]),
            ),
          ]),
        ),
      ),
    ]),
    #("wolf_sound_variant", [
      #(
        "classic",
        option.Some(
          nbeet.root([
            #("ambient_sound", nbeet.string("minecraft:entity.wolf.ambient")),
            #("death_sound", nbeet.string("minecraft:entity.wolf.death")),
            #("growl_sound", nbeet.string("minecraft:entity.wolf.growl")),
            #("hurt_sound", nbeet.string("minecraft:entity.wolf.hurt")),
            #("pant_sound", nbeet.string("minecraft:entity.wolf.pant")),
            #("whine_sound", nbeet.string("minecraft:entity.wolf.whine")),
          ]),
        ),
      ),
    ]),
    #("painting_variant", [
      #(
        "unpacked",
        option.Some(
          nbeet.root([
            #("asset_id", nbeet.string("minecraft:unpacked")),
            #(
              "author",
              nbeet.compound([
                #("color", nbeet.string("gray")),
                #(
                  "translate",
                  nbeet.string("painting.minecraft.unpacked.author"),
                ),
              ]),
            ),
            #("height", nbeet.int(4)),
            #(
              "title",
              nbeet.compound([
                #("color", nbeet.string("yellow")),
                #(
                  "translate",
                  nbeet.string("painting.minecraft.unpacked.title"),
                ),
              ]),
            ),
            #("width", nbeet.int(4)),
          ]),
        ),
      ),
    ]),
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
    #("damage_type", [
      #("arrow", damage_type),
      #("bad_respawn_point", damage_type),
      #("cactus", damage_type),
      #("campfire", damage_type),
      #("cramming", damage_type),
      #("dragon_breath", damage_type),
      #("drown", damage_type),
      #("dry_out", damage_type),
      #("ender_pearl", damage_type),
      #("explosion", damage_type),
      #("fall", damage_type),
      #("falling_anvil", damage_type),
      #("falling_block", damage_type),
      #("falling_stalactite", damage_type),
      #("fireball", damage_type),
      #("fireworks", damage_type),
      #("fly_into_wall", damage_type),
      #("freeze", damage_type),
      #("generic", damage_type),
      #("generic_kill", damage_type),
      #("hot_floor", damage_type),
      #("indirect_magic", damage_type),
      #("in_fire", damage_type),
      #("in_wall", damage_type),
      #("lava", damage_type),
      #("lightning_bolt", damage_type),
      #("mace_smash", damage_type),
      #("magic", damage_type),
      #("mob_attack", damage_type),
      #("mob_attack_no_aggro", damage_type),
      #("mob_projectile", damage_type),
      #("on_fire", damage_type),
      #("outside_border", damage_type),
      #("out_of_world", damage_type),
      #("player_attack", damage_type),
      #("player_explosion", damage_type),
      #("sonic_boom", damage_type),
      #("spear", damage_type),
      #("spit", damage_type),
      #("stalagmite", damage_type),
      #("starve", damage_type),
      #("sting", damage_type),
      #("sweet_berry_bush", damage_type),
      #("thorns", damage_type),
      #("thrown", damage_type),
      #("trident", damage_type),
      #("unattributed_fireball", damage_type),
      #("wind_charge", damage_type),
      #("wither", damage_type),
      #("wither_skull", damage_type),
    ]),
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
