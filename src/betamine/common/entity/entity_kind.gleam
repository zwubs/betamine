import betamine/protocol/error

pub type EntityKind {
  AcaciaBoat
  AcaciaBoatWithChest
  Allay
  AreaEffectCloud
  Armadillo
  ArmorStand
  Arrow
  Axolotl
  BambooRaftWithChest
  BambooRaft
  Bat
  Bee
  BirchBoat
  BirchBoatWithChest
  Blaze
  BlockDisplay
  Bogged
  Breeze
  BreezeWindCharge
  Camel
  Cat
  CaveSpider
  CherryBoat
  CherryBoatWithChest
  MinecartWithChest
  Chicken
  Cod
  CopperGolem
  MinecartWithCommandBlock
  Cow
  Creaking
  Creeper
  DarkOakBoat
  DarkOakBoatWithChest
  Dolphin
  Donkey
  DragonFireball
  Drowned
  ThrownEgg
  ElderGuardian
  Enderman
  Endermite
  EnderDragon
  ThrownEnderPearl
  EndCrystal
  Evoker
  EvokerFangs
  ThrownBottleOEnchanting
  ExperienceOrb
  EyeOfEnder
  FallingBlock
  Fireball
  FireworkRocket
  Fox
  Frog
  MinecartWithFurnace
  Ghast
  HappyGhast
  Giant
  GlowItemFrame
  GlowSquid
  Goat
  Guardian
  Hoglin
  MinecartWithHopper
  Horse
  Husk
  Illusioner
  Interaction
  IronGolem
  Item
  ItemDisplay
  ItemFrame
  JungleBoat
  JungleBoatWithChest
  LeashKnot
  LightningBolt
  Llama
  LlamaSpit
  MagmaCube
  MangroveBoat
  MangroveBoatWithChest
  Mannequin
  Marker
  Minecart
  Mooshroom
  Mule
  OakBoat
  OakBoatWithChest
  Ocelot
  OminousItemSpawner
  Painting
  PaleOakBoat
  PaleOakBoatWithChest
  Panda
  Parrot
  Phantom
  Pig
  Piglin
  PiglinBrute
  Pillager
  PolarBear
  SplashPotion
  LingeringPotion
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
  Snowball
  SnowGolem
  MinecartWithMonsterSpawner
  SpectralArrow
  Spider
  SpruceBoat
  SpruceBoatWithChest
  Squid
  Stray
  Strider
  Tadpole
  TextDisplay
  PrimedTNT
  MinecartWithTNT
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
  ZombieVillager
  ZombifiedPiglin
  Player
  FishingBobber
}

pub fn to_id(kind: EntityKind) {
  case kind {
    AcaciaBoat -> 0
    AcaciaBoatWithChest -> 1
    Allay -> 2
    AreaEffectCloud -> 3
    Armadillo -> 4
    ArmorStand -> 5
    Arrow -> 6
    Axolotl -> 7
    BambooRaftWithChest -> 8
    BambooRaft -> 9
    Bat -> 10
    Bee -> 11
    BirchBoat -> 12
    BirchBoatWithChest -> 13
    Blaze -> 14
    BlockDisplay -> 15
    Bogged -> 16
    Breeze -> 17
    BreezeWindCharge -> 18
    Camel -> 19
    Cat -> 20
    CaveSpider -> 21
    CherryBoat -> 22
    CherryBoatWithChest -> 23
    MinecartWithChest -> 24
    Chicken -> 25
    Cod -> 26
    CopperGolem -> 27
    MinecartWithCommandBlock -> 28
    Cow -> 29
    Creaking -> 30
    Creeper -> 31
    DarkOakBoat -> 32
    DarkOakBoatWithChest -> 33
    Dolphin -> 34
    Donkey -> 35
    DragonFireball -> 36
    Drowned -> 37
    ThrownEgg -> 38
    ElderGuardian -> 39
    Enderman -> 40
    Endermite -> 41
    EnderDragon -> 42
    ThrownEnderPearl -> 43
    EndCrystal -> 44
    Evoker -> 45
    EvokerFangs -> 46
    ThrownBottleOEnchanting -> 47
    ExperienceOrb -> 48
    EyeOfEnder -> 49
    FallingBlock -> 50
    Fireball -> 51
    FireworkRocket -> 52
    Fox -> 53
    Frog -> 54
    MinecartWithFurnace -> 55
    Ghast -> 56
    HappyGhast -> 57
    Giant -> 58
    GlowItemFrame -> 59
    GlowSquid -> 60
    Goat -> 61
    Guardian -> 62
    Hoglin -> 63
    MinecartWithHopper -> 64
    Horse -> 65
    Husk -> 66
    Illusioner -> 67
    Interaction -> 68
    IronGolem -> 69
    Item -> 70
    ItemDisplay -> 71
    ItemFrame -> 72
    JungleBoat -> 73
    JungleBoatWithChest -> 74
    LeashKnot -> 75
    LightningBolt -> 76
    Llama -> 77
    LlamaSpit -> 78
    MagmaCube -> 79
    MangroveBoat -> 80
    MangroveBoatWithChest -> 81
    Mannequin -> 82
    Marker -> 83
    Minecart -> 84
    Mooshroom -> 85
    Mule -> 86
    OakBoat -> 87
    OakBoatWithChest -> 88
    Ocelot -> 89
    OminousItemSpawner -> 90
    Painting -> 91
    PaleOakBoat -> 92
    PaleOakBoatWithChest -> 93
    Panda -> 94
    Parrot -> 95
    Phantom -> 96
    Pig -> 97
    Piglin -> 98
    PiglinBrute -> 99
    Pillager -> 100
    PolarBear -> 101
    SplashPotion -> 102
    LingeringPotion -> 103
    Pufferfish -> 104
    Rabbit -> 105
    Ravager -> 106
    Salmon -> 107
    Sheep -> 108
    Shulker -> 109
    ShulkerBullet -> 110
    Silverfish -> 111
    Skeleton -> 112
    SkeletonHorse -> 113
    Slime -> 114
    SmallFireball -> 115
    Sniffer -> 116
    Snowball -> 117
    SnowGolem -> 118
    MinecartWithMonsterSpawner -> 119
    SpectralArrow -> 120
    Spider -> 121
    SpruceBoat -> 122
    SpruceBoatWithChest -> 123
    Squid -> 124
    Stray -> 125
    Strider -> 126
    Tadpole -> 127
    TextDisplay -> 128
    PrimedTNT -> 129
    MinecartWithTNT -> 130
    TraderLlama -> 131
    Trident -> 132
    TropicalFish -> 133
    Turtle -> 134
    Vex -> 135
    Villager -> 136
    Vindicator -> 137
    WanderingTrader -> 138
    Warden -> 139
    WindCharge -> 140
    Witch -> 141
    Wither -> 142
    WitherSkeleton -> 143
    WitherSkull -> 144
    Wolf -> 145
    Zoglin -> 146
    Zombie -> 147
    ZombieHorse -> 148
    ZombieVillager -> 149
    ZombifiedPiglin -> 150
    Player -> 151
    FishingBobber -> 152
  }
}

pub fn from_id(id: Int) {
  case id {
    0 -> Ok(AcaciaBoat)
    1 -> Ok(AcaciaBoatWithChest)
    2 -> Ok(Allay)
    3 -> Ok(AreaEffectCloud)
    4 -> Ok(Armadillo)
    5 -> Ok(ArmorStand)
    6 -> Ok(Arrow)
    7 -> Ok(Axolotl)
    8 -> Ok(BambooRaftWithChest)
    9 -> Ok(BambooRaft)
    10 -> Ok(Bat)
    11 -> Ok(Bee)
    12 -> Ok(BirchBoat)
    13 -> Ok(BirchBoatWithChest)
    14 -> Ok(Blaze)
    15 -> Ok(BlockDisplay)
    16 -> Ok(Bogged)
    17 -> Ok(Breeze)
    18 -> Ok(WindCharge)
    19 -> Ok(Camel)
    20 -> Ok(Cat)
    21 -> Ok(CaveSpider)
    22 -> Ok(CherryBoat)
    23 -> Ok(CherryBoatWithChest)
    24 -> Ok(MinecartWithChest)
    25 -> Ok(Chicken)
    26 -> Ok(Cod)
    27 -> Ok(CopperGolem)
    28 -> Ok(MinecartWithCommandBlock)
    29 -> Ok(Cow)
    30 -> Ok(Creaking)
    31 -> Ok(Creeper)
    32 -> Ok(DarkOakBoat)
    33 -> Ok(DarkOakBoatWithChest)
    34 -> Ok(Dolphin)
    35 -> Ok(Donkey)
    36 -> Ok(DragonFireball)
    37 -> Ok(Drowned)
    38 -> Ok(ThrownEgg)
    39 -> Ok(ElderGuardian)
    40 -> Ok(Enderman)
    41 -> Ok(Endermite)
    42 -> Ok(EnderDragon)
    43 -> Ok(ThrownEnderPearl)
    44 -> Ok(EndCrystal)
    45 -> Ok(Evoker)
    46 -> Ok(EvokerFangs)
    47 -> Ok(ThrownBottleOEnchanting)
    48 -> Ok(ExperienceOrb)
    49 -> Ok(EyeOfEnder)
    50 -> Ok(FallingBlock)
    51 -> Ok(Fireball)
    52 -> Ok(FireworkRocket)
    53 -> Ok(Fox)
    54 -> Ok(Frog)
    55 -> Ok(MinecartWithFurnace)
    56 -> Ok(Ghast)
    57 -> Ok(HappyGhast)
    58 -> Ok(Giant)
    59 -> Ok(GlowItemFrame)
    60 -> Ok(GlowSquid)
    61 -> Ok(Goat)
    62 -> Ok(Guardian)
    63 -> Ok(Hoglin)
    64 -> Ok(MinecartWithHopper)
    65 -> Ok(Horse)
    66 -> Ok(Husk)
    67 -> Ok(Illusioner)
    68 -> Ok(Interaction)
    69 -> Ok(IronGolem)
    70 -> Ok(Item)
    71 -> Ok(ItemDisplay)
    72 -> Ok(ItemFrame)
    73 -> Ok(JungleBoat)
    74 -> Ok(JungleBoatWithChest)
    75 -> Ok(LeashKnot)
    76 -> Ok(LightningBolt)
    77 -> Ok(Llama)
    78 -> Ok(LlamaSpit)
    79 -> Ok(MagmaCube)
    80 -> Ok(MangroveBoat)
    81 -> Ok(MangroveBoatWithChest)
    82 -> Ok(Mannequin)
    83 -> Ok(Marker)
    84 -> Ok(Minecart)
    85 -> Ok(Mooshroom)
    86 -> Ok(Mule)
    87 -> Ok(OakBoat)
    88 -> Ok(OakBoatWithChest)
    89 -> Ok(Ocelot)
    90 -> Ok(OminousItemSpawner)
    91 -> Ok(Painting)
    92 -> Ok(PaleOakBoat)
    93 -> Ok(PaleOakBoatWithChest)
    94 -> Ok(Panda)
    95 -> Ok(Parrot)
    96 -> Ok(Phantom)
    97 -> Ok(Pig)
    98 -> Ok(Piglin)
    99 -> Ok(PiglinBrute)
    100 -> Ok(Pillager)
    101 -> Ok(PolarBear)
    102 -> Ok(SplashPotion)
    103 -> Ok(LingeringPotion)
    104 -> Ok(Pufferfish)
    105 -> Ok(Rabbit)
    106 -> Ok(Ravager)
    107 -> Ok(Salmon)
    108 -> Ok(Sheep)
    109 -> Ok(Shulker)
    110 -> Ok(ShulkerBullet)
    111 -> Ok(Silverfish)
    112 -> Ok(Skeleton)
    113 -> Ok(SkeletonHorse)
    114 -> Ok(Slime)
    115 -> Ok(SmallFireball)
    116 -> Ok(Sniffer)
    117 -> Ok(Snowball)
    118 -> Ok(SnowGolem)
    119 -> Ok(MinecartWithMonsterSpawner)
    120 -> Ok(SpectralArrow)
    121 -> Ok(Spider)
    122 -> Ok(SpruceBoat)
    123 -> Ok(SpruceBoatWithChest)
    124 -> Ok(Squid)
    125 -> Ok(Stray)
    126 -> Ok(Strider)
    127 -> Ok(Tadpole)
    128 -> Ok(TextDisplay)
    129 -> Ok(PrimedTNT)
    130 -> Ok(MinecartWithTNT)
    131 -> Ok(TraderLlama)
    132 -> Ok(Trident)
    133 -> Ok(TropicalFish)
    134 -> Ok(Turtle)
    135 -> Ok(Vex)
    136 -> Ok(Villager)
    137 -> Ok(Vindicator)
    138 -> Ok(WanderingTrader)
    139 -> Ok(Warden)
    140 -> Ok(WindCharge)
    141 -> Ok(Witch)
    142 -> Ok(Wither)
    143 -> Ok(WitherSkeleton)
    144 -> Ok(WitherSkull)
    145 -> Ok(Wolf)
    146 -> Ok(Zoglin)
    147 -> Ok(Zombie)
    148 -> Ok(ZombieHorse)
    149 -> Ok(ZombieVillager)
    150 -> Ok(ZombifiedPiglin)
    151 -> Ok(Player)
    152 -> Ok(FishingBobber)
    value -> Error(error.InvalidEnumValue("EntityKind", 0, 152, value))
  }
}
