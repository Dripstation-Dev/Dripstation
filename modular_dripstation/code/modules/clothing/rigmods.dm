/obj/item/module
	name = "module"
	desc = "module"
	icon = 'modular_dripstation/icons/obj/rig_modules.dmi'
	icon_state = "module"
	var/obj/item/clothing/suit/space/hardsuit/dualmode/rig 
	var/complexity = 1	//how complex module is
	var/removable = TRUE
	var/active = FALSE
	var/list/incompatible_modules = list()
	var/overlay_state_use
	var/overlay_icon_file = 'modular_dripstation/icons/mob/clothing/spacesuits/suits.dmi'
	var/overlay_state_inactive
	var/overlay_state_active
	var/allow_flags = NONE
	var/module_type = MODULE_PASSIVE
	/// Timer for the cooldown
	var/cooldown_time = 1 SECONDS
	COOLDOWN_DECLARE(cooldown_timer)

/obj/item/module/examine(mob/user)
	. = ..()
	if(!in_range(user, src) && !isobserver(user))
		. += "You can insert it into rig. It has [complexity] complexity."

/// Adds the worn overlays to the suit.
/obj/item/module/proc/add_module_overlay(obj/item/source, list/overlays, mutable_appearance/standing, isinhands, icon_file)
	SIGNAL_HANDLER

	overlays += generate_worn_overlay(standing)

/// Generates an icon to be used for the suit's worn overlays
/obj/item/module/proc/generate_worn_overlay(mutable_appearance/standing)
	. = list()
	if(!rig.active && active)
		return
	var/used_overlay
	if(overlay_state_use && !COOLDOWN_FINISHED(src, cooldown_timer))
		used_overlay = overlay_state_use
	else if(overlay_state_active && active)
		used_overlay = overlay_state_active
	else if(overlay_state_inactive)
		used_overlay = overlay_state_inactive
	else
		return
	var/mutable_appearance/module_icon = mutable_appearance(overlay_icon_file, used_overlay, layer = standing.layer + 0.1)
	//if(!use_mod_colors)
		//module_icon.appearance_flags |= RESET_COLOR
	. += module_icon

/obj/item/module/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!proximity_flag)
		return ..()
	if(istype(target, /obj/item/clothing/suit/space/hardsuit/dualmode))
		var/obj/item/clothing/suit/space/hardsuit/dualmode/rig = target
		try_to_insert_module(rig, user)
	return ..()

/obj/item/module/proc/try_to_insert_module(obj/item/clothing/suit/space/hardsuit/dualmode/new_rig, mob/user, qdel_on_fail = FALSE)
	if(can_insert_module(new_rig, user, qdel_on_fail))
		insert_module(new_rig, user)
	else if(user)
		visible_message(span_warning("\The [user] tries to insert [src] into [new_rig], but fails!"))

/obj/item/module/proc/can_insert_module(obj/item/clothing/suit/space/hardsuit/dualmode/new_rig, qdel_on_fail = FALSE)
	var/compatible = TRUE
	for(var/obj/item/module/M in new_rig.inserted_modules)
		if(locate(src) in M.incompatible_modules)
			compatible = FALSE
			break
	if(!compatible || new_rig.current_complexity + complexity > new_rig.max_complexity)
		if(qdel_on_fail)
			qdel(src)
		return FALSE
	return TRUE

/obj/item/module/proc/insert_module(obj/item/clothing/suit/space/hardsuit/dualmode/new_rig, mob/user = null)
	rig = new_rig
	rig.current_complexity += complexity
	rig.inserted_modules += src
	on_install()
	if(user)
		visible_message("<span class='nicegreen'>\The [user] inserts [src] into [rig].</span>")
	rig.update_appearance()
	forceMove(rig)
	//user.update_appearance(UPDATE_OVERLAYS)
	//qdel(src)
	RegisterSignal(rig, COMSIG_RIG_TRIGGER_POWER, PROC_REF(on_rig_change_power_state))
	RegisterSignal(rig, COMSIG_ITEM_GET_WORN_OVERLAYS, TYPE_PROC_REF(/obj/item/module, add_module_overlay))
	return TRUE

/obj/item/module/proc/remove_module()
	rig.current_complexity -= complexity
	rig.inserted_modules -= src
	on_change_active_state(FALSE)
	on_module_unpowered()
	on_uninstall()
	rig.current_complexity = min(rig.current_complexity, rig.max_complexity)	//sanity check
	UnregisterSignal(rig, COMSIG_RIG_TRIGGER_POWER)
	UnregisterSignal(rig, COMSIG_ITEM_GET_WORN_OVERLAYS)
	rig = null
	return TRUE

/// Called when the module is selected from the TGUI, radial or the action button
/obj/item/module/proc/on_trigger_module()
	//if(((!rig.active) && !(allow_flags & MODULE_ALLOW_INACTIVE)) || module_type == MODULE_PASSIVE)
	if(module_type == MODULE_PASSIVE)
		return
	if(!rig.active || !rig.wearer)
		balloon_alert(rig.wearer, "not active!")
		return
	if(module_type != MODULE_USABLE)
		if(!active)
			on_module_activate()
		else
			on_module_deactivate()
	else
		on_use()
	SEND_SIGNAL(rig, COMSIG_RIG_MODULE_SELECTED, src)

/obj/item/module/proc/on_module_activate()
	if(!COOLDOWN_FINISHED(src, cooldown_timer))
		balloon_alert(rig.wearer, "on cooldown!")
		return
	if(!rig.active)
		balloon_alert(rig.wearer, "rig unpowered!")
		return
	if(/*!(allow_flags & MODULE_ALLOW_PHASEOUT) && */istype(rig.wearer.loc, /obj/effect/dummy/phased_mob))
		to_chat(rig.wearer, span_warning("You cannot activate this right now."))
		return
	COOLDOWN_START(src, cooldown_timer, cooldown_time)
	on_change_active_state(TRUE)
	on_module_powered()

/obj/item/module/proc/on_module_deactivate()
	on_change_active_state(FALSE)
	on_module_unpowered()

/obj/item/module/proc/on_change_active_state(new_state = null)
	if(new_state)
		active = new_state
	else
		active = !active
	balloon_alert(rig.wearer, "[src.name] [active?"activeted":"deactiveted"]!")
	//icon_state = "[icon_state]_[active]"
	//update_appearance(UPDATE_ICON)

/obj/item/module/proc/on_rig_change_power_state()
	SIGNAL_HANDLER
	if(rig.active && module_type == MODULE_CAN_ACTIVATE && active)
		on_module_powered()
	else
		on_module_unpowered()

//////////////////////////////////////////////////////
/////////////////////EFFECT PROC//////////////////////
//////////////////////////////////////////////////////
///apply|remove effects here
/obj/item/module/proc/on_install()
	return

/obj/item/module/proc/on_uninstall()
	return

///on|off effects here
/obj/item/module/proc/on_module_powered()
	return

/obj/item/module/proc/on_module_unpowered()
	return

/obj/item/module/proc/on_use()
	if(!COOLDOWN_FINISHED(src, cooldown_timer))
		balloon_alert(rig.wearer, "on cooldown!")
		return FALSE
	if(/*!(allow_flags & MODULE_ALLOW_PHASEOUT) && */istype(rig.wearer.loc, /obj/effect/dummy/phased_mob))
		//specifically a to_chat because the user is phased out.
		to_chat(rig.wearer, span_warning("You cannot activate this right now."))
		return FALSE
	COOLDOWN_START(src, cooldown_timer, cooldown_time)
	SEND_SIGNAL(src, COMSIG_MODULE_USED)
	return TRUE
//////////////////////////////////////////////////////


/obj/item/module/shield
	name = "RIG advanced shield module"
	desc = "Insert module into rig to give it a rechargeable shield."
	icon_state = "shield"
	var/max_charges = 3 //How many charges total the shielding has
	var/recharge_delay = 20 SECONDS //How long after we've been shot before we can start recharging. 20 seconds here
	var/recharge_delay_after_charge = 1 SECONDS //How long after we've been recharged before we can start recharging. 1 second here
	var/recharge_rate = 1 //How quickly the shield recharges once it starts charging
	var/starting_charge = 0	//if null starts with max_charges
	module_type = MODULE_CAN_ACTIVATE
	var/shield_state = "shield-old"
	incompatible_modules = list(/obj/item/module/shield, /obj/item/module/shield/syndicate, /obj/item/module/shield/nt, /obj/item/module/shield/wizard)

/obj/item/module/shield/on_module_powered()
	rig.AddComponent(/datum/component/shielded,'modular_dripstation/icons/effects/shield.dmi', shield_state, recharge_delay, ITEM_SLOT_OCLOTHING, charge_i_d = recharge_delay_after_charge, max_charge = max_charges, starting_charges = starting_charge, recharge_rating = recharge_rate, sparks_enable = TRUE)

/obj/item/module/shield/on_module_unpowered()
	var/datum/component/shielded/shield = rig.GetComponent(/datum/component/shielded)
	//starting_charge = shield.current_charges
	qdel(shield)

/obj/item/module/shield/syndicate
	name = "RIG Cybersun shield module"
	max_charges = 1
	recharge_delay = 10 SECONDS
	shield_state = "shield-red"
	icon_state = "shield-syndie"

/obj/item/module/shield/nt
	name = "RIG Nanotrasen shield module"
	recharge_delay_after_charge = 10 SECONDS
	recharge_delay = 30 SECONDS
	icon_state = "shield-nt"

/obj/item/module/shield/wizard
	name = "magic shield rune"
	icon_state = "shield-mage"
	max_charges = 5
	starting_charge = 1
	recharge_rate = 0
	recharge_delay = 0 SECONDS
	module_type = MODULE_PASSIVE
	shield_state = "mageshield"
	incompatible_modules = list(/obj/item/module/shield, /obj/item/module/shield/syndicate, /obj/item/module/shield/nt)

/obj/item/module/shield/wizard/on_module_powered()
	return

/obj/item/module/shield/wizard/on_module_unpowered()
	return

/obj/item/module/shield/wizard/on_install()
	rig.AddComponent(/datum/component/shielded,'modular_dripstation/icons/effects/shield.dmi', shield_state, recharge_delay, ITEM_SLOT_OCLOTHING, charge_i_d = recharge_delay_after_charge, max_charge = max_charges, starting_charges = starting_charge, recharge_rating = recharge_rate, sparks_enable = TRUE)

/obj/item/module/shield/wizard/on_uninstall()
	var/datum/component/shielded/shield = rig.GetComponent(/datum/component/shielded)
	//starting_charge = shield.current_charges
	qdel(shield)

/obj/item/module/solar_shielding
	name = "RIG solar shielding module"
	icon_state = "solar_shielding"
	desc = "A module installed into the visor of the suit, this feachures a \
		polarized visor in front of the user's eyes. It's rated high enough for \
		immunity against extremities such as solar eclipses and handheld flashlights."
	incompatible_modules = list(/obj/item/module/solar_shielding, /obj/item/module/welding)

/obj/item/module/solar_shielding/on_install()
	rig.helmet.flash_protect = FLASH_PROTECTION_FLASH
	rig.helmet.tint = 2

/obj/item/module/solar_shielding/on_uninstall()
	rig.helmet.flash_protect = initial(rig.helmet.flash_protect)
	rig.helmet.tint = initial(rig.helmet.tint)

/obj/item/module/welding
	name = "RIG welding module"
	icon_state = "welding_shielding"
	desc = "A module installed into the visor of the suit, this projects a \
		polarized, holographic overlay in front of the user's eyes. It's rated high enough for \
		immunity against extremities such as spot and arc welding, solar eclipses, and handheld flashlights."
	module_type = MODULE_CAN_ACTIVATE
	incompatible_modules = list(/obj/item/module/solar_shielding, /obj/item/module/welding)

/obj/item/module/welding/on_module_powered()
	rig.helmet.flash_protect = FLASH_PROTECTION_WELDER

/obj/item/module/welding/on_module_unpowered()
	rig.helmet.flash_protect = initial(rig.helmet.flash_protect)

/obj/item/module/armor_booster
	name = "RIG armor booster module"
	desc = "A retrofitted series of retractable armor plates, allowing the suit to function as essentially power armor, \
		giving the user incredible protection against conventional firearms, or everyday attacks in close-quarters. \
		However, the additional plating cannot deploy alongside parts of the suit used for vacuum sealing, \
		so this extra armor provides zero ability for extravehicular activity while deployed."
	icon_state = "armor_booster"
	module_type = MODULE_CAN_ACTIVATE
	//removable = FALSE
	incompatible_modules = list(/obj/item/module/armor_booster, /obj/item/module/speed_booster)
	overlay_state_inactive = "module_armorbooster_off"
	overlay_state_active = "module_armorbooster_on"
	/// Armor values added to the suit parts.
	var/datum/armor/armor_mod = list(MELEE = 20, BULLET = 25, LASER = 5, ENERGY = 5)

/obj/item/module/armor_booster/on_module_powered()
	playsound(src, 'sound/mecha/mechmove03.ogg', 25, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
	var/list/parts = rig.helmet + rig
	for(var/obj/item/part as anything in parts)
		rig.armor.attachArmor(armor_mod)

/obj/item/module/armor_booster/on_module_unpowered()
	playsound(src, 'sound/mecha/mechmove03.ogg', 25, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
	var/list/parts = rig.helmet + rig
	for(var/obj/item/part as anything in parts)
		rig.armor.detachArmor(armor_mod)

/obj/item/module/speed_booster
	name = "RIG leg servomotors module"
	desc = "Inbuilt advanced combat leg servomotors, allowing the suit to perform high mobility functionality, \
		giving the user incredible agility and ability to perform quick moves in suit`s desealed state."
	icon_state = "pathfinder"
	module_type = MODULE_CAN_ACTIVATE
	removable = FALSE
	incompatible_modules = list(/obj/item/module/armor_booster, /obj/item/module/speed_booster)
	var/added_slowdown = -0.3

/obj/item/module/speed_booster/on_module_powered()
	playsound(src, 'sound/mecha/mechmove03.ogg', 25, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
	rig.combat_slowdown += added_slowdown
	rig.recalculate_slowdown()

/obj/item/module/speed_booster/on_module_unpowered()
	playsound(src, 'sound/mecha/mechmove03.ogg', 25, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
	rig.combat_slowdown = initial(rig.combat_slowdown)
	rig.recalculate_slowdown()

///obj/item/module/speed_booster/generate_worn_overlay(mutable_appearance/standing)
	//overlay_state_inactive = "[initial(overlay_state_inactive)]-[rig.icon_state]"
	//overlay_state_active = "[initial(overlay_state_active)]-[rig.icon_state]"
	//return ..()

/obj/item/module/emp_shield
	name = "RIG EMP shield module"
	desc = "A field inhibitor installed into the suit, protecting it against feedback such as \
		electromagnetic pulses that would otherwise damage the electronic systems of the suit or it's modules."
	icon_state = "empshield_advanced"
	incompatible_modules = list(/obj/item/module/emp_shield, /obj/item/module/emp_shield/cooldowned)

/obj/item/module/emp_shield/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_EMPPROOF_SELF, "emp_shield_module_self")

/obj/item/module/emp_shield/on_install()
	ADD_TRAIT(rig, TRAIT_EMPPROOF_SELF, "emp_shield_module")
	ADD_TRAIT(rig, TRAIT_EMPPROOF_CONTENTS, "emp_shield_module")

/obj/item/module/emp_shield/on_uninstall()
	REMOVE_TRAIT(rig, TRAIT_EMPPROOF_SELF, "emp_shield_module")
	REMOVE_TRAIT(rig, TRAIT_EMPPROOF_CONTENTS, "emp_shield_module")

/obj/item/module/emp_shield/cooldowned
	name = "RIG EMP cooldowned shield module"
	desc = "A field inhibitor installed into the suit, protecting it against feedback such as \
		electromagnetic pulses that would otherwise damage the electronic systems of the suit or it's modules. \
		However, it will take some time to recharge after that."
	icon_state = "empshield"
	incompatible_modules = list(/obj/item/module/emp_shield, /obj/item/module/emp_shield/cooldowned)
	var/warning = TRUE
	var/overloadtimer = 10 SECONDS
	COOLDOWN_DECLARE(emp_shield_cd)

/obj/item/module/emp_shield/cooldowned/on_install()
	RegisterSignal(rig, COMSIG_ATOM_EMP_ACT, PROC_REF(overloaded))

/obj/item/module/emp_shield/cooldowned/on_uninstall()
	UnregisterSignal(rig, COMSIG_ATOM_EMP_ACT)

/obj/item/module/emp_shield/cooldowned/proc/overloaded(datum/source, severity)
	var/mob/living/carbon/human/human_target = rig.loc
	if(ishuman(human_target) && human_target.wear_suit == rig && warning)
		to_chat(human_target, span_userdanger("You see on the interface that [src] won't protect you for like 10 seconds."))
		warning = FALSE
	REMOVE_TRAIT(rig, TRAIT_EMPPROOF_SELF, "emp_shield_module")
	REMOVE_TRAIT(rig, TRAIT_EMPPROOF_CONTENTS, "emp_shield_module")
	addtimer(CALLBACK(src, PROC_REF(refreshed), human_target), overloadtimer, TIMER_OVERRIDE | TIMER_UNIQUE)

/obj/item/module/emp_shield/cooldowned/proc/refreshed(mob/living/carbon/human/human_target)
	if(human_target && ishuman(human_target))
		to_chat(human_target, span_usernotice("You see on the interface that [src] seems to be functioning properly again."))
	warning = TRUE
	ADD_TRAIT(rig, TRAIT_EMPPROOF_SELF, "emp_shield_module")
	ADD_TRAIT(rig, TRAIT_EMPPROOF_CONTENTS, "emp_shield_module")

/obj/item/module/emp_shield/pulse
	name = "RIG EMP pulse module"
	desc = "This module is normally set to activate on dramatic gestures, inverting and expanding the suit's \
		EMP dampening shield to cause an electromagnetic pulse of its own. While this won't interfere with the wearer, \
		it will piss off everyone around them."
	icon_state = "emp_pulse"
	module_type = MODULE_USABLE
	cooldown_time = 8 SECONDS

/obj/item/module/emp_shield/pulse/on_use()
	. = ..()
	if(!.)
		return FALSE
	playsound(src, 'sound/effects/empulse.ogg', 60, TRUE)
	empulse(src, heavy_range = 4, light_range = 6)

/obj/item/module/breacher
	name = "RIG breacher module"
	desc = "Provides ability to breach through walls and people."
	icon_state = "breacher"
	removable = FALSE
	module_type = MODULE_CAN_ACTIVATE
	incompatible_modules = list(/obj/item/module/breacher)

/obj/item/module/breacher/on_module_powered()
	ADD_TRAIT(rig.wearer, TRAIT_HULK, "breacher_module")
	ADD_TRAIT(rig.wearer, TRAIT_PUSHIMMUNE, "breacher_module")

/obj/item/module/breacher/on_module_unpowered()
	if(rig.wearer)
		REMOVE_TRAIT(rig.wearer, TRAIT_HULK, "breacher_module")
		REMOVE_TRAIT(rig.wearer, TRAIT_PUSHIMMUNE, "breacher_module")

///Plate Compression - Compresses the suit to normal size
/obj/item/module/plate_compression
	name = "RIG plate compression module"
	desc = "A module that keeps the suit in a very tightly fit state, lowering the overall size. \
		Due to the pressure on all the parts, typical storage modules do not fit."
	icon_state = "plate_compression"
	complexity = 2
	incompatible_modules = list(/obj/item/module/plate_compression, /obj/item/module/storage)
	/// The size we set the suit to.
	var/new_size = WEIGHT_CLASS_NORMAL
	/// The suit's size before the module is installed.
	var/old_size

/obj/item/module/plate_compression/on_install()
	old_size = rig.w_class
	rig.w_class = new_size

/obj/item/module/plate_compression/on_uninstall(deleting = FALSE)
	rig.w_class = old_size
	old_size = null
	if(!rig.loc)
		return
	//var/datum/storage/holding_storage = rig.loc.atom_storage
	//if(!holding_storage || holding_storage.max_specific_storage >= rig.w_class)
	//	return
	rig.forceMove(drop_location())

///Pepper Shoulders - When hit, reacts with a spray of pepper spray around the user.
/obj/item/module/pepper_shoulders
	name = "RIG pepper shoulders module"
	desc = "A module that attaches two pepper sprayers on shoulders of a MODsuit, reacting to touch with a spray around the user."
	icon_state = "pepper_shoulder"
	module_type = MODULE_USABLE
	complexity = 1
	incompatible_modules = list(/obj/item/module/pepper_shoulders)
	cooldown_time = 5 SECONDS
	//overlay_state_inactive = "module_pepper"
	//overlay_state_use = "module_pepper_used"

/obj/item/module/pepper_shoulders/on_rig_change_power_state()
	..()
	if(active)
		RegisterSignal(rig.wearer, COMSIG_HUMAN_CHECK_SHIELDS, PROC_REF(on_check_shields))
	else
		UnregisterSignal(rig.wearer, COMSIG_HUMAN_CHECK_SHIELDS)

/obj/item/module/pepper_shoulders/on_use()
	. = ..()
	if(!.)
		return FALSE
	playsound(src, 'sound/effects/spray.ogg', 30, TRUE, -6)
	var/datum/reagents/capsaicin_holder = new(10)
	capsaicin_holder.add_reagent(/datum/reagent/consumable/condensedcapsaicin, 10)
	var/datum/effect_system/fluid_spread/smoke/chem/quick/smoke = new
	smoke.set_up(1, holder = src, location = get_turf(src), carry = capsaicin_holder)
	smoke.start(log = TRUE)
	QDEL_NULL(capsaicin_holder) // Reagents have a ref to their holder which has a ref to them. No leaks please.

/obj/item/module/pepper_shoulders/proc/on_check_shields()
	SIGNAL_HANDLER

	if(!COOLDOWN_FINISHED(src, cooldown_timer))
		return
	rig.wearer.visible_message(span_warning("[src] reacts to the attack with a smoke of pepper spray!"), span_notice("Your [src] releases a cloud of pepper spray!"))
	on_use()

///Holster - Instantly holsters any not huge gun.
/obj/item/module/holster
	name = "RIG holster module"
	desc = "Based off typical storage compartments, this system allows the suit to holster a \
		standard firearm across its surface and allow for extremely quick retrieval. \
		While some users prefer the chest, others the forearm for quick deployment, \
		some law enforcement prefer the holster to extend from the thigh."
	icon_state = "holster"
	complexity = 2
	incompatible_modules = list(/obj/item/module/holster)
	cooldown_time = 0.5 SECONDS
	module_type = MODULE_USABLE
	//allow_flags = MODULE_ALLOW_INACTIVE
	/// Gun we have holstered.
	var/obj/item/gun/holstered

/obj/item/module/holster/on_use()
	. = ..()
	if(!.)
		return FALSE
	if(!holstered)
		var/obj/item/gun/holding = rig.wearer.get_active_held_item()
		if(!holding)
			balloon_alert(rig.wearer, "nothing to holster!")
			return
		if(!istype(holding) || holding.w_class > WEIGHT_CLASS_BULKY)
			balloon_alert(rig.wearer, "it doesn't fit!")
			return
		if(rig.wearer.transferItemToLoc(holding, src, force = FALSE, silent = TRUE))
			holstered = holding
			balloon_alert(rig.wearer, "weapon holstered")
			//playsound(src, 'sound/weapons/gun/revolver/empty.ogg', 100, TRUE)
	else if(rig.wearer.put_in_active_hand(holstered, forced = FALSE, ignore_animation = TRUE))
		balloon_alert(rig.wearer, "weapon drawn")
		//playsound(src, 'sound/weapons/gun/revolver/empty.ogg', 100, TRUE)
	else
		balloon_alert(rig.wearer, "holster full!")

/obj/item/module/holster/on_uninstall(deleting = FALSE)
	if(holstered)
		holstered.forceMove(drop_location())

/obj/item/module/holster/Exited(atom/movable/gone, direction)
	. = ..()
	if(gone == holstered)
		holstered = null

/obj/item/module/holster/Destroy()
	QDEL_NULL(holstered)
	return ..()







/////////////////////////
/obj/item/module/storage
	name = "RIG storage module"
	desc = "What amounts to a series of integrated storage compartments and specialized pockets installed across \
		the surface of the suit, useful for storing various bits, and or bobs."
	icon_state = "storage"
	/// Max weight class of items in the storage.
	var/max_w_class = WEIGHT_CLASS_NORMAL
	/// Max combined weight of all items in the storage.
	var/max_combined_w_class = 15
	/// Max amount of items in the storage.
	var/max_items = 5
	incompatible_modules = list(/obj/item/module/storage)

/datum/component/storage/concrete/rig
	max_items = 5
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = 15
	rustle_sound = FALSE

/obj/item/module/storage/Initialize(mapload)
	. = ..()
	var/datum/component/storage/concrete/rig/rig_pockets = AddComponent(/datum/component/storage/concrete/rig)
	rig_pockets.max_items = max_items
	rig_pockets.max_w_class = max_w_class
	rig_pockets.max_combined_w_class = max_combined_w_class

/obj/item/module/storage/on_install()
	. = ..()
