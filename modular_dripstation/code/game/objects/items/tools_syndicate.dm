/obj/item/wrench/nuke
	name = "fancy wrench"
	desc = "It's one of those fancy wrenches that you turn backward without twisting the bolt for faster action."
	icon = 'modular_dripstation/icons/obj/tools.dmi'
	icon_state = "wrench_syndie"
	item_state = "wrench_syndie"
	toolspeed = 0.5

/obj/item/wrench/combat
	name = "combat wrench"
	desc = "It's like a normal wrench but edgier. Can be found on the battlefield."
	icon = 'modular_dripstation/icons/obj/tools.dmi'
	icon_state = "wrench_combat"
	item_state = "wrench_combat"
	tool_behaviour = null
	toolspeed = null
	var/on = FALSE

/obj/item/wrench/combat/attack_self(mob/living/user)
	if(on)
		on = FALSE
		force = initial(force)
		w_class = initial(w_class)
		throwforce = initial(throwforce)
		tool_behaviour = initial(tool_behaviour)
		attack_verb = list("bopped")
		toolspeed = initial(toolspeed)
		playsound(user, 'sound/weapons/saberoff.ogg', 35, TRUE)
		to_chat(user, "<span class='warning'>[src] can now be kept at bay.</span>")
	else
		on = TRUE
		force = 15
		w_class = WEIGHT_CLASS_NORMAL
		throwforce = 10
		tool_behaviour = TOOL_WRENCH
		attack_verb = list("devastated", "brutalized", "committed a war crime against", "obliterated", "humiliated")
		toolspeed = 0.33
		hitsound = 'sound/weapons/blade1.ogg'
		playsound(user, 'sound/weapons/saberon.ogg', 35, TRUE)
		to_chat(user, "<span class='warning'>[src] is now active. Woe onto your enemies!</span>")
	update_icons()

/obj/item/wrench/combat/proc/update_icons()
	if(on)
		icon_state = "[initial(icon_state)]_on"
		item_state = "[initial(item_state)]1"
	else
		icon_state = "[initial(icon_state)]"
		item_state = "[initial(item_state)]"

/obj/item/wirecutters/nuke
	name = "nonstandart wirecutters"
	desc = "The blades of these wirecutters have suspiciously fine serrated teeth."
	icon = 'modular_dripstation/icons/obj/tools.dmi'
	icon_state = "wirecutters_syndie"
	item_state = "wirecutters_syndie"
	toolspeed = 0.5
	random_color = FALSE

/obj/item/crowbar/nuke
	name = "special crowbar"
	desc = "It has special counterweights that adjust to the amount of pressure put on it by using a complex array of springs and screws."
	icon = 'modular_dripstation/icons/obj/tools.dmi'
	icon_state = "crowbar_syndie"
	item_state = "crowbar_syndie"
	toolspeed = 0.5
	force = 8

/obj/item/weldingtool/hugetank/nuke
	desc = "An upgraded welder based of the industrial welder. Has remarkable painting and more stealthy welding flash."
	icon = 'modular_dripstation/icons/obj/tools.dmi'
	icon_state = "syndiewelder"
	item_state = "syndiewelder"
	toolspeed = 0.5
	light_range = 1

/obj/item/inducer/nuke
	desc = "A tool for inductively charging internal power cells. This one has a suspicious colour scheme, and seems to be rigged to transfer charge at a much faster rate."
	icon = 'modular_dripstation/icons/obj/tools.dmi'
	icon_state = "inducer-syndi"
	item_state = "inducer-syndi"
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	powertransfer = 2000
	cell_type = /obj/item/stock_parts/cell/super

/obj/item/jawsoflife/syndicate
	name = "red jaws of life"
	desc = "A pocket sized re-engineered copy of Nanotrasen's standard jaws of life. Can be used to force open airlocks in its crowbar configuration."
	icon = 'modular_dripstation/icons/obj/tools.dmi'
	icon_state = "syndie_pry"
	item_state = "jawsoflife_syndie"
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	toolspeed = 0.5

/obj/item/jawsoflife/syndicate/transform_crowbar(mob/user)
	tool_behaviour = TOOL_CROWBAR
	icon = 'modular_dripstation/icons/obj/tools.dmi'
	icon_state = "syndie_pry"
	playsound(get_turf(user), 'sound/items/change_jaws.ogg', 50, 1)
	if (iscyborg(user))
		to_chat(user,span_notice("Your servos whirr as the cutting head reconfigures into a prying head."))
	else
		to_chat(user, span_notice("You attach the pry jaws to [src]."))
	update_appearance(UPDATE_ICON)

/obj/item/jawsoflife/syndicate/transform_cutters(mob/user)
	attack_verb = list("pinched", "nipped")
	icon_state = "syndie_cutter"
	hitsound = 'sound/items/jaws_cut.ogg'
	usesound = 'sound/items/jaws_cut.ogg'
	tool_behaviour = TOOL_WIRECUTTER
	playsound(get_turf(user), 'sound/items/change_jaws.ogg', 50, 1)
	if (iscyborg(user))
		to_chat(user,span_notice("Your servos whirr as the prying head reconfigures into a cutting head."))
	else
		to_chat(user, span_notice("You attach the cutting jaws to [src]."))
	update_appearance(UPDATE_ICON)

/obj/item/construction/rcd/combat
	name = "combat RCD"
	delay_mod = 0.8
	icon = 'modular_dripstation/icons/obj/tools.dmi'

/obj/item/multitool/ai_detect/red
	name = "obvious device"
	desc = "Syndicate device disguised as a multitool. Something is definitely wrong with it."
	icon = 'modular_dripstation/icons/obj/tools.dmi'
	icon_state = "redmultitool"
	item_state = "redmultitool"
	toolspeed = 0.33

/obj/item/storage/toolbox/syndicate/PopulateContents()
	new /obj/item/screwdriver/nuke(src)
	new /obj/item/wrench/nuke(src)
	new /obj/item/weldingtool/largetank(src)
	new /obj/item/crowbar/nuke(src)
	new /obj/item/wirecutters/nuke(src)
	new /obj/item/multitool/ai_detect(src)
	new /obj/item/clothing/gloves/combat(src)
	//YOGS start - toolspeed
	for(var/obj/item/I in contents)
		I.toolspeed = 0.5

/obj/item/storage/toolbox/syndicate/real
	name = "syndicate toolbox"

/obj/item/storage/toolbox/syndicate/real/PopulateContents()
	new /obj/item/screwdriver/nuke(src)
	new /obj/item/wrench/nuke(src)
	new /obj/item/weldingtool/hugetank/nuke(src)
	new /obj/item/crowbar/nuke(src)
	new /obj/item/wirecutters/nuke(src)
	new /obj/item/multitool/ai_detect(src)
	new /obj/item/clothing/gloves/combat(src)
	for(var/obj/item/I in contents)
		I.toolspeed = 0.33
		I.name = "syndicate [I.name]"

/obj/item/storage/belt/military/syndicate_eng
	name = "/improper battle engineer`s belt"
	desc = "Engineer is engihere!"

/obj/item/storage/belt/military/syndicate_eng/PopulateContents()
	new /obj/item/screwdriver/nuke(src)
	new /obj/item/wrench/combat(src)
	new /obj/item/weldingtool/hugetank/nuke(src)
	new /obj/item/jawsoflife/syndicate(src)
	new /obj/item/multitool/ai_detect/red(src)
	new /obj/item/inducer/nuke(src)
	new /obj/item/clothing/gloves/combat(src)
	for(var/obj/item/I in contents)
		I.toolspeed = 0.33
		I.name = "syndicate [I.name]"