/mob/living/simple_animal/hostile/asteroid/wolf
	maxHealth = 70
	health = 70
	obj_damage = 0
	attack_vis_effect = ATTACK_EFFECT_BITE
	environment_smash = ENVIRONMENT_SMASH_NONE
	disease_prob = 5
	disease_type = /datum/disease/rabies

/mob/living/simple_animal/hostile/asteroid/wolf/examine(mob/user)
	. = ..()
	for(var/thing in diseases)
		var/datum/disease/D
		if(istype(D, "The Rabies"))
			. += span_warning("It strangely drools!")

/mob/living/simple_animal/hostile/asteroid/wolf/vulpkanin
	name = "ice vulpkanin"
	desc = "A disgusting hybrid of man and wolf. A distant relative of Sharikov."
	icon = 'modular_dripstation/icons/mob/icemoon/icemoon_monsters.dmi'
	icon_state = "vulpa"
	icon_living = "vulpa"
	icon_dead = "vulpa"
	flip_on_death = TRUE
	attacktext = "hugs and violates"
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "hits"
	attacktext = "claws"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	friendly = "vulpa hugs"
	vision_range = 9
	aggro_vision_range = 9
	maxHealth = 200
	health = 200
	wound_bonus = 0
	bare_wound_bonus = 10
	sharpness = SHARP_EDGED
	attack_vis_effect = ATTACK_EFFECT_CLAW
	obj_damage = 15	// IT`S JOHNY
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	disease_prob = 50
	var/violating = FALSE

/mob/living/simple_animal/hostile/asteroid/wolf/vulpkanin/examine_more(mob/user)
	. = ..()
	var/msg = "- A moy ded vulpu s siskami vidal.\
		- Durak tvoi ded."

	return list(span_notice("<i>[msg]</i>"))

/mob/living/simple_animal/hostile/asteroid/wolf/vulpkanin/ListTargets()
	. = oview(vision_range, targets_from) //get list of things in vision range
	var/list/conscious_mobs = list()
	var/list/violation_target = list()
	for(var/HM in .)
		//Yum a tasty white woman
		if(ishuman(HM))
			var/mob/living/carbon/human/H = HM
			if(!(H.mobility_flags & MOBILITY_STAND))
				violation_target += HM
	for(var/LC in .)
		if(isliving(LC))
			var/mob/living/L = LC
			if(L.stat == CONSCIOUS)
				conscious_mobs += LC

	// if no victims around let`s find target to violate
	if(length(conscious_mobs) == 0)
		//Filter violation target
		return violation_target
	return conscious_mobs

/mob/living/simple_animal/hostile/asteroid/wolf/vulpkanin/AttackingTarget()
	if(violating)
		return
	if(istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = target
		if(!(H.mobility_flags & MOBILITY_STAND))
			if(ishumanbasic(H) && H.gender == FEMALE && prob(40))	//white woman moment
				visible_message(span_notice("[src] tries to violate [H]!"), span_notice("You trying to violate [H]!"))
				violating = TRUE
				H.apply_effect(4 SECONDS, EFFECT_PARALYZE)
				H.apply_effect(10 SECONDS, EFFECT_KNOCKDOWN)
				if(do_after(src, 3 SECONDS))
					visible_message(span_notice("[src] in a few quick moves violates [H] and leaves some liquid on their skin!"), span_notice("You violate [H]!"))
					do_attack_animation(H, ATTACK_EFFECT_BITE)
					for(var/thing in diseases)
						var/datum/disease/D = thing
						if(D.spread_flags & DISEASE_SPREAD_CONTACT_FLUIDS)
							H.ForceContractDisease(D)
				violating = FALSE
			else if(H.stat != DEAD)
				visible_message(span_notice("[src] bites off a piece of meat from [H]!"), span_notice("You bite [H]!"))
				do_attack_animation(H, ATTACK_EFFECT_BITE)
				return ..()
	else
		return ..()

/mob/living/simple_animal/hostile/asteroid/wolf/vulpkanin/handle_automated_action()
	if(violating)
		return 0
	else
		return ..()

/mob/living/simple_animal/hostile/asteroid/ice_whelp
	name = "ice whelp"
	desc = "The offspring of an ice drake, weak in comparison but still terrifying."
	icon = 'modular_dripstation/icons/mob/icemoon/icemoon_monsters.dmi'
	icon_state = "ice_whelp"
	icon_living = "ice_whelp"
	icon_dead = "ice_whelp_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	mouse_opacity = MOUSE_OPACITY_ICON
	friendly = "stare down"
	speak_emote = list("roars")
	speed = 20
	move_to_delay = 20
	ranged = TRUE
	ranged_cooldown_time = 200
	maxHealth = 300
	health = 300
	obj_damage = 15
	melee_damage_lower = 20
	melee_damage_upper = 20
	attacktext = "chomp"
	attack_sound = 'sound/magic/demon_attack1.ogg'
	vision_range = 5
	aggro_vision_range = 5
	move_resist = MOVE_FORCE_VERY_STRONG
	butcher_results = list(/obj/item/stack/ore/diamond = 3, /obj/item/stack/sheet/sinew = 2, /obj/item/stack/sheet/bone = 10, /obj/item/stack/sheet/animalhide/ashdrake = 1)
	loot = list()
	crusher_loot = /obj/item/crusher_trophy/tail_spike
	deathmessage = "collapses on its side."
	deathsound = 'sound/magic/demon_dies.ogg'
	stat_attack = UNCONSCIOUS
	robust_searching = TRUE
	footstep_type = FOOTSTEP_MOB_CLAW
	/// How far the whelps fire can go
	var/fire_range = 3

/mob/living/simple_animal/hostile/asteroid/ice_whelp/OpenFire()
	var/turf/T = get_ranged_target_turf_direct(src, target, fire_range)
	var/list/burn_turfs = getline(src, T) - get_turf(src)
	dragon_fire_line(src, burn_turfs)

/mob/living/simple_animal/hostile/asteroid/ice_whelp/death(gibbed)
	move_force = MOVE_FORCE_DEFAULT
	move_resist = MOVE_RESIST_DEFAULT
	pull_force = PULL_FORCE_DEFAULT
	if(prob(10))
		new /obj/item/gem/amber(loc)
	return ..()

/mob/living/simple_animal/hostile/asteroid/ice_demon
	name = "demonic watcher"
	desc = "A creature formed entirely out of ice, bluespace energy emanates from inside of it."
	icon = 'modular_dripstation/icons/mob/icemoon/icemoon_monsters.dmi'
	icon_state = "ice_demon"
	icon_living = "ice_demon"
	icon_dead = "ice_demon_dead"
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	mouse_opacity = MOUSE_OPACITY_ICON
	speak_emote = list("telepathically cries")
	speed = 7
	move_to_delay = 7
	projectiletype = /obj/projectile/temp/basilisk/ice
	projectilesound = 'sound/weapons/pierce.ogg'
	ranged = TRUE
	ranged_message = "manifests ice"
	ranged_cooldown_time = 30
	minimum_distance = 4
	retreat_distance = 3
	maxHealth = 150
	health = 150
	obj_damage = 40
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "slice"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	vision_range = 8
	aggro_vision_range = 8
	move_resist = MOVE_FORCE_VERY_STRONG
	del_on_death = TRUE
	loot = list()
	deathmessage = "fades as the energies that tied it to this world dissipate."
	deathsound = 'sound/magic/demon_dies.ogg'
	stat_attack = UNCONSCIOUS
	movement_type = FLYING
	robust_searching = TRUE
	footstep_type = FOOTSTEP_MOB_CLAW
	/// Distance the demon will teleport from the target
	var/teleport_distance = 3

/obj/projectile/temp/basilisk/ice
	name = "ice blast"
	damage = 5
	nodamage = FALSE
	temperature = -75

/mob/living/simple_animal/hostile/asteroid/ice_demon/OpenFire()
	// Sentient ice demons teleporting has been linked to server crashes
	if(client)
		return ..()
	if(teleport_distance <= 0)
		return ..()
	var/list/possible_ends = list()
	for(var/turf/T in view(teleport_distance, target.loc) - view(teleport_distance - 1, target.loc))
		if(isclosedturf(T))
			continue
		possible_ends |= T
	if(!possible_ends.len)
		return ..()
	var/turf/end = pick(possible_ends)
	do_teleport(src, end, 0,  channel=TELEPORT_CHANNEL_BLUESPACE, forced = TRUE)
	SLEEP_CHECK_DEATH(8)
	return ..()

/mob/living/simple_animal/hostile/asteroid/ice_demon/death(gibbed)
	move_force = MOVE_FORCE_DEFAULT
	move_resist = MOVE_RESIST_DEFAULT
	pull_force = PULL_FORCE_DEFAULT
	new /obj/item/stack/ore/bluespace_crystal(loc, 5)
	if(prob(5))
		new /obj/item/assembly/signaler/anomaly/bluespace(loc)
	if(prob(5))
		new /obj/item/gem/fdiamond(loc)
	if(prob(10))
		new /obj/item/crusher_trophy/watcher_wing/ice_wing(loc)
	return ..()

/mob/living/simple_animal/hostile/asteroid/old_demon
	name = "primordial demon"
	desc = "At the beginning, there was nothing but emptiness. \
	From the emptiness, there came monsters."
	icon = 'modular_dripstation/icons/mob/icemoon/icemoon_monsters.dmi'
	icon_state = "old_demon"
	icon_living = "old_demon"
	icon_dead = "ice_demon_dead"
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	mouse_opacity = MOUSE_OPACITY_ICON
	speak_emote = list("telepathically shrieks")
	speed = 2
	move_to_delay = 2
	projectiletype = /obj/projectile/temp/basilisk/ice
	projectilesound = 'sound/weapons/pierce.ogg'
	ranged = TRUE
	ranged_message = "manifests ice"
	ranged_cooldown_time = 15
	minimum_distance = 3
	retreat_distance = 1
	maxHealth = 300
	health = 300
	obj_damage = 100
	melee_damage_lower = 25
	melee_damage_upper = 25
	attacktext = "cleave"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	vision_range = 8
	aggro_vision_range = 8
	move_force = MOVE_FORCE_NORMAL
	move_resist = MOVE_FORCE_VERY_STRONG
	pull_force = MOVE_FORCE_NORMAL
	del_on_death = TRUE
	loot = list()
	deathmessage = "screeches in rage as it falls back into nullspace."
	deathsound = 'sound/magic/demon_dies.ogg'
	stat_attack = UNCONSCIOUS
	movement_type = FLYING
	robust_searching = TRUE
	footstep_type = FOOTSTEP_MOB_CLAW
	/// Distance the demon will teleport from the target
	var/teleport_distance = 3
	crusher_drop_mod = 75

/obj/projectile/temp/basilisk/ice
	name = "ice blast"
	damage = 10
	nodamage = FALSE
	temperature = -75

/mob/living/simple_animal/hostile/asteroid/ice_demon/OpenFire()
	// Sentient ice demons teleporting has been linked to server crashes
	if(client)
		return ..()
	if(teleport_distance <= 0)
		return ..()
	var/list/possible_ends = list()
	for(var/turf/T in view(teleport_distance, target.loc) - view(teleport_distance - 1, target.loc))
		if(isclosedturf(T))
			continue
		possible_ends |= T
	if(!possible_ends.len)
		return ..()
	var/turf/end = pick(possible_ends)
	do_teleport(src, end, 0,  channel=TELEPORT_CHANNEL_BLUESPACE, forced = TRUE)
	SLEEP_CHECK_DEATH(8)
	return ..()

/mob/living/simple_animal/hostile/asteroid/old_demon/death(gibbed)
	move_force = MOVE_FORCE_DEFAULT
	move_resist = MOVE_RESIST_DEFAULT
	pull_force = PULL_FORCE_DEFAULT
	new /obj/item/stack/ore/bluespace_crystal(loc, 10)
	if(prob(20))
		new /obj/item/assembly/signaler/anomaly/bluespace(loc)
	if(prob(20))
		new /obj/item/gem/fdiamond(loc)
	if(prob(50))
		new /obj/item/crusher_trophy/ice_crystal(loc)
	return ..()

/mob/living/simple_animal/hostile/asteroid/ice_demon/random/Initialize()
	. = ..()
	if(prob(15))
		new /mob/living/simple_animal/hostile/asteroid/old_demon(loc)
		return INITIALIZE_HINT_QDEL

/obj/item/crusher_trophy/ice_crystal
	name = "frost gem"
	icon = 'icons/obj/lavaland/elite_trophies.dmi'
	desc = "The glowing remnant of an ancient ice demon- so cold that it hurts to touch."
	icon_state = "ice_crystal"
	denied_type = /obj/item/crusher_trophy/ice_crystal

/obj/item/crusher_trophy/ice_crystal/effect_desc()
	return "waveform collapse to freeze a creature in a block of ice for a period, preventing them from moving"

/obj/item/crusher_trophy/ice_crystal/on_mark_detonation(mob/living/target, mob/living/user)
	target.apply_status_effect(/datum/status_effect/ice_crystal)

/datum/status_effect/ice_crystal
	id = "ice_crystal"
	duration = 20
	status_type = STATUS_EFFECT_REFRESH
	alert_type = /atom/movable/screen/alert/status_effect/ice_crystal
	/// Stored icon overlay for the hit mob, removed when effect is removed
	var/icon/cube

/atom/movable/screen/alert/status_effect/ice_crystal
	name = "Frozen Solid"
	desc = "You're frozen inside an ice cube, and cannot move!"
	icon_state = "frozen"

/datum/status_effect/ice_crystal/on_apply()
	RegisterSignal(owner, COMSIG_MOVABLE_PRE_MOVE, .proc/owner_moved)
	if(!owner.stat)
		to_chat(owner, "<span class='userdanger'>You become frozen in a cube!</span>")
	cube = icon('icons/effects/freeze.dmi', "ice_cube")
	var/icon/size_check = icon(owner.icon, owner.icon_state)
	cube.Scale(size_check.Width(), size_check.Height())
	owner.add_overlay(cube)
	return ..()

/// Blocks movement from the status effect owner
/datum/status_effect/ice_crystal/proc/owner_moved()
	return COMPONENT_MOVABLE_BLOCK_PRE_MOVE

/datum/status_effect/ice_crystal/on_remove()
	if(!owner.stat)
		to_chat(owner, "<span class='notice'>The cube melts!</span>")
	owner.cut_overlay(cube)
	UnregisterSignal(owner, COMSIG_MOVABLE_PRE_MOVE)

/mob/living/simple_animal/hostile/megafauna/demonic_frost_miner
	icon = 'modular_dripstation/icons/mob/icemoon/icemoon_monsters.dmi'

/mob/living/simple_animal/hostile/megafauna/blood_drunk_miner/doom
	name = "hostile-environment miner"
	desc = "A miner destined to hop across dimensions for all eternity, hunting anomalous creatures."
	speed = 8
	move_to_delay = 8
	ranged_cooldown_time = 15
	dash_cooldown = 15
	aggro_vision_range = 3


/mob/living/simple_animal/hostile/hivebot/mechanic
	name = "hivebot mechanic"
	icon_state = "EngBot"
	icon_living = "EngBot"
	icon_dead = "strong"
	desc = "A robot built for base upkeep, intended for use inside hivebot colonies."
	health = 60
	maxHealth = 60
	ranged = TRUE
	rapid = 3
	gold_core_spawnable = HOSTILE_SPAWN
	var/datum/action/innate/hivebot/foamwall/foam

/mob/living/simple_animal/hostile/hivebot/mechanic/Initialize(mapload)
	. = ..()
	foam = new
	foam.Grant(src)

/mob/living/simple_animal/hostile/hivebot/mechanic/AttackingTarget()
	if(istype(target, /obj/machinery))
		var/obj/machinery/fixable = target
		if(fixable.get_integrity() >= fixable.max_integrity)
			to_chat(src, "<span class='warning'>Diagnostics indicate that this machine is at peak integrity.</span>")
			return
		to_chat(src, "<span class='warning'>You begin repairs...</span>")
		if(do_after(src, 50, target = fixable))
			fixable.update_integrity(max_integrity)
			do_sparks(3, TRUE, fixable)
			to_chat(src, "<span class='warning'>Repairs complete.</span>")
		return
	if(istype(target, /mob/living/simple_animal/hostile/hivebot))
		var/mob/living/simple_animal/hostile/hivebot/fixable = target
		if(fixable.health >= fixable.maxHealth)
			to_chat(src, "<span class='warning'>Diagnostics indicate that this unit is at peak integrity.</span>")
			return
		to_chat(src, "<span class='warning'>You begin repairs...</span>")
		if(do_after(src, 50, target = fixable))
			fixable.revive(full_heal = TRUE, admin_revive = TRUE)
			do_sparks(3, TRUE, fixable)
			to_chat(src, "<span class='warning'>Repairs complete.</span>")
		return
	return ..()

/datum/action/innate/hivebot
	background_icon_state = "bg_default"

/datum/action/innate/hivebot/foamwall
	name = "Foam Wall"
	desc = "Creates a foam wall that resists against the vacuum of space."

/datum/action/innate/hivebot/foamwall/Activate()
	var/mob/living/simple_animal/hostile/hivebot/H = owner
	var/turf/T = get_turf(H)
	if(T.density)
		to_chat(H, "<span class='warning'>There's already something on this tile!</span>")
		return
	to_chat(H, "<span class='warning'>You begin to create a foam wall at your position...</span>")
	if(do_after(H, 50, target = H))
		for(var/obj/structure/foamedmetal/FM in T.contents)
			to_chat(H, "<span class='warning'>There's already a foam wall on this tile!</span>")
			return
		new /obj/structure/foamedmetal(H.loc)
		playsound(get_turf(H), 'sound/effects/extinguish.ogg', 50, TRUE, -1)

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow/tendril
	fromtendril = TRUE

/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/snow/infest(mob/living/carbon/human/H)
	visible_message(span_warning("[name] burrows into the flesh of [H]!"))
	var/mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow/L
	//if(H.dna.check_mutation(DWARFISM)) //dwarf legions aren't just fluff!
	//	L = new /mob/living/simple_animal/hostile/asteroid/hivelord/legion/dwarf(H.loc)
	//else
	//	L = new(H.loc)
	L = new(H.loc)
	visible_message(span_warning("[L] staggers to [L.p_their()] feet!"))
	H.death()
	H.adjustBruteLoss(1000)
	L.stored_mob = H
	H.forceMove(L)
	qdel(src)

/mob/living/simple_animal/hostile/syndicate/melee/sword/icemoon
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)

/mob/living/simple_animal/hostile/syndicate/ranged/smg/icemoon
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)

/mob/living/simple_animal/hostile/syndicate/ranged/shotgun/icemoon
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)

/mob/living/simple_animal/hostile/megafauna/dragon/icemoon

/mob/living/simple_animal/hostile/megafauna/dragon/icemoon/death()
	for(var/obj/effect/landmark/lost_syndicate_ghost_spawn/L in GLOB.landmarks_list)
		L.create_roles()
	..()
