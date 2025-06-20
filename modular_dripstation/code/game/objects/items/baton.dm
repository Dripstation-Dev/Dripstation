/obj/item/melee/baton
	var/item_state_updating = TRUE
	icon = 'modular_dripstation/icons/obj/weapons/security.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/security_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/security_righthand.dmi'

/obj/item/melee/baton/update_icon_state()
	if(item_state_updating)
		if(status)
			item_state = "[initial(item_state)]_active"
		else
			item_state = "[initial(item_state)]"
	..()

/obj/item/melee/baton/stunsword
	icon_state = "stunsword"
	item_state = "sword"
	slot_flags = null

/obj/item/melee/baton/stunsword/loaded
	preload_cell_type = /obj/item/stock_parts/cell/high

/obj/item/storage/belt/sabre/stunsword
	name = "security sheath"
	desc = "A statement on modern practical fashion; this limber black sheath is fitted to a lightened security belt, allowing one to look fashionable with their sword-shaped stun-baton, while of course carrying less things."
	icon_state = "secsheath"
	item_state = "security"
	icon = 'modular_dripstation/icons/obj/weapons/security.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/belt_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/belt_righthand.dmi'

/obj/item/storage/belt/sabre/stunsword/Initialize(mapload)
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 6
	STR.max_combined_w_class = 18
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.set_holdable(list(
		/obj/item/melee/baton/stunsword,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash/handheld,
		/obj/item/clothing/glasses,
		/obj/item/ammo_casing/shotgun,
		/obj/item/ammo_box,
		/obj/item/storage/box/rubbershot,
		/obj/item/storage/box/lethalshot,
		/obj/item/storage/box/breacherslug,
		/obj/item/storage/box/beanbag,
		/obj/item/reagent_containers/food/snacks/donut,
		/obj/item/kitchen/knife/combat,
		/obj/item/flashlight/seclite,
		/obj/item/radio,
		/obj/item/pinpointer/tracker,
		/obj/item/clothing/gloves,
		/obj/item/restraints/legcuffs/bola,
		/obj/item/gun/ballistic/revolver/tracking,
		/obj/item/holosign_creator/security,
		/obj/item/shield/riot/tele,
		/obj/item/barrier_taperoll/police
		))

/obj/item/storage/belt/sabre/stunsword/PopulateContents()
	SSwardrobe.provide_type(/obj/item/melee/baton/stunsword/loaded, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/sabre/stunsword/full/PopulateContents()
	SSwardrobe.provide_type(/obj/item/melee/baton/stunsword/loaded, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/spray/pepper, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/grenade/flashbang, src)
	SSwardrobe.provide_type(/obj/item/assembly/flash/handheld, src)
	SSwardrobe.provide_type(/obj/item/barrier_taperoll/police, src)
	update_appearance(UPDATE_ICON)

/obj/item/melee/baton/cattleprod
	icon = 'icons/obj/weapons/baton.dmi'
	item_state_updating = FALSE

/obj/item/melee/baton/cattleprod/tactical
	item_state_updating = FALSE

/obj/item/melee/baton/cattleprod/telecrystalprod
	name = "snatcherprod"
	desc = "A prod with a telecrystal on the end. It sparks with a desire for theft and subversion."
	w_class = WEIGHT_CLASS_NORMAL
	icon_state = "telecrystalprod"
	item_state = "telecrystalprod"
	icon = 'modular_dripstation/icons/obj/weapons/melee.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	slot_flags = null
	throw_hit_chance = 50 //I think it'd be funny

/obj/item/melee/baton/cattleprod/telecrystalprod/attack(mob/living/carbon/M, mob/living/carbon/user)//handles making things teleport when hit
	..()
	if(status && HAS_TRAIT(user, TRAIT_CLUMSY) && prob(50))
		user.visible_message(span_danger("[user] accidentally hits [user.p_them()]self with [src]!"), \
							span_userdanger("You accidentally hit yourself with [src]!"))
		if(do_teleport(src, get_turf(user), 50, channel = TELEPORT_CHANNEL_BLUESPACE)) //Wait, where did it go?
			SEND_SIGNAL(user, COMSIG_LIVING_MINOR_SHOCK)
			user.Paralyze(stunforce*3)
			deductcharge(hitcost)
		else
			SEND_SIGNAL(user, COMSIG_LIVING_MINOR_SHOCK)
			user.Paralyze(stunforce*3)
			deductcharge(hitcost/4)
		return
	else
		SEND_SIGNAL(M, COMSIG_LIVING_MINOR_SHOCK)
		var/obj/item/stuff_in_hand = M.get_active_held_item()
		if(!user || !stuff_in_hand || !M.temporarilyRemoveItemFromInventory(stuff_in_hand))
			return
		if(user.put_in_inactive_hand(stuff_in_hand))
			stuff_in_hand.loc.visible_message(span_warning("[stuff_in_hand] suddenly appears in [user]'s hand!"))
		else
			stuff_in_hand.forceMove(user.drop_location())
			stuff_in_hand.loc.visible_message(span_warning("[stuff_in_hand] suddenly appears!"))

/obj/item/melee/baton/cattleprod/attackby(obj/item/I, mob/user, params)//handles sticking a crystal onto a stunprod to make a teleprod
	if(istype(I, /obj/item/stack/ore/bluespace_crystal))
		if(!cell)
			var/obj/item/stack/ore/bluespace_crystal/BSC = I
			var/obj/item/melee/baton/cattleprod/teleprod/S = new /obj/item/melee/baton/cattleprod/teleprod
			remove_item_from_storage(user)
			qdel(src)
			BSC.use(1)
			user.put_in_hands(S)
			to_chat(user, span_notice("You place the bluespace crystal firmly into the igniter."))
		else
			user.visible_message(span_warning("You can't put the crystal onto the stunprod while it has a power cell installed!"))
	else if(istype(I, /obj/item/stack/telecrystal))
		if(!cell)
			var/obj/item/stack/telecrystal/TC = I
			var/obj/item/melee/baton/cattleprod/telecrystalprod/S = new /obj/item/melee/baton/cattleprod/telecrystalprod
			remove_item_from_storage(user)
			qdel(src)
			TC.use(1)
			user.put_in_hands(S)
			to_chat(user, span_notice("You place the telecrystal firmly into the igniter."))
		else
			user.visible_message(span_warning("You can't put the crystal onto the stunprod while it has a power cell installed!"))
	else
		return ..()

/obj/item/melee/shocker
	name = "disposable shocker"
	desc = "A non-lethal weapon capable of incapacitating any enemy within the range of an electric arc."
	icon_state = "shocker"
	item_state = "shocker"
	icon = 'modular_dripstation/icons/obj/weapons/security.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	force = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_SMALL
	///Active?
	var/status = FALSE
	///how many charges left
	var/charge = 1
	///how much stamina damage we deal per hit, this is combatted by energy armor
	var/stamina_damage = 30
	///how long a clown stuns themself for, or someone is stunned for if they are hit to >90 stamina damage
	var/stunforce = 4 SECONDS

/obj/item/melee/shocker/examine(mob/user)
	. = ..()
	if(status)
		. += span_notice("\The [src] is activated.")
	else
		. += span_warning("\The [src] is deactivated.")
	if(charge)
		. += span_notice("\The [src] is charged.")
	else
		. += span_warning("\The [src] is used.")

/obj/item/melee/baton/update_icon_state()
	. = ..()
	if(status)
		icon_state = "[initial(icon_state)]_active"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/melee/shocker/attack_self(mob/user)
	if(charge)
		status = !status
		to_chat(user, span_notice("[src] is now [status ? "on" : "off"]."))
		playsound(loc, "sparks", 75, 1, -1)
		do_sparks(1, TRUE, src)
	else
		status = FALSE
		to_chat(user, span_warning("[src] have it`s cell depleated!"))
	update_appearance(UPDATE_ICON)
	add_fingerprint(user)

/obj/item/melee/shocker/attack(mob/M, mob/living/carbon/human/user)
	if(charge && status && HAS_TRAIT(user, TRAIT_CLUMSY) && prob(50))
		user.visible_message(span_danger("[user] accidentally hits [user.p_them()]self with [src]!"), \
							span_userdanger("You accidentally hit yourself with [src]!"))
		user.Paralyze(stunforce*3)
		return
	if(!synth_check(user, SYNTH_RESTRICTED_WEAPON))
		return
	if(HAS_TRAIT(user, TRAIT_NO_STUN_WEAPONS))
		to_chat(user, span_warning("You can't seem to remember how this works!"))
		return
	if(iscyborg(M))
		..()
		return

	if(ishuman(M))
		var/mob/living/carbon/human/L = M
		var/datum/martial_art/A = L.check_block()
		if(A)
			A.handle_counter(L, user)
			return

//I hate myself
	if(charge)
		if(status)
			if(shocker_stun(M, user))
				user.do_attack_animation(M)
		else
			to_chat(user, span_danger("[src] isn`t active!"))
	else
		to_chat(user, span_danger("The cell is depleted!"))
	..()


/obj/item/melee/shocker/proc/shocker_stun(mob/living/L, mob/user)
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(H.check_shields(src, 0, "[user]'s [name]", MELEE_ATTACK)) //No message; check_shields() handles that
			playsound(L, 'sound/weapons/genhit.ogg', 50, 1)
			return 0

	var/obj/item/bodypart/affecting = L.get_bodypart(user? user.zone_selected : BODY_ZONE_CHEST)
	var/armor_block = L.run_armor_check(affecting, ENERGY) //check armor on the limb because that's where we are slapping...
	L.apply_damage(stamina_damage, STAMINA, BODY_ZONE_CHEST, armor_block) //...then deal damage to chest so we can't do the old hit-a-disabled-limb-200-times thing, batons are electrical not directed.
	
	
	if(isipc(L))
		var/datum/effect_system/spark_spread/s = new
		s.set_up(2, 1, L)
		s.start()

	SEND_SIGNAL(L, COMSIG_LIVING_MINOR_SHOCK)
	SEND_SIGNAL(L, COMSIG_ADD_MOOD_EVENT, "tased", /datum/mood_event/tased)
	var/current_actual_damage = L.getStaminaLoss() + L.getBruteLoss() + L.getFireLoss() + L.getOxyLoss()

	if(current_actual_damage >= 90)
		if(!L.IsParalyzed())
			to_chat(L, span_warning("You muscles seize, making you collapse!"))
		else
			L.Paralyze(stunforce)
		L.adjust_jitter(20 SECONDS)
		L.apply_effect(EFFECT_STUTTER, stunforce)
	else if(current_actual_damage > 70)
		L.adjust_jitter(10 SECONDS)
		L.apply_effect(10 SECONDS, EFFECT_KNOCKDOWN)
		L.apply_effect(EFFECT_STUTTER, stunforce)
	else if(current_actual_damage >= 20)
		L.adjust_jitter(5 SECONDS)
		L.apply_effect(5 SECONDS, EFFECT_KNOCKDOWN)
		L.apply_effect(EFFECT_STUTTER, stunforce)

	if(user)
		L.lastattacker = user.real_name
		L.lastattackerckey = user.ckey
		L.visible_message(span_danger("[user] has stunned [L] with [src]!"), \
								span_userdanger("[user] has stunned you with [src]!"))
		log_combat(user, L, "stunned")

	charge -= 1
	playsound(loc, 'modular_dripstation/sound/weapons/taser.ogg', 40, 0, -5)
	status = FALSE
	update_appearance(UPDATE_ICON)

	return TRUE

/obj/item/melee/shocker/emp_act(severity)
	. = ..()
	if (!(. & EMP_PROTECT_SELF))
		charge = 0