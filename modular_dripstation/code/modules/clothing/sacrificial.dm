//////////////////SACRIFICIAL SKYRAT ARMOR//////////////////
/// Component that lets clothing be damaged in zones by piercing bullets.
/datum/component/clothing_damaged_by_bullets
	/// How much of the incoming projectile damage is taken, multiplier
	var/projectile_damage_multiplier
	/// Who is wearing the target?
	var/mob/living/wearer

/datum/component/clothing_damaged_by_bullets/Initialize(projectile_damage_multiplier = 15)
	if(!istype(parent, /obj/item/clothing)) // Just in case someone loses it and tries to put this on something that's not clothing
		return COMPONENT_INCOMPATIBLE

	var/obj/item/clothing/parent_clothing = parent

	src.projectile_damage_multiplier = projectile_damage_multiplier

	if(ismob(parent_clothing.loc))
		var/mob/holder = parent_clothing.loc
		if(holder.is_holding(parent_clothing))
			return
		set_wearer(holder)

/datum/component/clothing_damaged_by_bullets/RegisterWithParent()
	RegisterSignal(parent, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine))
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(on_equipped))
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(lost_wearer))

/datum/component/clothing_damaged_by_bullets/UnregisterFromParent()
	UnregisterSignal(parent, list(COMSIG_ATOM_EXAMINE, COMSIG_ITEM_DROPPED, COMSIG_ITEM_EQUIPPED, COMSIG_QDELETING, COMSIG_ATOM_BULLET_ACT))

/// Check if we've been equipped to a valid slot to shield
/datum/component/clothing_damaged_by_bullets/proc/on_equipped(datum/source, mob/user, slot)
	SIGNAL_HANDLER

	if((slot & ITEM_SLOT_HANDS))
		lost_wearer(source, user)
		return
	set_wearer(user)

/// Either we've been dropped or our wearer has been QDEL'd. Either way, they're no longer our problem
/datum/component/clothing_damaged_by_bullets/proc/lost_wearer(datum/source, mob/user)
	SIGNAL_HANDLER

	wearer = null
	UnregisterSignal(parent, list(COMSIG_QDELETING, COMSIG_ATOM_BULLET_ACT))

/// Sets the wearer and registers the appropriate signals for them
/datum/component/clothing_damaged_by_bullets/proc/set_wearer(mob/user)
	if(wearer == user)
		return
	if(!isnull(wearer))
		CRASH("[type] called set_wearer with [user] but [wearer] was already the wearer!")

	wearer = user
	RegisterSignal(wearer, COMSIG_QDELETING, PROC_REF(lost_wearer), null, TRUE)
	RegisterSignal(wearer, COMSIG_ATOM_BULLET_ACT, PROC_REF(hit_by_projectile))

/// Checks an incoming projectile to see if it should damage the thing we're attached to,
/datum/component/clothing_damaged_by_bullets/proc/hit_by_projectile(mob/living/dude_getting_hit, obj/projectile/hitting_projectile, def_zone)
	SIGNAL_HANDLER

	var/obj/item/clothing/clothing_parent = parent
	var/weak_against_armour = FALSE
	//var/damage_dealt

	if(!(def_zone in cover_flags2body_zones(clothing_parent.body_parts_covered)))
		return
	if(hitting_projectile.sharpness == SHARP_EDGED)
		return
	if(hitting_projectile.damage_type != BRUTE)
		return

	if(hitting_projectile.armour_penetration <= 0)
		weak_against_armour = TRUE

	/// This seems complex but the actual math is simple, the damage of the projectile * vest damage multiplier, divided by two if the projectile is weak to armour
	var/total_damage = ((hitting_projectile.damage * projectile_damage_multiplier) * (weak_against_armour ? 0.5 : 1))
	//var/damage_dealt = clothing_parent.take_damage(total_damage, BRUTE, hitting_projectile.armour_penetration, FALSE)
	clothing_parent.take_damage(total_damage, BRUTE, BULLET, null, hitting_projectile.armour_penetration)

	//if(clothing_parent.limb_integrity)	//It just don`t work, I`m tired
	//	clothing_parent.take_damage_zone(def_zone, total_damage, BRUTE)
	

/// Warns any examiner that the clothing we're stuck to will be damaged by piercing bullets
/datum/component/clothing_damaged_by_bullets/proc/on_examine(obj/item/source, mob/examiner, list/examine_list)
	SIGNAL_HANDLER

	examine_list += "<br>[span_warning("This will be <b>damaged</b> when it protects you from bullets, taking <b>[projectile_damage_multiplier/10]</b> times the damage that the bullet deals.")]"

/obj/item/clothing/suit/armor/vest/sacrificial
	name = "'Val' sacrificial ballistic vest"
	desc = "A hefty vest with a unique pattern of hexes on its outward faces. \
		As the 'sacrificial' name might imply, this vest has extremely high bullet protection \
		in exchange for allowing itself to be destroyed by impacts. It'll protect you from hell, \
		but only for so long."
	icon_state = "hexagon"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	body_parts_covered = CHEST|GROIN
	item_state = "armor"
	blood_overlay_type = "armor"
	armor = list(MELEE = 30, BULLET = 90, LASER = 10, ENERGY = 10, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 30, WOUND = 10) // When the level IV plates stop the bullet but not the energy transfer
	max_integrity = 200
	limb_integrity = 200

/obj/item/clothing/suit/armor/vest/sacrificial/Initialize(mapload)
	. = ..()

	AddComponent(/datum/component/clothing_damaged_by_bullets)

/obj/item/clothing/suit/armor/vest/sacrificial/examine_more(mob/user)
	. = ..()
	var/msg = "An extreme solution to an extreme problem. While many galactic armors have some semblance of self-repairing tech \
		in them to prevent the armor becoming useless after being shot enough, it does have its limits. Those limits tend to be \
		that the self-repairing, while handy, take the place of what could have simply been more armor. For a small market, \
		one that doesn't care if their armor lasts more than one gunfight, there exists a niche for armors such as the 'Val'. \
		Passing up self-repair for nigh-immunity to bullets, the right tool for a certain job, if you can find whatever that job may be."

	return list(span_notice("<i>[msg]</i>"))