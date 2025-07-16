/mob/living/simple_animal/hostile/scav
	name = "Scavanger"
	desc = "A scav, he seems rather unpleased to meet you."
	icon = 'modular_dripstation/icons/mob/simple_human.dmi'
	icon_state = "scav"
	icon_living = "scav"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	speak_chance = 0
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 0
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	maxHealth = 100
	health = 100
	harm_intent_damage = 5
	melee_damage_lower = 0
	melee_damage_upper = 8
	attacktext = "punches"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/effect/mob_spawn/human/corpse/scav)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	faction = list(FACTION_SCAV)
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 1
	dodging = TRUE
	rapid_melee = 2
	footstep_type = FOOTSTEP_MOB_SHOE

/obj/effect/mob_spawn/human/corpse/scav
	name = "Scav"
	id_job = "Scav"
	hair_style = "Bald"
	facial_hair_style = "Shaved"
	skin_tone = "caucasian1"
	outfit = /datum/outfit/scavcorpse

/datum/outfit/scavcorpse
	name = "Scav Corpse"
	uniform = /obj/item/clothing/under/color/grey
	suit = null
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/fingerless
	ears = /obj/item/radio/headset
	belt = /obj/item/storage/belt/utility/full
	mask = null
	head = null
	back = null
	id = null

/mob/living/simple_animal/hostile/scav/classic
	icon_state = "scav_classic"
	icon_living = "scav_classic"
	harm_intent_damage = 8
	melee_damage_lower = 8
	melee_damage_upper = 8
	r_hand = /obj/item/crowbar/red
	attack_sound = "swing_hit"
	loot = list(/obj/effect/mob_spawn/human/corpse/scav/classic, /obj/item/crowbar/red)

/obj/effect/mob_spawn/human/corpse/scav/classic
	outfit = /datum/outfit/scavcorpse/classic

/datum/outfit/scavcorpse/classic
	name = "Scav Corpse Classic"
	gloves = /obj/item/clothing/gloves/color/yellow
	mask = /obj/item/clothing/mask/gas

/mob/living/simple_animal/hostile/scav/medic
	icon_state = "scav_medic"
	icon_living = "scav_medic"
	harm_intent_damage = 6
	melee_damage_lower = 6
	melee_damage_upper = 6
	r_hand = /obj/item/scalpel
	attack_sound = 'sound/weapons/bladeslice.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/scav/medic, /obj/item/scalpel)

/obj/effect/mob_spawn/human/corpse/scav/medic
	outfit = /datum/outfit/scavcorpse/medic

/datum/outfit/scavcorpse/medic
	name = "Scav Corpse Medic"
	gloves = /obj/item/clothing/gloves/color/latex
	head = /obj/item/clothing/head/soft/emt
	belt = /obj/item/storage/belt/medical/full

/mob/living/simple_animal/hostile/scav/rogue
	icon_state = "scav_rogue"
	icon_living = "scav_rogue"
	harm_intent_damage = 10
	melee_damage_lower = 10
	melee_damage_upper = 10
	maxHealth = 120
	health = 120
	r_hand = /obj/item/storage/toolbox/syndicate
	attack_sound = "swing_hit"
	loot = list(/obj/effect/mob_spawn/human/corpse/scav/rogue, /obj/item/storage/toolbox/syndicate)

/obj/effect/mob_spawn/human/corpse/scav/rogue
	outfit = /datum/outfit/scavcorpse/rogue

/datum/outfit/scavcorpse/rogue
	name = "Scav Corpse Rogue"
	mask = /obj/item/clothing/mask/gas/syndicate
	gloves = /obj/item/clothing/gloves/combat

/mob/living/simple_animal/hostile/bandit
	name = "Bandit"
	desc = "A human beeng part of band, he seems rather unpleased to meet you."
	icon_state = "bandit"
	icon_living = "bandit"
	speak = list("Обосрался?!", "Я НА НУЛЕ!", "КУДА ПОСКАКАЛ?!")
	icon = 'modular_dripstation/icons/mob/simple_human.dmi'
	speak_chance = 2
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 0
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	maxHealth = 100
	health = 100
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = "punches"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/effect/mob_spawn/human/corpse/bandit)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	faction = list(FACTION_SCAV, FACTION_PIRATE)
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 1
	dodging = TRUE
	rapid_melee = 2
	footstep_type = FOOTSTEP_MOB_SHOE

/obj/effect/mob_spawn/human/corpse/bandit
	name = "Bandit"
	id_job = "Bandit"
	hair_style = "Bald"
	facial_hair_style = "Shaved"
	skin_tone = "caucasian1"
	outfit = /datum/outfit/banditcorpse

/datum/outfit/banditcorpse
	name = "Bandit Corpse"
	uniform = /obj/item/clothing/under/syndicate/tacticool/bandit
	suit = null
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/fingerless
	ears = null
	mask = null
	head = null
	back = null
	id = null

/mob/living/simple_animal/hostile/bandit/Aggro()
	..()
	var/speaked = FALSE
	if(prob(30))
		speaked = TRUE
		say("Это что за хрень")
		playsound(src, 'modular_dripstation/sound/voice/scav/wtf.mp3', 60)
	if(prob(30) && !speaked)	//stop spamming
		summon_backup(15)
		switch(pick(1,2))
			if(1)
				say("Это наша точка!")
				playsound(src, 'modular_dripstation/sound/voice/scav/shout_itsourplace.mp3', 60)
			if(2)
				say("Э служивый!")
				playsound(src, 'modular_dripstation/sound/voice/scav/shout_service.mp3', 60)


/mob/living/simple_animal/hostile/bandit/handle_automated_speech(override)
	set waitfor = FALSE
	if(speak_chance)
		if(prob(speak_chance) || override)
			var/saypick = pick(speak)
			say(saypick, forced = "simplehuman")
			if(saypick == "Обосрался?!")
				playsound(src, 'modular_dripstation/sound/voice/scav/youfeared.mp3', 60)
			if(saypick == "Я НА НУЛЕ!")
				playsound(src, 'modular_dripstation/sound/voice/scav/zeroammo.mp3', 60)
			if(saypick == "КУДА ПОСКАКАЛ?!")
				playsound(src, 'modular_dripstation/sound/voice/scav/whereareyou.mp3', 60)

/mob/living/simple_animal/hostile/bandit/ranged
	ranged = 2
	retreat_distance = 3
	minimum_distance = 3
	icon_state = "slav_bandit_ranged"
	icon_living = "slav_bandit_ranged"
	projectilesound = 'sound/weapons/gunshot.ogg'
	r_hand = /obj/item/gun/ballistic/automatic/pistol/glock17
	casingtype = /obj/item/ammo_casing/c9mm
	loot = list(/obj/effect/mob_spawn/human/corpse/bandit/ranged, /obj/item/gun/ballistic/automatic/pistol/glock17)

/obj/effect/mob_spawn/human/corpse/bandit/ranged
	outfit = /datum/outfit/banditcorpse/ranged

/obj/item/clothing/head/beret/black/bandit
	desc = "A black beret, perfect for slav criminals."

/datum/outfit/banditcorpse/ranged
	name = "Bandit Corpse Ranged"
	mask = /obj/item/clothing/mask/scarf
	head = /obj/item/clothing/head/beret/black/bandit

/mob/living/simple_animal/hostile/bandit/ranged/shotgun
	ranged = 1
	retreat_distance = 2
	minimum_distance = 3
	icon_state = "slav_bandit_shotgun"
	icon_living = "slav_bandit_shotgun"
	projectilesound = 'sound/weapons/shotgunshot.ogg'
	casingtype = /obj/item/ammo_casing/shotgun/buckshot
	r_hand = /obj/item/gun/ballistic/shotgun/automatic
	armor = list(MELEE = 30, BULLET = 0, LASER = 10, ENERGY = 20, BOMB = 20)
	loot = list(/obj/effect/mob_spawn/human/corpse/bandit/ranged/shotgun, /obj/item/gun/ballistic/shotgun/automatic)

/obj/effect/mob_spawn/human/corpse/bandit/ranged/shotgun
	outfit = /datum/outfit/banditcorpse/ranged/shotgun

/obj/item/clothing/suit/jacket/leather/overcoat/bandit
	armor = list(MELEE = 30, BULLET = 0, LASER = 10, ENERGY = 20, BOMB = 20)

/datum/outfit/banditcorpse/ranged/shotgun
	name = "Bandit Corpse Ranged"
	suit = /obj/item/clothing/suit/jacket/leather/overcoat/bandit
	mask = /obj/item/clothing/mask/cigarette/space_cigarette
	head = /obj/item/clothing/head/beret/black/bandit


/mob/living/simple_animal/hostile/bandit/ranged/killa
	maxHealth = 600
	health = 600
	ranged = 5
	icon_state = "killa"
	icon_living = "killa"
	projectilesound = 'sound/weapons/rifleshot.ogg'
	casingtype = /obj/item/ammo_casing/mm712x82
	r_hand = /obj/item/gun/ballistic/automatic/l6_saw/m60/ultrasecure
	armor = list(MELEE = 20, BULLET = 75, LASER = 10, ENERGY = 10, BOMB = 50)
	loot = list(/obj/effect/mob_spawn/human/corpse/bandit/ranged/killa, /obj/item/gun/ballistic/automatic/l6_saw/m60/ultrasecure)

/obj/effect/mob_spawn/human/corpse/bandit/ranged/killa
	outfit = /datum/outfit/banditcorpse/ranged/killa

/datum/outfit/banditcorpse/ranged/killa
	name = "Bandit Corpse Killa"
	suit = /obj/item/clothing/suit/armor/vest/sacrificial/slav/pcarrier
	head = /obj/item/clothing/head/helmet/riot/altin/kill


/mob/living/simple_animal/hostile/bandit/tagilla
	maxHealth = 600
	health = 600
	harm_intent_damage = 30
	melee_damage_lower = 30
	melee_damage_upper = 30
	armour_penetration = -10
	icon_state = "tagilla"
	icon_living = "tagilla"
	attack_sound = 'sound/weapons/smash.ogg'
	r_hand = /obj/item/melee/sledgehammer/security
	armor = list(MELEE = 20, BULLET = 75, LASER = 10, ENERGY = 10, BOMB = 50)
	loot = list(/obj/effect/mob_spawn/human/corpse/bandit/tagilla, /obj/item/melee/sledgehammer/security)

/obj/effect/mob_spawn/human/corpse/bandit/tagilla
	outfit = /datum/outfit/banditcorpse/tagilla

/datum/outfit/banditcorpse/tagilla
	name = "Bandit Corpse Tagilla"
	suit = /obj/item/clothing/suit/armor/vest/sacrificial/slav/pcarrier
	head = /obj/item/clothing/head/welding/tagilla

