#define ARMORID "armor-[melee]-[bullet]-[laser]-[energy]-[bomb]-[bio]-[rad]-[fire]-[acid]-[magic]-[wound]-[electric]"
/obj/item/module
	name = "module"
	desc = "module"
	icon = 'modular_dripstation/icons/obj/rig_modules.dmi'
	icon_state = "module"
	var/obj/item/clothing/suit/space/hardsuit/dualmode/rig 
	var/complexity = 1	//how complex module is
	var/removable = TRUE
	var/active = FALSE
	var/powered = FALSE
	var/list/incompatible_modules = list()
	var/list/compatible_modules = list()
	var/overlay_state_use
	var/overlay_icon_file = 'modular_dripstation/icons/mob/clothing/spacesuits/suits.dmi'
	var/overlay_state_inactive
	var/overlay_state_active
	var/allow_flags = NONE
	var/module_type = MODULE_PASSIVE
	/// If we're an active module, what item are we?
	var/obj/item/device
	/// The mouse button needed to use this module
	var/used_signal
	/// List of REF()s mobs we are pinned to, linked with their action buttons
	var/list/pinned_to = list()

	/// Power use when idle
	var/idle_power_cost = DEFAULT_CHARGE_DRAIN * 0
	/// Power use when active
	var/active_power_cost = DEFAULT_CHARGE_DRAIN * 0
	/// Power use when used, we call it manually
	var/use_power_cost = DEFAULT_CHARGE_DRAIN * 0
	/// Timer for the cooldown
	var/cooldown_time = 1 SECONDS
	COOLDOWN_DECLARE(cooldown_timer)

/obj/item/module/Initialize(mapload)
	. = ..()
	if(module_type != MODULE_ACTIVE)
		return
	if(ispath(device))
		device = new device(src)
		ADD_TRAIT(device, TRAIT_NODROP, RIG_TRAIT)
		RegisterSignal(device, COMSIG_QDELETING, PROC_REF(on_device_deletion))
		RegisterSignal(src, COMSIG_ATOM_EXITED, PROC_REF(on_exit))

/obj/item/module/Destroy()
	remove_module(rig)
	if(device)
		UnregisterSignal(device, COMSIG_QDELETING)
		QDEL_NULL(device)
	return ..()

/// Called when the device gets deleted on active modules
/obj/item/module/proc/on_device_deletion(datum/source)
	SIGNAL_HANDLER

	if(source == device)
		device = null
		qdel(src)

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

/// Called when the device moves to a different place on active modules
/obj/item/module/proc/on_exit(datum/source, atom/movable/part, direction)
	SIGNAL_HANDLER

	if(!active)
		return
	if(part.loc == src)
		return
	if(part.loc == rig.wearer)
		return
	if(part == device)
		on_module_deactivate(display_message = FALSE)

/// Updates the signal used by active modules to be activated
/obj/item/module/proc/update_signal(value)
	switch(value)
		if(MIDDLE_CLICK)
			rig.selected_module.used_signal = COMSIG_MOB_MIDDLECLICKON
		if(ALT_CLICK)
			rig.selected_module.used_signal = COMSIG_MOB_ALTCLICKON
	RegisterSignal(rig.wearer, rig.selected_module.used_signal, TYPE_PROC_REF(/obj/item/module, on_special_click))

/// Called when an activated module without a device is active and the user alt/middle-clicks
/obj/item/module/proc/on_special_click(mob/source, atom/target)
	SIGNAL_HANDLER
	on_select_use(target)
	return COMSIG_MOB_CANCEL_CLICKON

/// Called when an activated module without a device is used
/obj/item/module/proc/on_select_use(atom/target)
	if(!(allow_flags & MODULE_ALLOW_INCAPACITATED) && rig.wearer.incapacitated(IGNORE_GRAB))
		return FALSE
	rig.wearer.face_atom(target)
	if(!on_use(target))
		return FALSE
	return TRUE

/// Pins the module to the user's action buttons
/obj/item/module/proc/pin(mob/user)
	if(module_type == MODULE_PASSIVE)
		return

	var/datum/action/item_action/rig/pinned_module/existing_action = pinned_to[REF(user)]
	if(existing_action)
		rig.remove_item_action(existing_action)
		return

	var/datum/action/item_action/rig/pinned_module/new_action = new(rig, src, user)
	rig.add_item_action(new_action)

/obj/item/module/proc/try_to_insert_module(obj/item/clothing/suit/space/hardsuit/dualmode/new_rig, mob/user, qdel_on_fail = FALSE)
	if(can_insert_module(new_rig, user, qdel_on_fail))
		insert_module(new_rig, user)
	else if(user)
		visible_message(span_warning("\The [user] tries to insert [src] into [new_rig], but fails!"))
		return FALSE

/obj/item/module/proc/can_insert_module(obj/item/clothing/suit/space/hardsuit/dualmode/new_rig, qdel_on_fail = FALSE)
	var/compatible = TRUE
	for(var/obj/item/module/M in new_rig.inserted_modules)
		if(locate(src) in M.incompatible_modules && !(locate(src) in M.compatible_modules))
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

/obj/item/module/proc/remove_module(obj/item/clothing/suit/space/hardsuit/dualmode/currig)
	if(!rig)
		rig = currig	//get backup if fucked
	if(rig)
		rig.current_complexity -= complexity
		rig.inserted_modules -= src
		//SEND_SIGNAL(rig, COMSIG_RIG_MODULE_REMOVAL, src)
		if(/*rig.active && */active)
			on_module_deactivate()
		on_uninstall()
	//rig.current_complexity = min(rig.current_complexity, rig.max_complexity)	//sanity check
		UnregisterSignal(rig, COMSIG_RIG_TRIGGER_POWER)
		UnregisterSignal(rig, COMSIG_ITEM_GET_WORN_OVERLAYS)
		rig = null
		return TRUE
	return FALSE

/// Called when the module is selected from the TGUI, radial or the action button
/obj/item/module/proc/on_trigger_module()
	if(((!rig.active) && !(allow_flags & MODULE_ALLOW_INACTIVE)) || module_type == MODULE_PASSIVE)
		//return
	//if(!rig.active || !rig.wearer)
		if(rig.wearer)
			balloon_alert(rig.wearer, "not active!")
		return
	if(module_type != MODULE_USABLE)
		if(!active)
			on_module_activate()
		else
			on_module_deactivate()
	else
		on_use(rig.wearer)
	SEND_SIGNAL(src, COMSIG_MODULE_TRIGGERED, rig)

/obj/item/module/proc/on_module_activate()
	if(!COOLDOWN_FINISHED(src, cooldown_timer))
		balloon_alert(rig.wearer, "on cooldown!")
		return
	//if(!rig.active)
	//	balloon_alert(rig.wearer, "rig unpowered!")
	//	return
	if(!(allow_flags & MODULE_ALLOW_PHASEOUT) && istype(rig.wearer.loc, /obj/effect/dummy/phased_mob))
		to_chat(rig.wearer, span_warning("You cannot activate this right now."))
		return
	
	on_change_active_state(TRUE)

	if(module_type == MODULE_ACTIVE)
		if(rig.selected_module/* && !rig.selected_module.on_module_deactivate(display_message = FALSE)*/)
			return FALSE
		rig.selected_module = src
		if(device)
			if(rig.wearer.put_in_hands(device))
				balloon_alert(rig.wearer, "[device] extended")
				RegisterSignal(rig.wearer, COMSIG_ATOM_EXITED, PROC_REF(on_exit))
				//RegisterSignal(rig.wearer, COMSIG_KB_MOB_DROPITEM_DOWN, PROC_REF(dropkey))
			else
				balloon_alert(rig.wearer, "can't extend [device]!")
				rig.wearer.transferItemToLoc(device, src, force = TRUE)
				return FALSE
		else
			var/used_button = /*rig.wearer.client?.prefs.read_preference(/datum/preference/choiced/mod_select) || */MIDDLE_CLICK
			update_signal(used_button)
			balloon_alert(rig.wearer, "[src] activated, [used_button]-click to use")

	//on_change_power_state(TRUE)

	COOLDOWN_START(src, cooldown_timer, cooldown_time)
	SEND_SIGNAL(src, COMSIG_MODULE_ACTIVATED, rig.wearer)
	return TRUE

/obj/item/module/proc/on_module_deactivate(display_message = TRUE)
	on_change_active_state(FALSE)
	if(module_type == MODULE_ACTIVE)
		rig.selected_module = null
		if(display_message)
			balloon_alert(rig.wearer, device ? "[device] retracted" : "[src] deactivated")
		if(device)
			rig.wearer.transferItemToLoc(device, src, force = TRUE)
			UnregisterSignal(rig.wearer, COMSIG_ATOM_EXITED)
			//UnregisterSignal(rig.wearer, COMSIG_KB_MOB_DROPITEM_DOWN)
		else
			UnregisterSignal(rig.wearer, used_signal)
			used_signal = null
	//on_change_power_state(FALSE)
	SEND_SIGNAL(src, COMSIG_MODULE_DEACTIVATED, rig.wearer)
	return TRUE
	

/obj/item/module/proc/on_change_active_state(new_state = null)
	if(new_state)
		active = new_state
	else
		active = !active
	balloon_alert(rig.wearer, "[src.name] [active?"activeted":"deactiveted"]!")
	//icon_state = "[icon_state]_[active]"
	//update_appearance(UPDATE_ICON)

/obj/item/module/proc/on_change_power_state(new_power_state = FALSE)
	if(new_power_state != powered && module_type != MODULE_PASSIVE && module_type != MODULE_USABLE)
		powered = new_power_state
		if(powered)
			on_module_powered()
		else
			on_module_unpowered()

/obj/item/module/proc/on_rig_change_power_state()
	SIGNAL_HANDLER
	if(rig.active && module_type != MODULE_PASSIVE && module_type != MODULE_USABLE && active)
		on_change_power_state(TRUE)
	else
		on_change_power_state(FALSE)

/// Called on the RIG's process
/obj/item/module/proc/on_process(seconds_per_tick)
	if(active)
		if(!drain_power(active_power_cost * seconds_per_tick))
			//on_module_deactivate()
			on_change_power_state(FALSE)
			return FALSE
		on_change_power_state(TRUE)
		on_active_process(seconds_per_tick)
	else
		drain_power(idle_power_cost * seconds_per_tick)
	return TRUE

/// Drains power from the suit charge
/obj/item/module/proc/drain_power(amount)
	if(!check_power(amount))
		return FALSE
	rig.subtract_charge(amount)
	rig.update_charge_alert()
	return TRUE

/// Checks if there is enough power in the suit
/obj/item/module/proc/check_power(amount)
	return rig.check_charge(amount)

//////////////////////////////////////////////////////
/////////////////////EFFECT PROC//////////////////////
//////////////////////////////////////////////////////
/// Called on the MODsuit's process if it is an active module
/obj/item/module/proc/on_active_process(seconds_per_tick)
	return

///apply|remove effects here
/obj/item/module/proc/on_install()
	return

/obj/item/module/proc/on_uninstall()
	return

///apply|remove effects here
/obj/item/module/proc/on_equip()
	return

/obj/item/module/proc/on_unequip()
	return

///on|off effects here
/obj/item/module/proc/on_module_powered()
	return

/obj/item/module/proc/on_module_unpowered()
	return

/obj/item/module/proc/on_use(atom/target = null)
	if(!COOLDOWN_FINISHED(src, cooldown_timer))
		balloon_alert(rig.wearer, "on cooldown!")
		return FALSE
	if(!(allow_flags & MODULE_ALLOW_PHASEOUT) && istype(rig.wearer.loc, /obj/effect/dummy/phased_mob))
		//specifically a to_chat because the user is phased out.
		to_chat(rig.wearer, span_warning("Phase out to use this module!"))
		balloon_alert(rig.wearer, "not now!")
		return FALSE
	if(!drain_power(use_power_cost))
		balloon_alert(rig.wearer, "not enough power!")
		return FALSE
	COOLDOWN_START(src, cooldown_timer, cooldown_time)
	SEND_SIGNAL(src, COMSIG_MODULE_USED)
	return TRUE


//////////////////////////////////////////////////////
/obj/item/module/shield
	name = "RIG advanced energy shield module"
	desc = "A personal, protective forcefield typically seen in military applications. \
		This advanced deflector shield is essentially a scaled down version of those seen on starships, \
		and the power cost can be an easy indicator of this. However, it is capable of blocking nearly any incoming attack, \
		though with its' low amount of separate charges, the user remains mortal."
	icon_state = "shield"
	var/max_charges = 3 //How many charges total the shielding has
	var/recharge_delay = 20 SECONDS //How long after we've been shot before we can start recharging. 20 seconds here
	var/recharge_delay_after_charge = 1 SECONDS //How long after we've been recharged before we can start recharging. 1 second here
	var/recharge_rate = 1 //How quickly the shield recharges once it starts charging
	var/starting_charge = 0	//if null starts with max_charges
	complexity = 3
	module_type = MODULE_TOGGLE
	idle_power_cost = DEFAULT_CHARGE_DRAIN * 0.5
	use_power_cost = DEFAULT_CHARGE_DRAIN * 2
	var/shield_state = "shield-old"
	/// The icon file of the shield.
	var/shield_icon_file = 'modular_dripstation/icons/effects/shield.dmi'
	incompatible_modules = list(/obj/item/module/shield)

/obj/item/module/shield/on_install()
	rig.AddComponent(/datum/component/shielded, shield_icon_file, shield_state, recharge_delay, ITEM_SLOT_OCLOTHING, \
	charge_i_d = recharge_delay_after_charge, max_charge = 0, starting_charges = 0, recharge_rating = recharge_rate, sparks_enable = TRUE)

/obj/item/module/shield/on_module_powered()
	var/datum/component/shielded/shield = rig.GetComponent(/datum/component/shielded)
	shield.max_charges = max_charges
	shield.starting_charges = starting_charge
	RegisterSignal(rig.wearer, COMSIG_HUMAN_CHECK_SHIELDS, PROC_REF(shield_reaction))
	drain_power(use_power_cost)

/obj/item/module/shield/on_module_unpowered()
	var/datum/component/shielded/shield = rig.GetComponent(/datum/component/shielded)
	starting_charge = shield.current_charges
	max_charges = shield.max_charges
	UnregisterSignal(rig.wearer, COMSIG_HUMAN_CHECK_SHIELDS)

/obj/item/module/shield/on_uninstall()
	var/datum/component/shielded/shield = rig.GetComponent(/datum/component/shielded)
	qdel(shield)

/obj/item/module/shield/proc/shield_reaction(mob/living/carbon/human/owner,
	atom/movable/hitby,
	damage = 0,
	attack_text = "the attack",
	attack_type = MELEE_ATTACK,
	armour_penetration = 0,
	damage_type = BRUTE
)
	SIGNAL_HANDLER

	if(SEND_SIGNAL(rig, COMSIG_ITEM_HIT_REACT, owner, hitby, attack_text, 0, damage, attack_type, damage_type) & COMPONENT_HIT_REACTION_BLOCK)
		drain_power(use_power_cost)
		return SHIELD_BLOCK
	return NONE

/obj/item/module/shield/syndicate
	name = "RIG Cybersun brand energy shield module"
	max_charges = 1
	recharge_delay = 10 SECONDS
	shield_state = "shield-red"
	icon_state = "shield-syndie"

/obj/item/module/shield/nt
	name = "RIG Nanotrasen brand energy shield module"
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
	idle_power_cost = DEFAULT_CHARGE_DRAIN * 0 //magic
	use_power_cost = DEFAULT_CHARGE_DRAIN * 0 //magic too
	shield_state = "mageshield"
	compatible_modules = list(/obj/item/module/shield/wizard)

/obj/item/module/shield/wizard/on_module_powered()
	return

/obj/item/module/shield/wizard/on_module_unpowered()
	return

/obj/item/module/shield/wizard/on_install()
	rig.AddComponent(/datum/component/shielded,'modular_dripstation/icons/effects/shield.dmi', shield_state, recharge_delay, ITEM_SLOT_OCLOTHING, charge_i_d = recharge_delay_after_charge, max_charge = max_charges, starting_charges = starting_charge, recharge_rating = recharge_rate, sparks_enable = TRUE)

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
	module_type = MODULE_TOGGLE
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
	active_power_cost = DEFAULT_CHARGE_DRAIN * 2
	module_type = MODULE_TOGGLE
	removable = FALSE
	complexity = 3
	incompatible_modules = list(/obj/item/module/armor_booster, /obj/item/module/ablative_armor, /obj/item/module/speed_booster)
	//overlay_state_inactive = "module_armorbooster_off"
	//overlay_state_active = "module_armorbooster_on"
	/// Armor values added to the suit parts.
	//var/datum/armor/armor_mod = list(MELEE = 20, BULLET = 25, LASER = 5, ENERGY = 5)
	var/datum/armor/new_armor
	var/datum/armor/old_armor
	var/datum/armor/armor_mod = new /datum/armor/armor_booster

/datum/armor/armor_booster
	melee = 15
	bullet = 25
	laser = 5
	energy = 5
	bomb = 10

/datum/armor/armor_booster/New()
	tag = ARMORID
	GenerateTag()

/obj/item/module/armor_booster/on_install()
	old_armor = rig.armor
	new_armor = rig.armor.attachArmor(armor_mod)
	rig.AddComponent(/datum/component/hardened)
	rig.helmet.AddComponent(/datum/component/hardened)

/obj/item/module/armor_booster/on_module_powered()
	playsound(src, 'sound/mecha/mechmove03.ogg', 25, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
	rig.armor = new_armor
	rig.helmet.armor = new_armor
	rig.armor_pen_remove_mod = 0.65
	rig.helmet.armor_pen_remove_mod = 0.65

/obj/item/module/armor_booster/on_module_unpowered()
	playsound(src, 'sound/mecha/mechmove03.ogg', 25, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
	rig.armor = old_armor//rig.armor.detachArmor(armor_mod)
	rig.helmet.armor = old_armor//rig.helmet.armor.detachArmor(armor_mod)
	rig.armor_pen_remove_mod = initial(rig.armor_pen_remove_mod)
	rig.helmet.armor_pen_remove_mod = initial(rig.helmet.armor_pen_remove_mod)

/obj/item/module/armor_booster/on_uninstall()
	var/datum/component/hardened/hard = rig.GetComponent(/datum/component/hardened)
	qdel(hard)
	if(rig.helmet)
		hard = rig.helmet.GetComponent(/datum/component/hardened)
		qdel(hard)
	old_armor = null
	new_armor = null


/obj/item/module/ablative_armor
	name = "RIG prototype ablative armor module"
	desc = "Ablative armor for Nanotrasen spec ops."
	icon_state = "ablative_armor"
	active_power_cost = DEFAULT_CHARGE_DRAIN * 2
	module_type = MODULE_TOGGLE
	removable = FALSE
	complexity = 2
	incompatible_modules = list(/obj/item/module/armor_booster, /obj/item/module/ablative_armor, /obj/item/module/speed_booster)
	var/list/zones_to_protect = list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN)
	var/hit_reflect_chance = 50
	var/datum/armor/new_armor
	var/datum/armor/old_armor
	var/datum/armor/armor_mod = new /datum/armor/ablative_armor

/datum/armor/ablative_armor
	melee = 0
	bullet = 0
	laser = 15
	energy = 15
	bomb = 0

/datum/armor/ablative_armor/New()
	tag = ARMORID
	GenerateTag()

/obj/item/module/ablative_armor/on_install()
	old_armor = rig.armor
	new_armor = rig.armor.attachArmor(armor_mod)

/obj/item/module/ablative_armor/on_module_powered()
	RegisterSignal(rig, COMSIG_RIG_REFLECT, PROC_REF(reflection))
	rig.armor = new_armor
	rig.helmet.armor = new_armor

/obj/item/module/ablative_armor/on_module_unpowered()
	UnregisterSignal(rig, COMSIG_RIG_REFLECT)
	rig.armor = old_armor
	rig.helmet.armor = old_armor

/obj/item/module/ablative_armor/on_uninstall()
	old_armor = null
	new_armor = null

/obj/item/module/ablative_armor/proc/reflection(def_zone)
	var/obj/item/H = rig.wearer?.get_item_by_slot(ITEM_SLOT_HEAD)
	var/list/zones = zones_to_protect
	if(istype(H, rig.helmettype))
		zones += BODY_ZONE_HEAD
	if(def_zone in zones && prob(hit_reflect_chance))
		return RIG_REFLECT
	return

/obj/item/module/ablative_armor/full
	name = "RIG fullbody ablative armor module"
	zones_to_protect = list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)

/obj/item/module/speed_booster
	name = "RIG leg servomotors module"
	desc = "Inbuilt advanced specops grade leg servomotors, allow the suit to perform high mobility functionality, \
		giving the user incredible agility and ability to perform quick moves in suit`s desealed state."
	icon_state = "pathfinder"
	module_type = MODULE_TOGGLE
	removable = FALSE
	complexity = 2
	incompatible_modules = list(/obj/item/module/armor_booster, /obj/item/module/ablative_armor, /obj/item/module/speed_booster)
	var/added_slowdown = -0.5

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

/obj/item/module/speed_booster/civilian
	name = "RIG emergency response leg servomotors module"
	desc = "Inbuilt civilian grade leg servomotors, allow the suit to perform high mobility functionality, \
		giving the user agility and ability to perform quick moves in suit`s desealed state. \
		Since this type of servomotors aren`t very energy efficient, it is only inbuilt in paramedics RIGs,"
	complexity = 5
	added_slowdown = -0.4
	active_power_cost = DEFAULT_CHARGE_DRAIN * 2.5

///Springlock Mechanism - allows your RIG to seal faster, but reagents are very dangerous.
/obj/item/module/springlock
	name = "RIG springlock module"
	desc = "A module that spans the entire size of the RIG unit, sitting under the outer shell. \
		This mechanical exoskeleton pushes out of the way when the user enters and it helps in sealing \
		up, but was taken out of modern suits because of the springlock's tendency to \"snap\" back \
		into place when exposed to humidity. You know what it's like to have an entire exoskeleton enter you?"
	icon_state = "springlock"
	complexity = 3 // it is inside every part of your suit, so
	incompatible_modules = list(/obj/item/module/springlock)
	module_type = MODULE_TOGGLE
	var/death_trap = TRUE

/obj/item/module/springlock/screwdriver_act(mob/living/user, obj/item/tool)
	. = ..()
	death_trap = !death_trap
	balloon_alert(user, "you set deathtrap [death_trap? "active" : "inactive"]")

/obj/item/module/springlock/on_module_powered()
	RegisterSignal(rig.wearer, COMSIG_REAGENT_EXPOSE_MOB, PROC_REF(on_wearer_exposed))
	rig.seal_time *= 0.2
	rig.mobility = TRUE

/obj/item/module/springlock/on_module_unpowered()
	UnregisterSignal(rig.wearer, COMSIG_REAGENT_EXPOSE_MOB)
	rig.seal_time *= 5
	rig.mobility = initial(rig.mobility)

///Signal fired when wearer is exposed to reagents
/obj/item/module/springlock/proc/on_wearer_exposed(atom/source, mob/exposed_mob, methods, reac_volume, show_message)
	SIGNAL_HANDLER

	if(!(methods & (VAPOR|PATCH|TOUCH)))
		return //remove non-touch reagent exposure
	to_chat(rig.wearer, span_danger("[src] makes an ominous click sound..."))
	playsound(src, 'modular_dripstation/sound/item/springlock.ogg', 75, TRUE)
	addtimer(CALLBACK(src, PROC_REF(snap_shut)), rand(3 SECONDS, 5 SECONDS))
	RegisterSignal(rig, COMSIG_RIG_ACTIVATE, PROC_REF(on_activate_spring_block))

///Signal fired when wearer attempts to activate/deactivate suits
/obj/item/module/springlock/proc/on_activate_spring_block(datum/source, user)
	SIGNAL_HANDLER

	if(death_trap)
		balloon_alert(user, "springlocks aren't responding...?")
	else
		balloon_alert(user, "you disable it just in time")
	return RIG_CANCEL_ACTIVATE

///Delayed death proc of the suit after the wearer is exposed to reagents
/obj/item/module/springlock/proc/snap_shut()
	UnregisterSignal(rig, COMSIG_RIG_ACTIVATE)
	if(!rig.wearer) //while there is a guaranteed user when on_wearer_exposed() fires, that isn't the same case for this proc
		return
	rig.wearer.visible_message("[src] inside [rig.wearer]'s [rig.name] snaps shut, mutilating the user inside!", span_userdanger("*SNAP*"))
	rig.wearer.emote("scream")
	playsound(rig.wearer, 'sound/effects/snap.ogg', 75, TRUE, frequency = 0.5)
	playsound(rig.wearer, 'sound/effects/splat.ogg', 50, TRUE, frequency = 0.5)
	//rig.wearer.client?.give_award(/datum/award/achievement/misc/springlock, rig.wearer)
	rig.wearer.apply_damage(500, BRUTE, forced = TRUE, spread_damage = TRUE, sharpness = SHARP_POINTY) //boggers, bogchamp, etc
	if(!HAS_TRAIT(rig.wearer, TRAIT_NODEATH))
		rig.wearer.investigate_log("has been killed by [src].", INVESTIGATE_DEATHS)
		rig.wearer.death() //just in case, for some reason, they're still alive
	flash_color(rig.wearer, flash_color = "#FF0000", flash_time = 10 SECONDS)

/obj/item/module/demoralizer
	name = "RIG psi-echo demoralizer module"
	desc = "One incredibly morbid member of the RND team at Donk Co posed a question to her colleagues. \
			'I desire the power to scar my enemies mentally as I murder them. Who will stop me implementing this in our next project?' \
			And thus the Psi-Echo Demoralizer Device was reluctantly invented. The future of psychological warfare, today!"
	//icon_state = "brain_hurties"
	complexity = 0
	idle_power_cost = DEFAULT_CHARGE_DRAIN * 0.1
	//removable = FALSE
	var/datum/proximity_monitor/advanced/demoraliser/demoralizer

/obj/item/module/demoralizer/on_module_powered()
	var/datum/demoralise_moods/module/mood_category = new()
	demoralizer = new(rig.wearer, 7, TRUE, mood_category)

/obj/item/module/demoralizer/on_module_unpowered(deleting = FALSE)
	QDEL_NULL(demoralizer)

/obj/item/module/demoralizer/advanced
	name = "RIG psi-echo terrorize module"
	desc = "Cybersun prototype, advanced demoralizer module originaly developed by Donk Co. \
			This module active ability provides user to send enemy mind in agony, disrupting their ability to \
			concentrate and leading to shock and heart stop."
	complexity = 2
	module_type = MODULE_ACTIVE
	use_power_cost = DEFAULT_CHARGE_DRAIN * 5
	cooldown_time = 5 SECONDS
	//removable = FALSE

/obj/item/module/demoralizer/advanced/on_select_use(atom/target)
	. = ..()
	if(!.)
		return FALSE
	if(!ishuman(target))
		balloon_alert(rig.wearer, "invalid target!")
		return
	var/mob/living/carbon/human/H = target
	var/mind_fortified_rating = H.check_fear_protection(ABNORMAL_FEAR_SOURCE)
	if(!mind_fortified_rating)
		return
	H.apply_status_effect(/datum/status_effect/terrified, fear_value = 50/mind_fortified_rating)

/*
 * Applies a role-based mood if you can see the parent.
 *
 * - Applies a mood to people who are in visible range of the item.
 * - Does not re-apply mood to people who already have it.
 * - Sends a signal if a mood is successfully applied.
 */
/datum/proximity_monitor/advanced/demoraliser
	var/datum/demoralise_moods/moods

/datum/proximity_monitor/advanced/demoraliser/New(atom/_host, range, _ignore_if_not_on_turf = TRUE, datum/demoralise_moods/moods)
	. = ..()
	src.moods = moods
	RegisterSignal(host, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine))

/datum/proximity_monitor/advanced/demoraliser/field_turf_crossed(atom/movable/crossed, turf/location)
	if (!isliving(crossed))
		return
	if (!can_see(crossed, host, current_range))
		return
	on_seen(crossed)

/*
 * Signal proc for [COMSIG_ATOM_EXAMINE].
 * Immediately tries to apply a mood to the examiner, ignoring the proximity check.
 * If someone wants to make themselves sad through a camera that's their choice I guess.
 */
/datum/proximity_monitor/advanced/demoraliser/proc/on_examine(datum/source, mob/examiner)
	SIGNAL_HANDLER
	if (isliving(examiner))
		on_seen(examiner)

/**
 * Called when someone is looking at a demoralising object.
 * Applies a mood if they are conscious and don't already have it.
 * Different moods are applied based on whether they are an antagonist, authority, or 'other' (presumed crew).
 *
 * Arguments
 * * viewer - Whoever is looking at this.
 */
/datum/proximity_monitor/advanced/demoraliser/proc/on_seen(mob/living/viewer)
	if (!viewer.mind)
		return
	// If you're not conscious you're too busy or dead to look at propaganda
	if (viewer.stat != CONSCIOUS)
		return
	if(is_blind(viewer))
		return
	if (!should_demoralise(viewer))
		return
	if(!viewer.can_read(host, moods.reading_requirements, TRUE)) //if it's a text based demoralization datum, make sure the mob has the capability to read. if it's only an image, make sure it's just bright enough for them to see it.
		return


	if (is_special_character(viewer))
		to_chat(viewer, span_notice("[moods.antag_notification]"))
		SEND_SIGNAL(viewer, COMSIG_ADD_MOOD_EVENT, moods.mood_category, moods.antag_mood)
	else if (viewer.mind.assigned_role.departments_bitflags & (DEPARTMENT_BITFLAG_SECURITY|DEPARTMENT_BITFLAG_COMMAND))
		to_chat(viewer, span_notice("[moods.authority_notification]"))
		SEND_SIGNAL(viewer, COMSIG_ADD_MOOD_EVENT, moods.mood_category, moods.authority_mood)
	else
		to_chat(viewer, span_notice("[moods.crew_notification]"))
		SEND_SIGNAL(viewer, COMSIG_ADD_MOOD_EVENT, moods.mood_category, moods.crew_mood)

	//SEND_SIGNAL(host, COMSIG_DEMORALISING_EVENT, viewer.mind)

/**
 * Returns true if user is capable of experiencing moods and doesn't already have the one relevant to this datum, false otherwise.
 *
 * Arguments
 * * viewer - Whoever just saw the parent.
 */
/datum/proximity_monitor/advanced/demoraliser/proc/should_demoralise(mob/living/viewer)
	var/datum/component/mood/mob_mood = viewer.GetComponent(/datum/component/mood)
	if(mob_mood)
		return FALSE

	return !mob_mood.has_mood_of_category(moods.mood_category)

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
	name = "RIG integrated breacher module"
	desc = "Military issue module manufactured by Cybersun Virtual Solutions, often finded in hands mercinaries rigs. \
			Drammaticaly increasing tactical readiness by providing ability to breach through walls and people."
	icon_state = "breacher"
	complexity = 2
	removable = FALSE
	module_type = MODULE_TOGGLE
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
	compatible_modules = list(/obj/item/module/storage/syndicate)
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
	desc = "A module that attaches two pepper sprayers on shoulders of a RIG, reacting to touch with a spray around the user."
	icon_state = "pepper_shoulder"
	module_type = MODULE_USABLE
	complexity = 1
	incompatible_modules = list(/obj/item/module/pepper_shoulders)
	cooldown_time = 5 SECONDS
	//overlay_state_inactive = "module_pepper"
	//overlay_state_use = "module_pepper_used"

/obj/item/module/pepper_shoulders/on_module_powered()
	RegisterSignal(rig.wearer, COMSIG_HUMAN_CHECK_SHIELDS, PROC_REF(on_check_shields))

/obj/item/module/pepper_shoulders/on_module_unpowered()
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
	allow_flags = MODULE_ALLOW_INACTIVE
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

///Dispenser - Dispenses an item after a time passes.
/obj/item/module/dispenser
	name = "RIG burger dispenser module"
	desc = "A rare piece of technology reverse-engineered from a prototype found in a Donk Corporation vessel. \
		This can draw incredible amounts of power from the suit's charge to create edible organic matter in the \
		palm of the wearer's glove; however, research seemed to have entirely stopped at burgers. \
		Notably, all attempts to get it to dispense Earl Grey tea have failed."
	icon_state = "dispenser"
	module_type = MODULE_USABLE
	complexity = 2
	use_power_cost = DEFAULT_CHARGE_DRAIN * 2
	incompatible_modules = list(/obj/item/module/dispenser)
	cooldown_time = 5 SECONDS
	/// Path we dispense.
	var/dispense_type = /obj/item/reagent_containers/food/snacks/burger/appendix
	/// Time it takes for us to dispense.
	var/dispense_time = 0 SECONDS

/obj/item/module/dispenser/on_use()
	. = ..()
	if(!.)
		return
	if(dispense_time && !do_after(rig.wearer, dispense_time, target = rig))
		balloon_alert(rig.wearer, "interrupted!")
		return FALSE
	var/obj/item/dispensed = new dispense_type(rig.wearer.loc)
	rig.wearer.put_in_hands(dispensed)
	balloon_alert(rig.wearer, "[dispensed] dispensed")
	playsound(src, 'sound/machines/click.ogg', 100, TRUE)
	//drain_power(use_power_cost)
	return dispensed

///Mirage grenade dispenser - Dispenses grenades that copy the user's appearance.
/obj/item/module/dispenser/mirage
	name = "RIG mirage grenade dispenser module"
	desc = "This module can create mirage grenades at the user's liking. These grenades create holographic copies of the user."
	icon_state = "mirage_grenade"
	cooldown_time = 20 SECONDS
	complexity = 2
	overlay_state_inactive = "module_mirage_grenade"
	dispense_type = /obj/item/grenade/mirage

/obj/item/module/dispenser/mirage/on_use()
	. = ..()
	if(!.)
		return
	var/obj/item/grenade/mirage/grenade = .
	grenade.preprime(rig.wearer)

/obj/item/grenade/mirage
	name = "mirage grenade"
	desc = "A special device that, when activated, produces a holographic copy of the user."
	icon_state = "mirage"
	item_state = "flashbang"
	det_time = 3 SECONDS
	/// Mob that threw the grenade.
	var/mob/living/thrower

/obj/item/grenade/mirage/preprime(mob/user, delayoverride, msg, volume)
	. = ..()
	thrower = user

/obj/item/grenade/mirage/prime(mob/living/lanced_by)
	. = ..()
	do_sparks(rand(3, 6), FALSE, src)
	if(thrower)
		var/mob/living/simple_animal/hostile/illusion/mirage/mirage = new(get_turf(src))
		mirage.Copy_Parent(thrower, 15 SECONDS)
	qdel(src)

/mob/living/simple_animal/hostile/illusion/mirage
	AIStatus = AI_OFF
	density = FALSE

/mob/living/simple_animal/hostile/illusion/mirage/death(gibbed)
	do_sparks(rand(3, 6), FALSE, src)
	return ..()

///Projectile Dampener - Weakens projectiles in range.
/obj/item/module/projectile_dampener
	name = "RIG projectile dampener module"
	desc = "Using technology from peaceborgs, this module weakens all projectiles in nearby range."
	icon_state = "projectile_dampener"
	module_type = MODULE_TOGGLE
	complexity = 3
	active_power_cost = DEFAULT_CHARGE_DRAIN
	incompatible_modules = list(/obj/item/module/projectile_dampener)
	cooldown_time = 1.5 SECONDS
	/// Radius of the dampening field.
	var/field_radius = 2
	/// Damage multiplier on projectiles.
	var/damage_multiplier = 0.75
	/// Speed multiplier on projectiles, higher means slower.
	var/speed_multiplier = 2.5
	/// List of all tracked projectiles.
	var/list/tracked_projectiles = list()
	/// Effect image on projectiles.
	var/image/projectile_effect
	/// The dampening field
	var/datum/proximity_monitor/advanced/projectile_dampener/dampening_field

//Projectile dampening field that slows projectiles and lowers their damage for an energy cost deducted every 1/5 second.
//Only use square radius for this!
/datum/proximity_monitor/advanced/projectile_dampener
	var/static/image/edgeturf_south = image('icons/effects/fields.dmi', icon_state = "projectile_dampen_south")
	var/static/image/edgeturf_north = image('icons/effects/fields.dmi', icon_state = "projectile_dampen_north")
	var/static/image/edgeturf_west = image('icons/effects/fields.dmi', icon_state = "projectile_dampen_west")
	var/static/image/edgeturf_east = image('icons/effects/fields.dmi', icon_state = "projectile_dampen_east")
	var/static/image/northwest_corner = image('icons/effects/fields.dmi', icon_state = "projectile_dampen_northwest")
	var/static/image/southwest_corner = image('icons/effects/fields.dmi', icon_state = "projectile_dampen_southwest")
	var/static/image/northeast_corner = image('icons/effects/fields.dmi', icon_state = "projectile_dampen_northeast")
	var/static/image/southeast_corner = image('icons/effects/fields.dmi', icon_state = "projectile_dampen_southeast")
	var/static/image/generic_edge = image('icons/effects/fields.dmi', icon_state = "projectile_dampen_generic")
	var/list/obj/projectile/tracked = list()
	var/list/obj/projectile/staging = list()
	// lazylist that keeps track of the overlays added to the edge of the field
	var/list/edgeturf_effects

/datum/proximity_monitor/advanced/projectile_dampener/New(atom/_host, range, _ignore_if_not_on_turf = TRUE, atom/projector)
	..()
	RegisterSignal(projector, COMSIG_QDELETING, PROC_REF(on_projector_del))
	recalculate_field()
	START_PROCESSING(SSfastprocess, src)

/datum/proximity_monitor/advanced/projectile_dampener/Destroy()
	STOP_PROCESSING(SSfastprocess, src)
	for(var/obj/projectile/projectile in tracked)
		release_projectile(projectile)
	return ..()

/datum/proximity_monitor/advanced/projectile_dampener/process()
	var/list/ranged = list()
	for(var/obj/projectile/projectile in range(current_range, get_turf(host)))
		ranged += projectile
	for(var/obj/projectile/projectile in tracked)
		if(!(projectile in ranged) || !projectile.loc)
			release_projectile(projectile)
	..()

/datum/proximity_monitor/advanced/projectile_dampener/setup_edge_turf(turf/target)
	. = ..()
	var/image/overlay = get_edgeturf_overlay(get_edgeturf_direction(target))
	var/obj/effect/abstract/effect = new(target) // Makes the field visible to players.
	effect.icon = overlay.icon
	effect.icon_state = overlay.icon_state
	effect.mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	effect.layer = ABOVE_ALL_MOB_LAYER
	SET_PLANE(effect, ABOVE_GAME_PLANE, target)
	LAZYSET(edgeturf_effects, target, effect)

/* not used yet - fix later
/datum/proximity_monitor/proc/on_z_change()
	SIGNAL_HANDLER
	return

/datum/proximity_monitor/advanced/projectile_dampener/on_z_change(datum/source)
	recalculate_field()
*/

/datum/proximity_monitor/advanced/projectile_dampener/cleanup_edge_turf(turf/target)
	. = ..()
	var/obj/effect/abstract/effect = LAZYACCESS(edgeturf_effects, target)
	LAZYREMOVE(edgeturf_effects, target)
	if(effect)
		qdel(effect)

/datum/proximity_monitor/advanced/projectile_dampener/proc/get_edgeturf_overlay(direction)
	switch(direction)
		if(NORTH)
			return edgeturf_north
		if(SOUTH)
			return edgeturf_south
		if(EAST)
			return edgeturf_east
		if(WEST)
			return edgeturf_west
		if(NORTHEAST)
			return northeast_corner
		if(NORTHWEST)
			return northwest_corner
		if(SOUTHEAST)
			return southeast_corner
		if(SOUTHWEST)
			return southwest_corner
		else
			return generic_edge

/datum/proximity_monitor/advanced/projectile_dampener/proc/capture_projectile(obj/projectile/projectile)
	if(projectile in tracked)
		return
	SEND_SIGNAL(src, COMSIG_DAMPENER_CAPTURE, projectile)
	tracked += projectile

/datum/proximity_monitor/advanced/projectile_dampener/proc/release_projectile(obj/projectile/projectile)
	SEND_SIGNAL(src, COMSIG_DAMPENER_RELEASE, projectile)
	tracked -= projectile

/datum/proximity_monitor/advanced/projectile_dampener/proc/on_projector_del(datum/source)
	SIGNAL_HANDLER

	qdel(src)

/datum/proximity_monitor/advanced/projectile_dampener/field_edge_uncrossed(atom/movable/movable, turf/location)
	if(isprojectile(movable) && get_dist(movable, host) > current_range)
		if(movable in tracked)
			release_projectile(movable)

/datum/proximity_monitor/advanced/projectile_dampener/field_edge_crossed(atom/movable/movable, turf/location)
	if(isprojectile(movable) && !(movable in tracked))
		capture_projectile(movable)

/datum/proximity_monitor/advanced/projectile_dampener/peaceborg/process(seconds_per_tick)
	for(var/mob/living/silicon/robot/borg in range(current_range, get_turf(host)))
		if(!borg.has_buckled_mobs())
			continue
		for(var/mob/living/buckled_mob in borg.buckled_mobs)
			buckled_mob.visible_message(span_warning("[buckled_mob] is knocked off of [borg] by the charge in [borg]'s chassis induced by the hyperkinetic dampener field!")) //I know it's bad.
			buckled_mob.Paralyze(1 SECONDS)
			borg.unbuckle_mob(buckled_mob)
			do_sparks(5, 0, buckled_mob)
	..()

/obj/item/module/projectile_dampener/Initialize(mapload)
	. = ..()
	projectile_effect = image('icons/effects/fields.dmi', "projectile_dampen_effect")

/obj/item/module/projectile_dampener/on_module_powered()
	. = ..()
	if(!.)
		return
	if(istype(dampening_field))
		QDEL_NULL(dampening_field)
	dampening_field = new(rig.wearer, field_radius, TRUE, src)
	RegisterSignal(dampening_field, COMSIG_DAMPENER_CAPTURE, PROC_REF(dampen_projectile))
	RegisterSignal(dampening_field, COMSIG_DAMPENER_RELEASE, PROC_REF(release_projectile))

/obj/item/module/projectile_dampener/on_module_unpowered(display_message, deleting = FALSE)
	. = ..()
	if(!.)
		return
	QDEL_NULL(dampening_field)

/obj/item/module/projectile_dampener/proc/dampen_projectile(datum/source, obj/projectile/projectile)
	SIGNAL_HANDLER

	projectile.damage *= damage_multiplier
	projectile.speed *= speed_multiplier
	projectile.add_overlay(projectile_effect)

/obj/item/module/projectile_dampener/proc/release_projectile(datum/source, obj/projectile/projectile)
	SIGNAL_HANDLER

	projectile.damage /= damage_multiplier
	projectile.speed /= speed_multiplier
	projectile.cut_overlay(projectile_effect)

///Megaphone - Lets you speak loud.
/obj/item/module/megaphone
	name = "RIG megaphone module"
	desc = "A microchip megaphone linked to a RIG, for very important purposes, like: loudness."
	icon_state = "megaphone"
	module_type = MODULE_TOGGLE
	complexity = 1
	use_power_cost = DEFAULT_CHARGE_DRAIN * 0.5
	incompatible_modules = list(/obj/item/module/megaphone)
	cooldown_time = 0.5 SECONDS
	/// List of spans we add to the speaker.
	var/list/voicespan = list(SPAN_COMMAND)

/obj/item/module/megaphone/on_module_powered()
	. = ..()
	if(!.)
		return
	RegisterSignal(rig.wearer, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/obj/item/module/megaphone/on_module_powered(display_message = TRUE, deleting = FALSE)
	. = ..()
	if(!.)
		return
	UnregisterSignal(rig.wearer, COMSIG_MOB_SAY)

/obj/item/module/megaphone/proc/handle_speech(datum/source, list/speech_args)
	SIGNAL_HANDLER

	speech_args[SPEECH_SPANS] |= voicespan
	drain_power(use_power_cost)

///Active Sonar - Displays a hud circle on the turf of any living creatures in the given radius
/obj/item/module/active_sonar
	name = "RIG active sonar"
	desc = "Ancient tech from the 20th century, this module uses sonic waves to detect living creatures within the user's radius. \
		Its loud ping is much harder to hide in an indoor station than in the outdoor operations it was designed for."
	icon_state = "active_sonar"
	module_type = MODULE_USABLE
	use_power_cost = DEFAULT_CHARGE_DRAIN * 4
	complexity = 2
	incompatible_modules = list(/obj/item/module/active_sonar)
	cooldown_time = 15 SECONDS

/obj/item/module/active_sonar/on_use()
	. = ..()
	if(!.)
		return
	balloon_alert(rig.wearer, "readying sonar...")
	playsound(rig.wearer, 'modular_dripstation/sound/skyfall_power_up.ogg', vol = 20, vary = TRUE, extrarange = SHORT_RANGE_SOUND_EXTRARANGE)
	if(!do_after(rig.wearer, 1.1 SECONDS, target = rig))
		return
	var/creatures_detected = 0
	for(var/mob/living/creature in range(9, rig.wearer))
		if(creature == rig.wearer || creature.stat == DEAD)
			continue
		new /obj/effect/temp_visual/sonar_ping(rig.wearer.loc, rig.wearer, creature)
		creatures_detected++
	playsound(rig.wearer, 'modular_dripstation/sound/effects/ping_hit.ogg', vol = 75, vary = TRUE, extrarange = MEDIUM_RANGE_SOUND_EXTRARANGE) // Should be audible for the radius of the sonar
	to_chat(rig.wearer, span_notice("You slam your fist into the ground, sending out a sonic wave that detects [creatures_detected] living beings nearby!"))
	//drain_power(use_power_cost)

/obj/effect/temp_visual/sonar_ping
	duration = 3 SECONDS
	resistance_flags = FIRE_PROOF | UNACIDABLE | ACID_PROOF
	anchored = TRUE
	randomdir = FALSE
	/// The image shown to RIG users
	var/image/rig_image
	/// The person in the RIG at the moment, really just used to remove this from their screen
	var/datum/weakref/rig_man
	/// The creature we're placing this on
	var/datum/weakref/pinged_person
	/// The icon state applied to the image created for this ping.
	var/real_icon_state = "sonar_ping"

/obj/effect/temp_visual/sonar_ping/Initialize(mapload, mob/living/looker, mob/living/creature)
	. = ..()
	if(!looker || !creature)
		return INITIALIZE_HINT_QDEL
	rig_image = image(icon = 'modular_dripstation/icons/effects/effects.dmi', loc = looker.loc, icon_state = real_icon_state, layer = ABOVE_ALL_MOB_LAYER, pixel_x = ((creature.x - looker.x) * 32), pixel_y = ((creature.y - looker.y) * 32))
	rig_image.plane = ABOVE_LIGHTING_PLANE
	SET_PLANE_EXPLICIT(rig_image, ABOVE_LIGHTING_PLANE, creature)
	rig_man = WEAKREF(looker)
	pinged_person = WEAKREF(creature)
	add_mind(looker)
	START_PROCESSING(SSfastprocess, src)

/obj/effect/temp_visual/sonar_ping/Destroy()
	var/mob/living/previous_user = rig_man?.resolve()
	if(previous_user)
		remove_mind(previous_user)
	STOP_PROCESSING(SSfastprocess, src)
	// Null so we don't shit the bed when we delete
	rig_image = null
	return ..()

/// Add the image to the RIG wearer's screen
/obj/effect/temp_visual/sonar_ping/proc/add_mind(mob/living/looker)
	looker?.client?.images |= rig_image

/// Remove the image from the RIG wearer's screen
/obj/effect/temp_visual/sonar_ping/proc/remove_mind(mob/living/looker)
	looker?.client?.images -= rig_image

/// Update the position of the ping while it's still up. Not sure if i need to use the full proc but just being safe
/obj/effect/temp_visual/sonar_ping/process(seconds_per_tick)
	var/mob/living/looker = rig_man?.resolve()
	var/mob/living/creature = pinged_person?.resolve()
	if(isnull(looker) || isnull(creature))
		return PROCESS_KILL
	rig_image.loc = looker.loc
	rig_image.pixel_x = ((creature.x - looker.x) * 32)
	rig_image.pixel_y = ((creature.y - looker.y) * 32)

///Stamper - Extends a stamp that can switch between accept/deny modes.
/obj/item/module/stamp
	name = "RIG stamper module"
	desc = "A module installed into the wrist of the suit, this functions as a high-power stamp, \
		able to switch between accept and deny modes."
	icon_state = "stamp"
	module_type = MODULE_ACTIVE
	complexity = 1
	active_power_cost = DEFAULT_CHARGE_DRAIN * 0.3
	device = /obj/item/stamp/mod
	incompatible_modules = list(/obj/item/module/stamp)
	cooldown_time = 0.5 SECONDS

/obj/item/stamp/mod
	name = "RIG electronic stamp"
	desc = "A high-power stamp, able to switch between accept and deny mode when used."

/obj/item/stamp/mod/attack_self(mob/user, modifiers)
	. = ..()
	if(icon_state == "stamp-ok")
		icon_state = "stamp-deny"
	else
		icon_state = "stamp-ok"
	balloon_alert(user, "switched mode")

///Cloaking - Lowers the user's visibility, can be interrupted by being touched or attacked.
/obj/item/module/stealth
	name = "RIG basic cloaking module"
	desc = "A complete retrofitting of the suit, this is a form of visual concealment tech employing esoteric technology \
		to bend light around the user, as well as mimetic materials to make the surface of the suit match the \
		surroundings based off sensor data. For some reason, this tech is rarely seen."
	icon_state = "cloak"
	module_type = MODULE_TOGGLE
	complexity = 4
	active_power_cost = DEFAULT_CHARGE_DRAIN * 2
	use_power_cost = DEFAULT_CHARGE_DRAIN * 10
	incompatible_modules = list(/obj/item/module/stealth)
	cooldown_time = 5 SECONDS
	/// Whether or not the cloak turns off on bumping.
	var/bumpoff = TRUE
	/// The alpha applied when the cloak is on.
	var/stealth_alpha = 50

/obj/item/module/stealth/on_module_powered()
	. = ..()
	if(!.)
		return
	if(bumpoff)
		RegisterSignal(rig.wearer, COMSIG_LIVING_MOB_BUMP, PROC_REF(unstealth))
	RegisterSignal(rig.wearer, COMSIG_HUMAN_MELEE_UNARMED_ATTACK, PROC_REF(on_unarmed_attack))
	RegisterSignal(rig.wearer, COMSIG_ATOM_BULLET_ACT, PROC_REF(on_bullet_act))
	RegisterSignals(rig.wearer, list(COMSIG_MOB_ITEM_ATTACK, COMSIG_ATOM_ATTACKBY, COMSIG_ATOM_ATTACK_HAND, COMSIG_ATOM_HITBY, COMSIG_ATOM_HULK_ATTACK, COMSIG_ATOM_ATTACK_PAW, COMSIG_CARBON_CUFF_ATTEMPTED), PROC_REF(unstealth))
	animate(rig.wearer, alpha = stealth_alpha, time = 1.5 SECONDS)
	drain_power(use_power_cost)

/obj/item/module/stealth/on_module_unpowered(display_message = TRUE)
	. = ..()
	if(!.)
		return
	if(bumpoff)
		UnregisterSignal(rig.wearer, COMSIG_LIVING_MOB_BUMP)
	UnregisterSignal(rig.wearer, list(COMSIG_HUMAN_MELEE_UNARMED_ATTACK, COMSIG_MOB_ITEM_ATTACK, COMSIG_ATOM_ATTACKBY, COMSIG_ATOM_ATTACK_HAND, COMSIG_ATOM_BULLET_ACT, COMSIG_ATOM_HITBY, COMSIG_ATOM_HULK_ATTACK, COMSIG_ATOM_ATTACK_PAW, COMSIG_CARBON_CUFF_ATTEMPTED))
	animate(rig.wearer, alpha = 255, time = 1.5 SECONDS)

/obj/item/module/stealth/proc/unstealth(datum/source)
	SIGNAL_HANDLER

	to_chat(rig.wearer, span_warning("[src] gets discharged from contact!"))
	do_sparks(2, TRUE, src)
	drain_power(use_power_cost)
	on_module_unpowered(display_message = TRUE)

/obj/item/module/stealth/proc/on_unarmed_attack(datum/source, atom/target)
	SIGNAL_HANDLER

	if(!isliving(target))
		return
	unstealth(source)

/obj/item/module/stealth/proc/on_bullet_act(datum/source, obj/projectile/projectile)
	SIGNAL_HANDLER

	//if(!projectile.is_hostile_projectile())
	//	return
	unstealth(source)

//Advanced Cloaking - Doesn't turf off on bump, less power drain, more stealthy.
/obj/item/module/stealth/advanced
	name = "RIG advanced cloaking module"
	desc = "The latest in stealth technology, this module is a definite upgrade over previous versions. \
		The field has been tuned to be even more responsive and fast-acting, with enough stability to \
		continue operation of the field even if the user bumps into others. \
		The power draw has been reduced drastically, making this perfect for activities like \
		standing near sentry turrets for extended periods of time."
	icon_state = "cloak_ninja"
	bumpoff = FALSE
	stealth_alpha = 20
	active_power_cost = DEFAULT_CHARGE_DRAIN
	use_power_cost = DEFAULT_CHARGE_DRAIN * 5
	cooldown_time = 3 SECONDS

/obj/item/module/stealth/disruptor
	name = "RIG prototype optical disruption module"
	desc = "Prototype module manufactured by Cybersun Virtual Solutions, latest in stealth technology, \
			this module provides user the ability to hide in the plain sight of any synthetic lifeforms.\
			Also the field has been tuned to be even more responsive and fast-acting. \
			Compact and slightly more energy efficient."
	icon_state = "cloak_cybersun"
	active_power_cost = DEFAULT_CHARGE_DRAIN * 1.5
	use_power_cost = DEFAULT_CHARGE_DRAIN * 7
	removable = FALSE
	cooldown_time = 4 SECONDS
	complexity = 3

/obj/item/module/stealth/disruptor/on_module_powered()
	. = ..()
	if(!.)
		return
	rig.wearer.digitalinvis = TRUE
	rig.wearer.digitalcamo = TRUE

/obj/item/module/stealth/disruptor/on_module_unpowered()
	. = ..()
	rig.wearer.digitalinvis = FALSE
	rig.wearer.digitalcamo = FALSE

///Camera Vision - Prevents flashes, blocks tracking.
/obj/item/module/welding/camera_vision
	name = "RIG camera vision module"
	desc = "A module installed into the suit's helmet. This specialized piece of technology is built for subterfuge, \
		replacing the standard visor with a nanotech display; capable of displaying specialized imagery at \
		just the right frequency to jam all known forms of camera tracking and facial recognition, \
		as well as automatically dimming incoming flashes of light to protect the user's eyes. Become the unseen."
	icon_state = "welding_camera"
	removable = FALSE
	complexity = 1
	overlay_state_inactive = null

/obj/item/module/welding/camera_vision/on_module_powered()
	. = ..()
	RegisterSignal(rig.wearer, COMSIG_LIVING_CAN_TRACK, PROC_REF(can_track))

/obj/item/module/welding/camera_vision/on_module_unpowered(deleting = FALSE)
	. = ..()
	UnregisterSignal(rig.wearer, COMSIG_LIVING_CAN_TRACK)

/obj/item/module/welding/camera_vision/proc/can_track(datum/source, mob/user)
	SIGNAL_HANDLER

	return COMPONENT_CANT_TRACK

//Ninja Star Dispenser - Dispenses ninja stars.
/obj/item/module/dispenser/ninja
	name = "RIG ninja star dispenser module"
	desc = "This piece of Spider Clan technology can exploit known energy-matter equivalence principles, \
		using the nanites already hosted in the wearer's suit to transmute into monomolecular shuriken. \
		While these lack the intense bleeding edge of conventional throwing stars, \
		they have been set to electrify fleeing targets; and branded with the Spider Clan symbol."
	dispense_type = /obj/item/throwing_star/stamina
	cooldown_time = 0.5 SECONDS

/obj/item/throwing_star/stamina
	name = "shock throwing star"
	desc = "An aerodynamic disc designed to cause excruciating pain when stuck inside fleeing targets, hopefully without causing fatal harm."
	throwforce = 10
	embedding = list("pain_chance" = 5, "embed_chance" = 100, "fall_chance" = 0, "jostle_chance" = 10, "pain_stam_pct" = 0.8, "jostle_pain_mult" = 3)

///Hacker - This module hooks onto your right-clicks with empty hands and causes ninja actions.
/obj/item/module/hacker
	name = "RIG hacker module"
	desc = "Built for one purpose, electronic warfare, this module is built into the hands. \
		Using near-field communication alongside precise electro-stimulation of the wires in machines, \
		this decker's dream is normally used to pass through doors like a phantom. \
		It's also capable of non-precise electro-stimulation of an assassin-saboteur's opponents on disarming attacks."
	icon_state = "hacker"
	removable = FALSE
	incompatible_modules = list(/obj/item/module/hacker)
	/// Minimum amount of power we can drain in a single drain action
	var/mindrain = 200
	/// Maximum amount of power we can drain in a single drain action
	var/maxdrain = 400
	/// Whether or not the communication console hack was used to summon another antagonist.
	var/communication_console_hack_success = FALSE
	/// How many times the module has been used to force open doors.
	var/door_hack_counter = 0

/obj/item/module/hacker/on_module_powered()
	RegisterSignal(rig.wearer, COMSIG_HUMAN_EARLY_UNARMED_ATTACK, PROC_REF(hack))

/obj/item/module/hacker/on_module_unpowered(deleting = FALSE)
	UnregisterSignal(rig.wearer, COMSIG_HUMAN_EARLY_UNARMED_ATTACK)

/obj/item/module/hacker/proc/hack(mob/living/carbon/human/source, atom/target, proximity, modifiers)
	SIGNAL_HANDLER

	if(!LAZYACCESS(modifiers, RIGHT_CLICK) || !proximity)
		return NONE
	target.add_fingerprint(rig.wearer)
	return target.ninjadrain_act(rig.wearer, src)

/obj/item/module/hacker/proc/charge_message(atom/drained_atom, drain_amount)
	if(drain_amount)
		to_chat(rig.wearer, span_notice("Gained <B>[drain_amount]</B> units of energy from [drained_atom]."))
	else
		to_chat(rig.wearer, span_warning("[drained_atom] has run dry of energy, you must find another source!"))

///Weapon Recall - Teleports your katana to you, prevents gun use.
/obj/item/module/weapon_recall
	name = "RIG weapon recall module"
	desc = "The cornerstone of a clanmember's life as a blademaster, and a module symbolizing their eternal bond with their weapon. \
		This hooks to the micro bluespace drive inside an energy katana's handle, capable of recalling it to the user's \
		skilled hands wherever they are. However, those that make such a bond with their weapon are cursed to \
		fusing their existence with acts of combat, with a singular purpose; Cutting Down Their Opponent. \
		Their hand a hand that is cutting, their body a body that is cutting, their mind, a mind that is cutting. \
		Ranged weapons are forbidden."
	icon_state = "recall"
	removable = FALSE
	module_type = MODULE_USABLE
	use_power_cost = DEFAULT_CHARGE_DRAIN * 2
	incompatible_modules = list(/obj/item/module/weapon_recall)
	cooldown_time = 0.5 SECONDS
	/// The item linked to the module that will get recalled.
	var/obj/item/linked_weapon
	/// The accepted typepath we can link to.
	var/accepted_type = /obj/item/energy_katana

/obj/item/module/weapon_recall/on_module_powered()
	ADD_TRAIT(rig.wearer, TRAIT_NOGUNS, RIG_TRAIT)

/obj/item/module/weapon_recall/on_module_unpowered(deleting = FALSE)
	REMOVE_TRAIT(rig.wearer, TRAIT_NOGUNS, RIG_TRAIT)

/obj/item/module/weapon_recall/on_use()
	. = ..()
	if(!.)
		return
	if(!linked_weapon)
		var/obj/item/weapon_to_link = rig.wearer.is_holding_item_of_type(accepted_type)
		if(!weapon_to_link)
			balloon_alert(rig.wearer, "can't locate weapon!")
			return
		set_weapon(weapon_to_link)
		balloon_alert(rig.wearer, "[linked_weapon.name] linked")
		return
	if(linked_weapon in rig.wearer.get_all_contents())
		balloon_alert(rig.wearer, "already on self!")
		return
	var/distance = get_dist(rig.wearer, linked_weapon)
	var/in_view = (linked_weapon in view(rig.wearer))
	if(!in_view && !drain_power(use_power_cost * distance))
		balloon_alert(rig.wearer, "not enough charge!")
		return
	linked_weapon.forceMove(linked_weapon.drop_location())
	if(in_view)
		do_sparks(5, FALSE, linked_weapon)
		rig.wearer.visible_message(span_danger("[linked_weapon] flies towards [rig.wearer]!"),span_warning("You hold out your hand and [linked_weapon] flies towards you!"))
		linked_weapon.throw_at(rig.wearer, distance+1, linked_weapon.throw_speed, rig.wearer)
	else
		recall_weapon()

/obj/item/module/weapon_recall/proc/set_weapon(obj/item/weapon)
	linked_weapon = weapon
	RegisterSignal(linked_weapon, COMSIG_MOVABLE_IMPACT, PROC_REF(catch_weapon))
	RegisterSignal(linked_weapon, COMSIG_QDELETING, PROC_REF(deleted_weapon))

/obj/item/module/weapon_recall/proc/recall_weapon(caught = FALSE)
	linked_weapon.forceMove(get_turf(src))
	var/alert = ""
	if(rig.wearer.put_in_hands(linked_weapon))
		alert = "[linked_weapon.name] teleports to your hand"
	else if(rig.wearer.equip_to_slot_if_possible(linked_weapon, ITEM_SLOT_BELT, disable_warning = TRUE))
		alert = "[linked_weapon.name] sheathes itself in your belt"
	else
		alert = "[linked_weapon.name] teleports under you"
	if(caught)
		if(rig.wearer.is_holding(linked_weapon))
			alert = "you catch [linked_weapon.name]"
		else
			alert = "[linked_weapon.name] lands under you"
	else
		do_sparks(5, FALSE, linked_weapon)
	if(alert)
		balloon_alert(rig.wearer, alert)

/obj/item/module/weapon_recall/proc/catch_weapon(obj/item/source, atom/hit_atom, datum/thrownthing/thrownthing)
	SIGNAL_HANDLER

	if(!rig)
		return
	if(hit_atom != rig.wearer)
		return
	INVOKE_ASYNC(src, PROC_REF(recall_weapon), TRUE)
	return COMPONENT_MOVABLE_IMPACT_NEVERMIND

/obj/item/module/weapon_recall/proc/deleted_weapon(obj/item/source)
	SIGNAL_HANDLER

	linked_weapon = null

///DNA Lock - Prevents people without the set DNA from activating the suit.
/obj/item/module/dna_lock
	name = "RIG DNA lock module"
	desc = "A module which engages with the various locks and seals tied to the suit's systems, \
		enabling it to only be worn by someone corresponding with the user's exact DNA profile; \
		however, this incredibly sensitive module is shorted out by EMPs. Luckily, cloning has been outlawed."
	icon_state = "dnalock"
	module_type = MODULE_USABLE
	complexity = 1
	use_power_cost = DEFAULT_CHARGE_DRAIN * 3
	incompatible_modules = list(/obj/item/module/dna_lock)
	cooldown_time = 0.5 SECONDS
	/// The DNA we lock with.
	var/dna = null

/obj/item/module/dna_lock/on_install()
	//RegisterSignal(rig, COMSIG_RIG_TRIGGER_POWER, PROC_REF(on_rig_activation))
	RegisterSignal(rig, COMSIG_RIG_MODULE_REMOVAL, PROC_REF(on_module_removal))
	RegisterSignal(rig, COMSIG_ATOM_EMP_ACT, PROC_REF(on_emp))
	RegisterSignal(rig, COMSIG_ATOM_EMAG_ACT, PROC_REF(on_emag))

/obj/item/module/dna_lock/on_uninstall(deleting = FALSE)
	//UnregisterSignal(rig, COMSIG_RIG_TRIGGER_POWER)
	UnregisterSignal(rig, COMSIG_RIG_MODULE_REMOVAL)
	UnregisterSignal(rig, COMSIG_ATOM_EMP_ACT)
	UnregisterSignal(rig, COMSIG_ATOM_EMAG_ACT)

/obj/item/module/dna_lock/on_use()
	. = ..()
	if(!.)
		return
	dna = rig.wearer.dna.unique_enzymes
	balloon_alert(rig.wearer, "dna updated")
	//drain_power(use_power_cost)

/obj/item/module/dna_lock/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	on_emp(src, severity)

/obj/item/module/dna_lock/emag_act(mob/user, obj/item/card/emag/emag_card)
	. = ..()
	if(!rig.open)
		return FALSE
	return on_emag(src, user, emag_card)

/obj/item/module/dna_lock/proc/dna_check(mob/user)
	if(!iscarbon(user))
		return FALSE
	var/mob/living/carbon/carbon_user = user
	if(!dna  || (carbon_user.has_dna() && carbon_user.dna.unique_enzymes == dna))
		return TRUE
	balloon_alert(user, "dna locked!")
	return FALSE

/obj/item/module/dna_lock/proc/on_emp(datum/source, severity)
	SIGNAL_HANDLER

	dna = null

/obj/item/module/dna_lock/proc/on_emag(datum/source, mob/user, obj/item/card/emag/emag_card)
	SIGNAL_HANDLER

	dna = null
	return TRUE

/obj/item/module/dna_lock/on_rig_change_power_state()
	if(rig.active && !dna_check(rig.wearer))
		return RIG_CANCEL_ACTIVATE
	return ..()

/obj/item/module/dna_lock/proc/on_module_removal(datum/source, mob/user)
	SIGNAL_HANDLER

	if(!dna_check(user))
		return RIG_CANCEL_REMOVAL

//Reinforced DNA Lock - Gibs if wrong DNA, emp-proof.
/obj/item/module/dna_lock/reinforced
	name = "RIG reinforced DNA lock module"
	desc = "A module which engages with the various locks and seals tied to the suit's systems, \
		enabling it to only be worn by someone corresponding with the user's exact DNA profile. \
		Due to utilizing a skintight dampening shield, this one is entirely sealed against electromagnetic interference; \
		it also dutifully protects the secrets of the manufacturer from unknowing outsiders."
	use_power_cost = DEFAULT_CHARGE_DRAIN * 0.5

/obj/item/module/dna_lock/reinforced/on_rig_change_power_state()
	. = ..()
	if(. != RIG_CANCEL_ACTIVATE || !isliving(rig.wearer))
		return
	//if(rig.ai == user)
	//	to_chat(rig.ai, span_danger("<B>fATaL EERRoR</B>: 381200-*#00CODE <B>BLUE</B>\nAI INTErFERenCE DEtECted\nACTi0N DISrEGArdED"))
	//	return
	to_chat(rig.wearer, span_danger("<B>fATaL EERRoR</B>: 382200-*#00CODE <B>RED</B>\nUNAUTHORIZED USE DETECteD\nCoMMENCING SUB-R0UTIN3 13...\nTERMInATING U-U-USER..."))
	rig.wearer.investigate_log("has been gibbed by using a RIG equipped with [src].", INVESTIGATE_DEATHS)
	rig.wearer.gib()

/obj/item/module/dna_lock/reinforced/on_emp(datum/source, severity)
	return

///Energy Net - Ensnares enemies in a net that prevents movement.
/obj/item/module/energy_net
	name = "RIG energy net module"
	desc = "A custom-built net-thrower. While conventional implementations of this capturing device \
		utilize monomolecular fibers or cutting razorwire, this uses hardlight technology to deploy a \
		trapping field capable of immobilizing even the strongest opponents."
	icon_state = "energy_net"
	removable = FALSE
	module_type = MODULE_ACTIVE
	use_power_cost = DEFAULT_CHARGE_DRAIN * 6
	incompatible_modules = list(/obj/item/module/energy_net)
	cooldown_time = 1.5 SECONDS

/obj/item/module/energy_net/on_select_use(atom/target)
	. = ..()
	if(!.)
		return
	if(!isliving(target))
		balloon_alert(rig.wearer, "invalid target!")
		return
	var/mob/living/living_target = target
	if(locate(/obj/structure/energy_net) in get_turf(living_target))
		balloon_alert(rig.wearer, "already trapped!")
		return
	for(var/turf/between_turf as anything in get_line(get_turf(rig.wearer), get_turf(living_target)))
		if(between_turf.density)
			balloon_alert(rig.wearer, "not through obstacles!")
			return
	//if(IS_SPACE_NINJA(rig.wearer))
	//	rig.wearer.say("Get over here!", forced = type)
	rig.wearer.Beam(living_target, "n_beam", time = 1.5 SECONDS)
	var/obj/structure/energy_net/net = new /obj/structure/energy_net(living_target.drop_location())
	net.affecting = living_target
	rig.wearer.visible_message(span_danger("[rig.wearer] caught [living_target] with an energy net!"), span_notice("You caught [living_target] with an energy net!"))
	if(living_target.buckled)
		living_target.buckled.unbuckle_mob(living_target, force = TRUE)
	net.buckle_mob(living_target, force = TRUE)
	drain_power(use_power_cost)

///Magic Nullifier - Protects you from magic.
/obj/item/module/anti_magic
	name = "RIG magic nullifier module"
	desc = "A series of obsidian rods installed into critical points around the suit, \
		vibrated at a certain low frequency to enable them to resonate. \
		This creates a low-range, yet strong, magic nullification field around the user, \
		aided by a full replacement of the suit's normal coolant with holy water. \
		Spells will spall right off this field, though it'll do nothing to help others believe you about all this."
	icon_state = "magic_nullifier"
	removable = FALSE
	incompatible_modules = list(/obj/item/module/anti_magic)

/obj/item/module/anti_magic/on_module_powered()
	rig.wearer.add_traits(list(TRAIT_ANTIMAGIC, TRAIT_HOLY), RIG_TRAIT)

/obj/item/module/anti_magic/on_module_unpowered(deleting = FALSE)
	rig.wearer.remove_traits(list(TRAIT_ANTIMAGIC, TRAIT_HOLY), RIG_TRAIT)

/obj/item/module/anti_magic/wizard
	name = "RIG magic neutralizer module"
	desc = "The caster wielding this spell gains an invisible barrier around them, channeling arcane power through \
		specialized runes engraved onto the surface of the suit to generate anti-magic field. \
		The field will neutralize all magic that comes into contact with the user. \
		It will not protect the caster from social ridicule."
	icon_state = "magic_neutralizer"

/obj/item/module/anti_magic/wizard/on_module_powered()
	rig.wearer.add_traits(list(TRAIT_ANTIMAGIC, TRAIT_ANTIMAGIC_NO_SELFBLOCK), RIG_TRAIT)

/obj/item/module/anti_magic/wizard/on_module_unpowered(deleting = FALSE)
	rig.wearer.remove_traits(list(TRAIT_ANTIMAGIC, TRAIT_ANTIMAGIC_NO_SELFBLOCK), RIG_TRAIT)

///Adrenaline Boost - Stops all stuns the ninja is affected with, increases his speed.
/obj/item/module/adrenaline_boost
	name = "RIG adrenaline boost module"
	desc = "The secrets of the Spider Clan are many. The exact specifications of their suits, \
		the techniques they use to make every singular cut make their enemies weep with admiration, \
		but one of their greatest mysteries is the chemical compound their assassin-saboteurs use in times of need. \
		It's capable of clearing any fatigue whatsoever from the user, any immobilizing effect, and can even \
		cure total paralysis. All that's known is that the fluid requires radiation to properly 'cook,' \
		so this module demands radium to be refilled with."
	icon_state = "adrenaline_boost"
	removable = FALSE
	module_type = MODULE_USABLE
	allow_flags = MODULE_ALLOW_INCAPACITATED
	incompatible_modules = list(/obj/item/module/adrenaline_boost)
	cooldown_time = 12 SECONDS
	/// What reagent we need to refill?
	var/reagent_required = /datum/reagent/uranium/radium
	/// How much of a reagent we need to refill the boost.
	var/reagent_required_amount = 20

/obj/item/module/adrenaline_boost/Initialize(mapload)
	. = ..()
	create_reagents(reagent_required_amount)
	reagents.add_reagent(reagent_required, reagent_required_amount)

/obj/item/module/adrenaline_boost/on_use()
	if(!reagents.has_reagent(reagent_required, reagent_required_amount))
		balloon_alert(rig.wearer, "no charge!")
		return
	. = ..()
	if(!.)
		return
	// if(IS_SPACE_NINJA(rig.wearer))
	// 	rig.wearer.say(pick_list_replacements(NINJA_FILE, "lines"), forced = type)
	to_chat(rig.wearer, span_notice("You have used the adrenaline boost."))
	rig.wearer.SetUnconscious(0)
	rig.wearer.SetStun(0)
	rig.wearer.SetKnockdown(0)
	rig.wearer.SetImmobilized(0)
	rig.wearer.SetParalyzed(0)
	rig.wearer.adjustStaminaLoss(-200)
	rig.wearer.remove_status_effect(/datum/status_effect/speech/stutter)
	rig.wearer.reagents.add_reagent(/datum/reagent/medicine/stimulants, 5)
	reagents.remove_reagent(reagent_required, reagents.total_volume * 0.75)
	addtimer(CALLBACK(src, PROC_REF(boost_aftereffects), rig.wearer), 7 SECONDS)

/obj/item/module/adrenaline_boost/on_install()
	RegisterSignal(rig, COMSIG_ATOM_ATTACKBY, PROC_REF(on_attackby))

/obj/item/module/adrenaline_boost/on_uninstall(deleting)
	UnregisterSignal(rig, COMSIG_ATOM_ATTACKBY)

/obj/item/module/adrenaline_boost/attackby(obj/item/attacking_item, mob/user, params)
	if(charge_boost(attacking_item, user))
		return TRUE
	return ..()

/obj/item/module/adrenaline_boost/proc/on_attackby(datum/source, obj/item/attacking_item, mob/user)
	SIGNAL_HANDLER

	if(charge_boost(attacking_item, user))
		return COMPONENT_NO_AFTERATTACK
	return NONE

/obj/item/module/adrenaline_boost/proc/charge_boost(obj/item/attacking_item, mob/user)
	if(!attacking_item.is_open_container())
		return FALSE
	if(reagents.has_reagent(reagent_required, reagent_required_amount))
		balloon_alert(rig.wearer, "already charged!")
		return FALSE
	if(!attacking_item.reagents.trans_id_to(src, reagent_required, reagent_required_amount))
		return FALSE
	balloon_alert(rig.wearer, "charge [reagents.has_reagent(reagent_required, reagent_required_amount) ? "fully" : "partially"] reloaded")
	return TRUE

/obj/item/module/adrenaline_boost/proc/boost_aftereffects(mob/affected_mob)
	if(!affected_mob)
		return
	reagents.trans_to(affected_mob, reagents.total_volume)
	to_chat(affected_mob, span_danger("You are beginning to feel the after-effect of the injection."))


///Self injector - powerfull module for chem users.
/obj/item/module/self_injector
	name = "RIG self injector module"
	desc = "Two-use refilable injector to administer self aid in dangerous scenarios."
	icon_state = "adrenaline_boost"
	removable = FALSE
	module_type = MODULE_USABLE
	allow_flags = MODULE_ALLOW_INCAPACITATED
	incompatible_modules = list(/obj/item/module/self_injector)
	cooldown_time = 12 SECONDS
	var/list/list_reagents = null
	var/volume = 20
	var/amount_per_transfer_from_this = 10
	var/inject_sound = 'sound/items/autoinjector.ogg'

/obj/item/module/self_injector/Initialize(mapload)
	. = ..()
	if(volume)
		create_reagents(volume)
	if(list_reagents)
		reagents.add_reagent_list(list_reagents)

/obj/item/module/self_injector/on_use()
	if(!reagents.total_volume)
		balloon_alert(rig.wearer, "no reagents!")
		return
	. = ..()
	if(!.)
		return
	var/mob/living/carbon/human/H = rig.wearer
	if(!ishuman(H))
		return

	var/list/injected = list()
	for(var/datum/reagent/R in reagents.reagent_list)
		injected += R.name
	var/contained = english_list(injected)

	if(reagents.total_volume && H.can_inject(H, TRUE)) // Ignors rig since it is under rig components
		to_chat(H, span_warning("You feel a tiny prick!"))
		balloon_alert(H, "Self injection administered.")
		playsound(src, pick(inject_sound), 25)

		var/fraction = min(amount_per_transfer_from_this/reagents.total_volume, 1)
		reagents.reaction(H, INJECT, fraction)
		if(H.reagents)
// yogs start -Adds viruslist stuff
			var/viruslist = ""
			for(var/datum/reagent/R in reagents.reagent_list)
				injected += R.name
				if(istype(R, /datum/reagent/blood))
					var/datum/reagent/blood/RR = R
					for(var/datum/disease/D in RR.data["viruses"])
						viruslist += " [D.name]"
						if(istype(D, /datum/disease/advance))
							var/datum/disease/advance/DD = D
							viruslist += " \[ symptoms: "
							for(var/datum/symptom/S in DD.symptoms)
								viruslist += "[S.name] "
							viruslist += "\]"
// yogs end
			var/trans = 0
			trans = reagents.trans_to(H, amount_per_transfer_from_this, transfered_by = H)

			to_chat(H, span_notice("[trans] unit\s injected.  [reagents.total_volume] unit\s remaining in [src]."))

			log_combat(H, H, "injected", src, "([contained])")
// yogs start - makes logs if viruslist
			if(viruslist)
				investigate_log("[H.real_name] ([H.ckey]) injected [H.real_name] ([H.ckey]) with [viruslist]", INVESTIGATE_VIROLOGY)
				log_game("[H.real_name] ([H.ckey]) injected [H.real_name] ([H.ckey]) with [viruslist]")
// yogs end

/obj/item/module/self_injector/on_install()
	RegisterSignal(rig, COMSIG_ATOM_ATTACKBY, PROC_REF(on_attackby))

/obj/item/module/self_injector/on_uninstall(deleting)
	UnregisterSignal(rig, COMSIG_ATOM_ATTACKBY)

/obj/item/module/self_injector/attackby(obj/item/attacking_item, mob/user, params)
	if(charge_injector(attacking_item, user))
		return TRUE
	return ..()

/obj/item/module/self_injector/proc/on_attackby(datum/source, obj/item/attacking_item, mob/user)
	SIGNAL_HANDLER

	if(charge_injector(attacking_item, user))
		return COMPONENT_NO_AFTERATTACK
	return NONE

/obj/item/module/self_injector/proc/charge_injector(obj/item/attacking_item, mob/user)
	if(!istype(attacking_item, /obj/item/reagent_containers))
		return FALSE
	if(!attacking_item.is_open_container())
		return FALSE
	var/obj/item/reagent_containers/container = attacking_item
	if(reagents.total_volume >= volume)
		balloon_alert(rig.wearer, "[src.name] is full!")
	if(!container.reagents.trans_to(src, container.amount_per_transfer_from_this, transfered_by = user))
		return FALSE
	to_chat(user, span_notice("You transfer [container.amount_per_transfer_from_this] unit\s of the solution to [src.name]."))
	playsound(src, SFX_POURING, 25, 1) 
	balloon_alert(rig.wearer, "transfered!")
	return TRUE

/obj/item/module/self_injector/stimulants
	list_reagents = list(/datum/reagent/medicine/stimulants = 20)

/obj/item/module/self_injector/omnizine
	list_reagents = list(/datum/reagent/medicine/omnizine = 20)

/obj/item/module/self_injector/combat
	name = "RIG self injector combat module"
	desc = "Three-use refilable injector to administer self aid in dangerous scenarios."
	volume = 30
	list_reagents = list(/datum/reagent/medicine/epinephrine = 10, /datum/reagent/medicine/omnizine = 10, /datum/reagent/medicine/leporazine = 5, /datum/reagent/medicine/atropine = 5)

/obj/item/module/self_injector/combat/quantum_liquid
	list_reagents = list(/datum/reagent/medicine/adminordrazine/quantum_heal = 30)

///Magnetic Harness - Automatically puts guns in your suit storage when you drop them.
/obj/item/module/magnetic_harness
	name = "RIG magnetic harness module"
	desc = "Based off TerraGov harness kits, this magnetic harness automatically attaches dropped weapons back to the wearer."
	icon_state = "mag_harness"
	complexity = 2
	use_power_cost = DEFAULT_CHARGE_DRAIN
	incompatible_modules = list(/obj/item/module/magnetic_harness)
	/// Time before we activate the magnet.
	var/magnet_delay = 0.8 SECONDS
	/// The typecache of all guns we allow.
	var/static/list/weapons_typecache
	/// The guns already allowed by the rig.
	var/list/already_allowed_guns = list()

/obj/item/module/magnetic_harness/Initialize(mapload)
	. = ..()
	if(!weapons_typecache)
		weapons_typecache = typecacheof(list(/obj/item/gun/ballistic/automatic/pistol, /obj/item/melee))

/obj/item/module/magnetic_harness/on_install()
	already_allowed_guns = weapons_typecache & rig.allowed
	rig.allowed |= weapons_typecache

/obj/item/module/magnetic_harness/on_uninstall(deleting = FALSE)
	if(deleting)
		return
	rig.allowed -= (weapons_typecache - already_allowed_guns)

/obj/item/module/magnetic_harness/on_module_powered()
	RegisterSignal(rig.wearer, COMSIG_MOB_UNEQUIPPED_ITEM, PROC_REF(check_dropped_item))

/obj/item/module/ash_accretion/on_module_unpowered(deleting = FALSE)
	UnregisterSignal(rig.wearer, COMSIG_MOB_UNEQUIPPED_ITEM)

/obj/item/module/magnetic_harness/proc/check_dropped_item(datum/source, obj/item/dropped_item, force, new_location)
	SIGNAL_HANDLER

	if(!is_type_in_typecache(dropped_item, weapons_typecache))
		return
	if(new_location != get_turf(src))
		return
	addtimer(CALLBACK(src, PROC_REF(pick_up_item), dropped_item), magnet_delay)

/obj/item/module/magnetic_harness/proc/pick_up_item(obj/item/item)
	if(!isturf(item.loc) || !item.Adjacent(rig.wearer))
		return
	if(!rig.wearer.equip_to_slot_if_possible(item, ITEM_SLOT_SUITSTORE, qdel_on_fail = FALSE, disable_warning = TRUE))
		return
	playsound(src, 'modular_dripstation/sound/effects/magnetic_harness.ogg', 50, TRUE)
	balloon_alert_to_viewers(rig.wearer, "[item] reattached")
	drain_power(use_power_cost)

/obj/item/module/ash_accretion
	name = "RIG ash accretion module"
	desc = "A module that collects ash from the terrain, covering the suit in a protective layer, this layer is \
		lost when moving across standard terrain."
	icon_state = "ash_accretion"
	removable = FALSE
	incompatible_modules = list(/obj/item/module/ash_accretion)
	overlay_state_inactive = "module_ash"
	//use_mod_colors = TRUE
	/// How many tiles we can travel to max out the armor.
	var/max_traveled_tiles = 10
	/// How many tiles we traveled through.
	var/traveled_tiles = 0
	/// Armor values per tile.
	var/datum/armor/armor_mod = list (MELEE = 4, BULLET = 1, LASER = 2, ENERGY = 2, BOMB = 4) //datum/armor/mod_ash_accretion
	/// Speed added when you're fully covered in ash.
	var/speed_added = 0.5
	/// Speed that we actually added.
	//var/actual_speed_added = 0
	/// Turfs that let us accrete ash.
	var/static/list/accretion_turfs
	/// Turfs that let us keep ash.
	var/static/list/keep_turfs

// /datum/armor/mod_ash_accretion
// 	melee = 4
// 	bullet = 1
// 	laser = 2
// 	energy = 2
// 	bomb = 4

/obj/item/module/ash_accretion/Initialize(mapload)
	. = ..()
	if(!accretion_turfs)
		accretion_turfs = typecacheof(list(
			/turf/open/floor/plating/asteroid,
			/turf/open/floor/plating/ashplanet,
			/turf/open/floor/plating/dirt,
		))
	if(!keep_turfs)
		keep_turfs = typecacheof(list(
			/turf/open/floor/grass,
			/turf/open/floor/plating/snowed,
			//turf/open/floor/plating/sandy_dirt,
			/turf/open/floor/plating/ironsand,
			/turf/open/floor/plating/ice,
			/turf/open/indestructible/hierophant,
			/turf/open/indestructible/boss,
			/turf/open/indestructible/necropolis,
			/turf/open/lava,
			/turf/open/water,
		))

/obj/item/module/ash_accretion/on_module_powered()
	rig.wearer.add_traits(list(TRAIT_ASHSTORM_IMMUNE, TRAIT_SNOWSTORM_IMMUNE), RIG_TRAIT)
	RegisterSignal(rig.wearer, COMSIG_MOVABLE_MOVED, PROC_REF(on_move))

/obj/item/module/ash_accretion/on_module_unpowered(deleting = FALSE)
	rig.wearer.remove_traits(list(TRAIT_ASHSTORM_IMMUNE, TRAIT_SNOWSTORM_IMMUNE), RIG_TRAIT)
	UnregisterSignal(rig.wearer, COMSIG_MOVABLE_MOVED)
	if(!traveled_tiles)
		return
	//var/list/parts = rig.mod_parts + rig
	//var/datum/armor/to_remove = get_armor_by_type(armor_mod)
	// for(var/obj/item/part as anything in parts)
	// 	part.set_armor(part.get_armor().subtract_other_armor(to_remove.generate_new_with_multipliers(list(ARMOR_ALL = traveled_tiles))))
	if(traveled_tiles == max_traveled_tiles)
		rig.combat_slowdown += speed_added
		rig.recalculate_slowdown()
	traveled_tiles = 0

///obj/item/module/ash_accretion/generate_worn_overlay(mutable_appearance/standing)
	//overlay_state_inactive = "[initial(overlay_state_inactive)]-[rig.skin]"
	//return ..()

/obj/effect/temp_visual/light_ash
	icon_state = "light_ash"
	icon = 'icons/effects/weather_effects.dmi'
	duration = 3.2 SECONDS

/obj/item/module/ash_accretion/proc/on_move(atom/source, atom/oldloc, dir, forced)
	if(!isturf(rig.wearer.loc)) //dont lose ash from going in a locker
		return
	if(traveled_tiles) //leave ash every tile
		new /obj/effect/temp_visual/light_ash(get_turf(src))
	if(is_type_in_typecache(rig.wearer.loc, accretion_turfs))
		if(traveled_tiles >= max_traveled_tiles)
			return
		traveled_tiles++
		//var/list/parts = rig.mod_parts + rig
		//for(var/obj/item/part as anything in parts)
		//	part.set_armor(part.get_armor().add_other_armor(armor_mod))
		if(traveled_tiles >= max_traveled_tiles)
			balloon_alert(rig.wearer, "fully ash covered")
			rig.wearer.color = list(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,3) //make them super light
			animate(rig.wearer, 1 SECONDS, color = null, flags = ANIMATION_PARALLEL)
			playsound(src, 'sound/effects/sparks1.ogg', 100, TRUE)
			//actual_speed_added = max(0, min(rig.combat_slowdown, speed_added))
			rig.combat_slowdown -= speed_added
			rig.recalculate_slowdown()
	else if(is_type_in_typecache(rig.wearer.loc, keep_turfs))
		return
	else
		if(traveled_tiles <= 0)
			return
		if(traveled_tiles == max_traveled_tiles)
			rig.combat_slowdown += speed_added
			rig.recalculate_slowdown()
		traveled_tiles--
		//var/list/parts = rig.mod_parts + rig
		//for(var/obj/item/part as anything in parts)
		//	part.set_armor(part.get_armor().subtract_other_armor(armor_mod))
		if(traveled_tiles <= 0)
			balloon_alert(rig.wearer, "ran out of ash!")

///A module that recharges the suit by an itsy tiny bit whenever the user takes a step. Originally called "magneto module" but the videogame reference sounds cooler.
/obj/item/module/joint_torsion
	name = "RIG joint torsion ratchet module"
	desc = "A compact, weak AC generator that charges the suit's internal cell through the power of deambulation. It doesn't work in zero G."
	icon_state = "module"//"joint_torsion"
	complexity = 1
	incompatible_modules = list(/obj/item/module/joint_torsion)
	var/power_per_step = DEFAULT_CHARGE_DRAIN * 0.3

/obj/item/module/joint_torsion/on_module_powered()
	if(!(rig.wearer.movement_type & (FLOATING|FLYING)))
		RegisterSignal(rig.wearer, COMSIG_MOVABLE_MOVED, PROC_REF(on_moved))
	/// This way we don't even bother to call on_moved() while flying/floating
	RegisterSignal(rig.wearer, COMSIG_MOVETYPE_FLAG_ENABLED, PROC_REF(on_movetype_flag_enabled))
	RegisterSignal(rig.wearer, COMSIG_MOVETYPE_FLAG_DISABLED, PROC_REF(on_movetype_flag_disabled))

/obj/item/module/joint_torsion/on_module_unpowered(deleting = FALSE)
	UnregisterSignal(rig.wearer, list(COMSIG_MOVABLE_MOVED, COMSIG_MOVETYPE_FLAG_ENABLED, COMSIG_MOVETYPE_FLAG_DISABLED))

/obj/item/module/joint_torsion/proc/on_movetype_flag_enabled(datum/source, flag, old_state)
	SIGNAL_HANDLER
	if(!(old_state & (FLOATING|FLYING)) && flag & (FLOATING|FLYING))
		UnregisterSignal(rig.wearer, COMSIG_MOVABLE_MOVED)

/obj/item/module/joint_torsion/proc/on_movetype_flag_disabled(datum/source, flag, old_state)
	SIGNAL_HANDLER
	if(old_state & (FLOATING|FLYING) && !(rig.wearer.movement_type & (FLOATING|FLYING)))
		RegisterSignal(rig.wearer, COMSIG_MOVABLE_MOVED, PROC_REF(on_moved))

/obj/item/module/joint_torsion/proc/on_moved(mob/living/carbon/human/wearer, atom/old_loc, movement_dir, forced)
	SIGNAL_HANDLER
	//Shouldn't work if the wearer isn't really walking/running around.
	if(forced || wearer.throwing || wearer.body_position == LYING_DOWN || wearer.buckled /*|| CHECK_MOVE_LOOP_FLAGS(wearer, MOVEMENT_LOOP_OUTSIDE_CONTROL)*/)
		return
	rig.core.add_charge(power_per_step)

///Plasma Stabilizer - Prevents plasmamen from igniting in the suit
/obj/item/module/plasma_stabilizer
	name = "RIG plasma stabilizer module"
	desc = "This system essentially forms an atmosphere of its own, within the suit, \
		efficiently and quickly preventing oxygen from causing the user's head to burst into flame. \
		This allows plasmamen to safely remove their helmet, allowing for easier \
		equipping of any MODsuit-related equipment, or otherwise. \
		The purple glass of the visor seems to be constructed for nostalgic purposes."
	icon_state = "plasma_stabilizer"
	complexity = 1
	idle_power_cost = DEFAULT_CHARGE_DRAIN * 0.3
	incompatible_modules = list(/obj/item/module/plasma_stabilizer)
	overlay_state_inactive = "module_plasma"

/obj/item/module/plasma_stabilizer/generate_worn_overlay()
	if(locate(/obj/item/module/infiltrator) in rig.inserted_modules)
		return list()
	return ..()

/obj/item/module/plasma_stabilizer/on_equip()
	ADD_TRAIT(rig.wearer, TRAIT_NOSELFIGNITION_HEAD_ONLY, RIG_TRAIT)

/obj/item/module/plasma_stabilizer/on_unequip()
	REMOVE_TRAIT(rig.wearer, TRAIT_NOSELFIGNITION_HEAD_ONLY, RIG_TRAIT)

/obj/item/module/infiltrator
	name = "RIG infiltration core programs module"
	desc = "The primary stealth systems operating within the suit. Utilizing electromagnetic signals, \
		the wearer simply cannot be observed closely, or heard clearly by those around them."
	icon_state = "infiltrator"
	complexity = 0
	removable = FALSE
	idle_power_cost = DEFAULT_CHARGE_DRAIN * 0
	incompatible_modules = list(/obj/item/module/infiltrator, /obj/item/module/armor_booster, /obj/item/module/welding)

/obj/item/module/infiltrator/on_install()
	rig.item_flags |= EXAMINE_SKIP
	rig.helmet.item_flags |= EXAMINE_SKIP

/obj/item/module/infiltrator/on_uninstall(deleting = FALSE)
	rig.item_flags &= ~EXAMINE_SKIP
	rig.helmet.item_flags &= ~EXAMINE_SKIP

/obj/item/module/infiltrator/on_module_powered()
	rig.wearer.add_traits(list(TRAIT_SILENT_FOOTSTEPS, TRAIT_UNKNOWN), RIG_TRAIT)
	rig.helmet.flash_protect = FLASH_PROTECTION_WELDER

/obj/item/module/infiltrator/on_module_unpowered(deleting = FALSE)
	rig.wearer.remove_traits(list(TRAIT_SILENT_FOOTSTEPS, TRAIT_UNKNOWN), RIG_TRAIT)
	if(deleting)
		return
	rig.helmet.flash_protect = initial(rig.helmet.flash_protect)

//////////////////////////
//////SPECIES MODULE//////
//////////////////////////
/obj/item/module/digitagrade
	name = "RIG digitagrade module"
	desc = "Advanced module supporter for species having digitagrade legs type. \
			Recombines leg servomotors structure and adds special tail protection to provide degitagrade types species ability to use dualmode."
	icon_state = "module"
	complexity = 2
	incompatible_modules = list(/obj/item/module/digitagrade)

/obj/item/module/digitagrade/on_install()
	rig.helmet?.mutantrace_variation = DIGITIGRADE_VARIATION
	rig.mutantrace_variation = DIGITIGRADE_VARIATION
	rig.species_restricted = list("lizard", "polysmorph")

/obj/item/module/digitagrade/on_uninstall()
	rig.helmet?.mutantrace_variation = NONE
	rig.mutantrace_variation = NONE
	rig.species_restricted = list("exclude", "lizard", "polysmorph")


/obj/item/module/tailweapon
	name = "RIG tail knife module"
	desc = "Module that supports feachure of weaponising tail with adjusting military grade knife."
	icon_state = "knife_module"
	complexity = 1
	module_type = MODULE_ACTIVE
	allow_flags = MODULE_ALLOW_INACTIVE	//it`s mechanical
	cooldown_time = CLICK_CD_MELEE
	incompatible_modules = list(/obj/item/module/tailweapon)

/obj/item/module/tailweapon/on_select_use(atom/target)
	. = ..()
	if(!.)
		return
	var/obj/item/organ/tail/tail = rig.wearer.getorganslot(ORGAN_SLOT_TAIL)
	if(!tail || !(tail.organ_flags & ORGAN_FAILING))
		balloon_alert(rig.wearer, "no tail!")
		return
	if(!isliving(target))
		balloon_alert(rig.wearer, "invalid target!")
		return
	var/mob/living/living_target = target
	living_target.visible_message(span_warning("[rig.wearer] attacks [living_target] with knife in [rig.wearer.p_their()] tail!"), \
					  	span_userdanger("[rig.wearer] attacks you with [rig.wearer.p_their()] tail!"))
	playsound(get_turf(rig.wearer), SFX_SLASH, 50, 1, -1)
	var/obj/item/bodypart/affecting = living_target.get_bodypart(ran_zone(rig.wearer.zone_selected))
	living_target.apply_damage(20, BRUTE, affecting, wound_bonus = 10)
	log_combat(rig.wearer, living_target, "attacked with knife tail")
	return TRUE

/obj/item/module/tailweapon/on_module_activate()
	. = ..()
	if(!.)
		return
	rig.wearer.visible_message(span_danger("[rig.wearer]`s tail suspiciosly clicks!"))

/////////////////////////
/////////STORAGE/////////
/////////////////////////
/obj/item/module/storage
	name = "RIG storage module"
	desc = "What amounts to a series of integrated storage compartments and specialized pockets installed across \
		the surface of the suit, useful for storing various bits, and or bobs."
	icon_state = "storage"
	/// Max weight class of items in the storage.
	var/max_w_class = WEIGHT_CLASS_NORMAL
	/// Max combined weight of all items in the storage.
	var/max_combined_w_class = 12
	/// Max amount of items in the storage.
	var/max_items = 4
	complexity = 3
	incompatible_modules = list(/obj/item/module/plate_compression, /obj/item/module/storage)
	var/datum/component/storage/concrete/rig/rig_pockets

/datum/component/storage/concrete/rig
	max_items = 4
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = 12
	attack_hand_interact = TRUE
	//transfer_contents_on_component_transfer = TRUE
	drop_all_on_destroy = TRUE
	drop_all_on_deconstruct = TRUE
	allow_big_nesting = TRUE

/obj/item/module/storage/Initialize(mapload)
	. = ..()
	rig_pockets = AddComponent(/datum/component/storage/concrete/rig)
	rig_pockets.max_items = max_items
	rig_pockets.max_w_class = max_w_class
	rig_pockets.max_combined_w_class = max_combined_w_class
	rig_pockets.locked = TRUE

/obj/item/module/storage/on_install()
	var/datum/component/storage/storage = rig.AddComponent(/datum/component/storage, rig_pockets)
	storage.max_items = rig_pockets.max_items
	storage.max_w_class = rig_pockets.max_w_class
	storage.max_combined_w_class = rig_pockets.max_combined_w_class
	SEND_SIGNAL(src, COMSIG_TRY_STORAGE_SET_LOCKSTATE, FALSE)

/obj/item/module/storage/on_uninstall()
	var/datum/component/storage/storage = rig.GetComponent(/datum/component/storage)
	rig_pockets.on_slave_unlink(storage)
	SEND_SIGNAL(src, COMSIG_TRY_STORAGE_SET_LOCKSTATE, TRUE)
	qdel(storage)
/*
/datum/component/storage/rig
	max_items = 3
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = 12
	//rustle_sound = FALSE
	attack_hand_interact = TRUE
	quickdraw = TRUE
	//transfer_contents_on_component_transfer = TRUE
	//drop_all_on_destroy = TRUE
	//drop_all_on_deconstruct = TRUE
	var/atom/original_parent

/datum/component/storage/rig/Initialize()
	original_parent = parent
	. = ..()

/datum/component/storage/rig/real_location()
	// if the component is reparented to a rig, the items still go in the module
	return original_parent

/datum/component/storage/rig/PostTransfer()
	if(!isatom(parent))
		return COMPONENT_INCOMPATIBLE

/obj/item/module/storage/Initialize(mapload)
	. = ..()
	rig_pockets = AddComponent(/datum/component/storage/rig)
	rig_pockets.max_items = max_items
	rig_pockets.max_w_class = max_w_class
	rig_pockets.max_combined_w_class = max_combined_w_class
	rig_pockets.locked = TRUE
	//SEND_SIGNAL(src, COMSIG_TRY_STORAGE_SET_LOCKSTATE, TRUE)

/obj/item/module/storage/Destroy()
	set_rig_pockets(null)
	return ..()

/obj/item/module/storage/on_install()
	var/datum/component/storage/storage = GetComponent(/datum/component/storage)
	if(storage)
		if(SEND_SIGNAL(rig, COMSIG_CONTAINS_STORAGE))
			return FALSE
		rig.TakeComponent(storage)
		//rig_pockets = storage
		set_rig_pockets(storage)
		//rig_pockets.locked = FALSE
		SEND_SIGNAL(rig, COMSIG_TRY_STORAGE_SET_LOCKSTATE, FALSE)
	return TRUE

/obj/item/module/storage/on_uninstall()
	if(rig_pockets && rig_pockets.parent == rig)
		//rig_pockets.locked = TRUE
		TakeComponent(rig_pockets)
		SEND_SIGNAL(src, COMSIG_TRY_STORAGE_SET_LOCKSTATE, TRUE)

/obj/item/module/storage/proc/set_rig_pockets(new_pocket)
	if(rig_pockets)
		UnregisterSignal(rig_pockets, COMSIG_QDELETING)
	rig_pockets = new_pocket
	if(rig_pockets)
		RegisterSignal(rig_pockets, COMSIG_QDELETING, .proc/handle_pockets_del)

/obj/item/module/storage/proc/handle_pockets_del(datum/source)
	SIGNAL_HANDLER
	set_rig_pockets(null)
*/

/obj/item/module/storage/large_capacity
	name = "RIG expanded storage module"
	desc = "Reverse engineered by Hephaestus Industries from Donk Corporation designs, this system of hidden compartments \
		is entirely within the suit, distributing items and weight evenly to ensure a comfortable experience for the user; \
		whether smuggling, or simply hauling."
	icon_state = "storage_large"
	max_combined_w_class = 15
	max_items = 6

/obj/item/module/storage/syndicate
	name = "RIG Cybersun storage module"
	desc = "A storage system using nanotechnology developed by Cybersun Industries, these compartments use \
		esoteric technology to compress the physical matter of items put inside of them, \
		essentially shrinking items for much easier and more portable storage."
	icon_state = "storage_syndi"
	max_combined_w_class = 21
	max_items = 14
	incompatible_modules = list(/obj/item/module/storage)

/obj/item/module/storage/bluespace
	name = "RIG bluespace storage module"
	desc = "A storage system developed by Nanotrasen, these compartments employ \
		miniaturized bluespace pockets for the ultimate in storage technology; regardless of the weight of objects put inside."
	icon_state = "storage_large"
	max_w_class = WEIGHT_CLASS_GIGANTIC
	max_combined_w_class = 30
	max_items = 21

#undef ARMORID
