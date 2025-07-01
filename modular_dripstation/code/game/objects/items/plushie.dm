/obj/item/toy/plush/blahaj
	desc = "A smaller, friendlier, and fluffier version of the real thing. It can play silly sound by pressing button on its belly."
	gender = FEMALE
	w_class = WEIGHT_CLASS_NORMAL
	var/cool = FALSE

/obj/item/toy/plush/blahaj/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands = TRUE)

/obj/item/toy/plush/blahaj/AltClick(mob/user)
	if(cool)
		return ..()

	playsound(src, 'modular_dripstation/sound/item/rawr.ogg', 25, 0)
	visible_message(span_boldnotice("Rawr!"))
	cool = TRUE
	addtimer(VARSET_CALLBACK(src, cool, FALSE), 3 SECONDS)

/obj/item/toy/plush/dakimakura
	name = "Dakimakura"
	desc = "Some dakimakura."
	icon = 'modular_dripstation/icons/obj/dakimakura.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/equipment/kinky_left.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/equipment/kinky_right.dmi'
	gender = FEMALE
	w_class = WEIGHT_CLASS_NORMAL
	var/alt_icon_state
	var/altstate = FALSE

/obj/item/toy/plush/dakimakura/examine(mob/user)
	. = ..()
	. += span_notice("Ctrl-click [src] to reverse it.")

/obj/item/toy/plush/dakimakura/CtrlClick(mob/user)
	if(can_interact(user))
		if(altstate)
			icon_state = initial(icon_state)
			item_state = initial(item_state)
		else
			icon_state = alt_icon_state
			item_state = alt_icon_state
		altstate = !altstate
		update_appearance(UPDATE_ICON_STATE)
		user.update_inv_hands()

/obj/item/toy/plush/dakimakura/xeno
	name = "Xenowife dakimakura"
	desc = "Dakimakura with xenowife."
	icon_state = "xeno-maid"
	alt_icon_state = "xeno-nude"
	squeak_override = list('sound/voice/lowHiss2.ogg'= 1)
	var/cool = FALSE

/obj/item/toy/plush/dakimakura/xeno/AltClick(mob/user)
	if(cool)
		return ..()

	playsound(src, pick('sound/voice/lowHiss2.ogg', 'sound/voice/lowHiss3.ogg', 'sound/voice/lowHiss4.ogg'), 40, 0, -5)
	cool = TRUE
	addtimer(VARSET_CALLBACK(src, cool, FALSE), 3 SECONDS)

/obj/item/toy/plush/dakimakura/vulpa
	name = "Vulpawife dakimakura"
	desc = "Dakimakura with vulpa. You feel like degenerate."
	icon_state = "vulp-kinky"
	alt_icon_state = "vulp-nude"
	squeak_override = list('modular_dripstation/sound/voice/uwu.ogg'= 1)
