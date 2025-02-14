/obj/item/gun/ballistic/gauss
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'

/obj/item/gun/grenadelauncher/flare
	name = "flare gun"
	desc = "A gun that fires flares. Replace with flares. Simple!."
	icon_state = "flaregun"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	item_state = "pistol"
	fire_sound = 'modular_dripstation/sound/weapons/flare.ogg'
	w_class = WEIGHT_CLASS_TINY
	fire_delay = 0.5 SECONDS
	grenades = list(/obj/item/grenade/flare)
	max_grenades = 1

/obj/item/grenade/flare
	name = "\improper M40 FLDP grenade"
	desc = "A TGMC standard issue flare utilizing the standard DP canister chassis. Capable of being loaded in any grenade launcher, or thrown by hand."
	icon_state = "flare"
	item_state = "flare"
	icon = 'icons/obj/lighting.dmi'
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	det_time = 0
	throwforce = 1
	w_class = WEIGHT_CLASS_SMALL
	light_system = MOVABLE_LIGHT
	light_range = 6
	light_color = LIGHT_COLOR_FLARE
	var/fuel = 0
	var/lower_fuel_limit = 800
	var/upper_fuel_limit = 1000

/obj/item/grenade/flare/Initialize()
	. = ..()
	fuel = rand(lower_fuel_limit, upper_fuel_limit) // Sorry for changing this so much but I keep under-estimating how long X number of ticks last in seconds.
	var/datum/component/igniter/IGN = GetComponent(/datum/component/igniter)
	IGN.fire_stacks = 0
	IGN.fire_type = null

/obj/item/grenade/flare/prime()
	return

/obj/item/grenade/flare/Destroy()
	turn_off()
	return ..()

/obj/item/grenade/flare/process()
	fuel = max(fuel - 1, 0)
	if(!fuel || !active)
		turn_off()

/obj/item/grenade/flare/proc/turn_off()
	active = FALSE
	fuel = 0
	heat = 0
	var/datum/component/igniter/IGN = GetComponent(/datum/component/igniter)
	IGN.fire_stacks = 0
	IGN.fire_type = null
	force = initial(force)
	damtype = initial(damtype)
	update_brightness()
	icon_state = "[initial(icon_state)]_empty" // override icon state set by update_brightness
	STOP_PROCESSING(SSobj, src)

/obj/item/grenade/flare/proc/turn_on()
	active = TRUE
	force = 5
	throwforce = 10
	var/datum/component/igniter/IGN = GetComponent(/datum/component/igniter)
	IGN.fire_stacks = 5
	IGN.fire_type = /datum/status_effect/fire_handler/fire_stacks
	heat = 1500
	damtype = BURN
	update_brightness()
	playsound(src,'modular_dripstation/sound/item/flare.ogg', 15, 1)
	START_PROCESSING(SSobj, src)

/obj/item/grenade/flare/attack_self(mob/user)

	// Usual checks
	if(!fuel)
		to_chat(user, span_notice("It's out of fuel."))
		return
	if(active)
		return

	// All good, turn it on.
	user.visible_message(span_notice("[user] activates the flare."), span_notice("You depress the ignition button, activating it!"))
	turn_on(user)
	if(iscarbon(user))
		var/mob/living/carbon/C = usr
		C.toggle_throw_mode()

/obj/item/grenade/flare/on/Initialize()
	. = ..()
	active = TRUE
	heat = 1500
	update_brightness()
	force = 5
	throwforce = 10
	var/datum/component/igniter/IGN = GetComponent(/datum/component/igniter)
	IGN.fire_stacks = 5
	IGN.fire_type = /datum/status_effect/fire_handler/fire_stacks
	damtype = BURN
	START_PROCESSING(SSobj, src)

/obj/item/grenade/flare/proc/update_brightness()
	if(active && fuel > 0)
		icon_state = "[initial(icon_state)]_active"
		item_state = "[initial(item_state)]_active"
		set_light_on(TRUE)
	else
		icon_state = initial(icon_state)
		item_state = initial(item_state)
		set_light_on(FALSE)

/*
/obj/item/grenade/flare/throw_impact(atom/hit_atom, speed)
	. = ..()
	if(!active)
		return

	if(isliving(hit_atom))
		var/mob/living/L = hit_atom

		var/target_zone = check_zone(L.zone_selected)
		if(!target_zone || rand(40))
			target_zone = "chest"
		if(launched && CHECK_BITFIELD(resistance_flags, ON_FIRE) && !L.on_fire)
			var/armor_block = L.get_soft_armor("fire", target_zone)
			L.apply_damage(rand(throwforce*0.75,throwforce*1.25), BURN, target_zone, armor_block, updating_health = TRUE) //Do more damage if launched from a proper launcher and active

	// Flares instantly burn out nodes when thrown at them.
	var/obj/alien/weeds/node/N = locate() in loc
	if(N)
		qdel(N)
		turn_off()
*/


/obj/item/gun/ballistic/revolver/grenadelauncher/dna
	pin = /obj/item/firing_pin/dna/secure
