///Sniper///
/obj/item/gun/ballistic/rifle/sniper_rifle
	name = "SA-91R anti-materiel rifle"
	desc = "A devastating Scarborough Arms heavy sniper rifle, fitted with a modern scope."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "antimaterial_rifle"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/rifle/sniper_rifle/syndicate
	name = "\improper 'Caracal' SA-91M anti-materiel rifle"
	desc = "A sleek .50 sniper rifle with a reciprocating barrel, nicknamed 'Caracal' by Scarborough Arms. Its compact folding parts make it able to fit into a backpack, and its modular barrel can have a suppressor installed within it rather than as a muzzle extension. Its advanced scope accounts for all ballistic inaccuracies of a reciprocating barrel."
	icon_state = "antimaterial_rifle_blc"
	rack_delay = 40 //Delay reduced thanks to recoil absorption
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM

/obj/item/gun/ballistic/rifle/sniper_rifle/ultrasecure
	name = "\improper 'Caracal' SA-91M anti-materiel rifle"
	desc = "A sleek .50 sniper rifle with a reciprocating barrel, nicknamed 'Caracal' by Scarborough Arms. Its compact folding parts make it able to fit into a backpack, and its modular barrel can have a suppressor installed within it rather than as a muzzle extension. Its advanced scope accounts for all ballistic inaccuracies of a reciprocating barrel."
	icon_state = "antimaterial_rifle_blc"
	rack_delay = 40 //Delay reduced thanks to recoil absorption
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	can_suppress = TRUE
	can_unsuppress = TRUE

/obj/item/gun/ballistic/rifle/sniper_rifle/waffle
	name = "\improper WA-7 anti-material sniper rifle"
	desc = "An illegal Waffle Armory rendition of an Scarborough Arms sniper rifle. This one has been fitted with a heavy duty scope, a sturdier stock, and has a removable muzzle brake that allows easy attachment of suppressors."
	icon_state = "waffle_sniper"
	item_state = "waffle_sniper"
	can_suppress = TRUE
	can_unsuppress = TRUE
	recoil = 1.8
	rack_delay = 55 //Slightly smaller than standard sniper
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	fire_sound = "'modular_dripstation/sound/weapons/tgmc/sniper.ogg"
	dry_fire_sound = 'modular_dripstation/sound/weapons/tgmc/sniper_empty.ogg'
	eject_sound = 'modular_dripstation/sound/weapons/tgmc/sniper_unload.ogg'
	eject_empty_sound = 'modular_dripstation/sound/weapons/tgmc/sniper_unload.ogg'
	load_sound = 'modular_dripstation/sound/weapons/tgmc/sniper_reload.ogg'
	pin = /obj/item/firing_pin/fucked

/obj/item/gun/ballistic/rifle/sniper_rifle/waffle/unrestricted
	pin = /obj/item/firing_pin

///Nitro Express///
/obj/item/gun/ballistic/nitro_express
	name = "\improper BW-5 Nitro Express Rifle"
	desc = "A large-bore double-barelled break-action hunting rifle. Fires armor-piercing .700 'Nitro Express' ammunition. The recoil feels strong enough to break your shoulder."
	icon_state = "nitro_express"
	mag_type = /obj/item/ammo_box/magazine/internal/nitro_express
	fire_sound = "sound/weapons/sniper_shot.ogg"
	fire_sound_volume = 80
	can_suppress = FALSE
	var/select
	var/second_casing
	internal_magazine = TRUE
	casing_ejector = FALSE
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM
	recoil = 4
	randomspread = 0
	fire_delay = 0
	burst_size = 2
	//bolt_wording = "barell"
	bolt_type = BOLT_TYPE_NO_BOLT
	show_bolt_icon = FALSE
	fire_sound_volume = 100
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	var/locked = TRUE

/obj/item/gun/ballistic/nitro_express/examine_more(mob/user)
	. = ..()
	var/msg = "BW-5 Nitro Express\
		Very high damage. Easily penetrates armor plating, ballistic shields and enemies."

	return list(span_notice("<i>[msg]</i>"))

/obj/item/gun/ballistic/nitro_express/update_icon_state()
	. = ..()
	if(!locked)
		icon_state = "[initial(icon_state)]_open"
	else
		icon_state = initial(icon_state)

/obj/item/gun/ballistic/nitro_express/can_shoot()
	if(!locked)
		return FALSE
	return ..()

/obj/item/gun/ballistic/nitro_express/attack_self(mob/living/user)
	if(locked)
		to_chat(user, span_notice("You open the barell of \the [src]."))
	else
		to_chat(user, span_notice("You return the barell of \the [src] back."))
		chamber_round()
	locked = !locked
	update_appearance(UPDATE_ICON|UPDATE_DESC)

/obj/item/gun/ballistic/nitro_express/attackby(obj/item/A, mob/user, params)
	if((istype(A, /obj/item/ammo_casing)) && locked)
		to_chat(user, span_notice("You can`t load rounds while the gun is locked!"))
		return
	return ..()

/obj/item/gun/ballistic/nitro_express/AltClick(mob/user)
	if(!locked)
		chambered = null
		var/num_unloaded = 0
		for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
			CB.forceMove(drop_location())
			CB.bounce_away(FALSE, NONE)
			num_unloaded++
		if (num_unloaded)
			to_chat(user, span_notice("You unload [num_unloaded] [cartridge_wording]\s from [src]."))
			playsound(user, eject_sound, eject_sound_volume, eject_sound_vary)
			update_appearance(UPDATE_ICON|UPDATE_DESC)
		else
			to_chat(user, span_warning("[src] is empty!"))
		return
	else
		to_chat(user, span_notice("You can`t unload rounds while the gun is locked!"))

/obj/item/gun/ballistic/nitro_express/attack_hand(mob/user)
	if(user.is_holding(src))
		chambered = null
		if(!locked)
			for(var/obj/item/ammo_casing/CB in get_ammo_list(TRUE, FALSE))
				if(CB.BB == null && istype(magazine, /obj/item/ammo_box/magazine/internal/nitro_express))
					var/obj/item/ammo_box/magazine/internal/nitro_express/ne = magazine
					CB.forceMove(drop_location())
					user.put_in_hands(CB)
					ne.remove_casing(CB)
					to_chat(user, span_notice("You unload [cartridge_wording] from [src]."))
					playsound(user, eject_sound, eject_sound_volume, eject_sound_vary)
					update_appearance(UPDATE_ICON|UPDATE_DESC)
					return
			for(var/obj/item/ammo_casing/CB in get_ammo_list(TRUE, FALSE))
				if(istype(magazine, /obj/item/ammo_box/magazine/internal/nitro_express))
					var/obj/item/ammo_box/magazine/internal/nitro_express/ne = magazine
					CB.forceMove(drop_location())
					user.put_in_hands(CB)
					ne.remove_casing(CB)
					to_chat(user, span_notice("You unload [cartridge_wording] from [src]."))
					playsound(user, eject_sound, eject_sound_volume, eject_sound_vary)
					update_appearance(UPDATE_ICON|UPDATE_DESC)
					return
		else
			to_chat(user, span_notice("You can`t unload rounds while the gun is locked!"))
	return ..()

/*
/obj/item/gun/ballistic/nitro_express/ui_action_click(mob/user, actiontype)
	if(istype(actiontype, /datum/action/item_action/toggle_firemode))
		burst_select()
	else
		..()

/obj/item/gun/ballistic/nitro_express/proc/burst_select()
	var/mob/living/carbon/human/user = usr
	select = !select
	if(!select)
		burst_size = 1
		to_chat(user, span_notice("You switch to one shot."))
	else
		burst_size = initial(burst_size)
		to_chat(user, span_notice("You switch to double shot."))

	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_appearance(UPDATE_ICON)
	for(var/X in actions)
		var/datum/action/A = X
		A.build_all_button_icons()
*/

/obj/item/gun/ballistic/nitro_express/shoot_live_shot(mob/living/user, pointblank = 0, atom/pbtarget = null, message = 1)
	. = ..()
	if (!isreplica(user))
		user.adjustStaminaLoss(20)
		if(user.active_hand_index == 1)
			user.apply_damage(15, BRUTE, BODY_ZONE_L_ARM, wound_bonus = 0, bare_wound_bonus = 30, sharpness = SHARP_NONE)
		else
			user.apply_damage(15, BRUTE, BODY_ZONE_R_ARM, wound_bonus = 0, bare_wound_bonus = 30, sharpness = SHARP_NONE)
		var/atom/throw_user = get_edge_target_turf(pbtarget, REVERSE_DIR(get_dir(src, get_step_away(pbtarget, src))))
		user.throw_at(throw_user, 1, 3)
		to_chat(user, span_danger("Recoil of \the [src] hits you very hard and throws you back!"))
		user.apply_effects(knockdown = 40)
/*
/obj/item/gun/ballistic/nitro_express/update_icon_state()
	. = ..()
	if(bolt_locked)
		icon_state = "[initial(icon_state)]_open"
	else
		icon_state = initial(icon_state)

/obj/item/gun/ballistic/nitro_express/process_chamber(empty_chamber = TRUE, from_firing = TRUE, chamber_next_round = TRUE)
	var/obj/item/ammo_casing/AC = chambered //Find chambered round
	if(from_firing)
		if(istype(AC) && !second_casing) //there's a chambered round and no casing in second barell
			second_casing = AC
			chambered = null
	if (chamber_next_round && (magazine?.max_ammo > 0))
		chamber_round()

/obj/item/gun/ballistic/nitro_express/attack_hand(mob/user)
	if(user.is_holding(src))
		if(internal_magazine && !bolt_locked)
			to_chat(user, span_notice("The gun is locked!"))
			return
		var/obj/item/ammo_casing/AC = chambered //Find chambered round
		var/obj/item/ammo_casing/AC2 = second_casing
		if(istype(AC2))	//check second barel for spent casing
			AC2.forceMove(drop_location())
			user.put_in_hands(AC2)
			second_casing = null
			AC2.update_appearance(UPDATE_ICON)
			return
		else if(istype(AC))
			AC.forceMove(drop_location())
			user.put_in_hands(AC)
			chambered = null
			AC.update_appearance(UPDATE_ICON)
			//if (magazine?.max_ammo > 1)
			//	chamber_round()
			return
	return ..()

/obj/item/gun/ballistic/nitro_express/rack(mob/user = null)
	if (weapon_weight != WEAPON_LIGHT) //Can't rack it if the weapon doesn't permit dual-wielding and your off-hand is full
		if (user.get_inactive_held_item())
			to_chat(user, span_warning("You cannot open \the [src] while your other hand is full!"))
			return
	if (!bolt_locked)
		to_chat(user, span_notice("You open the barell of \the [src]."))
	else
		to_chat(user, span_notice("You return the barell of \the [src] back."))
		chamber_round()
	bolt_locked = !bolt_locked
	playsound(src, lock_back_sound, lock_back_sound_volume, lock_back_sound_vary)
	update_appearance(UPDATE_ICON)

/obj/item/gun/ballistic/nitro_express/can_shoot()
	if (bolt_locked)
		return FALSE
	return ..()

/obj/item/gun/ballistic/nitro_express/attackby(obj/item/A, mob/user, params)
	if(internal_magazine && !bolt_locked)
		to_chat(user, span_notice("The [src] is closed!"))
		return
	if(chambered && second_casing)
		to_chat(user, span_notice("The [src] is full!"))
		return
	return ..()
*/

///Boltaction///
/obj/item/gun/ballistic/rifle/boltaction/brand_new
	desc = "A brand new Mosin Nagant issued by Nanotrasen for their interns. You would rather not to damage it."
	icon_state = "mosinprime"
	item_state = "mosinprime"
	sawn_desc = "A sawn-off Brand New Nagant... Doing this was a sin, I hope you're happy. \
		You are now probably one of the few people in the universe to ever hold a \"Brand New Obrez\". \
		Even thinking about that name combination makes you ill."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	zoomable = TRUE
	zoom_amt = 7 //Long range, enough to see in front of you, but no tiles behind you.
	zoom_out_amt = 2
	actions_types = list()

/obj/item/gun/ballistic/rifle/boltaction/brand_new/sawoff(mob/user)
	. = ..()
	if(.)
		name = "\improper Brand New Obrez" // wear it loud and proud

/obj/item/gun/ballistic/rifle/boltaction/qmrifle
	name = "\improper 'Forbidden' precision rifle"
	desc = "Modernized boltaction rifle, the frame feels robust as cargotech liver. \
	This thing was probably built with a conversion kit from a shady NTnet site. \
	<br><br>\
	<i>BRAND NEW: Cannot be sawn off.</i>"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	icon_state = "mosintactical"
	item_state = "mosintactical"
	can_be_sawn_off = FALSE

// The Lionhunter, a gun for heretics
// The ammo it uses takes time to "charge" before firing,
// releasing a homing, very damaging projectile
/obj/item/gun/ballistic/rifle/boltaction/lionhunter
	name = "\improper Lionhunter's Rifle"
	desc = "An antique looking rifle that looks immaculate despite being clearly very old. There are visually no aiming devices on the weapon."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
