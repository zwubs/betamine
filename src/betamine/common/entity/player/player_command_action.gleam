import betamine/protocol/decoder
import betamine/protocol/error
import gleam/result

pub type PlayerCommandAction {
  LeaveBed
  StartSprinting
  StopSprinting
  StartHorseJump
  StopHorseJump
  OpenVehicleInventory
  StartElytraFlying
}

pub fn from_int(int: Int) {
  case int {
    0 -> Ok(LeaveBed)
    1 -> Ok(StartSprinting)
    2 -> Ok(StopSprinting)
    3 -> Ok(StartHorseJump)
    4 -> Ok(StopHorseJump)
    5 -> Ok(OpenVehicleInventory)
    6 -> Ok(StartElytraFlying)
    value -> Error(error.InvalidEnumValue("CommandAction", 0, 6, value))
  }
}

pub fn decode(data: BitArray) {
  use #(hand, data) <- result.try(decoder.var_int(data))
  result.map(from_int(hand), fn(hand) { #(hand, data) })
}
