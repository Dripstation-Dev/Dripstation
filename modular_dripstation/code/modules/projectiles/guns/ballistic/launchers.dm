/obj/item/gun/ballistic/gauss
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'

/obj/item/gun/grenadelauncher/flare
	name = "flare gun"
	desc = "A gun that fires flares. Replace with flares. Simple!."
	icon_state = "flaregun"
	icon = 'modular_dripstation/icons/obj/weapons/flaregun.dmi'
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
	light_on = FALSE
	light_range = 6
	light_color = LIGHT_COLOR_FLARE
	var/fuel = 0
	var/lower_fuel_limit = 800
	var/upper_fuel_limit = 1000

/obj/item/grenade/flare/Initialize()
	. = ..()
	fuel = rand(lower_fuel_limit, upper_fuel_limit) // Sorry for changing this so much but I keep under-estimating how long X number of ticks last in seconds.
	AddComponent(/datum/component/igniter, 0, null)

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

/obj/item/gun/ballistic/rocketlauncher
	name = "\improper PML-9"
	desc = "A reusable rocket propelled grenade launcher. The words \"NT this way\" and an arrow have been written near the barrel. \
	A sticker near the cheek rest reads, \"ENSURE AREA BEHIND IS CLEAR BEFORE FIRING\""
	///removes backblast damage if false
	var/backblastdamage = TRUE
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	item_state = "m9"
	manufacturer = /datum/corporation/gorlex
	available_attachments = list(
		/obj/item/attachment/grip/magnetic_harness
	)

//Adding in the rocket backblast. The tile behind the specialist gets blasted hard enough to down and slightly wound anyone
/obj/item/gun/ballistic/rocketlauncher/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	. = ..()
	if(!.)
		return
	var/turf/blast_source = get_turf(src)
	var/thrown_dir = REVERSE_DIR(get_dir(blast_source, target))
	var/turf/backblast_loc = get_step(blast_source, thrown_dir)
	///the smoke effect after firing
	var/datum/effect_system/fluid_spread/smoke/smoke = new
	smoke.set_up(0, location = backblast_loc)
	smoke.start()
	if(!backblastdamage)
		return
	for(var/mob/living/carbon/victim in backblast_loc)
		if(!(victim.mobility_flags & MOBILITY_STAND) || victim.stat == DEAD) //Have to be standing up to get the fun stuff
			continue
		victim.adjustBruteLoss(15) //The shockwave hurts, quite a bit. It can knock unarmored targets unconscious in real life
		victim.Paralyze(60) //For good measure
		victim.emote("pain")
		victim.throw_at(get_step(backblast_loc, thrown_dir), 1, 2)

/obj/item/gun/ballistic/rocketlauncher/nt
	name = "\improper NB-9 Launcher"
	desc = "The NB-9 Launcher is a long range explosive ordanance device used by the NanoTrasen forces used to fire explosive shells at far distances. \
	The big \"NanoTrasen\" logo is drawn near the cheek. A sticker near the barrel rest reads, \"ENSURE AREA BEHIND IS CLEAR BEFORE FIRING\""
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "t160"
	item_state = "t72"
	pin = /obj/item/firing_pin/implant/mindshield
	manufacturer = /datum/corporation/wardtakhashi

/obj/item/gun/ballistic/rocketlauncher/one_use
	name = "\improper RL-72 disposable rocket launcher"
	desc = "This is the premier disposable rocket launcher used throughout the galaxy, it cannot be reloaded or unloaded on the field. This one fires an 84mm anti armor rocket."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "t72"
	item_state = "t72"
	pin = /obj/item/firing_pin
	manufacturer = /datum/corporation/hephaestus/militech
	mag_type = /obj/item/ammo_box/magazine/internal/rocketlauncher
	starting_mag_type = /obj/item/ammo_box/magazine/internal/rocketlauncher/aa

/obj/item/ammo_box/magazine/internal/rocketlauncher/hedp
	ammo_type = /obj/item/ammo_casing/caseless/rocket/hedp

/obj/item/ammo_box/magazine/internal/rocketlauncher/aa
	ammo_type = /obj/item/ammo_casing/caseless/rocket/aa

/obj/item/gun/ballistic/rocketlauncher/one_use/attack_self()
	return

/obj/item/gun/ballistic/rocketlauncher/one_use/attackby()
	return

/obj/item/gun/ballistic/rocketlauncher/one_use/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	. = ..()
	if(!.)
		return
	user.dropItemToGround(src, TRUE)

/obj/item/ammo_casing/caseless/rocket
	name = "\improper PM-9HE"
	desc = "An 84mm High Explosive rocket. Fire at people and pray."
	caliber = CALIBER_84HE
	icon_state = "srm-8"
	projectile_type = /obj/projectile/bullet/a84mm

/obj/item/ammo_casing/caseless/rocket/hedp
	name = "\improper PM-9HEDP"
	desc = "An 84mm High Explosive Dual Purpose rocket. Pointy end toward mechs."
	caliber = CALIBER_84HE
	icon_state = "84mm-hedp"
	projectile_type = /obj/projectile/bullet/a84mm/hedp

/obj/item/ammo_casing/caseless/rocket/aa
	name = "\improper PM-9TC"
	desc = "An 84mm Tandem Cumulative rocket. Pointy end toward structures."
	icon_state = "srm-8"
	projectile_type = /obj/projectile/bullet/a84mm/anti_armor

/obj/item/ammo_casing/caseless/rocket/termobaric
	name = "\improper PM-9T"
	desc = "An 84mm Termobaric rocket. Pointy end toward enemy. Watch them burn."
	icon_state = "srm-8"
	projectile_type = /obj/projectile/bullet/a84mm/termobaric

/// PM9 rocket - projectile code below
/obj/projectile/bullet/a84mm
	name ="\improper HE 84mm missile"
	desc = "Boom."
	icon_state = "missile"
	damage = 50
	demolition_mod = 2
	ricochets_max = 0 //it's a MISSILE
	shrapnel_type = null
	/// Whether we do extra damage when hitting a mech or silicon
	var/anti_armour_damage = 0
	/// Whether the rocket is capable of instantly killing a living target
	var/random_crits_enabled = TRUE
	var/list/sturdy = list()


/obj/projectile/bullet/a84mm/proc/do_boom(atom/target)
	if(!isliving(target)) //if the target isn't alive, so is a wall or something
		explosion(target, heavy_impact_range = 1, light_impact_range = 2, flame_range = 3, flash_range = 4)
	else
		explosion(target, light_impact_range = 2, flame_range = 3, flash_range = 4)
	var/turf/detonation_turf = get_turf(src)
	log_game("A [name] detonated at [AREACOORD(detonation_turf)]")

/obj/projectile/bullet/a84mm/on_hit(atom/target, blocked = FALSE)
	if(isliving(target) && prob(1) && random_crits_enabled)
		var/mob/living/gibbed_dude = target
		if(!gibbed_dude.InCritical())
			gibbed_dude.say("Is that a fucking ro-", forced = "hit by rocket")
		gibbed_dude.gib()
	..()

	if(sturdy.len)
		for(var/i in sturdy)
			if(istype(target, i))
				do_boom(target)
				return BULLET_ACT_HIT
		new /obj/item/broken_missile(get_turf(src), 1)
		return BULLET_ACT_BLOCK
	do_boom(target)
	if(anti_armour_damage && ismecha(target))
		var/obj/mecha/M = target
		M.take_damage(anti_armour_damage)
	if(issilicon(target))
		var/mob/living/silicon/S = target
		S.take_overall_damage(anti_armour_damage*0.75, anti_armour_damage*0.25)
	return BULLET_ACT_HIT

/obj/projectile/bullet/a84mm/hedp
	name ="\improper HEDP 84mm missile"
	desc = "USE A WEEL GUN."
	icon_state= "84mm-hedp"
	armor_flag = BOMB
	damage = 80
	armour_penetration = 100
	dismemberment = 100
	anti_armour_damage = 200

/obj/projectile/bullet/a84mm/he/do_boom(atom/target, blocked = FALSE)
	explosion(target, devastation_range = -1, heavy_impact_range = 1, light_impact_range = 3, flame_range = 4, flash_range = 1)
	var/turf/detonation_turf = get_turf(src)
	log_game("A [name] detonated at [AREACOORD(detonation_turf)]")

/obj/projectile/bullet/a84mm/anti_armor
	name ="\improper tandem cumulative 84mm missile"
	desc = "Boom."
	icon_state = "atrocket"
	demolition_mod = 3
	armour_penetration = 100
	anti_armour_damage = 200
	random_crits_enabled = FALSE //no fun

/// PM9 weak rocket - just kind of a failure
/obj/projectile/bullet/a84mm/weak
	name = "low-yield 84mm missile"
	desc = "Boom, but less so."
	damage = 30
	random_crits_enabled = FALSE //no fun

/obj/projectile/bullet/a84mm/weak/do_boom(atom/target)
	if(!isliving(target)) //if the target isn't alive, so is a wall or something
		explosion(target, heavy_impact_range = 0, light_impact_range = 1, flame_range = 2, flash_range = 3)
	else
		explosion(target, light_impact_range = 1, flame_range = 2, flash_range = 3)
	var/turf/detonation_turf = get_turf(src)
	log_game("A [name] detonated at [AREACOORD(detonation_turf)]")

/obj/projectile/bullet/a84mm/br
	name ="\improper BR 84mm missile"
	desc = "Boom."
	icon_state = "missile"
	damage = 30
	demolition_mod = 4
	random_crits_enabled = FALSE //no fun
	sturdy = list(
	/turf/closed,
	/obj/mecha,
	/obj/machinery/door/,
	/obj/machinery/door/poddoor/shutters
	)

/obj/item/broken_missile
	name = "\improper broken 84mm missile"
	desc = "A missile that did not detonate. The tail has snapped and it is in no way fit to be used again."
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "missile_broken"
	w_class = WEIGHT_CLASS_TINY

/obj/projectile/bullet/a84mm/br/do_boom(atom/target, blocked = FALSE)
	explosion(target, devastation_range = 0, heavy_impact_range = 0, light_impact_range = 1, flame_range = 1, flash_range = 2)
	var/turf/detonation_turf = get_turf(src)
	log_game("A [name] detonated at [AREACOORD(detonation_turf)]")

/obj/projectile/bullet/a84mm/termobaric
	name = "\improper termobaric 84mm missile"
	icon_state= "84mm-termobaric"
	damage = 20
	var/list/beakers = list()

/obj/projectile/bullet/a84mm/termobaric/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/meta/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/meta/B2 = new(src)

	B1.reagents.add_reagent(/datum/reagent/phosphorus, 90)
	B1.reagents.add_reagent(/datum/reagent/napalm, 50)
	B2.reagents.add_reagent(/datum/reagent/stable_plasma, 90)
	B2.reagents.add_reagent(/datum/reagent/toxin/acid, 90)

	beakers += B1
	beakers += B2


/obj/projectile/bullet/a84mm/termobaric/do_boom(atom/target, blocked = FALSE)
	var/list/datum/reagents/reactants = list()
	for(var/obj/item/reagent_containers/glass/G in beakers)
		reactants += G.reagents

	var/turf/detonation_turf = get_turf(src)

	if(!chem_splash(detonation_turf, 6, reactants, 500, 2))
		if(beakers.len)
			for(var/obj/O in beakers)
				O.forceMove(drop_location())
				qdel(O)
			beakers = list()
		return
	explosion(target, light_impact_range = 2, flash_range = 6)
	log_game("A [name] detonated at [AREACOORD(detonation_turf)]")


