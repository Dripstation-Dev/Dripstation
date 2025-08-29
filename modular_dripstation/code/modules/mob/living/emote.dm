/datum/emote/living/laugh/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_laugh_sound(user)
	if(!.)
		return ..()

/datum/emote/living/giggle/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_giggle_sound(user)
	if(!.)
		return ..()

/datum/emote/living/scream/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_scream_sound(user)
	if(!.)
		return ..()

/datum/emote/living/gasp/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_gasp_sound(user)
	if(!.)
		return ..()

/datum/emote/living/choke
	muzzle_ignore = TRUE
	emote_length = 2 SECONDS

/datum/emote/living/choke/get_sound(mob/living/carbon/human/user)	//gasp sounds for now
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_gasp_sound(user)
	if(!.)
		return ..()

/datum/emote/living/cough/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_cough_sound(user)
	if(!.)
		return ..()

/datum/emote/living/sigh
	emote_type = EMOTE_AUDIBLE|EMOTE_ANIMATED
	emote_length = 3 SECONDS 
	overlay_y_offset = -1
	overlay_icon_state = "sigh"
	directional = TRUE

/datum/emote/living/sigh/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_sigh_sound(user)
	if(!.)
		return ..()

/datum/emote/living/sneeze/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_sneeze_sound(user)
	if(!.)
		return ..()

/datum/emote/living/sniff/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_sniff_sound(user)
	if(!.)
		return ..()

/datum/emote/living/carbon/human/cry/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_cry_sound(user)
	if(!.)
		return ..()

/datum/emote/living/carbon/lewd_moan
	key = "lewd"
	message = "moans lewdly."
	emote_type = EMOTE_AUDIBLE //| EMOTE_ANIMATED
	emote_length = 2 SECONDS
	cooldown = 1 SECONDS
	//overlay_icon_state = "blush"
	//emote_length = 5 SECONDS
	//directional = TRUE
	//emote_layer = BODY_LAYER
	//sound = 'modular_dripstation/sound/emotes/blush.ogg'

/datum/emote/living/carbon/lewd_moan/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_lewd_moan_sound(user)
	if(!.)
		return ..()

/datum/emote/living/carbon/moan
	stat_allowed = SOFT_CRIT	//you can moan in crit

/datum/emote/living/carbon/moan/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_moan_sound(user)
	if(!.)
		return ..()

/datum/emote/living/yawn/get_sound(mob/living/carbon/human/user)
	if(ishuman(user) && user?.dna?.species)
		return user.dna.species?.get_yawn_sound(user)
	if(!.)
		return ..()

/datum/emote/living/carbon/human/salute
	emote_type = EMOTE_AUDIBLE
	var/list/funny_shoes = list(/obj/item/clothing/shoes/clown_shoes)

/datum/emote/living/carbon/human/salute/get_sound(mob/living/carbon/human/user)
	if(is_type_in_list(user.shoes, funny_shoes))
		return 'sound/items/toysqueak1.ogg'
	else
		return 'modular_dripstation/sound/emotes/salute.ogg'

/datum/emote/living/carbon/sweatdrop
	key = "sweatdrop"
	key_third_person = "sweatdrops"
	message = "sweats"
	emote_type = EMOTE_ANIMATED
	vary = TRUE
	overlay_icon_state = "sweatdrop"
	overlay_x_offset = 10
	overlay_y_offset = 10
	emote_length = 3 SECONDS
	sound = 'modular_dripstation/sound/emotes/sweatdrop.ogg'

/datum/emote/living/blush
	emote_type = EMOTE_ANIMATED
	overlay_icon_state = "blush"
	emote_length = 5 SECONDS
	directional = TRUE
	emote_layer = BODY_LAYER
	sound = 'modular_dripstation/sound/emotes/blush.ogg' //Skyrat port

/datum/emote/living/carbon/annoyed
	key = "annoyed"
	emote_type = EMOTE_ANIMATED
	vary = TRUE
	overlay_icon_state = "annoyed"
	overlay_x_offset = 10
	overlay_y_offset = 10
	emote_length = 5 SECONDS
	sound = 'modular_dripstation/sound/emotes/annoyed.ogg'

/datum/emote/living/carbon/glasses
	key = "glasses"
	message = "pushes up their glasses"
	emote_type = EMOTE_ANIMATED
	overlay_icon_state = "glasses"
	emote_length = 1 SECONDS
	directional = TRUE

/datum/emote/living/carbon/glasses/can_run_emote(mob/user, status_check = TRUE, intentional)
	if(!..())
		return FALSE
	return istype(user.get_item_by_slot(ITEM_SLOT_EYES), /obj/item/clothing/glasses)

/datum/emote/living/pout
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/roar
	key = "roar"
	key_third_person = "roars"
	message = "roars."
	message_param = "roars at %t!"
	emote_type = EMOTE_AUDIBLE
	emote_length = 2 SECONDS
	cooldown = 3 SECONDS
	var/list/viable_tongues = list(/obj/item/organ/tongue/lizard, /obj/item/organ/tongue/polysmorph)

/datum/emote/living/carbon/roar/can_run_emote(mob/living/user, status_check = TRUE, intentional)
	if(!ishuman(user))
		return FALSE
	var/mob/living/carbon/human/H = user
	var/obj/item/organ/tongue/T = H.getorganslot(ORGAN_SLOT_TONGUE)
	return is_type_in_list(T, viable_tongues)

/datum/emote/living/carbon/roar/get_sound(mob/living/carbon/human/user)
	return pick('modular_dripstation/sound/emotes/unathi/roar_1.ogg', 'modular_dripstation/sound/emotes/unathi/roar_2.ogg', 'modular_dripstation/sound/emotes/unathi/roar_3.ogg')

// Tail thump! Lizard-tail exclusive emote.
/datum/emote/living/carbon/human/tailwhip
	key = "whip"
	key_third_person = "whips their tail"
	message = "whips their tail!"
	message_param = "whips %t with their tail!"
	emote_type = EMOTE_AUDIBLE
	emote_length = 2 SECONDS
	cooldown = 10 SECONDS

/datum/emote/living/carbon/human/tailwhip/get_sound(mob/living/user)
	return pick('modular_dripstation/sound/emotes/unathi/whip.ogg', 'modular_dripstation/sound/emotes/unathi/whip_short.ogg')

/datum/emote/living/carbon/human/tailwhip/can_run_emote(mob/user, status_check = TRUE, intentional)
	. = ..()
	if(!.)
		return FALSE
	var/mob/living/carbon/human/H = user
	if(!istype(H) || !H.dna || !H.dna.species)
		return FALSE
	if(H.IsParalyzed() || H.IsStun()) // No whiping allowed. Taken from can_wag_tail().
		return FALSE
	return ("tail_lizard" in H.dna.species.mutant_bodyparts) || ("waggingtail_lizard" in H.dna.species.mutant_bodyparts)

/datum/emote/living/carbon/human/tailwhip/run_emote(mob/user, params, type_override, intentional, mob/living/carbon/human/target)
	. = ..()
	if(. && ishuman(target))
		var/distance = get_dist(target, usr)
		if(distance <= 1 && prob(30))
			target.Knockdown(1 SECONDS)

/datum/emote/living/carbon/threat
	key = "threat"
	key_third_person = "threats"
	message = "threats."
	message_param = "threats %t!"
	emote_type = EMOTE_AUDIBLE
	emote_length = 2 SECONDS
	cooldown = 3 SECONDS
	var/list/viable_tongues = list(/obj/item/organ/tongue/lizard, /obj/item/organ/tongue/polysmorph)

/datum/emote/living/carbon/threat/can_run_emote(mob/living/user, status_check = TRUE, intentional)
	if(!ishuman(user))
		return FALSE
	var/mob/living/carbon/human/H = user
	var/obj/item/organ/tongue/T = H.getorganslot(ORGAN_SLOT_TONGUE)
	return is_type_in_list(T, viable_tongues)

/datum/emote/living/carbon/threat/get_sound(mob/living/carbon/human/user)
	return pick('modular_dripstation/sound/emotes/unathi/threat_1.ogg', 'modular_dripstation/sound/emotes/unathi/threat_2.ogg')

/datum/emote/living/carbon/rumble
	key = "rumble"
	key_third_person = "rumbles"
	message = "rumbles."
	message_param = "rumbles at %t!"
	emote_type = EMOTE_AUDIBLE
	emote_length = 2 SECONDS
	cooldown = 3 SECONDS
	var/list/viable_tongues = list(/obj/item/organ/tongue/lizard, /obj/item/organ/tongue/polysmorph)

/datum/emote/living/carbon/rumble/can_run_emote(mob/living/user, status_check = TRUE, intentional)
	if(!ishuman(user))
		return FALSE
	var/mob/living/carbon/human/H = user
	var/obj/item/organ/tongue/T = H.getorganslot(ORGAN_SLOT_TONGUE)
	return is_type_in_list(T, viable_tongues)

/datum/emote/living/carbon/rumble/get_sound(mob/living/carbon/human/user)
	return pick('modular_dripstation/sound/emotes/unathi/rumble_1.ogg', 'modular_dripstation/sound/emotes/unathi/rumble_2.ogg')

/datum/emote/living/carbon/human/cough/can_run_emote(mob/living/user, status_check = TRUE, intentional)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.failed_last_breath)
			return FALSE
	return ..()
