/obj/item/melee/errata
	name = "\improper Errata"
	desc = "Glorious nippon steel, folded 1000 times."
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/back.dmi'
	icon_state = "errata"
	item_state = "errata"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	pickup_sound =  'modular_dripstation/sound/weapons/Katana_Select01.ogg'
	drop_sound = 'modular_dripstation/sound/weapons/metal_drop.ogg'
	flags_1 = CONDUCT_1
	obj_flags = UNIQUE_RENAME
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	sharpness = SHARP_EDGED
	force = 20
	throw_speed = 4
	throw_range = 5
	throwforce = 12
	block_chance = 40
	armour_penetration = 50
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "diced", "cut")
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/melee/errata/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 25, 90, 5) //Not made for scalping victims, but will work nonetheless

/obj/item/melee/errata/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(attack_type == PROJECTILE_ATTACK)
		final_block_chance = block_chance / 2 //Pretty good...
	if(prob(final_block_chance))
		if(istype(hitby, /obj/projectile/bullet))
			owner.visible_message(span_danger("[attack_text] hits [owner]'s [src], while he cuts the air, splitting the bullet in half!"))
		else
			owner.visible_message(span_danger("[owner] blocks [attack_text] with [src]!"))
		return 1
	return 0

/obj/item/melee/errata/attack(atom/target, blocked = FALSE)
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		if(prob(10))
			M.adjust_fire_stacks(2)
			M.ignite_mob()
		if(M.fire_stacks > 0)
			var/fire_force = 35
			force = fire_force
	..()


/obj/item/melee/errata/on_exit_storage(datum/component/storage/concrete/S)
	var/obj/item/storage/belt/errata/B = S.real_location()
	if(istype(B))
		playsound(B, 'modular_dripstation/sound/weapons/Katana_Select02.ogg', 25, TRUE)

/obj/item/melee/errata/on_enter_storage(datum/component/storage/concrete/S)
	var/obj/item/storage/belt/errata/B = S.real_location()
	if(istype(B))
		playsound(B, 'modular_dripstation/sound/weapons/blade_sheath.ogg', 25, TRUE)

/obj/item/melee/errata/suicide_act(mob/user)
	if(prob(50))
		user.visible_message("<span class='suicide'>[user] carves deep into [user.p_their()] torso! It looks like [user.p_theyre()] trying to commit seppuku...</span>")
	else
		user.visible_message("<span class='suicide'>[user] carves a grid into [user.p_their()] chest! It looks like [user.p_theyre()] trying to commit sudoku...</span>")
	return (BRUTELOSS)

/obj/item/storage/belt/errata
	name = "nanoforged blade sheath"
	desc = "It yearns to bath in the blood of your enemies... but you hold it back!"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	icon_state = "errata_sheath"
	item_state = "errata_sheath"
	w_class = WEIGHT_CLASS_BULKY
	force = 3
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	var/primed = FALSE
	var/dash_sound = 'modular_dripstation/sound/weapons/unsheathed_blade.ogg'
	var/beam_effect = "blood_beam"
	var/phasein = /obj/effect/temp_visual/dir_setting/cult/phase
	var/phaseout = /obj/effect/temp_visual/dir_setting/cult/phase

/obj/item/storage/belt/errata/Initialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 1
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.set_holdable(list(
		/obj/item/melee/errata
		))

/obj/item/storage/belt/errata/examine(mob/user)
	. = ..()
	if(length(contents))
		. += "<span class='notice'>Use [src] in-hand to prime for an opening strike."
		. += "<span class='info'>Alt-click it to quickly draw the blade.</span>"

/obj/item/storage/belt/errata/AltClick(mob/user)
	if(!iscarbon(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)) || primed)
		return
	if(length(contents))
		var/obj/item/I = contents[1]
		playsound(user, dash_sound, 25, TRUE)
		user.visible_message("<span class='notice'>[user] swiftly draws \the [I].</span>", "<span class='notice'>You draw \the [I].</span>")
		user.put_in_hands(I)
		update_icon()
	else
		to_chat(user, "<span class='warning'>[src] is empty!</span>")

/obj/item/storage/belt/errata/attack_self(mob/user)
	if(!iscarbon(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	if(length(contents))
		if(primed)
			SEND_SIGNAL(src, COMSIG_TRY_STORAGE_SET_LOCKSTATE, FALSE)
			playsound(user, 'sound/items/sheath.ogg', 25, TRUE)
			to_chat(user, "<span class='notice'>You return your stance.</span>")
			primed = FALSE
			update_icon()
		else
			SEND_SIGNAL(src, COMSIG_TRY_STORAGE_SET_LOCKSTATE, TRUE)
			playsound(user, 'sound/items/unsheath.ogg', 25, TRUE)
			user.visible_message("<span class='warning'>[user] grips the blade within [src] and primes to attack.</span>", "<span class='warning'>You take an opening stance...</span>", "<span class='warning'>You hear a weapon being drawn...</span>")
			primed = TRUE
			update_icon()
	else
		to_chat(user, "<span class='warning'>[src] is empty!</span>")

/obj/item/storage/belt/errata/afterattack(atom/A, mob/living/user, proximity_flag, params)
	. = ..()
	if(primed && length(contents))
		var/obj/item/I = contents[1]
		if(!user.put_in_inactive_hand(I))
			to_chat(user, "<span class='warning'>You need a free hand!</span>")
			return
		if(!(A in view(user.client.view, user)))
			return
		var/datum/component/storage/CP = GetComponent(/datum/component/storage)
		CP.locked = FALSE
		primed = FALSE
		update_icon()
		primed_attack(A, user)
		if(CanReach(A, I))
			I.melee_attack_chain(user, A, params)
		user.swap_hand()

/obj/item/storage/belt/errata/proc/primed_attack(atom/target, mob/living/user)
	var/turf/end = get_turf(user)
	var/turf/start = get_turf(user)
	var/obj/spot1 = new phaseout(start, user.dir)
	var/halt = FALSE
	// Stolen dash code
	for(var/T in getline(start, get_turf(target)))
		var/turf/tile = T
		for(var/mob/living/victim in tile)
			if(victim != user)
				playsound(victim, 'sound/weapons/bladeslice.ogg', 10, TRUE)
				victim.take_bodypart_damage(15)
		// Unlike actual ninjas, we stop noclip-dashing here.
		if(isclosedturf(T))
			halt = TRUE
		for(var/obj/O in tile)
			// We ignore mobs as we are cutting through them
			if(!O.CanPass(user, tile))
				halt = TRUE
		if(halt)
			break
		else
			end = T
	user.forceMove(end) // YEET
	playsound(start, dash_sound, 35, TRUE)
	var/obj/spot2 = new phasein(end, user.dir)
	spot1.Beam(spot2, beam_effect, time=20)
	user.visible_message("<span class='warning'>In a flash of red, [user] draws [user.p_their()] blade!</span>", "<span class='notice'>You dash forward while drawing your weapon!</span>", "<span class='warning'>You hear a blade slice through the air at impossible speeds!</span>")

/obj/item/storage/belt/errata/update_icon_state()
	. = ..()
	icon_state = "errata_sheath"
	item_state = "errata_sheath"
	if(contents.len)
		if(primed)
			icon_state += "-primed"
		else
			icon_state += "-blade"
		item_state += "-sabre"

/obj/item/storage/belt/errata/PopulateContents()
	new /obj/item/melee/errata(src)
	update_appearance(UPDATE_ICON)
