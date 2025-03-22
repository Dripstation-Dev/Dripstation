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
