import betamine/encoder as encode
import gleam/bytes_builder
import gleam/io
import gleam/string

pub type GameMode {
  Survival
  Creative
  Adventure
  Spectator
}

pub type GameEvent {
  NoRespawnBlockAvailable
  StartRain
  EndRain
  ChangeGameMode(GameMode)
  WinGame(play_credits: Bool)
  DemoEvent
  ArrowHitPlayer
  RainLevelChange
  ThunderLevelChange
  PlayPufferfishStringSound
  PlayElderGaurdianEffect
  EnableRespawnScreen(Bool)
  LimitedCrafting(Bool)
  WaitForChunks
}

pub fn serialize() {
  encode.byte(bytes_builder.new(), 13)
  |> encode.float(0.0)
}
