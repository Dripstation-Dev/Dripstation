/obj/item/module
	name = "module"
	desc = "module"
	icon = 'modular_dripstation/icons/obj/rig_modules.dmi'
	icon_state = "module"
	var/complexity = 1	//how complex module is
	var/removable = TRUE

/obj/item/module/examine(mob/user)
	. = ..()
	. += "You can insert it into rig. It has [complexity] complexity."

/obj/item/module/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!proximity_flag)
		return ..()
	if(istype(target, /obj/item/clothing/suit/space/hardsuit/syndi))
		var/obj/item/clothing/suit/space/hardsuit/syndi/rig = target
		insert_module(rig, user)
	return ..()

/obj/item/module/proc/insert_module(obj/item/clothing/suit/space/hardsuit/syndi/rig, mob/user)
	if(rig.current_complexity + complexity > rig.max_complexity)
		return FALSE
	apply_effect(rig, user)
	visible_message("[user] inserts [src] into [rig]")
	rig.update_appearance()
	forceMove(rig)
	//user.update_appearance(UPDATE_OVERLAYS)
	//qdel(src)
	return TRUE

/obj/item/module/proc/remove_module(obj/item/clothing/suit/space/hardsuit/syndi/rig, mob/user)
	remove_effect(rig, user)
	rig.current_complexity = min(rig.current_complexity, rig.max_complexity)	//sanity check
	return TRUE

/obj/item/module/proc/apply_effect(obj/item/clothing/suit/space/hardsuit/syndi/rig, mob/user)
	rig.current_complexity += complexity
	rig.inserted_modules += src

/obj/item/module/proc/remove_effect(obj/item/clothing/suit/space/hardsuit/syndi/rig, mob/user)
	rig.current_complexity -= complexity
	rig.inserted_modules -= src

/obj/item/module/shield
	name = "advanced shield module"
	desc = "Insert module into rig to give it a rechargeable shield."
	icon_state = "shield"
	var/max_charges = 3 //How many charges total the shielding has
	var/recharge_delay = 20 SECONDS //How long after we've been shot before we can start recharging. 20 seconds here
	var/recharge_delay_after_charge = 1 SECONDS //How long after we've been recharged before we can start recharging. 1 second here
	var/recharge_rate = 1 //How quickly the shield recharges once it starts charging
	var/starting_charge = 0	//if null starts with max_charges
	var/shield_state = "shield-old"

/obj/item/module/shield/apply_effect(obj/item/clothing/suit/space/hardsuit/syndi/rig, mob/user)
	. = ..()
	rig.AddComponent(/datum/component/shielded,'modular_dripstation/icons/effects/shield.dmi', shield_state, recharge_delay, ITEM_SLOT_OCLOTHING, charge_i_d = recharge_delay_after_charge, max_charge = max_charges, starting_charges = starting_charge, recharge_rating = recharge_rate, sparks_enable = TRUE)

/obj/item/module/shield/remove_effect(obj/item/clothing/suit/space/hardsuit/syndi/rig, mob/user)
	. = ..()
	var/datum/component/shielded/shield = rig.GetComponent(/datum/component/shielded)
	//starting_charge = shield.current_charges
	qdel(shield)

/obj/item/module/shield/syndicate
	name = "syndicate shield module"
	max_charges = 1
	recharge_delay = 10 SECONDS
	shield_state = "shield-red"
	icon_state = "shield-syndie"

/obj/item/module/shield/nt
	name = "nanotrasen shield module"
	recharge_delay_after_charge = 10 SECONDS
	recharge_delay = 30 SECONDS
	icon_state = "shield-nt"

/obj/item/module/shield/wizard
	name = "magic shield rune"
	max_charges = 3
	starting_charge = 1
	recharge_rate = 0
	recharge_delay = 0 SECONDS
	shield_state = "mageshield"


/obj/item/module/storage
	name = "MOD storage module"
	desc = "What amounts to a series of integrated storage compartments and specialized pockets installed across \
		the surface of the suit, useful for storing various bits, and or bobs."
	/// Max weight class of items in the storage.
	var/max_w_class = WEIGHT_CLASS_NORMAL
	/// Max combined weight of all items in the storage.
	var/max_combined_w_class = 15
	/// Max amount of items in the storage.
	var/max_items = 7

/datum/component/storage/concrete/rig
	max_items = 7
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = 15
	rustle_sound = FALSE

/obj/item/module/storage/Initialize(mapload)
	. = ..()
	var/datum/component/storage/concrete/rig_pockets = GetComponent(/datum/component/storage/concrete/rig)
	rig_pockets.max_items = max_items
	rig_pockets.max_w_class = max_w_class
	rig_pockets.max_combined_w_class = max_combined_w_class

/obj/item/module/storage/apply_effect()
	. = ..()
