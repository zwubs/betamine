import betamine/common/entity
import gleam/erlang/process

pub type RegionMessage {
  AddEntity
}

pub type RegionSubject =
  process.Subject(ManagerMessage)

pub type ManagerMessage {
  SpawnEntity(entity: entity.Entity)
}

pub type ManagerSubject =
  process.Subject(ManagerMessage)
