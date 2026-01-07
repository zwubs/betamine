import betamine/protocol/error

pub type EntityKind {
  AcaciaBoat
  AcaciaChestBoat
  Allay
  AreaEffectCloud
  Armadillo
  ArmorStand
  Arrow
  Axolotl
  BambooChestRaft
  BambooRaft
  Bat
  Bee
  BirchBoat
  BirchChestBoat
  Blaze
  BlockDisplay
  Bogged
  Breeze
  BreezeWindCharge
  Camel
  CamelHusk
  Cat
  CaveSpider
  CherryBoat
  CherryChestBoat
  ChestMinecart
  Chicken
  Cod
  CommandBlockMinecart
  CopperGolem
  Cow
  Creaking
  Creeper
  DarkOakBoat
  DarkOakChestBoat
  Dolphin
  Donkey
  DragonFireball
  Drowned
  Egg
  ElderGuardian
  EndCrystal
  EnderDragon
  EnderPearl
  Enderman
  Endermite
  Evoker
  EvokerFangs
  ExperienceBottle
  ExperienceOrb
  EyeOfEnder
  FallingBlock
  Fireball
  FireworkRocket
  FishingBobber
  Fox
  Frog
  FurnaceMinecart
  Ghast
  Giant
  GlowItemFrame
  GlowSquid
  Goat
  Guardian
  HappyGhast
  Hoglin
  HopperMinecart
  Horse
  Husk
  Illusioner
  Interaction
  IronGolem
  Item
  ItemDisplay
  ItemFrame
  JungleBoat
  JungleChestBoat
  LeashKnot
  LightningBolt
  LingeringPotion
  Llama
  LlamaSpit
  MagmaCube
  MangroveBoat
  MangroveChestBoat
  Mannequin
  Marker
  Minecart
  Mooshroom
  Mule
  Nautilus
  OakBoat
  OakChestBoat
  Ocelot
  OminousItemSpawner
  Painting
  PaleOakBoat
  PaleOakChestBoat
  Panda
  Parched
  Parrot
  Phantom
  Pig
  Piglin
  PiglinBrute
  Pillager
  Player
  PolarBear
  Pufferfish
  Rabbit
  Ravager
  Salmon
  Sheep
  Shulker
  ShulkerBullet
  Silverfish
  Skeleton
  SkeletonHorse
  Slime
  SmallFireball
  Sniffer
  SnowGolem
  Snowball
  SpawnerMinecart
  SpectralArrow
  Spider
  SplashPotion
  SpruceBoat
  SpruceChestBoat
  Squid
  Stray
  Strider
  Tadpole
  TextDisplay
  Tnt
  TntMinecart
  TraderLlama
  Trident
  TropicalFish
  Turtle
  Vex
  Villager
  Vindicator
  WanderingTrader
  Warden
  WindCharge
  Witch
  Wither
  WitherSkeleton
  WitherSkull
  Wolf
  Zoglin
  Zombie
  ZombieHorse
  ZombieNautilus
  ZombieVillager
  ZombifiedPiglin
}

pub fn to_id(kind: EntityKind) {
  case kind {
    AcaciaBoat -> 0
    AcaciaChestBoat -> 1
    Allay -> 2
    AreaEffectCloud -> 3
    Armadillo -> 4
    ArmorStand -> 5
    Arrow -> 6
    Axolotl -> 7
    BambooChestRaft -> 8
    BambooRaft -> 9
    Bat -> 10
    Bee -> 11
    BirchBoat -> 12
    BirchChestBoat -> 13
    Blaze -> 14
    BlockDisplay -> 15
    Bogged -> 16
    Breeze -> 17
    BreezeWindCharge -> 18
    Camel -> 19
    CamelHusk -> 20
    Cat -> 21
    CaveSpider -> 22
    CherryBoat -> 23
    CherryChestBoat -> 24
    ChestMinecart -> 25
    Chicken -> 26
    Cod -> 27
    CommandBlockMinecart -> 29
    CopperGolem -> 28
    Cow -> 30
    Creaking -> 31
    Creeper -> 32
    DarkOakBoat -> 33
    DarkOakChestBoat -> 34
    Dolphin -> 35
    Donkey -> 36
    DragonFireball -> 37
    Drowned -> 38
    Egg -> 39
    ElderGuardian -> 40
    EndCrystal -> 45
    EnderDragon -> 43
    EnderPearl -> 44
    Enderman -> 41
    Endermite -> 42
    Evoker -> 46
    EvokerFangs -> 47
    ExperienceBottle -> 48
    ExperienceOrb -> 49
    EyeOfEnder -> 50
    FallingBlock -> 51
    Fireball -> 52
    FireworkRocket -> 53
    FishingBobber -> 156
    Fox -> 54
    Frog -> 55
    FurnaceMinecart -> 56
    Ghast -> 57
    Giant -> 59
    GlowItemFrame -> 60
    GlowSquid -> 61
    Goat -> 62
    Guardian -> 63
    HappyGhast -> 58
    Hoglin -> 64
    HopperMinecart -> 65
    Horse -> 66
    Husk -> 67
    Illusioner -> 68
    Interaction -> 69
    IronGolem -> 70
    Item -> 71
    ItemDisplay -> 72
    ItemFrame -> 73
    JungleBoat -> 74
    JungleChestBoat -> 75
    LeashKnot -> 76
    LightningBolt -> 77
    LingeringPotion -> 106
    Llama -> 78
    LlamaSpit -> 79
    MagmaCube -> 80
    MangroveBoat -> 81
    MangroveChestBoat -> 82
    Mannequin -> 83
    Marker -> 84
    Minecart -> 85
    Mooshroom -> 86
    Mule -> 87
    Nautilus -> 88
    OakBoat -> 89
    OakChestBoat -> 90
    Ocelot -> 91
    OminousItemSpawner -> 92
    Painting -> 93
    PaleOakBoat -> 94
    PaleOakChestBoat -> 95
    Panda -> 96
    Parched -> 97
    Parrot -> 98
    Phantom -> 99
    Pig -> 100
    Piglin -> 101
    PiglinBrute -> 102
    Pillager -> 103
    Player -> 155
    PolarBear -> 104
    Pufferfish -> 107
    Rabbit -> 108
    Ravager -> 109
    Salmon -> 110
    Sheep -> 111
    Shulker -> 112
    ShulkerBullet -> 113
    Silverfish -> 114
    Skeleton -> 115
    SkeletonHorse -> 116
    Slime -> 117
    SmallFireball -> 118
    Sniffer -> 119
    SnowGolem -> 121
    Snowball -> 120
    SpawnerMinecart -> 122
    SpectralArrow -> 123
    Spider -> 124
    SplashPotion -> 105
    SpruceBoat -> 125
    SpruceChestBoat -> 126
    Squid -> 127
    Stray -> 128
    Strider -> 129
    Tadpole -> 130
    TextDisplay -> 131
    Tnt -> 132
    TntMinecart -> 133
    TraderLlama -> 134
    Trident -> 135
    TropicalFish -> 136
    Turtle -> 137
    Vex -> 138
    Villager -> 139
    Vindicator -> 140
    WanderingTrader -> 141
    Warden -> 142
    WindCharge -> 143
    Witch -> 144
    Wither -> 145
    WitherSkeleton -> 146
    WitherSkull -> 147
    Wolf -> 148
    Zoglin -> 149
    Zombie -> 150
    ZombieHorse -> 151
    ZombieNautilus -> 152
    ZombieVillager -> 153
    ZombifiedPiglin -> 154
  }
}
