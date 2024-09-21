/obj/item/disk/design_disk/adv/knight_gear
	name = "Magic Disk of Smithing"
	color = "#6F6F6F"

/obj/item/disk/design_disk/adv/knight_gear/Initialize()
	. = ..()
	var/datum/design/knight_armour/A = new
	var/datum/design/knight_helmet/H = new
	blueprints[1] = A
	blueprints[2] = H

/datum/design/knight_armour
	name = "Heavy Plate Armour"
	desc = "A royal knight's favorite garments. Can be trimmed by any friendly person."
	id = "knight_armour"
	build_type = AUTOLATHE
	materials = list(MAT_CATEGORY_RIGID = 10000)
	build_path = /obj/item/clothing/suit/armor/riot/knight/greyscale
	category = list("Imported")

/obj/item/clothing/suit/armor/riot/knight/greyscale
	name = "heavy plate armour"
	desc = "A suit of magical plate armour, able to be made from many different materials. The thick armor is far lighter than it otherwise would be."
	icon_state = "riot_knight_greyscale"
	item_state = "riot_knight_greyscale"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	material_flags = MATERIAL_ADD_PREFIX | MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS//Can change color and add prefix
	armor = list(MELEE = 50, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 30, BIO = 10, RAD = 10, FIRE = 40, ACID = 40, WOUND = 10)

/datum/design/knight_helmet
	name = "Heavy Plate Helmet"
	desc = "A royal knight's favorite hat. If you hold it upside down it's actually a bucket."
	id = "knight_helmet"
	build_type = AUTOLATHE
	materials = list(MAT_CATEGORY_RIGID = 5000)
	build_path = /obj/item/clothing/head/helmet/knight/greyscale
	category = list("Imported")

/obj/item/clothing/head/helmet/knight/greyscale
	name = "heavy plate helmet"
	desc = "A classic medieval helmet, if you hold it upside down you could see that it's actually a bucket."
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "knight_greyscale"
	item_state = "knight_greyscale"
	armor = list(MELEE = 50, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 30, BIO = 10, RAD = 10, FIRE = 40, ACID = 40, WOUND = 10)
	material_flags = MATERIAL_ADD_PREFIX | MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS //Can change color and add prefix


/obj/item/fireaxe/energy
	slot_flags = ITEM_SLOT_BACK
	worn_icon = 'modular_dripstation/icons/mob/clothing/back.dmi'
//100% original syndicate oc, plz do not steal. More effective against human targets then the typical crusher, with a bit of block chance.
/obj/item/syndie_crusher
	icon = 'icons/obj/weapons/energy.dmi'
	icon_state = "energy-fireaxe0"
	base_icon_state = "energy-fireaxe"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/back.dmi'
	name = "magnetic energy cleaver"
	desc = "Designed by Cybersun Research and Development for resource-gathering operations on hostile worlds. Cybersun Legal Ops would like to stress that you've never seen anything like this before. Ever."
	armour_penetration = 50//nice cut
	force = 0 //You can't hit stuff unless wielded
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	throwforce = 5
	throw_speed = 4
	block_chance = 30
	custom_materials = list(/datum/material/titanium=5000, /datum/material/iron=2075)
	hitsound = 'sound/weapons/blade1.ogg'
	attack_verb = list("sliced", "bisected", "diced", "chopped", "filleted")
	heat = 1800 // It's a FIRE axe
	sharpness = SHARP_NONE
	obj_flags = UNIQUE_RENAME
	light_color = "#fb6767"
	light_system = MOVABLE_LIGHT
	light_range = 3
	light_power = 1
	light_on = FALSE
	custom_price = 7500//a rare syndicate prototype.
	var/list/trophies = list()
	var/charged = TRUE
	var/charge_time = 15
	var/detonation_damage = 20
	var/backstab_bonus = 30
	var/wielded = FALSE // track wielded status on item

/obj/item/syndie_crusher/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, .proc/on_wield)
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, .proc/on_unwield)
	AddComponent(/datum/component/butchering, 60, 150)
	AddComponent(/datum/component/two_handed, force_wielded=35)

/obj/item/syndie_crusher/Destroy()
	QDEL_LIST(trophies)
	return ..()

/// triggered on wield of two handed item
/obj/item/syndie_crusher/proc/on_wield(obj/item/source, mob/user)
	icon_state = "energy-fireaxe1"
	sharpness = SHARP_EDGED
	playsound(user, 'sound/weapons/saberon.ogg', 35, TRUE)
	set_light_on(wielded)

/// triggered on unwield of two handed item
/obj/item/syndie_crusher/proc/on_unwield(obj/item/source, mob/user)
	wielded = FALSE
	sharpness = initial(sharpness)
	icon_state = "energy-fireaxe0"
	playsound(user, 'sound/weapons/saberoff.ogg', 35, TRUE)
	set_light_on(wielded)

/obj/item/syndie_crusher/examine(mob/living/user)
	. = ..()
	. += "<span class='notice'>Induce magnetism in an enemy by striking them with a magnetospheric wave, then hit them in melee to force a waveform collapse for <b>[force + detonation_damage]</b> damage.</span>"
	. += "<span class='notice'>Does <b>[force + detonation_damage + backstab_bonus]</b> damage if the target is backstabbed, instead of <b>[force + detonation_damage]</b>.</span>"
	for(var/t in trophies)
		var/obj/item/crusher_trophy/T = t
		. += "<span class='notice'>It has \a [T] attached, which causes [T.effect_desc()].</span>"

/obj/item/syndie_crusher/attackby(obj/item/I, mob/living/user)
	if(I.tool_behaviour == TOOL_CROWBAR)
		if(LAZYLEN(trophies))
			to_chat(user, "<span class='notice'>You remove [src]'s trophies.</span>")
			I.play_tool_sound(src)
			for(var/t in trophies)
				var/obj/item/crusher_trophy/T = t
				T.remove_from(src, user)
		else
			to_chat(user, "<span class='warning'>There are no trophies on [src].</span>")
	else if(istype(I, /obj/item/crusher_trophy))
		var/obj/item/crusher_trophy/T = I
		T.add_to(src, user)
	else
		return ..()

/obj/item/syndie_crusher/attack(mob/living/target, mob/living/carbon/user)
	if(!wielded)
		to_chat(user, "<span class='warning'>[src] is too heavy to use with one hand! You fumble and drop everything.</span>")
		user.drop_all_held_items()
		return
	var/datum/status_effect/crusher_damage/C = target.has_status_effect(STATUS_EFFECT_CRUSHERDAMAGETRACKING)
	var/target_health = target.health
	..()
	for(var/t in trophies)
		if(!QDELETED(target))
			var/obj/item/crusher_trophy/T = t
			T.on_melee_hit(target, user)
	if(!QDELETED(C) && !QDELETED(target))
		C.total_damage += target_health - target.health //we did some damage, but let's not assume how much we did

/obj/item/syndie_crusher/afterattack(atom/target, mob/living/user, proximity_flag, clickparams)
	. = ..()
	if(!wielded)
		return
	if(!proximity_flag && charged)//Mark a target, or mine a tile.
		var/turf/proj_turf = user.loc
		if(!isturf(proj_turf))
			return
		var/obj/projectile/destabilizer/D = new /obj/projectile/destabilizer(proj_turf)
		for(var/t in trophies)
			var/obj/item/crusher_trophy/T = t
			T.on_projectile_fire(D, user)
		D.preparePixelProjectile(target, user, clickparams)
		D.firer = user
		D.hammer_synced = src
		playsound(user, 'sound/weapons/plasma_cutter.ogg', 100, TRUE)
		D.fire()
		charged = FALSE
		update_appearance(UPDATE_ICON)
		addtimer(CALLBACK(src, .proc/Recharge), charge_time)
		return
	if(proximity_flag && isliving(target))
		var/mob/living/L = target
		var/datum/status_effect/crusher_mark/CM = L.has_status_effect(STATUS_EFFECT_CRUSHERMARK)
		if(!CM || CM.hammer_synced != src || !L.remove_status_effect(STATUS_EFFECT_CRUSHERMARK))
			return
		var/datum/status_effect/crusher_damage/C = L.has_status_effect(STATUS_EFFECT_CRUSHERDAMAGETRACKING)
		var/target_health = L.health
		for(var/t in trophies)
			var/obj/item/crusher_trophy/T = t
			T.on_mark_detonation(target, user)
		if(!QDELETED(L))
			if(!QDELETED(C))
				C.total_damage += target_health - L.health //we did some damage, but let's not assume how much we did
			new /obj/effect/temp_visual/kinetic_blast(get_turf(L))
			var/backstab_dir = get_dir(user, L)
			var/def_check = L.getarmor(type = "bomb")
			if((user.dir & backstab_dir) && (L.dir & backstab_dir))
				if(!QDELETED(C))
					C.total_damage += detonation_damage + backstab_bonus //cheat a little and add the total before killing it, so certain mobs don't have much lower chances of giving an item
				L.apply_damage(detonation_damage + backstab_bonus, BRUTE, blocked = def_check)
				playsound(user, 'sound/weapons/kenetic_accel.ogg', 100, TRUE) //Seriously who spelled it wrong
			else
				if(!QDELETED(C))
					C.total_damage += detonation_damage
				L.apply_damage(detonation_damage, BRUTE, blocked = def_check)

/obj/item/syndie_crusher/proc/Recharge()
	if(!charged)
		charged = TRUE
		update_appearance(UPDATE_ICON)
		playsound(src.loc, 'sound/weapons/kenetic_reload.ogg', 60, TRUE)

/obj/item/syndie_crusher/ui_action_click(mob/user, actiontype)
	set_light_on(!light_on)
	playsound(user, 'sound/weapons/empty.ogg', 100, TRUE)
	update_appearance(UPDATE_ICON)

/obj/item/kinetic_crusher/update_icon_state()
	. = ..()
	item_state = "[base_icon_state][HAS_TRAIT(src, TRAIT_WIELDED)]" // this is not icon_state and not supported by 2hcomponent




/obj/item/borg/upgrade/transform/saboteur
	name = "unknown cyborg module"
	desc = "A module picking system, capable of using stored matter to build itself out into a fresh cyborg configuration. This one has no serial number, and no identifying marks."
	new_module = /obj/item/robot_module/saboteur

/obj/item/borg/upgrade/transform/syndicate_medical
	name = "unknown cyborg module"
	desc = "A module picking system, capable of using stored matter to build itself out into a fresh cyborg configuration. This one has no serial number, and no identifying marks."
	new_module = /obj/item/robot_module/syndicate_medical

/obj/item/borg/upgrade/transform/assault
	name = "unknown cyborg module"
	desc = "A module picking system, capable of using stored matter to build itself out into a fresh cyborg configuration. This one has no serial number, and no identifying marks."
	new_module = /obj/item/robot_module/syndicate

/obj/effect/mob_spawn/human/corpse/terragov/infantry
	name = "TerraGov Infantryman"
	id_job = "TerraGov Infantryman"
	outfit = /datum/outfit/terragov/infantrymancorpse
	id_access_list = list(ACCESS_TERRAGOV)
	hair_style = "Buzzcut"
	facial_hair_style = "Shaved"

/datum/outfit/terragov/infantrymancorpse
	name = "TGV Infantry Corpse"
	uniform = /obj/item/clothing/under/syndicate/camo
	suit = /obj/item/clothing/suit/armor/vest/light_tgarmy
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/grey
	ears = /obj/item/radio/headset
	suit_store = null
	mask = /obj/item/clothing/mask/gas/bio
	head = /obj/item/clothing/head/helmet/terragov
	back = /obj/item/storage/backpack/unknown
	id = /obj/item/card/id/idtags
	backpack_contents = null

/obj/effect/mob_spawn/human/corpse/terragov/officer
	name = "TerraGov Officer"
	id_job = "TerraGov Military Officer"
	outfit = /datum/outfit/terragov/officercorpse
	id_access_list = list(ACCESS_HEADS, ACCESS_TERRAGOV)
	hair_style = "Buzzcut"
	facial_hair_style = "Shaved"

/datum/outfit/terragov/officercorpse
	name = "TGV Officer Corpse"
	uniform = /obj/item/clothing/under/syndicate/camo
	suit = /obj/item/clothing/suit/armor/vest/light_tgarmy
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset
	suit_store = null
	mask = /obj/item/clothing/mask/gas/bio
	head = /obj/item/clothing/head/helmet/terragov
	back = /obj/item/storage/backpack/satchel/unknown
	id = /obj/item/card/id/idtags
	backpack_contents = null

/obj/effect/spawner/lootdrop/stockparts
	name = "random good stock parts"
	lootcount = 6
	loot = list(
				/obj/item/stock_parts/capacitor/adv,
				/obj/item/stock_parts/capacitor/quadratic,
				/obj/item/stock_parts/capacitor/super,
				/obj/item/stock_parts/cell/hyper,
				/obj/item/stock_parts/cell/super,
				/obj/item/stock_parts/cell/bluespace,
				/obj/item/stock_parts/matter_bin/bluespace,
				/obj/item/stock_parts/matter_bin/super,
				/obj/item/stock_parts/matter_bin/adv,
				/obj/item/stock_parts/micro_laser/ultra,
				/obj/item/stock_parts/micro_laser/quadultra,
				/obj/item/stock_parts/micro_laser/high,
				/obj/item/stock_parts/scanning_module/triphasic,
				/obj/item/stock_parts/scanning_module/phasic,
				/obj/item/stock_parts/scanning_module/adv,
				/obj/item/reagent_containers/glass/beaker/bluespace,
				/obj/item/reagent_containers/glass/beaker/plastic,
				/obj/item/reagent_containers/glass/beaker/large,
				/obj/item/stock_parts/manipulator/nano,
				/obj/item/stock_parts/manipulator/pico,
				/obj/item/stock_parts/manipulator/femto
				)


/obj/item/stack/sheet/mineral/adamantine/twenty
	amount = 20
/obj/item/stack/sheet/mineral/adamantine/ten
	amount = 10
/obj/item/stack/sheet/runed_metal/twenty
	amount = 20
/obj/item/stack/sheet/runed_metal/ten
	amount = 10
/obj/item/stack/sheet/mineral/mythril/twenty
	amount = 20
/obj/item/stack/sheet/mineral/mythril/ten
	amount = 10
/obj/item/stack/sheet/mineral/silver/twenty
	amount = 20
/obj/item/stack/sheet/mineral/titanium/twenty
	amount = 20
/obj/item/stack/sheet/mineral/gold/twenty
	amount = 20

/obj/item/book/granter/action/spell/shapechange
	granted_action = /datum/action/cooldown/spell/shapeshift/wizard
	action_name = "shapechange"
	icon_state ="bookshapechange"
	desc = "Half of the book is slash fiction about some kind of young adult novel."
	remarks = list("There's a beast inside all of us.	", "What's an animorph?", "There are rats in the walls.", "This could be worse than useless, or amazing...", "Hide in the fields, run through the forest...", "The pages feel a little furry.", "Can you hear the jungle rhythm?")

/obj/item/book/granter/action/spell/shapechange/recoil(mob/living/carbon/user)
	..()
	to_chat(user,"<span class='warning'>You're feeling a little primitive...</span>")
	user.Stun(40, ignore_canstun = TRUE)
	user.monkeyize(TR_KEEPITEMS | TR_KEEPIMPLANTS | TR_KEEPORGANS | TR_KEEPDAMAGE | TR_KEEPVIRUS | TR_KEEPSTUNS | TR_KEEPREAGENTS | TR_KEEPSE)

/obj/item/book/granter/action/spell/traps
	granted_action = /datum/action/cooldown/spell/conjure/the_traps
	action_name = "the traps"
	icon_state ="booktraps"
	desc = "A book that uses euphemisms about being a Dungeon Master to teach aspiring wizards how to cast Summon Traps."
	remarks = list("Traps work best in unexpected situations...", "Where the hell am I supposed to get boiling acid?", "Works best in enclosed spaces...", "Could I use this at point-blank to keep someone from running?", "It's been a trap all along...", "The pages feel like they could snap shut unexpectedly.", "You feel a sense of impending danger.")

/obj/item/book/granter/action/spell/traps/recoil(mob/living/user)
	..()
	to_chat(user, "<span class='danger'><B>The ground shifts beneath your feet!</B></span>")
	user.Paralyze(100)
	user.adjustBruteLoss(35)

//ice cube
/obj/item/freeze_cube
	name = "freeze cube"
	desc = "A block of semi-clear ice, enchanted by an ancient wizard to keep his drinks cold forever. \
		Unfortunately, it appears to be malfunctioning, and now encases those it impacts with a cube of frost."
	icon = 'modular_dripstation/icons/obj/artefacts.dmi'
	icon_state = "freeze_cube"
	throwforce = 10
	damtype = BURN
	var/cooldown_time = 5 SECONDS
	COOLDOWN_DECLARE(freeze_cooldown)
	throw_speed = 1

/obj/item/freeze_cube/examine(mob/user)
	. = ..()
	. += ("<span class= 'danger'>Throw this at objects or creatures to freeze them, it will boomerang back so be cautious!</span>")

/obj/item/freeze_cube/throw_at(atom/target, range, speed, mob/thrower, spin=1, diagonals_first = 0, datum/callback/callback, quickstart = TRUE)
	. = ..()
	if(!.)
		return
	icon_state = "freeze_cube_thrown"
	addtimer(VARSET_CALLBACK(src, icon_state, initial(icon_state)), 1 SECONDS)

/obj/item/freeze_cube/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	icon_state = initial(icon_state)
	var/caught = hit_atom.hitby(src, FALSE, FALSE, throwingdatum=throwingdatum)
	var/mob/thrown_by = thrownby
	if(ismovable(hit_atom) && !caught && (!thrown_by || thrown_by && COOLDOWN_FINISHED(src, freeze_cooldown)))
		freeze(hit_atom)
	if(thrown_by && !caught)
		addtimer(CALLBACK(src, /atom/movable.proc/throw_at, thrown_by, throw_range+2, throw_speed, null, TRUE), 1)

/obj/item/freeze_cube/freeze(atom/movable/hit_atom)
	playsound(src, 'sound/effects/glassbr3.ogg', 50, TRUE)
	COOLDOWN_START(src, freeze_cooldown, cooldown_time)
	if(isobj(hit_atom))
		var/obj/hit_object = hit_atom
		if(hit_object.resistance_flags & FREEZE_PROOF)
			hit_object.visible_message("<span class='warning'>[hit_object] is freeze-proof! </span>")
			return
		if(!(hit_object.obj_flags & FROZEN))
			hit_object.make_frozen_visual()
	else if(isliving(hit_atom))
		var/mob/living/hit_mob = hit_atom
		walk(hit_mob, 0) //stops them mid pathing even if they're stunimmune
		hit_mob.apply_status_effect(/datum/status_effect/ice_block_talisman, 5 SECONDS)

/obj/item/research_notes/loot
	origin_type = "exotic particles phisics"

/obj/item/research_notes/loot/tiny
	points = 1000

/obj/item/research_notes/loot/small
	points = 4000

/obj/item/research_notes/loot/medium
	points = 8000

/obj/item/research_notes/loot/big
	points = 15000

/obj/item/research_notes/loot/genius
	points = 30000

// Gatfruit
/obj/item/seeds/gatfruit
	name = "pack of gatfruit seeds"
	desc = "These seeds grow into .357 revolvers."
	icon_state = "seed-gatfruit"
	species = "gatfruit"
	plantname = "Gatfruit Tree"
	product = /obj/item/reagent_containers/food/snacks/grown/shell/gatfruit
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	lifespan = 20
	endurance = 20
	maturation = 40
	production = 10
	yield = 2
	potency = 60
	growthstages = 2
	rarity = 60 // Obtainable only with xenobio+superluck.
	growing_icon = 'icons/obj/hydroponics/growing_fruits.dmi'
	reagents_add = list(/datum/reagent/nitroglycerin = 0.1, /datum/reagent/carbon = 0.1, /datum/reagent/nitrogen = 0.07, /datum/reagent/potassium = 0.05)

/obj/item/reagent_containers/food/snacks/grown/shell/gatfruit
	seed = /obj/item/seeds/gatfruit
	name = "gatfruit"
	desc = "It smells like burning."
	icon_state = "gatfruit"
	trash = /obj/item/gun/ballistic/revolver
	bitesize_mod = 2
	foodtype = FRUIT
	tastes = list("gunpowder" = 1)
	wine_power = 90 //It burns going down, too.

/obj/structure/fluff/iced_abductor ///Unless more non-machine ayy structures made, it will stay in fluff.
	name = "Mysterious Block of Ice"
	desc = "A shadowy figure lies in this sturdy-looking block of ice. Who knows where it came from?"
	icon = 'icons/effects/freeze.dmi'
	icon_state =  "ice_ayy"
	density = TRUE
	deconstructible = FALSE

/obj/structure/fluff/iced_abductor/Destroy()
	var/turf/T = get_turf(src)
	new /obj/effect/mob_spawn/human/abductor(T)
	. = ..()

/obj/item/clothing/gloves/butchering
	name = "butchering gloves"
	desc = "These gloves allow the user to rip apart bodies with precision and ease."
	icon_state = "black"
	item_state = "blackgloves"
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT

/obj/item/clothing/gloves/butchering/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 5, 125, null, null, TRUE, TRUE)

/obj/item/clothing/gloves/butchering/equipped(mob/user, slot, initial = FALSE)
	. = ..()
	RegisterSignal(user, COMSIG_HUMAN_EARLY_UNARMED_ATTACK, .proc/butcher_target)
	var/datum/component/butchering/butchering = src.GetComponent(/datum/component/butchering)
	butchering.butchering_enabled = TRUE

/obj/item/clothing/gloves/butchering/dropped(mob/user, silent = FALSE)
	. = ..()
	UnregisterSignal(user, COMSIG_HUMAN_EARLY_UNARMED_ATTACK)
	var/datum/component/butchering/butchering = src.GetComponent(/datum/component/butchering)
	butchering.butchering_enabled = FALSE

/obj/item/clothing/gloves/butchering/proc/butcher_target(mob/user, atom/target, proximity)
	if(!isliving(target))
		return
	return SEND_SIGNAL(src, COMSIG_ITEM_ATTACK, target, user)