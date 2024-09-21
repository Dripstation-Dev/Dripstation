////Spacepol Faction////
/obj/item/clothing/under/rank/security/spacepol
	name = "Terran police uniform"
	desc = "Space not controlled by megacorporations, anarchists or PMC`s is under the jurisdiction of Terragovpol."
	icon_state = "terragovpol_uni"
	item_state = "spacepol"
	can_adjust = TRUE
	mutantrace_variation = NONE
	icon = 'modular_dripstation/icons/obj/clothing/uniform/terragov/terragov.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/terragov/terragov.dmi'

/obj/item/clothing/under/rank/security/spacepol/formal
	name = "Terran police official uniform"
	desc = "You are The Law official. Show them it`s true nature."

/obj/item/clothing/under/rank/security/spacepol/camo
	name = "Terran police camo uniform"
	desc = "Enforce the Law. Spess them all if not."


////Marine Faction////
/obj/item/clothing/under/rank/security/terramarine
	name = "Terran marine jumpsuit"
	desc = "Be proud and loud about your uniform, son."
	icon_state = "marine_jumpsuit"
	item_state = "marine"
	can_adjust = TRUE
	mutantrace_variation = NONE
	icon = 'modular_dripstation/icons/obj/clothing/uniform/terragov/terragov.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/terragov/terragov.dmi'

////Terragov Army////
/obj/item/clothing/under/syndicate/camo
	name = "camouflage fatigues"
	desc = "A desert military camouflage uniform."
	icon_state = "terragov_multicam"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/terragov/terragov.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/terragov/terragov.dmi'

/obj/item/clothing/suit/armor/vest/light_tgarmy
	name = "light TerraGov army flack vest"
	desc = "A desert military camouflage armor."
	icon_state = "light-army-armor"
	body_parts_covered = CHEST|GROIN|LEGS
	armor = list(MELEE = 20, BULLET = 45, LASER = 10, ENERGY = 15, BOMB = 55, BIO = 0, RAD = 0, FIRE = 0, ACID = 0, WOUND = 10)

/obj/item/clothing/head/helmet/terragov
	name = "light TerraGov helmet"
	desc = "Standart issue blue and black helmet."
	icon_state = "helmet_terragov"
