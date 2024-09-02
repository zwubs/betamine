pub type Difficulty {
  Peaceful
  Easy
  Medium
  Hard
}

pub fn to_int(difficulty: Difficulty) {
  case difficulty {
    Peaceful -> 0
    Easy -> 1
    Medium -> 2
    Hard -> 3
  }
}
