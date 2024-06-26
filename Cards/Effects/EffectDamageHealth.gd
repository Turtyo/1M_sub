class_name EffectDamageHealth extends EffectDamage
## Deal damage to target equal to amount of health lost by caster (up to max health). [br]
##
## @experimental [br]
## This is not to be used in the real game but is more meant as a testing tool. [br]

## @Override [br]
## Refer to [EffectBase]
@warning_ignore("unused_parameter")
func apply_effect(caster: Entity, target: Entity, value: int) -> void:
	var _amount_of_health_lost: int = 0
	var _caster_health_component: HealthComponent = PlayerManager.player.get_health_component()
	# need to do it this way because currenly Caster is null (due to the way we click on things
	# TODO fix this with the instant cast card
	_amount_of_health_lost = max(0, _caster_health_component.max_health - _caster_health_component.current_health)
	super(caster, target, _amount_of_health_lost)
