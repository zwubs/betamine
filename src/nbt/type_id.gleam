import nbt/tag.{type Tag}

pub const end = <<0>>

pub const byte = <<1>>

pub const short = <<2>>

pub const int = <<3>>

pub const long = <<4>>

pub const float = <<5>>

pub const double = <<6>>

pub const byte_array = <<7>>

pub const string = <<8>>

pub const list = <<9>>

pub const compound = <<10>>

pub const int_array = <<11>>

pub const long_array = <<12>>

pub fn from_tag(tag: Tag) {
  case tag {
    tag.End -> <<end:bits>>
    tag.Byte(_) -> <<byte:bits>>
    tag.Short(_) -> <<short:bits>>
    tag.Int(_) -> <<int:bits>>
    tag.Long(_) -> <<long:bits>>
    tag.Float(_) -> <<float:bits>>
    tag.Double(_) -> <<double:bits>>
    tag.ByteArray(_) -> <<byte_array:bits>>
    tag.String(_) -> <<string:bits>>
    tag.List(_) -> <<list:bits>>
    tag.Compound(_) -> <<compound:bits>>
    tag.IntArray(_) -> <<int_array:bits>>
    tag.LongArray(_) -> <<long_array:bits>>
  }
}
