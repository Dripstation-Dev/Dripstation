/obj/item/stack/tape
	name = "tape"
	singular_name = "tape"
	desc = "Used for sticking things together."
	icon = 'icons/obj/tapes.dmi'
	icon_state = "tape_w"
	item_flags = NOBLUDGEON
	amount = 1
	max_amount = 5
	resistance_flags = FLAMMABLE
	item_state = null
	grind_results = list(/datum/reagent/cellulose = 5)
	//var/maximum_weight_class = WEIGHT_CLASS_SMALL
	//var/static/list/tape_blacklist = typecacheof(/obj/item/grenade, /obj/item/slime_extract, /obj/item/slimecross, /obj/item/orion_ship) //stuff you can't take that may or may not be max_weight_class
	var/list/conferred_embed = EMBED_HARMLESS
	///The tape type you get when ripping off a piece of tape.
	var/obj/tape_gag = /obj/item/clothing/mask/muzzle/tape

/*
/obj/item/stack/tape/attack(mob/living/M, mob/user)
	. = ..()
	if(user.zone_selected == BODY_ZONE_PRECISE_MOUTH)
		var/obj/item/clothing/mask/muzzle/tape/tape_muzzle = new()
		if(!tape_muzzle.mob_can_equip(M, null, ITEM_SLOT_MASK, TRUE, TRUE))
			to_chat(user, span_warning("You can't tape [M]'s mouth shut!"))
			return
		playsound(user, 'sound/effects/tape.ogg', 25)
		M.visible_message(span_danger("[user] is trying to put [tape_muzzle.name] on [M]!"), span_userdanger("[user] is trying to put [tape_muzzle.name] on [M]!"))
		if(!do_after(user, 2 SECONDS, M))
			qdel(tape_muzzle)
			return
		if(!M.equip_to_slot_or_del(tape_muzzle, ITEM_SLOT_MASK, user))
			to_chat(user, span_warning("You fail tape [M]'s mouth shut!"))
			qdel(tape_muzzle)
			return
		use(1)
	else
		to_chat(user,span_warning("You must be targetting the mouth to tape [M.p_their()] mouth!"))

/obj/item/stack/tape/afterattack(atom/target, mob/user, proximity)
	if(!proximity || !istype(target, /obj/item))
		return
	var/obj/item/I = target
	if(I.is_sharp())
		to_chat(user, span_warning("[I] would cut the tape if you tried to wrap it!"))
		return
	if(I.w_class > maximum_weight_class)
		to_chat(user, span_warning("[I] is too big!"))
		return
	var/list/item_contents = I.get_all_contents()
	for(var/obj/item/C in item_contents)
		if(is_type_in_typecache(C,tape_blacklist))
			to_chat(user, span_warning("The [src] doesn't seem to stick to [I]!"))
			return
	to_chat(user, span_info("You wrap [I] with [src]."))
	use(1)
	I.embedding = I.embedding.setRating(100, fall_chance, 0, 0, 0, 0, removal_pain, removal_time, TRUE, 0)
	I.taped = TRUE
*/

/obj/item/stack/tape/attack_hand(mob/user, list/modifiers)
	if(user.get_inactive_held_item() == src)
		if(is_zero_amount(delete_if_zero = TRUE))
			return
		playsound(user, 'modular_dripstation/sound/item/duct_tape_rip.ogg', 50, TRUE)
		if(!do_after(user, 1 SECONDS))
			return
		var/new_tape_gag = new tape_gag(src)
		user.put_in_hands(new_tape_gag)
		use(1)
		to_chat(user, span_notice("You rip off a piece of tape."))
		playsound(user, 'modular_dripstation/sound/item/duct_tape_snap.ogg', 50, TRUE)
		return TRUE
	return ..()

/obj/item/stack/tape/examine(mob/user)
	. = ..()
	. += "[span_notice("You could rip a piece off by using an empty hand.")]"

/obj/item/stack/tape/afterattack(obj/item/target, mob/living/user, proximity)
	if(!proximity)
		return

	if(!istype(target))
		return

	if(target.embedding && target.embedding == conferred_embed)
		to_chat(user, span_warning("[target] is already coated in [src]!"))
		return .

	user.visible_message(span_notice("[user] begins wrapping [target] with [src]."), span_notice("You begin wrapping [target] with [src]."))
	playsound(user, 'modular_dripstation/sound/item/duct_tape_rip.ogg', 50, TRUE)

	if(do_after(user, 3 SECONDS, target=target))
		playsound(user, 'modular_dripstation/sound/item/duct_tape_snap.ogg', 50, TRUE)
		use(1)
		if(istype(target, /obj/item/clothing/gloves/fingerless))
			var/obj/item/clothing/gloves/tackler/offbrand/O = new /obj/item/clothing/gloves/tackler/offbrand
			to_chat(user, span_notice("You turn [target] into [O] with [src]."))
			QDEL_NULL(target)
			user.put_in_hands(O)
			return .

		if(target.embedding && target.embedding == conferred_embed)
			to_chat(user, span_warning("[target] is already coated in [src]!"))
			return .

		target.embedding = conferred_embed
		target.updateEmbedding()
		to_chat(user, span_notice("You finish wrapping [target] with [src]."))

		//if(isgrenade(target))
			//var/obj/item/grenade/sticky_bomb = target
			//sticky_bomb.sticky = TRUE

	return .

/obj/item/stack/tape/guerrilla
	name = "guerrilla tape"
	singular_name = "guerrilla tape"
	desc = "A suspicious looking roll of tape. It seems to be much more adhesive than the standard variety."
	icon_state = "tape_evil"
	amount = 5
	conferred_embed = EMBED_POINTY_SUPERIOR
	//fall_chance = 5
	//maximum_weight_class = WEIGHT_CLASS_BULKY
	tape_gag = /obj/item/clothing/mask/muzzle/tape/pointy/super

/obj/item/clothing/mask/muzzle/tape
	name = "tape piece"
	desc = "A piece of tape that can be put over someone's mouth."
	icon_state = "tape_piece"
	worn_icon_state = "tape_piece_worn"
	item_state = null
	w_class = WEIGHT_CLASS_TINY
	equip_delay_other = 40
	strip_delay = 40
	greyscale_config = /datum/greyscale_config/tape_piece
	greyscale_config_worn = /datum/greyscale_config/tape_piece/worn
	greyscale_colors = "#B2B2B2"
	///Dertermines whether the tape piece does damage when ripped off of someone.
	var/harmful_strip = FALSE
	///The ammount of damage dealt when the tape piece is ripped off of someone.
	var/stripping_damage = 0

/datum/armor/muzzle_breath
	bio = 100

/obj/item/clothing/mask/muzzle/tape/examine(mob/user)
	. = ..()
	. += "[span_notice("Use it on someone while not in combat mode to tape their mouth closed!")]"

/obj/item/clothing/mask/muzzle/tape/dropped(mob/living/user)
	. = ..()
	if(user.get_item_by_slot(ITEM_SLOT_MASK) != src)
		return
	playsound(user, 'modular_dripstation/sound/item/duct_tape_rip.ogg', 50, TRUE)
	if(harmful_strip)
		user.apply_damage(stripping_damage, BRUTE, BODY_ZONE_HEAD)
		INVOKE_ASYNC(user, TYPE_PROC_REF(/mob, emote), "scream")
		to_chat(user, span_userdanger("You feel a massive pain as hundreds of tiny spikes tear free from your face!"))

/obj/item/clothing/mask/muzzle/tape/attack(mob/living/carbon/victim, mob/living/carbon/attacker, params)
	if(attacker.a_intent == INTENT_HARM)
		return ..()
	if(victim.is_mouth_covered(ITEM_SLOT_HEAD))
		to_chat(attacker, span_notice("[victim]'s mouth is covered."))
		return
	if(!mob_can_equip(victim, ITEM_SLOT_MASK))
		to_chat(attacker, span_notice("[victim] is already wearing somthing on their face."))
		return
	balloon_alert(attacker, "taping mouth...")
	to_chat(victim, span_userdanger("[attacker] is attempting to tape your mouth closed!"))
	if(!do_after(attacker, equip_delay_other, target = victim))
		return
	victim.equip_to_slot_if_possible(src, ITEM_SLOT_MASK)
	update_appearance()

/obj/item/clothing/mask/muzzle/tape/pointy
	name = "pointy tape piece"
	desc = "A piece of tape that can be put over someone's mouth. Looks like it will hurt if this is ripped off."
	icon_state = "tape_piece_spikes"
	worn_icon_state = "tape_piece_spikes_worn"
	greyscale_config = /datum/greyscale_config/tape_piece/spikes
	greyscale_config_worn = /datum/greyscale_config/tape_piece/worn/spikes
	greyscale_colors = "#E64539#AD2F45"
	harmful_strip = TRUE
	stripping_damage = 10

/obj/item/clothing/mask/muzzle/tape/pointy/super
	name = "super pointy tape piece"
	desc = "A piece of tape that can be put over someone's mouth. This thing could rip your face into a thousand pieces if ripped off."
	greyscale_colors = "#8C0A00#300008"
	strip_delay = 60
	stripping_damage = 20

//
// TAPE
//
/datum/greyscale_config/tape_piece
	name = "Tape Piece"
	icon_file = 'modular_dripstation/icons/obj/tapes.dmi'
	json_config = 'code/datums/greyscale/json_configs/tape_piece.json'

/datum/greyscale_config/tape_piece/spikes
	name = "Spiked Tape Piece"
	icon_file = 'modular_dripstation/icons/obj/tapes.dmi'
	json_config = 'code/datums/greyscale/json_configs/tape_piece_spikes.json'

/datum/greyscale_config/tape_piece/worn
	name = "Worn Tape Piece"
	icon_file = 'modular_dripstation/icons/obj/tapes.dmi'
	json_config = 'code/datums/greyscale/json_configs/tape_piece_worn.json'

/datum/greyscale_config/tape_piece/worn/spikes
	name = "Worn Spiked Tape Piece"
	icon_file = 'modular_dripstation/icons/obj/tapes.dmi'
	json_config = 'code/datums/greyscale/json_configs/tape_piece_spikes_worn.json'
