import gleam/result

pub type Enum(of) {
  Enum(
    name: String,
    min: Int,
    max: Int,
    from_int: fn(Int) -> Result(of, Nil),
    to_int: fn(of) -> Int,
  )
}

pub fn from_int(enum: Enum(of), int: Int) -> Result(of, Enum(of)) {
  enum.from_int(int)
  |> result.replace_error(enum)
}

pub fn to_int(enum: Enum(of), value: of) -> Int {
  enum.to_int(value)
}
