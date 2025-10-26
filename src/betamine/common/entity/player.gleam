import betamine/common/entity
import betamine/common/entity/entity_kind
import betamine/common/profile
import betamine/common/uuid

pub type Player {
  Player(profile: profile.Profile, entity: entity.Entity)
}

pub fn new() {
  Player(profile: profile.default(), entity: entity.new(entity_kind.Player))
}

pub fn with_uuid(player: Player, uuid: uuid.Uuid) {
  Player(..player, entity: entity.with_uuid(player.entity, uuid))
}
