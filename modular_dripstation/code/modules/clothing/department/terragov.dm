////Spacepol Faction////
/obj/item/clothing/under/rank/security/spacepol
	name = "terragov police uniform"
	desc = "Space not controlled by megacorporations, anarchists or PMC`s is under the jurisdiction of Terragovpol."
	icon_state = "terragovpol_uni"
	item_state = "spacepol"
	can_adjust = TRUE
	mutantrace_variation = NONE
	icon = 'modular_dripstation/icons/obj/clothing/uniform/terragov/terragov.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/terragov/terragov.dmi'

/obj/item/clothing/under/rank/security/spacepol/formal
	name = "terragov police official uniform"
	desc = "You are The Law official. Show them it`s true nature."
	icon_state = "terragov_fancy"

/obj/item/clothing/under/rank/security/spacepol/camo
	name = "terragov police camo uniform"
	desc = "Enforce the Law. Spess them all if not."
	icon_state = "terragovpol_camo"
	can_adjust = FALSE

/obj/item/clothing/head/helmet/riot/spacepol
	name = "terragov police riot helmet"

/obj/item/clothing/mask/sec_clava/terrapol
	name = "terragov police balaclava"
	desc = "Terrapol standart issue balaclava."

/obj/item/clothing/head/warden/drill/marshal
	name = "marshal's campaign hat"
	desc = "A special armored campaign hat with the marshal`s insignia emblazoned on it. Uses reinforced fabric to offer sufficient protection."
	icon_state = "marshal"

////Marine Faction////
/obj/item/clothing/under/terramarine
	name = "terragov marine jumpsuit"
	desc = "Be proud and loud about your uniform, son."
	icon_state = "marine_jumpsuit"
	item_state = "marine"
	can_adjust = TRUE
	mutantrace_variation = NONE
	armor = list(MELEE = 10, BULLET = 0, LASER = 10, ENERGY = 15, BOMB = 0, BIO = 0, RAD = 0, FIRE = 0, ACID = 0, WOUND = 0)
	icon = 'modular_dripstation/icons/obj/clothing/uniform/terragov/terragov.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/terragov/terragov.dmi'

/obj/item/clothing/under/terramarine/medic
	name = "terragov marine medic jumpsuit"
	icon_state = "marine_medic"

/obj/item/clothing/under/terramarine/command
	name = "terragov marine squad officer jumpsuit"
	icon_state = "marine_command"

////Terragov Armed Forces////
/obj/item/clothing/under/syndicate/camo
	name = "terragov standart camouflage fatigues"
	desc = "A desert military camouflage uniform."
	icon_state = "terragov_multicam"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/terragov/terragov.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/terragov/terragov.dmi'

/obj/item/clothing/under/syndicate/camo/urban
	name = "terragov urban camouflage fatigues"
	desc = "A urban military camouflage uniform. You can find this on T.G.A.F. soldiers."
	icon_state = "terragov_urban"

/obj/item/clothing/under/syndicate/camo/urban/command
	name = "terragov command urban camouflage fatigues"
	desc = "A urban military camouflage uniform. You can find this on T.G.A.F. command staff."
	icon_state = "terragov_urban_command"

/obj/item/clothing/suit/armor/vest/light_tgarmy
	name = "light T.G.A.F. flack vest"
	desc = "A urban TerraGov Armed Forces armor."
	icon_state = "terragov_urban_light"
	body_parts_covered = CHEST|GROIN
	armor = list(MELEE = 20, BULLET = 45, LASER = 10, ENERGY = 15, BOMB = 55, BIO = 0, RAD = 0, FIRE = 0, ACID = 0, WOUND = 10)

/obj/item/clothing/suit/armor/vest/heavy_tgarmy
	name = "desert T.G.A.F. flack vest"
	desc = "A desert TerraGov Armed Forces armor."
	icon_state = "light-army-armor"
	body_parts_covered = CHEST|GROIN|LEGS
	armor = list(MELEE = 25, BULLET = 50, LASER = 15, ENERGY = 20, BOMB = 60, BIO = 0, RAD = 0, FIRE = 0, ACID = 0, WOUND = 15)

/obj/item/clothing/head/helmet/terragov
	name = "light T.G.A.F. helmet"
	desc = "Standart T.G.A.F. issue blue and black helmet for urban combat."
	icon_state = "helmet_terragov"

/obj/item/clothing/head/helmet/swat/desert_tgaf
	name = "strike T.G.A.F. helmet"
	desc = "An extremely robust helmet issued for T.G.A.F. strike troops."
	icon_state = "helmet_tac"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	visor_flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	dynamic_hair_suffix = ""


///Pizza
/obj/item/clothing/suit/hoodie/pizza
	name = "dogginos hoodie"
	desc = "A hoodie often worn by the delivery boys of this intergalactically known brand of pizza."
	greyscale_colors = "#c40000"

/obj/item/clothing/under/pizza
	name = "dogginos employee uniform"
	desc = "The standard issue for the famous dog-founded pizza brand, Dogginos."
	icon = 'modular_dripstation/icons/obj/clothing/uniform/terragov/terragov.dmi' //Dogginos is not technically affiliated with CC, but it's not OPPOSING it, and its an "ERT"...
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/terragov/terragov.dmi'
	icon_state = "dominos"


////ODST Armors////
/obj/item/clothing/suit/armor/vest/light_odst
	name = "light odst vest"
	desc = "The standard issue armor vest for TerraGov Orbital Drop Ship Troopers."
	armor = list(MELEE = 60, BULLET = 60, LASER = 40, ENERGY = 30, BOMB = 40, BIO = 0, RAD = 0, FIRE = 80, ACID = 80, WOUND = 30)
	body_parts_covered = CHEST|GROIN|LEGS
	body_parts_partial_covered = LEGS
	cold_protection = CHEST|GROIN|LEGS
	heat_protection = CHEST|GROIN|LEGS
	icon_state = "odst_light_trooper"

/obj/item/clothing/suit/armor/vest/light_odst/engineer
	name = "light odst engineer vest"
	desc = "The standard issue armor vest for TerraGov Orbital Drop Ship Troopers. Has engineer markings."
	body_parts_covered = CHEST|GROIN
	body_parts_partial_covered = null
	cold_protection = CHEST|GROIN
	heat_protection = CHEST|GROIN
	icon_state = "odst_light_engineer"
	
/obj/item/clothing/suit/armor/vest/light_odst/medic
	name = "light odst medic vest"
	desc = "The standard issue armor vest for TerraGov Orbital Drop Ship Troopers. Has medic markings."
	body_parts_covered = CHEST|GROIN
	body_parts_partial_covered = null
	cold_protection = CHEST|GROIN
	heat_protection = CHEST|GROIN
	icon_state = "odst_light_medic"
	
/obj/item/clothing/suit/armor/vest/light_odst/command
	name = "light odst command vest"
	desc = "The standard issue armor vest for TerraGov Orbital Drop Ship Troopers. Has command markings."
	body_parts_covered = CHEST|GROIN
	body_parts_partial_covered = null
	cold_protection = CHEST|GROIN
	heat_protection = CHEST|GROIN
	icon_state = "odst_light_command"
	

/obj/item/clothing/suit/armor/vest/medium_odst
	name = "medium odst vest"
	desc = "The standard issue armor vest for TerraGov Orbital Drop Ship Troopers."
	armor = list(MELEE = 60, BULLET = 60, LASER = 40, ENERGY = 30, BOMB = 40, BIO = 0, RAD = 0, FIRE = 80, ACID = 80, WOUND = 30)
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	body_parts_partial_covered = LEGS|ARMS
	cold_protection = CHEST|GROIN|ARMS|LEGS
	heat_protection = CHEST|GROIN|ARMS|LEGS
	icon_state = "odst_medium_trooper"
	
/obj/item/clothing/suit/armor/vest/medium_odst/engineer
	name = "medium odst engineer vest"
	desc = "The standard issue armor vest for TerraGov Orbital Drop Ship Troopers. Has engineer markings."
	icon_state = "odst_medium_engineer"
	
/obj/item/clothing/suit/armor/vest/medium_odst/medic
	name = "medium odst medic vest"
	desc = "The standard issue armor vest for TerraGov Orbital Drop Ship Troopers. Has medic markings."
	icon_state = "odst_medium_medic"
	
/obj/item/clothing/suit/armor/vest/medium_odst/command
	name = "medium odst command vest"
	desc = "The standard issue armor vest for TerraGov Orbital Drop Ship Troopers. Has command markings."
	icon_state = "odst_medium_command"
	

/obj/item/clothing/head/helmet/odst
	name = "odst helmet"
	desc = "The standard issue armored helmet for TerraGov Orbital Drop Ship Troopers."
	armor = list(MELEE = 60, BULLET = 60, LASER = 40, ENERGY = 30, BOMB = 40, BIO = 0, RAD = 0, FIRE = 80, ACID = 80, WOUND = 30)
	clothing_traits = list(TRAIT_HEAD_INJURY_BLOCKED)
	icon_state = "odst_helmet_dark"
	
/obj/item/clothing/head/helmet/odst/heavy
	name = "heavy odst helmet"
	desc = "The heavy armored helmet issue for TerraGov Orbital Drop Ship Troopers."
	armor = list(MELEE = 70, BULLET = 70, LASER = 50, ENERGY = 30, BOMB = 60, BIO = 90, RAD = 20, FIRE = 100, ACID = 100, WOUND = 30)
	icon_state = "odst_heavy_helmet"
	
/obj/item/clothing/suit/space/swat/terragov
	name = "ODST assault Suit"
	desc = "A successor of the tactical suit first developed in a joint effort by TerraGov and Nanotrasen in 2XXX for military operations. It has a minor slowdown, but offers decent protection."
	armor = list(MELEE = 70, BULLET = 70, LASER = 50, ENERGY = 30, BOMB = 60, BIO = 90, RAD = 20, FIRE = 100, ACID = 100, WOUND = 30)
	slowdown = 0.5
	icon_state = "odst_heavy"

/obj/item/clothing/head/beret/terragov_officer
	name = "T.G.A.F. officer beret"
	desc = "A special blue beret for the mundane life of an terragov army officer."
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "ertberet_cmd"

/obj/item/clothing/suit/toggle/terragovcoat
	name = "terragov formal coat"
	desc = "For when an armoured vest isn't fashionable enough."
	icon_state = "terragovcom_coat"
	item_state = "coat"	
	blood_overlay_type = "coat"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	togglename = "buttons"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|ARMS|HANDS
	heat_protection = CHEST|GROIN|ARMS|HANDS
	armor = list(MELEE = 40, BULLET = 55, LASER = 40, ENERGY = 25, BOMB = 25, BIO = 0, RAD = 0, FIRE = 100, ACID = 90, WOUND = 15)
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/toggle/terragovcoat/Initialize(mapload)
	. = ..()
	if(!allowed)
		allowed = GLOB.security_vest_allowed
