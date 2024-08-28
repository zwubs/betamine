pub type GameMode {
  Survival
  Creative
  Adventure
  Spectator
}

pub fn to_int(game_mode: GameMode) {
  case game_mode {
    Survival -> 0
    Creative -> 1
    Adventure -> 2
    Spectator -> 3
  }
}
