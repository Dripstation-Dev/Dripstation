/obj/projectile/energy/electrode
	name = "electrode"
	icon_state = "spark"
	color = "#FFFF00"
	nodamage = TRUE
	hitsound = 'sound/weapons/taserhit.ogg'
	range = 7
	reflectable = NONE	//Yeah, it`s phisical, not energy
	tracer_type = /obj/effect/projectile/tracer/stun
	muzzle_type = /obj/effect/projectile/muzzle/stun
	impact_type = /obj/effect/projectile/impact/stun

/obj/projectile/energy/electrode/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(!ismob(target) || blocked >= 100) //Fully blocked by mob or collided with dense object - burst into sparks!
		do_sparks(1, TRUE, src)
	else if(iscarbon(target))
		var/mob/living/carbon/C = target
		SEND_SIGNAL(C, COMSIG_ADD_MOOD_EVENT, "tased", /datum/mood_event/tased)
		SEND_SIGNAL(C, COMSIG_LIVING_MINOR_SHOCK)
		if(C.dna && (C.dna.check_mutation(HULK)))
			C.say(pick(";RAAAAAAAARGH!", ";HNNNNNNNNNGGGGGGH!", ";GWAAAAAAAARRRHHH!", "NNNNNNNNGGGGGGGGHH!", ";AAAAAAARRRGH!" ), forced = "hulk")
		else if((C.status_flags & CANKNOCKDOWN) && !HAS_TRAIT(C, TRAIT_STUNIMMUNE))
			C.set_confusion_if_lower(10 SECONDS)
			C.set_stutter_if_lower(16 SECONDS)
			addtimer(CALLBACK(C, TYPE_PROC_REF(/mob/living/carbon, do_jitter_animation), 1.5 SECONDS), 0.5 SECONDS)
			addtimer(CALLBACK(C, TYPE_PROC_REF(/mob/living/carbon, apply_stun_effect)), 2 SECONDS)
			//yogstation edit begin -------------------------------------------
			if(istype(C.getorganslot(ORGAN_SLOT_STOMACH), /obj/item/organ/stomach/cell/ethereal))
				C.adjust_nutrition(40)
				to_chat(C,span_notice("You get charged by [src]."))
			//yogstation edit end ---------------------------------------------
			
/obj/projectile/energy/electrode/on_range() //to ensure the bolt sparks when it reaches the end of its range if it didn't hit a target yet
	do_sparks(1, TRUE, src)
	..()

/mob/living/carbon/proc/apply_stun_effect()
	adjustStaminaLoss(30)
	Knockdown(10 SECONDS)
	do_jitter_animation(10 SECONDS)