/obj/item/clothing/head/helmet
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	flags_cover = null	//HEADCOVERSEYES

/obj/item/clothing/head/helmet/police
	icon = 'icons/obj/clothing/hats/hats.dmi'

/obj/item/clothing/suit/armor
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	body_parts_covered = CHEST|GROIN

/obj/item/clothing/suit/armor/examine(mob/user)
	. = ..()
	if(!in_range(user, src) && !isobserver(user))
		return
	if(body_parts_covered || body_parts_partial_covered)
		. += "<span class='notice'>It has a <a href='?src=[REF(src)];list_parts=1'>tag</a> listing its protected parts.</span>"

/obj/item/clothing/suit/armor/Topic(href, href_list)
	. = ..()
	if(href_list["list_parts"])
		var/list/readout = list("<span class='notice'><u><b>COVERAGE</u></b>")
		if(body_parts_covered || body_parts_partial_covered)
			if((body_parts_covered & CHEST) || (body_parts_partial_covered & CHEST))
				readout += "\nIt has <b>CHEST</b> [(body_parts_partial_covered & CHEST) ? "partial " : ""]covered."
			if((body_parts_covered & GROIN) || (body_parts_partial_covered & GROIN))
				readout += "\nIt has <b>CHEST</b> [(body_parts_partial_covered & GROIN) ? "partial " : ""]covered."
			if((body_parts_covered & ARMS) || (body_parts_partial_covered & ARMS))
				readout += "\nIt has <b>ARMS</b> [(body_parts_partial_covered & ARMS) ? "partial " : ""]covered."
			if((body_parts_covered & LEGS) || (body_parts_partial_covered & LEGS))
				readout += "\nIt has <b>LEGS</b> [(body_parts_partial_covered & LEGS) ? "partial " : ""]covered."
			if(body_parts_partial_covered && partial_armor_coeff)
				readout += "\nIt has [partial_armor_coeff] partial armoring rating."
		readout += "</span>"
		to_chat(usr, "[readout.Join()]")

/obj/item/clothing/suit/armor/vest
	icon_state = "armor"
	item_state = "armor"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'

/obj/item/clothing/suit/armor/vest/light
	icon_state = "armorlight"
	item_state = "armorlight"

/obj/item/clothing/suit/armor/vest/old
	icon_state = "armorlight"
	item_state = "armorlight"

/obj/item/clothing/suit/armor/vest/alt
	name = "security armor"
	desc = "A tactical Type II armor vest. You probably should not take hits in your groin, really."
	icon_state = "armor_security"
	body_parts_partial_covered = GROIN
	partial_armor_coeff = 0.25	//it`s like 10 melee/bullet/laser armor in groin
	armor = list(MELEE = 40, BULLET = 40, LASER = 40, ENERGY = 20, BOMB = 30, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)

/obj/item/clothing/suit/armor/vest/alt/examine(mob/user)
	. = ..()
	. += "Alt-click on [src] to toggle."

/obj/item/clothing/suit/armor/vest/alt/AltClick(mob/user)
	..()
	if(!user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	else
		suit_toggle(user)

/obj/item/clothing/suit/armor/vest/alt/ui_action_click()
	suit_toggle()

/obj/item/clothing/suit/armor/vest/alt/proc/suit_toggle()
	set src in usr

	if(!can_use(usr))
		return 0

	if(src.suittoggled)
		to_chat(usr, "You button up the vest.")
		src.icon_state = "[initial(icon_state)]"
		src.suittoggled = FALSE
	else if(!src.suittoggled)
		to_chat(usr, "You unbutton the vest.")
		src.icon_state = "[initial(icon_state)]_open"
		src.suittoggled = TRUE
	usr.update_inv_wear_suit()
	for(var/X in actions)
		var/datum/action/A = X
		A.build_all_button_icons()

/obj/item/clothing/suit/armor/vest/alt/occupying
	name = "peacekeeping force vest"
	desc = "A blue armored vest worn by Peacekeepers."
	icon_state = "occvest"
	item_state = "occvest"
	body_parts_partial_covered = null	//THEY HAS NO GROIN PUNISHMENT WOW

/obj/item/clothing/suit/armor/vest/alt/med
	name = "brig med armor"
	desc = "A tactical Type II armor vest, but with shoulderpads included to give some protection to arms. Has additional medical patches on it. Not designed for serious operations."
	icon_state = "armor_secmed"
	body_parts_covered = CHEST|GROIN|ARMS
	body_parts_partial_covered = GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	heat_protection = CHEST|GROIN|ARMS
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/medrig

/datum/component/storage/concrete/pockets/medrig
	quickdraw = TRUE
	max_combined_w_class = 2

/datum/component/storage/concrete/pockets/medrig/Initialize()
	. = ..()
	set_holdable(list(	/obj/item/reagent_containers/autoinjector/medipen,
						/obj/item/radio,
						/obj/item/reagent_containers/glass/bottle,
						/obj/item/stack/medical))

/obj/item/clothing/suit/armor/vest/alt/full
	name = "full security armor"
	desc = "A tactical Type II armor vest, but with shoulderpads and knee pads included to cover all parts of the body. Not designed for serious operations."
	icon_state = "armor_security_fullbody"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	body_parts_partial_covered = GROIN|LEGS|ARMS
	cold_protection = CHEST|GROIN|ARMS|LEGS
	heat_protection = CHEST|GROIN|ARMS|LEGS
	partial_armor_coeff = 0.5	//it`s like 20 melee/bullet/laser armor in groin/arms/legs, worse then actual rig, but no speed punish
	custom_premium_price = 400

/obj/item/clothing/suit/armor/vest/rycliesarmour
	name = "war armour"
	desc = "Good for protecting your chest during war."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "rycliesarmour"
	item_state = "rycliesarmour"

/obj/item/clothing/suit/armor/vest/namflakjacket
	name = "nam flak jacket"
	desc = "Good for protecting your chest from napalm and toolboxes!"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "namflakjacket"
	item_state = "namflakjacket"

/obj/item/clothing/suit/armor/vest/redcoatcoat
	name = "redcoat coat"
	desc = "Security is coming! Security is coming! Also padded with kevlar for protection."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	item_state = "red_coat_coat"

/obj/item/clothing/suit/armor/vest/secmiljacket
	name = "sec military jacket"
	desc = "Aviators not included. Now with extra padding!"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "secmiljacket"
	item_state = "secmiljacket"

/obj/item/clothing/suit/armor/vest/police
	name = "terragov police armor"
	desc = "Aviators not included."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "terragov_pol"
	item_state = "terragov_pol"

/obj/item/clothing/suit/armor/riot
	icon_state = "riot"
	item_state = "riot"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	armor = list(MELEE = 50, BULLET = 10, LASER = 10, ENERGY = 40, BOMB = 0, BIO = 0, RAD = 0, FIRE = 80, ACID = 80, WOUND = 30)
	clothing_traits = list(TRAIT_BRAWLING_KNOCKDOWN_BLOCKED, TRAIT_NO_STAGGER)

/obj/item/clothing/head/helmet/riot
	icon_state = "riot"
	item_state = "riot"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	armor = list(MELEE = 45, BULLET = 15, LASER = 5, ENERGY = 35, BOMB = 5, BIO = 2, RAD = 0, FIRE = 50, ACID = 50, WOUND = 15)
	clothing_traits = list(TRAIT_HEAD_INJURY_BLOCKED)

/obj/item/clothing/suit/armor/riot/chaplain
	icon = 'icons/obj/clothing/suits/suits.dmi'
	worn_icon = 'icons/mob/clothing/suit/suit.dmi'

/obj/item/clothing/suit/armor/riot/knight
	icon = 'icons/obj/clothing/suits/suits.dmi'
	worn_icon = 'icons/mob/clothing/suit/suit.dmi'

/obj/item/clothing/suit/armor/riot/occupying
	icon_state = "occriotsuit"
	name = "peacekeeping force riot suit"
	desc = "A mass produced semi-flexible polycarbonate body armor with decent padding to protect against melee attacks. Not as strong as riot suits typically issued to NT stations."
	armor = list(MELEE = 40, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 0, BIO = 0, RAD = 0, FIRE = 40, ACID = 40)

/obj/item/clothing/suit/armor/secconcoat
	icon = 'icons/obj/clothing/suits/suits.dmi'
	worn_icon = 'icons/mob/clothing/suit/suit.dmi'

/obj/item/clothing/suit/armor/secconvest
	icon = 'icons/obj/clothing/suits/suits.dmi'
	worn_icon = 'icons/mob/clothing/suit/suit.dmi'

/obj/item/clothing/suit/armor/stormtrooper
	icon = 'icons/obj/clothing/suits/suits.dmi'
	worn_icon = 'icons/mob/clothing/suit/suit.dmi'

/obj/item/clothing/suit/armor/tdome
	icon = 'icons/obj/clothing/suits/suits.dmi'
	worn_icon = 'icons/mob/clothing/suit/suit.dmi'

/obj/item/clothing/head/helmet/abductor
	flags_cover = HEADCOVERSEYES
	icon = 'icons/obj/clothing/hats/hats.dmi'
	worn_icon = 'icons/mob/clothing/head/head.dmi'

/obj/item/clothing/head/helmet/changeling
	flags_cover = HEADCOVERSEYES
	dynamic_hair_suffix = ""

//////////////////SWAT//////////////////
/obj/item/clothing/head/helmet/swat
	icon_state = "swatsyndie"
	item_state = "swatsyndie"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	desc = "An extremely robust helmet in a nefarious red and black stripe pattern."
	flags_cover = HEADCOVERSEYES
	clothing_traits = list(TRAIT_HEAD_INJURY_BLOCKED)

/obj/item/clothing/head/helmet/swat/nanotrasen
	icon_state = "swat"
	item_state = "swat"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	desc = "An extremely robust helmet with the Nanotrasen logo emblazoned on the top."

/obj/item/clothing/head/helmet/swat/nanotrasen/shield
	name = "close protection helmet"
	desc = "Black Nanotrasen specops helmet."
	icon_state = "centcomshield_helmet"

/obj/item/clothing/head/helmet/swat/nanotrasen/shield/blue
	desc = "Black and blue Nanotrasen specops helmet."
	icon_state = "centcomshield_helmet_blue"

/obj/item/clothing/head/helmet/swat/nanotrasen/ert
	name = "amber helmet"
	desc = "Standart issue Nanotrasen specops helmet without NT logo."
	icon_state = "erthelmet"

/obj/item/clothing/head/helmet/swat/nanotrasen/med
	name = "amber medic helmet"
	desc = "Standart issue Nanotrasen medic helmet. Has a big white stripe on the top."
	icon_state = "erthelmet_med"	

/obj/item/clothing/suit/space/swat
	name = "MK.I SWAT Suit"
	desc = "A tactical suit first developed in a joint effort by TerraGov and Nanotrasen in 2XXX for military operations. It has a minor slowdown, but offers decent protection."
	icon_state = "heavy"
	item_state = "swat_suit"
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	w_class = WEIGHT_CLASS_BULKY
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/restraints/handcuffs, /obj/item/tank/internals, /obj/item/kitchen/knife/combat)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	clothing_flags = THICKMATERIAL
	heat_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	slowdown = 0.7
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	body_parts_partial_covered = 0
	clothing_traits = list(TRAIT_BRAWLING_KNOCKDOWN_BLOCKED, TRAIT_NO_STAGGER)
	armor = list(MELEE = 40, BULLET = 40, LASER = 30, ENERGY = 30, BOMB = 60, BIO = 90, RAD = 20, FIRE = 100, ACID = 100, WOUND = 15)
	strip_delay = 120

/obj/item/clothing/suit/space/swat/syndicate
	name = "assault armor"
	desc = "A heavily armored suit that protects against moderate damage. Used by high ranking PMC operatives across human space. This one is kinda suspicious colored."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "heavys"
	item_state = "heavys"
	flags_inv = null
	slowdown = 0.3



//////////////////SLAV//////////////////
/obj/item/clothing/suit/armor/vest/russian
	name = "bulletproof slav chest rig"
	desc = "A bulletproof robust vest with forest camo. Good thing there's plenty of forests to hide in around here, right?"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "rus_carrier"
	body_parts_covered = CHEST|GROIN
	armor = list(MELEE = 25, BULLET = 50, LASER = 25, ENERGY = 15, BOMB = 40, BIO = 0, RAD = 20, FIRE = 20, ACID = 50, WOUND = 15)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/chestrig

/datum/component/storage/concrete/pockets/chestrig
	quickdraw = TRUE
	max_combined_w_class = 3

/datum/component/storage/concrete/pockets/chestrig/Initialize()
	. = ..()
	set_holdable(list(	/obj/item/reagent_containers/autoinjector/medipen,
						/obj/item/radio,
						/obj/item/ammo_box/a762,
						/obj/item/ammo_box/magazine/r762x39,
						/obj/item/ammo_box/magazine/r545))

/obj/item/clothing/suit/armor/slav_heavy
	name = "bulletproof slav heavy suit"
	desc = "A bulletproof robust armored suit with forest camo. Good thing there's plenty of forests to hide in around here, right?"
	icon_state = "heavy_slav"
	item_state = "riot"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	armor = list(MELEE = 50, BULLET = 50, LASER = 0, ENERGY = 30, BOMB = 30, BIO = 0, RAD = 0, FIRE = 80, ACID = 80, WOUND = 25)
	clothing_traits = list(TRAIT_BRAWLING_KNOCKDOWN_BLOCKED, TRAIT_NO_STAGGER)
	strip_delay = 120
	clothing_flags = THICKMATERIAL
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	body_parts_partial_covered = null
	cold_protection = CHEST|GROIN|ARMS|LEGS
	heat_protection = CHEST|GROIN|ARMS|LEGS
	slowdown = 0.4

/obj/item/clothing/head/helmet/rus_helmet
	name = "\improper SH-77 helmet"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "rus_helmet"
	armor = list(MELEE = 30, BULLET = 35, LASER = 10, ENERGY = 10, BOMB = 40, BIO = 0, RAD = 20, FIRE = 30, ACID = 50, WOUND = 5)

/obj/item/clothing/head/helmet/riot/altin
	name = "\improper Altin helmet"
	desc = "Heavy is here."
	icon_state = "russian_heavy_helmet"
	armor = list(MELEE = 30, BULLET = 60, LASER = 20, ENERGY = 40, BOMB = 60, BIO = 2, RAD = 20, FIRE = 50, ACID = 50, WOUND = 15)

/obj/item/clothing/head/helmet/riot/altin/black
	name = "\improper black Altin helmet"
	desc = "Heavy is here. Extra black."
	icon_state = "brussian_heavy_helmet"

/obj/item/clothing/head/helmet/riot/altin/kill
	name = "\improper striped Altin helmet"
	desc = "Heavy is here. Extra black with stripes."
	icon_state = "killa_heavy_helmet"

/obj/item/clothing/head/helmet/rus_ushanka
	icon = 'icons/obj/clothing/hats/hats.dmi'
	worn_icon = 'icons/mob/clothing/head/head.dmi'
	armor = list(MELEE = 10, BULLET = 5, LASER = 5, ENERGY = 20, BOMB = 5, BIO = 50, RAD = 20, FIRE = -10, ACID = 0, WOUND = 5)

/obj/item/clothing/suit/armor/vest/russian_coat
	icon_state = "sovietcoat"

//////////////////ABLATIVE//////////////////
/obj/item/clothing/head/helmet/laserproof
	name = "reflective helmet"
	desc = "A helmet that excels in protecting the wearer against energy projectiles, as well as occasionally reflecting them."
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "ablative_helmet"
	item_state = "ablative_helmet"
	armor = list(MELEE = 5, BULLET = 5, LASER = 60, ENERGY = 50, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 100, WOUND = 5)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	var/hit_reflect_chance = 50
	toggle_message = "You pull the visor down on"
	alt_toggle_message = "You push the visor up on"
	can_toggle = 1
	actions_types = list(/datum/action/item_action/toggle)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	visor_flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	toggle_cooldown = 0
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/head/helmet/laserproof/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_EYES))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/head/helmet/laserproof/raised/Initialize(mapload)
	. = ..()
	up = !up
	flags_1 ^= visor_flags
	flags_inv ^= visor_flags_inv
	flags_cover ^= visor_flags_cover
	icon_state = "[initial(icon_state)][up ? "up" : ""]"

/obj/item/clothing/suit/armor/laserproof
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "ablative"
	item_state = "ablative"


/obj/item/clothing/head/hooded/ablative
	name = "ablative hood"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	desc = "Hood hopefully belonging to an ablative trenchcoat."
	icon_state = "ablativehood"
	item_state = "ablativehood"
	armor = list(MELEE = 5, BULLET = 5, LASER = 60, ENERGY = 50, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 100, WOUND = 15)
	strip_delay = 30
	var/hit_reflect_chance = 50

/obj/item/clothing/head/hooded/ablative/IsReflect(def_zone)
	if(def_zone != BODY_ZONE_HEAD) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/head/hooded/ablative/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_ADVANCED]
		SHUD.show_to(user)

/obj/item/clothing/head/hooded/ablative/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_ADVANCED]
		SHUD.hide_from(user)

/obj/item/clothing/suit/hooded/ablative
	name = "ablative trenchcoat"
	desc = "Experimental trenchcoat specially crafted to reflect and absorb laser and disabler shots. Don't expect it to do all that much against an axe or a shotgun, however."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "ablativecoat"
	item_state = "ablativecoat"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(MELEE = 5, BULLET = 5, LASER = 60, ENERGY = 50, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 100, WOUND = 15)
	hoodtype = /obj/item/clothing/head/hooded/ablative
	strip_delay = 30
	equip_delay_other = 40
	var/hit_reflect_chance = 50

/obj/item/clothing/suit/hooded/ablative/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

//////////////////BULLETPROOF//////////////////
/obj/item/clothing/suit/armor/vest/bulletproof
	armor = list(MELEE = 15, BULLET = 60, LASER = 10, ENERGY = 10, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)

/obj/item/clothing/head/helmet/alt
	flags_cover = HEADCOVERSEYES
	armor = list(MELEE = 15, BULLET = 60, LASER = 10, ENERGY = 10, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)

/obj/item/clothing/head/helmet/alt/gorlex
	name = "combat gorlex helmet"
	icon_state = "helmetaltgorlex"
	armor = list(MELEE = 30, BULLET = 60, LASER = 10, ENERGY = 10, BOMB = 50, BIO = 0, RAD = 0, FIRE = 40, ACID = 40, WOUND = 20)

/obj/item/clothing/head/helmet/alt/waffle
	name = "combat waffle helmet"
	icon_state = "helmetaltwaffle"

/obj/item/clothing/head/helmet/alt/cybersun
	name = "combat cybersun helmet"
	icon_state = "helmetaltcybersun"
	armor = list(MELEE = 15, BULLET = 60, LASER = 30, ENERGY = 30, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)

/obj/item/clothing/suit/armor/vest/bulletproof/cybersun
	name = "combat cybersun vest"
	desc = "Type III bulletproof armor usually issued to Cybersun security guards. Protects full body. This model has additional armor against energy based weaponry."
	icon_state = "ballistic_cybersun"
	armor = list(MELEE = 15, BULLET = 60, LASER = 30, ENERGY = 30, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)

/obj/item/clothing/suit/armor/vest/bulletproof/combat
	name = "combat vest"
	desc = "Type III bulletproof armor usually issued to paramilitary groups and real soldiers alike. Protects full body and arms. Has slightly better armor against energy based weaponry"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "combat"
	item_state = "combat"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	heat_protection = CHEST|GROIN|ARMS
	blood_overlay_type = "armor"
	armor = list(MELEE = 15, BULLET = 60, LASER = 20, ENERGY = 20, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)
	strip_delay = 70
	equip_delay_other = 50

/obj/item/clothing/suit/armor/vest/bulletproof/spesspress
	name = "press armor vest"
	desc = "Armor vest of the faimous SPESS PRESS! Brought by UNN LLC."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "spesspress"

/obj/item/clothing/suit/armor/vest/unn_ringmail
	name = "\improper'Ringmail' armor vest"
	desc = "Security grade corporate light armour. Brought by UNN LLC."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "unn_ringmail"
	slowdown = -0.1
	armor = list(MELEE = 40, BULLET = 30, LASER = 30, ENERGY = 40, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)

/obj/item/clothing/suit/armor/vest/bulletproof/unn
	name = "bulletproof UNN vest"
	desc = "Type III bulletproof armor usually issued to UNN contracted operatives. This model has additional armor against energy based weaponry."
	icon_state = "unn_ballistic_vest"
	armor = list(MELEE = 15, BULLET = 60, LASER = 30, ENERGY = 30, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)

/obj/item/clothing/suit/armor/vest/bulletproof/combat
	name = "combat UNN vest"
	desc = "Type III bulletproof armor usually issued to UNN contracted operatives. Protects full body and arms. This model has additional armor against energy based weaponry."
	icon_state = "unn_combat_armor"
	armor = list(MELEE = 20, BULLET = 60, LASER = 30, ENERGY = 30, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)

/obj/item/clothing/head/helmet/unn_enclosed
	name = "\improper'Agent' UNN helmet"
	icon_state = "closed_unn_helmet"
	armor = list(MELEE = 40, BULLET = 30, LASER = 30, ENERGY = 40, BOMB = 50, BIO = 30, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)
	flags_inv = HIDEEARS|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	strip_delay = 80

/obj/item/clothing/head/helmet/alt/unn
	name = "combat unn helmet"
	icon_state = "unn_helmet"

/obj/item/clothing/head/helmet/alt/unn/parade
	icon_state = "unn_helmet_parade"

/obj/item/clothing/head/helmet/cyberpunkgoggle
	name = "\improper Type-34 Semi-Enclosed Headwear"
	desc = "Armored helmet used by certain law enforcement agencies. It's hard to believe there's a human somewhere behind that."
	icon_state = "cyberpunkgoggle"
	flags_inv = HIDEEARS|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/head/helmet/tanker
	name = "\improper M50 tanker helmet"
	desc = "The lightweight M50 tanker helmet is designed for use by armored crewmen in the TGMC. It offers low weight protection, and allows agile movement inside the confines of an armored vehicle."
	icon_state = "tanker_helmet"
	armor = list(MELEE = 35, BULLET = 35, LASER = 15, ENERGY = 25, BOMB = 30, BIO = 45, RAD = 15, FIRE = 45, ACID = 45, WOUND = 20)
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	flags_inv = HIDEEARS

/obj/item/clothing/head/helmet/tanker/slav
	name = "\improper slav tanker helmet"
	desc = "The lightweight slav tanker helmet is designed for use by armored crewmen in the USSP. It offers low weight protection, and allows agile movement inside the confines of an armored vehicle."
	icon_state = "tanker_helmet_gray"

/obj/item/clothing/suit/armor/plated/attack_self(mob/user)
	. = ..()
	update_appearance(UPDATE_ICON)
	user.update_inv_wear_suit()

/obj/item/clothing/suit/armor/plated/attackby(obj/item/I, mob/user, params)
	. = ..()
	update_appearance(UPDATE_ICON)
	user.update_inv_wear_suit()

/obj/item/clothing/suit/armor/plated/update_icon_state()
	. = ..()
	if(plating)
		icon_state = "[initial(icon_state)]-[plating.icon_state]"
	else
		icon_state = initial(icon_state)

/obj/item/clothing/suit/armor/vest/durathread
	icon = 'icons/obj/clothing/suits/suits.dmi'
	worn_icon = 'icons/mob/clothing/suit/suit.dmi'

/obj/item/clothing/suit/armor/tribalcoat
	icon = 'icons/obj/clothing/suits/suits.dmi'
	worn_icon = 'icons/mob/clothing/suit/suit.dmi'

/obj/item/clothing/suit/armor/pathfinder
	icon = 'icons/obj/clothing/suits/suits.dmi'
	worn_icon = 'icons/mob/clothing/suit/suit.dmi'

/obj/item/clothing/suit/armor/elder_atmosian
	icon = 'icons/obj/clothing/suits/suits.dmi'
	worn_icon = 'icons/mob/clothing/suit/suit.dmi'


/// Component that lets clothing remove AP potential of the piercing bullets in armored zones. The parent MUST have armor_pen_remove_mod set.
/datum/component/hardened
	/// Who is wearing the target?
	var/mob/living/wearer

/datum/component/hardened/Initialize()
	if(!istype(parent, /obj/item/clothing)) // Just in case someone loses it and tries to put this on something that's not clothing
		return COMPONENT_INCOMPATIBLE

	var/obj/item/clothing/parent_clothing = parent

	if(ismob(parent_clothing.loc))
		var/mob/holder = parent_clothing.loc
		if(holder.is_holding(parent_clothing))
			return
		set_wearer(holder)

/datum/component/hardened/RegisterWithParent()
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(on_equipped))
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(lost_wearer))

/datum/component/hardened/UnregisterFromParent()
	UnregisterSignal(parent, list(COMSIG_ITEM_DROPPED, COMSIG_ITEM_EQUIPPED, COMSIG_ATOM_BULLET_ACT))

/// Check if we've been equipped to a valid slot to defend
/datum/component/hardened/proc/on_equipped(datum/source, mob/user, slot)
	SIGNAL_HANDLER

	if((slot & ITEM_SLOT_HANDS))
		lost_wearer(source, user)
		return
	set_wearer(user)

/// Either we've been dropped or our wearer has been QDEL'd. Either way, they're no longer our problem
/datum/component/hardened/Destroy(force, silent)
	if(wearer)
		wearer = null
	UnregisterSignal(parent, list(COMSIG_ATOM_BULLET_ACT))
	return ..()

/datum/component/hardened/proc/lost_wearer(datum/source, mob/user)
	SIGNAL_HANDLER

	wearer = null
	UnregisterSignal(parent, list(COMSIG_ATOM_BULLET_ACT))

/// Sets the wearer and registers the appropriate signals for them
/datum/component/hardened/proc/set_wearer(mob/user)
	if(wearer == user)
		return
	if(!isnull(wearer))
		CRASH("[type] called set_wearer with [user] but [wearer] was already the wearer!")

	wearer = user
	RegisterSignal(wearer, COMSIG_ATOM_BULLET_ACT, PROC_REF(hit_by_projectile))

/datum/component/hardened/proc/hit_by_projectile(mob/living/owner, obj/projectile/hitting_projectile, def_zone)
	SIGNAL_HANDLER

	var/obj/item/clothing/clothing_parent = parent

	if(!(def_zone in cover_flags2body_zones(clothing_parent.body_parts_covered)))
		return
	if(hitting_projectile.damage_type != BRUTE)
		return

	hitting_projectile.armour_penetration = max(hitting_projectile.hard_armour_penetration, hitting_projectile.armour_penetration * clothing_parent.armor_pen_remove_mod)
	playsound(owner, SFX_RICOCHET, 0.35, vary = TRUE)

//////////////////HARDENED SKYRAT ARMOR//////////////////
/obj/item/clothing/suit/armor/hardened
	name = "nanotrasen defence team hardened armor vest"
	desc = "A large white breastplate, and a semi-flexible mail of dense panels that cover the torso. \
		While not so incredible at directly stopping bullets, the vest is uniquely suited to cause bullets \
		to lose much of their armor penetrating energy before any damage can be done. \
		Standard-issue armored vest worn by members of the Nanotrasen Defense Team."
	icon_state = "hardened_standard"
	item_state = "armor"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN
	cold_protection = CHEST|GROIN
	heat_protection = CHEST|GROIN
	armor_pen_remove_mod = 0.35
	armor = list(MELEE = 10, BULLET = 50, LASER = 10, ENERGY = 10, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)

/obj/item/clothing/suit/armor/hardened/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/hardened)

/obj/item/clothing/suit/armor/hardened/examine_more(mob/user)
	. = ..()
	var/msg = "What do you do in an age where armor penetration technology keeps getting better and better, \
		and you're quite fond of not being a corpse? The 'Muur' type armor was a pretty successful attempt at an answer \
		to the question. Using some advanced materials, micro-scale projectile dampener fields, and a whole \
		host of other technologies that some poor Terragov procurement general had to talked to death about, \
		it offers a unique advantage over many armor piercing bullets. Why stop the bullet from piercing the armor \
		with more armor, when you could simply force the bullet to penetrate less and get away with less protection? \
		Some people would rather the bullet just be stopped, of course, but when you have to make choices, many choose \
		this one."

	return list(span_notice("<i>[msg]</i>"))

/obj/item/clothing/suit/armor/hardened/cmd
	name = "'Archangel' hardened armor vest"
	desc = "A large white breastplate with a lone blue stripe, and a semi-flexible mail of dense panels that cover the torso. \
		While not so incredible at directly stopping bullets, the vest is uniquely suited to cause bullets \
		to lose much of their armor penetrating energy before any damage can be done. \
		Standard-issue armored vest worn by the Nanotrasen Defense Team Officers."
	icon_state = "hardened_cmd"

/obj/item/clothing/head/helmet/hardened
	name = "nanotrasen defense team enclosed helmet"
	desc = "A thick-fronted helmet with extendable visor for whole face protection. The materials and geometry of the helmet \
		combine in such a way that bullets lose much of their armor penetrating energy before any damage can be done, rather than penetrate into it. \
		Standard-issue armored helmet worn by members of the Nanotrasen Defense Team."
	icon_state = "enclosed_standard"
	item_state = "helmet"
	can_toggle = 1
	toggle_message = "You extend the visor on"
	alt_toggle_message = "You retract the visor on"
	actions_types = list(/datum/action/item_action/toggle)
	armor_pen_remove_mod = 0.35
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	visor_flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	dynamic_hair_suffix = ""
	dog_fashion = null
	armor = list(MELEE = 10, BULLET = 50, LASER = 10, ENERGY = 10, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)

/obj/item/clothing/head/helmet/hardened/Initialize(mapload)
	. = ..()

	AddComponent(/datum/component/hardened)

/obj/item/clothing/head/helmet/hardened/examine_more(mob/user)
	. = ..()
	var/msg = "What do you do in an age where armor penetration technology keeps getting better and better, \
		and you're quite fond of not being a corpse? The 'Muur' type armor was a pretty successful attempt at an answer \
		to the question. Using some advanced materials, micro-scale projectile dampener fields, and a whole \
		host of other technologies that some poor Terragov procurement general had to talked to death about, \
		it offers a unique advantage over many armor piercing bullets. Why stop the bullet from piercing the armor \
		with more armor, when you could simply force the bullet to penetrate less and get away with less protection? \
		Some people would rather the bullet just be stopped, of course, but when you have to make choices, many choose \
		this one."

	return list(span_notice("<i>[msg]</i>"))

/obj/item/clothing/head/helmet/hardened/cmd
	name = "'Archangel' enclosed helmet"
	desc = "A thick-fronted helmet with extendable visor for whole face protection. The materials and geometry of the helmet \
		combine in such a way that bullets lose much of their armor penetrating energy before any damage can be done, rather than penetrate into it. \
		This one has a blue stripe down the front. Standard-issue armored helmet worn by the Nanotrasen Defense Team Officers."
	icon_state = "enclosed_cmd"

//////////////////HARDENED ARMOR//////////////////
/obj/item/clothing/suit/armor/hardened/gorlex
	name = "red hardened armor vest"
	desc = "A large red plasceramic breastplate, and a semi-flexible composite torso with nanocarbone matrix. \
		While if offers tactical grade protectionthe semi-flexible composite with nanocarbone matrix provides special \
		defence that cause bullets to lose some of their armor penetrating energy before any damage can be done."
	icon_state = "gorlexvest"
	body_parts_covered = CHEST|GROIN|ARM_LEFT
	cold_protection = CHEST|GROIN|ARM_LEFT
	heat_protection = CHEST|GROIN|ARM_LEFT
	armor_pen_remove_mod = 0
	armor = list(MELEE = 40, BULLET = 60, LASER = 30, ENERGY = 30, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)

/obj/item/clothing/head/helmet/hardened/gorlex
	name = "red enclosed helmet"
	desc = "A thick-fronted helmet that offers tactical grade vision and protection. The materials and geometry of the helmet \
		combine in such a way that bullets lose much of their armor penetrating energy before any damage can be done, rather than penetrate into it."
	icon_state = "enclosed_gorlex"
	armor_pen_remove_mod = 0
	armor = list(MELEE = 40, BULLET = 60, LASER = 30, ENERGY = 30, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)


/obj/item/clothing/suit/armor/hardened/amber
	name = "\improper amber trooper hardened vest"
	desc = "Nanotrasen combat variant of the 'Muur' type armor. While if offers tactical grade protection \
		the semi-flexible composite with nanocarbone matrix provides special defence that cause bullets \
		to lose some of their armor penetrating energy before any damage can be done. \
		Also has pockets!"
	icon_state = "ertarmor"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	heat_protection = CHEST|GROIN|ARMS
	armor_pen_remove_mod = 0
	armor = list(MELEE = 40, BULLET = 60, LASER = 30, ENERGY = 30, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/amber

/obj/item/clothing/suit/armor/hardened/amber/command
	name = "\improper amber commander hardened vest"
	icon_state = "ertarmor_cmd"

/obj/item/clothing/suit/armor/hardened/amber/security
	name = "\improper amber security hardened vest"
	icon_state = "ertarmor_sec"

/obj/item/clothing/suit/armor/hardened/amber/medic
	name = "\improper amber medic hardened vest"
	icon_state = "ertarmor_med"

/obj/item/clothing/suit/armor/hardened/amber/engineer
	name = "\improper amber engineer hardened vest"
	icon_state = "ertarmor_eng"

/obj/item/clothing/suit/armor/hardened/amber/paradimensional
	name = "\improper amber paradimensional specialist hardened vest"
	icon_state = "ertarmor_paranormal"


//////SHELLGUARD//////

/obj/item/clothing/head/helmet/shellguard
	name = "\improper shellguard helmet"
	desc = "Standart issue helmet with Shellguard marking."
	icon_state = "shelg_helmet"

/obj/item/clothing/suit/armor/vest/shellguard
	name = "\improper shellguard vest"
	desc = "Standart issue vest with Shellguard marking."
	icon_state = "shelgvest"

/obj/item/clothing/suit/armor/vest/shellguard/brand
	name = "\improper shellguard brand vest"
	desc = "Standart issue vest with Shellguard marking. Has BIG logo on their chest."
	icon_state = "shelgbrandvest"

/obj/item/clothing/suit/armor/riot/shellguard
	name = "\improper shellguard riot vest"
	desc = "Standart issue riot vest with Shellguard marking."
	icon_state = "riot_shelg_alt"

/obj/item/clothing/suit/armor/riot/shellguard/brand
	desc = "Standart issue riot vest with Shellguard marking. Has BIG logo on their chest."
	icon_state = "riot_shelg"

/obj/item/clothing/suit/armor/vest/bulletproof/combat/shellguard
	name = "\improper combat shellguard vest"
	desc = "Type III bulletproof armor issued to Shellguard heavy troopers. Protects full body, legs and arms. Has slightly better armor against energy based weaponry."
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "bulletproof_shelg_alt"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|ARMS|LEGS
	heat_protection = CHEST|GROIN|ARMS|LEGS

/obj/item/clothing/suit/armor/vest/bulletproof/combat/shellguard/brand
	icon_state = "bulletproof_shelg"

///Unathi///
/obj/item/clothing/suit/armor/vest/unathi
	name = "\improper combat unathi light armor"
	desc = "Armored vest issued to Unathi Empire light troopers. Protects full body, legs, arms and tail."
	armor = list(MELEE = 40, BULLET = 40, LASER = 20, ENERGY = 20, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "unati_samurai"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|ARMS|LEGS
	heat_protection = CHEST|GROIN|ARMS|LEGS
	species_restricted = list("lizard", "polysmorph")

/obj/item/clothing/suit/armor/vest/unathi/heavy
	name = "\improper combat unathi grunt armor"
	desc = "Armored vest issued to Unathi Empire heavy troopers. Protects full body, legs, arms and tail."
	armor = list(MELEE = 60, BULLET = 60, LASER = 20, ENERGY = 20, BOMB = 60, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)
	icon_state = "unati_grunt"
