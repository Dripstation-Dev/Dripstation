/obj/structure/xenotank
	name = "cryo tank"
	icon = 'modular_dripstation/icons/obj/alien_pods.dmi'
	icon_state = "tank_empty"
	desc = "It is empty."
	density = TRUE
	max_integrity = 100
	resistance_flags = ACID_PROOF
	anchored = TRUE
	var/knock_sound = 'sound/effects/glassknock.ogg'
	var/break_sound = SFX_SHATTER
	var/broken_state = "tank_broken"
	var/bash_sound = 'sound/effects/glassbash.ogg'

/obj/structure/xenotank/attack_tk(mob/user)
	user.changeNext_move(CLICK_CD_MELEE)
	user.visible_message(span_notice("Something knocks on [src]."))
	add_fingerprint(user)
	playsound(src, knock_sound, 50, TRUE)

/obj/structure/xenotank/attack_hulk(mob/living/carbon/human/user, does_attack_animation = 0)
	if(!can_be_reached(user))
		return 1
	. = ..()

/obj/structure/xenotank/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(!can_be_reached(user))
		return
	user.changeNext_move(CLICK_CD_MELEE)
	
	if(user.a_intent != INTENT_HARM)
		user.visible_message(span_notice("[user] knocks on [src]."), \
			span_notice("You knock on [src]."))
		playsound(src, knock_sound, 50, TRUE)
	else
		user.visible_message(span_warning("[user] bashes [src]!"), \
			span_warning("You bash [src]!"))
		playsound(src, bash_sound, 100, TRUE)

/obj/structure/xenotank/attack_paw(mob/user)
	return attack_hand(user)

/obj/structure/xenotank/attack_generic(mob/user, damage_amount = 0, damage_type = BRUTE, damage_flag = 0, sound_effect = 1)	//used by attack_alien, attack_animal, and attack_slime
	if(!can_be_reached(user))
		return
	..()

/obj/structure/xenotank/attackby(obj/item/I, mob/living/user, params)
	if(!can_be_reached(user))
		return 1 //skip the afterattack

	add_fingerprint(user)

	if(I.tool_behaviour == TOOL_WELDER && user.a_intent == INTENT_HELP)
		if(atom_integrity < max_integrity)
			if(!I.tool_start_check(user, amount=0))
				return

			to_chat(user, span_notice("You begin repairing [src]..."))
			if(I.use_tool(src, user, 40, volume=50))
				update_integrity(max_integrity)
				to_chat(user, span_notice("You repair [src]."))
		else
			to_chat(user, span_warning("[src] is already in good condition!"))
		return
	return ..()

/obj/structure/xenotank/proc/can_be_reached(mob/user)
	return 1

/obj/structure/xenotank/proc/spawnDebris(location)
	. = list()
	. += new /obj/item/shard(location)
	. += new /obj/effect/decal/cleanable/glass(location)

/obj/structure/xenotank/deconstruct(disassembled = TRUE)
	if(QDELETED(src))
		return
	if(!disassembled)
		playsound(src, break_sound, 70, 1)
		if(!(flags_1 & NODECONSTRUCT_1))
			for(var/obj/item/shard/debris in spawnDebris(drop_location()))
				transfer_fingerprints_to(debris) // transfer fingerprints to shards only
	if(!broken_state)
		qdel(src)
	else
		desc = "Something broke it..."
		icon_state = broken_state
		broken_state = null

/obj/structure/xenotank/broken
	icon_state = "tank_broken"
	desc = "Something broke it..."
	broken_state = null

/obj/structure/xenotank/alien
	icon_state = "tank_alien"
	desc = "There is something big inside..."

/obj/structure/xenotank/hugger
	icon_state = "tank_hugger"
	desc = "There is something spider-like inside..."
