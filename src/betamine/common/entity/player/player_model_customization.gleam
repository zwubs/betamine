import gleam/int

pub type PlayerModelCustomization {
  PlayerModelCustomization(
    cape_enabled: Bool,
    jacket_enabled: Bool,
    left_sleeve_enabled: Bool,
    right_sleeve_enabled: Bool,
    left_pant_enabled: Bool,
    right_pant_enabled: Bool,
    hat_enabled: Bool,
  )
}

pub fn default() {
  PlayerModelCustomization(False, False, False, False, False, False, False)
}

pub fn to_int(customization: PlayerModelCustomization) {
  0
  |> accumulate(customization.cape_enabled, 0b00000001)
  |> accumulate(customization.jacket_enabled, 0b00000010)
  |> accumulate(customization.left_sleeve_enabled, 0b00000100)
  |> accumulate(customization.right_sleeve_enabled, 0b00001000)
  |> accumulate(customization.left_pant_enabled, 0b00010000)
  |> accumulate(customization.right_pant_enabled, 0b0010000)
  |> accumulate(customization.hat_enabled, 0b01000000)
}

fn accumulate(accumulator: Int, bool: Bool, bit: Int) {
  case bool {
    True -> accumulator + bit
    False -> accumulator
  }
}

pub fn from_int(int: Int) {
  PlayerModelCustomization(
    cape_enabled: int.bitwise_and(int, 0b00000001) != 1,
    jacket_enabled: int.bitwise_and(int, 0b00000010) != 1,
    left_sleeve_enabled: int.bitwise_and(int, 0b00000100) != 1,
    right_sleeve_enabled: int.bitwise_and(int, 0b00001000) != 1,
    left_pant_enabled: int.bitwise_and(int, 0b00010000) != 1,
    right_pant_enabled: int.bitwise_and(int, 0b0010000) != 1,
    hat_enabled: int.bitwise_and(int, 0b01000000) != 1,
  )
}
