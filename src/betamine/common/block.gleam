import betamine/common/block/block_state
import betamine/common/position

pub type Block {
  Block(position: position.Position, state: block_state.BlockState)
}
