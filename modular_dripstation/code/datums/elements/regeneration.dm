/**
 * # Regeneration component
 *
 * A mob with this component will regenerate its health over time, as long as it has not received damage
 * in the last X seconds. Taking any damage will reset this cooldown.
 */
/datum/component/regeneration
	/// You will only regain health if you haven't been hurt for this many seconds
	var/regeneration_delay
	/// Health to regenerate per second
	var/health_per_second
	/// List of damage types we don't care about, in case you want to only remove this with fire damage or something
	var/list/ignore_damage_types
	/// When this timer completes we start restoring health, it is a timer rather than a cooldown so we can do something on its completion
	var/regeneration_start_timer

/datum/component/regeneration/Initialize(regeneration_delay = 6 SECONDS, health_per_second = 0.1, ignore_damage_types = list(STAMINA))
	if (!isliving(parent))
		return COMPONENT_INCOMPATIBLE

	src.regeneration_delay = regeneration_delay
	src.health_per_second = health_per_second
	src.ignore_damage_types = ignore_damage_types

/datum/component/regeneration/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_MOB_APPLY_DAMAGE, PROC_REF(on_take_damage))

/datum/component/regeneration/UnregisterFromParent()
	. = ..()
	if(regeneration_start_timer)
		deltimer(regeneration_start_timer)
	UnregisterSignal(parent, COMSIG_MOB_APPLY_DAMAGE)
	stop_regenerating()

/datum/component/regeneration/Destroy(force, silent)
	stop_regenerating()
	. = ..()
	if(regeneration_start_timer)
		deltimer(regeneration_start_timer)

/// When you take damage, reset the cooldown and start processing
/datum/component/regeneration/proc/on_take_damage(datum/source, damage, damagetype)
	SIGNAL_HANDLER

	if (damage <= 0)
		return
	if (locate(damagetype) in ignore_damage_types)
		return
	stop_regenerating()
	if(regeneration_start_timer)
		deltimer(regeneration_start_timer)
	regeneration_start_timer = addtimer(CALLBACK(src, PROC_REF(start_regenerating)), regeneration_delay, TIMER_STOPPABLE)

/// Start processing health regeneration, and show animation if provided
/datum/component/regeneration/proc/start_regenerating()
	var/mob/living/living_parent = parent
	if (living_parent.stat == DEAD)
		return
	if (living_parent.health == living_parent.maxHealth)
		return
	if(living_parent.nutrition < NUTRITION_LEVEL_FED && living_parent.satiety < 400)
		return
	living_parent.visible_message(span_notice("[living_parent]'s wounds begin to knit closed!"))
	START_PROCESSING(SSobj, src)

/datum/component/regeneration/proc/stop_regenerating()
	STOP_PROCESSING(SSobj, src)

/datum/component/regeneration/process(seconds_per_tick = SSMOBS_DT)
	var/mob/living/living_parent = parent
	if (living_parent.stat == DEAD || living_parent.health == living_parent.maxHealth)
		stop_regenerating()
		return
	living_parent.heal_overall_damage(health_per_second * seconds_per_tick, health_per_second * seconds_per_tick, 0, required_status = BODYPART_ORGANIC, updating_health = TRUE)

