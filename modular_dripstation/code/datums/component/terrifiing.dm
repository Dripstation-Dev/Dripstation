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
	for(var/mob/living/carbon/human/H in viewers(2, get_turf(target)))
		if(!ishuman(H))
			continue
		if(H.in_fow(target, TRUE))
			continue
		//if(get_turf(fired_from) != get_turf(H) && H != firer)
		do_terrifiing(H)

/datum/element/terrifiing_projectile/proc/do_terrifiing(mob/living/carbon/human/target)
	if(target.stat != DEAD && !target.check_fear(NORMAL_FEAR_SOURCE))
		target.apply_status_effect(/datum/status_effect/terrified)
