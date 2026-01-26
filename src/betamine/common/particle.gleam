import betamine/common/block_position
import betamine/common/slot

pub type Particle {
  AngryVillager
  Block(block_state: Int)
  BlockMarker(block_state: Int)
  Bubble
  Cloud
  Crit
  DamageIndicator
  DragonBreath
  DrippingLava
  FallingLava
  LandingLava
  DrippingWater
  FallingWater
  Dust(color: Int, scale: Float)
  DustColorTransition(from_color: Int, to_color: Int, scale: Float)
  Effect
  ElderGuardian
  EnchantedHit
  Enchant
  EndRod
  EntityEffect(color: Int)
  ExplosionEmitter
  Explosion
  Gust
  SmallGust
  GustEmitterLarge
  GustEmitterSmall
  SonicBoom
  FallingDust(block_state: Int)
  Firework
  Fishing
  Flame
  Infested
  CherryLeaves
  SculkSoul
  SculkCharge(roll: Float)
  SculkChargePop
  SoulFireFlame
  Soul
  Flash
  HappyVillager
  Composter
  Heart
  InstantEffect
  Item(item: slot.Slot)
  // Split into 2
  BlockVibration(block_position: block_position.BlockPosition, ticks: Int)
  EntityVibration(entity_id: Int, entity_eye_height: Float, ticks: Int)
  ItemSlime
  ItemCobweb
  ItemSnowball
  LargeSmoke
  Lava
  Mycelium
  Note
  Poof
  Portal
  Rain
  Smoke
  WhiteSmoke
  Sneeze
  Spit
  SquidInk
  SweepAttack
  TotemOfUndying
  Underwater
  Splash
  Witch
  BubblePop
  CurrentDown
  BubbleColumnUp
  Nautilus
  Dolphin
  CampfireCosySmoke
  CampfireSignalSmoke
  DrippingHoney
  FallingHoney
  LandingHoney
  FallingNectar
  FallingSporeBlossom
  Ash
  CrimsonSpore
  WarpedSpore
  SporeBlossomAir
  DrippingObsidianTear
  FallingObsidianTear
  LandingObsidianTear
  ReversePortal
  WhiteAsh
  SmallFlame
  Snowflake
  DrippingDripstoneLava
  FallingDripstoneLava
  DrippingDripstoneWater
  FallingDripstoneWater
  GlowSquidInk
  Glow
  WaxOn
  WaxOff
  ElectricSpark
  Scrape
  Shriek(delay: Int)
  EggCrack
  DustPlume
  TrialSpawnerDetection
  TrialSpawnerDetectionOminous
  VaultConnection
  DustPillar(block_state: Int)
  OminousSpawning
  RaidOmen
  TrialOmen
  BlockCrumble(block_state: Int)
}
