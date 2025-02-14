/obj/item/storage/belt/equipped(mob/user, slot)
	if(slot == ITEM_SLOT_BELT)
		mouse_opacity = MOUSE_OPACITY_OPAQUE //so it's easier to click when properly equipped.
	..()

/obj/item/storage/belt/dropped(mob/user)
	mouse_opacity = initial(mouse_opacity)
	..()

/obj/item/storage/belt/utility/chief
	icon = 'modular_dripstation/icons/obj/clothing/belt.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	item_state = "utilitybelt_ce"

/obj/item/storage/belt/medical
	icon = 'modular_dripstation/icons/obj/clothing/belt.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	item_state = "medicalbelt"

/obj/item/storage/belt/medical/full/PopulateContents()
	SSwardrobe.provide_type(/obj/item/scalpel, src)
	SSwardrobe.provide_type(/obj/item/retractor, src)
	SSwardrobe.provide_type(/obj/item/cautery, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze/twelve, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/suture, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/mesh, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/autoinjector/medipen/ekit, src)

/obj/item/storage/belt/medical/chief
	icon = 'icons/obj/clothing/belts.dmi'
	worn_icon = 'icons/mob/clothing/belt.dmi'

/obj/item/storage/belt/medical/mining
	icon = 'icons/obj/clothing/belts.dmi'
	worn_icon = 'icons/mob/clothing/belt.dmi'

/obj/item/storage/belt/security
	icon = 'modular_dripstation/icons/obj/clothing/belt.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'

/obj/item/storage/belt/security/corrections/PopulateContents()
	SSwardrobe.provide_type(/obj/item/reagent_containers/spray/pepper, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/grenade/flashbang, src)
	SSwardrobe.provide_type(/obj/item/assembly/flash/handheld, src)
	SSwardrobe.provide_type(/obj/item/melee/baton/loaded/departmental/prison, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/security/webbing
	icon_state = "securitywebbing"
	item_state = "securitywebbing"
	icon = 'modular_dripstation/icons/obj/clothing/belt.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'

/obj/item/storage/belt/security/chief
	icon = 'modular_dripstation/icons/obj/clothing/belt.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'

/obj/item/storage/belt/security/chief/Initialize(mapload)
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.set_holdable(list(
		/obj/item/melee/baton,
		/obj/item/melee/classic_baton,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash/handheld,
		/obj/item/clothing/glasses,
		/obj/item/ammo_casing/shotgun,
		/obj/item/ammo_box,
		/obj/item/storage/box/rubbershot,
		/obj/item/storage/box/lethalshot,
		/obj/item/storage/box/breacherslug,
		/obj/item/storage/box/beanbag,
		/obj/item/reagent_containers/food/snacks/donut,
		/obj/item/kitchen/knife/combat,
		/obj/item/radio,
		/obj/item/pinpointer/tracker,
		/obj/item/clothing/gloves,
		/obj/item/restraints/legcuffs/bola,
		/obj/item/gun/ballistic/revolver/tracking,
		/obj/item/holosign_creator/security,
		/obj/item/shield/riot/tele,
		/obj/item/barrier_taperoll/police,
		/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/weldingtool,
		/obj/item/wirecutters,
		/obj/item/wrench,
		/obj/item/multitool,
		/obj/item/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/t_scanner,
		/obj/item/analyzer,
		/obj/item/geiger_counter,
		/obj/item/extinguisher/mini,
		/obj/item/radio,
		/obj/item/clothing/gloves,
		/obj/item/holosign_creator/atmos,
		/obj/item/holosign_creator/engineering,
		/obj/item/forcefield_projector,
		/obj/item/assembly/signaler,
		/obj/item/lightreplacer,
		/obj/item/construction/rcd,
		/obj/item/pipe_dispenser,
		/obj/item/inducer,
		/obj/item/holosign_creator/multi/chief_engineer,
		/obj/item/airlock_painter,
		/obj/item/grenade/chem_grenade/smart_metal_foam,
		/obj/item/grenade/chem_grenade/metalfoam,
		/obj/item/storage/bag/construction,
		/obj/item/handdrill,
		/obj/item/jawsoflife,
		/obj/item/shuttle_creator,
		/obj/item/barrier_taperoll/engineering,
		/obj/item/storage/bag/sheetsnatcher,
		/obj/item/boxcutter,
		/obj/item/holotool
	))

/obj/item/storage/belt/grenade
	icon_state = "grenadebeltnew"
	item_state = "grenadebeltnew"

/obj/item/storage/belt/military
	name = "military belt"
	desc = "A tactical military belt."
	item_state = "militarybelt"
	icon_state = "militarybelt"
	icon = 'modular_dripstation/icons/obj/clothing/belt.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'

/obj/item/storage/belt/military/army
	icon_state = "militarybelt_slav"
	item_state = "militarybelt_slav"

/obj/item/storage/belt/military/assault
	icon_state = "assaultbelt"
	item_state = "assaultbelt"

/obj/item/storage/belt/military/assault/consultant/Initialize(mapload) // Amber-like
	. = ..()
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)
	new /obj/item/gun/ballistic/automatic/pistol/glock17/ancile(src)
	new /obj/item/ammo_box/magazine/pistolm9mm(src)
	new /obj/item/ammo_box/magazine/smgm9mm(src)


/obj/item/storage/belt/military/assault/defence/Initialize(mapload) // Amber-like
	. = ..()
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)
	new /obj/item/ammo_box/magazine/pistolm9mm(src)
	new /obj/item/ammo_box/magazine/smgm45(src)
	new /obj/item/ammo_box/magazine/smgm45/ap(src)

/obj/item/storage/belt/military/amber
	icon_state = "assaultbelt"
	item_state = "assaultbelt"

/obj/item/storage/belt/military/amber_commander
	icon_state = "assaultbelt"
	item_state = "assaultbelt"

/obj/item/storage/belt/military/amber_medic
	icon_state = "assaultbelt"
	item_state = "assaultbelt"

/obj/item/storage/belt/military/abductor
	icon_state = "abductor"
	item_state = "abductor"

/obj/item/storage/belt/military/webbing
	name = "night chest rig"
	desc = "A set of tactical webbing worn by corporate military."
	item_state = "militarywebbing-night"
	icon_state = "militarywebbing-night"

/obj/item/storage/belt/military/webbing/syndicate
	name = "syndicate chest rig"
	desc = "A set of black tactical webbing worn by syndicate operatives."
	item_state = "militarywebbing-black"
	icon_state = "militarywebbing-black"
	var/morphable = TRUE

/obj/item/storage/belt/military/webbing/syndicate/morphing
	morphable = FALSE
	actions_types = list(/datum/action/item_action/adjust)

/obj/item/storage/belt/military/webbing/syndicate/morphing/ui_action_click(mob/user)
	if(!istype(user) || user.incapacitated())
		return
	var/list/options = list()
	var/list/radial_display = list()
	for(var/obj/item/storage/belt/military/webbing/syndicate/all_webbing as anything in typesof(/obj/item/storage/belt/military/webbing/syndicate))
		if(!initial(all_webbing.morphable))
			continue
		options[initial(all_webbing.name)] = all_webbing
		var/datum/radial_menu_choice/option = new
		option.image = image(icon = initial(all_webbing.icon), icon_state = initial(all_webbing.icon_state))
		option.info = "[initial(all_webbing.name)] - [span_boldnotice(initial(all_webbing.desc))]"
		radial_display[initial(all_webbing.name)] = option

	var/choice = show_radial_menu(user, user, radial_display)
	var/obj/item/storage/belt/military/webbing/syndicate/chosen_webbing = options[choice]
	if(QDELETED(src) || QDELETED(user))
		return FALSE
	if(!chosen_webbing)
		to_chat(user, span_announce("You choose not to choose."))
		return
	if(src && chosen_webbing && !user.incapacitated() && in_range(user,src))
		name = chosen_webbing.name
		desc = chosen_webbing.desc
		item_state = chosen_webbing.item_state
		icon_state = chosen_webbing.icon_state
		user.update_inv_belt()
		for(var/X in actions)
			var/datum/action/A = X
			A.build_all_button_icons()
		to_chat(user, span_notice("Your webbing has now morphed into [chosen_webbing.name]!"))
		return TRUE


/obj/item/storage/belt/military/webbing/syndicate/elite
	name = "elite syndicate chest rig"
	desc = "A set of tactical webbing worn by best syndicate operatives."
	item_state = "militarywebbing-elite"
	icon_state = "militarywebbing-elite"

/obj/item/storage/belt/military/webbing/syndicate/waffle
	name = "Waffle operative chest rig"
	desc = "A set of tactical webbing worn by Waffle Co operatives."
	item_state = "militarywebbing-waffle"
	icon_state = "militarywebbing-waffle"

/obj/item/storage/belt/military/webbing/syndicate/gorlex
	name = "Gorlex marauder chest rig"
	desc = "A set of tactical webbing worn by bloody marauders."
	item_state = "militarywebbing-bloody"
	icon_state = "militarywebbing-bloody"

/obj/item/storage/belt/military/webbing/gorlex_secutity
	name = "Gorlex Security chest rig"
	desc = "A set of tactical webbing worn by Gorlex Security."
	item_state = "militarywebbing-bloody"
	icon_state = "militarywebbing-bloody"

/obj/item/storage/belt/military/webbing/gorlex_secutity/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/r556, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/r556/ap, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/fn45, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/melee/classic_baton/telescopic, src)
	SSwardrobe.provide_type(/obj/item/grenade/flashbang, src)
	SSwardrobe.provide_type(/obj/item/assembly/flash/handheld, src)

/obj/item/storage/belt/military/webbing/syndicate/cybersun
	name = "Cybersun operative chest rig"
	desc = "A set of tactical webbing worn by Cybersun Industries operatives."
	item_state = "militarywebbing-cybersun"
	icon_state = "militarywebbing-cybersun"

/obj/item/storage/belt/military/webbing/syndicate/cybersunmed
	name = "Cybersun medic chest rig"
	desc = "A set of tactical webbing worn by Cybersun Industries medics."
	item_state = "militarywebbing-cybersunmed"
	icon_state = "militarywebbing-cybersunmed"

/obj/item/storage/belt/military/webbing/syndicate/vahlen
	name = "Vahlen medic chest rig"
	desc = "A set of tactical webbing worn by Vahlen Pharmaceuticals employees."
	item_state = "militarywebbing-vahlen"
	icon_state = "militarywebbing-vahlen"

/obj/item/storage/belt/military/webbing/nt
	name = "NanoTrasen military chest rig"
	desc = "A set of tactical webbing worn by NanoTrasen`s Navy operatives."
	item_state = "militarywebbing-nt"
	icon_state = "militarywebbing-nt"

/obj/item/storage/belt/military/webbing/nt/full/Initialize(mapload) // Amber-like
	. = ..()
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)
	new /obj/item/reagent_containers/autoinjector/combat(src)
	new /obj/item/reagent_containers/autoinjector/medipen/survival(src)
	new /obj/item/reagent_containers/autoinjector/medipen/survival(src)

/obj/item/storage/belt/military/webbing/nt/gamma/Initialize(mapload)
	. = ..()
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)
	new /obj/item/ammo_box/magazine/r556(src)
	new /obj/item/ammo_box/magazine/r556(src)
	new /obj/item/ammo_box/magazine/r556/ap(src)
	new /obj/item/reagent_containers/autoinjector/combat(src)
	new /obj/item/grenade/syndieminibomb/nt(src)

/obj/item/storage/belt/military/webbing/nt/gamma_com/Initialize(mapload)
	. = ..()
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/gun/energy/pulse/pistol/loyalpin(src)
	new /obj/item/ammo_box/magazine/r556(src)
	new /obj/item/ammo_box/magazine/r556(src)
	new /obj/item/ammo_box/magazine/r556/ap(src)
	new /obj/item/reagent_containers/autoinjector/combat(src)
	new /obj/item/grenade/syndieminibomb/nt(src)

/obj/item/storage/belt/military/webbing/soviet
	name = "soviet military chest rig"
	desc = "A set of tactical webbing worn by soviet army."
	item_state = "militarywebbing-soviet"
	icon_state = "militarywebbing-soviet"

/obj/item/storage/belt/military/webbing/terragov
	name = "Terra Government military chest rig"
	desc = "A set of tactical webbing worn by terragov oficials."
	item_state = "militarywebbing-terragov"
	icon_state = "militarywebbing-terragov"

/obj/item/storage/belt/military/webbing/coalition
	name = "Coalition military chest rig"
	desc = "A set of tactical webbing worn by Coalition`s merks."
	item_state = "militarywebbing-coalition"
	icon_state = "militarywebbing-coalition"

/obj/item/storage/belt/military/webbing/shellguard
	name = "Shellguard military chest rig"
	desc = "A set of tactical webbing worn by Shellguard merks."
	item_state = "militarywebbing-shelg"
	icon_state = "militarywebbing-shelg"

/obj/item/storage/belt/military/webbing/shellguard/full

/obj/item/storage/belt/military/webbing/shellguard/full/PopulateContents()
	SSwardrobe.provide_type(/obj/item/reagent_containers/spray/pepper, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/grenade/flashbang, src)
	SSwardrobe.provide_type(/obj/item/assembly/flash/handheld, src)
	SSwardrobe.provide_type(/obj/item/melee/baton/loaded, src)
	update_appearance(UPDATE_ICON)	

/obj/item/storage/belt/military/webbing/shellguard/op

/obj/item/storage/belt/military/webbing/shellguard/op/PopulateContents()
	SSwardrobe.provide_type(/obj/item/reagent_containers/spray/pepper, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/grenade/flashbang, src)
	SSwardrobe.provide_type(/obj/item/assembly/flash/handheld, src)
	SSwardrobe.provide_type(/obj/item/melee/baton/loaded, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/sa450, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/sa450, src)
	update_appearance(UPDATE_ICON)	

/obj/item/storage/belt/military/webbing/shellguardmed
	name = "Shellguard medical chest rig"
	desc = "A set of tactical webbing worn by Shellguard medical."
	item_state = "militarywebbing-feldsher"
	icon_state = "militarywebbing-feldsher"

/obj/item/storage/belt/military/webbing/shellguardmed/full

/obj/item/storage/belt/military/webbing/shellguardmed/full/PopulateContents()
	SSwardrobe.provide_type(/obj/item/scalpel, src)
	SSwardrobe.provide_type(/obj/item/retractor, src)
	SSwardrobe.provide_type(/obj/item/cautery, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze/twelve, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/suture, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/mesh, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/autoinjector/medipen/ekit, src)
	update_appearance(UPDATE_ICON)	

/obj/item/storage/belt/military/webbing/shellguard/tech
	desc = "A set of tactical webbing worn by Shellguard tech."

/obj/item/storage/belt/military/webbing/shellguard/tech/PopulateContents()
	SSwardrobe.provide_type(/obj/item/handdrill, src)
	SSwardrobe.provide_type(/obj/item/jawsoflife, src)
	SSwardrobe.provide_type(/obj/item/weldingtool/experimental, src) //This can be changed if this is too much //It's been 5 years
	SSwardrobe.provide_type(/obj/item/multitool, src)	//yogs: changes the multitool to the tricorder and removes the analyzer
	SSwardrobe.provide_type(/obj/item/stack/cable_coil, src)
	SSwardrobe.provide_type(/obj/item/extinguisher/mini, src)
	update_appearance(UPDATE_ICON)	

/obj/item/storage/belt/military/webbing/militech
	name = "Militech chest rig"
	desc = "A set of tactical webbing worn by Militech operatives."
	item_state = "militarywebbing-militech"
	icon_state = "militarywebbing-militech"

/obj/item/storage/belt/military/webbing/militech/ar/PopulateContents()
	SSwardrobe.provide_type(/obj/item/storage/pill_bottle/bica, src)
	SSwardrobe.provide_type(/obj/item/storage/pill_bottle/kelo, src)
	SSwardrobe.provide_type(/obj/item/extinguisher/mini, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/r556, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/r556, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/r556/ap, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/pistolm9mm/pmag/ap, src)
	update_appearance(UPDATE_ICON)	

/obj/item/storage/belt/military/webbing/lbv88
	name = "Lbv88 chest rig"
	desc = "A set of tactical webbing worn by Militech operatives."
	item_state = "chestrig_lbv88-militech"
	icon_state = "chestrig_lbv88-militech"

/obj/item/storage/belt/military/webbing/grenade
	name = "grenade chest rig"
	desc = "A set of webbing worn by grenadeers."
	item_state = "grenade_webbing"
	icon_state = "grenade_webbing"

/obj/item/storage/belt/military/webbing/grenade/full/PopulateContents()
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/concussion/frag, src)
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/concussion/frag, src)
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/concussion/frag, src)
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/concussion/frag, src)
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/concussion/frag, src)
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/concussion/frag, src)
	update_appearance(UPDATE_ICON)	

/obj/item/storage/belt/holster
	icon = 'modular_dripstation/icons/obj/clothing/belt.dmi'

/obj/item/storage/belt/holster/Initialize(mapload)
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.set_holdable(list(
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
		/obj/item/stock_parts/cell/gun,
		/obj/item/screwdriver,
		/obj/item/ammo_box
		))

/obj/item/storage/belt/holster/mateba/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/m44, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/m44, src)
	SSwardrobe.provide_type(/obj/item/gun/ballistic/revolver/mateba, src)
	update_appearance(UPDATE_ICON)	

/obj/item/storage/belt/holster/shellguard/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/m44, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/m44, src)
	SSwardrobe.provide_type(/obj/item/gun/ballistic/revolver/mateba/shellguard, src)
	update_appearance(UPDATE_ICON)	

/obj/item/storage/belt/holster/pulse/PopulateContents()
	SSwardrobe.provide_type(/obj/item/gun/energy/pulse/pistol/loyalpin, src)
	update_appearance(UPDATE_ICON)	

/obj/item/storage/belt/holster/centcom_laser/PopulateContents()
	SSwardrobe.provide_type(/obj/item/gun/energy/laser/centcom, src)
	update_appearance(UPDATE_ICON)	

/obj/item/storage/belt/holster/pdw/PopulateContents()
	SSwardrobe.provide_type(/obj/item/stock_parts/cell/gun/pulse/pistol, src)
	SSwardrobe.provide_type(/obj/item/screwdriver/blue, src)
	SSwardrobe.provide_type(/obj/item/gun/energy/e_gun/pdwpistol, src)
	update_appearance(UPDATE_ICON)	

/obj/item/storage/belt/holster/syndicate
	name = "advanced shoulder holster"
	item_state = "syndicate_holster"
	icon_state = "syndicate_holster"
	icon = 'modular_dripstation/icons/obj/clothing/belt.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'

/obj/item/storage/belt/holster/syndicate/fnx45/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/fn45, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/fn45, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/fn45, src)
	SSwardrobe.provide_type(/obj/item/gun/ballistic/automatic/pistol/fn45, src)
	update_appearance(UPDATE_ICON)
