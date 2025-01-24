/obj/effect/mob_spawn/human/prisoner_transport
	icon_state = "cryopod"
	
/obj/effect/mob_spawn/human/hotel_staff
	icon_state = "cryopod"

/obj/effect/mob_spawn/human/syndicate
	icon = 'modular_dripstation/icons/obj/machines/sleeper.dmi'
	icon_state = "cryo_s"

/obj/effect/mob_spawn/human/lavaland_syndicate
	icon = 'modular_dripstation/icons/obj/machines/sleeper.dmi'
	icon_state = "cryo_s"

/obj/effect/mob_spawn/human/syndicate_derelict_engineer
	icon = 'modular_dripstation/icons/obj/machines/sleeper.dmi'
	icon_state = "cryo_s"

/obj/effect/mob_spawn/human/orion_security
	icon = 'modular_dripstation/icons/obj/machines/sleeper.dmi'
	icon_state = "cryo_terra"

/obj/effect/landmark/lost_syndicate_ghost_spawn //spawn a syndicate ghost role to survive
	name = "lost syndicate ghost role spawner"

/obj/effect/landmark/lost_syndicate_ghost_spawn/proc/create_roles()
	new /obj/effect/mob_spawn/human/lost_syndicate(get_turf(loc))
	var/datum/effect_system/spark_spread/spark_system = new /datum/effect_system/spark_spread
	spark_system.start()
	playsound(loc, "sparks", 50, 1)
	qdel(src) //no spawning people twice

/obj/effect/mob_spawn/human/lost_syndicate
	icon = 'modular_dripstation/icons/obj/machines/sleeper.dmi'
	icon_state = "cryo_s"
	name = "old cryogenics pod"
	desc = "A sleeper designed to put its occupant into a deep coma."
	short_desc = "You are a Syndicate Operative."
	flavour_text = "You are a nuclear agent! Your objective is- wait where the hell are you? This isn't the base, so where are you?"
	important_info = "Survive as long as you can, assisting syndicate cause."
	assignedrole = "Lost Syndicate"
	outfit = /datum/outfit/syndicate/lost

/datum/outfit/syndicate/lost
	name = "Syndicate Operative - Lost"
	mask = /obj/item/clothing/mask/gas/syndicate
	box = /obj/item/storage/box/survival/syndie
	suit_store = /obj/item/tank/internals/oxygen
	r_pocket = /obj/item/tank/internals/emergency_oxygen/engi
	internals_slot = ITEM_SLOT_RPOCKET
	tc = 0
	uplink_type = null

/datum/outfit/syndicate/lost/post_equip(mob/living/carbon/human/H)
	..()
	var/obj/item/implant/uplink/iu = new(H)
	iu.starting_tc = 10
	iu.implant(H)

/datum/outfit/syndicate_empty/icemoon_base
	back = /obj/item/storage/backpack/unknown
	ears = /obj/item/radio/headset/syndicate/obv

/obj/effect/mob_spawn/human/syndicate/icemoon_syndicate/security
	short_desc = "You are a Gorlex Security operative at the Syndicate icemoon outpost."

/datum/outfit/syndicate_empty/icemoon_base/security
	mask = /obj/item/clothing/mask/gas/syndicate
	suit = /obj/item/clothing/suit/armor/vest/sacrificial
	head = /obj/item/clothing/head/helmet/alt/gorlex
	gloves = /obj/item/clothing/gloves/combat/gorlex
	l_pocket = /obj/item/kitchen/knife/combat/survival
	r_hand = null
	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/gorlex/security
	belt = /obj/item/storage/belt/military/webbing/gorlex_secutity
	back = /obj/item/storage/backpack/syndie
	box = /obj/item/storage/box/syndie/nuke	//box for syndicate`s MODERN COMBAT personel
	suit_store = /obj/item/gun/ballistic/automatic/ar/waffle //obj/item/gun/ballistic/automatic/c20r/cobra/ultrasecure
	backpack_contents = list(/obj/item/gun/ballistic/automatic/pistol/fn45 = 1,\
		/obj/item/flashlight/glowstick = 1)
	implants = list(/obj/item/implant/weapons_auth, /obj/item/implant/teleporter/syndicate_icemoon, /obj/item/implant/mindshield/tot_obvious)

/datum/outfit/syndicate_empty/icemoon_base/scientist
	back = /obj/item/storage/backpack/unknown
	r_hand = null //the fuck?
	uniform = /obj/item/clothing/under/syndicate/cybersun	//just clerk
	suit = /obj/item/clothing/suit/toggle/labcoat/syndicate/long
	glasses = /obj/item/clothing/glasses/hud/diagnostic/military //and so?

/datum/outfit/syndicate_empty/icemoon_base/engineer //GEC guy
	suit = /obj/item/clothing/suit/hazardvest
	head = /obj/item/clothing/head/hardhat/weldhat/orange
	shoes = /obj/item/clothing/shoes/workboots
	uniform = /obj/item/clothing/under/syndicate/tacticool/atmos
	back = /obj/item/storage/backpack/unknown
	glasses = /obj/item/clothing/glasses/meson //why should?

/datum/outfit/syndicate_empty/icemoon_base/medic
	back = /obj/item/storage/backpack/unknown
	uniform = /obj/item/clothing/under/syndicate/cybersun/med
	glasses = /obj/item/clothing/glasses/hud/health/military //ok, no

/datum/outfit/syndicate_empty/icemoon_base/captain
	box = /obj/item/storage/box/syndie/nuke	//box for syndicate`s MODERN COMBAT personel
	belt = /obj/item/storage/belt/sabre/syndie	//real syndi sabre, not shitty eswords
	l_pocket = null	//sword somewhere else
	implants = list(/obj/item/implant/weapons_auth, /obj/item/implant/teleporter/syndicate_icemoon, /obj/item/implant/mindshield/tot_obvious)
