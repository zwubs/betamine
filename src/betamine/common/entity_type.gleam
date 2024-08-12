pub type EntityType {
  Allay
  AreaEffectCloud
  Armadillo
  ArmorStand
  Arrow
  Axolotl
  Bat
  Bee
  Blaze
  BlockDisplay
  Boat
  Bogged
  Breeze
  BreezeWindCharge
  Camel
  Cat
  CaveSpider
  ChestBoat
  MinecartChest
  Chicken
  Cod
  MinecartCommandBlock
  Cow
  Creeper
  Dolphin
  Donkey
  DragonFireball
  Drowned
  ThrownEgg
  ElderGuardian
  EndCrystal
  EnderDragon
  ThrownEnderpearl
  EnderMan
  Endermite
  Evoker
  EvokerFangs
  ThrownExperienceBottle
  ExperienceOrb
  EyeOfEnder
  FallingBlockEntity
  FireworkRocketEntity
  Fox
  Frog
  MinecartFurnace
  Ghast
  Giant
  GlowItemFrame
  GlowSquid
  Goat
  Guardian
  Hoglin
  MinecartHopper
  Horse
  Husk
  Illusioner
  Interaction
  IronGolem
  ItemEntity
  ItemDisplay
  ItemFrame
  OminousItemSpawner
  LargeFireball
  LeashFenceKnotEntity
  LightningBolt
  Llama
  LlamaSpit
  MagmaCube
  Marker
  Minecart
  MushroomCow
  Mule
  Ocelot
  Painting
  Panda
  Parrot
  Phantom
  Pig
  Piglin
  PiglinBrute
  Pillager
  PolarBear
  ThrownPotion
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
  MinecartSpawner
  SpectralArrow
  Spider
  Squid
  Stray
  Strider
  Tadpole
  TextDisplay
  PrimedTnt
  MinecartTNT
  TraderLlama
  ThrownTrident
  TropicalFish
  Turtle
  Vex
  Villager
  Vindicator
  WanderingTrader
  Warden
  WindCharge
  Witch
  WitherBoss
  WitherSkeleton
  WitherSkull
  Wolf
  Zoglin
  Zombie
  ZombieHorse
  ZombieVillager
  ZombifiedPiglin
  Player
  FishingHook
}

pub fn to_id(entity_type: EntityType) {
  case entity_type {
    Allay -> 0
    AreaEffectCloud -> 1
    Armadillo -> 2
    ArmorStand -> 3
    Arrow -> 4
    Axolotl -> 5
    Bat -> 6
    Bee -> 7
    Blaze -> 8
    BlockDisplay -> 9
    Boat -> 10
    Bogged -> 11
    Breeze -> 12
    BreezeWindCharge -> 13
    Camel -> 14
    Cat -> 15
    CaveSpider -> 16
    ChestBoat -> 17
    MinecartChest -> 18
    Chicken -> 19
    Cod -> 20
    MinecartCommandBlock -> 21
    Cow -> 22
    Creeper -> 23
    Dolphin -> 24
    Donkey -> 25
    DragonFireball -> 26
    Drowned -> 27
    ThrownEgg -> 28
    ElderGuardian -> 29
    EndCrystal -> 30
    EnderDragon -> 31
    ThrownEnderpearl -> 32
    EnderMan -> 33
    Endermite -> 34
    Evoker -> 35
    EvokerFangs -> 36
    ThrownExperienceBottle -> 37
    ExperienceOrb -> 38
    EyeOfEnder -> 39
    FallingBlockEntity -> 40
    FireworkRocketEntity -> 41
    Fox -> 42
    Frog -> 43
    MinecartFurnace -> 44
    Ghast -> 45
    Giant -> 46
    GlowItemFrame -> 47
    GlowSquid -> 48
    Goat -> 49
    Guardian -> 50
    Hoglin -> 51
    MinecartHopper -> 52
    Horse -> 53
    Husk -> 54
    Illusioner -> 55
    Interaction -> 56
    IronGolem -> 57
    ItemEntity -> 58
    ItemDisplay -> 59
    ItemFrame -> 60
    OminousItemSpawner -> 61
    LargeFireball -> 62
    LeashFenceKnotEntity -> 63
    LightningBolt -> 64
    Llama -> 65
    LlamaSpit -> 66
    MagmaCube -> 67
    Marker -> 68
    Minecart -> 69
    MushroomCow -> 70
    Mule -> 71
    Ocelot -> 72
    Painting -> 73
    Panda -> 74
    Parrot -> 75
    Phantom -> 76
    Pig -> 77
    Piglin -> 78
    PiglinBrute -> 79
    Pillager -> 80
    PolarBear -> 81
    ThrownPotion -> 82
    Pufferfish -> 83
    Rabbit -> 84
    Ravager -> 85
    Salmon -> 86
    Sheep -> 87
    Shulker -> 88
    ShulkerBullet -> 89
    Silverfish -> 90
    Skeleton -> 91
    SkeletonHorse -> 92
    Slime -> 93
    SmallFireball -> 94
    Sniffer -> 95
    SnowGolem -> 96
    Snowball -> 97
    MinecartSpawner -> 98
    SpectralArrow -> 99
    Spider -> 100
    Squid -> 101
    Stray -> 102
    Strider -> 103
    Tadpole -> 104
    TextDisplay -> 105
    PrimedTnt -> 106
    MinecartTNT -> 107
    TraderLlama -> 108
    ThrownTrident -> 109
    TropicalFish -> 110
    Turtle -> 111
    Vex -> 112
    Villager -> 113
    Vindicator -> 114
    WanderingTrader -> 115
    Warden -> 116
    WindCharge -> 117
    Witch -> 118
    WitherBoss -> 119
    WitherSkeleton -> 120
    WitherSkull -> 121
    Wolf -> 122
    Zoglin -> 123
    Zombie -> 124
    ZombieHorse -> 125
    ZombieVillager -> 126
    ZombifiedPiglin -> 127
    Player -> 128
    FishingHook -> 129
  }
}

pub fn from_id(id: Int) {
  case id {
    0 -> Ok(Allay)
    1 -> Ok(AreaEffectCloud)
    2 -> Ok(Armadillo)
    3 -> Ok(ArmorStand)
    4 -> Ok(Arrow)
    5 -> Ok(Axolotl)
    6 -> Ok(Bat)
    7 -> Ok(Bee)
    8 -> Ok(Blaze)
    9 -> Ok(BlockDisplay)
    10 -> Ok(Boat)
    11 -> Ok(Bogged)
    12 -> Ok(Breeze)
    13 -> Ok(BreezeWindCharge)
    14 -> Ok(Camel)
    15 -> Ok(Cat)
    16 -> Ok(CaveSpider)
    17 -> Ok(ChestBoat)
    18 -> Ok(MinecartChest)
    19 -> Ok(Chicken)
    20 -> Ok(Cod)
    21 -> Ok(MinecartCommandBlock)
    22 -> Ok(Cow)
    23 -> Ok(Creeper)
    24 -> Ok(Dolphin)
    25 -> Ok(Donkey)
    26 -> Ok(DragonFireball)
    27 -> Ok(Drowned)
    28 -> Ok(ThrownEgg)
    29 -> Ok(ElderGuardian)
    30 -> Ok(EndCrystal)
    31 -> Ok(EnderDragon)
    32 -> Ok(ThrownEnderpearl)
    33 -> Ok(EnderMan)
    34 -> Ok(Endermite)
    35 -> Ok(Evoker)
    36 -> Ok(EvokerFangs)
    37 -> Ok(ThrownExperienceBottle)
    38 -> Ok(ExperienceOrb)
    39 -> Ok(EyeOfEnder)
    40 -> Ok(FallingBlockEntity)
    41 -> Ok(FireworkRocketEntity)
    42 -> Ok(Fox)
    43 -> Ok(Frog)
    44 -> Ok(MinecartFurnace)
    45 -> Ok(Ghast)
    46 -> Ok(Giant)
    47 -> Ok(GlowItemFrame)
    48 -> Ok(GlowSquid)
    49 -> Ok(Goat)
    50 -> Ok(Guardian)
    51 -> Ok(Hoglin)
    52 -> Ok(MinecartHopper)
    53 -> Ok(Horse)
    54 -> Ok(Husk)
    55 -> Ok(Illusioner)
    56 -> Ok(Interaction)
    57 -> Ok(IronGolem)
    58 -> Ok(ItemEntity)
    59 -> Ok(ItemDisplay)
    60 -> Ok(ItemFrame)
    61 -> Ok(OminousItemSpawner)
    62 -> Ok(LargeFireball)
    63 -> Ok(LeashFenceKnotEntity)
    64 -> Ok(LightningBolt)
    65 -> Ok(Llama)
    66 -> Ok(LlamaSpit)
    67 -> Ok(MagmaCube)
    68 -> Ok(Marker)
    69 -> Ok(Minecart)
    70 -> Ok(MushroomCow)
    71 -> Ok(Mule)
    72 -> Ok(Ocelot)
    73 -> Ok(Painting)
    74 -> Ok(Panda)
    75 -> Ok(Parrot)
    76 -> Ok(Phantom)
    77 -> Ok(Pig)
    78 -> Ok(Piglin)
    79 -> Ok(PiglinBrute)
    80 -> Ok(Pillager)
    81 -> Ok(PolarBear)
    82 -> Ok(ThrownPotion)
    83 -> Ok(Pufferfish)
    84 -> Ok(Rabbit)
    85 -> Ok(Ravager)
    86 -> Ok(Salmon)
    87 -> Ok(Sheep)
    88 -> Ok(Shulker)
    89 -> Ok(ShulkerBullet)
    90 -> Ok(Silverfish)
    91 -> Ok(Skeleton)
    92 -> Ok(SkeletonHorse)
    93 -> Ok(Slime)
    94 -> Ok(SmallFireball)
    95 -> Ok(Sniffer)
    96 -> Ok(SnowGolem)
    97 -> Ok(Snowball)
    98 -> Ok(MinecartSpawner)
    99 -> Ok(SpectralArrow)
    100 -> Ok(Spider)
    101 -> Ok(Squid)
    102 -> Ok(Stray)
    103 -> Ok(Strider)
    104 -> Ok(Tadpole)
    105 -> Ok(TextDisplay)
    106 -> Ok(PrimedTnt)
    107 -> Ok(MinecartTNT)
    108 -> Ok(TraderLlama)
    109 -> Ok(ThrownTrident)
    110 -> Ok(TropicalFish)
    111 -> Ok(Turtle)
    112 -> Ok(Vex)
    113 -> Ok(Villager)
    114 -> Ok(Vindicator)
    115 -> Ok(WanderingTrader)
    116 -> Ok(Warden)
    117 -> Ok(WindCharge)
    118 -> Ok(Witch)
    119 -> Ok(WitherBoss)
    120 -> Ok(WitherSkeleton)
    121 -> Ok(WitherSkull)
    122 -> Ok(Wolf)
    123 -> Ok(Zoglin)
    124 -> Ok(Zombie)
    125 -> Ok(ZombieHorse)
    126 -> Ok(ZombieVillager)
    127 -> Ok(ZombifiedPiglin)
    128 -> Ok(Player)
    129 -> Ok(FishingHook)
    id -> todo
  }
}
