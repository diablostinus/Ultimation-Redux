function init()
  animator.setParticleEmitterOffsetRegion("flames", mcontroller.boundBox())
  animator.setParticleEmitterActive("flames", true)
  effect.setParentDirectives("fade=6dbd48=0.2")

  script.setUpdateDelta(5)

  self.tickTime = 0.002
  self.tickTimer = self.tickTime
  self.damage = 2
end

function update(dt)
  self.tickTimer = self.tickTimer - dt
  if self.tickTimer <= 0 then
    self.tickTimer = self.tickTime
    status.applySelfDamageRequest({
        damageType = "IgnoresDef",
        damage = self.damage,
        damageSourceKind = "darkness",
        sourceEntityId = entity.id()
      })
  end
end
