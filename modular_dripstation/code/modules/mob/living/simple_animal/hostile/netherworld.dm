/mob/living/simple_animal/hostile/netherworld
	desc = "A sanity-destroying otherthing from the Antiverse XIII."
	
/obj/structure/spawner/nether
	name = "Antiverse XIII link"
	desc = null //see examine()
	icon_state = "nether"
	max_integrity = 50
	spawn_time = 600 //1 minute
	max_mobs = 15
	icon = 'modular_dripstation/icons/mob/nether.dmi'
	spawn_text = "crawls through"
	mob_types = list(/mob/living/simple_animal/hostile/netherworld/migo, /mob/living/simple_animal/hostile/netherworld, /mob/living/simple_animal/hostile/netherworld/blankbody, /mob/living/simple_animal/hostile/netherworld/fcult/wretch, /mob/living/simple_animal/hostile/netherworld/fcult/pentarox)
	faction = list("nether")

/obj/structure/spawner/nether/Initialize(mapload)
	.=..()
	START_PROCESSING(SSprocessing, src)

/obj/structure/spawner/nether/examine(mob/user)
	. = ..()
	if(isskeleton(user) || iszombie(user))
		. += "A direct link to another dimension full of creatures very happy to see you. [span_nicegreen("You can see your house from here!")]"
	else
		. += "A direct link to another dimension full of creatures not very happy to see you. [span_warning("Entering the link would be a very bad idea.")]"

/obj/structure/spawner/nether/attack_hand(mob/user)
	. = ..()
	if(isskeleton(user) || iszombie(user))
		to_chat(user, span_notice("You don't feel like going home yet..."))
	else
		user.visible_message(span_warning("[user] is violently pulled into the link!"), \
							span_userdanger("Touching the portal, you are quickly pulled through into a world of unimaginable horror!"))
		contents.Add(user)

/obj/structure/spawner/nether/process(delta_time)
	for(var/mob/living/M in contents)
		if(M)
			playsound(src, 'sound/magic/demon_consume.ogg', 50, 1)
			M.adjustBruteLoss(60 * delta_time)
			new /obj/effect/gibspawner/generic(get_turf(M), M)
			if(M.stat == DEAD)
				var/mob/living/simple_animal/hostile/netherworld/blankbody/blank
				blank = new(loc)
				blank.name = "[M]"
				blank.desc = "It's [M], but [M.p_their()] flesh has an ashy texture, and [M.p_their()] face is featureless save an eerie smile."
				src.visible_message(span_warning("[M] reemerges from the link!"))
				qdel(M)

/obj/structure/spawner/nether/attack_tk(mob/user)
	if(iscarbon(user))
		if(isskeleton(user) || iszombie(user))
			to_chat(user, span_notice("You don't feel like going home yet..."))
			return
		var/mob/living/carbon/C = user
		var/datum/brain_trauma/mild/reality_dissociation/T = new()
		var/obj/item/organ/brain/B = locate(/obj/item/organ/brain) in C.internal_organs
		B.name = "nether-minded [B.name]"
		C.emote("scream")
		C.visible_message(span_danger("[C.name] screams in horror as [C.p_their()] mind is consumed by [src]!"))
		C.gain_trauma(T, TRAUMA_RESILIENCE_ABSOLUTE)
		to_chat(C, span_userdanger("That was a really dense idea."))
		switch(rand(1,8))
			if(1 to 3)
				C.gain_trauma_type(BRAIN_TRAUMA_MILD, TRAUMA_RESILIENCE_LOBOTOMY)
				C.gain_trauma_type(BRAIN_TRAUMA_MILD, TRAUMA_RESILIENCE_LOBOTOMY)
			if(4 to 6)
				C.gain_trauma_type(BRAIN_TRAUMA_SEVERE, TRAUMA_RESILIENCE_LOBOTOMY)
			if(7 to 8)
				C.gain_trauma_type(BRAIN_TRAUMA_SPECIAL, TRAUMA_RESILIENCE_LOBOTOMY)
		C.adjustOrganLoss(ORGAN_SLOT_BRAIN, BRAIN_DAMAGE_DEATH)

/obj/structure/spawner/nether/Bump(atom/A)
	if (ismovable(A))
		var/atom/movable/AM = A
		Bumped(AM)

/obj/structure/spawner/nether/Bumped(atom/movable/AM)
	if(isliving(AM))
		var/mob/living/L = AM
		if(isskeleton(L) || iszombie(L))
			to_chat(L, span_notice("You don't feel like going home yet..."))
			return
		AM.visible_message(span_danger("\The [AM] slams into \the [src] inducing a resonance... [AM.p_their()] body pulled through into a world of unimaginable horror!"),\
		span_userdanger("You slam into \the [src] as your ears are filled with screaming. Your last thought is \"Oh, fuck.\""),\
		span_italics("You hear an unearthly noise as a wave of fear washes over you."))
		contents.Add(L)
	else if(isobj(AM) && !iseffect(AM))
		AM.visible_message(span_danger("\The [AM] smacks into \the [src] and pulled through quickly."), null,\
		span_italics("You hear a loud crack as you are washed with a wave of fear."))
		contents.Add(AM)
	else
		return