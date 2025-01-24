/mob/living/simple_animal/hostile/retaliate/frog
	name = "frog"
	desc = "It seems a little sad."
	icon_state = "frog"
	icon_living = "frog"
	icon_dead = "frog_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak = list("ribbit","croak")
	emote_see = list("hops in a circle.", "shakes.", "moistened.", "blinks it`s eyes")
	speak_chance = 1
	speak_sound = list('modular_dripstation/sound/animals/frog_talk1.ogg', 'modular_dripstation/sound/animals/frog_talk2.ogg')
	turns_per_move = 5
	maxHealth = 15
	health = 15
	melee_damage_lower = 5
	melee_damage_upper = 5
	attacktext = "bites"
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stamps on"
	initial_language_holder = /datum/language_holder/lizard
	can_be_held = TRUE
	worn_slot_flags = ITEM_SLOT_HEAD
	held_lh = 'modular_dripstation/icons/mob/inhands/mobs_lefthand.dmi'
	held_rh = 'modular_dripstation/icons/mob/inhands/mobs_righthand.dmi'
	held_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	density = FALSE
	ventcrawler = VENTCRAWLER_ALWAYS
	faction = list("hostile", "maint_creatures")
	attack_sound = 'modular_dripstation/sound/animals/frog_scream_1.ogg'
	deathsound = 'modular_dripstation/sound/animals/frog_death.ogg'
	attacked_sound = 'modular_dripstation/sound/animals/frog_damaged.ogg'
	butcher_results = list(/obj/item/reagent_containers/food/snacks/nugget = 1)
	pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
	mob_size = MOB_SIZE_TINY
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	var/stepped_sound = 'modular_dripstation/sound/animals/frog_scream_2.ogg'

/mob/living/simple_animal/hostile/retaliate/frog/Initialize(mapload)
	. = ..()
	if(prob(1))
		name = "\improper Frowning"
		desc = "He seems a little smug. He just coded something."
		gender = MALE
		icon_state = "rare_frog"
		icon_living = "rare_frog"
		icon_dead = "rare_frog_dead"
		attack_sound = 'sound/effects/reee.ogg'
		stepped_sound = 'sound/effects/huuu.ogg'
		butcher_results = list(/obj/item/reagent_containers/food/snacks/nugget = 5)
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
	)
	AddElement(/datum/element/connect_loc, loc_connections)


/mob/living/simple_animal/hostile/retaliate/frog/proc/on_entered(datum/source, atom/movable/AM, ...)
	if(!stat && isliving(AM))
		var/mob/living/L = AM
		if(L.mob_size > MOB_SIZE_TINY)
			playsound(src, stepped_sound, 50, 1)
