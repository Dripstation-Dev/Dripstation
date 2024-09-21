/obj/item/clothing/head/helmet
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	flags_cover = null	//HEADCOVERSEYES

/obj/item/clothing/suit/armor
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'

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
	icon_state = "armoralt"
	item_state = "armoralt"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'

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

/obj/item/clothing/suit/armor/riot
	icon_state = "riot"
	item_state = "riot"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	armor = list(MELEE = 50, BULLET = 10, LASER = 10, ENERGY = 40, BOMB = 0, BIO = 0, RAD = 0, FIRE = 80, ACID = 80, WOUND = 30)

/obj/item/clothing/head/helmet/riot
	icon_state = "riot"
	item_state = "riot"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	armor = list(MELEE = 45, BULLET = 15, LASER = 5, ENERGY = 35, BOMB = 5, BIO = 2, RAD = 0, FIRE = 50, ACID = 50, WOUND = 15)

/obj/item/clothing/suit/armor/riot/chaplain
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

obj/item/clothing/head/helmet/swat/nanotrasen
	icon_state = "swat"
	item_state = "swat"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	desc = "An extremely robust helmet with the Nanotrasen logo emblazoned on the top."

obj/item/clothing/head/helmet/swat/nanotrasen/ert
	name = "/improper amber SWAT helmet"
	icon_state = "erthelmet"

obj/item/clothing/head/helmet/swat/nanotrasen/med
	name = "/improper amber medic SWAT helmet"
	icon_state = "erthelmet_med"

/obj/item/clothing/suit/space/swat
	name = "MK.I SWAT Suit"
	desc = "A tactical suit first developed in a joint effort by Terragov and Nanotrasen in 2XXX for military operations. It has a minor slowdown, but offers decent protection."
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
	armor = list(MELEE = 40, BULLET = 40, LASER = 30,ENERGY = 30, BOMB = 50, BIO = 90, RAD = 20, FIRE = 100, ACID = 100, WOUND = 15)
	strip_delay = 120
	resistance_flags = FIRE_PROOF | ACID_PROOF

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
						/obj/item/ammo_box/a762))

/obj/item/clothing/head/helmet/rus_helmet
	name = "/improper Altin helmet"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	armor = list(MELEE = 30, BULLET = 45, LASER = 20, ENERGY = 10, BOMB = 40, BIO = 0, RAD = 20, FIRE = 30, ACID = 50, WOUND = 5)

/obj/item/clothing/head/helmet/rus_ushanka
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
	flags_inv = HIDEEARS|HIDEFACE
	actions_types = list(/datum/action/item_action/toggle)
	visor_flags_inv = HIDEFACE
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

/obj/item/clothing/suit/armor/vest/combat
	name = "combat vest"
	desc = "Type III bulletproof armor usually issued to paramilitary groups and real soldiers alike. Protects full body and arms. Has additional armor against energy based weaponry."
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

	hitting_projectile.armour_penetration *= clothing_parent.armor_pen_remove_mod
	playsound(owner, SFX_RICOCHET, 0.35, vary = TRUE)

//////////////////HARDENED SKYRAT ARMOR//////////////////
/obj/item/clothing/suit/armor/hardened
	name = "nanotrasen defence team hardened armor vest"
	desc = "A large white breastplate, and a semi-flexible mail of dense panels that cover the torso. \
		While not so incredible at directly stopping bullets, the vest is uniquely suited to cause bullets \
		to lose much of their armor penetrating energy before any damage can be done. \
		Standard-issue armored vest worn by the Nanotrasen Defense Team."
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
		host of other technologies that some poor SolFed procurement general had to talked to death about, \
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
	name = "nanotrasen defence team enclosed helmet"
	desc = "A thick-fronted helmet with extendable visor for whole face protection. The materials and geometry of the helmet \
		combine in such a way that bullets lose much of their armor penetrating energy before any damage can be done, rather than penetrate into it. \
		Standard-issue armored helmet worn by the Nanotrasen Defense Team."
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

/obj/item/clothing/suit/armor/hardened/Initialize(mapload)
	. = ..()

	AddComponent(/datum/component/hardened)

/obj/item/clothing/head/helmet/hardened/examine_more(mob/user)
	. = ..()
	var/msg = "What do you do in an age where armor penetration technology keeps getting better and better, \
		and you're quite fond of not being a corpse? The 'Muur' type armor was a pretty successful attempt at an answer \
		to the question. Using some advanced materials, micro-scale projectile dampener fields, and a whole \
		host of other technologies that some poor SolFed procurement general had to talked to death about, \
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
	name = "gorlex hardened armor vest"
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
	name = "gorlex enclosed helmet"
	desc = "A thick-fronted helmet that offers tactical grade vision and protection. The materials and geometry of the helmet \
		combine in such a way that bullets lose much of their armor penetrating energy before any damage can be done, rather than penetrate into it."
	icon_state = "enclosed_gorlex"
	armor_pen_remove_mod = 0
	armor = list(MELEE = 40, BULLET = 60, LASER = 30, ENERGY = 30, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)


/obj/item/clothing/suit/armor/hardened/amber
	name = "/improper amber trooper hardened vest"
	desc = "Nanotrasen combat variant of the 'Muur' type armor. While if offers tactical grade protection \
		the semi-flexible composite with nanocarbone matrix provides special defence that cause bullets \
		to lose some of their armor penetrating energy before any damage can be done."
	icon_state = "ertarmor"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	heat_protection = CHEST|GROIN|ARMS
	armor_pen_remove_mod = 0
	armor = list(MELEE = 40, BULLET = 60, LASER = 30, ENERGY = 30, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)

/obj/item/clothing/suit/armor/hardened/amber/command
	name = "/improper amber commander hardened vest"
	icon_state = "ertarmor_cmd"

/obj/item/clothing/suit/armor/hardened/amber/medic
	name = "/improper amber medic hardened vest"
	icon_state = "ertarmor_med"

/obj/item/clothing/suit/armor/hardened/amber/engineer
	name = "/improper amber engineer hardened vest"
	icon_state = "ertarmor_eng"

/obj/item/clothing/suit/armor/hardened/amber/engineer
	name = "/improper amber paradimensional specialist hardened vest"
	icon_state = "ertarmor_paranormal"