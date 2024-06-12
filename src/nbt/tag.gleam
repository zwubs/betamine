import gleam/dict.{type Dict}

pub type Nbt {
  Nbt(name: String, tag: Tag)
}

pub type Tag {
  End
  Byte(BitArray)
  Short(Int)
  Int(Int)
  Long(Int)
  Float(Float)
  Double(Float)
  ByteArray(BitArray)
  String(String)
  List(List(Tag))
  Compound(Dict(String, Tag))
  IntArray(List(Int))
  LongArray(List(Int))
}
