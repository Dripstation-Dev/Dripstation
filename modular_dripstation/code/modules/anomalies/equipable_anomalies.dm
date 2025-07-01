/obj/item/stalker_hand_anomaly	//rough sojourn stuff, has no permission
	name = "Coder Anomaly"
	desc = "Something not meant to be seen by the eyes of players, \
	sad."
	icon = 'modular_dripstation/icons/anomalies.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	icon_state = "wow_this_is_trash"
	item_state = "wow_this_is_trash"
	var/anomaly_givith = FALSE
	var/to_remove_givith = FALSE
	slot_flags = ITEM_SLOT_BELT

/obj/item/stalker_hand_anomaly/dropped(var/mob/M)
	..()
	update_anomaly(M)

/obj/item/stalker_hand_anomaly/equipped(var/mob/M)
	.=..()
	update_anomaly(M)

/obj/item/stalker_hand_anomaly/proc/update_anomaly(mob/living/carbon/human/user)
	return

/obj/item/stalker_hand_anomaly/pillar
	name = "The pillar"
	desc = "A smooth pilar made of black stone. It is well polished and seems very strong."
	var/blood_difference = 60
	var/punch_increase = 15 //IDK

/obj/item/stalker_hand_anomaly/pillar/update_anomaly(mob/living/carbon/human/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.belt == src && !anomaly_givith)
			H.physiology?.punchdamagehigh_bonus += punch_increase
			H.physiology?.punchdamagelow_bonus += punch_increase
			H.physiology?.punchstunthreshold_bonus += punch_increase
			anomaly_givith = TRUE
			to_remove_givith = TRUE
			if(NOBLOOD in H.dna.species.species_traits) //We want the var for safety but we can do without the actual blood.
				return
			H.bleed(blood_difference)
		if(to_remove_givith && !(H.belt == src))
			H.physiology?.punchdamagehigh_bonus -= punch_increase
			H.physiology?.punchdamagelow_bonus -= punch_increase
			H.physiology?.punchstunthreshold_bonus -= punch_increase
			anomaly_givith = FALSE
			to_remove_givith = FALSE

/obj/item/stalker_hand_anomaly/camo_shard
	name = "The shard"
	desc = "A smooth shard of black stone, its edges have been beveled down to smooth rounds."
	icon_state = "shard"
	item_state = "shard"
	var/camo_set_to = 30
	var/health_to_take = 40 //IDK
	var/camo_we_have = 255

/obj/item/stalker_hand_anomaly/camo_shard/update_anomaly(mob/living/carbon/human/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.belt == src && !anomaly_givith)
			camo_we_have = H.alpha
			H.alpha = camo_set_to
			anomaly_givith = TRUE
			to_remove_givith = TRUE
			H.maxHealth -= health_to_take
			H.health -= health_to_take

		if(to_remove_givith && !(H.belt == src))
			H.alpha = camo_we_have
			camo_we_have = 255
			anomaly_givith = FALSE
			to_remove_givith = FALSE
			H.maxHealth += health_to_take
			H.health += health_to_take

/obj/item/stalker_hand_anomaly/star
	name = "The star"
	desc = "A black stone star. It is well polished and smoothed. The center is small enough to hold in the palm of a hand."
	icon_state = "star"
	item_state = "star"
	var/flash_help_givith = -2
	var/hunger_strike = 0.1
	var/obj/item/organ/eyes/E

/obj/item/stalker_hand_anomaly/star/equipped(var/mob/M)
	.=..()
	E = M.getorganslot(ORGAN_SLOT_EYES)

/obj/item/stalker_hand_anomaly/star/dropped(var/mob/M)
	.=..()
	E = null

/obj/item/stalker_hand_anomaly/star/update_anomaly(mob/living/carbon/human/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.belt == src && !anomaly_givith)
			anomaly_givith = TRUE
			to_remove_givith = TRUE
			if(E)
				E.flash_protect = flash_help_givith
				E.color_cutoffs = list(0, 20, 35)
			H.lighting_cutoff = LIGHTING_CUTOFF_MEDIUM
			H.physiology?.hunger_mod += hunger_strike
		if(to_remove_givith && !(H.belt == src))
			anomaly_givith = FALSE
			to_remove_givith = FALSE
			if(E)
				E.flash_protect = initial(E.flash_protect)
				E.color_cutoffs = initial(E.color_cutoffs)
			H.lighting_cutoff = initial(H.lighting_cutoff)
			H.physiology?.hunger_mod -= hunger_strike

/obj/item/stalker_hand_anomaly/hand
	name = "The hand"
	desc = "A black stone hand. It is polished and appears to be marked as an avian hand, with feathers carved into it."
	icon_state = "feather"
	item_state = "feather"
	var/added_slowdown = 0.1
	var/faction_allied = ""
	var/faction_turner = "russian"

/obj/item/stalker_hand_anomaly/hand/update_anomaly(mob/living/carbon/human/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.belt == src && !anomaly_givith)
			anomaly_givith = TRUE
			to_remove_givith = TRUE
			faction_allied = H.faction
			H.faction = faction_turner
			H.add_movespeed_modifier(id ="feather", update=TRUE, priority=100, multiplicative_slowdown = added_slowdown)
		if(to_remove_givith && !(H.belt == src))
			anomaly_givith = FALSE
			to_remove_givith = FALSE
			H.remove_movespeed_modifier("feather")
			H.faction = faction_allied
			faction_allied = null

/obj/item/stalker_hand_anomaly/dice
	name = "The dice"
	desc = "A smooth die, made of black stone. It is well polished and has no markings on its faces."
	icon_state = "d201"
	item_state = "d201"
	var/rng_to_win = 50
	var/timer_to_mins = 5
	var/bread_won = 40
	var/grain_loss = -80

/obj/item/stalker_hand_anomaly/dice/update_anomaly(mob/living/carbon/human/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.belt == src && !anomaly_givith)
			anomaly_givith = TRUE
			to_remove_givith = TRUE
			addtimer(CALLBACK(src, PROC_REF(rngus), H), timer_to_mins MINUTES)
		if(to_remove_givith && !(H.belt == src))
			anomaly_givith = FALSE
			to_remove_givith = FALSE

/obj/item/stalker_hand_anomaly/dice/proc/rngus(mob/living/carbon/human/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.belt == src && !HAS_TRAIT(H, TRAIT_POWERHUNGRY))
			if(prob(rng_to_win))
				H.adjust_nutrition(bread_won)
			else
				H.adjust_nutrition(grain_loss)
