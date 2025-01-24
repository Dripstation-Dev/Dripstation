/obj/item/gun/ballistic/automatic/powered
	mag_type = /obj/item/ammo_box/magazine/gauss
	can_suppress = FALSE

	cell_type = /obj/item/stock_parts/cell/gun
	var/charge_sections = 3

	var/shaded_charge = FALSE //if this gun uses a stateful charge bar for more detail
	var/automatic_charge_overlays = TRUE	//Do we handle overlays with base update_icon()?

	can_cell = TRUE ///if the gun's cell can be replaced
	//var/small_gun = FALSE ///if the gun is small and can only fit the small gun cell
	//var/big_gun = FALSE ///if the gun is big and can fit the comically large gun cell
	//var/unscrewing_time = 2 SECONDS ///Time it takes to unscrew the cell
	//var/sound_volume = 40 //Volume of loading/unloading cell sounds
	load_cell_sound = 'modular_dripstation/sound/weapons/magnetic/rifle_reload.ogg'

/obj/item/gun/ballistic/automatic/powered/Initialize()
	. = ..()
	if(spawnwithmagazine)
		if(cell_type)
			cell = new cell_type(src)
		else
			cell = new(src)
	update_appearance(UPDATE_ICON)

/obj/item/gun/ballistic/automatic/powered/examine(mob/user)
	. = ..()
	if(cell)
		. += "<span class='notice'>[src]'s cell is [round(cell.charge / cell.maxcharge, 0.1) * 100]% full.</span>"
	else
		. += "<span class='notice'>[src] doesn't seem to have a cell!</span>"

/obj/item/gun/ballistic/automatic/powered/can_shoot()
	if(QDELETED(cell))
		return FALSE

	var/obj/item/ammo_casing/caseless/gauss/shot = chambered
	if(!shot)
		return FALSE
	if(cell.charge < shot.energy_cost * burst_size)
		return FALSE
	return ..()

/obj/item/gun/ballistic/automatic/powered/shoot_live_shot(mob/living/user, pointblank = FALSE, mob/pbtarget, message = 1, stam_cost = 0)
	var/obj/item/ammo_casing/caseless/gauss/shot = chambered
	cell.use(shot.energy_cost)
	return ..()

/obj/item/gun/ballistic/automatic/powered/get_cell()
	return cell

/obj/item/gun/ballistic/automatic/powered/proc/nopin()
	pin = null
	spawnwithmagazine = FALSE
	magazine = null
	cell = null

/obj/item/gun/ballistic/automatic/powered/update_overlays()
	. = ..()
	if(!automatic_charge_overlays)
		return
	var/overlay_icon_state = "[icon_state]_charge"
	var/charge_ratio = get_charge_ratio()
	if(cell)
		. += "[icon_state]_cell"
	if(charge_ratio == 0)
		. += "[icon_state]_cellempty"
	else
		if(!shaded_charge)
			var/mutable_appearance/charge_overlay = mutable_appearance(icon, overlay_icon_state)
			for(var/i in 1 to charge_ratio)
				charge_overlay.pixel_x = ammo_x_offset * (i - 1)
				charge_overlay.pixel_y = ammo_y_offset * (i - 1)
				. += new /mutable_appearance(charge_overlay)
		else
			. += "[icon_state]_charge[charge_ratio]"

/obj/item/gun/ballistic/automatic/powered/proc/get_charge_ratio()
	if(!cell)
		return FALSE
	return CEILING(clamp(cell.charge / cell.maxcharge, 0, 1) * charge_sections, 1)// Sets the ratio to 0 if the gun doesn't have enough charge to fire, or if its power cell is removed.



//////////////////////
//////ACTUAL GUN//////
//////////////////////
/obj/item/gun/ballistic/automatic/powered/gauss_rifle
	name = "prototype magnetic assault rifle"
	desc = "A Cybersun experimental rifle with advanced capacitors. Useful for putting down variety of enemies. Chambered in ferromagnetic pellets."
	icon_state = "magauto"
	item_state = "carbine"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/gauss
	cell_type = /obj/item/stock_parts/cell/gun/upgraded
	cartridge_wording = "pellet"
	fire_sound = 'modular_dripstation/sound/weapons/magnetic/magrifle.ogg'
	vary_fire_sound = TRUE
	load_cell_sound = 'modular_dripstation/sound/weapons/magnetic/rifle_reload.ogg'
	casing_ejector = FALSE
	tac_reloads = FALSE //No tac reloading on advanced rifle, handle it with care
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 3
	spread = 0
	recoil = 0.1
	mag_display = TRUE
	empty_indicator = TRUE
	empty_alarm = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY

	charge_sections = 4
	ammo_x_offset = 2

/obj/item/gun/ballistic/automatic/powered/gauss_rifle/empty
	spawnwithmagazine = FALSE

///////////////////////
////////RAILGUN////////
///////////////////////
/obj/item/gun/ballistic/rail
	name = "prototype rail sniper rifle"
	desc = "A Cybersun experimental rifle with advanced capacitors. Useful for putting down armored enemies. Chambered in ferromagnetic railslugs."
	icon_state = "railgun"
	item_state = "railgun"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/rail
	internal_magazine = TRUE
	cell_type = /obj/item/stock_parts/cell/gun/large
	cartridge_wording = "pellet"
	fire_sound = 'modular_dripstation/sound/weapons/magnetic/magovercharge.ogg'
	load_cell_sound = 'modular_dripstation/sound/weapons/magnetic/sniper_reload.ogg'
	//rack_delay = 3 SECONDS
	bolt_type = BOLT_TYPE_NO_BOLT
	vary_fire_sound = FALSE
	can_cell = TRUE ///if the gun's cell can be replaced
	var/charge_sound = 'modular_dripstation/sound/weapons/magnetic/rail_reload.ogg'
	var/charging_time = 6 SECONDS
	var/recharging = FALSE
	casing_ejector = TRUE
	tac_reloads = FALSE //No tac reloading on advanced rifle, handle it with care
	can_suppress = FALSE
	spread = 0
	recoil = 0.1
	mag_display = FALSE
	empty_indicator = TRUE
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_HUGE
	
	//zoomable = TRUE
	//zoom_amt = 10 //Long range, enough to see in front of you, but no tiles behind you.
	//zoom_out_amt = 5

/obj/item/gun/ballistic/rail/Initialize()
	. = ..()
	if(cell_type)
		cell = new cell_type(src)
	else
		cell = new(src)
	update_appearance(UPDATE_ICON_STATE)

/obj/item/gun/ballistic/rail/update_icon_state()
	if(!cell)
		icon_state = "railgun_no_cell"
	else if(recharging)
		icon_state = "railgun_recharging"
	else
		icon_state = initial(icon_state)

/obj/item/gun/ballistic/rail/examine(mob/user)
	. = ..()
	if(cell)
		. += "<span class='notice'>[src]'s cell is [round(cell.charge / cell.maxcharge, 0.1) * 100]% full.</span>"
	else
		. += "<span class='notice'>[src] doesn't seem to have a cell!</span>"

/obj/item/gun/ballistic/rail/can_shoot()
	if(QDELETED(cell))
		return FALSE

	var/obj/item/ammo_casing/caseless/rail/shot = chambered
	if(!shot)
		return FALSE
	if(cell.charge < shot.energy_cost * burst_size)
		return FALSE
	if(recharging)
		return FALSE
	return ..()

/obj/item/gun/ballistic/rail/cell_insert(obj/item/I, mob/user)
	if(do_after(user, cell_removing_time, src, timed_action_flags = IGNORE_USER_LOC_CHANGE))
		if(!user.transferItemToLoc(I, src))
			return FALSE
		var/obj/item/stock_parts/cell/gun/C = I
		to_chat(user, span_notice("You attach [C] to [src]."))
		cell = C
		update_appearance()
		recharging = TRUE
		playsound(src, load_cell_sound, 40, TRUE)
		var/load_time = charging_time + 1 SECONDS
		addtimer(CALLBACK(src, PROC_REF(sound_start_time)), 1 SECONDS)
		addtimer(CALLBACK(src, PROC_REF(charged)), load_time)
		return TRUE
	else
		return FALSE

/obj/item/gun/ballistic/rail/proc/sound_start_time()
	playsound(src, charge_sound, rack_sound_volume, rack_sound_vary)

/obj/item/gun/ballistic/rail/shoot_live_shot(mob/living/user, pointblank = FALSE, mob/pbtarget, message = 1, stam_cost = 0)
	var/obj/item/ammo_casing/caseless/rail/shot = chambered
	cell.use(shot.energy_cost)
	recharging = TRUE
	playsound(src, charge_sound, rack_sound_volume, rack_sound_vary)
	addtimer(CALLBACK(src, PROC_REF(charged)), charging_time)
	update_appearance(UPDATE_ICON_STATE)
	return ..()

/obj/item/gun/ballistic/rail/proc/charged()
	recharging = FALSE
	update_appearance()

/obj/item/gun/ballistic/rail/clear_cell()
	if(!cell)
		return
	cell = null
	recharging = FALSE
	update_appearance()
	return TRUE
