///////////////////////
////////gunspear////////
///////////////////////
/obj/item/gun/energy/gunspear
	name = "gunspear"
	desc = "A Unathi pulse rifle with advanced capacitors. Useful for putting down armored enemies."
	icon_state = "gunspear"
	item_state = "gunspear"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	icon = 'modular_dripstation/icons/obj/weapons/gunspear.dmi'
	automatic_charge_overlays = FALSE
	spread = 0
	recoil = 0
	force = 15
	wound_bonus = -15
	bare_wound_bonus = 15
	var/force_wielded = 20
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_HUGE
	var/overheat_time = 6 SECONDS
	var/holds_charge = FALSE
	var/overheat = FALSE
	var/recharge_timerid
	can_bayonet = FALSE
	cell_type = /obj/item/stock_parts/cell
	item_flags = NONE
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pulse)	//fix later probably
	
	manufacturer = /datum/corporation/independent

	muzzleflash_iconstate = "muzzle_flash_pulse"
	muzzle_flash_color = COLOR_PULSE_BLUE

/obj/item/gun/energy/gunspear/update_icon_state()
	. = ..()
	if(recharge_timerid)
		icon_state = "gunspear_recharging"
	else if(holds_charge)
		icon_state = "gunspear_active"
	else
		icon_state = "gunspear"

/obj/item/gun/energy/gunspear/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, \
		force_wielded = force_wielded, \
		wielded_stats = list(SWING_SPEED = 1, ENCUMBRANCE = 0.4, ENCUMBRANCE_TIME = 5, REACH = 2, DAMAGE_LOW = 0, DAMAGE_HIGH = 0), \
	)
	if(!holds_charge)
		empty()

/obj/item/gun/energy/gunspear/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] begins to sword-swallow \the [src]! It looks like [user.p_theyre()] trying to commit suicide!"))
	return BRUTELOSS

/obj/item/gun/energy/gunspear/shoot_live_shot()
	. = ..()
	attempt_reload()

/obj/item/gun/energy/gunspear/equipped(mob/user)
	. = ..()
	if(!can_shoot())
		attempt_reload()

/obj/item/gun/energy/gunspear/dropped()
	. = ..()
	if(!QDELING(src) && !holds_charge)
		// Put it on a delay because moving item from slot to hand
		// calls dropped().
		addtimer(CALLBACK(src, PROC_REF(empty_if_not_held)), 2)

/obj/item/gun/energy/gunspear/proc/empty_if_not_held()
	if(!ismob(loc))
		empty()

/obj/item/gun/energy/gunspear/proc/empty()
	if(cell)
		cell.use(cell.charge)
	update_appearance(UPDATE_ICON)

/obj/item/gun/energy/gunspear/proc/attempt_reload(recharge_time)
	if(!cell)
		return
	if(overheat)
		return
	if(!recharge_time)
		recharge_time = overheat_time
	overheat = TRUE

	deltimer(recharge_timerid)	//doublecheck
	recharge_timerid = addtimer(CALLBACK(src, PROC_REF(reload)), recharge_time, TIMER_STOPPABLE)

/obj/item/gun/energy/gunspear/proc/reload()
	cell.give(cell.maxcharge)
	recharge_newshot(TRUE)
	if(!suppressed)
		playsound(src.loc, 'sound/weapons/kenetic_reload.ogg', 60, 1)
	else
		to_chat(loc, span_warning("[src] silently charges up."))
	update_appearance(UPDATE_ICON)
	overheat = FALSE
	deltimer(recharge_timerid)
