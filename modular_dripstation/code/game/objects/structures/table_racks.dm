/obj/structure/table/optable
	icon = 'modular_dripstation/icons/obj/surgery.dmi'

/obj/structure/table/proc/tablelimbsmash(mob/living/user, mob/living/pushed_mob, harmfull = FALSE)
	if((harmfull || HAS_TRAIT(user, TRAIT_HULK)) && !HAS_TRAIT(user, TRAIT_PACIFISM))
		pushed_mob.Knockdown(30)
		var/obj/item/bodypart/banged_limb = pushed_mob.get_bodypart(user.zone_selected) || pushed_mob.get_bodypart(BODY_ZONE_HEAD)
		var/extra_wound = 0
		if(HAS_TRAIT(user, TRAIT_HULK))
			extra_wound = 20
		banged_limb?.receive_damage(30, wound_bonus = extra_wound)
		pushed_mob.visible_message(span_danger("[user] smashes [pushed_mob]'s [banged_limb.name] against \the [src]!"),
								span_userdanger("[user] smashes your [banged_limb.name] against \the [src]"))
	else
		pushed_mob.Knockdown(60)
		pushed_mob.visible_message(span_danger("[user] smashes [pushed_mob] against \the [src]!"),
								span_userdanger("[user] smashes you against \the [src]"))
	pushed_mob.apply_damage(60, STAMINA)
	take_damage(50)
	playsound(pushed_mob, 'sound/effects/bang.ogg', 90, TRUE)
	log_combat(user, pushed_mob, "slammed", null, "against [src]")
	SEND_SIGNAL(pushed_mob, COMSIG_ADD_MOOD_EVENT, "table", /datum/mood_event/table)
