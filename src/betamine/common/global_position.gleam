import betamine/common/block_position.{type BlockPosition}
import betamine/common/identifier.{type Identifier}

pub type GlobalPosition {
  GlobalPosition(identifier: Identifier, position: BlockPosition)
}
