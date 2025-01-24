//Meant for simple animals to drop lootable human bodies.

//If someone can do this in a neater way, be my guest-Kor

//This has to be separate from the Away Mission corpses, because New() doesn't work for those, and Initialize(mapload) doesn't work for these.

//To do: Allow corpses to appear mangled, bloody, etc. Allow customizing the bodies appearance (they're all bald and white right now).

//List of different corpse types

/obj/effect/mob_spawn/human/corpse/securitycorpse
	name = "Security Officer"
	id_job = "Security Force"
	id_access = "Security Officer"
	outfit = /datum/outfit/securitycorpse

/datum/outfit/securitycorpse
	name = "Security Officer Corpse"
	uniform = /obj/item/clothing/under/rank/security
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black/tactifool
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/sechailer
	back = /obj/item/storage/backpack/security
	id = /obj/item/card/id

/datum/outfit/securitycorpse/jackbootless
	shoes = null