/obj/effect/spawner/lootdrop/armory_dripstation
	name = "armory random weapon spawner"
	lootdoubles = FALSE
	lootcount = 1

	loot = list(/obj/effect/spawner/bundle/ancile_pistol = 2,
				/obj/effect/spawner/bundle/e_gun_mini = 2,
				/obj/effect/spawner/bundle/sa450 = 2,
				/obj/item/gun/energy/e_gun/stun/mindshield = 2,
				/obj/item/gun/energy/laser/hellgun = 2,
				/obj/item/gun/ballistic/shotgun/automatic/combat = 1,
				/obj/item/gun/ballistic/shotgun/automatic = 1,
				/obj/effect/spawner/bundle/remington = 1,
				/obj/effect/spawner/bundle/m10mm = 1,
				/obj/effect/spawner/bundle/m1911 = 1,
				/obj/effect/spawner/bundle/m1911alt = 1,
				/obj/effect/spawner/bundle/m1911signature = 1,
				/obj/effect/spawner/bundle/APS = 1,
				/obj/effect/spawner/bundle/shelg = 1,
				/obj/effect/spawner/bundle/mk4 = 1,
				//obj/item/gun/energy/laser/cybersun = 1,
				//obj/item/gun/energy/plasmarifle/unsecure = 1,
				/obj/effect/spawner/bundle/mateba = 1,
				/obj/effect/spawner/bundle/p90 = 1,
				)	// 1-2/22

/obj/effect/spawner/bundle/ancile_pistol
	name = "ancile pistol spawner"
	items = list(
		/obj/item/gun/ballistic/automatic/pistol/glock17/ancile,
		/obj/item/ammo_box/magazine/pistolm9mm/pmag,
		/obj/item/storage/box/syndie_kit/throwing_weapons)

/obj/effect/spawner/bundle/e_gun_mini
	name = "mini egun spawner"
	items = list(
		/obj/item/gun/energy/e_gun/mini/secure,
		/obj/item/storage/box/syndie_kit/throwing_weapons)

/obj/effect/spawner/bundle/sa450
	name = "sa450 spawner"
	items = list(
		/obj/item/gun/ballistic/automatic/sa450,
		/obj/item/ammo_box/magazine/sa450,
		/obj/item/ammo_box/magazine/sa450)

/obj/effect/spawner/bundle/remington
	name = "remington spawner"
	items = list(
		/obj/item/gun/ballistic/shotgun/riot/remington,
		/obj/item/storage/box/syndie_kit/throwing_weapons)

/obj/effect/spawner/bundle/m10mm
	name = "10mm pistol spawner"
	items = list(
		/obj/item/gun/ballistic/automatic/pistol/protector,
		/obj/item/ammo_box/magazine/m10mm,
		/obj/item/storage/box/syndie_kit/throwing_weapons)

/obj/effect/spawner/bundle/m1911
	name = "m1911 pistol spawner"
	items = list(
		/obj/item/gun/ballistic/automatic/pistol/m1911,
		/obj/item/ammo_box/magazine/m45)

/obj/effect/spawner/bundle/m1911alt
	name = "m1911 alt pistol spawner"
	items = list(
		/obj/item/gun/ballistic/automatic/pistol/m1911/alt,
		/obj/item/ammo_box/magazine/m45)

/obj/effect/spawner/bundle/m1911signature
	name = "m1911 signature pistol spawner"
	items = list(
		/obj/item/gun/ballistic/automatic/pistol/m1911/signature,
		/obj/item/ammo_box/magazine/m45)

/obj/effect/spawner/bundle/APS
	name = "APS pistol spawner"
	items = list(
		/obj/item/gun/ballistic/automatic/pistol/APS,
		/obj/item/ammo_box/magazine/pistolm9mm)

/obj/effect/spawner/bundle/shelg
	name = "shelg pistol spawner"
	items = list(
		/obj/item/gun/ballistic/automatic/pistol/glock18/shelg,
		/obj/item/ammo_box/magazine/pistolm9mm/pmag)

/obj/effect/spawner/bundle/mateba
	name = "mateba revolver spawner"
	items = list(
		/obj/item/gun/ballistic/revolver/mateba,
		/obj/item/ammo_box/m44,
		/obj/item/ammo_box/m44)

/obj/effect/spawner/bundle/p90
	name = "p90 spawner"
	items = list(
		/obj/item/gun/ballistic/automatic/p90,
		/obj/item/ammo_box/magazine/m556)

/obj/effect/spawner/bundle/mk4
	name = "mk4 spawner"
	items = list(
		/obj/item/gun/ballistic/automatic/ar/mk4/semiauto,
		/obj/item/ammo_box/magazine/r556)

/obj/effect/spawner/lootdrop/maint_fauna
	name = "maint fauna spawner"
	icon = 'modular_dripstation/icons/effects/random_spawners.dmi'
	icon_state = "fauna"
	spawn_loot_chance = 70
	loot = list(
		/mob/living/simple_animal/mouse = 115,
		/mob/living/simple_animal/cockroach = 40,
		/mob/living/simple_animal/hostile/retaliate/frog = 20,
		/mob/living/simple_animal/hostile/lizard = 10,
		/mob/living/simple_animal/hostile/retaliate/poison/snake/novenom = 7,
		/mob/living/simple_animal/hostile/retaliate/poison/snake = 5,
		/mob/living/simple_animal/hostile/glockroach = 1,
		/mob/living/simple_animal/hostile/mimic = 1,
		/obj/item/clothing/mask/facehugger = 1,
	)

/obj/effect/spawner/lootdrop/garbage
	name = "garbage spawner"
	icon_state = "trash"
	icon = 'modular_dripstation/icons/effects/random_spawners.dmi'
	loot = list(
		/obj/effect/spawner/lootdrop/trashbin = 20,
		/obj/item/trash/can = 15,
		/obj/item/shard = 10,
		/obj/item/reagent_containers/glass = 5,
		/obj/item/broken_bottle = 5,
		/obj/item/reagent_containers/glass/bowl = 5,
		/obj/item/light/tube/broken = 5,
		/obj/item/light/bulb/broken = 5,
		/obj/item/assembly/mousetrap/armed = 5,
		/obj/item/stack/cable_coil = 5,
		/obj/item/reagent_containers/food/snacks/deadmouse = 1,
		/obj/item/trash/candle = 1,
		/obj/item/reagent_containers/syringe = 1,
		/obj/item/reagent_containers/food/drinks/sillycup = 1,
		/obj/item/shard/plasma = 1,
	)

/obj/effect/spawner/lootdrop/crate_empty
	name = "empty crate spawner"
	icon = 'modular_dripstation/icons/effects/random_spawners.dmi'
	icon_state = "crate"
	loot = list(
		/obj/structure/closet/crate = 20,
		/obj/structure/closet/crate/wooden = 1,
		/obj/structure/closet/crate/internals = 1,
		/obj/structure/closet/crate/medical = 1,
		/obj/structure/closet/crate/freezer = 1,
		/obj/structure/closet/crate/radiation = 1,
		/obj/structure/closet/crate/hydroponics = 1,
		/obj/structure/closet/crate/engineering = 1,
		/obj/structure/closet/crate/engineering/electrical = 1,
		/obj/structure/closet/crate/science = 1,
	)

/obj/effect/spawner/lootdrop/grille
	name = "grille spawner"
	icon = 'modular_dripstation/icons/effects/random_spawners.dmi'
	icon_state = "grille"
	spawn_loot_chance = 90
	loot = list(
		/obj/structure/grille = 8,
		/obj/structure/grille/broken = 1,
	)

/obj/effect/spawner/lootdrop/anomaly
	name = "anomaly spawner"
	icon = 'modular_dripstation/icons/effects/random_spawners.dmi'
	icon_state = "anomaly"
	spawn_loot_chance = 10
	loot = list(
		/obj/structure/anomalies_diet/haze = 1,
		/obj/structure/anomalies_diet/spidersilk/non_spreader = 1,
		/obj/structure/anomalies_diet/ball_lightning = 1,
		/obj/structure/anomalies_diet/hell = 1,
		/obj/structure/spawner/nether = 1
	)

/obj/effect/spawner/lootdrop/graffiti
	name = "random graffiti spawner"
	icon_state = "rune"
	spawn_loot_chance = 60
	icon = 'modular_dripstation/icons/effects/random_spawners.dmi'
	loot = list(/obj/effect/decal/cleanable/crayon)

	var/graffiti_icons = list("amyjon","face","matt","revolution","engie","guy","end","dwarf","uboa",
		"body","cyka","star","poseur tag","prolizard","antilizard", "danger","firedanger","electricdanger",
		"biohazard","radiation","safe","evac","space","med","trade","shop","food","peace","like","skull",
		"nay","heart","credit", "smallbrush","brush","largebrush","splatter","snake","stickman","carp","ghost",
		"clown","taser","disk","fireaxe","toolbox","corgi","cat","toilet","blueprint","beepsky","scroll","bottle",
		"shotgun", "arrow","line","thinline","shortline","body","chevron","footprint","clawprint","pawprint", 
		"rune1","rune2","rune3","rune4","rune5","rune6")
	color = COLOR_WHITE //sets the color of the graffiti (used for mapedits)
	var/random_color = TRUE //whether the graffiti will spawn with a random color (used for mapedits)
	var/random_icon = TRUE // whether the graffiti will spawn with the same icon

/obj/effect/spawner/lootdrop/graffiti/proc/select_graffiti(graffiti_decal)
	var/obj/effect/decal/cleanable/crayon/decal = graffiti_decal
	color = random_color && "#[random_short_color()]" || color
	icon_state = random_icon && pick(graffiti_icons) || icon_state

	decal.add_atom_colour(color, FIXED_COLOUR_PRIORITY)
	decal.icon_state = icon_state

/obj/effect/spawner/lootdrop/random_anomaly_core
	name = "anomaly core spawner"

/obj/effect/spawner/lootdrop/random_anomaly_core/Initialize(mapload)
	var/item = pick(typesof(/obj/item/assembly/signaler/anomaly))
	new item(loc)
	return INITIALIZE_HINT_QDEL


/obj/effect/spawner/lootdrop/random_meat
	name = "meat loot spawner"

/obj/effect/spawner/lootdrop/random_meat/Initialize(mapload)
	var/item = pick(typesof(/obj/item/reagent_containers/food/snacks/meat/slab))
	new item(loc)
	return INITIALIZE_HINT_QDEL

/obj/effect/spawner/lootdrop/backrooms
	name = "backrooms trap spawner"
	icon = 'modular_dripstation/icons/turf/floors.dmi'
	icon_state = "backrooms_observer"
	loot = list(
		/obj/structure/anomalies_diet/backrooms = 1,
	)

/obj/effect/spawner/lootdrop/backrooms/twenty
	name = "20% backrooms trap spawner"
	spawn_loot_chance = 20

/obj/effect/spawner/lootdrop/minor/maidoutfit
	name = "maid outfit spawner"
	loot = list(
		/obj/item/clothing/under/syndicate/donk/maid = 15,
		/obj/item/clothing/under/lewdmaid = 15,
		/obj/item/clothing/under/rank/civilian/janitor/maid = 15,
		/obj/item/clothing/under/maid = 15,
		/obj/item/clothing/under/wench = 15,
		"" = 25)

/obj/effect/spawner/lootdrop/minor/tacticool
	name = "tacticool outfit spawner"
	loot = list(
		/obj/item/clothing/under/hephaestus/militech/turtle = 5,
		/obj/item/clothing/under/blackops = 15,
		/obj/item/clothing/under/syndicate/tacticool/bandit = 15,
		/obj/item/clothing/under/syndicate/tacticool/ert = 15,
		/obj/item/clothing/under/freemerk = 15,
		/obj/item/clothing/under/syndicate/soviet = 10,
		/obj/item/clothing/under/syndicate/tacticool = 25)

