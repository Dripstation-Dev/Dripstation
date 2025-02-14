/obj/item/storage/pouch
	name = "abstract pouch"
	icon = 'modular_dripstation/icons/obj/storage/pouches.dmi'
	icon_state = "small_drop"
	w_class = WEIGHT_CLASS_BULKY //does not fit in backpack
	slot_flags = ITEM_SLOT_RPOCKET|ITEM_SLOT_LPOCKET
	var/draw_mode = 0
	var/max_w_class = WEIGHT_CLASS_SMALL
	var/storage_slots = 1
	var/max_storage_space
	var/list/can_hold = list()
	var/list/cant_hold = list()
	var/fill_type
	var/fill_number
	var/list/storage_type_lim = list()
	var/silent


/obj/item/storage/pouch/Initialize(mapload)
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.allow_quick_gather = FALSE
	STR.allow_quick_empty = FALSE
	STR.display_numerical_stacking = FALSE
	STR.click_gather = FALSE
	STR.quickdraw = draw_mode
	
	STR.max_w_class = max_w_class
	if(!max_storage_space)
		STR.max_combined_w_class = max_w_class * storage_slots
	else
		STR.max_combined_w_class = max_storage_space
	STR.max_items = storage_slots
	STR.storage_type_limits = storage_type_lim
	STR.set_holdable(can_hold, null)

	if(fill_number && fill_type)
		for(var/i in 1 to fill_number)
			new fill_type(src)

/obj/item/storage/pouch/examine(mob/user)
	. = ..()
	. += "Can be worn by attaching it to a pocket."

/obj/item/storage/pouch/equipped(mob/user, slot)
	if(slot == ITEM_SLOT_RPOCKET || slot == ITEM_SLOT_LPOCKET)
		mouse_opacity = MOUSE_OPACITY_OPAQUE //so it's easier to click when properly equipped.
	..()

/obj/item/storage/pouch/dropped(mob/user)
	mouse_opacity = initial(mouse_opacity)
	..()

/obj/item/storage/pouch/general
	name = "light general pouch"
	desc = "A general purpose pouch used to carry small items."
	icon_state = "small_drop"
	draw_mode = 1
	silent = TRUE

/obj/item/storage/pouch/general/medium
	name = "medium general pouch"
	storage_slots = 2
	icon_state = "medium_drop"
	draw_mode = 0

/obj/item/storage/pouch/general/medium/synthration/Initialize()
	. = ..()
	new /obj/item/reagent_containers/food/snacks/synthrationpack(src)
	new /obj/item/reagent_containers/food/snacks/synthrationpack(src)

/obj/item/storage/pouch/general/large
	name = "general pouch"
	storage_slots = 6
	max_storage_space = 6
	icon_state = "large_drop"
	draw_mode = 0
	silent = FALSE

/obj/item/storage/pouch/general/large/command/Initialize()
	. = ..()
	new /obj/item/binoculars(src)
	new /obj/item/megaphone/command(src)
	new /obj/item/pinpointer/nuke(src)

/obj/item/storage/pouch/general/large/nuclear/Initialize()
	. = ..()
	new /obj/item/binoculars(src)
	new /obj/item/megaphone/syndicate(src)
	new /obj/item/pinpointer/nuke/syndicate(src)

/obj/item/storage/pouch/general/large/command/ert
	max_storage_space = 8

/obj/item/storage/pouch/general/large/command/ert/Initialize()
	. = ..()
	new /obj/item/switchblade(src)

/obj/item/storage/pouch/general/large/command/elite_ert
	max_storage_space = 8

/obj/item/storage/pouch/general/large/command/elite_ert/Initialize()
	. = ..()
	new /obj/item/melee/transforming/energy/sword/saber(src)

/obj/item/storage/pouch/general/large/pmc
	max_storage_space = 8

/obj/item/storage/pouch/general/large/pmc/Initialize()
	. = ..()
	new /obj/item/binoculars(src)
	new /obj/item/megaphone(src)
	new /obj/item/pinpointer/adv/unrestricted(src)

/obj/item/megaphone/syndicate/Initialize()
	. = ..()
	if(obj_flags & EMAGGED)
		return FALSE
	obj_flags |= EMAGGED
	voicespan = list(SPAN_REALLYBIG, "userdanger")

/obj/item/storage/pouch/bayonet
	name = "bayonet sheath"
	desc = "A pouch for your knives."
	can_hold = list(
		/obj/item/kitchen/knife/combat
	)
	icon_state = "bayonet"
	storage_slots = 3
	draw_mode = 1

/obj/item/storage/pouch/bayonet/full
	fill_type = /obj/item/kitchen/knife/combat
	fill_number = 1

/obj/item/storage/pouch/survival
	name = "survival pouch"
	desc = "It can contain flashlights, a pill, a crowbar, metal sheets, and some bandages."
	icon_state = "survival"
	storage_slots = 6
	max_w_class = 3
	can_hold = list(
		/obj/item/flashlight,
		/obj/item/reagent_containers/pill,
		/obj/item/stack/medical/gauze,
		/obj/item/stack/sheet/metal,
		/obj/item/stack/sheet/plasteel,
		/obj/item/crowbar,
	)

/obj/item/storage/pouch/survival/full/Initialize()
	. = ..()
	new /obj/item/flashlight/seclite(src)
	new /obj/item/reagent_containers/pill/patch/styptic(src)
	new /obj/item/stack/medical/gauze(src, 3)
	new /obj/item/stack/sheet/metal(src, 40)
	new /obj/item/stack/sheet/plasteel(src, 15)
	new /obj/item/crowbar(src)

/obj/item/storage/pouch/firstaid
	name = "first-aid pouch"
	desc = "Standard first-aid pouch. It can contain autoinjectors, sets of pills, and bandages."
	icon_state = "firstaid"
	storage_slots = 6
	can_hold = list(
		/obj/item/reagent_containers/autoinjector,
		/obj/item/stack/medical,
		/obj/item/storage/pill_bottle,
	)

/obj/item/storage/pouch/firstaid/full/Initialize()
	. = ..()
	new /obj/item/stack/medical/gauze(src)
	new /obj/item/storage/pill_bottle/bica(src)
	new /obj/item/storage/pill_bottle/kelo(src)
	new /obj/item/storage/pill_bottle/charcoal(src)
	new /obj/item/storage/pill_bottle/psicodine(src)
	new /obj/item/reagent_containers/autoinjector/medipen/blood_loss(src)

/obj/item/storage/pouch/pistol
	name = "sidearm pouch"
	desc = "It can contain a pistol or revolver. Useful for emergencies."
	icon_state = "pistol"
	max_w_class = 3
	can_hold = list(
		/obj/item/gun/ballistic/automatic/pistol,
		/obj/item/gun/ballistic/revolver,
		/obj/item/gun/energy/e_gun/mini,
		/obj/item/gun/energy/disabler,
		/obj/item/gun/energy/e_gun/advtaser,
		/obj/item/gun/energy/e_gun/hos,
		/obj/item/gun/energy/e_gun/energyrevolver,
		/obj/item/gun/energy/e_gun/pdwpistol,
		/obj/item/gun/energy/laser/captain,
		/obj/item/gun/energy/laser/centcom,
		/obj/item/gun/energy/laser/retro,
		/obj/item/gun/energy/pulse/pistol,
	)
	draw_mode = 1

/obj/item/storage/pouch/pistol/glock18
	fill_type = /obj/item/gun/ballistic/automatic/pistol/glock18
	fill_number = 1

/obj/item/storage/pouch/pistol/ancile
	fill_type = /obj/item/gun/ballistic/automatic/pistol/glock17/ancile
	fill_number = 1

/obj/item/storage/pouch/pistol/pdw
	fill_type = /obj/item/gun/energy/e_gun/pdwpistol
	fill_number = 1

/obj/item/storage/pouch/pistol/advtaser
	fill_type = /obj/item/gun/energy/e_gun/advtaser/secure
	fill_number = 1

/obj/item/storage/pouch/pistol/centcom_laser
	fill_type = /obj/item/gun/energy/laser/centcom
	fill_number = 1

/obj/item/storage/pouch/pistol/pulse
	fill_type = /obj/item/gun/energy/pulse/pistol/loyalpin
	fill_number = 1

//// MAGAZINE POUCHES /////

/obj/item/storage/pouch/magazine
	name = "magazine pouch"
	desc = "It can contain ammo magazines."
	icon_state = "medium_ammo_mag"
	max_w_class = 3
	storage_slots = 2
	draw_mode = 1
	can_hold = list(
		/obj/item/ammo_box/magazine,
		/obj/item/stock_parts/cell/gun,
	)

/obj/item/storage/pouch/magazine/smgfull
	fill_type = /obj/item/ammo_box/magazine/smgm45
	fill_number = 2

/obj/item/storage/pouch/magazine/toploader556
	fill_type = /obj/item/ammo_box/magazine/m556
	fill_number = 2

/obj/item/storage/pouch/magazine/large
	name = "magazine pouch"
	desc = "This pouch can contain three ammo magazines."
	icon_state = "large_ammo_mag"
	storage_slots = 3

/obj/item/storage/pouch/magazine/pistol
	name = "pistol magazine pouch"
	desc = "It can contain pistol and revolver ammo magazines."
	max_w_class = 2
	icon_state = "pistol_mag"
	storage_slots = 3

	can_hold = list(
		/obj/item/ammo_box/magazine/m10mm,
		/obj/item/ammo_box/magazine/m45,
		/obj/item/ammo_box/magazine/pistolm9mm,
		/obj/item/ammo_box/magazine/m50,
		/obj/item/ammo_box/magazine/v38,
		/obj/item/ammo_box/m44,
		/obj/item/ammo_box/a357,
		/obj/item/ammo_box/c38,
		/obj/item/ammo_box/tra32,
	)

/obj/item/storage/pouch/magazine/pistol/large
	name = "pistol magazine pouch"
	desc = "This pouch can contain six pistol and revolver ammo magazines."
	storage_slots = 6
	icon_state = "large_pistol_mag"

/obj/item/storage/pouch/magazine/pistol/large/m45full
	fill_type = /obj/item/ammo_box/magazine/m45
	fill_number = 6

/obj/item/storage/pouch/magazine/pistol/pmag
	fill_type = /obj/item/ammo_box/magazine/pistolm9mm/pmag
	fill_number = 3

/obj/item/storage/pouch/magazine/pistol/fn45full
	fill_type = /obj/item/ammo_box/magazine/fn45
	fill_number = 3

/obj/item/storage/pouch/magazine/pistol/mateba
	fill_type = /obj/item/ammo_box/m44
	fill_number = 3

/obj/item/storage/pouch/magazine/pistol/large/mateba
	fill_type = /obj/item/ammo_box/m44
	fill_number = 6

/obj/item/storage/pouch/shotgun
	name = "shotgun shell pouch"
	desc = "A pouch specialized for holding shotgun ammo."
	icon_state = "shotshells"
	storage_slots = 24
	draw_mode = 1
	can_hold = list(/obj/item/ammo_casing/shotgun)

/obj/item/storage/pouch/shotgun/Initialize(mapload)
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.display_numerical_stacking = TRUE

/obj/item/storage/pouch/shotgun/full
	fill_type = /obj/item/ammo_casing/shotgun/buckshot
	fill_number = 24

/obj/item/storage/pouch/shotgun/full_rip
	fill_type = /obj/item/ammo_casing/shotgun/buckshot/syndie
	fill_number = 24

/*
/obj/item/storage/pouch/shotgun //New shotgun shell pouch that is actually worth a shit and will be replacing light general in vendors
	name = "shotgun shell pouch"
	desc = "A pouch specialized for holding shotgun ammo."
	icon_state = "shotshells"
	storage_slots = 4
	draw_mode = 0
	can_hold = list(/obj/item/ammo_magazine/handful)

/obj/item/storage/pouch/shotgun/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/ammo_magazine))
		var/obj/item/ammo_magazine/M = I
		if(CHECK_BITFIELD(M.flags_magazine, MAGAZINE_HANDFUL))
			return ..()
		if(M.flags_magazine & MAGAZINE_REFILLABLE)
			if(!M.current_rounds)
				to_chat(user, span_warning("[M] is empty."))
				return

			if(length(contents) >= storage_slots)
				to_chat(user, span_warning("[src] is full."))
				return


			to_chat(user, span_notice("You start refilling [src] with [M]."))
			if(!do_after(user, 1.5 SECONDS, TRUE, src, BUSY_ICON_GENERIC))
				return

			for(var/x in 1 to (storage_slots - length(contents)))
				var/cont = handle_item_insertion(M.create_handful(), 1, user)
				if(!cont)
					break

			playsound(user.loc, "rustle", 15, TRUE, 6)
			to_chat(user, span_notice("You refill [src] with [M]."))
			return TRUE

	return ..()
*/

/obj/item/storage/pouch/explosive
	name = "explosive pouch"
	desc = "It can contain grenades, plastiques, mines, and other explosives."
	icon_state = "large_explosive"
	storage_slots = 4
	max_w_class = 3
	can_hold = list(
		/obj/item/deployablemine,
		/obj/item/grenade,
		/obj/item/ammo_casing/caseless/rocket,
		/obj/item/assembly/signaler,
	)

/obj/item/storage/pouch/explosive/full
	fill_type = /obj/item/grenade
	fill_number = 4

/obj/item/storage/pouch/grenade
	name = "Grenade pouch"
	desc = "It can contain grenades."
	icon_state = "explosive"
	storage_slots = 6
	can_hold = list(
		/obj/item/grenade,
	)

/obj/item/storage/pouch/medkit
	name = "medkit pouch"
	desc = "A standard use medkit pouch that can contain all kinds of medical supplies and equipment."
	icon_state = "medkit"
	max_w_class = 4
	storage_slots = 7
	can_hold = list(
		/obj/item/healthanalyzer,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/hypospray,
	)

/obj/item/storage/pouch/surgery
	name = "surgery tools pouch"
	desc = "An eye catching white medical pouch capable of holding all your surgical tools."
	icon_state = "surgery"
	storage_slots = 9
	max_storage_space = 18
	can_hold = list(
		/obj/item/scalpel,
		/obj/item/hemostat,
		/obj/item/retractor,
		/obj/item/circular_saw,
		/obj/item/surgicaldrill,
		/obj/item/cautery,
		/obj/item/reagent_containers/medspray/sterilizine,
		/obj/item/bonesetter,
		/obj/item/razor,
		/obj/item/healthanalyzer,
		/obj/item/pinpointer/crew,
		/obj/item/sensor_device,
		/obj/item/reagent_containers/autoinjector/combat,
	)

/obj/item/storage/pouch/surgery/full/Initialize()
	. = ..()
	new /obj/item/scalpel(src)
	new /obj/item/hemostat(src)
	new /obj/item/retractor(src)
	new /obj/item/circular_saw(src)
	new /obj/item/surgicaldrill(src)
	new /obj/item/cautery(src)
	new /obj/item/reagent_containers/medspray/sterilizine(src)
	new /obj/item/bonesetter(src)
	new /obj/item/razor(src)

/obj/item/storage/pouch/surgery/advanced/Initialize()
	. = ..()
	new /obj/item/scalpel/advanced(src)
	new /obj/item/retractor/advanced(src)
	new /obj/item/circular_saw(src)
	new /obj/item/surgicaldrill(src)
	new /obj/item/cautery/advanced(src)
	new /obj/item/reagent_containers/medspray/sterilizine(src)
	new /obj/item/healthanalyzer/advanced(src)
	new /obj/item/pinpointer/crew(src)
	new /obj/item/sensor_device(src)

/obj/item/storage/pouch/surgery/advanced/blue_ert/Initialize(mapload)
	. = ..()
	new /obj/item/reagent_containers/autoinjector/combat(src)

/obj/item/storage/pouch/surgery/advanced/red_ert/Initialize(mapload)
	. = ..()
	new /obj/item/reagent_containers/autoinjector/combat/healermech(src)

/obj/item/storage/pouch/surgery/advanced/gamma_ert/Initialize(mapload)
	. = ..()
	new /obj/item/reagent_containers/autoinjector/combat/nanites(src)

/obj/item/storage/pouch/document
	name = "document pouch"
	desc = "It can contain papers and clipboards."
	icon_state = "document"
	storage_slots = 7
	can_hold = list(
		/obj/item/paper,
		/obj/item/documents,
		/obj/item/clipboard,
	)


/obj/item/storage/pouch/flare
	name = "flare pouch"
	desc = "A pouch designed to hold flares and a single flaregun. Refillable with a M94 flare pack."
	max_w_class = 2
	storage_slots = 7
	draw_mode = 1
	icon_state = "flare"
	storage_type_lim = list(/obj/item/gun/grenadelauncher/flare = 1)

	can_hold = list(
		/obj/item/flashlight/flare,
		/obj/item/gun/grenadelauncher/flare,
		/obj/item/grenade/flare,
	)

/obj/item/storage/pouch/radio
	name = "radio pouch"
	storage_slots = 2
	icon_state = "radio"
	draw_mode = 1
	desc = "It can contain two handheld radios."
	can_hold = list(/obj/item/radio)

/obj/item/storage/pouch/electronics
	name = "electronics pouch"
	desc = "It is designed to hold most electronics, power cells and circuitboards."
	icon_state = "electronics"
	storage_slots = 6
	can_hold = list(
		/obj/item/circuitboard,
		/obj/item/electronics,
		/obj/item/stock_parts/cell,
	)

/obj/item/storage/pouch/electronics/full/Initialize()
	. = ..()
	new /obj/item/electronics/airlock (src)
	new /obj/item/electronics/apc (src)
	new /obj/item/stock_parts/cell/high (src)


/obj/item/storage/pouch/construction
	name = "construction pouch"
	desc = "It's designed to hold construction materials - glass/metal sheets, metal rods, barbed wire, cable coil, and empty sandbags. It also has a hook for an entrenching tool."
	storage_slots = 4
	max_w_class = 3
	icon_state = "construction"
	can_hold = list(
		/obj/item/stack/sheet,
		/obj/item/stack/rods,
		/obj/item/stack/cable_coil,
		/obj/structure/barricade/sandbags,
	)

/obj/item/storage/pouch/tools
	name = "tools pouch"
	desc = "It's designed to hold maintenance tools - screwdriver, wrench, cable coil, etc. It also has a hook for an entrenching tool."
	storage_slots = 5
	max_w_class = 3
	icon_state = "tools"
	can_hold = list(
		/obj/item/wirecutters,
		/obj/item/screwdriver,
		/obj/item/crowbar,
		/obj/item/weldingtool,
		/obj/item/multitool,
		/obj/item/wrench,
		/obj/item/stack/cable_coil,
		/obj/item/extinguisher/mini,
		/obj/item/extinguisher/mini,
		/obj/item/melee/emergency_forcing_tool,
	)

/obj/item/storage/pouch/tools/full/Initialize()
	. = ..()
	new /obj/item/screwdriver (src)
	new /obj/item/wirecutters (src)
	new /obj/item/weldingtool (src)
	new /obj/item/wrench (src)
	new /obj/item/crowbar (src)


/obj/item/screwdriver/blue
	random_color = FALSE
	toolspeed = 0.5

/obj/item/screwdriver/blue/Initialize(mapload)
	. = ..()
	set_greyscale(colors = COLOR_TOOL_BLUE)

/obj/item/wirecutters/blue
	random_color = FALSE
	toolspeed = 0.5

/obj/item/wirecutters/blue/Initialize(mapload)
	. = ..()
	set_greyscale(colors = COLOR_TOOL_BLUE)

/obj/item/storage/pouch/tools/ert/Initialize()
	. = ..()
	new /obj/item/screwdriver/blue (src)
	new /obj/item/wirecutters/blue (src)
	new /obj/item/weldingtool/experimental (src)
	new /obj/item/wrench (src)
	new /obj/item/melee/emergency_forcing_tool (src)
