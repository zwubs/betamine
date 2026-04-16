import betamine/common/enum

pub const enum = enum.Enum("ChatMode", 0, 2, from_int, to_int)

pub type ChatMode {
  Enabled
  CommandsOnly
  Hidden
}

fn from_int(int: Int) {
  case int {
    0 -> Ok(Enabled)
    1 -> Ok(CommandsOnly)
    2 -> Ok(Hidden)
    _ -> Error(Nil)
  }
}

fn to_int(chat_mode: ChatMode) {
  case chat_mode {
    Enabled -> 0
    CommandsOnly -> 1
    Hidden -> 2
  }
}
