/obj/item/clothing/suit/mob_can_equip(M as mob, slot)

	//if we can't equip the item anyway, don't bother with species_restricted (also cuts down on spam)
	if(!..())
		return FALSE

	// Skip species restriction checks on non-equipment slots
	if(slot in list(ITEM_SLOT_LPOCKET, ITEM_SLOT_RPOCKET, ITEM_SLOT_BACKPACK, ITEM_SLOT_SUITSTORE))
		return TRUE

	var/mob/living/carbon/human/H = M
	if(istype(H) && HAS_TRAIT(H, NO_SUIT_TRAIT))
		to_chat(M, "<span class='warning'>You can`t wear [src]!</span>")
		return FALSE

	return TRUE

/obj/item/clothing/suit/bio_suit
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "hazmat_suit"
	slowdown = 0.33
	body_parts_covered = CHEST|GROIN
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/bio_suit/general
	icon_state = "hazmat_suit_general"
    
/obj/item/clothing/suit/bio_suit/virology
	icon_state = "hazmat_virology"

/obj/item/clothing/suit/bio_suit/security
	icon_state = "hazmat_sec"

/obj/item/clothing/suit/bio_suit/janitor
	icon_state = "hazmat_janitor"

/obj/item/clothing/suit/bio_suit/scientist
	icon_state = "hazmat_scientist"

/obj/item/clothing/suit/bio_suit/cmo
	icon_state = "hazmat_cmo"

/obj/item/clothing/suit/bio_suit/cyan
	icon_state = "hazmat_cyan"

/obj/item/clothing/suit/bio_suit/white
	icon_state = "hazmat_white"

/obj/item/clothing/suit/bio_suit/plaguedoctorsuit
	icon = 'icons/obj/clothing/suits/suits.dmi'
	worn_icon = 'icons/mob/clothing/suit/suit.dmi'

/obj/item/clothing/suit/bomb_suit/security
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "blastsuit_sec"
	body_parts_covered = CHEST|GROIN|ARMS|HANDS
	heat_protection = CHEST|GROIN|ARMS|HANDS
	cold_protection = CHEST|GROIN|ARMS|HANDS

/obj/item/clothing/suit/jacket/leather/overcoat
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'

/obj/item/clothing/suit/poncho
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/suits_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/suits_righthand.dmi'

/obj/item/clothing/suit/poncho/purple
	name = "purple poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is purple."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'		
	icon_state = "purpleponcho"
	item_state = "purpleponcho"

/obj/item/clothing/suit/poncho/blue
	name = "blue poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is blue."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'		
	icon_state = "blueponcho"
	item_state = "blueponcho"

/obj/item/clothing/suit/poncho/sec
	name = "security poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is black and red, standard NanoTrasen Security colors."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	icon_state = "secponcho"
	item_state = "secponcho"	
	armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 15)
	allowed = list(/obj/item/gun/energy, /obj/item/melee/baton, /obj/item/restraints/handcuffs, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant)

/obj/item/clothing/suit/poncho/eng
	name = "engineering poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is yellow and orange, standard Engineering colors."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	icon_state = "engiponcho"
	item_state = "engiponcho"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 10, FIRE = 20, ACID = 40, WOUND = 0)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/t_scanner, /obj/item/radio, /obj/item/extinguisher/mini)

/obj/item/clothing/suit/poncho/med
	name = "medical poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is white with green and blue tint, standard Medical colors."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	icon_state = "medponcho"
	item_state = "medponcho"
	allowed = list(/obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/autoinjector, /obj/item/healthanalyzer, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/soap, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/hypospray)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 35, RAD = 0, FIRE = 35, ACID = 35)

/obj/item/clothing/suit/poncho/sci
	name = "science poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is white with purple trim, standard NanoTrasen Science colors."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	icon_state = "sciponcho"
	item_state = "sciponcho"
	allowed = list(/obj/item/analyzer, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/autoinjector, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/sensor_device, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 35, RAD = 0, FIRE = 35, ACID = 35)

/obj/item/clothing/suit/poncho/cargo
	name = "cargo poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is tan and grey, the colors of Cargo."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	icon_state = "cargoponcho"
	item_state = "cargoponcho"
	allowed = list(/obj/item/clipboard, /obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/radio)

/obj/item/clothing/suit/judgerobe
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	flags_inv = null

/obj/item/clothing/head/judge_wig
	name = "\improper judge wig"
	desc = "Judgement is here."
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'	
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "jwig"
	item_state = "pwig"

/obj/item/clothing/suit/maiddress
	name = "maid dress"
	desc = "Classic maid dress for working woman."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "maiddress"
	item_state = "maid"

/obj/item/clothing/suit/apron/maid
	name = "green apron"
	desc = "You can put it on your naked body!"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "apron_green"
	item_state = "maidapron"
	allowed = list(/obj/item/kitchen)

/obj/item/clothing/suit/apron/maid/red
	name = "red apron"
	icon_state = "apron_red"

/obj/item/clothing/suit/apron/maid/purple
	name = "purple apron"
	icon_state = "apron_purple"

/obj/item/clothing/suit/apron/maid/teal
	name = "teal apron"
	icon_state = "apron_teal"

/obj/item/clothing/suit/apron/maid/yellow
	name = "yellow apron"
	icon_state = "apron_yellow"



/////HOODIE//////
GLOBAL_LIST_INIT(hoodie_style_list, list(
	"None" = "hoodie",
	"Cropped" = "croppedhoodie",
	"Croppier" = "croppierhoodie",
	"Highcroped" = "highcrophoodie",
	"Supercropped" = "supercroppedhoodie",
))

/obj/item/clothing/suit/hoodie
	dying_key = DYE_REGISTRY_HOODIE
	icon_state = "hoodie"
	item_state = "hoodie"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/suits_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/suits_righthand.dmi'
	greyscale_colors = "#2d2d33"
	greyscale_config = /datum/greyscale_config/hoodie
	greyscale_config_worn = /datum/greyscale_config/hoodie_worn
	greyscale_config_inhand_left = /datum/greyscale_config/hoodie_inhand_left
	greyscale_config_inhand_right = /datum/greyscale_config/hoodie_inhand_right
	flags_1 = IS_PLAYER_COLORABLE_1
	actions_types = list(/datum/action/item_action/adjust_style)
	var/list/toggled_type = list("None", "Cropped", "Croppier", "Highcroped", "Supercropped")
	custom_price = 20

/datum/action/item_action/adjust_style
	name = "Adjust Hoodie Style"

/datum/action/item_action/adjust_style/New(Target)
	..()
	var/obj/item/item_target = target
	name = "Adjust [item_target.name] style"

/datum/greyscale_config/hoodie
	name = "hoodie"
	icon_file = 'modular_dripstation/icons/obj/clothing/suits.dmi'	
	json_config = 'code/datums/greyscale/json_configs/hoodie.json'

/datum/greyscale_config/hoodie_worn
	name = "Worn hoodie"
	icon_file = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	json_config = 'code/datums/greyscale/json_configs/hoodie_worn.json'

/datum/greyscale_config/hoodie_inhand_left
	name = "Held hoodie, Left"
	icon_file = 'modular_dripstation/icons/mob/inhands/clothing/suits_lefthand.dmi'
	json_config = 'code/datums/greyscale/json_configs/hoodie_inhand.json'

/datum/greyscale_config/hoodie_inhand_right
	name = "Held hoodie, Right"
	icon_file = 'modular_dripstation/icons/mob/inhands/clothing/suits_righthand.dmi'
	json_config = 'code/datums/greyscale/json_configs/hoodie_inhand.json'

/obj/item/clothing/suit/hoodie/verb/toggle_hoodie()
	set name = "Toggle Hoodie"
	set category = "Object"
	set src in view(1)

	try_toggle_hoodie(usr)

/obj/item/clothing/suit/hoodie/AltClick(mob/user)
	try_toggle_hoodie(user)

/obj/item/clothing/suit/hoodie/ui_action_click(mob/user, actiontype)
	if(!istype(user) || user.incapacitated())
		return
	if(istype(actiontype, /datum/action/item_action/adjust_style))	
		try_toggle_hoodie(user)

/obj/item/clothing/suit/hoodie/proc/try_toggle_hoodie(mob/user)
	if(!istype(user) || user.incapacitated())
		return
	var/list/options = list()
	var/list/radial_display = list()
	for(var/check_style as anything in toggled_type)
		options[check_style] = check_style
		var/datum/radial_menu_choice/option = new
		option.image = image(icon = icon, icon_state = GLOB.hoodie_style_list[check_style])
		//option.info = "[check_style]"
		radial_display[check_style] = option

	var/choice = show_radial_menu(user, user, radial_display)
	var/chosen_style = options[choice]
	if(QDELETED(src) || QDELETED(user))
		return FALSE
	if(!chosen_style || !(chosen_style in GLOB.hoodie_style_list))
		to_chat(user, span_announce("You choose not to choose."))
		return
	if(src && chosen_style && !user.incapacitated() && in_range(user,src))
		icon_state = GLOB.hoodie_style_list[chosen_style]
		user.update_inv_wear_suit()
		for(var/X in actions)
			var/datum/action/A = X
			A.build_all_button_icons()
		to_chat(user, span_notice("You toggled your hoodie stile!"))
		return TRUE

/obj/item/clothing/suit/hoodie/black
	name = "black hoodie"
	desc = "Just a black hoodie."

/obj/item/clothing/suit/hoodie/white
	name = "white hoodie"
	desc = "Just a white hoodie."
	greyscale_colors = "#ffffff"	

/obj/item/clothing/suit/hoodie/red
	name = "red hoodie"
	desc = "Stylish red hoodie."
	greyscale_colors = "#a52f29"	
