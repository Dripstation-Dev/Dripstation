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
	var/health_per_second = 0.1
	/// List of damage types we don't care about, in case you want to only remove this with fire damage or something
	var/list/ignore_damage_types
	/// When this timer completes we start restoring health, it is a timer rather than a cooldown so we can do something on its completion
	var/regeneration_start_timer
	var/mob/living/carbon/human/owner

	///how much nutriation we need to start healing
	var/hunger_cap
	///how much nutriation we use to heal wound
	var/hunger_mod = 0.2
	COOLDOWN_DECLARE(regen_message_fire_cd)

/datum/component/regeneration/Initialize(regeneration_delay = 6 SECONDS, health_per_second = 0.1, ignore_damage_types = list(STAMINA), hunger_cap = NUTRITION_LEVEL_FED, hunger_mod = 0.2)
	if (!ishuman(parent))
		return COMPONENT_INCOMPATIBLE

	src.owner = parent
	src.regeneration_delay = regeneration_delay
	src.health_per_second = health_per_second
	src.ignore_damage_types = ignore_damage_types
	src.hunger_cap = hunger_cap
	src.hunger_mod = hunger_mod

/datum/component/regeneration/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_MOB_APPLY_DAMAGE, PROC_REF(on_take_damage))
	RegisterSignal(parent, COMSIG_HUMAN_ADJUSTED_NUTRIATION, PROC_REF(on_nutri_change))	//here we will get only change ++

/datum/component/regeneration/UnregisterFromParent()
	. = ..()
	if(regeneration_start_timer)
		deltimer(regeneration_start_timer)
	UnregisterSignal(parent, COMSIG_MOB_APPLY_DAMAGE)
	UnregisterSignal(parent, COMSIG_HUMAN_ADJUSTED_NUTRIATION)
	stop_regenerating()

/datum/component/regeneration/Destroy(force, silent)
	stop_regenerating()
	src.owner = null
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

/datum/component/regeneration/proc/on_nutri_change(datum/source, nutriation)	//when we get nutri change ++ - we get this proc with our nutri and del restart regen timer
	SIGNAL_HANDLER

	if(nutriation < hunger_cap)
		return
	if(regeneration_start_timer)
		deltimer(regeneration_start_timer)
	//regeneration_start_timer = addtimer(CALLBACK(src, PROC_REF(start_regenerating)), regeneration_delay / 2, TIMER_STOPPABLE)
	start_regenerating()

/// Start processing health regeneration, and show animation if provided
/datum/component/regeneration/proc/start_regenerating()
	if (owner.stat == DEAD)
		return
	if (owner.health == owner.maxHealth)
		return
	if (owner.nutrition < hunger_cap) //&& owner.satiety < 400)
	// 	if(regeneration_start_timer)
	// 		deltimer(regeneration_start_timer)
	// 	regeneration_start_timer = addtimer(CALLBACK(src, PROC_REF(start_regenerating)), regeneration_delay, TIMER_STOPPABLE)	//check in another 6 seconds
		return
	owner.visible_message(span_notice("[owner]'s wounds begin to knit closed!"))
	COOLDOWN_START(src, regen_message_fire_cd, 10 SECONDS)
	START_PROCESSING(SSobj, src)

/datum/component/regeneration/proc/stop_regenerating()
	COOLDOWN_RESET(src, regen_message_fire_cd)
	STOP_PROCESSING(SSobj, src)

/datum/component/regeneration/process(seconds_per_tick = SSMOBS_DT)
	if (owner.stat == DEAD || owner.health == owner.maxHealth || owner.nutrition < hunger_cap)
		stop_regenerating()
		return
	owner.heal_overall_damage(health_per_second * seconds_per_tick, health_per_second * seconds_per_tick, 0, required_status = BODYPART_ORGANIC, updating_health = TRUE)
	owner.adjust_nutrition(-(hunger_mod * health_per_second * seconds_per_tick)) // So heal to nutrient ratio doesnt change
	if(COOLDOWN_FINISHED(src, regen_message_fire_cd))
		to_chat(owner, span_notice(pick("You feel your wounds getting warm.", "You feel like your wounds itch.", "It seams that your wounds feel a little bit less painfull.", "Your natural regeneration seams to do some work on your wounds.", "The wounds heal, the stomach become emptier.")))
		COOLDOWN_START(src, regen_message_fire_cd, 30 SECONDS)
