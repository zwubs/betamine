import betamine/common/block/block_property

pub type BlockState {
  Air
  Stone
  Granite
  PolishedGranite
  Diorite
  PolishedDiorite
  Andesite
  PolishedAndesite
  GrassBlock(snowy: Bool)
  Dirt
  CoarseDirt
  Podzol(snowy: Bool)
  Cobblestone
  OakPlanks
  SprucePlanks
  BirchPlanks
  JunglePlanks
  AcaciaPlanks
  CherryPlanks
  DarkOakPlanks
  PaleOakWood(axis: block_property.Axis)
  PaleOakPlanks
  MangrovePlanks
  BambooPlanks
  BambooMosaic
  OakSapling(stage: block_property.Stage)
  SpruceSapling(stage: block_property.Stage)
  BirchSapling(stage: block_property.Stage)
  JungleSapling(stage: block_property.Stage)
  AcaciaSapling(stage: block_property.Stage)
  CherrySapling(stage: block_property.Stage)
  DarkOakSapling(stage: block_property.Stage)
  PaleOakSapling(stage: block_property.Stage)
  MangrovePropagule(
    age: block_property.Age4,
    hanging: Bool,
    stage: block_property.Stage,
    waterlogged: Bool,
  )
  Bedrock
  Water(level: block_property.LiquidLevel)
  Lava(level: block_property.LiquidLevel)
  Sand
  SuspiciousSand(dusted: block_property.Dusted)
  RedSand
  Gravel
  SuspiciousGravel(dusted: block_property.Dusted)
  GoldOre
  DeepslateGoldOre
  IronOre
  DeepslateIronOre
  CoalOre
  DeepslateCoalOre
  NetherGoldOre
  OakLog(axis: block_property.Axis)
  SpruceLog(axis: block_property.Axis)
  BirchLog(axis: block_property.Axis)
  JungleLog(axis: block_property.Axis)
  AcaciaLog(axis: block_property.Axis)
  CherryLog(axis: block_property.Axis)
  DarkOakLog(axis: block_property.Axis)
  PaleOakLog(axis: block_property.Axis)
  MangroveLog(axis: block_property.Axis)
  MangroveRoots(waterlogged: Bool)
  MuddyMangroveRoots(axis: block_property.Axis)
  BambooBlock(axis: block_property.Axis)
  StrippedSpruceLog(axis: block_property.Axis)
  StrippedBirchLog(axis: block_property.Axis)
  StrippedJungleLog(axis: block_property.Axis)
  StrippedAcaciaLog(axis: block_property.Axis)
  StrippedCherryLog(axis: block_property.Axis)
  StrippedDarkOakLog(axis: block_property.Axis)
  StrippedPaleOakLog(axis: block_property.Axis)
  StrippedOakLog(axis: block_property.Axis)
  StrippedMangroveLog(axis: block_property.Axis)
  StrippedBambooBlock(axis: block_property.Axis)
  OakWood(axis: block_property.Axis)
  SpruceWood(axis: block_property.Axis)
  BirchWood(axis: block_property.Axis)
  JungleWood(axis: block_property.Axis)
  AcaciaWood(axis: block_property.Axis)
  CherryWood(axis: block_property.Axis)
  DarkOakWood(axis: block_property.Axis)
  MangroveWood(axis: block_property.Axis)
  StrippedOakWood(axis: block_property.Axis)
  StrippedSpruceWood(axis: block_property.Axis)
  StrippedBirchWood(axis: block_property.Axis)
  StrippedJungleWood(axis: block_property.Axis)
  StrippedAcaciaWood(axis: block_property.Axis)
  StrippedCherryWood(axis: block_property.Axis)
  StrippedDarkOakWood(axis: block_property.Axis)
  StrippedPaleOakWood(axis: block_property.Axis)
  StrippedMangroveWood(axis: block_property.Axis)
  OakLeaves(
    distance: block_property.LeavesDistance,
    persistent: Bool,
    waterlogged: Bool,
  )
  SpruceLeaves(
    distance: block_property.LeavesDistance,
    persistent: Bool,
    waterlogged: Bool,
  )
  BirchLeaves(
    distance: block_property.LeavesDistance,
    persistent: Bool,
    waterlogged: Bool,
  )
  JungleLeaves(
    distance: block_property.LeavesDistance,
    persistent: Bool,
    waterlogged: Bool,
  )
  AcaciaLeaves(
    distance: block_property.LeavesDistance,
    persistent: Bool,
    waterlogged: Bool,
  )
  CherryLeaves(
    distance: block_property.LeavesDistance,
    persistent: Bool,
    waterlogged: Bool,
  )
  DarkOakLeaves(
    distance: block_property.LeavesDistance,
    persistent: Bool,
    waterlogged: Bool,
  )
  PaleOakLeaves(
    distance: block_property.LeavesDistance,
    persistent: Bool,
    waterlogged: Bool,
  )
  MangroveLeaves(
    distance: block_property.LeavesDistance,
    persistent: Bool,
    waterlogged: Bool,
  )
  AzaleaLeaves(
    distance: block_property.LeavesDistance,
    persistent: Bool,
    waterlogged: Bool,
  )
  FloweringAzaleaLeaves(
    distance: block_property.LeavesDistance,
    persistent: Bool,
    waterlogged: Bool,
  )
  Sponge
  WetSponge
  Glass
  LapisOre
  DeepslateLapisOre
  LapisBlock
  Dispenser(facing: block_property.Facing, triggered: Bool)
  Sandstone
  ChiseledSandstone
  CutSandstone
  NoteBlock(
    instrument: block_property.Instrument,
    note: block_property.Note,
    powered: Bool,
  )
  WhiteBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  OrangeBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  MagentaBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  LightBlueBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  YellowBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  LimeBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  PinkBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  GrayBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  LightGrayBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  CyanBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  PurpleBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  BlueBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  BrownBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  GreenBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  RedBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  BlackBed(
    facing: block_property.FacingCardinal,
    occupied: Bool,
    part: block_property.BedPart,
  )
  PoweredRail(
    powered: Bool,
    shape: block_property.RailShapeStraight,
    waterlogged: Bool,
  )
  DetectorRail(
    powered: Bool,
    shape: block_property.RailShapeStraight,
    waterlogged: Bool,
  )
  StickyPiston(extended: Bool, facing: block_property.Facing)
  Cobweb
  ShortGrass
  Fern
  DeadBush
  Bush
  ShortDryGrass
  TallDryGrass
  Seagrass
  TallSeagrass(half: block_property.DoubleBlockHalf)
  Piston(extended: Bool, facing: block_property.Facing)
  PistonHead(
    facing: block_property.Facing,
    short: Bool,
    piston_type: block_property.PistonType,
  )
  WhiteWool
  OrangeWool
  MagentaWool
  LightBlueWool
  YellowWool
  LimeWool
  PinkWool
  GrayWool
  LightGrayWool
  CyanWool
  PurpleWool
  BlueWool
  BrownWool
  GreenWool
  RedWool
  BlackWool
  MovingPiston(
    facing: block_property.Facing,
    piston_type: block_property.PistonType,
  )
  Dandelion
  Torchflower
  Poppy
  BlueOrchid
  Allium
  AzureBluet
  RedTulip
  OrangeTulip
  WhiteTulip
  PinkTulip
  OxeyeDaisy
  Cornflower
  WitherRose
  LilyOfTheValley
  BrownMushroom
  RedMushroom
  GoldBlock
  IronBlock
  Bricks
  Tnt(unstable: Bool)
  Bookshelf
  ChiseledBookshelf(
    facing: block_property.FacingCardinal,
    slot_0_occupied: Bool,
    slot_1_occupied: Bool,
    slot_2_occupied: Bool,
    slot_3_occupied: Bool,
    slot_4_occupied: Bool,
    slot_5_occupied: Bool,
  )
  AcaciaShelf(
    facing: block_property.FacingCardinal,
    powered: Bool,
    side_chain: block_property.SideChain,
    waterlogged: Bool,
  )
  BambooShelf(
    facing: block_property.FacingCardinal,
    powered: Bool,
    side_chain: block_property.SideChain,
    waterlogged: Bool,
  )
  BirchShelf(
    facing: block_property.FacingCardinal,
    powered: Bool,
    side_chain: block_property.SideChain,
    waterlogged: Bool,
  )
  CherryShelf(
    facing: block_property.FacingCardinal,
    powered: Bool,
    side_chain: block_property.SideChain,
    waterlogged: Bool,
  )
  CrimsonShelf(
    facing: block_property.FacingCardinal,
    powered: Bool,
    side_chain: block_property.SideChain,
    waterlogged: Bool,
  )
  DarkOakShelf(
    facing: block_property.FacingCardinal,
    powered: Bool,
    side_chain: block_property.SideChain,
    waterlogged: Bool,
  )
  JungleShelf(
    facing: block_property.FacingCardinal,
    powered: Bool,
    side_chain: block_property.SideChain,
    waterlogged: Bool,
  )
  MangroveShelf(
    facing: block_property.FacingCardinal,
    powered: Bool,
    side_chain: block_property.SideChain,
    waterlogged: Bool,
  )
  OakShelf(
    facing: block_property.FacingCardinal,
    powered: Bool,
    side_chain: block_property.SideChain,
    waterlogged: Bool,
  )
  PaleOakShelf(
    facing: block_property.FacingCardinal,
    powered: Bool,
    side_chain: block_property.SideChain,
    waterlogged: Bool,
  )
  SpruceShelf(
    facing: block_property.FacingCardinal,
    powered: Bool,
    side_chain: block_property.SideChain,
    waterlogged: Bool,
  )
  WarpedShelf(
    facing: block_property.FacingCardinal,
    powered: Bool,
    side_chain: block_property.SideChain,
    waterlogged: Bool,
  )
  MossyCobblestone
  Obsidian
  Torch
  WallTorch(facing: block_property.FacingCardinal)
  Fire(
    age: block_property.Age15,
    east: Bool,
    north: Bool,
    south: Bool,
    up: Bool,
    west: Bool,
  )
  SoulFire
  Spawner
  CreakingHeart(
    axis: block_property.Axis,
    creaking_heart_state: block_property.CreakingHeartState,
    natural: Bool,
  )
  OakStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  Chest(
    facing: block_property.FacingCardinal,
    chest_type: block_property.ChestType,
    waterlogged: Bool,
  )
  RedstoneWire(
    east: block_property.RedstoneSide,
    north: block_property.RedstoneSide,
    power: block_property.Power,
    south: block_property.RedstoneSide,
    west: block_property.RedstoneSide,
  )
  DiamondOre
  DeepslateDiamondOre
  DiamondBlock
  CraftingTable
  Wheat(age: block_property.Age7)
  Farmland(moisture: block_property.Moisture)
  Furnace(facing: block_property.FacingCardinal, lit: Bool)
  OakSign(rotation: block_property.Rotation, waterlogged: Bool)
  SpruceSign(rotation: block_property.Rotation, waterlogged: Bool)
  BirchSign(rotation: block_property.Rotation, waterlogged: Bool)
  AcaciaSign(rotation: block_property.Rotation, waterlogged: Bool)
  CherrySign(rotation: block_property.Rotation, waterlogged: Bool)
  JungleSign(rotation: block_property.Rotation, waterlogged: Bool)
  DarkOakSign(rotation: block_property.Rotation, waterlogged: Bool)
  PaleOakSign(rotation: block_property.Rotation, waterlogged: Bool)
  MangroveSign(rotation: block_property.Rotation, waterlogged: Bool)
  BambooSign(rotation: block_property.Rotation, waterlogged: Bool)
  OakDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  Ladder(facing: block_property.FacingCardinal, waterlogged: Bool)
  Rail(shape: block_property.RailShape, waterlogged: Bool)
  CobblestoneStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  OakWallSign(facing: block_property.FacingCardinal, waterlogged: Bool)
  SpruceWallSign(facing: block_property.FacingCardinal, waterlogged: Bool)
  BirchWallSign(facing: block_property.FacingCardinal, waterlogged: Bool)
  AcaciaWallSign(facing: block_property.FacingCardinal, waterlogged: Bool)
  CherryWallSign(facing: block_property.FacingCardinal, waterlogged: Bool)
  JungleWallSign(facing: block_property.FacingCardinal, waterlogged: Bool)
  DarkOakWallSign(facing: block_property.FacingCardinal, waterlogged: Bool)
  PaleOakWallSign(facing: block_property.FacingCardinal, waterlogged: Bool)
  MangroveWallSign(facing: block_property.FacingCardinal, waterlogged: Bool)
  BambooWallSign(facing: block_property.FacingCardinal, waterlogged: Bool)
  OakHangingSign(
    attached: Bool,
    rotation: block_property.Rotation,
    waterlogged: Bool,
  )
  SpruceHangingSign(
    attached: Bool,
    rotation: block_property.Rotation,
    waterlogged: Bool,
  )
  BirchHangingSign(
    attached: Bool,
    rotation: block_property.Rotation,
    waterlogged: Bool,
  )
  AcaciaHangingSign(
    attached: Bool,
    rotation: block_property.Rotation,
    waterlogged: Bool,
  )
  CherryHangingSign(
    attached: Bool,
    rotation: block_property.Rotation,
    waterlogged: Bool,
  )
  JungleHangingSign(
    attached: Bool,
    rotation: block_property.Rotation,
    waterlogged: Bool,
  )
  DarkOakHangingSign(
    attached: Bool,
    rotation: block_property.Rotation,
    waterlogged: Bool,
  )
  PaleOakHangingSign(
    attached: Bool,
    rotation: block_property.Rotation,
    waterlogged: Bool,
  )
  CrimsonHangingSign(
    attached: Bool,
    rotation: block_property.Rotation,
    waterlogged: Bool,
  )
  WarpedHangingSign(
    attached: Bool,
    rotation: block_property.Rotation,
    waterlogged: Bool,
  )
  MangroveHangingSign(
    attached: Bool,
    rotation: block_property.Rotation,
    waterlogged: Bool,
  )
  BambooHangingSign(
    attached: Bool,
    rotation: block_property.Rotation,
    waterlogged: Bool,
  )
  OakWallHangingSign(facing: block_property.FacingCardinal, waterlogged: Bool)
  SpruceWallHangingSign(
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  BirchWallHangingSign(facing: block_property.FacingCardinal, waterlogged: Bool)
  AcaciaWallHangingSign(
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  CherryWallHangingSign(
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  JungleWallHangingSign(
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  DarkOakWallHangingSign(
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  PaleOakWallHangingSign(
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  MangroveWallHangingSign(
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  CrimsonWallHangingSign(
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  WarpedWallHangingSign(
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  BambooWallHangingSign(
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  Lever(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  StonePressurePlate(powered: Bool)
  IronDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  OakPressurePlate(powered: Bool)
  SprucePressurePlate(powered: Bool)
  BirchPressurePlate(powered: Bool)
  JunglePressurePlate(powered: Bool)
  AcaciaPressurePlate(powered: Bool)
  CherryPressurePlate(powered: Bool)
  DarkOakPressurePlate(powered: Bool)
  PaleOakPressurePlate(powered: Bool)
  MangrovePressurePlate(powered: Bool)
  BambooPressurePlate(powered: Bool)
  RedstoneOre(lit: Bool)
  DeepslateRedstoneOre(lit: Bool)
  RedstoneTorch(lit: Bool)
  RedstoneWallTorch(facing: block_property.FacingCardinal, lit: Bool)
  StoneButton(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  Snow(layers: block_property.Layers)
  Ice
  SnowBlock
  Cactus(age: block_property.Age15)
  CactusFlower
  Clay
  SugarCane(age: block_property.Age15)
  Jukebox(has_record: Bool)
  OakFence(east: Bool, north: Bool, south: Bool, waterlogged: Bool, west: Bool)
  Netherrack
  SoulSand
  SoulSoil
  Basalt(axis: block_property.Axis)
  PolishedBasalt(axis: block_property.Axis)
  SoulTorch
  SoulWallTorch(facing: block_property.FacingCardinal)
  CopperTorch
  CopperWallTorch(facing: block_property.FacingCardinal)
  Glowstone
  NetherPortal(axis: block_property.HorizontalAxis)
  CarvedPumpkin(facing: block_property.FacingCardinal)
  JackOLantern(facing: block_property.FacingCardinal)
  Cake(bites: block_property.Bites)
  Repeater(
    delay: block_property.Delay,
    facing: block_property.FacingCardinal,
    locked: Bool,
    powered: Bool,
  )
  WhiteStainedGlass
  OrangeStainedGlass
  MagentaStainedGlass
  LightBlueStainedGlass
  YellowStainedGlass
  LimeStainedGlass
  PinkStainedGlass
  GrayStainedGlass
  LightGrayStainedGlass
  CyanStainedGlass
  PurpleStainedGlass
  BlueStainedGlass
  BrownStainedGlass
  GreenStainedGlass
  RedStainedGlass
  BlackStainedGlass
  OakTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  SpruceTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  BirchTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  JungleTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  AcaciaTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  CherryTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  DarkOakTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  PaleOakTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  MangroveTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  BambooTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  StoneBricks
  MossyStoneBricks
  CrackedStoneBricks
  ChiseledStoneBricks
  PackedMud
  MudBricks
  InfestedStone
  InfestedCobblestone
  InfestedStoneBricks
  InfestedMossyStoneBricks
  InfestedCrackedStoneBricks
  InfestedChiseledStoneBricks
  BrownMushroomBlock(
    down: Bool,
    east: Bool,
    north: Bool,
    south: Bool,
    up: Bool,
    west: Bool,
  )
  RedMushroomBlock(
    down: Bool,
    east: Bool,
    north: Bool,
    south: Bool,
    up: Bool,
    west: Bool,
  )
  MushroomStem(
    down: Bool,
    east: Bool,
    north: Bool,
    south: Bool,
    up: Bool,
    west: Bool,
  )
  IronBars(east: Bool, north: Bool, south: Bool, waterlogged: Bool, west: Bool)
  CopperBars(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  ExposedCopperBars(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  WeatheredCopperBars(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  OxidizedCopperBars(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  WaxedCopperBars(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  WaxedExposedCopperBars(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  WaxedWeatheredCopperBars(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  WaxedOxidizedCopperBars(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  IronChain(axis: block_property.Axis, waterlogged: Bool)
  CopperChain(axis: block_property.Axis, waterlogged: Bool)
  ExposedCopperChain(axis: block_property.Axis, waterlogged: Bool)
  WeatheredCopperChain(axis: block_property.Axis, waterlogged: Bool)
  OxidizedCopperChain(axis: block_property.Axis, waterlogged: Bool)
  WaxedCopperChain(axis: block_property.Axis, waterlogged: Bool)
  WaxedExposedCopperChain(axis: block_property.Axis, waterlogged: Bool)
  WaxedWeatheredCopperChain(axis: block_property.Axis, waterlogged: Bool)
  WaxedOxidizedCopperChain(axis: block_property.Axis, waterlogged: Bool)
  GlassPane(east: Bool, north: Bool, south: Bool, waterlogged: Bool, west: Bool)
  Pumpkin
  Melon
  AttachedPumpkinStem(facing: block_property.FacingCardinal)
  AttachedMelonStem(facing: block_property.FacingCardinal)
  PumpkinStem(age: block_property.Age7)
  MelonStem(age: block_property.Age7)
  Vine(east: Bool, north: Bool, south: Bool, up: Bool, west: Bool)
  GlowLichen(
    down: Bool,
    east: Bool,
    north: Bool,
    south: Bool,
    up: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  ResinClump(
    down: Bool,
    east: Bool,
    north: Bool,
    south: Bool,
    up: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  OakFenceGate(
    facing: block_property.FacingCardinal,
    in_wall: Bool,
    open: Bool,
    powered: Bool,
  )
  BrickStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  StoneBrickStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  MudBrickStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  Mycelium(snowy: Bool)
  LilyPad
  ResinBlock
  ResinBricks
  ResinBrickStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  ResinBrickSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  ResinBrickWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  ChiseledResinBricks
  NetherBricks
  NetherBrickFence(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  NetherBrickStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  NetherWart(age: block_property.Age3)
  EnchantingTable
  BrewingStand(has_bottle_0: Bool, has_bottle_1: Bool, has_bottle_2: Bool)
  Cauldron
  WaterCauldron(level: block_property.CauldronLevel)
  LavaCauldron
  PowderSnowCauldron(level: block_property.CauldronLevel)
  EndPortal
  EndPortalFrame(eye: Bool, facing: block_property.FacingCardinal)
  EndStone
  DragonEgg
  RedstoneLamp(lit: Bool)
  Cocoa(age: block_property.Age2, facing: block_property.FacingCardinal)
  SandstoneStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  EmeraldOre
  DeepslateEmeraldOre
  EnderChest(facing: block_property.FacingCardinal, waterlogged: Bool)
  TripwireHook(
    attached: Bool,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  Tripwire(
    attached: Bool,
    disarmed: Bool,
    east: Bool,
    north: Bool,
    powered: Bool,
    south: Bool,
    west: Bool,
  )
  EmeraldBlock
  SpruceStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  BirchStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  JungleStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  CommandBlock(conditional: Bool, facing: block_property.Facing)
  Beacon
  CobblestoneWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  MossyCobblestoneWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  FlowerPot
  PottedTorchflower
  PottedOakSapling
  PottedSpruceSapling
  PottedBirchSapling
  PottedJungleSapling
  PottedAcaciaSapling
  PottedCherrySapling
  PottedDarkOakSapling
  PottedPaleOakSapling
  PottedMangrovePropagule
  PottedFern
  PottedDandelion
  PottedPoppy
  PottedBlueOrchid
  PottedAllium
  PottedAzureBluet
  PottedRedTulip
  PottedOrangeTulip
  PottedWhiteTulip
  PottedPinkTulip
  PottedOxeyeDaisy
  PottedCornflower
  PottedLilyOfTheValley
  PottedWitherRose
  PottedRedMushroom
  PottedBrownMushroom
  PottedDeadBush
  PottedCactus
  Carrots(age: block_property.Age7)
  Potatoes(age: block_property.Age7)
  OakButton(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  SpruceButton(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  BirchButton(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  JungleButton(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  AcaciaButton(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  CherryButton(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  DarkOakButton(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  PaleOakButton(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  MangroveButton(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  BambooButton(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  SkeletonSkull(powered: Bool, rotation: block_property.Rotation)
  SkeletonWallSkull(facing: block_property.FacingCardinal, powered: Bool)
  WitherSkeletonSkull(powered: Bool, rotation: block_property.Rotation)
  WitherSkeletonWallSkull(facing: block_property.FacingCardinal, powered: Bool)
  ZombieHead(powered: Bool, rotation: block_property.Rotation)
  ZombieWallHead(facing: block_property.FacingCardinal, powered: Bool)
  PlayerHead(powered: Bool, rotation: block_property.Rotation)
  PlayerWallHead(facing: block_property.FacingCardinal, powered: Bool)
  CreeperHead(powered: Bool, rotation: block_property.Rotation)
  CreeperWallHead(facing: block_property.FacingCardinal, powered: Bool)
  DragonHead(powered: Bool, rotation: block_property.Rotation)
  DragonWallHead(facing: block_property.FacingCardinal, powered: Bool)
  PiglinHead(powered: Bool, rotation: block_property.Rotation)
  PiglinWallHead(facing: block_property.FacingCardinal, powered: Bool)
  Anvil(facing: block_property.FacingCardinal)
  ChippedAnvil(facing: block_property.FacingCardinal)
  DamagedAnvil(facing: block_property.FacingCardinal)
  TrappedChest(
    facing: block_property.FacingCardinal,
    chest_type: block_property.ChestType,
    waterlogged: Bool,
  )
  LightWeightedPressurePlate(power: block_property.Power)
  HeavyWeightedPressurePlate(power: block_property.Power)
  Comparator(
    facing: block_property.FacingCardinal,
    mode: block_property.ComparatorMode,
    powered: Bool,
  )
  DaylightDetector(inverted: Bool, power: block_property.Power)
  RedstoneBlock
  NetherQuartzOre
  Hopper(enabled: Bool, facing: block_property.FacingHopper)
  QuartzBlock
  ChiseledQuartzBlock
  QuartzPillar(axis: block_property.Axis)
  QuartzStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  ActivatorRail(
    powered: Bool,
    shape: block_property.RailShapeStraight,
    waterlogged: Bool,
  )
  Dropper(facing: block_property.Facing, triggered: Bool)
  WhiteTerracotta
  OrangeTerracotta
  MagentaTerracotta
  LightBlueTerracotta
  YellowTerracotta
  LimeTerracotta
  PinkTerracotta
  GrayTerracotta
  LightGrayTerracotta
  CyanTerracotta
  PurpleTerracotta
  BlueTerracotta
  BrownTerracotta
  GreenTerracotta
  RedTerracotta
  BlackTerracotta
  WhiteStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  OrangeStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  MagentaStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  LightBlueStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  YellowStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  LimeStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  PinkStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  GrayStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  LightGrayStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  CyanStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  PurpleStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  BlueStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  BrownStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  GreenStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  RedStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  BlackStainedGlassPane(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  AcaciaStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  CherryStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  DarkOakStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  PaleOakStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  MangroveStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  BambooStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  BambooMosaicStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  SlimeBlock
  Barrier(waterlogged: Bool)
  Light(level: block_property.LightLevel, waterlogged: Bool)
  IronTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  Prismarine
  PrismarineBricks
  DarkPrismarine
  PrismarineStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  PrismarineBrickStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  DarkPrismarineStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  PrismarineSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  PrismarineBrickSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  DarkPrismarineSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  SeaLantern
  HayBlock(axis: block_property.Axis)
  WhiteCarpet
  OrangeCarpet
  MagentaCarpet
  LightBlueCarpet
  YellowCarpet
  LimeCarpet
  PinkCarpet
  GrayCarpet
  LightGrayCarpet
  CyanCarpet
  PurpleCarpet
  BlueCarpet
  BrownCarpet
  GreenCarpet
  RedCarpet
  BlackCarpet
  Terracotta
  CoalBlock
  PackedIce
  Sunflower(half: block_property.DoubleBlockHalf)
  Lilac(half: block_property.DoubleBlockHalf)
  RoseBush(half: block_property.DoubleBlockHalf)
  Peony(half: block_property.DoubleBlockHalf)
  TallGrass(half: block_property.DoubleBlockHalf)
  LargeFern(half: block_property.DoubleBlockHalf)
  WhiteBanner(rotation: block_property.Rotation)
  OrangeBanner(rotation: block_property.Rotation)
  MagentaBanner(rotation: block_property.Rotation)
  LightBlueBanner(rotation: block_property.Rotation)
  YellowBanner(rotation: block_property.Rotation)
  LimeBanner(rotation: block_property.Rotation)
  PinkBanner(rotation: block_property.Rotation)
  GrayBanner(rotation: block_property.Rotation)
  LightGrayBanner(rotation: block_property.Rotation)
  CyanBanner(rotation: block_property.Rotation)
  PurpleBanner(rotation: block_property.Rotation)
  BlueBanner(rotation: block_property.Rotation)
  BrownBanner(rotation: block_property.Rotation)
  GreenBanner(rotation: block_property.Rotation)
  RedBanner(rotation: block_property.Rotation)
  BlackBanner(rotation: block_property.Rotation)
  WhiteWallBanner(facing: block_property.FacingCardinal)
  OrangeWallBanner(facing: block_property.FacingCardinal)
  MagentaWallBanner(facing: block_property.FacingCardinal)
  LightBlueWallBanner(facing: block_property.FacingCardinal)
  YellowWallBanner(facing: block_property.FacingCardinal)
  LimeWallBanner(facing: block_property.FacingCardinal)
  PinkWallBanner(facing: block_property.FacingCardinal)
  GrayWallBanner(facing: block_property.FacingCardinal)
  LightGrayWallBanner(facing: block_property.FacingCardinal)
  CyanWallBanner(facing: block_property.FacingCardinal)
  PurpleWallBanner(facing: block_property.FacingCardinal)
  BlueWallBanner(facing: block_property.FacingCardinal)
  BrownWallBanner(facing: block_property.FacingCardinal)
  GreenWallBanner(facing: block_property.FacingCardinal)
  RedWallBanner(facing: block_property.FacingCardinal)
  BlackWallBanner(facing: block_property.FacingCardinal)
  RedSandstone
  ChiseledRedSandstone
  CutRedSandstone
  RedSandstoneStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  OakSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  SpruceSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  BirchSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  JungleSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  AcaciaSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  CherrySlab(slab_type: block_property.SlabType, waterlogged: Bool)
  DarkOakSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  PaleOakSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  MangroveSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  BambooSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  BambooMosaicSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  StoneSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  SmoothStoneSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  SandstoneSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  CutSandstoneSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  PetrifiedOakSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  CobblestoneSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  BrickSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  StoneBrickSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  MudBrickSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  NetherBrickSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  QuartzSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  RedSandstoneSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  CutRedSandstoneSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  PurpurSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  SmoothStone
  SmoothSandstone
  SmoothQuartz
  SmoothRedSandstone
  SpruceFenceGate(
    facing: block_property.FacingCardinal,
    in_wall: Bool,
    open: Bool,
    powered: Bool,
  )
  BirchFenceGate(
    facing: block_property.FacingCardinal,
    in_wall: Bool,
    open: Bool,
    powered: Bool,
  )
  JungleFenceGate(
    facing: block_property.FacingCardinal,
    in_wall: Bool,
    open: Bool,
    powered: Bool,
  )
  AcaciaFenceGate(
    facing: block_property.FacingCardinal,
    in_wall: Bool,
    open: Bool,
    powered: Bool,
  )
  CherryFenceGate(
    facing: block_property.FacingCardinal,
    in_wall: Bool,
    open: Bool,
    powered: Bool,
  )
  DarkOakFenceGate(
    facing: block_property.FacingCardinal,
    in_wall: Bool,
    open: Bool,
    powered: Bool,
  )
  PaleOakFenceGate(
    facing: block_property.FacingCardinal,
    in_wall: Bool,
    open: Bool,
    powered: Bool,
  )
  MangroveFenceGate(
    facing: block_property.FacingCardinal,
    in_wall: Bool,
    open: Bool,
    powered: Bool,
  )
  BambooFenceGate(
    facing: block_property.FacingCardinal,
    in_wall: Bool,
    open: Bool,
    powered: Bool,
  )
  SpruceFence(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  BirchFence(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  JungleFence(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  AcaciaFence(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  CherryFence(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  DarkOakFence(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  PaleOakFence(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  MangroveFence(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  BambooFence(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  SpruceDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  BirchDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  JungleDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  AcaciaDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  CherryDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  DarkOakDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  PaleOakDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  MangroveDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  BambooDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  EndRod(facing: block_property.Facing)
  ChorusPlant(
    down: Bool,
    east: Bool,
    north: Bool,
    south: Bool,
    up: Bool,
    west: Bool,
  )
  ChorusFlower(age: block_property.Age5)
  PurpurBlock
  PurpurPillar(axis: block_property.Axis)
  PurpurStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  EndStoneBricks
  TorchflowerCrop(age: block_property.Age1)
  PitcherCrop(age: block_property.Age4, half: block_property.DoubleBlockHalf)
  PitcherPlant(half: block_property.DoubleBlockHalf)
  Beetroots(age: block_property.Age3)
  DirtPath
  EndGateway
  RepeatingCommandBlock(conditional: Bool, facing: block_property.Facing)
  ChainCommandBlock(conditional: Bool, facing: block_property.Facing)
  FrostedIce(age: block_property.Age3)
  MagmaBlock
  NetherWartBlock
  RedNetherBricks
  BoneBlock(axis: block_property.Axis)
  StructureVoid
  Observer(facing: block_property.Facing, powered: Bool)
  ShulkerBox(facing: block_property.Facing)
  WhiteShulkerBox(facing: block_property.Facing)
  OrangeShulkerBox(facing: block_property.Facing)
  MagentaShulkerBox(facing: block_property.Facing)
  LightBlueShulkerBox(facing: block_property.Facing)
  YellowShulkerBox(facing: block_property.Facing)
  LimeShulkerBox(facing: block_property.Facing)
  PinkShulkerBox(facing: block_property.Facing)
  GrayShulkerBox(facing: block_property.Facing)
  LightGrayShulkerBox(facing: block_property.Facing)
  CyanShulkerBox(facing: block_property.Facing)
  PurpleShulkerBox(facing: block_property.Facing)
  BlueShulkerBox(facing: block_property.Facing)
  BrownShulkerBox(facing: block_property.Facing)
  GreenShulkerBox(facing: block_property.Facing)
  RedShulkerBox(facing: block_property.Facing)
  BlackShulkerBox(facing: block_property.Facing)
  WhiteGlazedTerracotta(facing: block_property.FacingCardinal)
  OrangeGlazedTerracotta(facing: block_property.FacingCardinal)
  MagentaGlazedTerracotta(facing: block_property.FacingCardinal)
  LightBlueGlazedTerracotta(facing: block_property.FacingCardinal)
  YellowGlazedTerracotta(facing: block_property.FacingCardinal)
  LimeGlazedTerracotta(facing: block_property.FacingCardinal)
  PinkGlazedTerracotta(facing: block_property.FacingCardinal)
  GrayGlazedTerracotta(facing: block_property.FacingCardinal)
  LightGrayGlazedTerracotta(facing: block_property.FacingCardinal)
  CyanGlazedTerracotta(facing: block_property.FacingCardinal)
  PurpleGlazedTerracotta(facing: block_property.FacingCardinal)
  BlueGlazedTerracotta(facing: block_property.FacingCardinal)
  BrownGlazedTerracotta(facing: block_property.FacingCardinal)
  GreenGlazedTerracotta(facing: block_property.FacingCardinal)
  RedGlazedTerracotta(facing: block_property.FacingCardinal)
  BlackGlazedTerracotta(facing: block_property.FacingCardinal)
  WhiteConcrete
  OrangeConcrete
  MagentaConcrete
  LightBlueConcrete
  YellowConcrete
  LimeConcrete
  PinkConcrete
  GrayConcrete
  LightGrayConcrete
  CyanConcrete
  PurpleConcrete
  BlueConcrete
  BrownConcrete
  GreenConcrete
  RedConcrete
  BlackConcrete
  WhiteConcretePowder
  OrangeConcretePowder
  MagentaConcretePowder
  LightBlueConcretePowder
  YellowConcretePowder
  LimeConcretePowder
  PinkConcretePowder
  GrayConcretePowder
  LightGrayConcretePowder
  CyanConcretePowder
  PurpleConcretePowder
  BlueConcretePowder
  BrownConcretePowder
  GreenConcretePowder
  RedConcretePowder
  BlackConcretePowder
  Kelp(age: block_property.Age25)
  KelpPlant
  DriedKelpBlock
  TurtleEgg(eggs: block_property.Eggs, hatch: block_property.Hatch)
  SnifferEgg(hatch: block_property.Hatch)
  DriedGhast(
    facing: block_property.FacingCardinal,
    hydration: block_property.Hydration,
    waterlogged: Bool,
  )
  DeadTubeCoralBlock
  DeadBrainCoralBlock
  DeadBubbleCoralBlock
  DeadFireCoralBlock
  DeadHornCoralBlock
  TubeCoralBlock
  BrainCoralBlock
  BubbleCoralBlock
  FireCoralBlock
  HornCoralBlock
  DeadTubeCoral(waterlogged: Bool)
  DeadBrainCoral(waterlogged: Bool)
  DeadBubbleCoral(waterlogged: Bool)
  DeadFireCoral(waterlogged: Bool)
  DeadHornCoral(waterlogged: Bool)
  TubeCoral(waterlogged: Bool)
  BrainCoral(waterlogged: Bool)
  BubbleCoral(waterlogged: Bool)
  FireCoral(waterlogged: Bool)
  HornCoral(waterlogged: Bool)
  DeadTubeCoralFan(waterlogged: Bool)
  DeadBrainCoralFan(waterlogged: Bool)
  DeadBubbleCoralFan(waterlogged: Bool)
  DeadFireCoralFan(waterlogged: Bool)
  DeadHornCoralFan(waterlogged: Bool)
  TubeCoralFan(waterlogged: Bool)
  BrainCoralFan(waterlogged: Bool)
  BubbleCoralFan(waterlogged: Bool)
  FireCoralFan(waterlogged: Bool)
  HornCoralFan(waterlogged: Bool)
  DeadTubeCoralWallFan(facing: block_property.FacingCardinal, waterlogged: Bool)
  DeadBrainCoralWallFan(
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  DeadBubbleCoralWallFan(
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  DeadFireCoralWallFan(facing: block_property.FacingCardinal, waterlogged: Bool)
  DeadHornCoralWallFan(facing: block_property.FacingCardinal, waterlogged: Bool)
  TubeCoralWallFan(facing: block_property.FacingCardinal, waterlogged: Bool)
  BrainCoralWallFan(facing: block_property.FacingCardinal, waterlogged: Bool)
  BubbleCoralWallFan(facing: block_property.FacingCardinal, waterlogged: Bool)
  FireCoralWallFan(facing: block_property.FacingCardinal, waterlogged: Bool)
  HornCoralWallFan(facing: block_property.FacingCardinal, waterlogged: Bool)
  SeaPickle(pickles: block_property.Pickles, waterlogged: Bool)
  BlueIce
  Conduit(waterlogged: Bool)
  BambooSapling
  Bamboo(
    age: block_property.Age1,
    leaves: block_property.Leaves,
    stage: block_property.Stage,
  )
  PottedBamboo
  VoidAir
  CaveAir
  BubbleColumn(drag: Bool)
  PolishedGraniteStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  SmoothRedSandstoneStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  MossyStoneBrickStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  PolishedDioriteStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  MossyCobblestoneStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  EndStoneBrickStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  StoneStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  SmoothSandstoneStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  SmoothQuartzStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  GraniteStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  AndesiteStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  RedNetherBrickStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  PolishedAndesiteStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  DioriteStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  PolishedGraniteSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  SmoothRedSandstoneSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  MossyStoneBrickSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  PolishedDioriteSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  MossyCobblestoneSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  EndStoneBrickSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  SmoothSandstoneSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  SmoothQuartzSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  GraniteSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  AndesiteSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  RedNetherBrickSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  PolishedAndesiteSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  DioriteSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  BrickWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  PrismarineWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  RedSandstoneWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  MossyStoneBrickWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  GraniteWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  StoneBrickWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  MudBrickWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  NetherBrickWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  AndesiteWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  RedNetherBrickWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  SandstoneWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  EndStoneBrickWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  DioriteWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  Scaffolding(
    bottom: Bool,
    distance: block_property.ScaffoldingDistance,
    waterlogged: Bool,
  )
  Loom(facing: block_property.FacingCardinal)
  Barrel(facing: block_property.Facing, open: Bool)
  Smoker(facing: block_property.FacingCardinal, lit: Bool)
  BlastFurnace(facing: block_property.FacingCardinal, lit: Bool)
  CartographyTable
  FletchingTable
  Grindstone(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
  )
  Lectern(facing: block_property.FacingCardinal, has_book: Bool, powered: Bool)
  SmithingTable
  Stonecutter(facing: block_property.FacingCardinal)
  Bell(
    attachment: block_property.Attachment,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  Lantern(hanging: Bool, waterlogged: Bool)
  SoulLantern(hanging: Bool, waterlogged: Bool)
  CopperLantern(hanging: Bool, waterlogged: Bool)
  ExposedCopperLantern(hanging: Bool, waterlogged: Bool)
  WeatheredCopperLantern(hanging: Bool, waterlogged: Bool)
  OxidizedCopperLantern(hanging: Bool, waterlogged: Bool)
  WaxedCopperLantern(hanging: Bool, waterlogged: Bool)
  WaxedExposedCopperLantern(hanging: Bool, waterlogged: Bool)
  WaxedWeatheredCopperLantern(hanging: Bool, waterlogged: Bool)
  WaxedOxidizedCopperLantern(hanging: Bool, waterlogged: Bool)
  Campfire(
    facing: block_property.FacingCardinal,
    lit: Bool,
    signal_fire: Bool,
    waterlogged: Bool,
  )
  SoulCampfire(
    facing: block_property.FacingCardinal,
    lit: Bool,
    signal_fire: Bool,
    waterlogged: Bool,
  )
  SweetBerryBush(age: block_property.Age3)
  WarpedStem(axis: block_property.Axis)
  StrippedWarpedStem(axis: block_property.Axis)
  WarpedHyphae(axis: block_property.Axis)
  StrippedWarpedHyphae(axis: block_property.Axis)
  WarpedNylium
  WarpedFungus
  WarpedWartBlock
  WarpedRoots
  NetherSprouts
  CrimsonStem(axis: block_property.Axis)
  StrippedCrimsonStem(axis: block_property.Axis)
  CrimsonHyphae(axis: block_property.Axis)
  StrippedCrimsonHyphae(axis: block_property.Axis)
  CrimsonNylium
  CrimsonFungus
  Shroomlight
  WeepingVines(age: block_property.Age25)
  WeepingVinesPlant
  TwistingVines(age: block_property.Age25)
  TwistingVinesPlant
  CrimsonRoots
  CrimsonPlanks
  WarpedPlanks
  CrimsonSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  WarpedSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  CrimsonPressurePlate(powered: Bool)
  WarpedPressurePlate(powered: Bool)
  CrimsonFence(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  WarpedFence(
    east: Bool,
    north: Bool,
    south: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  CrimsonTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  WarpedTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  CrimsonFenceGate(
    facing: block_property.FacingCardinal,
    in_wall: Bool,
    open: Bool,
    powered: Bool,
  )
  WarpedFenceGate(
    facing: block_property.FacingCardinal,
    in_wall: Bool,
    open: Bool,
    powered: Bool,
  )
  CrimsonStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  WarpedStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  CrimsonButton(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  WarpedButton(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  CrimsonDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  WarpedDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  CrimsonSign(rotation: block_property.Rotation, waterlogged: Bool)
  WarpedSign(rotation: block_property.Rotation, waterlogged: Bool)
  CrimsonWallSign(facing: block_property.FacingCardinal, waterlogged: Bool)
  WarpedWallSign(facing: block_property.FacingCardinal, waterlogged: Bool)
  StructureBlock(mode: block_property.StructureMode)
  Jigsaw(orientation: block_property.Orientation)
  TestBlock(mode: block_property.TestMode)
  TestInstanceBlock
  Composter(level: block_property.ComposterLevel)
  Target(power: block_property.Power)
  BeeNest(
    facing: block_property.FacingCardinal,
    honey_level: block_property.HoneyLevel,
  )
  Beehive(
    facing: block_property.FacingCardinal,
    honey_level: block_property.HoneyLevel,
  )
  HoneyBlock
  HoneycombBlock
  NetheriteBlock
  AncientDebris
  CryingObsidian
  RespawnAnchor(charges: block_property.Charges)
  PottedCrimsonFungus
  PottedWarpedFungus
  PottedCrimsonRoots
  PottedWarpedRoots
  Lodestone
  Blackstone
  BlackstoneStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  BlackstoneWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  BlackstoneSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  PolishedBlackstone
  PolishedBlackstoneBricks
  CrackedPolishedBlackstoneBricks
  ChiseledPolishedBlackstone
  PolishedBlackstoneBrickSlab(
    slab_type: block_property.SlabType,
    waterlogged: Bool,
  )
  PolishedBlackstoneBrickStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  PolishedBlackstoneBrickWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  GildedBlackstone
  PolishedBlackstoneStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  PolishedBlackstoneSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  PolishedBlackstonePressurePlate(powered: Bool)
  PolishedBlackstoneButton(
    face: block_property.WallFace,
    facing: block_property.FacingCardinal,
    powered: Bool,
  )
  PolishedBlackstoneWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  ChiseledNetherBricks
  CrackedNetherBricks
  QuartzBricks
  Candle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  WhiteCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  OrangeCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  MagentaCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  LightBlueCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  YellowCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  LimeCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  PinkCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  GrayCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  LightGrayCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  CyanCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  PurpleCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  BlueCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  BrownCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  GreenCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  RedCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  BlackCandle(candles: block_property.Candles, lit: Bool, waterlogged: Bool)
  CandleCake(lit: Bool)
  WhiteCandleCake(lit: Bool)
  OrangeCandleCake(lit: Bool)
  MagentaCandleCake(lit: Bool)
  LightBlueCandleCake(lit: Bool)
  YellowCandleCake(lit: Bool)
  LimeCandleCake(lit: Bool)
  PinkCandleCake(lit: Bool)
  GrayCandleCake(lit: Bool)
  LightGrayCandleCake(lit: Bool)
  CyanCandleCake(lit: Bool)
  PurpleCandleCake(lit: Bool)
  BlueCandleCake(lit: Bool)
  BrownCandleCake(lit: Bool)
  GreenCandleCake(lit: Bool)
  RedCandleCake(lit: Bool)
  BlackCandleCake(lit: Bool)
  AmethystBlock
  BuddingAmethyst
  AmethystCluster(facing: block_property.Facing, waterlogged: Bool)
  LargeAmethystBud(facing: block_property.Facing, waterlogged: Bool)
  MediumAmethystBud(facing: block_property.Facing, waterlogged: Bool)
  SmallAmethystBud(facing: block_property.Facing, waterlogged: Bool)
  Tuff
  TuffSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  TuffStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  TuffWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  PolishedTuff
  PolishedTuffSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  PolishedTuffStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  PolishedTuffWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  ChiseledTuff
  TuffBricks
  TuffBrickSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  TuffBrickStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  TuffBrickWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  ChiseledTuffBricks
  Calcite
  TintedGlass
  PowderSnow
  SculkSensor(
    power: block_property.Power,
    sculk_sensor_phase: block_property.SculkSensorPhase,
    waterlogged: Bool,
  )
  CalibratedSculkSensor(
    facing: block_property.FacingCardinal,
    power: block_property.Power,
    sculk_sensor_phase: block_property.SculkSensorPhase,
    waterlogged: Bool,
  )
  Sculk
  SculkVein(
    down: Bool,
    east: Bool,
    north: Bool,
    south: Bool,
    up: Bool,
    waterlogged: Bool,
    west: Bool,
  )
  SculkCatalyst(bloom: Bool)
  SculkShrieker(can_summon: Bool, shrieking: Bool, waterlogged: Bool)
  CopperBlock
  ExposedCopper
  WeatheredCopper
  OxidizedCopper
  CopperOre
  DeepslateCopperOre
  OxidizedCutCopper
  WeatheredCutCopper
  ExposedCutCopper
  CutCopper
  OxidizedChiseledCopper
  WeatheredChiseledCopper
  ExposedChiseledCopper
  ChiseledCopper
  WaxedOxidizedChiseledCopper
  WaxedWeatheredChiseledCopper
  WaxedExposedChiseledCopper
  WaxedChiseledCopper
  OxidizedCutCopperStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  WeatheredCutCopperStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  ExposedCutCopperStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  CutCopperStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  OxidizedCutCopperSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  WeatheredCutCopperSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  ExposedCutCopperSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  CutCopperSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  WaxedCopperBlock
  WaxedWeatheredCopper
  WaxedExposedCopper
  WaxedOxidizedCopper
  WaxedOxidizedCutCopper
  WaxedWeatheredCutCopper
  WaxedExposedCutCopper
  WaxedCutCopper
  WaxedOxidizedCutCopperStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  WaxedWeatheredCutCopperStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  WaxedExposedCutCopperStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  WaxedCutCopperStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  WaxedOxidizedCutCopperSlab(
    slab_type: block_property.SlabType,
    waterlogged: Bool,
  )
  WaxedWeatheredCutCopperSlab(
    slab_type: block_property.SlabType,
    waterlogged: Bool,
  )
  WaxedExposedCutCopperSlab(
    slab_type: block_property.SlabType,
    waterlogged: Bool,
  )
  WaxedCutCopperSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  CopperDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  ExposedCopperDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  OxidizedCopperDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  WeatheredCopperDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  WaxedCopperDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  WaxedExposedCopperDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  WaxedOxidizedCopperDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  WaxedWeatheredCopperDoor(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    hinge: block_property.DoorHinge,
    open: Bool,
    powered: Bool,
  )
  CopperTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  ExposedCopperTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  OxidizedCopperTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  WeatheredCopperTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  WaxedCopperTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  WaxedExposedCopperTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  WaxedOxidizedCopperTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  WaxedWeatheredCopperTrapdoor(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    open: Bool,
    powered: Bool,
    waterlogged: Bool,
  )
  CopperGrate(waterlogged: Bool)
  ExposedCopperGrate(waterlogged: Bool)
  WeatheredCopperGrate(waterlogged: Bool)
  OxidizedCopperGrate(waterlogged: Bool)
  WaxedCopperGrate(waterlogged: Bool)
  WaxedExposedCopperGrate(waterlogged: Bool)
  WaxedWeatheredCopperGrate(waterlogged: Bool)
  WaxedOxidizedCopperGrate(waterlogged: Bool)
  CopperBulb(lit: Bool, powered: Bool)
  ExposedCopperBulb(lit: Bool, powered: Bool)
  WeatheredCopperBulb(lit: Bool, powered: Bool)
  OxidizedCopperBulb(lit: Bool, powered: Bool)
  WaxedCopperBulb(lit: Bool, powered: Bool)
  WaxedExposedCopperBulb(lit: Bool, powered: Bool)
  WaxedWeatheredCopperBulb(lit: Bool, powered: Bool)
  WaxedOxidizedCopperBulb(lit: Bool, powered: Bool)
  CopperChest(
    facing: block_property.FacingCardinal,
    chest_type: block_property.ChestType,
    waterlogged: Bool,
  )
  ExposedCopperChest(
    facing: block_property.FacingCardinal,
    chest_type: block_property.ChestType,
    waterlogged: Bool,
  )
  WeatheredCopperChest(
    facing: block_property.FacingCardinal,
    chest_type: block_property.ChestType,
    waterlogged: Bool,
  )
  OxidizedCopperChest(
    facing: block_property.FacingCardinal,
    chest_type: block_property.ChestType,
    waterlogged: Bool,
  )
  WaxedCopperChest(
    facing: block_property.FacingCardinal,
    chest_type: block_property.ChestType,
    waterlogged: Bool,
  )
  WaxedExposedCopperChest(
    facing: block_property.FacingCardinal,
    chest_type: block_property.ChestType,
    waterlogged: Bool,
  )
  WaxedWeatheredCopperChest(
    facing: block_property.FacingCardinal,
    chest_type: block_property.ChestType,
    waterlogged: Bool,
  )
  WaxedOxidizedCopperChest(
    facing: block_property.FacingCardinal,
    chest_type: block_property.ChestType,
    waterlogged: Bool,
  )
  CopperGolemStatue(
    copper_golem_pose: block_property.CopperGolemPose,
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  ExposedCopperGolemStatue(
    copper_golem_pose: block_property.CopperGolemPose,
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  WeatheredCopperGolemStatue(
    copper_golem_pose: block_property.CopperGolemPose,
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  OxidizedCopperGolemStatue(
    copper_golem_pose: block_property.CopperGolemPose,
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  WaxedCopperGolemStatue(
    copper_golem_pose: block_property.CopperGolemPose,
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  WaxedExposedCopperGolemStatue(
    copper_golem_pose: block_property.CopperGolemPose,
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  WaxedWeatheredCopperGolemStatue(
    copper_golem_pose: block_property.CopperGolemPose,
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  WaxedOxidizedCopperGolemStatue(
    copper_golem_pose: block_property.CopperGolemPose,
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  LightningRod(facing: block_property.Facing, powered: Bool, waterlogged: Bool)
  ExposedLightningRod(
    facing: block_property.Facing,
    powered: Bool,
    waterlogged: Bool,
  )
  WeatheredLightningRod(
    facing: block_property.Facing,
    powered: Bool,
    waterlogged: Bool,
  )
  OxidizedLightningRod(
    facing: block_property.Facing,
    powered: Bool,
    waterlogged: Bool,
  )
  WaxedLightningRod(
    facing: block_property.Facing,
    powered: Bool,
    waterlogged: Bool,
  )
  WaxedExposedLightningRod(
    facing: block_property.Facing,
    powered: Bool,
    waterlogged: Bool,
  )
  WaxedWeatheredLightningRod(
    facing: block_property.Facing,
    powered: Bool,
    waterlogged: Bool,
  )
  WaxedOxidizedLightningRod(
    facing: block_property.Facing,
    powered: Bool,
    waterlogged: Bool,
  )
  PointedDripstone(
    thickness: block_property.Thickness,
    vertical_direction: block_property.VerticalDirection,
    waterlogged: Bool,
  )
  DripstoneBlock
  CaveVines(age: block_property.Age25, berries: Bool)
  CaveVinesPlant(berries: Bool)
  SporeBlossom
  Azalea
  FloweringAzalea
  MossCarpet
  PinkPetals(
    facing: block_property.FacingCardinal,
    flower_amount: block_property.FlowerAmount,
  )
  Wildflowers(
    facing: block_property.FacingCardinal,
    flower_amount: block_property.FlowerAmount,
  )
  LeafLitter(
    facing: block_property.FacingCardinal,
    segment_amount: block_property.SegmentAmount,
  )
  MossBlock
  BigDripleaf(
    facing: block_property.FacingCardinal,
    tilt: block_property.Tilt,
    waterlogged: Bool,
  )
  BigDripleafStem(facing: block_property.FacingCardinal, waterlogged: Bool)
  SmallDripleaf(
    facing: block_property.FacingCardinal,
    half: block_property.DoubleBlockHalf,
    waterlogged: Bool,
  )
  HangingRoots(waterlogged: Bool)
  RootedDirt
  Mud
  Deepslate(axis: block_property.Axis)
  CobbledDeepslate
  CobbledDeepslateStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  CobbledDeepslateSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  CobbledDeepslateWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  PolishedDeepslate
  PolishedDeepslateStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  PolishedDeepslateSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  PolishedDeepslateWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  DeepslateTiles
  DeepslateTileStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  DeepslateTileSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  DeepslateTileWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  DeepslateBricks
  DeepslateBrickStairs(
    facing: block_property.FacingCardinal,
    half: block_property.SlabHalf,
    shape: block_property.StairShape,
    waterlogged: Bool,
  )
  DeepslateBrickSlab(slab_type: block_property.SlabType, waterlogged: Bool)
  DeepslateBrickWall(
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    up: Bool,
    waterlogged: Bool,
    west: block_property.WallSide,
  )
  ChiseledDeepslate
  CrackedDeepslateBricks
  CrackedDeepslateTiles
  InfestedDeepslate(axis: block_property.Axis)
  SmoothBasalt
  RawIronBlock
  RawCopperBlock
  RawGoldBlock
  PottedAzaleaBush
  PottedFloweringAzaleaBush
  OchreFroglight(axis: block_property.Axis)
  VerdantFroglight(axis: block_property.Axis)
  PearlescentFroglight(axis: block_property.Axis)
  Frogspawn
  ReinforcedDeepslate
  DecoratedPot(
    cracked: Bool,
    facing: block_property.FacingCardinal,
    waterlogged: Bool,
  )
  Crafter(
    crafting: Bool,
    orientation: block_property.Orientation,
    triggered: Bool,
  )
  TrialSpawner(
    ominous: Bool,
    trial_spawner_state: block_property.TrialSpawnerState,
  )
  Vault(
    facing: block_property.FacingCardinal,
    ominous: Bool,
    vault_state: block_property.VaultState,
  )
  HeavyCore(waterlogged: Bool)
  PaleMossBlock
  PaleMossCarpet(
    bottom: Bool,
    east: block_property.WallSide,
    north: block_property.WallSide,
    south: block_property.WallSide,
    west: block_property.WallSide,
  )
  PaleHangingMoss(tip: Bool)
  OpenEyeblossom
  ClosedEyeblossom
  PottedOpenEyeblossom
  PottedClosedEyeblossom
  FireflyBush
}

pub const air = Air

pub const stone = Stone

pub const granite = Granite

pub const polished_granite = PolishedGranite

pub const diorite = Diorite

pub const polished_diorite = PolishedDiorite

pub const andesite = Andesite

pub const polished_andesite = PolishedAndesite

pub const grass_block = GrassBlock(False)

pub const dirt = Dirt

pub const coarse_dirt = CoarseDirt

pub const podzol = Podzol(False)

pub const cobblestone = Cobblestone

pub const oak_planks = OakPlanks

pub const spruce_planks = SprucePlanks

pub const birch_planks = BirchPlanks

pub const jungle_planks = JunglePlanks

pub const acacia_planks = AcaciaPlanks

pub const cherry_planks = CherryPlanks

pub const dark_oak_planks = DarkOakPlanks

pub const pale_oak_wood = PaleOakWood(block_property.AxisY)

pub const pale_oak_planks = PaleOakPlanks

pub const mangrove_planks = MangrovePlanks

pub const bamboo_planks = BambooPlanks

pub const bamboo_mosaic = BambooMosaic

pub const oak_sapling = OakSapling(block_property.default_stage)

pub const spruce_sapling = SpruceSapling(block_property.default_stage)

pub const birch_sapling = BirchSapling(block_property.default_stage)

pub const jungle_sapling = JungleSapling(block_property.default_stage)

pub const acacia_sapling = AcaciaSapling(block_property.default_stage)

pub const cherry_sapling = CherrySapling(block_property.default_stage)

pub const dark_oak_sapling = DarkOakSapling(block_property.default_stage)

pub const pale_oak_sapling = PaleOakSapling(block_property.default_stage)

pub const mangrove_propagule = MangrovePropagule(
  block_property.default_age_4,
  False,
  block_property.default_stage,
  False,
)

pub const bedrock = Bedrock

pub const water = Water(block_property.default_liquid_level)

pub const lava = Lava(block_property.default_liquid_level)

pub const sand = Sand

pub const suspicious_sand = SuspiciousSand(block_property.default_dusted)

pub const red_sand = RedSand

pub const gravel = Gravel

pub const suspicious_gravel = SuspiciousGravel(block_property.default_dusted)

pub const gold_ore = GoldOre

pub const deepslate_gold_ore = DeepslateGoldOre

pub const iron_ore = IronOre

pub const deepslate_iron_ore = DeepslateIronOre

pub const coal_ore = CoalOre

pub const deepslate_coal_ore = DeepslateCoalOre

pub const nether_gold_ore = NetherGoldOre

pub const oak_log = OakLog(block_property.AxisY)

pub const spruce_log = SpruceLog(block_property.AxisY)

pub const birch_log = BirchLog(block_property.AxisY)

pub const jungle_log = JungleLog(block_property.AxisY)

pub const acacia_log = AcaciaLog(block_property.AxisY)

pub const cherry_log = CherryLog(block_property.AxisY)

pub const dark_oak_log = DarkOakLog(block_property.AxisY)

pub const pale_oak_log = PaleOakLog(block_property.AxisY)

pub const mangrove_log = MangroveLog(block_property.AxisY)

pub const mangrove_roots = MangroveRoots(False)

pub const muddy_mangrove_roots = MuddyMangroveRoots(block_property.AxisY)

pub const bamboo_block = BambooBlock(block_property.AxisY)

pub const stripped_spruce_log = StrippedSpruceLog(block_property.AxisY)

pub const stripped_birch_log = StrippedBirchLog(block_property.AxisY)

pub const stripped_jungle_log = StrippedJungleLog(block_property.AxisY)

pub const stripped_acacia_log = StrippedAcaciaLog(block_property.AxisY)

pub const stripped_cherry_log = StrippedCherryLog(block_property.AxisY)

pub const stripped_dark_oak_log = StrippedDarkOakLog(block_property.AxisY)

pub const stripped_pale_oak_log = StrippedPaleOakLog(block_property.AxisY)

pub const stripped_oak_log = StrippedOakLog(block_property.AxisY)

pub const stripped_mangrove_log = StrippedMangroveLog(block_property.AxisY)

pub const stripped_bamboo_block = StrippedBambooBlock(block_property.AxisY)

pub const oak_wood = OakWood(block_property.AxisY)

pub const spruce_wood = SpruceWood(block_property.AxisY)

pub const birch_wood = BirchWood(block_property.AxisY)

pub const jungle_wood = JungleWood(block_property.AxisY)

pub const acacia_wood = AcaciaWood(block_property.AxisY)

pub const cherry_wood = CherryWood(block_property.AxisY)

pub const dark_oak_wood = DarkOakWood(block_property.AxisY)

pub const mangrove_wood = MangroveWood(block_property.AxisY)

pub const stripped_oak_wood = StrippedOakWood(block_property.AxisY)

pub const stripped_spruce_wood = StrippedSpruceWood(block_property.AxisY)

pub const stripped_birch_wood = StrippedBirchWood(block_property.AxisY)

pub const stripped_jungle_wood = StrippedJungleWood(block_property.AxisY)

pub const stripped_acacia_wood = StrippedAcaciaWood(block_property.AxisY)

pub const stripped_cherry_wood = StrippedCherryWood(block_property.AxisY)

pub const stripped_dark_oak_wood = StrippedDarkOakWood(block_property.AxisY)

pub const stripped_pale_oak_wood = StrippedPaleOakWood(block_property.AxisY)

pub const stripped_mangrove_wood = StrippedMangroveWood(block_property.AxisY)

pub const oak_leaves = OakLeaves(
  block_property.default_leaves_distance,
  False,
  False,
)

pub const spruce_leaves = SpruceLeaves(
  block_property.default_leaves_distance,
  False,
  False,
)

pub const birch_leaves = BirchLeaves(
  block_property.default_leaves_distance,
  False,
  False,
)

pub const jungle_leaves = JungleLeaves(
  block_property.default_leaves_distance,
  False,
  False,
)

pub const acacia_leaves = AcaciaLeaves(
  block_property.default_leaves_distance,
  False,
  False,
)

pub const cherry_leaves = CherryLeaves(
  block_property.default_leaves_distance,
  False,
  False,
)

pub const dark_oak_leaves = DarkOakLeaves(
  block_property.default_leaves_distance,
  False,
  False,
)

pub const pale_oak_leaves = PaleOakLeaves(
  block_property.default_leaves_distance,
  False,
  False,
)

pub const mangrove_leaves = MangroveLeaves(
  block_property.default_leaves_distance,
  False,
  False,
)

pub const azalea_leaves = AzaleaLeaves(
  block_property.default_leaves_distance,
  False,
  False,
)

pub const flowering_azalea_leaves = FloweringAzaleaLeaves(
  block_property.default_leaves_distance,
  False,
  False,
)

pub const sponge = Sponge

pub const wet_sponge = WetSponge

pub const glass = Glass

pub const lapis_ore = LapisOre

pub const deepslate_lapis_ore = DeepslateLapisOre

pub const lapis_block = LapisBlock

pub const dispenser = Dispenser(block_property.FacingNorth, False)

pub const sandstone = Sandstone

pub const chiseled_sandstone = ChiseledSandstone

pub const cut_sandstone = CutSandstone

pub const note_block = NoteBlock(
  block_property.InstrumentHarp,
  block_property.default_note,
  False,
)

pub const white_bed = WhiteBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const orange_bed = OrangeBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const magenta_bed = MagentaBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const light_blue_bed = LightBlueBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const yellow_bed = YellowBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const lime_bed = LimeBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const pink_bed = PinkBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const gray_bed = GrayBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const light_gray_bed = LightGrayBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const cyan_bed = CyanBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const purple_bed = PurpleBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const blue_bed = BlueBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const brown_bed = BrownBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const green_bed = GreenBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const red_bed = RedBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const black_bed = BlackBed(
  block_property.FacingCardinalNorth,
  False,
  block_property.BedPartFoot,
)

pub const powered_rail = PoweredRail(
  False,
  block_property.RailShapeStraightNorthSouth,
  False,
)

pub const detector_rail = DetectorRail(
  False,
  block_property.RailShapeStraightNorthSouth,
  False,
)

pub const sticky_piston = StickyPiston(False, block_property.FacingNorth)

pub const cobweb = Cobweb

pub const short_grass = ShortGrass

pub const fern = Fern

pub const dead_bush = DeadBush

pub const bush = Bush

pub const short_dry_grass = ShortDryGrass

pub const tall_dry_grass = TallDryGrass

pub const seagrass = Seagrass

pub const tall_seagrass = TallSeagrass(block_property.DoubleBlockHalfLower)

pub const piston = Piston(False, block_property.FacingNorth)

pub const piston_head = PistonHead(
  block_property.FacingNorth,
  False,
  block_property.PistonTypeNormal,
)

pub const white_wool = WhiteWool

pub const orange_wool = OrangeWool

pub const magenta_wool = MagentaWool

pub const light_blue_wool = LightBlueWool

pub const yellow_wool = YellowWool

pub const lime_wool = LimeWool

pub const pink_wool = PinkWool

pub const gray_wool = GrayWool

pub const light_gray_wool = LightGrayWool

pub const cyan_wool = CyanWool

pub const purple_wool = PurpleWool

pub const blue_wool = BlueWool

pub const brown_wool = BrownWool

pub const green_wool = GreenWool

pub const red_wool = RedWool

pub const black_wool = BlackWool

pub const moving_piston = MovingPiston(
  block_property.FacingNorth,
  block_property.PistonTypeNormal,
)

pub const dandelion = Dandelion

pub const torchflower = Torchflower

pub const poppy = Poppy

pub const blue_orchid = BlueOrchid

pub const allium = Allium

pub const azure_bluet = AzureBluet

pub const red_tulip = RedTulip

pub const orange_tulip = OrangeTulip

pub const white_tulip = WhiteTulip

pub const pink_tulip = PinkTulip

pub const oxeye_daisy = OxeyeDaisy

pub const cornflower = Cornflower

pub const wither_rose = WitherRose

pub const lily_of_the_valley = LilyOfTheValley

pub const brown_mushroom = BrownMushroom

pub const red_mushroom = RedMushroom

pub const gold_block = GoldBlock

pub const iron_block = IronBlock

pub const bricks = Bricks

pub const tnt = Tnt(False)

pub const bookshelf = Bookshelf

pub const chiseled_bookshelf = ChiseledBookshelf(
  block_property.FacingCardinalNorth,
  False,
  False,
  False,
  False,
  False,
  False,
)

pub const acacia_shelf = AcaciaShelf(
  block_property.FacingCardinalNorth,
  False,
  block_property.SideChainUnconnected,
  False,
)

pub const bamboo_shelf = BambooShelf(
  block_property.FacingCardinalNorth,
  False,
  block_property.SideChainUnconnected,
  False,
)

pub const birch_shelf = BirchShelf(
  block_property.FacingCardinalNorth,
  False,
  block_property.SideChainUnconnected,
  False,
)

pub const cherry_shelf = CherryShelf(
  block_property.FacingCardinalNorth,
  False,
  block_property.SideChainUnconnected,
  False,
)

pub const crimson_shelf = CrimsonShelf(
  block_property.FacingCardinalNorth,
  False,
  block_property.SideChainUnconnected,
  False,
)

pub const dark_oak_shelf = DarkOakShelf(
  block_property.FacingCardinalNorth,
  False,
  block_property.SideChainUnconnected,
  False,
)

pub const jungle_shelf = JungleShelf(
  block_property.FacingCardinalNorth,
  False,
  block_property.SideChainUnconnected,
  False,
)

pub const mangrove_shelf = MangroveShelf(
  block_property.FacingCardinalNorth,
  False,
  block_property.SideChainUnconnected,
  False,
)

pub const oak_shelf = OakShelf(
  block_property.FacingCardinalNorth,
  False,
  block_property.SideChainUnconnected,
  False,
)

pub const pale_oak_shelf = PaleOakShelf(
  block_property.FacingCardinalNorth,
  False,
  block_property.SideChainUnconnected,
  False,
)

pub const spruce_shelf = SpruceShelf(
  block_property.FacingCardinalNorth,
  False,
  block_property.SideChainUnconnected,
  False,
)

pub const warped_shelf = WarpedShelf(
  block_property.FacingCardinalNorth,
  False,
  block_property.SideChainUnconnected,
  False,
)

pub const mossy_cobblestone = MossyCobblestone

pub const obsidian = Obsidian

pub const torch = Torch

pub const wall_torch = WallTorch(block_property.FacingCardinalNorth)

pub const fire = Fire(
  block_property.default_age_15,
  False,
  False,
  False,
  False,
  False,
)

pub const soul_fire = SoulFire

pub const spawner = Spawner

pub const creaking_heart = CreakingHeart(
  block_property.AxisY,
  block_property.CreakingHeartStateUprooted,
  False,
)

pub const oak_stairs = OakStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const chest = Chest(
  block_property.FacingCardinalNorth,
  block_property.ChestTypeSingle,
  False,
)

pub const redstone_wire = RedstoneWire(
  block_property.RedstoneSideNone,
  block_property.RedstoneSideNone,
  block_property.default_power,
  block_property.RedstoneSideNone,
  block_property.RedstoneSideNone,
)

pub const diamond_ore = DiamondOre

pub const deepslate_diamond_ore = DeepslateDiamondOre

pub const diamond_block = DiamondBlock

pub const crafting_table = CraftingTable

pub const wheat = Wheat(block_property.default_age_7)

pub const farmland = Farmland(block_property.default_moisture)

pub const furnace = Furnace(block_property.FacingCardinalNorth, False)

pub const oak_sign = OakSign(block_property.default_rotation, False)

pub const spruce_sign = SpruceSign(block_property.default_rotation, False)

pub const birch_sign = BirchSign(block_property.default_rotation, False)

pub const acacia_sign = AcaciaSign(block_property.default_rotation, False)

pub const cherry_sign = CherrySign(block_property.default_rotation, False)

pub const jungle_sign = JungleSign(block_property.default_rotation, False)

pub const dark_oak_sign = DarkOakSign(block_property.default_rotation, False)

pub const pale_oak_sign = PaleOakSign(block_property.default_rotation, False)

pub const mangrove_sign = MangroveSign(block_property.default_rotation, False)

pub const bamboo_sign = BambooSign(block_property.default_rotation, False)

pub const oak_door = OakDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const ladder = Ladder(block_property.FacingCardinalNorth, False)

pub const rail = Rail(block_property.RailShapeNorthSouth, False)

pub const cobblestone_stairs = CobblestoneStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const oak_wall_sign = OakWallSign(block_property.FacingCardinalNorth, False)

pub const spruce_wall_sign = SpruceWallSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const birch_wall_sign = BirchWallSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const acacia_wall_sign = AcaciaWallSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const cherry_wall_sign = CherryWallSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const jungle_wall_sign = JungleWallSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const dark_oak_wall_sign = DarkOakWallSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const pale_oak_wall_sign = PaleOakWallSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const mangrove_wall_sign = MangroveWallSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const bamboo_wall_sign = BambooWallSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const oak_hanging_sign = OakHangingSign(
  False,
  block_property.default_rotation,
  False,
)

pub const spruce_hanging_sign = SpruceHangingSign(
  False,
  block_property.default_rotation,
  False,
)

pub const birch_hanging_sign = BirchHangingSign(
  False,
  block_property.default_rotation,
  False,
)

pub const acacia_hanging_sign = AcaciaHangingSign(
  False,
  block_property.default_rotation,
  False,
)

pub const cherry_hanging_sign = CherryHangingSign(
  False,
  block_property.default_rotation,
  False,
)

pub const jungle_hanging_sign = JungleHangingSign(
  False,
  block_property.default_rotation,
  False,
)

pub const dark_oak_hanging_sign = DarkOakHangingSign(
  False,
  block_property.default_rotation,
  False,
)

pub const pale_oak_hanging_sign = PaleOakHangingSign(
  False,
  block_property.default_rotation,
  False,
)

pub const crimson_hanging_sign = CrimsonHangingSign(
  False,
  block_property.default_rotation,
  False,
)

pub const warped_hanging_sign = WarpedHangingSign(
  False,
  block_property.default_rotation,
  False,
)

pub const mangrove_hanging_sign = MangroveHangingSign(
  False,
  block_property.default_rotation,
  False,
)

pub const bamboo_hanging_sign = BambooHangingSign(
  False,
  block_property.default_rotation,
  False,
)

pub const oak_wall_hanging_sign = OakWallHangingSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const spruce_wall_hanging_sign = SpruceWallHangingSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const birch_wall_hanging_sign = BirchWallHangingSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const acacia_wall_hanging_sign = AcaciaWallHangingSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const cherry_wall_hanging_sign = CherryWallHangingSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const jungle_wall_hanging_sign = JungleWallHangingSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const dark_oak_wall_hanging_sign = DarkOakWallHangingSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const pale_oak_wall_hanging_sign = PaleOakWallHangingSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const mangrove_wall_hanging_sign = MangroveWallHangingSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const crimson_wall_hanging_sign = CrimsonWallHangingSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const warped_wall_hanging_sign = WarpedWallHangingSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const bamboo_wall_hanging_sign = BambooWallHangingSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const lever = Lever(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
  False,
)

pub const stone_pressure_plate = StonePressurePlate(False)

pub const iron_door = IronDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const oak_pressure_plate = OakPressurePlate(False)

pub const spruce_pressure_plate = SprucePressurePlate(False)

pub const birch_pressure_plate = BirchPressurePlate(False)

pub const jungle_pressure_plate = JunglePressurePlate(False)

pub const acacia_pressure_plate = AcaciaPressurePlate(False)

pub const cherry_pressure_plate = CherryPressurePlate(False)

pub const dark_oak_pressure_plate = DarkOakPressurePlate(False)

pub const pale_oak_pressure_plate = PaleOakPressurePlate(False)

pub const mangrove_pressure_plate = MangrovePressurePlate(False)

pub const bamboo_pressure_plate = BambooPressurePlate(False)

pub const redstone_ore = RedstoneOre(False)

pub const deepslate_redstone_ore = DeepslateRedstoneOre(False)

pub const redstone_torch = RedstoneTorch(True)

pub const redstone_wall_torch = RedstoneWallTorch(
  block_property.FacingCardinalNorth,
  True,
)

pub const stone_button = StoneButton(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
  False,
)

pub const snow = Snow(block_property.default_layers)

pub const ice = Ice

pub const snow_block = SnowBlock

pub const cactus = Cactus(block_property.default_age_15)

pub const cactus_flower = CactusFlower

pub const clay = Clay

pub const sugar_cane = SugarCane(block_property.default_age_15)

pub const jukebox = Jukebox(False)

pub const oak_fence = OakFence(False, False, False, False, False)

pub const netherrack = Netherrack

pub const soul_sand = SoulSand

pub const soul_soil = SoulSoil

pub const basalt = Basalt(block_property.AxisY)

pub const polished_basalt = PolishedBasalt(block_property.AxisY)

pub const soul_torch = SoulTorch

pub const soul_wall_torch = SoulWallTorch(block_property.FacingCardinalNorth)

pub const copper_torch = CopperTorch

pub const copper_wall_torch = CopperWallTorch(
  block_property.FacingCardinalNorth,
)

pub const glowstone = Glowstone

pub const nether_portal = NetherPortal(block_property.HorizontalAxisX)

pub const carved_pumpkin = CarvedPumpkin(block_property.FacingCardinalNorth)

pub const jack_o_lantern = JackOLantern(block_property.FacingCardinalNorth)

pub const cake = Cake(block_property.default_bites)

pub const repeater = Repeater(
  block_property.default_delay,
  block_property.FacingCardinalNorth,
  False,
  False,
)

pub const white_stained_glass = WhiteStainedGlass

pub const orange_stained_glass = OrangeStainedGlass

pub const magenta_stained_glass = MagentaStainedGlass

pub const light_blue_stained_glass = LightBlueStainedGlass

pub const yellow_stained_glass = YellowStainedGlass

pub const lime_stained_glass = LimeStainedGlass

pub const pink_stained_glass = PinkStainedGlass

pub const gray_stained_glass = GrayStainedGlass

pub const light_gray_stained_glass = LightGrayStainedGlass

pub const cyan_stained_glass = CyanStainedGlass

pub const purple_stained_glass = PurpleStainedGlass

pub const blue_stained_glass = BlueStainedGlass

pub const brown_stained_glass = BrownStainedGlass

pub const green_stained_glass = GreenStainedGlass

pub const red_stained_glass = RedStainedGlass

pub const black_stained_glass = BlackStainedGlass

pub const oak_trapdoor = OakTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const spruce_trapdoor = SpruceTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const birch_trapdoor = BirchTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const jungle_trapdoor = JungleTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const acacia_trapdoor = AcaciaTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const cherry_trapdoor = CherryTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const dark_oak_trapdoor = DarkOakTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const pale_oak_trapdoor = PaleOakTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const mangrove_trapdoor = MangroveTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const bamboo_trapdoor = BambooTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const stone_bricks = StoneBricks

pub const mossy_stone_bricks = MossyStoneBricks

pub const cracked_stone_bricks = CrackedStoneBricks

pub const chiseled_stone_bricks = ChiseledStoneBricks

pub const packed_mud = PackedMud

pub const mud_bricks = MudBricks

pub const infested_stone = InfestedStone

pub const infested_cobblestone = InfestedCobblestone

pub const infested_stone_bricks = InfestedStoneBricks

pub const infested_mossy_stone_bricks = InfestedMossyStoneBricks

pub const infested_cracked_stone_bricks = InfestedCrackedStoneBricks

pub const infested_chiseled_stone_bricks = InfestedChiseledStoneBricks

pub const brown_mushroom_block = BrownMushroomBlock(
  True,
  True,
  True,
  True,
  True,
  True,
)

pub const red_mushroom_block = RedMushroomBlock(
  True,
  True,
  True,
  True,
  True,
  True,
)

pub const mushroom_stem = MushroomStem(True, True, True, True, True, True)

pub const iron_bars = IronBars(False, False, False, False, False)

pub const copper_bars = CopperBars(False, False, False, False, False)

pub const exposed_copper_bars = ExposedCopperBars(
  False,
  False,
  False,
  False,
  False,
)

pub const weathered_copper_bars = WeatheredCopperBars(
  False,
  False,
  False,
  False,
  False,
)

pub const oxidized_copper_bars = OxidizedCopperBars(
  False,
  False,
  False,
  False,
  False,
)

pub const waxed_copper_bars = WaxedCopperBars(False, False, False, False, False)

pub const waxed_exposed_copper_bars = WaxedExposedCopperBars(
  False,
  False,
  False,
  False,
  False,
)

pub const waxed_weathered_copper_bars = WaxedWeatheredCopperBars(
  False,
  False,
  False,
  False,
  False,
)

pub const waxed_oxidized_copper_bars = WaxedOxidizedCopperBars(
  False,
  False,
  False,
  False,
  False,
)

pub const iron_chain = IronChain(block_property.AxisY, False)

pub const copper_chain = CopperChain(block_property.AxisY, False)

pub const exposed_copper_chain = ExposedCopperChain(block_property.AxisY, False)

pub const weathered_copper_chain = WeatheredCopperChain(
  block_property.AxisY,
  False,
)

pub const oxidized_copper_chain = OxidizedCopperChain(
  block_property.AxisY,
  False,
)

pub const waxed_copper_chain = WaxedCopperChain(block_property.AxisY, False)

pub const waxed_exposed_copper_chain = WaxedExposedCopperChain(
  block_property.AxisY,
  False,
)

pub const waxed_weathered_copper_chain = WaxedWeatheredCopperChain(
  block_property.AxisY,
  False,
)

pub const waxed_oxidized_copper_chain = WaxedOxidizedCopperChain(
  block_property.AxisY,
  False,
)

pub const glass_pane = GlassPane(False, False, False, False, False)

pub const pumpkin = Pumpkin

pub const melon = Melon

pub const attached_pumpkin_stem = AttachedPumpkinStem(
  block_property.FacingCardinalNorth,
)

pub const attached_melon_stem = AttachedMelonStem(
  block_property.FacingCardinalNorth,
)

pub const pumpkin_stem = PumpkinStem(block_property.default_age_7)

pub const melon_stem = MelonStem(block_property.default_age_7)

pub const vine = Vine(False, False, False, False, False)

pub const glow_lichen = GlowLichen(
  False,
  False,
  False,
  False,
  False,
  False,
  False,
)

pub const resin_clump = ResinClump(
  False,
  False,
  False,
  False,
  False,
  False,
  False,
)

pub const oak_fence_gate = OakFenceGate(
  block_property.FacingCardinalNorth,
  False,
  False,
  False,
)

pub const brick_stairs = BrickStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const stone_brick_stairs = StoneBrickStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const mud_brick_stairs = MudBrickStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const mycelium = Mycelium(False)

pub const lily_pad = LilyPad

pub const resin_block = ResinBlock

pub const resin_bricks = ResinBricks

pub const resin_brick_stairs = ResinBrickStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const resin_brick_slab = ResinBrickSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const resin_brick_wall = ResinBrickWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const chiseled_resin_bricks = ChiseledResinBricks

pub const nether_bricks = NetherBricks

pub const nether_brick_fence = NetherBrickFence(
  False,
  False,
  False,
  False,
  False,
)

pub const nether_brick_stairs = NetherBrickStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const nether_wart = NetherWart(block_property.default_age_3)

pub const enchanting_table = EnchantingTable

pub const brewing_stand = BrewingStand(False, False, False)

pub const cauldron = Cauldron

pub const water_cauldron = WaterCauldron(block_property.default_cauldron_level)

pub const lava_cauldron = LavaCauldron

pub const powder_snow_cauldron = PowderSnowCauldron(
  block_property.default_cauldron_level,
)

pub const end_portal = EndPortal

pub const end_portal_frame = EndPortalFrame(
  False,
  block_property.FacingCardinalNorth,
)

pub const end_stone = EndStone

pub const dragon_egg = DragonEgg

pub const redstone_lamp = RedstoneLamp(False)

pub const cocoa = Cocoa(
  block_property.default_age_2,
  block_property.FacingCardinalNorth,
)

pub const sandstone_stairs = SandstoneStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const emerald_ore = EmeraldOre

pub const deepslate_emerald_ore = DeepslateEmeraldOre

pub const ender_chest = EnderChest(block_property.FacingCardinalNorth, False)

pub const tripwire_hook = TripwireHook(
  False,
  block_property.FacingCardinalNorth,
  False,
)

pub const tripwire = Tripwire(False, False, False, False, False, False, False)

pub const emerald_block = EmeraldBlock

pub const spruce_stairs = SpruceStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const birch_stairs = BirchStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const jungle_stairs = JungleStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const command_block = CommandBlock(False, block_property.FacingNorth)

pub const beacon = Beacon

pub const cobblestone_wall = CobblestoneWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const mossy_cobblestone_wall = MossyCobblestoneWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const flower_pot = FlowerPot

pub const potted_torchflower = PottedTorchflower

pub const potted_oak_sapling = PottedOakSapling

pub const potted_spruce_sapling = PottedSpruceSapling

pub const potted_birch_sapling = PottedBirchSapling

pub const potted_jungle_sapling = PottedJungleSapling

pub const potted_acacia_sapling = PottedAcaciaSapling

pub const potted_cherry_sapling = PottedCherrySapling

pub const potted_dark_oak_sapling = PottedDarkOakSapling

pub const potted_pale_oak_sapling = PottedPaleOakSapling

pub const potted_mangrove_propagule = PottedMangrovePropagule

pub const potted_fern = PottedFern

pub const potted_dandelion = PottedDandelion

pub const potted_poppy = PottedPoppy

pub const potted_blue_orchid = PottedBlueOrchid

pub const potted_allium = PottedAllium

pub const potted_azure_bluet = PottedAzureBluet

pub const potted_red_tulip = PottedRedTulip

pub const potted_orange_tulip = PottedOrangeTulip

pub const potted_white_tulip = PottedWhiteTulip

pub const potted_pink_tulip = PottedPinkTulip

pub const potted_oxeye_daisy = PottedOxeyeDaisy

pub const potted_cornflower = PottedCornflower

pub const potted_lily_of_the_valley = PottedLilyOfTheValley

pub const potted_wither_rose = PottedWitherRose

pub const potted_red_mushroom = PottedRedMushroom

pub const potted_brown_mushroom = PottedBrownMushroom

pub const potted_dead_bush = PottedDeadBush

pub const potted_cactus = PottedCactus

pub const carrots = Carrots(block_property.default_age_7)

pub const potatoes = Potatoes(block_property.default_age_7)

pub const oak_button = OakButton(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
  False,
)

pub const spruce_button = SpruceButton(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
  False,
)

pub const birch_button = BirchButton(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
  False,
)

pub const jungle_button = JungleButton(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
  False,
)

pub const acacia_button = AcaciaButton(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
  False,
)

pub const cherry_button = CherryButton(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
  False,
)

pub const dark_oak_button = DarkOakButton(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
  False,
)

pub const pale_oak_button = PaleOakButton(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
  False,
)

pub const mangrove_button = MangroveButton(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
  False,
)

pub const bamboo_button = BambooButton(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
  False,
)

pub const skeleton_skull = SkeletonSkull(False, block_property.default_rotation)

pub const skeleton_wall_skull = SkeletonWallSkull(
  block_property.FacingCardinalNorth,
  False,
)

pub const wither_skeleton_skull = WitherSkeletonSkull(
  False,
  block_property.default_rotation,
)

pub const wither_skeleton_wall_skull = WitherSkeletonWallSkull(
  block_property.FacingCardinalNorth,
  False,
)

pub const zombie_head = ZombieHead(False, block_property.default_rotation)

pub const zombie_wall_head = ZombieWallHead(
  block_property.FacingCardinalNorth,
  False,
)

pub const player_head = PlayerHead(False, block_property.default_rotation)

pub const player_wall_head = PlayerWallHead(
  block_property.FacingCardinalNorth,
  False,
)

pub const creeper_head = CreeperHead(False, block_property.default_rotation)

pub const creeper_wall_head = CreeperWallHead(
  block_property.FacingCardinalNorth,
  False,
)

pub const dragon_head = DragonHead(False, block_property.default_rotation)

pub const dragon_wall_head = DragonWallHead(
  block_property.FacingCardinalNorth,
  False,
)

pub const piglin_head = PiglinHead(False, block_property.default_rotation)

pub const piglin_wall_head = PiglinWallHead(
  block_property.FacingCardinalNorth,
  False,
)

pub const anvil = Anvil(block_property.FacingCardinalNorth)

pub const chipped_anvil = ChippedAnvil(block_property.FacingCardinalNorth)

pub const damaged_anvil = DamagedAnvil(block_property.FacingCardinalNorth)

pub const trapped_chest = TrappedChest(
  block_property.FacingCardinalNorth,
  block_property.ChestTypeSingle,
  False,
)

pub const light_weighted_pressure_plate = LightWeightedPressurePlate(
  block_property.default_power,
)

pub const heavy_weighted_pressure_plate = HeavyWeightedPressurePlate(
  block_property.default_power,
)

pub const comparator = Comparator(
  block_property.FacingCardinalNorth,
  block_property.ComparatorModeCompare,
  False,
)

pub const daylight_detector = DaylightDetector(
  False,
  block_property.default_power,
)

pub const redstone_block = RedstoneBlock

pub const nether_quartz_ore = NetherQuartzOre

pub const hopper = Hopper(True, block_property.FacingHopperDown)

pub const quartz_block = QuartzBlock

pub const chiseled_quartz_block = ChiseledQuartzBlock

pub const quartz_pillar = QuartzPillar(block_property.AxisY)

pub const quartz_stairs = QuartzStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const activator_rail = ActivatorRail(
  False,
  block_property.RailShapeStraightNorthSouth,
  False,
)

pub const dropper = Dropper(block_property.FacingNorth, False)

pub const white_terracotta = WhiteTerracotta

pub const orange_terracotta = OrangeTerracotta

pub const magenta_terracotta = MagentaTerracotta

pub const light_blue_terracotta = LightBlueTerracotta

pub const yellow_terracotta = YellowTerracotta

pub const lime_terracotta = LimeTerracotta

pub const pink_terracotta = PinkTerracotta

pub const gray_terracotta = GrayTerracotta

pub const light_gray_terracotta = LightGrayTerracotta

pub const cyan_terracotta = CyanTerracotta

pub const purple_terracotta = PurpleTerracotta

pub const blue_terracotta = BlueTerracotta

pub const brown_terracotta = BrownTerracotta

pub const green_terracotta = GreenTerracotta

pub const red_terracotta = RedTerracotta

pub const black_terracotta = BlackTerracotta

pub const white_stained_glass_pane = WhiteStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const orange_stained_glass_pane = OrangeStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const magenta_stained_glass_pane = MagentaStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const light_blue_stained_glass_pane = LightBlueStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const yellow_stained_glass_pane = YellowStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const lime_stained_glass_pane = LimeStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const pink_stained_glass_pane = PinkStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const gray_stained_glass_pane = GrayStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const light_gray_stained_glass_pane = LightGrayStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const cyan_stained_glass_pane = CyanStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const purple_stained_glass_pane = PurpleStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const blue_stained_glass_pane = BlueStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const brown_stained_glass_pane = BrownStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const green_stained_glass_pane = GreenStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const red_stained_glass_pane = RedStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const black_stained_glass_pane = BlackStainedGlassPane(
  False,
  False,
  False,
  False,
  False,
)

pub const acacia_stairs = AcaciaStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const cherry_stairs = CherryStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const dark_oak_stairs = DarkOakStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const pale_oak_stairs = PaleOakStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const mangrove_stairs = MangroveStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const bamboo_stairs = BambooStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const bamboo_mosaic_stairs = BambooMosaicStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const slime_block = SlimeBlock

pub const barrier = Barrier(False)

pub const light = Light(block_property.default_light_level, False)

pub const iron_trapdoor = IronTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const prismarine = Prismarine

pub const prismarine_bricks = PrismarineBricks

pub const dark_prismarine = DarkPrismarine

pub const prismarine_stairs = PrismarineStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const prismarine_brick_stairs = PrismarineBrickStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const dark_prismarine_stairs = DarkPrismarineStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const prismarine_slab = PrismarineSlab(block_property.SlabTypeBottom, False)

pub const prismarine_brick_slab = PrismarineBrickSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const dark_prismarine_slab = DarkPrismarineSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const sea_lantern = SeaLantern

pub const hay_block = HayBlock(block_property.AxisY)

pub const white_carpet = WhiteCarpet

pub const orange_carpet = OrangeCarpet

pub const magenta_carpet = MagentaCarpet

pub const light_blue_carpet = LightBlueCarpet

pub const yellow_carpet = YellowCarpet

pub const lime_carpet = LimeCarpet

pub const pink_carpet = PinkCarpet

pub const gray_carpet = GrayCarpet

pub const light_gray_carpet = LightGrayCarpet

pub const cyan_carpet = CyanCarpet

pub const purple_carpet = PurpleCarpet

pub const blue_carpet = BlueCarpet

pub const brown_carpet = BrownCarpet

pub const green_carpet = GreenCarpet

pub const red_carpet = RedCarpet

pub const black_carpet = BlackCarpet

pub const terracotta = Terracotta

pub const coal_block = CoalBlock

pub const packed_ice = PackedIce

pub const sunflower = Sunflower(block_property.DoubleBlockHalfLower)

pub const lilac = Lilac(block_property.DoubleBlockHalfLower)

pub const rose_bush = RoseBush(block_property.DoubleBlockHalfLower)

pub const peony = Peony(block_property.DoubleBlockHalfLower)

pub const tall_grass = TallGrass(block_property.DoubleBlockHalfLower)

pub const large_fern = LargeFern(block_property.DoubleBlockHalfLower)

pub const white_banner = WhiteBanner(block_property.default_rotation)

pub const orange_banner = OrangeBanner(block_property.default_rotation)

pub const magenta_banner = MagentaBanner(block_property.default_rotation)

pub const light_blue_banner = LightBlueBanner(block_property.default_rotation)

pub const yellow_banner = YellowBanner(block_property.default_rotation)

pub const lime_banner = LimeBanner(block_property.default_rotation)

pub const pink_banner = PinkBanner(block_property.default_rotation)

pub const gray_banner = GrayBanner(block_property.default_rotation)

pub const light_gray_banner = LightGrayBanner(block_property.default_rotation)

pub const cyan_banner = CyanBanner(block_property.default_rotation)

pub const purple_banner = PurpleBanner(block_property.default_rotation)

pub const blue_banner = BlueBanner(block_property.default_rotation)

pub const brown_banner = BrownBanner(block_property.default_rotation)

pub const green_banner = GreenBanner(block_property.default_rotation)

pub const red_banner = RedBanner(block_property.default_rotation)

pub const black_banner = BlackBanner(block_property.default_rotation)

pub const white_wall_banner = WhiteWallBanner(
  block_property.FacingCardinalNorth,
)

pub const orange_wall_banner = OrangeWallBanner(
  block_property.FacingCardinalNorth,
)

pub const magenta_wall_banner = MagentaWallBanner(
  block_property.FacingCardinalNorth,
)

pub const light_blue_wall_banner = LightBlueWallBanner(
  block_property.FacingCardinalNorth,
)

pub const yellow_wall_banner = YellowWallBanner(
  block_property.FacingCardinalNorth,
)

pub const lime_wall_banner = LimeWallBanner(block_property.FacingCardinalNorth)

pub const pink_wall_banner = PinkWallBanner(block_property.FacingCardinalNorth)

pub const gray_wall_banner = GrayWallBanner(block_property.FacingCardinalNorth)

pub const light_gray_wall_banner = LightGrayWallBanner(
  block_property.FacingCardinalNorth,
)

pub const cyan_wall_banner = CyanWallBanner(block_property.FacingCardinalNorth)

pub const purple_wall_banner = PurpleWallBanner(
  block_property.FacingCardinalNorth,
)

pub const blue_wall_banner = BlueWallBanner(block_property.FacingCardinalNorth)

pub const brown_wall_banner = BrownWallBanner(
  block_property.FacingCardinalNorth,
)

pub const green_wall_banner = GreenWallBanner(
  block_property.FacingCardinalNorth,
)

pub const red_wall_banner = RedWallBanner(block_property.FacingCardinalNorth)

pub const black_wall_banner = BlackWallBanner(
  block_property.FacingCardinalNorth,
)

pub const red_sandstone = RedSandstone

pub const chiseled_red_sandstone = ChiseledRedSandstone

pub const cut_red_sandstone = CutRedSandstone

pub const red_sandstone_stairs = RedSandstoneStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const oak_slab = OakSlab(block_property.SlabTypeBottom, False)

pub const spruce_slab = SpruceSlab(block_property.SlabTypeBottom, False)

pub const birch_slab = BirchSlab(block_property.SlabTypeBottom, False)

pub const jungle_slab = JungleSlab(block_property.SlabTypeBottom, False)

pub const acacia_slab = AcaciaSlab(block_property.SlabTypeBottom, False)

pub const cherry_slab = CherrySlab(block_property.SlabTypeBottom, False)

pub const dark_oak_slab = DarkOakSlab(block_property.SlabTypeBottom, False)

pub const pale_oak_slab = PaleOakSlab(block_property.SlabTypeBottom, False)

pub const mangrove_slab = MangroveSlab(block_property.SlabTypeBottom, False)

pub const bamboo_slab = BambooSlab(block_property.SlabTypeBottom, False)

pub const bamboo_mosaic_slab = BambooMosaicSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const stone_slab = StoneSlab(block_property.SlabTypeBottom, False)

pub const smooth_stone_slab = SmoothStoneSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const sandstone_slab = SandstoneSlab(block_property.SlabTypeBottom, False)

pub const cut_sandstone_slab = CutSandstoneSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const petrified_oak_slab = PetrifiedOakSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const cobblestone_slab = CobblestoneSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const brick_slab = BrickSlab(block_property.SlabTypeBottom, False)

pub const stone_brick_slab = StoneBrickSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const mud_brick_slab = MudBrickSlab(block_property.SlabTypeBottom, False)

pub const nether_brick_slab = NetherBrickSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const quartz_slab = QuartzSlab(block_property.SlabTypeBottom, False)

pub const red_sandstone_slab = RedSandstoneSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const cut_red_sandstone_slab = CutRedSandstoneSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const purpur_slab = PurpurSlab(block_property.SlabTypeBottom, False)

pub const smooth_stone = SmoothStone

pub const smooth_sandstone = SmoothSandstone

pub const smooth_quartz = SmoothQuartz

pub const smooth_red_sandstone = SmoothRedSandstone

pub const spruce_fence_gate = SpruceFenceGate(
  block_property.FacingCardinalNorth,
  False,
  False,
  False,
)

pub const birch_fence_gate = BirchFenceGate(
  block_property.FacingCardinalNorth,
  False,
  False,
  False,
)

pub const jungle_fence_gate = JungleFenceGate(
  block_property.FacingCardinalNorth,
  False,
  False,
  False,
)

pub const acacia_fence_gate = AcaciaFenceGate(
  block_property.FacingCardinalNorth,
  False,
  False,
  False,
)

pub const cherry_fence_gate = CherryFenceGate(
  block_property.FacingCardinalNorth,
  False,
  False,
  False,
)

pub const dark_oak_fence_gate = DarkOakFenceGate(
  block_property.FacingCardinalNorth,
  False,
  False,
  False,
)

pub const pale_oak_fence_gate = PaleOakFenceGate(
  block_property.FacingCardinalNorth,
  False,
  False,
  False,
)

pub const mangrove_fence_gate = MangroveFenceGate(
  block_property.FacingCardinalNorth,
  False,
  False,
  False,
)

pub const bamboo_fence_gate = BambooFenceGate(
  block_property.FacingCardinalNorth,
  False,
  False,
  False,
)

pub const spruce_fence = SpruceFence(False, False, False, False, False)

pub const birch_fence = BirchFence(False, False, False, False, False)

pub const jungle_fence = JungleFence(False, False, False, False, False)

pub const acacia_fence = AcaciaFence(False, False, False, False, False)

pub const cherry_fence = CherryFence(False, False, False, False, False)

pub const dark_oak_fence = DarkOakFence(False, False, False, False, False)

pub const pale_oak_fence = PaleOakFence(False, False, False, False, False)

pub const mangrove_fence = MangroveFence(False, False, False, False, False)

pub const bamboo_fence = BambooFence(False, False, False, False, False)

pub const spruce_door = SpruceDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const birch_door = BirchDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const jungle_door = JungleDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const acacia_door = AcaciaDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const cherry_door = CherryDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const dark_oak_door = DarkOakDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const pale_oak_door = PaleOakDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const mangrove_door = MangroveDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const bamboo_door = BambooDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const end_rod = EndRod(block_property.FacingUp)

pub const chorus_plant = ChorusPlant(False, False, False, False, False, False)

pub const chorus_flower = ChorusFlower(block_property.default_age_5)

pub const purpur_block = PurpurBlock

pub const purpur_pillar = PurpurPillar(block_property.AxisY)

pub const purpur_stairs = PurpurStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const end_stone_bricks = EndStoneBricks

pub const torchflower_crop = TorchflowerCrop(block_property.default_age_1)

pub const pitcher_crop = PitcherCrop(
  block_property.default_age_4,
  block_property.DoubleBlockHalfLower,
)

pub const pitcher_plant = PitcherPlant(block_property.DoubleBlockHalfLower)

pub const beetroots = Beetroots(block_property.default_age_3)

pub const dirt_path = DirtPath

pub const end_gateway = EndGateway

pub const repeating_command_block = RepeatingCommandBlock(
  False,
  block_property.FacingNorth,
)

pub const chain_command_block = ChainCommandBlock(
  False,
  block_property.FacingNorth,
)

pub const frosted_ice = FrostedIce(block_property.default_age_3)

pub const magma_block = MagmaBlock

pub const nether_wart_block = NetherWartBlock

pub const red_nether_bricks = RedNetherBricks

pub const bone_block = BoneBlock(block_property.AxisY)

pub const structure_void = StructureVoid

pub const observer = Observer(block_property.FacingSouth, False)

pub const shulker_box = ShulkerBox(block_property.FacingUp)

pub const white_shulker_box = WhiteShulkerBox(block_property.FacingUp)

pub const orange_shulker_box = OrangeShulkerBox(block_property.FacingUp)

pub const magenta_shulker_box = MagentaShulkerBox(block_property.FacingUp)

pub const light_blue_shulker_box = LightBlueShulkerBox(block_property.FacingUp)

pub const yellow_shulker_box = YellowShulkerBox(block_property.FacingUp)

pub const lime_shulker_box = LimeShulkerBox(block_property.FacingUp)

pub const pink_shulker_box = PinkShulkerBox(block_property.FacingUp)

pub const gray_shulker_box = GrayShulkerBox(block_property.FacingUp)

pub const light_gray_shulker_box = LightGrayShulkerBox(block_property.FacingUp)

pub const cyan_shulker_box = CyanShulkerBox(block_property.FacingUp)

pub const purple_shulker_box = PurpleShulkerBox(block_property.FacingUp)

pub const blue_shulker_box = BlueShulkerBox(block_property.FacingUp)

pub const brown_shulker_box = BrownShulkerBox(block_property.FacingUp)

pub const green_shulker_box = GreenShulkerBox(block_property.FacingUp)

pub const red_shulker_box = RedShulkerBox(block_property.FacingUp)

pub const black_shulker_box = BlackShulkerBox(block_property.FacingUp)

pub const white_glazed_terracotta = WhiteGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const orange_glazed_terracotta = OrangeGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const magenta_glazed_terracotta = MagentaGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const light_blue_glazed_terracotta = LightBlueGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const yellow_glazed_terracotta = YellowGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const lime_glazed_terracotta = LimeGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const pink_glazed_terracotta = PinkGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const gray_glazed_terracotta = GrayGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const light_gray_glazed_terracotta = LightGrayGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const cyan_glazed_terracotta = CyanGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const purple_glazed_terracotta = PurpleGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const blue_glazed_terracotta = BlueGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const brown_glazed_terracotta = BrownGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const green_glazed_terracotta = GreenGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const red_glazed_terracotta = RedGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const black_glazed_terracotta = BlackGlazedTerracotta(
  block_property.FacingCardinalNorth,
)

pub const white_concrete = WhiteConcrete

pub const orange_concrete = OrangeConcrete

pub const magenta_concrete = MagentaConcrete

pub const light_blue_concrete = LightBlueConcrete

pub const yellow_concrete = YellowConcrete

pub const lime_concrete = LimeConcrete

pub const pink_concrete = PinkConcrete

pub const gray_concrete = GrayConcrete

pub const light_gray_concrete = LightGrayConcrete

pub const cyan_concrete = CyanConcrete

pub const purple_concrete = PurpleConcrete

pub const blue_concrete = BlueConcrete

pub const brown_concrete = BrownConcrete

pub const green_concrete = GreenConcrete

pub const red_concrete = RedConcrete

pub const black_concrete = BlackConcrete

pub const white_concrete_powder = WhiteConcretePowder

pub const orange_concrete_powder = OrangeConcretePowder

pub const magenta_concrete_powder = MagentaConcretePowder

pub const light_blue_concrete_powder = LightBlueConcretePowder

pub const yellow_concrete_powder = YellowConcretePowder

pub const lime_concrete_powder = LimeConcretePowder

pub const pink_concrete_powder = PinkConcretePowder

pub const gray_concrete_powder = GrayConcretePowder

pub const light_gray_concrete_powder = LightGrayConcretePowder

pub const cyan_concrete_powder = CyanConcretePowder

pub const purple_concrete_powder = PurpleConcretePowder

pub const blue_concrete_powder = BlueConcretePowder

pub const brown_concrete_powder = BrownConcretePowder

pub const green_concrete_powder = GreenConcretePowder

pub const red_concrete_powder = RedConcretePowder

pub const black_concrete_powder = BlackConcretePowder

pub const kelp = Kelp(block_property.default_age_25)

pub const kelp_plant = KelpPlant

pub const dried_kelp_block = DriedKelpBlock

pub const turtle_egg = TurtleEgg(
  block_property.default_eggs,
  block_property.default_hatch,
)

pub const sniffer_egg = SnifferEgg(block_property.default_hatch)

pub const dried_ghast = DriedGhast(
  block_property.FacingCardinalNorth,
  block_property.default_hydration,
  False,
)

pub const dead_tube_coral_block = DeadTubeCoralBlock

pub const dead_brain_coral_block = DeadBrainCoralBlock

pub const dead_bubble_coral_block = DeadBubbleCoralBlock

pub const dead_fire_coral_block = DeadFireCoralBlock

pub const dead_horn_coral_block = DeadHornCoralBlock

pub const tube_coral_block = TubeCoralBlock

pub const brain_coral_block = BrainCoralBlock

pub const bubble_coral_block = BubbleCoralBlock

pub const fire_coral_block = FireCoralBlock

pub const horn_coral_block = HornCoralBlock

pub const dead_tube_coral = DeadTubeCoral(True)

pub const dead_brain_coral = DeadBrainCoral(True)

pub const dead_bubble_coral = DeadBubbleCoral(True)

pub const dead_fire_coral = DeadFireCoral(True)

pub const dead_horn_coral = DeadHornCoral(True)

pub const tube_coral = TubeCoral(True)

pub const brain_coral = BrainCoral(True)

pub const bubble_coral = BubbleCoral(True)

pub const fire_coral = FireCoral(True)

pub const horn_coral = HornCoral(True)

pub const dead_tube_coral_fan = DeadTubeCoralFan(True)

pub const dead_brain_coral_fan = DeadBrainCoralFan(True)

pub const dead_bubble_coral_fan = DeadBubbleCoralFan(True)

pub const dead_fire_coral_fan = DeadFireCoralFan(True)

pub const dead_horn_coral_fan = DeadHornCoralFan(True)

pub const tube_coral_fan = TubeCoralFan(True)

pub const brain_coral_fan = BrainCoralFan(True)

pub const bubble_coral_fan = BubbleCoralFan(True)

pub const fire_coral_fan = FireCoralFan(True)

pub const horn_coral_fan = HornCoralFan(True)

pub const dead_tube_coral_wall_fan = DeadTubeCoralWallFan(
  block_property.FacingCardinalNorth,
  True,
)

pub const dead_brain_coral_wall_fan = DeadBrainCoralWallFan(
  block_property.FacingCardinalNorth,
  True,
)

pub const dead_bubble_coral_wall_fan = DeadBubbleCoralWallFan(
  block_property.FacingCardinalNorth,
  True,
)

pub const dead_fire_coral_wall_fan = DeadFireCoralWallFan(
  block_property.FacingCardinalNorth,
  True,
)

pub const dead_horn_coral_wall_fan = DeadHornCoralWallFan(
  block_property.FacingCardinalNorth,
  True,
)

pub const tube_coral_wall_fan = TubeCoralWallFan(
  block_property.FacingCardinalNorth,
  True,
)

pub const brain_coral_wall_fan = BrainCoralWallFan(
  block_property.FacingCardinalNorth,
  True,
)

pub const bubble_coral_wall_fan = BubbleCoralWallFan(
  block_property.FacingCardinalNorth,
  True,
)

pub const fire_coral_wall_fan = FireCoralWallFan(
  block_property.FacingCardinalNorth,
  True,
)

pub const horn_coral_wall_fan = HornCoralWallFan(
  block_property.FacingCardinalNorth,
  True,
)

pub const sea_pickle = SeaPickle(block_property.default_pickles, True)

pub const blue_ice = BlueIce

pub const conduit = Conduit(True)

pub const bamboo_sapling = BambooSapling

pub const bamboo = Bamboo(
  block_property.default_age_1,
  block_property.LeavesNone,
  block_property.default_stage,
)

pub const potted_bamboo = PottedBamboo

pub const void_air = VoidAir

pub const cave_air = CaveAir

pub const bubble_column = BubbleColumn(True)

pub const polished_granite_stairs = PolishedGraniteStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const smooth_red_sandstone_stairs = SmoothRedSandstoneStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const mossy_stone_brick_stairs = MossyStoneBrickStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const polished_diorite_stairs = PolishedDioriteStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const mossy_cobblestone_stairs = MossyCobblestoneStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const end_stone_brick_stairs = EndStoneBrickStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const stone_stairs = StoneStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const smooth_sandstone_stairs = SmoothSandstoneStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const smooth_quartz_stairs = SmoothQuartzStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const granite_stairs = GraniteStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const andesite_stairs = AndesiteStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const red_nether_brick_stairs = RedNetherBrickStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const polished_andesite_stairs = PolishedAndesiteStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const diorite_stairs = DioriteStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const polished_granite_slab = PolishedGraniteSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const smooth_red_sandstone_slab = SmoothRedSandstoneSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const mossy_stone_brick_slab = MossyStoneBrickSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const polished_diorite_slab = PolishedDioriteSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const mossy_cobblestone_slab = MossyCobblestoneSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const end_stone_brick_slab = EndStoneBrickSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const smooth_sandstone_slab = SmoothSandstoneSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const smooth_quartz_slab = SmoothQuartzSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const granite_slab = GraniteSlab(block_property.SlabTypeBottom, False)

pub const andesite_slab = AndesiteSlab(block_property.SlabTypeBottom, False)

pub const red_nether_brick_slab = RedNetherBrickSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const polished_andesite_slab = PolishedAndesiteSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const diorite_slab = DioriteSlab(block_property.SlabTypeBottom, False)

pub const brick_wall = BrickWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const prismarine_wall = PrismarineWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const red_sandstone_wall = RedSandstoneWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const mossy_stone_brick_wall = MossyStoneBrickWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const granite_wall = GraniteWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const stone_brick_wall = StoneBrickWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const mud_brick_wall = MudBrickWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const nether_brick_wall = NetherBrickWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const andesite_wall = AndesiteWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const red_nether_brick_wall = RedNetherBrickWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const sandstone_wall = SandstoneWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const end_stone_brick_wall = EndStoneBrickWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const diorite_wall = DioriteWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const scaffolding = Scaffolding(
  False,
  block_property.default_scaffolding_distance,
  False,
)

pub const loom = Loom(block_property.FacingCardinalNorth)

pub const barrel = Barrel(block_property.FacingNorth, False)

pub const smoker = Smoker(block_property.FacingCardinalNorth, False)

pub const blast_furnace = BlastFurnace(
  block_property.FacingCardinalNorth,
  False,
)

pub const cartography_table = CartographyTable

pub const fletching_table = FletchingTable

pub const grindstone = Grindstone(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
)

pub const lectern = Lectern(block_property.FacingCardinalNorth, False, False)

pub const smithing_table = SmithingTable

pub const stonecutter = Stonecutter(block_property.FacingCardinalNorth)

pub const bell = Bell(
  block_property.AttachmentFloor,
  block_property.FacingCardinalNorth,
  False,
)

pub const lantern = Lantern(False, False)

pub const soul_lantern = SoulLantern(False, False)

pub const copper_lantern = CopperLantern(False, False)

pub const exposed_copper_lantern = ExposedCopperLantern(False, False)

pub const weathered_copper_lantern = WeatheredCopperLantern(False, False)

pub const oxidized_copper_lantern = OxidizedCopperLantern(False, False)

pub const waxed_copper_lantern = WaxedCopperLantern(False, False)

pub const waxed_exposed_copper_lantern = WaxedExposedCopperLantern(False, False)

pub const waxed_weathered_copper_lantern = WaxedWeatheredCopperLantern(
  False,
  False,
)

pub const waxed_oxidized_copper_lantern = WaxedOxidizedCopperLantern(
  False,
  False,
)

pub const campfire = Campfire(
  block_property.FacingCardinalNorth,
  True,
  False,
  False,
)

pub const soul_campfire = SoulCampfire(
  block_property.FacingCardinalNorth,
  True,
  False,
  False,
)

pub const sweet_berry_bush = SweetBerryBush(block_property.default_age_3)

pub const warped_stem = WarpedStem(block_property.AxisY)

pub const stripped_warped_stem = StrippedWarpedStem(block_property.AxisY)

pub const warped_hyphae = WarpedHyphae(block_property.AxisY)

pub const stripped_warped_hyphae = StrippedWarpedHyphae(block_property.AxisY)

pub const warped_nylium = WarpedNylium

pub const warped_fungus = WarpedFungus

pub const warped_wart_block = WarpedWartBlock

pub const warped_roots = WarpedRoots

pub const nether_sprouts = NetherSprouts

pub const crimson_stem = CrimsonStem(block_property.AxisY)

pub const stripped_crimson_stem = StrippedCrimsonStem(block_property.AxisY)

pub const crimson_hyphae = CrimsonHyphae(block_property.AxisY)

pub const stripped_crimson_hyphae = StrippedCrimsonHyphae(block_property.AxisY)

pub const crimson_nylium = CrimsonNylium

pub const crimson_fungus = CrimsonFungus

pub const shroomlight = Shroomlight

pub const weeping_vines = WeepingVines(block_property.default_age_25)

pub const weeping_vines_plant = WeepingVinesPlant

pub const twisting_vines = TwistingVines(block_property.default_age_25)

pub const twisting_vines_plant = TwistingVinesPlant

pub const crimson_roots = CrimsonRoots

pub const crimson_planks = CrimsonPlanks

pub const warped_planks = WarpedPlanks

pub const crimson_slab = CrimsonSlab(block_property.SlabTypeBottom, False)

pub const warped_slab = WarpedSlab(block_property.SlabTypeBottom, False)

pub const crimson_pressure_plate = CrimsonPressurePlate(False)

pub const warped_pressure_plate = WarpedPressurePlate(False)

pub const crimson_fence = CrimsonFence(False, False, False, False, False)

pub const warped_fence = WarpedFence(False, False, False, False, False)

pub const crimson_trapdoor = CrimsonTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const warped_trapdoor = WarpedTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const crimson_fence_gate = CrimsonFenceGate(
  block_property.FacingCardinalNorth,
  False,
  False,
  False,
)

pub const warped_fence_gate = WarpedFenceGate(
  block_property.FacingCardinalNorth,
  False,
  False,
  False,
)

pub const crimson_stairs = CrimsonStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const warped_stairs = WarpedStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const crimson_button = CrimsonButton(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
  False,
)

pub const warped_button = WarpedButton(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
  False,
)

pub const crimson_door = CrimsonDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const warped_door = WarpedDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const crimson_sign = CrimsonSign(block_property.default_rotation, False)

pub const warped_sign = WarpedSign(block_property.default_rotation, False)

pub const crimson_wall_sign = CrimsonWallSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const warped_wall_sign = WarpedWallSign(
  block_property.FacingCardinalNorth,
  False,
)

pub const structure_block = StructureBlock(block_property.StructureModeLoad)

pub const jigsaw = Jigsaw(block_property.OrientationNorthUp)

pub const test_block = TestBlock(block_property.TestModeStart)

pub const test_instance_block = TestInstanceBlock

pub const composter = Composter(block_property.default_composter_level)

pub const target = Target(block_property.default_power)

pub const bee_nest = BeeNest(
  block_property.FacingCardinalNorth,
  block_property.default_honey_level,
)

pub const beehive = Beehive(
  block_property.FacingCardinalNorth,
  block_property.default_honey_level,
)

pub const honey_block = HoneyBlock

pub const honeycomb_block = HoneycombBlock

pub const netherite_block = NetheriteBlock

pub const ancient_debris = AncientDebris

pub const crying_obsidian = CryingObsidian

pub const respawn_anchor = RespawnAnchor(block_property.default_charges)

pub const potted_crimson_fungus = PottedCrimsonFungus

pub const potted_warped_fungus = PottedWarpedFungus

pub const potted_crimson_roots = PottedCrimsonRoots

pub const potted_warped_roots = PottedWarpedRoots

pub const lodestone = Lodestone

pub const blackstone = Blackstone

pub const blackstone_stairs = BlackstoneStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const blackstone_wall = BlackstoneWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const blackstone_slab = BlackstoneSlab(block_property.SlabTypeBottom, False)

pub const polished_blackstone = PolishedBlackstone

pub const polished_blackstone_bricks = PolishedBlackstoneBricks

pub const cracked_polished_blackstone_bricks = CrackedPolishedBlackstoneBricks

pub const chiseled_polished_blackstone = ChiseledPolishedBlackstone

pub const polished_blackstone_brick_slab = PolishedBlackstoneBrickSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const polished_blackstone_brick_stairs = PolishedBlackstoneBrickStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const polished_blackstone_brick_wall = PolishedBlackstoneBrickWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const gilded_blackstone = GildedBlackstone

pub const polished_blackstone_stairs = PolishedBlackstoneStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const polished_blackstone_slab = PolishedBlackstoneSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const polished_blackstone_pressure_plate = PolishedBlackstonePressurePlate(
  False,
)

pub const polished_blackstone_button = PolishedBlackstoneButton(
  block_property.WallFaceWall,
  block_property.FacingCardinalNorth,
  False,
)

pub const polished_blackstone_wall = PolishedBlackstoneWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const chiseled_nether_bricks = ChiseledNetherBricks

pub const cracked_nether_bricks = CrackedNetherBricks

pub const quartz_bricks = QuartzBricks

pub const candle = Candle(block_property.default_candles, False, False)

pub const white_candle = WhiteCandle(
  block_property.default_candles,
  False,
  False,
)

pub const orange_candle = OrangeCandle(
  block_property.default_candles,
  False,
  False,
)

pub const magenta_candle = MagentaCandle(
  block_property.default_candles,
  False,
  False,
)

pub const light_blue_candle = LightBlueCandle(
  block_property.default_candles,
  False,
  False,
)

pub const yellow_candle = YellowCandle(
  block_property.default_candles,
  False,
  False,
)

pub const lime_candle = LimeCandle(block_property.default_candles, False, False)

pub const pink_candle = PinkCandle(block_property.default_candles, False, False)

pub const gray_candle = GrayCandle(block_property.default_candles, False, False)

pub const light_gray_candle = LightGrayCandle(
  block_property.default_candles,
  False,
  False,
)

pub const cyan_candle = CyanCandle(block_property.default_candles, False, False)

pub const purple_candle = PurpleCandle(
  block_property.default_candles,
  False,
  False,
)

pub const blue_candle = BlueCandle(block_property.default_candles, False, False)

pub const brown_candle = BrownCandle(
  block_property.default_candles,
  False,
  False,
)

pub const green_candle = GreenCandle(
  block_property.default_candles,
  False,
  False,
)

pub const red_candle = RedCandle(block_property.default_candles, False, False)

pub const black_candle = BlackCandle(
  block_property.default_candles,
  False,
  False,
)

pub const candle_cake = CandleCake(False)

pub const white_candle_cake = WhiteCandleCake(False)

pub const orange_candle_cake = OrangeCandleCake(False)

pub const magenta_candle_cake = MagentaCandleCake(False)

pub const light_blue_candle_cake = LightBlueCandleCake(False)

pub const yellow_candle_cake = YellowCandleCake(False)

pub const lime_candle_cake = LimeCandleCake(False)

pub const pink_candle_cake = PinkCandleCake(False)

pub const gray_candle_cake = GrayCandleCake(False)

pub const light_gray_candle_cake = LightGrayCandleCake(False)

pub const cyan_candle_cake = CyanCandleCake(False)

pub const purple_candle_cake = PurpleCandleCake(False)

pub const blue_candle_cake = BlueCandleCake(False)

pub const brown_candle_cake = BrownCandleCake(False)

pub const green_candle_cake = GreenCandleCake(False)

pub const red_candle_cake = RedCandleCake(False)

pub const black_candle_cake = BlackCandleCake(False)

pub const amethyst_block = AmethystBlock

pub const budding_amethyst = BuddingAmethyst

pub const amethyst_cluster = AmethystCluster(block_property.FacingUp, False)

pub const large_amethyst_bud = LargeAmethystBud(block_property.FacingUp, False)

pub const medium_amethyst_bud = MediumAmethystBud(
  block_property.FacingUp,
  False,
)

pub const small_amethyst_bud = SmallAmethystBud(block_property.FacingUp, False)

pub const tuff = Tuff

pub const tuff_slab = TuffSlab(block_property.SlabTypeBottom, False)

pub const tuff_stairs = TuffStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const tuff_wall = TuffWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const polished_tuff = PolishedTuff

pub const polished_tuff_slab = PolishedTuffSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const polished_tuff_stairs = PolishedTuffStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const polished_tuff_wall = PolishedTuffWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const chiseled_tuff = ChiseledTuff

pub const tuff_bricks = TuffBricks

pub const tuff_brick_slab = TuffBrickSlab(block_property.SlabTypeBottom, False)

pub const tuff_brick_stairs = TuffBrickStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const tuff_brick_wall = TuffBrickWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const chiseled_tuff_bricks = ChiseledTuffBricks

pub const calcite = Calcite

pub const tinted_glass = TintedGlass

pub const powder_snow = PowderSnow

pub const sculk_sensor = SculkSensor(
  block_property.default_power,
  block_property.SculkSensorPhaseInactive,
  False,
)

pub const calibrated_sculk_sensor = CalibratedSculkSensor(
  block_property.FacingCardinalNorth,
  block_property.default_power,
  block_property.SculkSensorPhaseInactive,
  False,
)

pub const sculk = Sculk

pub const sculk_vein = SculkVein(
  False,
  False,
  False,
  False,
  False,
  False,
  False,
)

pub const sculk_catalyst = SculkCatalyst(False)

pub const sculk_shrieker = SculkShrieker(False, False, False)

pub const copper_block = CopperBlock

pub const exposed_copper = ExposedCopper

pub const weathered_copper = WeatheredCopper

pub const oxidized_copper = OxidizedCopper

pub const copper_ore = CopperOre

pub const deepslate_copper_ore = DeepslateCopperOre

pub const oxidized_cut_copper = OxidizedCutCopper

pub const weathered_cut_copper = WeatheredCutCopper

pub const exposed_cut_copper = ExposedCutCopper

pub const cut_copper = CutCopper

pub const oxidized_chiseled_copper = OxidizedChiseledCopper

pub const weathered_chiseled_copper = WeatheredChiseledCopper

pub const exposed_chiseled_copper = ExposedChiseledCopper

pub const chiseled_copper = ChiseledCopper

pub const waxed_oxidized_chiseled_copper = WaxedOxidizedChiseledCopper

pub const waxed_weathered_chiseled_copper = WaxedWeatheredChiseledCopper

pub const waxed_exposed_chiseled_copper = WaxedExposedChiseledCopper

pub const waxed_chiseled_copper = WaxedChiseledCopper

pub const oxidized_cut_copper_stairs = OxidizedCutCopperStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const weathered_cut_copper_stairs = WeatheredCutCopperStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const exposed_cut_copper_stairs = ExposedCutCopperStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const cut_copper_stairs = CutCopperStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const oxidized_cut_copper_slab = OxidizedCutCopperSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const weathered_cut_copper_slab = WeatheredCutCopperSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const exposed_cut_copper_slab = ExposedCutCopperSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const cut_copper_slab = CutCopperSlab(block_property.SlabTypeBottom, False)

pub const waxed_copper_block = WaxedCopperBlock

pub const waxed_weathered_copper = WaxedWeatheredCopper

pub const waxed_exposed_copper = WaxedExposedCopper

pub const waxed_oxidized_copper = WaxedOxidizedCopper

pub const waxed_oxidized_cut_copper = WaxedOxidizedCutCopper

pub const waxed_weathered_cut_copper = WaxedWeatheredCutCopper

pub const waxed_exposed_cut_copper = WaxedExposedCutCopper

pub const waxed_cut_copper = WaxedCutCopper

pub const waxed_oxidized_cut_copper_stairs = WaxedOxidizedCutCopperStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const waxed_weathered_cut_copper_stairs = WaxedWeatheredCutCopperStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const waxed_exposed_cut_copper_stairs = WaxedExposedCutCopperStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const waxed_cut_copper_stairs = WaxedCutCopperStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const waxed_oxidized_cut_copper_slab = WaxedOxidizedCutCopperSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const waxed_weathered_cut_copper_slab = WaxedWeatheredCutCopperSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const waxed_exposed_cut_copper_slab = WaxedExposedCutCopperSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const waxed_cut_copper_slab = WaxedCutCopperSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const copper_door = CopperDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const exposed_copper_door = ExposedCopperDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const oxidized_copper_door = OxidizedCopperDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const weathered_copper_door = WeatheredCopperDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const waxed_copper_door = WaxedCopperDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const waxed_exposed_copper_door = WaxedExposedCopperDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const waxed_oxidized_copper_door = WaxedOxidizedCopperDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const waxed_weathered_copper_door = WaxedWeatheredCopperDoor(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  block_property.DoorHingeLeft,
  False,
  False,
)

pub const copper_trapdoor = CopperTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const exposed_copper_trapdoor = ExposedCopperTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const oxidized_copper_trapdoor = OxidizedCopperTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const weathered_copper_trapdoor = WeatheredCopperTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const waxed_copper_trapdoor = WaxedCopperTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const waxed_exposed_copper_trapdoor = WaxedExposedCopperTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const waxed_oxidized_copper_trapdoor = WaxedOxidizedCopperTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const waxed_weathered_copper_trapdoor = WaxedWeatheredCopperTrapdoor(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  False,
  False,
  False,
)

pub const copper_grate = CopperGrate(False)

pub const exposed_copper_grate = ExposedCopperGrate(False)

pub const weathered_copper_grate = WeatheredCopperGrate(False)

pub const oxidized_copper_grate = OxidizedCopperGrate(False)

pub const waxed_copper_grate = WaxedCopperGrate(False)

pub const waxed_exposed_copper_grate = WaxedExposedCopperGrate(False)

pub const waxed_weathered_copper_grate = WaxedWeatheredCopperGrate(False)

pub const waxed_oxidized_copper_grate = WaxedOxidizedCopperGrate(False)

pub const copper_bulb = CopperBulb(False, False)

pub const exposed_copper_bulb = ExposedCopperBulb(False, False)

pub const weathered_copper_bulb = WeatheredCopperBulb(False, False)

pub const oxidized_copper_bulb = OxidizedCopperBulb(False, False)

pub const waxed_copper_bulb = WaxedCopperBulb(False, False)

pub const waxed_exposed_copper_bulb = WaxedExposedCopperBulb(False, False)

pub const waxed_weathered_copper_bulb = WaxedWeatheredCopperBulb(False, False)

pub const waxed_oxidized_copper_bulb = WaxedOxidizedCopperBulb(False, False)

pub const copper_chest = CopperChest(
  block_property.FacingCardinalNorth,
  block_property.ChestTypeSingle,
  False,
)

pub const exposed_copper_chest = ExposedCopperChest(
  block_property.FacingCardinalNorth,
  block_property.ChestTypeSingle,
  False,
)

pub const weathered_copper_chest = WeatheredCopperChest(
  block_property.FacingCardinalNorth,
  block_property.ChestTypeSingle,
  False,
)

pub const oxidized_copper_chest = OxidizedCopperChest(
  block_property.FacingCardinalNorth,
  block_property.ChestTypeSingle,
  False,
)

pub const waxed_copper_chest = WaxedCopperChest(
  block_property.FacingCardinalNorth,
  block_property.ChestTypeSingle,
  False,
)

pub const waxed_exposed_copper_chest = WaxedExposedCopperChest(
  block_property.FacingCardinalNorth,
  block_property.ChestTypeSingle,
  False,
)

pub const waxed_weathered_copper_chest = WaxedWeatheredCopperChest(
  block_property.FacingCardinalNorth,
  block_property.ChestTypeSingle,
  False,
)

pub const waxed_oxidized_copper_chest = WaxedOxidizedCopperChest(
  block_property.FacingCardinalNorth,
  block_property.ChestTypeSingle,
  False,
)

pub const copper_golem_statue = CopperGolemStatue(
  block_property.CopperGolemPoseStanding,
  block_property.FacingCardinalNorth,
  False,
)

pub const exposed_copper_golem_statue = ExposedCopperGolemStatue(
  block_property.CopperGolemPoseStanding,
  block_property.FacingCardinalNorth,
  False,
)

pub const weathered_copper_golem_statue = WeatheredCopperGolemStatue(
  block_property.CopperGolemPoseStanding,
  block_property.FacingCardinalNorth,
  False,
)

pub const oxidized_copper_golem_statue = OxidizedCopperGolemStatue(
  block_property.CopperGolemPoseStanding,
  block_property.FacingCardinalNorth,
  False,
)

pub const waxed_copper_golem_statue = WaxedCopperGolemStatue(
  block_property.CopperGolemPoseStanding,
  block_property.FacingCardinalNorth,
  False,
)

pub const waxed_exposed_copper_golem_statue = WaxedExposedCopperGolemStatue(
  block_property.CopperGolemPoseStanding,
  block_property.FacingCardinalNorth,
  False,
)

pub const waxed_weathered_copper_golem_statue = WaxedWeatheredCopperGolemStatue(
  block_property.CopperGolemPoseStanding,
  block_property.FacingCardinalNorth,
  False,
)

pub const waxed_oxidized_copper_golem_statue = WaxedOxidizedCopperGolemStatue(
  block_property.CopperGolemPoseStanding,
  block_property.FacingCardinalNorth,
  False,
)

pub const lightning_rod = LightningRod(block_property.FacingUp, False, False)

pub const exposed_lightning_rod = ExposedLightningRod(
  block_property.FacingUp,
  False,
  False,
)

pub const weathered_lightning_rod = WeatheredLightningRod(
  block_property.FacingUp,
  False,
  False,
)

pub const oxidized_lightning_rod = OxidizedLightningRod(
  block_property.FacingUp,
  False,
  False,
)

pub const waxed_lightning_rod = WaxedLightningRod(
  block_property.FacingUp,
  False,
  False,
)

pub const waxed_exposed_lightning_rod = WaxedExposedLightningRod(
  block_property.FacingUp,
  False,
  False,
)

pub const waxed_weathered_lightning_rod = WaxedWeatheredLightningRod(
  block_property.FacingUp,
  False,
  False,
)

pub const waxed_oxidized_lightning_rod = WaxedOxidizedLightningRod(
  block_property.FacingUp,
  False,
  False,
)

pub const pointed_dripstone = PointedDripstone(
  block_property.ThicknessTip,
  block_property.VerticalDirectionUp,
  False,
)

pub const dripstone_block = DripstoneBlock

pub const cave_vines = CaveVines(block_property.default_age_25, False)

pub const cave_vines_plant = CaveVinesPlant(False)

pub const spore_blossom = SporeBlossom

pub const azalea = Azalea

pub const flowering_azalea = FloweringAzalea

pub const moss_carpet = MossCarpet

pub const pink_petals = PinkPetals(
  block_property.FacingCardinalNorth,
  block_property.default_flower_amount,
)

pub const wildflowers = Wildflowers(
  block_property.FacingCardinalNorth,
  block_property.default_flower_amount,
)

pub const leaf_litter = LeafLitter(
  block_property.FacingCardinalNorth,
  block_property.default_segment_amount,
)

pub const moss_block = MossBlock

pub const big_dripleaf = BigDripleaf(
  block_property.FacingCardinalNorth,
  block_property.TiltNone,
  False,
)

pub const big_dripleaf_stem = BigDripleafStem(
  block_property.FacingCardinalNorth,
  False,
)

pub const small_dripleaf = SmallDripleaf(
  block_property.FacingCardinalNorth,
  block_property.DoubleBlockHalfLower,
  False,
)

pub const hanging_roots = HangingRoots(False)

pub const rooted_dirt = RootedDirt

pub const mud = Mud

pub const deepslate = Deepslate(block_property.AxisY)

pub const cobbled_deepslate = CobbledDeepslate

pub const cobbled_deepslate_stairs = CobbledDeepslateStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const cobbled_deepslate_slab = CobbledDeepslateSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const cobbled_deepslate_wall = CobbledDeepslateWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const polished_deepslate = PolishedDeepslate

pub const polished_deepslate_stairs = PolishedDeepslateStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const polished_deepslate_slab = PolishedDeepslateSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const polished_deepslate_wall = PolishedDeepslateWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const deepslate_tiles = DeepslateTiles

pub const deepslate_tile_stairs = DeepslateTileStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const deepslate_tile_slab = DeepslateTileSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const deepslate_tile_wall = DeepslateTileWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const deepslate_bricks = DeepslateBricks

pub const deepslate_brick_stairs = DeepslateBrickStairs(
  block_property.FacingCardinalNorth,
  block_property.SlabHalfBottom,
  block_property.StairShapeStraight,
  False,
)

pub const deepslate_brick_slab = DeepslateBrickSlab(
  block_property.SlabTypeBottom,
  False,
)

pub const deepslate_brick_wall = DeepslateBrickWall(
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  True,
  False,
  block_property.WallSideNone,
)

pub const chiseled_deepslate = ChiseledDeepslate

pub const cracked_deepslate_bricks = CrackedDeepslateBricks

pub const cracked_deepslate_tiles = CrackedDeepslateTiles

pub const infested_deepslate = InfestedDeepslate(block_property.AxisY)

pub const smooth_basalt = SmoothBasalt

pub const raw_iron_block = RawIronBlock

pub const raw_copper_block = RawCopperBlock

pub const raw_gold_block = RawGoldBlock

pub const potted_azalea_bush = PottedAzaleaBush

pub const potted_flowering_azalea_bush = PottedFloweringAzaleaBush

pub const ochre_froglight = OchreFroglight(block_property.AxisY)

pub const verdant_froglight = VerdantFroglight(block_property.AxisY)

pub const pearlescent_froglight = PearlescentFroglight(block_property.AxisY)

pub const frogspawn = Frogspawn

pub const reinforced_deepslate = ReinforcedDeepslate

pub const decorated_pot = DecoratedPot(
  False,
  block_property.FacingCardinalNorth,
  False,
)

pub const crafter = Crafter(False, block_property.OrientationNorthUp, False)

pub const trial_spawner = TrialSpawner(
  False,
  block_property.TrialSpawnerStateInactive,
)

pub const vault = Vault(
  block_property.FacingCardinalNorth,
  False,
  block_property.VaultStateInactive,
)

pub const heavy_core = HeavyCore(False)

pub const pale_moss_block = PaleMossBlock

pub const pale_moss_carpet = PaleMossCarpet(
  True,
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
  block_property.WallSideNone,
)

pub const pale_hanging_moss = PaleHangingMoss(True)

pub const open_eyeblossom = OpenEyeblossom

pub const closed_eyeblossom = ClosedEyeblossom

pub const potted_open_eyeblossom = PottedOpenEyeblossom

pub const potted_closed_eyeblossom = PottedClosedEyeblossom

pub const firefly_bush = FireflyBush

pub fn to_int(block_state: BlockState) {
  case block_state {
    Air -> 0
    Stone -> 1
    Granite -> 2
    PolishedGranite -> 3
    Diorite -> 4
    PolishedDiorite -> 5
    Andesite -> 6
    PolishedAndesite -> 7
    GrassBlock(snowy:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(snowy),
      ])
      + 8
    }
    Dirt -> 10
    CoarseDirt -> 11
    Podzol(snowy:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(snowy),
      ])
      + 12
    }
    Cobblestone -> 14
    OakPlanks -> 15
    SprucePlanks -> 16
    BirchPlanks -> 17
    JunglePlanks -> 18
    AcaciaPlanks -> 19
    CherryPlanks -> 20
    DarkOakPlanks -> 21
    PaleOakWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 22
    }
    PaleOakPlanks -> 25
    MangrovePlanks -> 26
    BambooPlanks -> 27
    BambooMosaic -> 28
    OakSapling(stage:) -> {
      block_property.accumulate_based_indices([
        block_property.stage_to_index(stage),
      ])
      + 29
    }
    SpruceSapling(stage:) -> {
      block_property.accumulate_based_indices([
        block_property.stage_to_index(stage),
      ])
      + 31
    }
    BirchSapling(stage:) -> {
      block_property.accumulate_based_indices([
        block_property.stage_to_index(stage),
      ])
      + 33
    }
    JungleSapling(stage:) -> {
      block_property.accumulate_based_indices([
        block_property.stage_to_index(stage),
      ])
      + 35
    }
    AcaciaSapling(stage:) -> {
      block_property.accumulate_based_indices([
        block_property.stage_to_index(stage),
      ])
      + 37
    }
    CherrySapling(stage:) -> {
      block_property.accumulate_based_indices([
        block_property.stage_to_index(stage),
      ])
      + 39
    }
    DarkOakSapling(stage:) -> {
      block_property.accumulate_based_indices([
        block_property.stage_to_index(stage),
      ])
      + 41
    }
    PaleOakSapling(stage:) -> {
      block_property.accumulate_based_indices([
        block_property.stage_to_index(stage),
      ])
      + 43
    }
    MangrovePropagule(age:, hanging:, stage:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.age_4_to_index(age),
        block_property.bool_to_index(hanging),
        block_property.stage_to_index(stage),
        block_property.bool_to_index(waterlogged),
      ])
      + 45
    }
    Bedrock -> 85
    Water(level:) -> {
      block_property.accumulate_based_indices([
        block_property.liquid_level_to_index(level),
      ])
      + 86
    }
    Lava(level:) -> {
      block_property.accumulate_based_indices([
        block_property.liquid_level_to_index(level),
      ])
      + 102
    }
    Sand -> 118
    SuspiciousSand(dusted:) -> {
      block_property.accumulate_based_indices([
        block_property.dusted_to_index(dusted),
      ])
      + 119
    }
    RedSand -> 123
    Gravel -> 124
    SuspiciousGravel(dusted:) -> {
      block_property.accumulate_based_indices([
        block_property.dusted_to_index(dusted),
      ])
      + 125
    }
    GoldOre -> 129
    DeepslateGoldOre -> 130
    IronOre -> 131
    DeepslateIronOre -> 132
    CoalOre -> 133
    DeepslateCoalOre -> 134
    NetherGoldOre -> 135
    OakLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 136
    }
    SpruceLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 139
    }
    BirchLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 142
    }
    JungleLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 145
    }
    AcaciaLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 148
    }
    CherryLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 151
    }
    DarkOakLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 154
    }
    PaleOakLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 157
    }
    MangroveLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 160
    }
    MangroveRoots(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 163
    }
    MuddyMangroveRoots(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 165
    }
    BambooBlock(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 168
    }
    StrippedSpruceLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 171
    }
    StrippedBirchLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 174
    }
    StrippedJungleLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 177
    }
    StrippedAcaciaLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 180
    }
    StrippedCherryLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 183
    }
    StrippedDarkOakLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 186
    }
    StrippedPaleOakLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 189
    }
    StrippedOakLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 192
    }
    StrippedMangroveLog(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 195
    }
    StrippedBambooBlock(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 198
    }
    OakWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 201
    }
    SpruceWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 204
    }
    BirchWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 207
    }
    JungleWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 210
    }
    AcaciaWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 213
    }
    CherryWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 216
    }
    DarkOakWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 219
    }
    MangroveWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 222
    }
    StrippedOakWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 225
    }
    StrippedSpruceWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 228
    }
    StrippedBirchWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 231
    }
    StrippedJungleWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 234
    }
    StrippedAcaciaWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 237
    }
    StrippedCherryWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 240
    }
    StrippedDarkOakWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 243
    }
    StrippedPaleOakWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 246
    }
    StrippedMangroveWood(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 249
    }
    OakLeaves(distance:, persistent:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.leaves_distance_to_index(distance),
        block_property.bool_to_index(persistent),
        block_property.bool_to_index(waterlogged),
      ])
      + 252
    }
    SpruceLeaves(distance:, persistent:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.leaves_distance_to_index(distance),
        block_property.bool_to_index(persistent),
        block_property.bool_to_index(waterlogged),
      ])
      + 280
    }
    BirchLeaves(distance:, persistent:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.leaves_distance_to_index(distance),
        block_property.bool_to_index(persistent),
        block_property.bool_to_index(waterlogged),
      ])
      + 308
    }
    JungleLeaves(distance:, persistent:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.leaves_distance_to_index(distance),
        block_property.bool_to_index(persistent),
        block_property.bool_to_index(waterlogged),
      ])
      + 336
    }
    AcaciaLeaves(distance:, persistent:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.leaves_distance_to_index(distance),
        block_property.bool_to_index(persistent),
        block_property.bool_to_index(waterlogged),
      ])
      + 364
    }
    CherryLeaves(distance:, persistent:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.leaves_distance_to_index(distance),
        block_property.bool_to_index(persistent),
        block_property.bool_to_index(waterlogged),
      ])
      + 392
    }
    DarkOakLeaves(distance:, persistent:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.leaves_distance_to_index(distance),
        block_property.bool_to_index(persistent),
        block_property.bool_to_index(waterlogged),
      ])
      + 420
    }
    PaleOakLeaves(distance:, persistent:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.leaves_distance_to_index(distance),
        block_property.bool_to_index(persistent),
        block_property.bool_to_index(waterlogged),
      ])
      + 448
    }
    MangroveLeaves(distance:, persistent:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.leaves_distance_to_index(distance),
        block_property.bool_to_index(persistent),
        block_property.bool_to_index(waterlogged),
      ])
      + 476
    }
    AzaleaLeaves(distance:, persistent:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.leaves_distance_to_index(distance),
        block_property.bool_to_index(persistent),
        block_property.bool_to_index(waterlogged),
      ])
      + 504
    }
    FloweringAzaleaLeaves(distance:, persistent:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.leaves_distance_to_index(distance),
        block_property.bool_to_index(persistent),
        block_property.bool_to_index(waterlogged),
      ])
      + 532
    }
    Sponge -> 560
    WetSponge -> 561
    Glass -> 562
    LapisOre -> 563
    DeepslateLapisOre -> 564
    LapisBlock -> 565
    Dispenser(facing:, triggered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(triggered),
      ])
      + 566
    }
    Sandstone -> 578
    ChiseledSandstone -> 579
    CutSandstone -> 580
    NoteBlock(instrument:, note:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.instrument_to_index(instrument),
        block_property.note_to_index(note),
        block_property.bool_to_index(powered),
      ])
      + 581
    }
    WhiteBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1731
    }
    OrangeBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1747
    }
    MagentaBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1763
    }
    LightBlueBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1779
    }
    YellowBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1795
    }
    LimeBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1811
    }
    PinkBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1827
    }
    GrayBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1843
    }
    LightGrayBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1859
    }
    CyanBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1875
    }
    PurpleBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1891
    }
    BlueBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1907
    }
    BrownBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1923
    }
    GreenBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1939
    }
    RedBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1955
    }
    BlackBed(facing:, occupied:, part:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(occupied),
        block_property.bed_part_to_index(part),
      ])
      + 1971
    }
    PoweredRail(powered:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
        block_property.rail_shape_straight_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 1987
    }
    DetectorRail(powered:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
        block_property.rail_shape_straight_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 2011
    }
    StickyPiston(extended:, facing:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(extended),
        block_property.facing_to_index(facing),
      ])
      + 2035
    }
    Cobweb -> 2047
    ShortGrass -> 2048
    Fern -> 2049
    DeadBush -> 2050
    Bush -> 2051
    ShortDryGrass -> 2052
    TallDryGrass -> 2053
    Seagrass -> 2054
    TallSeagrass(half:) -> {
      block_property.accumulate_based_indices([
        block_property.double_block_half_to_index(half),
      ])
      + 2055
    }
    Piston(extended:, facing:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(extended),
        block_property.facing_to_index(facing),
      ])
      + 2057
    }
    PistonHead(facing:, short:, piston_type:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(short),
        block_property.piston_type_to_index(piston_type),
      ])
      + 2069
    }
    WhiteWool -> 2093
    OrangeWool -> 2094
    MagentaWool -> 2095
    LightBlueWool -> 2096
    YellowWool -> 2097
    LimeWool -> 2098
    PinkWool -> 2099
    GrayWool -> 2100
    LightGrayWool -> 2101
    CyanWool -> 2102
    PurpleWool -> 2103
    BlueWool -> 2104
    BrownWool -> 2105
    GreenWool -> 2106
    RedWool -> 2107
    BlackWool -> 2108
    MovingPiston(facing:, piston_type:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.piston_type_to_index(piston_type),
      ])
      + 2109
    }
    Dandelion -> 2121
    Torchflower -> 2122
    Poppy -> 2123
    BlueOrchid -> 2124
    Allium -> 2125
    AzureBluet -> 2126
    RedTulip -> 2127
    OrangeTulip -> 2128
    WhiteTulip -> 2129
    PinkTulip -> 2130
    OxeyeDaisy -> 2131
    Cornflower -> 2132
    WitherRose -> 2133
    LilyOfTheValley -> 2134
    BrownMushroom -> 2135
    RedMushroom -> 2136
    GoldBlock -> 2137
    IronBlock -> 2138
    Bricks -> 2139
    Tnt(unstable:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(unstable),
      ])
      + 2140
    }
    Bookshelf -> 2142
    ChiseledBookshelf(
      facing:,
      slot_0_occupied:,
      slot_1_occupied:,
      slot_2_occupied:,
      slot_3_occupied:,
      slot_4_occupied:,
      slot_5_occupied:,
    ) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(slot_0_occupied),
        block_property.bool_to_index(slot_1_occupied),
        block_property.bool_to_index(slot_2_occupied),
        block_property.bool_to_index(slot_3_occupied),
        block_property.bool_to_index(slot_4_occupied),
        block_property.bool_to_index(slot_5_occupied),
      ])
      + 2143
    }
    AcaciaShelf(facing:, powered:, side_chain:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.side_chain_to_index(side_chain),
        block_property.bool_to_index(waterlogged),
      ])
      + 2399
    }
    BambooShelf(facing:, powered:, side_chain:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.side_chain_to_index(side_chain),
        block_property.bool_to_index(waterlogged),
      ])
      + 2463
    }
    BirchShelf(facing:, powered:, side_chain:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.side_chain_to_index(side_chain),
        block_property.bool_to_index(waterlogged),
      ])
      + 2527
    }
    CherryShelf(facing:, powered:, side_chain:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.side_chain_to_index(side_chain),
        block_property.bool_to_index(waterlogged),
      ])
      + 2591
    }
    CrimsonShelf(facing:, powered:, side_chain:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.side_chain_to_index(side_chain),
        block_property.bool_to_index(waterlogged),
      ])
      + 2655
    }
    DarkOakShelf(facing:, powered:, side_chain:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.side_chain_to_index(side_chain),
        block_property.bool_to_index(waterlogged),
      ])
      + 2719
    }
    JungleShelf(facing:, powered:, side_chain:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.side_chain_to_index(side_chain),
        block_property.bool_to_index(waterlogged),
      ])
      + 2783
    }
    MangroveShelf(facing:, powered:, side_chain:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.side_chain_to_index(side_chain),
        block_property.bool_to_index(waterlogged),
      ])
      + 2847
    }
    OakShelf(facing:, powered:, side_chain:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.side_chain_to_index(side_chain),
        block_property.bool_to_index(waterlogged),
      ])
      + 2911
    }
    PaleOakShelf(facing:, powered:, side_chain:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.side_chain_to_index(side_chain),
        block_property.bool_to_index(waterlogged),
      ])
      + 2975
    }
    SpruceShelf(facing:, powered:, side_chain:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.side_chain_to_index(side_chain),
        block_property.bool_to_index(waterlogged),
      ])
      + 3039
    }
    WarpedShelf(facing:, powered:, side_chain:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.side_chain_to_index(side_chain),
        block_property.bool_to_index(waterlogged),
      ])
      + 3103
    }
    MossyCobblestone -> 3167
    Obsidian -> 3168
    Torch -> 3169
    WallTorch(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 3170
    }
    Fire(age:, east:, north:, south:, up:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.age_15_to_index(age),
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(west),
      ])
      + 3174
    }
    SoulFire -> 3686
    Spawner -> 3687
    CreakingHeart(axis:, creaking_heart_state:, natural:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
        block_property.creaking_heart_state_to_index(creaking_heart_state),
        block_property.bool_to_index(natural),
      ])
      + 3688
    }
    OakStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 3706
    }
    Chest(facing:, chest_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.chest_type_to_index(chest_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 3786
    }
    RedstoneWire(east:, north:, power:, south:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.redstone_side_to_index(east),
        block_property.redstone_side_to_index(north),
        block_property.power_to_index(power),
        block_property.redstone_side_to_index(south),
        block_property.redstone_side_to_index(west),
      ])
      + 3810
    }
    DiamondOre -> 5106
    DeepslateDiamondOre -> 5107
    DiamondBlock -> 5108
    CraftingTable -> 5109
    Wheat(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_7_to_index(age),
      ])
      + 5110
    }
    Farmland(moisture:) -> {
      block_property.accumulate_based_indices([
        block_property.moisture_to_index(moisture),
      ])
      + 5118
    }
    Furnace(facing:, lit:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(lit),
      ])
      + 5126
    }
    OakSign(rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 5134
    }
    SpruceSign(rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 5166
    }
    BirchSign(rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 5198
    }
    AcaciaSign(rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 5230
    }
    CherrySign(rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 5262
    }
    JungleSign(rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 5294
    }
    DarkOakSign(rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 5326
    }
    PaleOakSign(rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 5358
    }
    MangroveSign(rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 5390
    }
    BambooSign(rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 5422
    }
    OakDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 5454
    }
    Ladder(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 5518
    }
    Rail(shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.rail_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 5526
    }
    CobblestoneStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 5546
    }
    OakWallSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 5626
    }
    SpruceWallSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 5634
    }
    BirchWallSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 5642
    }
    AcaciaWallSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 5650
    }
    CherryWallSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 5658
    }
    JungleWallSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 5666
    }
    DarkOakWallSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 5674
    }
    PaleOakWallSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 5682
    }
    MangroveWallSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 5690
    }
    BambooWallSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 5698
    }
    OakHangingSign(attached:, rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(attached),
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 5706
    }
    SpruceHangingSign(attached:, rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(attached),
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 5770
    }
    BirchHangingSign(attached:, rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(attached),
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 5834
    }
    AcaciaHangingSign(attached:, rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(attached),
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 5898
    }
    CherryHangingSign(attached:, rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(attached),
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 5962
    }
    JungleHangingSign(attached:, rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(attached),
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 6026
    }
    DarkOakHangingSign(attached:, rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(attached),
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 6090
    }
    PaleOakHangingSign(attached:, rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(attached),
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 6154
    }
    CrimsonHangingSign(attached:, rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(attached),
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 6218
    }
    WarpedHangingSign(attached:, rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(attached),
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 6282
    }
    MangroveHangingSign(attached:, rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(attached),
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 6346
    }
    BambooHangingSign(attached:, rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(attached),
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 6410
    }
    OakWallHangingSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 6474
    }
    SpruceWallHangingSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 6482
    }
    BirchWallHangingSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 6490
    }
    AcaciaWallHangingSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 6498
    }
    CherryWallHangingSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 6506
    }
    JungleWallHangingSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 6514
    }
    DarkOakWallHangingSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 6522
    }
    PaleOakWallHangingSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 6530
    }
    MangroveWallHangingSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 6538
    }
    CrimsonWallHangingSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 6546
    }
    WarpedWallHangingSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 6554
    }
    BambooWallHangingSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 6562
    }
    Lever(face:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 6570
    }
    StonePressurePlate(powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
      ])
      + 6594
    }
    IronDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 6596
    }
    OakPressurePlate(powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
      ])
      + 6660
    }
    SprucePressurePlate(powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
      ])
      + 6662
    }
    BirchPressurePlate(powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
      ])
      + 6664
    }
    JunglePressurePlate(powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
      ])
      + 6666
    }
    AcaciaPressurePlate(powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
      ])
      + 6668
    }
    CherryPressurePlate(powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
      ])
      + 6670
    }
    DarkOakPressurePlate(powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
      ])
      + 6672
    }
    PaleOakPressurePlate(powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
      ])
      + 6674
    }
    MangrovePressurePlate(powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
      ])
      + 6676
    }
    BambooPressurePlate(powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
      ])
      + 6678
    }
    RedstoneOre(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 6680
    }
    DeepslateRedstoneOre(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 6682
    }
    RedstoneTorch(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 6684
    }
    RedstoneWallTorch(facing:, lit:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(lit),
      ])
      + 6686
    }
    StoneButton(face:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 6694
    }
    Snow(layers:) -> {
      block_property.accumulate_based_indices([
        block_property.layers_to_index(layers),
      ])
      + 6718
    }
    Ice -> 6726
    SnowBlock -> 6727
    Cactus(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_15_to_index(age),
      ])
      + 6728
    }
    CactusFlower -> 6744
    Clay -> 6745
    SugarCane(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_15_to_index(age),
      ])
      + 6746
    }
    Jukebox(has_record:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(has_record),
      ])
      + 6762
    }
    OakFence(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 6764
    }
    Netherrack -> 6796
    SoulSand -> 6797
    SoulSoil -> 6798
    Basalt(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 6799
    }
    PolishedBasalt(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 6802
    }
    SoulTorch -> 6805
    SoulWallTorch(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 6806
    }
    CopperTorch -> 6810
    CopperWallTorch(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 6811
    }
    Glowstone -> 6815
    NetherPortal(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.horizontal_axis_to_index(axis),
      ])
      + 6816
    }
    CarvedPumpkin(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 6818
    }
    JackOLantern(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 6822
    }
    Cake(bites:) -> {
      block_property.accumulate_based_indices([
        block_property.bites_to_index(bites),
      ])
      + 6826
    }
    Repeater(delay:, facing:, locked:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.delay_to_index(delay),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(locked),
        block_property.bool_to_index(powered),
      ])
      + 6833
    }
    WhiteStainedGlass -> 6897
    OrangeStainedGlass -> 6898
    MagentaStainedGlass -> 6899
    LightBlueStainedGlass -> 6900
    YellowStainedGlass -> 6901
    LimeStainedGlass -> 6902
    PinkStainedGlass -> 6903
    GrayStainedGlass -> 6904
    LightGrayStainedGlass -> 6905
    CyanStainedGlass -> 6906
    PurpleStainedGlass -> 6907
    BlueStainedGlass -> 6908
    BrownStainedGlass -> 6909
    GreenStainedGlass -> 6910
    RedStainedGlass -> 6911
    BlackStainedGlass -> 6912
    OakTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 6913
    }
    SpruceTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 6977
    }
    BirchTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 7041
    }
    JungleTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 7105
    }
    AcaciaTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 7169
    }
    CherryTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 7233
    }
    DarkOakTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 7297
    }
    PaleOakTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 7361
    }
    MangroveTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 7425
    }
    BambooTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 7489
    }
    StoneBricks -> 7553
    MossyStoneBricks -> 7554
    CrackedStoneBricks -> 7555
    ChiseledStoneBricks -> 7556
    PackedMud -> 7557
    MudBricks -> 7558
    InfestedStone -> 7559
    InfestedCobblestone -> 7560
    InfestedStoneBricks -> 7561
    InfestedMossyStoneBricks -> 7562
    InfestedCrackedStoneBricks -> 7563
    InfestedChiseledStoneBricks -> 7564
    BrownMushroomBlock(down:, east:, north:, south:, up:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(down),
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(west),
      ])
      + 7565
    }
    RedMushroomBlock(down:, east:, north:, south:, up:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(down),
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(west),
      ])
      + 7629
    }
    MushroomStem(down:, east:, north:, south:, up:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(down),
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(west),
      ])
      + 7693
    }
    IronBars(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 7757
    }
    CopperBars(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 7789
    }
    ExposedCopperBars(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 7821
    }
    WeatheredCopperBars(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 7853
    }
    OxidizedCopperBars(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 7885
    }
    WaxedCopperBars(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 7917
    }
    WaxedExposedCopperBars(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 7949
    }
    WaxedWeatheredCopperBars(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 7981
    }
    WaxedOxidizedCopperBars(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 8013
    }
    IronChain(axis:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
        block_property.bool_to_index(waterlogged),
      ])
      + 8045
    }
    CopperChain(axis:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
        block_property.bool_to_index(waterlogged),
      ])
      + 8051
    }
    ExposedCopperChain(axis:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
        block_property.bool_to_index(waterlogged),
      ])
      + 8057
    }
    WeatheredCopperChain(axis:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
        block_property.bool_to_index(waterlogged),
      ])
      + 8063
    }
    OxidizedCopperChain(axis:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
        block_property.bool_to_index(waterlogged),
      ])
      + 8069
    }
    WaxedCopperChain(axis:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
        block_property.bool_to_index(waterlogged),
      ])
      + 8075
    }
    WaxedExposedCopperChain(axis:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
        block_property.bool_to_index(waterlogged),
      ])
      + 8081
    }
    WaxedWeatheredCopperChain(axis:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
        block_property.bool_to_index(waterlogged),
      ])
      + 8087
    }
    WaxedOxidizedCopperChain(axis:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
        block_property.bool_to_index(waterlogged),
      ])
      + 8093
    }
    GlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 8099
    }
    Pumpkin -> 8131
    Melon -> 8132
    AttachedPumpkinStem(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 8133
    }
    AttachedMelonStem(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 8137
    }
    PumpkinStem(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_7_to_index(age),
      ])
      + 8141
    }
    MelonStem(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_7_to_index(age),
      ])
      + 8149
    }
    Vine(east:, north:, south:, up:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(west),
      ])
      + 8157
    }
    GlowLichen(down:, east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(down),
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 8189
    }
    ResinClump(down:, east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(down),
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 8317
    }
    OakFenceGate(facing:, in_wall:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(in_wall),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 8445
    }
    BrickStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 8477
    }
    StoneBrickStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 8557
    }
    MudBrickStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 8637
    }
    Mycelium(snowy:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(snowy),
      ])
      + 8717
    }
    LilyPad -> 8719
    ResinBlock -> 8720
    ResinBricks -> 8721
    ResinBrickStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 8722
    }
    ResinBrickSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 8802
    }
    ResinBrickWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 8808
    }
    ChiseledResinBricks -> 9132
    NetherBricks -> 9133
    NetherBrickFence(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 9134
    }
    NetherBrickStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 9166
    }
    NetherWart(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_3_to_index(age),
      ])
      + 9246
    }
    EnchantingTable -> 9250
    BrewingStand(has_bottle_0:, has_bottle_1:, has_bottle_2:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(has_bottle_0),
        block_property.bool_to_index(has_bottle_1),
        block_property.bool_to_index(has_bottle_2),
      ])
      + 9251
    }
    Cauldron -> 9259
    WaterCauldron(level:) -> {
      block_property.accumulate_based_indices([
        block_property.cauldron_level_to_index(level),
      ])
      + 9260
    }
    LavaCauldron -> 9263
    PowderSnowCauldron(level:) -> {
      block_property.accumulate_based_indices([
        block_property.cauldron_level_to_index(level),
      ])
      + 9264
    }
    EndPortal -> 9267
    EndPortalFrame(eye:, facing:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(eye),
        block_property.facing_cardinal_to_index(facing),
      ])
      + 9268
    }
    EndStone -> 9276
    DragonEgg -> 9277
    RedstoneLamp(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 9278
    }
    Cocoa(age:, facing:) -> {
      block_property.accumulate_based_indices([
        block_property.age_2_to_index(age),
        block_property.facing_cardinal_to_index(facing),
      ])
      + 9280
    }
    SandstoneStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 9292
    }
    EmeraldOre -> 9372
    DeepslateEmeraldOre -> 9373
    EnderChest(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 9374
    }
    TripwireHook(attached:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(attached),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 9382
    }
    Tripwire(attached:, disarmed:, east:, north:, powered:, south:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(attached),
        block_property.bool_to_index(disarmed),
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(south),
        block_property.bool_to_index(west),
      ])
      + 9398
    }
    EmeraldBlock -> 9526
    SpruceStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 9527
    }
    BirchStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 9607
    }
    JungleStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 9687
    }
    CommandBlock(conditional:, facing:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(conditional),
        block_property.facing_to_index(facing),
      ])
      + 9767
    }
    Beacon -> 9779
    CobblestoneWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 9780
    }
    MossyCobblestoneWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 10_104
    }
    FlowerPot -> 10_428
    PottedTorchflower -> 10_429
    PottedOakSapling -> 10_430
    PottedSpruceSapling -> 10_431
    PottedBirchSapling -> 10_432
    PottedJungleSapling -> 10_433
    PottedAcaciaSapling -> 10_434
    PottedCherrySapling -> 10_435
    PottedDarkOakSapling -> 10_436
    PottedPaleOakSapling -> 10_437
    PottedMangrovePropagule -> 10_438
    PottedFern -> 10_439
    PottedDandelion -> 10_440
    PottedPoppy -> 10_441
    PottedBlueOrchid -> 10_442
    PottedAllium -> 10_443
    PottedAzureBluet -> 10_444
    PottedRedTulip -> 10_445
    PottedOrangeTulip -> 10_446
    PottedWhiteTulip -> 10_447
    PottedPinkTulip -> 10_448
    PottedOxeyeDaisy -> 10_449
    PottedCornflower -> 10_450
    PottedLilyOfTheValley -> 10_451
    PottedWitherRose -> 10_452
    PottedRedMushroom -> 10_453
    PottedBrownMushroom -> 10_454
    PottedDeadBush -> 10_455
    PottedCactus -> 10_456
    Carrots(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_7_to_index(age),
      ])
      + 10_457
    }
    Potatoes(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_7_to_index(age),
      ])
      + 10_465
    }
    OakButton(face:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_473
    }
    SpruceButton(face:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_497
    }
    BirchButton(face:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_521
    }
    JungleButton(face:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_545
    }
    AcaciaButton(face:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_569
    }
    CherryButton(face:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_593
    }
    DarkOakButton(face:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_617
    }
    PaleOakButton(face:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_641
    }
    MangroveButton(face:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_665
    }
    BambooButton(face:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_689
    }
    SkeletonSkull(powered:, rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
        block_property.rotation_to_index(rotation),
      ])
      + 10_713
    }
    SkeletonWallSkull(facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_745
    }
    WitherSkeletonSkull(powered:, rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
        block_property.rotation_to_index(rotation),
      ])
      + 10_753
    }
    WitherSkeletonWallSkull(facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_785
    }
    ZombieHead(powered:, rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
        block_property.rotation_to_index(rotation),
      ])
      + 10_793
    }
    ZombieWallHead(facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_825
    }
    PlayerHead(powered:, rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
        block_property.rotation_to_index(rotation),
      ])
      + 10_833
    }
    PlayerWallHead(facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_865
    }
    CreeperHead(powered:, rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
        block_property.rotation_to_index(rotation),
      ])
      + 10_873
    }
    CreeperWallHead(facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_905
    }
    DragonHead(powered:, rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
        block_property.rotation_to_index(rotation),
      ])
      + 10_913
    }
    DragonWallHead(facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_945
    }
    PiglinHead(powered:, rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
        block_property.rotation_to_index(rotation),
      ])
      + 10_953
    }
    PiglinWallHead(facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 10_985
    }
    Anvil(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 10_993
    }
    ChippedAnvil(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 10_997
    }
    DamagedAnvil(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 11_001
    }
    TrappedChest(facing:, chest_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.chest_type_to_index(chest_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 11_005
    }
    LightWeightedPressurePlate(power:) -> {
      block_property.accumulate_based_indices([
        block_property.power_to_index(power),
      ])
      + 11_029
    }
    HeavyWeightedPressurePlate(power:) -> {
      block_property.accumulate_based_indices([
        block_property.power_to_index(power),
      ])
      + 11_045
    }
    Comparator(facing:, mode:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.comparator_mode_to_index(mode),
        block_property.bool_to_index(powered),
      ])
      + 11_061
    }
    DaylightDetector(inverted:, power:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(inverted),
        block_property.power_to_index(power),
      ])
      + 11_077
    }
    RedstoneBlock -> 11_109
    NetherQuartzOre -> 11_110
    Hopper(enabled:, facing:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(enabled),
        block_property.facing_hopper_to_index(facing),
      ])
      + 11_111
    }
    QuartzBlock -> 11_121
    ChiseledQuartzBlock -> 11_122
    QuartzPillar(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 11_123
    }
    QuartzStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 11_126
    }
    ActivatorRail(powered:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
        block_property.rail_shape_straight_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 11_206
    }
    Dropper(facing:, triggered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(triggered),
      ])
      + 11_230
    }
    WhiteTerracotta -> 11_242
    OrangeTerracotta -> 11_243
    MagentaTerracotta -> 11_244
    LightBlueTerracotta -> 11_245
    YellowTerracotta -> 11_246
    LimeTerracotta -> 11_247
    PinkTerracotta -> 11_248
    GrayTerracotta -> 11_249
    LightGrayTerracotta -> 11_250
    CyanTerracotta -> 11_251
    PurpleTerracotta -> 11_252
    BlueTerracotta -> 11_253
    BrownTerracotta -> 11_254
    GreenTerracotta -> 11_255
    RedTerracotta -> 11_256
    BlackTerracotta -> 11_257
    WhiteStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_258
    }
    OrangeStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_290
    }
    MagentaStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_322
    }
    LightBlueStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_354
    }
    YellowStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_386
    }
    LimeStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_418
    }
    PinkStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_450
    }
    GrayStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_482
    }
    LightGrayStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_514
    }
    CyanStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_546
    }
    PurpleStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_578
    }
    BlueStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_610
    }
    BrownStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_642
    }
    GreenStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_674
    }
    RedStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_706
    }
    BlackStainedGlassPane(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 11_738
    }
    AcaciaStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 11_770
    }
    CherryStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 11_850
    }
    DarkOakStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 11_930
    }
    PaleOakStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 12_010
    }
    MangroveStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 12_090
    }
    BambooStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 12_170
    }
    BambooMosaicStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 12_250
    }
    SlimeBlock -> 12_330
    Barrier(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 12_331
    }
    Light(level:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.light_level_to_index(level),
        block_property.bool_to_index(waterlogged),
      ])
      + 12_333
    }
    IronTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 12_365
    }
    Prismarine -> 12_429
    PrismarineBricks -> 12_430
    DarkPrismarine -> 12_431
    PrismarineStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 12_432
    }
    PrismarineBrickStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 12_512
    }
    DarkPrismarineStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 12_592
    }
    PrismarineSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 12_672
    }
    PrismarineBrickSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 12_678
    }
    DarkPrismarineSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 12_684
    }
    SeaLantern -> 12_690
    HayBlock(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 12_691
    }
    WhiteCarpet -> 12_694
    OrangeCarpet -> 12_695
    MagentaCarpet -> 12_696
    LightBlueCarpet -> 12_697
    YellowCarpet -> 12_698
    LimeCarpet -> 12_699
    PinkCarpet -> 12_700
    GrayCarpet -> 12_701
    LightGrayCarpet -> 12_702
    CyanCarpet -> 12_703
    PurpleCarpet -> 12_704
    BlueCarpet -> 12_705
    BrownCarpet -> 12_706
    GreenCarpet -> 12_707
    RedCarpet -> 12_708
    BlackCarpet -> 12_709
    Terracotta -> 12_710
    CoalBlock -> 12_711
    PackedIce -> 12_712
    Sunflower(half:) -> {
      block_property.accumulate_based_indices([
        block_property.double_block_half_to_index(half),
      ])
      + 12_713
    }
    Lilac(half:) -> {
      block_property.accumulate_based_indices([
        block_property.double_block_half_to_index(half),
      ])
      + 12_715
    }
    RoseBush(half:) -> {
      block_property.accumulate_based_indices([
        block_property.double_block_half_to_index(half),
      ])
      + 12_717
    }
    Peony(half:) -> {
      block_property.accumulate_based_indices([
        block_property.double_block_half_to_index(half),
      ])
      + 12_719
    }
    TallGrass(half:) -> {
      block_property.accumulate_based_indices([
        block_property.double_block_half_to_index(half),
      ])
      + 12_721
    }
    LargeFern(half:) -> {
      block_property.accumulate_based_indices([
        block_property.double_block_half_to_index(half),
      ])
      + 12_723
    }
    WhiteBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_725
    }
    OrangeBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_741
    }
    MagentaBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_757
    }
    LightBlueBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_773
    }
    YellowBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_789
    }
    LimeBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_805
    }
    PinkBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_821
    }
    GrayBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_837
    }
    LightGrayBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_853
    }
    CyanBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_869
    }
    PurpleBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_885
    }
    BlueBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_901
    }
    BrownBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_917
    }
    GreenBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_933
    }
    RedBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_949
    }
    BlackBanner(rotation:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
      ])
      + 12_965
    }
    WhiteWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 12_981
    }
    OrangeWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 12_985
    }
    MagentaWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 12_989
    }
    LightBlueWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 12_993
    }
    YellowWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 12_997
    }
    LimeWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 13_001
    }
    PinkWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 13_005
    }
    GrayWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 13_009
    }
    LightGrayWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 13_013
    }
    CyanWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 13_017
    }
    PurpleWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 13_021
    }
    BlueWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 13_025
    }
    BrownWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 13_029
    }
    GreenWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 13_033
    }
    RedWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 13_037
    }
    BlackWallBanner(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 13_041
    }
    RedSandstone -> 13_045
    ChiseledRedSandstone -> 13_046
    CutRedSandstone -> 13_047
    RedSandstoneStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_048
    }
    OakSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_128
    }
    SpruceSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_134
    }
    BirchSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_140
    }
    JungleSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_146
    }
    AcaciaSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_152
    }
    CherrySlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_158
    }
    DarkOakSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_164
    }
    PaleOakSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_170
    }
    MangroveSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_176
    }
    BambooSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_182
    }
    BambooMosaicSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_188
    }
    StoneSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_194
    }
    SmoothStoneSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_200
    }
    SandstoneSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_206
    }
    CutSandstoneSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_212
    }
    PetrifiedOakSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_218
    }
    CobblestoneSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_224
    }
    BrickSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_230
    }
    StoneBrickSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_236
    }
    MudBrickSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_242
    }
    NetherBrickSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_248
    }
    QuartzSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_254
    }
    RedSandstoneSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_260
    }
    CutRedSandstoneSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_266
    }
    PurpurSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 13_272
    }
    SmoothStone -> 13_278
    SmoothSandstone -> 13_279
    SmoothQuartz -> 13_280
    SmoothRedSandstone -> 13_281
    SpruceFenceGate(facing:, in_wall:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(in_wall),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 13_282
    }
    BirchFenceGate(facing:, in_wall:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(in_wall),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 13_314
    }
    JungleFenceGate(facing:, in_wall:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(in_wall),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 13_346
    }
    AcaciaFenceGate(facing:, in_wall:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(in_wall),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 13_378
    }
    CherryFenceGate(facing:, in_wall:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(in_wall),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 13_410
    }
    DarkOakFenceGate(facing:, in_wall:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(in_wall),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 13_442
    }
    PaleOakFenceGate(facing:, in_wall:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(in_wall),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 13_474
    }
    MangroveFenceGate(facing:, in_wall:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(in_wall),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 13_506
    }
    BambooFenceGate(facing:, in_wall:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(in_wall),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 13_538
    }
    SpruceFence(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 13_570
    }
    BirchFence(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 13_602
    }
    JungleFence(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 13_634
    }
    AcaciaFence(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 13_666
    }
    CherryFence(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 13_698
    }
    DarkOakFence(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 13_730
    }
    PaleOakFence(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 13_762
    }
    MangroveFence(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 13_794
    }
    BambooFence(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 13_826
    }
    SpruceDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 13_858
    }
    BirchDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 13_922
    }
    JungleDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 13_986
    }
    AcaciaDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 14_050
    }
    CherryDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 14_114
    }
    DarkOakDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 14_178
    }
    PaleOakDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 14_242
    }
    MangroveDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 14_306
    }
    BambooDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 14_370
    }
    EndRod(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_434
    }
    ChorusPlant(down:, east:, north:, south:, up:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(down),
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(west),
      ])
      + 14_440
    }
    ChorusFlower(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_5_to_index(age),
      ])
      + 14_504
    }
    PurpurBlock -> 14_510
    PurpurPillar(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 14_511
    }
    PurpurStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 14_514
    }
    EndStoneBricks -> 14_594
    TorchflowerCrop(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_1_to_index(age),
      ])
      + 14_595
    }
    PitcherCrop(age:, half:) -> {
      block_property.accumulate_based_indices([
        block_property.age_4_to_index(age),
        block_property.double_block_half_to_index(half),
      ])
      + 14_597
    }
    PitcherPlant(half:) -> {
      block_property.accumulate_based_indices([
        block_property.double_block_half_to_index(half),
      ])
      + 14_607
    }
    Beetroots(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_3_to_index(age),
      ])
      + 14_609
    }
    DirtPath -> 14_613
    EndGateway -> 14_614
    RepeatingCommandBlock(conditional:, facing:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(conditional),
        block_property.facing_to_index(facing),
      ])
      + 14_615
    }
    ChainCommandBlock(conditional:, facing:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(conditional),
        block_property.facing_to_index(facing),
      ])
      + 14_627
    }
    FrostedIce(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_3_to_index(age),
      ])
      + 14_639
    }
    MagmaBlock -> 14_643
    NetherWartBlock -> 14_644
    RedNetherBricks -> 14_645
    BoneBlock(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 14_646
    }
    StructureVoid -> 14_649
    Observer(facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 14_650
    }
    ShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_662
    }
    WhiteShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_668
    }
    OrangeShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_674
    }
    MagentaShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_680
    }
    LightBlueShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_686
    }
    YellowShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_692
    }
    LimeShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_698
    }
    PinkShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_704
    }
    GrayShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_710
    }
    LightGrayShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_716
    }
    CyanShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_722
    }
    PurpleShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_728
    }
    BlueShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_734
    }
    BrownShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_740
    }
    GreenShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_746
    }
    RedShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_752
    }
    BlackShulkerBox(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
      ])
      + 14_758
    }
    WhiteGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_764
    }
    OrangeGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_768
    }
    MagentaGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_772
    }
    LightBlueGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_776
    }
    YellowGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_780
    }
    LimeGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_784
    }
    PinkGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_788
    }
    GrayGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_792
    }
    LightGrayGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_796
    }
    CyanGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_800
    }
    PurpleGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_804
    }
    BlueGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_808
    }
    BrownGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_812
    }
    GreenGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_816
    }
    RedGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_820
    }
    BlackGlazedTerracotta(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 14_824
    }
    WhiteConcrete -> 14_828
    OrangeConcrete -> 14_829
    MagentaConcrete -> 14_830
    LightBlueConcrete -> 14_831
    YellowConcrete -> 14_832
    LimeConcrete -> 14_833
    PinkConcrete -> 14_834
    GrayConcrete -> 14_835
    LightGrayConcrete -> 14_836
    CyanConcrete -> 14_837
    PurpleConcrete -> 14_838
    BlueConcrete -> 14_839
    BrownConcrete -> 14_840
    GreenConcrete -> 14_841
    RedConcrete -> 14_842
    BlackConcrete -> 14_843
    WhiteConcretePowder -> 14_844
    OrangeConcretePowder -> 14_845
    MagentaConcretePowder -> 14_846
    LightBlueConcretePowder -> 14_847
    YellowConcretePowder -> 14_848
    LimeConcretePowder -> 14_849
    PinkConcretePowder -> 14_850
    GrayConcretePowder -> 14_851
    LightGrayConcretePowder -> 14_852
    CyanConcretePowder -> 14_853
    PurpleConcretePowder -> 14_854
    BlueConcretePowder -> 14_855
    BrownConcretePowder -> 14_856
    GreenConcretePowder -> 14_857
    RedConcretePowder -> 14_858
    BlackConcretePowder -> 14_859
    Kelp(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_25_to_index(age),
      ])
      + 14_860
    }
    KelpPlant -> 14_886
    DriedKelpBlock -> 14_887
    TurtleEgg(eggs:, hatch:) -> {
      block_property.accumulate_based_indices([
        block_property.eggs_to_index(eggs),
        block_property.hatch_to_index(hatch),
      ])
      + 14_888
    }
    SnifferEgg(hatch:) -> {
      block_property.accumulate_based_indices([
        block_property.hatch_to_index(hatch),
      ])
      + 14_900
    }
    DriedGhast(facing:, hydration:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.hydration_to_index(hydration),
        block_property.bool_to_index(waterlogged),
      ])
      + 14_903
    }
    DeadTubeCoralBlock -> 14_935
    DeadBrainCoralBlock -> 14_936
    DeadBubbleCoralBlock -> 14_937
    DeadFireCoralBlock -> 14_938
    DeadHornCoralBlock -> 14_939
    TubeCoralBlock -> 14_940
    BrainCoralBlock -> 14_941
    BubbleCoralBlock -> 14_942
    FireCoralBlock -> 14_943
    HornCoralBlock -> 14_944
    DeadTubeCoral(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_945
    }
    DeadBrainCoral(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_947
    }
    DeadBubbleCoral(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_949
    }
    DeadFireCoral(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_951
    }
    DeadHornCoral(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_953
    }
    TubeCoral(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_955
    }
    BrainCoral(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_957
    }
    BubbleCoral(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_959
    }
    FireCoral(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_961
    }
    HornCoral(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_963
    }
    DeadTubeCoralFan(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_965
    }
    DeadBrainCoralFan(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_967
    }
    DeadBubbleCoralFan(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_969
    }
    DeadFireCoralFan(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_971
    }
    DeadHornCoralFan(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_973
    }
    TubeCoralFan(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_975
    }
    BrainCoralFan(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_977
    }
    BubbleCoralFan(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_979
    }
    FireCoralFan(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_981
    }
    HornCoralFan(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 14_983
    }
    DeadTubeCoralWallFan(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 14_985
    }
    DeadBrainCoralWallFan(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 14_993
    }
    DeadBubbleCoralWallFan(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_001
    }
    DeadFireCoralWallFan(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_009
    }
    DeadHornCoralWallFan(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_017
    }
    TubeCoralWallFan(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_025
    }
    BrainCoralWallFan(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_033
    }
    BubbleCoralWallFan(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_041
    }
    FireCoralWallFan(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_049
    }
    HornCoralWallFan(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_057
    }
    SeaPickle(pickles:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.pickles_to_index(pickles),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_065
    }
    BlueIce -> 15_073
    Conduit(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 15_074
    }
    BambooSapling -> 15_076
    Bamboo(age:, leaves:, stage:) -> {
      block_property.accumulate_based_indices([
        block_property.age_1_to_index(age),
        block_property.leaves_to_index(leaves),
        block_property.stage_to_index(stage),
      ])
      + 15_077
    }
    PottedBamboo -> 15_089
    VoidAir -> 15_090
    CaveAir -> 15_091
    BubbleColumn(drag:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(drag),
      ])
      + 15_092
    }
    PolishedGraniteStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_094
    }
    SmoothRedSandstoneStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_174
    }
    MossyStoneBrickStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_254
    }
    PolishedDioriteStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_334
    }
    MossyCobblestoneStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_414
    }
    EndStoneBrickStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_494
    }
    StoneStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_574
    }
    SmoothSandstoneStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_654
    }
    SmoothQuartzStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_734
    }
    GraniteStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_814
    }
    AndesiteStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_894
    }
    RedNetherBrickStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 15_974
    }
    PolishedAndesiteStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 16_054
    }
    DioriteStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 16_134
    }
    PolishedGraniteSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 16_214
    }
    SmoothRedSandstoneSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 16_220
    }
    MossyStoneBrickSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 16_226
    }
    PolishedDioriteSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 16_232
    }
    MossyCobblestoneSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 16_238
    }
    EndStoneBrickSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 16_244
    }
    SmoothSandstoneSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 16_250
    }
    SmoothQuartzSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 16_256
    }
    GraniteSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 16_262
    }
    AndesiteSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 16_268
    }
    RedNetherBrickSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 16_274
    }
    PolishedAndesiteSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 16_280
    }
    DioriteSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 16_286
    }
    BrickWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 16_292
    }
    PrismarineWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 16_616
    }
    RedSandstoneWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 16_940
    }
    MossyStoneBrickWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 17_264
    }
    GraniteWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 17_588
    }
    StoneBrickWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 17_912
    }
    MudBrickWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 18_236
    }
    NetherBrickWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 18_560
    }
    AndesiteWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 18_884
    }
    RedNetherBrickWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 19_208
    }
    SandstoneWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 19_532
    }
    EndStoneBrickWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 19_856
    }
    DioriteWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 20_180
    }
    Scaffolding(bottom:, distance:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(bottom),
        block_property.scaffolding_distance_to_index(distance),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_504
    }
    Loom(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 20_536
    }
    Barrel(facing:, open:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(open),
      ])
      + 20_540
    }
    Smoker(facing:, lit:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(lit),
      ])
      + 20_552
    }
    BlastFurnace(facing:, lit:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(lit),
      ])
      + 20_560
    }
    CartographyTable -> 20_568
    FletchingTable -> 20_569
    Grindstone(face:, facing:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
      ])
      + 20_570
    }
    Lectern(facing:, has_book:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(has_book),
        block_property.bool_to_index(powered),
      ])
      + 20_582
    }
    SmithingTable -> 20_598
    Stonecutter(facing:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
      ])
      + 20_599
    }
    Bell(attachment:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.attachment_to_index(attachment),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 20_603
    }
    Lantern(hanging:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(hanging),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_635
    }
    SoulLantern(hanging:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(hanging),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_639
    }
    CopperLantern(hanging:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(hanging),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_643
    }
    ExposedCopperLantern(hanging:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(hanging),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_647
    }
    WeatheredCopperLantern(hanging:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(hanging),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_651
    }
    OxidizedCopperLantern(hanging:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(hanging),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_655
    }
    WaxedCopperLantern(hanging:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(hanging),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_659
    }
    WaxedExposedCopperLantern(hanging:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(hanging),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_663
    }
    WaxedWeatheredCopperLantern(hanging:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(hanging),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_667
    }
    WaxedOxidizedCopperLantern(hanging:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(hanging),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_671
    }
    Campfire(facing:, lit:, signal_fire:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(signal_fire),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_675
    }
    SoulCampfire(facing:, lit:, signal_fire:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(signal_fire),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_707
    }
    SweetBerryBush(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_3_to_index(age),
      ])
      + 20_739
    }
    WarpedStem(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 20_743
    }
    StrippedWarpedStem(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 20_746
    }
    WarpedHyphae(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 20_749
    }
    StrippedWarpedHyphae(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 20_752
    }
    WarpedNylium -> 20_755
    WarpedFungus -> 20_756
    WarpedWartBlock -> 20_757
    WarpedRoots -> 20_758
    NetherSprouts -> 20_759
    CrimsonStem(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 20_760
    }
    StrippedCrimsonStem(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 20_763
    }
    CrimsonHyphae(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 20_766
    }
    StrippedCrimsonHyphae(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 20_769
    }
    CrimsonNylium -> 20_772
    CrimsonFungus -> 20_773
    Shroomlight -> 20_774
    WeepingVines(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_25_to_index(age),
      ])
      + 20_775
    }
    WeepingVinesPlant -> 20_801
    TwistingVines(age:) -> {
      block_property.accumulate_based_indices([
        block_property.age_25_to_index(age),
      ])
      + 20_802
    }
    TwistingVinesPlant -> 20_828
    CrimsonRoots -> 20_829
    CrimsonPlanks -> 20_830
    WarpedPlanks -> 20_831
    CrimsonSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_832
    }
    WarpedSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_838
    }
    CrimsonPressurePlate(powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
      ])
      + 20_844
    }
    WarpedPressurePlate(powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
      ])
      + 20_846
    }
    CrimsonFence(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 20_848
    }
    WarpedFence(east:, north:, south:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 20_880
    }
    CrimsonTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_912
    }
    WarpedTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 20_976
    }
    CrimsonFenceGate(facing:, in_wall:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(in_wall),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 21_040
    }
    WarpedFenceGate(facing:, in_wall:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(in_wall),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 21_072
    }
    CrimsonStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 21_104
    }
    WarpedStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 21_184
    }
    CrimsonButton(face:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 21_264
    }
    WarpedButton(face:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 21_288
    }
    CrimsonDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 21_312
    }
    WarpedDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 21_376
    }
    CrimsonSign(rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 21_440
    }
    WarpedSign(rotation:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.rotation_to_index(rotation),
        block_property.bool_to_index(waterlogged),
      ])
      + 21_472
    }
    CrimsonWallSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 21_504
    }
    WarpedWallSign(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 21_512
    }
    StructureBlock(mode:) -> {
      block_property.accumulate_based_indices([
        block_property.structure_mode_to_index(mode),
      ])
      + 21_520
    }
    Jigsaw(orientation:) -> {
      block_property.accumulate_based_indices([
        block_property.orientation_to_index(orientation),
      ])
      + 21_524
    }
    TestBlock(mode:) -> {
      block_property.accumulate_based_indices([
        block_property.test_mode_to_index(mode),
      ])
      + 21_536
    }
    TestInstanceBlock -> 21_540
    Composter(level:) -> {
      block_property.accumulate_based_indices([
        block_property.composter_level_to_index(level),
      ])
      + 21_541
    }
    Target(power:) -> {
      block_property.accumulate_based_indices([
        block_property.power_to_index(power),
      ])
      + 21_550
    }
    BeeNest(facing:, honey_level:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.honey_level_to_index(honey_level),
      ])
      + 21_566
    }
    Beehive(facing:, honey_level:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.honey_level_to_index(honey_level),
      ])
      + 21_590
    }
    HoneyBlock -> 21_614
    HoneycombBlock -> 21_615
    NetheriteBlock -> 21_616
    AncientDebris -> 21_617
    CryingObsidian -> 21_618
    RespawnAnchor(charges:) -> {
      block_property.accumulate_based_indices([
        block_property.charges_to_index(charges),
      ])
      + 21_619
    }
    PottedCrimsonFungus -> 21_624
    PottedWarpedFungus -> 21_625
    PottedCrimsonRoots -> 21_626
    PottedWarpedRoots -> 21_627
    Lodestone -> 21_628
    Blackstone -> 21_629
    BlackstoneStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 21_630
    }
    BlackstoneWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 21_710
    }
    BlackstoneSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 22_034
    }
    PolishedBlackstone -> 22_040
    PolishedBlackstoneBricks -> 22_041
    CrackedPolishedBlackstoneBricks -> 22_042
    ChiseledPolishedBlackstone -> 22_043
    PolishedBlackstoneBrickSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 22_044
    }
    PolishedBlackstoneBrickStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 22_050
    }
    PolishedBlackstoneBrickWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 22_130
    }
    GildedBlackstone -> 22_454
    PolishedBlackstoneStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 22_455
    }
    PolishedBlackstoneSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 22_535
    }
    PolishedBlackstonePressurePlate(powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(powered),
      ])
      + 22_541
    }
    PolishedBlackstoneButton(face:, facing:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_face_to_index(face),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(powered),
      ])
      + 22_543
    }
    PolishedBlackstoneWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 22_567
    }
    ChiseledNetherBricks -> 22_891
    CrackedNetherBricks -> 22_892
    QuartzBricks -> 22_893
    Candle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 22_894
    }
    WhiteCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 22_910
    }
    OrangeCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 22_926
    }
    MagentaCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 22_942
    }
    LightBlueCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 22_958
    }
    YellowCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 22_974
    }
    LimeCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 22_990
    }
    PinkCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_006
    }
    GrayCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_022
    }
    LightGrayCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_038
    }
    CyanCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_054
    }
    PurpleCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_070
    }
    BlueCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_086
    }
    BrownCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_102
    }
    GreenCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_118
    }
    RedCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_134
    }
    BlackCandle(candles:, lit:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.candles_to_index(candles),
        block_property.bool_to_index(lit),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_150
    }
    CandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_166
    }
    WhiteCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_168
    }
    OrangeCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_170
    }
    MagentaCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_172
    }
    LightBlueCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_174
    }
    YellowCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_176
    }
    LimeCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_178
    }
    PinkCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_180
    }
    GrayCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_182
    }
    LightGrayCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_184
    }
    CyanCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_186
    }
    PurpleCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_188
    }
    BlueCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_190
    }
    BrownCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_192
    }
    GreenCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_194
    }
    RedCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_196
    }
    BlackCandleCake(lit:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
      ])
      + 23_198
    }
    AmethystBlock -> 23_200
    BuddingAmethyst -> 23_201
    AmethystCluster(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_202
    }
    LargeAmethystBud(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_214
    }
    MediumAmethystBud(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_226
    }
    SmallAmethystBud(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_238
    }
    Tuff -> 23_250
    TuffSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_251
    }
    TuffStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_257
    }
    TuffWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 23_337
    }
    PolishedTuff -> 23_661
    PolishedTuffSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_662
    }
    PolishedTuffStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 23_668
    }
    PolishedTuffWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 23_748
    }
    ChiseledTuff -> 24_072
    TuffBricks -> 24_073
    TuffBrickSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 24_074
    }
    TuffBrickStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 24_080
    }
    TuffBrickWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 24_160
    }
    ChiseledTuffBricks -> 24_484
    Calcite -> 24_485
    TintedGlass -> 24_486
    PowderSnow -> 24_487
    SculkSensor(power:, sculk_sensor_phase:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.power_to_index(power),
        block_property.sculk_sensor_phase_to_index(sculk_sensor_phase),
        block_property.bool_to_index(waterlogged),
      ])
      + 24_488
    }
    CalibratedSculkSensor(facing:, power:, sculk_sensor_phase:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.power_to_index(power),
        block_property.sculk_sensor_phase_to_index(sculk_sensor_phase),
        block_property.bool_to_index(waterlogged),
      ])
      + 24_584
    }
    Sculk -> 24_968
    SculkVein(down:, east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(down),
        block_property.bool_to_index(east),
        block_property.bool_to_index(north),
        block_property.bool_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.bool_to_index(west),
      ])
      + 24_969
    }
    SculkCatalyst(bloom:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(bloom),
      ])
      + 25_097
    }
    SculkShrieker(can_summon:, shrieking:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(can_summon),
        block_property.bool_to_index(shrieking),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_099
    }
    CopperBlock -> 25_107
    ExposedCopper -> 25_108
    WeatheredCopper -> 25_109
    OxidizedCopper -> 25_110
    CopperOre -> 25_111
    DeepslateCopperOre -> 25_112
    OxidizedCutCopper -> 25_113
    WeatheredCutCopper -> 25_114
    ExposedCutCopper -> 25_115
    CutCopper -> 25_116
    OxidizedChiseledCopper -> 25_117
    WeatheredChiseledCopper -> 25_118
    ExposedChiseledCopper -> 25_119
    ChiseledCopper -> 25_120
    WaxedOxidizedChiseledCopper -> 25_121
    WaxedWeatheredChiseledCopper -> 25_122
    WaxedExposedChiseledCopper -> 25_123
    WaxedChiseledCopper -> 25_124
    OxidizedCutCopperStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_125
    }
    WeatheredCutCopperStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_205
    }
    ExposedCutCopperStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_285
    }
    CutCopperStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_365
    }
    OxidizedCutCopperSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_445
    }
    WeatheredCutCopperSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_451
    }
    ExposedCutCopperSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_457
    }
    CutCopperSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_463
    }
    WaxedCopperBlock -> 25_469
    WaxedWeatheredCopper -> 25_470
    WaxedExposedCopper -> 25_471
    WaxedOxidizedCopper -> 25_472
    WaxedOxidizedCutCopper -> 25_473
    WaxedWeatheredCutCopper -> 25_474
    WaxedExposedCutCopper -> 25_475
    WaxedCutCopper -> 25_476
    WaxedOxidizedCutCopperStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_477
    }
    WaxedWeatheredCutCopperStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_557
    }
    WaxedExposedCutCopperStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_637
    }
    WaxedCutCopperStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_717
    }
    WaxedOxidizedCutCopperSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_797
    }
    WaxedWeatheredCutCopperSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_803
    }
    WaxedExposedCutCopperSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_809
    }
    WaxedCutCopperSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 25_815
    }
    CopperDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 25_821
    }
    ExposedCopperDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 25_885
    }
    OxidizedCopperDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 25_949
    }
    WeatheredCopperDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 26_013
    }
    WaxedCopperDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 26_077
    }
    WaxedExposedCopperDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 26_141
    }
    WaxedOxidizedCopperDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 26_205
    }
    WaxedWeatheredCopperDoor(facing:, half:, hinge:, open:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.door_hinge_to_index(hinge),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
      ])
      + 26_269
    }
    CopperTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 26_333
    }
    ExposedCopperTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 26_397
    }
    OxidizedCopperTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 26_461
    }
    WeatheredCopperTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 26_525
    }
    WaxedCopperTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 26_589
    }
    WaxedExposedCopperTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 26_653
    }
    WaxedOxidizedCopperTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 26_717
    }
    WaxedWeatheredCopperTrapdoor(facing:, half:, open:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.bool_to_index(open),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 26_781
    }
    CopperGrate(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 26_845
    }
    ExposedCopperGrate(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 26_847
    }
    WeatheredCopperGrate(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 26_849
    }
    OxidizedCopperGrate(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 26_851
    }
    WaxedCopperGrate(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 26_853
    }
    WaxedExposedCopperGrate(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 26_855
    }
    WaxedWeatheredCopperGrate(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 26_857
    }
    WaxedOxidizedCopperGrate(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 26_859
    }
    CopperBulb(lit:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
        block_property.bool_to_index(powered),
      ])
      + 26_861
    }
    ExposedCopperBulb(lit:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
        block_property.bool_to_index(powered),
      ])
      + 26_865
    }
    WeatheredCopperBulb(lit:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
        block_property.bool_to_index(powered),
      ])
      + 26_869
    }
    OxidizedCopperBulb(lit:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
        block_property.bool_to_index(powered),
      ])
      + 26_873
    }
    WaxedCopperBulb(lit:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
        block_property.bool_to_index(powered),
      ])
      + 26_877
    }
    WaxedExposedCopperBulb(lit:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
        block_property.bool_to_index(powered),
      ])
      + 26_881
    }
    WaxedWeatheredCopperBulb(lit:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
        block_property.bool_to_index(powered),
      ])
      + 26_885
    }
    WaxedOxidizedCopperBulb(lit:, powered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(lit),
        block_property.bool_to_index(powered),
      ])
      + 26_889
    }
    CopperChest(facing:, chest_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.chest_type_to_index(chest_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 26_893
    }
    ExposedCopperChest(facing:, chest_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.chest_type_to_index(chest_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 26_917
    }
    WeatheredCopperChest(facing:, chest_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.chest_type_to_index(chest_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 26_941
    }
    OxidizedCopperChest(facing:, chest_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.chest_type_to_index(chest_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 26_965
    }
    WaxedCopperChest(facing:, chest_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.chest_type_to_index(chest_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 26_989
    }
    WaxedExposedCopperChest(facing:, chest_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.chest_type_to_index(chest_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_013
    }
    WaxedWeatheredCopperChest(facing:, chest_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.chest_type_to_index(chest_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_037
    }
    WaxedOxidizedCopperChest(facing:, chest_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.chest_type_to_index(chest_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_061
    }
    CopperGolemStatue(copper_golem_pose:, facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.copper_golem_pose_to_index(copper_golem_pose),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_085
    }
    ExposedCopperGolemStatue(copper_golem_pose:, facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.copper_golem_pose_to_index(copper_golem_pose),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_117
    }
    WeatheredCopperGolemStatue(copper_golem_pose:, facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.copper_golem_pose_to_index(copper_golem_pose),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_149
    }
    OxidizedCopperGolemStatue(copper_golem_pose:, facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.copper_golem_pose_to_index(copper_golem_pose),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_181
    }
    WaxedCopperGolemStatue(copper_golem_pose:, facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.copper_golem_pose_to_index(copper_golem_pose),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_213
    }
    WaxedExposedCopperGolemStatue(copper_golem_pose:, facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.copper_golem_pose_to_index(copper_golem_pose),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_245
    }
    WaxedWeatheredCopperGolemStatue(copper_golem_pose:, facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.copper_golem_pose_to_index(copper_golem_pose),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_277
    }
    WaxedOxidizedCopperGolemStatue(copper_golem_pose:, facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.copper_golem_pose_to_index(copper_golem_pose),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_309
    }
    LightningRod(facing:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_341
    }
    ExposedLightningRod(facing:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_365
    }
    WeatheredLightningRod(facing:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_389
    }
    OxidizedLightningRod(facing:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_413
    }
    WaxedLightningRod(facing:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_437
    }
    WaxedExposedLightningRod(facing:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_461
    }
    WaxedWeatheredLightningRod(facing:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_485
    }
    WaxedOxidizedLightningRod(facing:, powered:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_to_index(facing),
        block_property.bool_to_index(powered),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_509
    }
    PointedDripstone(thickness:, vertical_direction:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.thickness_to_index(thickness),
        block_property.vertical_direction_to_index(vertical_direction),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_533
    }
    DripstoneBlock -> 27_553
    CaveVines(age:, berries:) -> {
      block_property.accumulate_based_indices([
        block_property.age_25_to_index(age),
        block_property.bool_to_index(berries),
      ])
      + 27_554
    }
    CaveVinesPlant(berries:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(berries),
      ])
      + 27_606
    }
    SporeBlossom -> 27_608
    Azalea -> 27_609
    FloweringAzalea -> 27_610
    MossCarpet -> 27_611
    PinkPetals(facing:, flower_amount:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.flower_amount_to_index(flower_amount),
      ])
      + 27_612
    }
    Wildflowers(facing:, flower_amount:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.flower_amount_to_index(flower_amount),
      ])
      + 27_628
    }
    LeafLitter(facing:, segment_amount:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.segment_amount_to_index(segment_amount),
      ])
      + 27_644
    }
    MossBlock -> 27_660
    BigDripleaf(facing:, tilt:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.tilt_to_index(tilt),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_661
    }
    BigDripleafStem(facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_693
    }
    SmallDripleaf(facing:, half:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.double_block_half_to_index(half),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_701
    }
    HangingRoots(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 27_717
    }
    RootedDirt -> 27_719
    Mud -> 27_720
    Deepslate(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 27_721
    }
    CobbledDeepslate -> 27_724
    CobbledDeepslateStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_725
    }
    CobbledDeepslateSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 27_805
    }
    CobbledDeepslateWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 27_811
    }
    PolishedDeepslate -> 28_135
    PolishedDeepslateStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 28_136
    }
    PolishedDeepslateSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 28_216
    }
    PolishedDeepslateWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 28_222
    }
    DeepslateTiles -> 28_546
    DeepslateTileStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 28_547
    }
    DeepslateTileSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 28_627
    }
    DeepslateTileWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 28_633
    }
    DeepslateBricks -> 28_957
    DeepslateBrickStairs(facing:, half:, shape:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.slab_half_to_index(half),
        block_property.stair_shape_to_index(shape),
        block_property.bool_to_index(waterlogged),
      ])
      + 28_958
    }
    DeepslateBrickSlab(slab_type:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.slab_type_to_index(slab_type),
        block_property.bool_to_index(waterlogged),
      ])
      + 29_038
    }
    DeepslateBrickWall(east:, north:, south:, up:, waterlogged:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.bool_to_index(up),
        block_property.bool_to_index(waterlogged),
        block_property.wall_side_to_index(west),
      ])
      + 29_044
    }
    ChiseledDeepslate -> 29_368
    CrackedDeepslateBricks -> 29_369
    CrackedDeepslateTiles -> 29_370
    InfestedDeepslate(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 29_371
    }
    SmoothBasalt -> 29_374
    RawIronBlock -> 29_375
    RawCopperBlock -> 29_376
    RawGoldBlock -> 29_377
    PottedAzaleaBush -> 29_378
    PottedFloweringAzaleaBush -> 29_379
    OchreFroglight(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 29_380
    }
    VerdantFroglight(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 29_383
    }
    PearlescentFroglight(axis:) -> {
      block_property.accumulate_based_indices([
        block_property.axis_to_index(axis),
      ])
      + 29_386
    }
    Frogspawn -> 29_389
    ReinforcedDeepslate -> 29_390
    DecoratedPot(cracked:, facing:, waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(cracked),
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(waterlogged),
      ])
      + 29_391
    }
    Crafter(crafting:, orientation:, triggered:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(crafting),
        block_property.orientation_to_index(orientation),
        block_property.bool_to_index(triggered),
      ])
      + 29_407
    }
    TrialSpawner(ominous:, trial_spawner_state:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(ominous),
        block_property.trial_spawner_state_to_index(trial_spawner_state),
      ])
      + 29_455
    }
    Vault(facing:, ominous:, vault_state:) -> {
      block_property.accumulate_based_indices([
        block_property.facing_cardinal_to_index(facing),
        block_property.bool_to_index(ominous),
        block_property.vault_state_to_index(vault_state),
      ])
      + 29_467
    }
    HeavyCore(waterlogged:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(waterlogged),
      ])
      + 29_499
    }
    PaleMossBlock -> 29_501
    PaleMossCarpet(bottom:, east:, north:, south:, west:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(bottom),
        block_property.wall_side_to_index(east),
        block_property.wall_side_to_index(north),
        block_property.wall_side_to_index(south),
        block_property.wall_side_to_index(west),
      ])
      + 29_502
    }
    PaleHangingMoss(tip:) -> {
      block_property.accumulate_based_indices([
        block_property.bool_to_index(tip),
      ])
      + 29_664
    }
    OpenEyeblossom -> 29_666
    ClosedEyeblossom -> 29_667
    PottedOpenEyeblossom -> 29_668
    PottedClosedEyeblossom -> 29_669
    FireflyBush -> 29_670
  }
}
