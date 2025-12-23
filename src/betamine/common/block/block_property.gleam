import gleam/list

pub type BasedIndex {
  BasedIndex(index: Int, base: Int)
}

pub fn accumulate_based_indices(indices: List(BasedIndex)) {
  list.fold_right(indices, BasedIndex(0, 0), fn(accumulated, current) {
    case accumulated {
      BasedIndex(0, 0) -> current
      BasedIndex(index, base) ->
        BasedIndex(index + base * current.index, base * current.base)
    }
  }).index
}

pub fn bool_to_int(bool: Bool) {
  case bool {
    True -> 0
    False -> 1
  }
}

pub fn bool_to_index(bool: Bool) {
  bool_to_int(bool)
  |> BasedIndex(2)
}

pub opaque type Age1 {
  Age1(int: Int)
}

pub const default_age_1 = Age1(0)

pub fn age_1_from_int(int: Int) {
  case int >= 0 && int <= 1 {
    True -> Ok(Age1(int))
    False -> Error(Nil)
  }
}

pub fn age_1_to_int(age_1: Age1) {
  age_1.int
}

pub fn age_1_to_index(age_1: Age1) {
  age_1_to_int(age_1)
  |> BasedIndex(2)
}

pub opaque type Age15 {
  Age15(int: Int)
}

pub const default_age_15 = Age15(0)

pub fn age_15_from_int(int: Int) {
  case int >= 0 && int <= 15 {
    True -> Ok(Age15(int))
    False -> Error(Nil)
  }
}

pub fn age_15_to_int(age_15: Age15) {
  age_15.int
}

pub fn age_15_to_index(age_15: Age15) {
  age_15_to_int(age_15)
  |> BasedIndex(16)
}

pub opaque type Age2 {
  Age2(int: Int)
}

pub const default_age_2 = Age2(0)

pub fn age_2_from_int(int: Int) {
  case int >= 0 && int <= 2 {
    True -> Ok(Age2(int))
    False -> Error(Nil)
  }
}

pub fn age_2_to_int(age_2: Age2) {
  age_2.int
}

pub fn age_2_to_index(age_2: Age2) {
  age_2_to_int(age_2)
  |> BasedIndex(3)
}

pub opaque type Age25 {
  Age25(int: Int)
}

pub const default_age_25 = Age25(0)

pub fn age_25_from_int(int: Int) {
  case int >= 0 && int <= 25 {
    True -> Ok(Age25(int))
    False -> Error(Nil)
  }
}

pub fn age_25_to_int(age_25: Age25) {
  age_25.int
}

pub fn age_25_to_index(age_25: Age25) {
  age_25_to_int(age_25)
  |> BasedIndex(26)
}

pub opaque type Age3 {
  Age3(int: Int)
}

pub const default_age_3 = Age3(0)

pub fn age_3_from_int(int: Int) {
  case int >= 0 && int <= 3 {
    True -> Ok(Age3(int))
    False -> Error(Nil)
  }
}

pub fn age_3_to_int(age_3: Age3) {
  age_3.int
}

pub fn age_3_to_index(age_3: Age3) {
  age_3_to_int(age_3)
  |> BasedIndex(4)
}

pub opaque type Age4 {
  Age4(int: Int)
}

pub const default_age_4 = Age4(0)

pub fn age_4_from_int(int: Int) {
  case int >= 0 && int <= 4 {
    True -> Ok(Age4(int))
    False -> Error(Nil)
  }
}

pub fn age_4_to_int(age_4: Age4) {
  age_4.int
}

pub fn age_4_to_index(age_4: Age4) {
  age_4_to_int(age_4)
  |> BasedIndex(5)
}

pub opaque type Age5 {
  Age5(int: Int)
}

pub const default_age_5 = Age5(0)

pub fn age_5_from_int(int: Int) {
  case int >= 0 && int <= 5 {
    True -> Ok(Age5(int))
    False -> Error(Nil)
  }
}

pub fn age_5_to_int(age_5: Age5) {
  age_5.int
}

pub fn age_5_to_index(age_5: Age5) {
  age_5_to_int(age_5)
  |> BasedIndex(6)
}

pub opaque type Age7 {
  Age7(int: Int)
}

pub const default_age_7 = Age7(0)

pub fn age_7_from_int(int: Int) {
  case int >= 0 && int <= 7 {
    True -> Ok(Age7(int))
    False -> Error(Nil)
  }
}

pub fn age_7_to_int(age_7: Age7) {
  age_7.int
}

pub fn age_7_to_index(age_7: Age7) {
  age_7_to_int(age_7)
  |> BasedIndex(8)
}

pub opaque type Bites {
  Bites(int: Int)
}

pub const default_bites = Bites(0)

pub fn bites_from_int(int: Int) {
  case int >= 0 && int <= 6 {
    True -> Ok(Bites(int))
    False -> Error(Nil)
  }
}

pub fn bites_to_int(bites: Bites) {
  bites.int
}

pub fn bites_to_index(bites: Bites) {
  bites_to_int(bites)
  |> BasedIndex(7)
}

pub opaque type Candles {
  Candles(int: Int)
}

pub const default_candles = Candles(1)

pub fn candles_from_int(int: Int) {
  case int >= 1 && int <= 4 {
    True -> Ok(Candles(int))
    False -> Error(Nil)
  }
}

pub fn candles_to_int(candles: Candles) {
  candles.int
}

pub fn candles_to_index(candles: Candles) {
  candles_to_int(candles)
  |> BasedIndex(4)
}

pub opaque type CauldronLevel {
  CauldronLevel(int: Int)
}

pub const default_cauldron_level = CauldronLevel(1)

pub fn cauldron_level_from_int(int: Int) {
  case int >= 1 && int <= 3 {
    True -> Ok(CauldronLevel(int))
    False -> Error(Nil)
  }
}

pub fn cauldron_level_to_int(cauldron_level: CauldronLevel) {
  cauldron_level.int
}

pub fn cauldron_level_to_index(cauldron_level: CauldronLevel) {
  cauldron_level_to_int(cauldron_level)
  |> BasedIndex(3)
}

pub opaque type Charges {
  Charges(int: Int)
}

pub const default_charges = Charges(0)

pub fn charges_from_int(int: Int) {
  case int >= 0 && int <= 4 {
    True -> Ok(Charges(int))
    False -> Error(Nil)
  }
}

pub fn charges_to_int(charges: Charges) {
  charges.int
}

pub fn charges_to_index(charges: Charges) {
  charges_to_int(charges)
  |> BasedIndex(5)
}

pub opaque type ComposterLevel {
  ComposterLevel(int: Int)
}

pub const default_composter_level = ComposterLevel(0)

pub fn composter_level_from_int(int: Int) {
  case int >= 0 && int <= 8 {
    True -> Ok(ComposterLevel(int))
    False -> Error(Nil)
  }
}

pub fn composter_level_to_int(composter_level: ComposterLevel) {
  composter_level.int
}

pub fn composter_level_to_index(composter_level: ComposterLevel) {
  composter_level_to_int(composter_level)
  |> BasedIndex(9)
}

pub opaque type Delay {
  Delay(int: Int)
}

pub const default_delay = Delay(1)

pub fn delay_from_int(int: Int) {
  case int >= 1 && int <= 4 {
    True -> Ok(Delay(int))
    False -> Error(Nil)
  }
}

pub fn delay_to_int(delay: Delay) {
  delay.int
}

pub fn delay_to_index(delay: Delay) {
  delay_to_int(delay)
  |> BasedIndex(4)
}

pub opaque type Dusted {
  Dusted(int: Int)
}

pub const default_dusted = Dusted(0)

pub fn dusted_from_int(int: Int) {
  case int >= 0 && int <= 3 {
    True -> Ok(Dusted(int))
    False -> Error(Nil)
  }
}

pub fn dusted_to_int(dusted: Dusted) {
  dusted.int
}

pub fn dusted_to_index(dusted: Dusted) {
  dusted_to_int(dusted)
  |> BasedIndex(4)
}

pub opaque type Eggs {
  Eggs(int: Int)
}

pub const default_eggs = Eggs(1)

pub fn eggs_from_int(int: Int) {
  case int >= 1 && int <= 4 {
    True -> Ok(Eggs(int))
    False -> Error(Nil)
  }
}

pub fn eggs_to_int(eggs: Eggs) {
  eggs.int
}

pub fn eggs_to_index(eggs: Eggs) {
  eggs_to_int(eggs)
  |> BasedIndex(4)
}

pub opaque type FlowerAmount {
  FlowerAmount(int: Int)
}

pub const default_flower_amount = FlowerAmount(1)

pub fn flower_amount_from_int(int: Int) {
  case int >= 1 && int <= 4 {
    True -> Ok(FlowerAmount(int))
    False -> Error(Nil)
  }
}

pub fn flower_amount_to_int(flower_amount: FlowerAmount) {
  flower_amount.int
}

pub fn flower_amount_to_index(flower_amount: FlowerAmount) {
  flower_amount_to_int(flower_amount)
  |> BasedIndex(4)
}

pub opaque type Hatch {
  Hatch(int: Int)
}

pub const default_hatch = Hatch(0)

pub fn hatch_from_int(int: Int) {
  case int >= 0 && int <= 2 {
    True -> Ok(Hatch(int))
    False -> Error(Nil)
  }
}

pub fn hatch_to_int(hatch: Hatch) {
  hatch.int
}

pub fn hatch_to_index(hatch: Hatch) {
  hatch_to_int(hatch)
  |> BasedIndex(3)
}

pub opaque type HoneyLevel {
  HoneyLevel(int: Int)
}

pub const default_honey_level = HoneyLevel(0)

pub fn honey_level_from_int(int: Int) {
  case int >= 0 && int <= 5 {
    True -> Ok(HoneyLevel(int))
    False -> Error(Nil)
  }
}

pub fn honey_level_to_int(honey_level: HoneyLevel) {
  honey_level.int
}

pub fn honey_level_to_index(honey_level: HoneyLevel) {
  honey_level_to_int(honey_level)
  |> BasedIndex(6)
}

pub opaque type Hydration {
  Hydration(int: Int)
}

pub const default_hydration = Hydration(0)

pub fn hydration_from_int(int: Int) {
  case int >= 0 && int <= 3 {
    True -> Ok(Hydration(int))
    False -> Error(Nil)
  }
}

pub fn hydration_to_int(hydration: Hydration) {
  hydration.int
}

pub fn hydration_to_index(hydration: Hydration) {
  hydration_to_int(hydration)
  |> BasedIndex(4)
}

pub opaque type Layers {
  Layers(int: Int)
}

pub const default_layers = Layers(1)

pub fn layers_from_int(int: Int) {
  case int >= 1 && int <= 8 {
    True -> Ok(Layers(int))
    False -> Error(Nil)
  }
}

pub fn layers_to_int(layers: Layers) {
  layers.int
}

pub fn layers_to_index(layers: Layers) {
  layers_to_int(layers)
  |> BasedIndex(8)
}

pub opaque type LeavesDistance {
  LeavesDistance(int: Int)
}

pub const default_leaves_distance = LeavesDistance(7)

pub fn leaves_distance_from_int(int: Int) {
  case int >= 1 && int <= 7 {
    True -> Ok(LeavesDistance(int))
    False -> Error(Nil)
  }
}

pub fn leaves_distance_to_int(leaves_distance: LeavesDistance) {
  leaves_distance.int
}

pub fn leaves_distance_to_index(leaves_distance: LeavesDistance) {
  leaves_distance_to_int(leaves_distance)
  |> BasedIndex(7)
}

pub opaque type LightLevel {
  LightLevel(int: Int)
}

pub const default_light_level = LightLevel(15)

pub fn light_level_from_int(int: Int) {
  case int >= 0 && int <= 15 {
    True -> Ok(LightLevel(int))
    False -> Error(Nil)
  }
}

pub fn light_level_to_int(light_level: LightLevel) {
  light_level.int
}

pub fn light_level_to_index(light_level: LightLevel) {
  light_level_to_int(light_level)
  |> BasedIndex(16)
}

pub opaque type LiquidLevel {
  LiquidLevel(int: Int)
}

pub const default_liquid_level = LiquidLevel(0)

pub fn liquid_level_from_int(int: Int) {
  case int >= 0 && int <= 15 {
    True -> Ok(LiquidLevel(int))
    False -> Error(Nil)
  }
}

pub fn liquid_level_to_int(liquid_level: LiquidLevel) {
  liquid_level.int
}

pub fn liquid_level_to_index(liquid_level: LiquidLevel) {
  liquid_level_to_int(liquid_level)
  |> BasedIndex(16)
}

pub opaque type Moisture {
  Moisture(int: Int)
}

pub const default_moisture = Moisture(0)

pub fn moisture_from_int(int: Int) {
  case int >= 0 && int <= 7 {
    True -> Ok(Moisture(int))
    False -> Error(Nil)
  }
}

pub fn moisture_to_int(moisture: Moisture) {
  moisture.int
}

pub fn moisture_to_index(moisture: Moisture) {
  moisture_to_int(moisture)
  |> BasedIndex(8)
}

pub opaque type Note {
  Note(int: Int)
}

pub const default_note = Note(0)

pub fn note_from_int(int: Int) {
  case int >= 0 && int <= 24 {
    True -> Ok(Note(int))
    False -> Error(Nil)
  }
}

pub fn note_to_int(note: Note) {
  note.int
}

pub fn note_to_index(note: Note) {
  note_to_int(note)
  |> BasedIndex(25)
}

pub opaque type Pickles {
  Pickles(int: Int)
}

pub const default_pickles = Pickles(1)

pub fn pickles_from_int(int: Int) {
  case int >= 1 && int <= 4 {
    True -> Ok(Pickles(int))
    False -> Error(Nil)
  }
}

pub fn pickles_to_int(pickles: Pickles) {
  pickles.int
}

pub fn pickles_to_index(pickles: Pickles) {
  pickles_to_int(pickles)
  |> BasedIndex(4)
}

pub opaque type Power {
  Power(int: Int)
}

pub const default_power = Power(0)

pub fn power_from_int(int: Int) {
  case int >= 0 && int <= 15 {
    True -> Ok(Power(int))
    False -> Error(Nil)
  }
}

pub fn power_to_int(power: Power) {
  power.int
}

pub fn power_to_index(power: Power) {
  power_to_int(power)
  |> BasedIndex(16)
}

pub opaque type Rotation {
  Rotation(int: Int)
}

pub const default_rotation = Rotation(0)

pub fn rotation_from_int(int: Int) {
  case int >= 0 && int <= 15 {
    True -> Ok(Rotation(int))
    False -> Error(Nil)
  }
}

pub fn rotation_to_int(rotation: Rotation) {
  rotation.int
}

pub fn rotation_to_index(rotation: Rotation) {
  rotation_to_int(rotation)
  |> BasedIndex(16)
}

pub opaque type ScaffoldingDistance {
  ScaffoldingDistance(int: Int)
}

pub const default_scaffolding_distance = ScaffoldingDistance(7)

pub fn scaffolding_distance_from_int(int: Int) {
  case int >= 0 && int <= 7 {
    True -> Ok(ScaffoldingDistance(int))
    False -> Error(Nil)
  }
}

pub fn scaffolding_distance_to_int(scaffolding_distance: ScaffoldingDistance) {
  scaffolding_distance.int
}

pub fn scaffolding_distance_to_index(scaffolding_distance: ScaffoldingDistance) {
  scaffolding_distance_to_int(scaffolding_distance)
  |> BasedIndex(8)
}

pub opaque type SegmentAmount {
  SegmentAmount(int: Int)
}

pub const default_segment_amount = SegmentAmount(1)

pub fn segment_amount_from_int(int: Int) {
  case int >= 1 && int <= 4 {
    True -> Ok(SegmentAmount(int))
    False -> Error(Nil)
  }
}

pub fn segment_amount_to_int(segment_amount: SegmentAmount) {
  segment_amount.int
}

pub fn segment_amount_to_index(segment_amount: SegmentAmount) {
  segment_amount_to_int(segment_amount)
  |> BasedIndex(4)
}

pub opaque type Stage {
  Stage(int: Int)
}

pub const default_stage = Stage(0)

pub fn stage_from_int(int: Int) {
  case int >= 0 && int <= 1 {
    True -> Ok(Stage(int))
    False -> Error(Nil)
  }
}

pub fn stage_to_int(stage: Stage) {
  stage.int
}

pub fn stage_to_index(stage: Stage) {
  stage_to_int(stage)
  |> BasedIndex(2)
}

pub type Attachment {
  AttachmentFloor
  AttachmentCeiling
  AttachmentSingleWall
  AttachmentDoubleWall
}

pub fn attachment_to_int(attachment: Attachment) {
  case attachment {
    AttachmentFloor -> 0
    AttachmentCeiling -> 1
    AttachmentSingleWall -> 2
    AttachmentDoubleWall -> 3
  }
}

pub fn attachment_to_index(attachment: Attachment) {
  attachment_to_int(attachment)
  |> BasedIndex(4)
}

pub type Axis {
  AxisX
  AxisY
  AxisZ
}

pub fn axis_to_int(axis: Axis) {
  case axis {
    AxisX -> 0
    AxisY -> 1
    AxisZ -> 2
  }
}

pub fn axis_to_index(axis: Axis) {
  axis_to_int(axis)
  |> BasedIndex(3)
}

pub type BedPart {
  BedPartHead
  BedPartFoot
}

pub fn bed_part_to_int(bed_part: BedPart) {
  case bed_part {
    BedPartHead -> 0
    BedPartFoot -> 1
  }
}

pub fn bed_part_to_index(bed_part: BedPart) {
  bed_part_to_int(bed_part)
  |> BasedIndex(2)
}

pub type ChestType {
  ChestTypeSingle
  ChestTypeLeft
  ChestTypeRight
}

pub fn chest_type_to_int(chest_type: ChestType) {
  case chest_type {
    ChestTypeSingle -> 0
    ChestTypeLeft -> 1
    ChestTypeRight -> 2
  }
}

pub fn chest_type_to_index(chest_type: ChestType) {
  chest_type_to_int(chest_type)
  |> BasedIndex(3)
}

pub type ComparatorMode {
  ComparatorModeCompare
  ComparatorModeSubtract
}

pub fn comparator_mode_to_int(comparator_mode: ComparatorMode) {
  case comparator_mode {
    ComparatorModeCompare -> 0
    ComparatorModeSubtract -> 1
  }
}

pub fn comparator_mode_to_index(comparator_mode: ComparatorMode) {
  comparator_mode_to_int(comparator_mode)
  |> BasedIndex(2)
}

pub type CopperGolemPose {
  CopperGolemPoseStanding
  CopperGolemPoseSitting
  CopperGolemPoseRunning
  CopperGolemPoseStar
}

pub fn copper_golem_pose_to_int(copper_golem_pose: CopperGolemPose) {
  case copper_golem_pose {
    CopperGolemPoseStanding -> 0
    CopperGolemPoseSitting -> 1
    CopperGolemPoseRunning -> 2
    CopperGolemPoseStar -> 3
  }
}

pub fn copper_golem_pose_to_index(copper_golem_pose: CopperGolemPose) {
  copper_golem_pose_to_int(copper_golem_pose)
  |> BasedIndex(4)
}

pub type CreakingHeartState {
  CreakingHeartStateUprooted
  CreakingHeartStateDormant
  CreakingHeartStateAwake
}

pub fn creaking_heart_state_to_int(creaking_heart_state: CreakingHeartState) {
  case creaking_heart_state {
    CreakingHeartStateUprooted -> 0
    CreakingHeartStateDormant -> 1
    CreakingHeartStateAwake -> 2
  }
}

pub fn creaking_heart_state_to_index(creaking_heart_state: CreakingHeartState) {
  creaking_heart_state_to_int(creaking_heart_state)
  |> BasedIndex(3)
}

pub type DoorHinge {
  DoorHingeLeft
  DoorHingeRight
}

pub fn door_hinge_to_int(door_hinge: DoorHinge) {
  case door_hinge {
    DoorHingeLeft -> 0
    DoorHingeRight -> 1
  }
}

pub fn door_hinge_to_index(door_hinge: DoorHinge) {
  door_hinge_to_int(door_hinge)
  |> BasedIndex(2)
}

pub type DoubleBlockHalf {
  DoubleBlockHalfUpper
  DoubleBlockHalfLower
}

pub fn double_block_half_to_int(double_block_half: DoubleBlockHalf) {
  case double_block_half {
    DoubleBlockHalfUpper -> 0
    DoubleBlockHalfLower -> 1
  }
}

pub fn double_block_half_to_index(double_block_half: DoubleBlockHalf) {
  double_block_half_to_int(double_block_half)
  |> BasedIndex(2)
}

pub type Facing {
  FacingNorth
  FacingEast
  FacingSouth
  FacingWest
  FacingUp
  FacingDown
}

pub fn facing_to_int(facing: Facing) {
  case facing {
    FacingNorth -> 0
    FacingEast -> 1
    FacingSouth -> 2
    FacingWest -> 3
    FacingUp -> 4
    FacingDown -> 5
  }
}

pub fn facing_to_index(facing: Facing) {
  facing_to_int(facing)
  |> BasedIndex(6)
}

pub type FacingCardinal {
  FacingCardinalNorth
  FacingCardinalSouth
  FacingCardinalWest
  FacingCardinalEast
}

pub fn facing_cardinal_to_int(facing_cardinal: FacingCardinal) {
  case facing_cardinal {
    FacingCardinalNorth -> 0
    FacingCardinalSouth -> 1
    FacingCardinalWest -> 2
    FacingCardinalEast -> 3
  }
}

pub fn facing_cardinal_to_index(facing_cardinal: FacingCardinal) {
  facing_cardinal_to_int(facing_cardinal)
  |> BasedIndex(4)
}

pub type FacingHopper {
  FacingHopperDown
  FacingHopperNorth
  FacingHopperSouth
  FacingHopperWest
  FacingHopperEast
}

pub fn facing_hopper_to_int(facing_hopper: FacingHopper) {
  case facing_hopper {
    FacingHopperDown -> 0
    FacingHopperNorth -> 1
    FacingHopperSouth -> 2
    FacingHopperWest -> 3
    FacingHopperEast -> 4
  }
}

pub fn facing_hopper_to_index(facing_hopper: FacingHopper) {
  facing_hopper_to_int(facing_hopper)
  |> BasedIndex(5)
}

pub type HorizontalAxis {
  HorizontalAxisX
  HorizontalAxisZ
}

pub fn horizontal_axis_to_int(horizontal_axis: HorizontalAxis) {
  case horizontal_axis {
    HorizontalAxisX -> 0
    HorizontalAxisZ -> 1
  }
}

pub fn horizontal_axis_to_index(horizontal_axis: HorizontalAxis) {
  horizontal_axis_to_int(horizontal_axis)
  |> BasedIndex(2)
}

pub type Instrument {
  InstrumentHarp
  InstrumentBasedrum
  InstrumentSnare
  InstrumentHat
  InstrumentBass
  InstrumentFlute
  InstrumentBell
  InstrumentGuitar
  InstrumentChime
  InstrumentXylophone
  InstrumentIronXylophone
  InstrumentCowBell
  InstrumentDidgeridoo
  InstrumentBit
  InstrumentBanjo
  InstrumentPling
  InstrumentZombie
  InstrumentSkeleton
  InstrumentCreeper
  InstrumentDragon
  InstrumentWitherSkeleton
  InstrumentPiglin
  InstrumentCustomHead
}

pub fn instrument_to_int(instrument: Instrument) {
  case instrument {
    InstrumentHarp -> 0
    InstrumentBasedrum -> 1
    InstrumentSnare -> 2
    InstrumentHat -> 3
    InstrumentBass -> 4
    InstrumentFlute -> 5
    InstrumentBell -> 6
    InstrumentGuitar -> 7
    InstrumentChime -> 8
    InstrumentXylophone -> 9
    InstrumentIronXylophone -> 10
    InstrumentCowBell -> 11
    InstrumentDidgeridoo -> 12
    InstrumentBit -> 13
    InstrumentBanjo -> 14
    InstrumentPling -> 15
    InstrumentZombie -> 16
    InstrumentSkeleton -> 17
    InstrumentCreeper -> 18
    InstrumentDragon -> 19
    InstrumentWitherSkeleton -> 20
    InstrumentPiglin -> 21
    InstrumentCustomHead -> 22
  }
}

pub fn instrument_to_index(instrument: Instrument) {
  instrument_to_int(instrument)
  |> BasedIndex(23)
}

pub type Leaves {
  LeavesNone
  LeavesSmall
  LeavesLarge
}

pub fn leaves_to_int(leaves: Leaves) {
  case leaves {
    LeavesNone -> 0
    LeavesSmall -> 1
    LeavesLarge -> 2
  }
}

pub fn leaves_to_index(leaves: Leaves) {
  leaves_to_int(leaves)
  |> BasedIndex(3)
}

pub type Orientation {
  OrientationDownEast
  OrientationDownNorth
  OrientationDownSouth
  OrientationDownWest
  OrientationUpEast
  OrientationUpNorth
  OrientationUpSouth
  OrientationUpWest
  OrientationWestUp
  OrientationEastUp
  OrientationNorthUp
  OrientationSouthUp
}

pub fn orientation_to_int(orientation: Orientation) {
  case orientation {
    OrientationDownEast -> 0
    OrientationDownNorth -> 1
    OrientationDownSouth -> 2
    OrientationDownWest -> 3
    OrientationUpEast -> 4
    OrientationUpNorth -> 5
    OrientationUpSouth -> 6
    OrientationUpWest -> 7
    OrientationWestUp -> 8
    OrientationEastUp -> 9
    OrientationNorthUp -> 10
    OrientationSouthUp -> 11
  }
}

pub fn orientation_to_index(orientation: Orientation) {
  orientation_to_int(orientation)
  |> BasedIndex(12)
}

pub type PistonType {
  PistonTypeNormal
  PistonTypeSticky
}

pub fn piston_type_to_int(piston_type: PistonType) {
  case piston_type {
    PistonTypeNormal -> 0
    PistonTypeSticky -> 1
  }
}

pub fn piston_type_to_index(piston_type: PistonType) {
  piston_type_to_int(piston_type)
  |> BasedIndex(2)
}

pub type RailShape {
  RailShapeNorthSouth
  RailShapeEastWest
  RailShapeAscendingEast
  RailShapeAscendingWest
  RailShapeAscendingNorth
  RailShapeAscendingSouth
  RailShapeSouthEast
  RailShapeSouthWest
  RailShapeNorthWest
  RailShapeNorthEast
}

pub fn rail_shape_to_int(rail_shape: RailShape) {
  case rail_shape {
    RailShapeNorthSouth -> 0
    RailShapeEastWest -> 1
    RailShapeAscendingEast -> 2
    RailShapeAscendingWest -> 3
    RailShapeAscendingNorth -> 4
    RailShapeAscendingSouth -> 5
    RailShapeSouthEast -> 6
    RailShapeSouthWest -> 7
    RailShapeNorthWest -> 8
    RailShapeNorthEast -> 9
  }
}

pub fn rail_shape_to_index(rail_shape: RailShape) {
  rail_shape_to_int(rail_shape)
  |> BasedIndex(10)
}

pub type RailShapeStraight {
  RailShapeStraightNorthSouth
  RailShapeStraightEastWest
  RailShapeStraightAscendingEast
  RailShapeStraightAscendingWest
  RailShapeStraightAscendingNorth
  RailShapeStraightAscendingSouth
}

pub fn rail_shape_straight_to_int(rail_shape_straight: RailShapeStraight) {
  case rail_shape_straight {
    RailShapeStraightNorthSouth -> 0
    RailShapeStraightEastWest -> 1
    RailShapeStraightAscendingEast -> 2
    RailShapeStraightAscendingWest -> 3
    RailShapeStraightAscendingNorth -> 4
    RailShapeStraightAscendingSouth -> 5
  }
}

pub fn rail_shape_straight_to_index(rail_shape_straight: RailShapeStraight) {
  rail_shape_straight_to_int(rail_shape_straight)
  |> BasedIndex(6)
}

pub type RedstoneSide {
  RedstoneSideUp
  RedstoneSideSide
  RedstoneSideNone
}

pub fn redstone_side_to_int(redstone_side: RedstoneSide) {
  case redstone_side {
    RedstoneSideUp -> 0
    RedstoneSideSide -> 1
    RedstoneSideNone -> 2
  }
}

pub fn redstone_side_to_index(redstone_side: RedstoneSide) {
  redstone_side_to_int(redstone_side)
  |> BasedIndex(3)
}

pub type SculkSensorPhase {
  SculkSensorPhaseInactive
  SculkSensorPhaseActive
  SculkSensorPhaseCooldown
}

pub fn sculk_sensor_phase_to_int(sculk_sensor_phase: SculkSensorPhase) {
  case sculk_sensor_phase {
    SculkSensorPhaseInactive -> 0
    SculkSensorPhaseActive -> 1
    SculkSensorPhaseCooldown -> 2
  }
}

pub fn sculk_sensor_phase_to_index(sculk_sensor_phase: SculkSensorPhase) {
  sculk_sensor_phase_to_int(sculk_sensor_phase)
  |> BasedIndex(3)
}

pub type SideChain {
  SideChainUnconnected
  SideChainRight
  SideChainCenter
  SideChainLeft
}

pub fn side_chain_to_int(side_chain: SideChain) {
  case side_chain {
    SideChainUnconnected -> 0
    SideChainRight -> 1
    SideChainCenter -> 2
    SideChainLeft -> 3
  }
}

pub fn side_chain_to_index(side_chain: SideChain) {
  side_chain_to_int(side_chain)
  |> BasedIndex(4)
}

pub type SlabHalf {
  SlabHalfTop
  SlabHalfBottom
}

pub fn slab_half_to_int(slab_half: SlabHalf) {
  case slab_half {
    SlabHalfTop -> 0
    SlabHalfBottom -> 1
  }
}

pub fn slab_half_to_index(slab_half: SlabHalf) {
  slab_half_to_int(slab_half)
  |> BasedIndex(2)
}

pub type SlabType {
  SlabTypeTop
  SlabTypeBottom
  SlabTypeDouble
}

pub fn slab_type_to_int(slab_type: SlabType) {
  case slab_type {
    SlabTypeTop -> 0
    SlabTypeBottom -> 1
    SlabTypeDouble -> 2
  }
}

pub fn slab_type_to_index(slab_type: SlabType) {
  slab_type_to_int(slab_type)
  |> BasedIndex(3)
}

pub type StairShape {
  StairShapeStraight
  StairShapeInnerLeft
  StairShapeInnerRight
  StairShapeOuterLeft
  StairShapeOuterRight
}

pub fn stair_shape_to_int(stair_shape: StairShape) {
  case stair_shape {
    StairShapeStraight -> 0
    StairShapeInnerLeft -> 1
    StairShapeInnerRight -> 2
    StairShapeOuterLeft -> 3
    StairShapeOuterRight -> 4
  }
}

pub fn stair_shape_to_index(stair_shape: StairShape) {
  stair_shape_to_int(stair_shape)
  |> BasedIndex(5)
}

pub type StructureMode {
  StructureModeSave
  StructureModeLoad
  StructureModeCorner
  StructureModeData
}

pub fn structure_mode_to_int(structure_mode: StructureMode) {
  case structure_mode {
    StructureModeSave -> 0
    StructureModeLoad -> 1
    StructureModeCorner -> 2
    StructureModeData -> 3
  }
}

pub fn structure_mode_to_index(structure_mode: StructureMode) {
  structure_mode_to_int(structure_mode)
  |> BasedIndex(4)
}

pub type TestMode {
  TestModeStart
  TestModeLog
  TestModeFail
  TestModeAccept
}

pub fn test_mode_to_int(test_mode: TestMode) {
  case test_mode {
    TestModeStart -> 0
    TestModeLog -> 1
    TestModeFail -> 2
    TestModeAccept -> 3
  }
}

pub fn test_mode_to_index(test_mode: TestMode) {
  test_mode_to_int(test_mode)
  |> BasedIndex(4)
}

pub type Thickness {
  ThicknessTipMerge
  ThicknessTip
  ThicknessFrustum
  ThicknessMiddle
  ThicknessBase
}

pub fn thickness_to_int(thickness: Thickness) {
  case thickness {
    ThicknessTipMerge -> 0
    ThicknessTip -> 1
    ThicknessFrustum -> 2
    ThicknessMiddle -> 3
    ThicknessBase -> 4
  }
}

pub fn thickness_to_index(thickness: Thickness) {
  thickness_to_int(thickness)
  |> BasedIndex(5)
}

pub type Tilt {
  TiltNone
  TiltUnstable
  TiltPartial
  TiltFull
}

pub fn tilt_to_int(tilt: Tilt) {
  case tilt {
    TiltNone -> 0
    TiltUnstable -> 1
    TiltPartial -> 2
    TiltFull -> 3
  }
}

pub fn tilt_to_index(tilt: Tilt) {
  tilt_to_int(tilt)
  |> BasedIndex(4)
}

pub type TrialSpawnerState {
  TrialSpawnerStateInactive
  TrialSpawnerStateWaitingForPlayers
  TrialSpawnerStateActive
  TrialSpawnerStateWaitingForRewardEjection
  TrialSpawnerStateEjectingReward
  TrialSpawnerStateCooldown
}

pub fn trial_spawner_state_to_int(trial_spawner_state: TrialSpawnerState) {
  case trial_spawner_state {
    TrialSpawnerStateInactive -> 0
    TrialSpawnerStateWaitingForPlayers -> 1
    TrialSpawnerStateActive -> 2
    TrialSpawnerStateWaitingForRewardEjection -> 3
    TrialSpawnerStateEjectingReward -> 4
    TrialSpawnerStateCooldown -> 5
  }
}

pub fn trial_spawner_state_to_index(trial_spawner_state: TrialSpawnerState) {
  trial_spawner_state_to_int(trial_spawner_state)
  |> BasedIndex(6)
}

pub type VaultState {
  VaultStateInactive
  VaultStateActive
  VaultStateUnlocking
  VaultStateEjecting
}

pub fn vault_state_to_int(vault_state: VaultState) {
  case vault_state {
    VaultStateInactive -> 0
    VaultStateActive -> 1
    VaultStateUnlocking -> 2
    VaultStateEjecting -> 3
  }
}

pub fn vault_state_to_index(vault_state: VaultState) {
  vault_state_to_int(vault_state)
  |> BasedIndex(4)
}

pub type VerticalDirection {
  VerticalDirectionUp
  VerticalDirectionDown
}

pub fn vertical_direction_to_int(vertical_direction: VerticalDirection) {
  case vertical_direction {
    VerticalDirectionUp -> 0
    VerticalDirectionDown -> 1
  }
}

pub fn vertical_direction_to_index(vertical_direction: VerticalDirection) {
  vertical_direction_to_int(vertical_direction)
  |> BasedIndex(2)
}

pub type WallFace {
  WallFaceFloor
  WallFaceWall
  WallFaceCeiling
}

pub fn wall_face_to_int(wall_face: WallFace) {
  case wall_face {
    WallFaceFloor -> 0
    WallFaceWall -> 1
    WallFaceCeiling -> 2
  }
}

pub fn wall_face_to_index(wall_face: WallFace) {
  wall_face_to_int(wall_face)
  |> BasedIndex(3)
}

pub type WallSide {
  WallSideNone
  WallSideLow
  WallSideTall
}

pub fn wall_side_to_int(wall_side: WallSide) {
  case wall_side {
    WallSideNone -> 0
    WallSideLow -> 1
    WallSideTall -> 2
  }
}

pub fn wall_side_to_index(wall_side: WallSide) {
  wall_side_to_int(wall_side)
  |> BasedIndex(3)
}
