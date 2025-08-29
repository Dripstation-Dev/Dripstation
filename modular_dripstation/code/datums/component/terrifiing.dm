/datum/element/terrifiing_projectile
	element_flags = ELEMENT_DETACH_ON_HOST_DESTROY

/datum/element/terrifiing_projectile/Attach(datum/target)
	. = ..()
	if(!isprojectile(target))
		return ELEMENT_INCOMPATIBLE
	RegisterSignal(target, COMSIG_PROJECTILE_ON_HIT, PROC_REF(projectile_hit))

/datum/element/terrifiing_projectile/Detach(datum/target)
	. = ..()
	UnregisterSignal(target, list(COMSIG_PROJECTILE_ON_HIT))

/datum/element/terrifiing_projectile/proc/projectile_hit(atom/fired_from, atom/movable/firer, atom/target, Angle)
	for(var/mob/living/L in view(2, get_turf(target)))
		if(get_turf(fired_from) != get_turf(L) && L != firer)
			do_terrifiing(L)

/datum/element/terrifiing_projectile/proc/do_terrifiing(mob/living/target)
	if(target.stat != DEAD && !HAS_TRAIT(target, TRAIT_NO_NORMAL_FEAR))
		target.apply_status_effect(/datum/status_effect/terrified)
