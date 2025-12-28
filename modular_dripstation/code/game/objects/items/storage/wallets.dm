////Wallets////
/obj/item/storage/wallet
	icon = 'modular_dripstation/icons/obj/storage/wallets.dmi'
	var/cached_flat_icon

/obj/item/storage/wallet/Initialize(mapload)
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_SMALL
	STR.max_items = 4
	STR.set_holdable(list(
		/obj/item/stack/spacecash,
		/obj/item/holochip,
		/obj/item/card,
		/obj/item/clothing/mask/cigarette,
		/obj/item/flashlight/pen,
		/obj/item/seeds,
		/obj/item/stack/medical,
		/obj/item/toy/crayon,
		/obj/item/coin,
		/obj/item/dice,
		/obj/item/disk,
		/obj/item/implanter,
		/obj/item/laser_pointer,
		/obj/item/lighter,
		/obj/item/lipstick,
		/obj/item/match,
		/obj/item/paper,
		/obj/item/pen,
		/obj/item/photo,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/pill,
		/obj/item/screwdriver,
		/obj/item/stamp),
		list(/obj/item/handdrill))

/obj/item/storage/wallet/Exited(atom/movable/gone, direction)
	. = ..()
	if(isidcard(gone))
		refreshID()

/**
 * Calculates the new front ID.
 *
 * Picks the ID card that has the most combined command or higher tier accesses.
 */
/obj/item/storage/wallet/proc/refreshID()
	LAZYCLEARLIST(combined_access)

	front_id = null
	var/winning_tally = 0
	var/is_magnetic_found = FALSE
	for(var/obj/item/card/id/id_card in contents)
		// Certain IDs can forcibly jump to the front so they can disguise other cards in wallets. Chameleon/Agent ID cards are an example of this.
		if(!is_magnetic_found && HAS_TRAIT(id_card, TRAIT_MAGNETIC_ID_CARD))
			front_id = id_card
			is_magnetic_found = TRUE

		if(!is_magnetic_found)
			var/card_tally = tally_access(id_card, 7)
			if(card_tally > winning_tally)
				winning_tally = card_tally
				front_id = id_card

		LAZYINITLIST(combined_access)
		combined_access |= id_card.access

	// If we didn't pick a front ID - Maybe none of our cards have any command accesses? Just grab the first card (if we even have one).
	// We could also have no ID card in the wallet at all, which will mean we end up with a null front_id and that's fine too.
	if(!front_id)
		front_id = (locate(/obj/item/card/id) in contents)

	if(ishuman(loc))
		var/mob/living/carbon/human/wearing_human = loc
		if(wearing_human.wear_id == src)
			wearing_human.sec_hud_set_ID()

	update_label()
	update_appearance(UPDATE_ICON)
	update_slot_icon()

/obj/item/storage/wallet/proc/tally_access(obj/item/card/id/id_card, region_access = 1)
	var/tally = 0

	var/list/id_card_access = id_card.access
	var/list/access_check = get_region_accesses(region_access)
	for(var/access in id_card_access)
		if(access in access_check)
			tally++

	return tally

/obj/item/storage/wallet/Entered(atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	. = ..()
	if(isidcard(arrived))
		refreshID()

/obj/item/storage/wallet/update_overlays()
	. = ..()
	cached_flat_icon = null
	if(!front_id)
		icon_state = base_icon_state
		return
	. += mutable_appearance(front_id.icon, front_id.icon_state)
	. += front_id.ID_fluff()
	. += front_id.overlays
	. += mutable_appearance(icon, "[base_icon_state]_overlay")

/obj/item/storage/wallet/proc/get_cached_flat_icon()
	if(!cached_flat_icon)
		cached_flat_icon = getFlatIcon(src)
	return cached_flat_icon

/obj/item/storage/wallet/get_examine_string(mob/user, thats = FALSE)
	if(front_id)
		return "[icon2html(get_cached_flat_icon(), user)] [thats? "That's ":""][get_examine_name(user)]" //displays all overlays in chat
	return ..()

/obj/item/storage/wallet/proc/update_label()
	if(front_id)
		name = "[initial(name)] displaying [front_id]"
	else
		name = "[initial(name)]"

/*
/obj/item/storage/wallet/examine()
	. = ..()
	if(front_id)
		. += span_notice("Alt-click to remove the id.")
*/

/obj/item/storage/wallet/GetID()
	return front_id

/obj/item/storage/wallet/RemoveID()
	if(!front_id)
		return
	. = front_id
	front_id.forceMove(get_turf(src))

/obj/item/storage/wallet/InsertID(obj/item/inserting_item)
	var/obj/item/card/inserting_id = inserting_item.RemoveID()
	if(!inserting_id)
		return FALSE
	attackby(inserting_id)
	if(inserting_id in contents)
		return TRUE
	return FALSE

/obj/item/storage/wallet/GetAccess()
	if(LAZYLEN(combined_access))
		return combined_access
	else
		return ..()

/obj/item/storage/wallet/black
	icon_state = "wallet_black"
	base_icon_state = "wallet_black"

/datum/passport
	var/registered_name = null
	var/registered_age = null
	var/registered_gender = null
	var/passport_id = null
	var/fake_passport = FALSE

/datum/passport/New()
	if(!fake_passport)
		var/limiter = 0
		while(limiter < 10)
			passport_id = rand(111111,999999)
			if(!("[passport_id]" in SSeconomy.passport_ids))
				break
			limiter += 1
	
		if(limiter >= 10)
			message_admins("Infinite loop prevented in bank account creation, unable to find bank account after [limiter] tries. Something has broken.")
		SSeconomy.passport_ids["[passport_id]"] = src

/datum/passport/agent
	fake_passport = TRUE

/obj/item/storage/wallet/passport
	name = "passport"
	desc = "Some passport. It is obvious that something with it isn`t right."
	icon_state = "passport"
	base_icon_state = "passport"
	var/datum/passport/pass_datum
	var/pass_datum_type = /datum/passport

/obj/item/storage/wallet/passport/Initialize(mapload)
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.set_holdable(list(
		/obj/item/stack/spacecash,
		/obj/item/holochip,
		/obj/item/card,
		/obj/item/coin,
		/obj/item/disk,
		/obj/item/paper))
	pass_datum = new pass_datum_type

/obj/item/storage/wallet/passport/examine()
	. = ..()
	if(pass_datum?.registered_name)
		. += span_notice("This passport belongs to [pass_datum.registered_name].")
	if(pass_datum?.registered_gender)
		. += span_notice("The passport indicates that the holder is [pass_datum.registered_gender].")
	if(pass_datum?.registered_age)
		. += span_notice("The passport indicates that the holder is [pass_datum.registered_age] years old.")
	if(pass_datum?.passport_id)
		. += span_notice("The passport indicates [pass_datum.passport_id] ID.")
	if(!pass_datum?.registered_name || !pass_datum?.registered_age || !pass_datum?.passport_id || !pass_datum?.registered_gender || (usr.mind?.special_role && pass_datum?.fake_passport))
		. += span_danger("This passport seems to be fake!")

/obj/item/storage/wallet/passport/proc/generate_pass_data(mob/living/carbon/human/H)
	pass_datum?.registered_name = H.real_name
	pass_datum?.registered_age = H.age
	pass_datum?.registered_gender = H.gender

/obj/item/storage/wallet/passport/agent
	pass_datum_type = /datum/passport/agent
	syndicate = TRUE

/obj/item/storage/wallet/passport/agent/examine(mob/user)
	. = ..()
	if(isliving(user) && user.mind && user.mind?.special_role)
		. += span_notice("This passport`s data can be tweaked on Ctrl Click.")

/obj/item/storage/wallet/passport/agent/Initialize(mapload)
	. = ..()
	var/datum/action/item_action/chameleon/change/chameleon_action = new(src)
	chameleon_action.syndicate = TRUE
	chameleon_action.chameleon_type = /obj/item/storage/wallet/passport
	chameleon_action.chameleon_name = "Passport"
	chameleon_action.initialize_disguises()

/obj/item/storage/wallet/passport/agent/CtrlClick(mob/living/user)
	if(!isliving(user) || !user.mind || !user.mind?.special_role)
		return ..()
	var/input_name = tgui_input_text(user, "What name would you like to put on this passport? Leave blank to randomise.", "Agent passport name", pass_datum?.registered_name ? pass_datum?.registered_name : (ishuman(user) ? user.real_name : user.name), MAX_NAME_LEN)
	input_name = reject_bad_name(input_name, TRUE) //some species (IPCs) can have numbers in their name
	if(!input_name)
		// Invalid/blank names give a randomly generated one.
		if(user.gender == FEMALE)
			input_name = "[pick(GLOB.first_names_female)] [pick(GLOB.last_names)]"
		else
			input_name = "[pick(GLOB.first_names_male)] [pick(GLOB.last_names)]"
	
	var/new_passport_id = tgui_input_number(user, "Enter the passport ID to associate with this passport.", "Link passport ID", 111111, 999999, 111111)
	if (isnull(new_passport_id))
		return

	pass_datum?.registered_age = tgui_input_number(user, "Choose the passport's registered age:\n([AGE_MIN]-[AGE_MAX])", "Agent passport age", default = 18, max_value = AGE_MAX, min_value = AGE_MIN)
	var/gender_type = tgui_input_text(user, "What gender would you like to put on this passport? Leave blank to randomise.", "Agent passport name", pass_datum?.registered_gender ? pass_datum?.registered_gender : user.gender, MAX_NAME_LEN)
	if (isnull(gender_type))
		gender_type = pick(MALE, FEMALE)
	pass_datum?.registered_gender = gender_type
	pass_datum?.registered_name = input_name
	pass_datum?.passport_id = new_passport_id
	

/obj/item/storage/wallet/passport/terragovlow
	name = "terragov passport (Citizenship Rank 4)"
	desc = "Terra Government official passport. Lowest rank Citizenship."
	icon_state = "passport_terragov4"
	base_icon_state = "passport_terragov4"

/obj/item/storage/wallet/passport/terragovmilitary
	name = "terragov passport (Citizenship Rank 3)"
	desc = "Terra Government official passport. Report for duty."
	icon_state = "passport_terragov3"
	base_icon_state = "passport_terragov3"

/obj/item/storage/wallet/passport/tmc
	name = "tmc passport"
	desc = "Trade Military Coalition official passport. Probably made from some kind of lizard skin."
	icon_state = "passport_tmc"
	base_icon_state = "passport_tmc"

/obj/item/storage/wallet/passport/lizard
	name = "empire passport"
	desc = "Moges Empire official passport. Behold, Mogesss forever!"
	icon_state = "passport_lizard"
	base_icon_state = "passport_lizard"

/obj/item/storage/wallet/passport/ussp
	name = "ussp passport"
	desc = "Union of Soviet Socialist Planets official passport. Unionize against corporate scum!"
	icon_state = "passport_ussp"
	base_icon_state = "passport_ussp"

/obj/item/storage/wallet/passport/ancap
	name = "ACC passport"
	desc = "Anarchic Capitalist Confederation official passport. Unionize against socialist scum!"
	icon_state = "passport_ancap"
	base_icon_state = "passport_ancap"
