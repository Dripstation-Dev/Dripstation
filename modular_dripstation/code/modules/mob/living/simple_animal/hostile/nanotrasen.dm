/mob/living/simple_animal/hostile/nanotrasen
	name = "Nanotrasen Amber Officer"
	desc = "An officer part of Nanotrasen's private security force, he seems rather unpleased to meet you."
	icon = 'modular_dripstation/icons/mob/simple_human.dmi'
	speak = list("YOU CALL THIS RESISTING ARREST?!", "WE CALL THIS A DIFFICULTY TWEAK!", "WHO`S THE CLOWN NOW?!", "STOP HITTING YOURSELF!")
	var/static/list/death_sounds = list(
		'sound/voice/cpdeath/die1.ogg',
		'sound/voice/cpdeath/die2.ogg',
		'sound/voice/cpdeath/die3.ogg',
		'sound/voice/cpdeath/die4.ogg',
	)
	speed = -1	//inhuman speed
	check_friendly_fire = 1
	del_on_death = 1

/mob/living/simple_animal/hostile/nanotrasen/Initialize(mapload)
	..()
	deathsound = pick(death_sounds)

/mob/living/simple_animal/hostile/nanotrasen/Aggro()
	..()
	summon_backup(15)
	say("609 in progress, requesting backup!")
	playsound(src, "yogstation/sound/voice/dispatch_please_respond.ogg", 100)

/mob/living/simple_animal/hostile/nanotrasen/handle_automated_speech(override)
	set waitfor = FALSE
	if(speak_chance)
		if(prob(speak_chance) || override)
			var/saypick = pick(speak)
			say(saypick, forced = "poly")
			if(saypick == "YOU CALL THIS RESISTING ARREST?!")
				playsound(src, 'modular_dripstation/sound/voice/resisting_arrest.wav', 60)
			if(saypick == "WE CALL THIS A DIFFICULTY TWEAK!")
				playsound(src, 'modular_dripstation/sound/voice/difficulty_tweak.wav', 60)
			if(saypick == "WHO`S THE CLOWN NOW?!")
				playsound(src, 'modular_dripstation/sound/voice/whos_the_clown_now.wav', 60)
			if(saypick == "STOP HITTING YOURSELF!")
				playsound(src, 'modular_dripstation/sound/voice/stop_hitting_yourself.wav', 60)

/mob/living/simple_animal/hostile/nanotrasen/melee
	melee_damage_lower = 30
	melee_damage_upper = 30
	var/projectile_deflect_chance = 20
	maxHealth = 120
	health = 120
	icon_state = "nanotrasen_knife"
	icon_living = "nanotrasen_knife"
	attacktext = "slashes"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	rapid_melee = 3

/mob/living/simple_animal/hostile/nanotrasen/melee/bullet_act(obj/projectile/Proj)
	if(prob(projectile_deflect_chance))
		visible_message(span_danger("[src] blocks [Proj] with its weapon!"))
		return BULLET_ACT_BLOCK
	return ..()

/mob/living/simple_animal/hostile/nanotrasen/melee/sword
	melee_damage_lower = 20
	melee_damage_upper = 20
	armour_penetration = 40
	maxHealth = 100
	health = 100
	icon_state = "nanotrasen_sword"
	icon_living = "nanotrasen_sword"

/mob/living/simple_animal/hostile/nanotrasen/ranged
	maxHealth = 150
	health = 150
	rapid = 2
	retreat_distance = 6
	minimum_distance = 6
	vision_range = 10
	aggro_vision_range = 10
	casingtype = /obj/item/ammo_casing/c46x30mm/airburst
	projectilesound = 'sound/weapons/gunshot_smg.ogg'
	loot = list(/obj/item/gun/ballistic/automatic/wt550,
				/obj/effect/mob_spawn/human/corpse/nanotrasensoldier)

/mob/living/simple_animal/hostile/nanotrasen/ranged/smg
	maxHealth = 150
	health = 150
	vision_range = 9
	aggro_vision_range = 9
	casingtype = /obj/item/ammo_casing/a556
	projectilesound = 'sound/weapons/gunshot_smg.ogg'
	loot = list(/obj/item/gun/ballistic/automatic/pistol/m1911,
				/obj/effect/mob_spawn/human/corpse/nanotrasensoldier)
