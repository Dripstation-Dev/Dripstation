/obj/item/ectoplasm
	icon = 'modular_dripstation/icons/obj/wizard.dmi'

/obj/item/vibro_weapon
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'

/obj/item/melee/transforming/vib_blade 
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'

/obj/item/energy_katana
	icon_state = "energy_katana"
	item_state = "energy_katana"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'

/obj/item/energy_katana/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_BELT)
		worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	if(slot == ITEM_SLOT_BACK)
		worn_icon = 'modular_dripstation/icons/mob/clothing/back.dmi'
	//if(slot == ITEM_SLOT_SUITSTORE)
	//	worn_icon = 'modular_dripstation/icons/mob/clothing/suit_storage.dmi'
	update_appearance(UPDATE_ICON)

/obj/item/katana
	name = "modern katana"
	desc = "Modern recreation of ancient terran weapon, capable to slice through variety of materials."
	icon_state = "modern_katana"
	item_state = "modern_katana"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	block_chance = 50
	var/block_projectile_mod = 0.5

/obj/item/katana/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(attack_type == PROJECTILE_ATTACK)
		final_block_chance = block_chance*block_projectile_mod //Pretty good...
	if(prob(final_block_chance))
		if(istype(hitby, /obj/projectile/bullet))
			owner.visible_message(span_danger("[attack_text] hits [owner]'s [src], while he cuts the air, splitting the bullet in half!"))
		else if(istype(hitby, /obj/projectile))
			var/obj/projectile/hit = hitby
			if(hit.hitscan)
				owner.visible_message(span_danger("[attack_text] hits [owner]'s [src], and he mirrors it back!"))
		else
			owner.visible_message(span_danger("[owner] blocks [attack_text] with [src]!"))
		return 1
	return 0

/obj/item/katana/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_BELT)
		worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	if(slot == ITEM_SLOT_BACK)
		worn_icon = 'modular_dripstation/icons/mob/clothing/back.dmi'
	//if(slot == ITEM_SLOT_SUITSTORE)
	//	worn_icon = 'modular_dripstation/icons/mob/clothing/suit_storage.dmi'
	update_appearance(UPDATE_ICON)

/obj/item/katana/bloody
	name = "bloody katana"
	desc = "Modern katana covered in blood. And thirsts for even more of it..."
	icon_state = "bloody_katana"
	item_state = "bloody_katana"
	slot_flags = null
	block_projectile_mod = 1	//here for more

/obj/item/katana/basalt
	icon_state = "basalt_katana"
	item_state = "basalt_katana"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	block_projectile_mod = 0	//too heavy

/obj/item/katana/cursed
	icon_state = "cursed"
	item_state = "cursed"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	block_projectile_mod = 0.2	//curse uppon ya

/obj/item/katana/monomolecular
	name = "monomolecular katana"
	icon_state = "monomolecular"
	item_state = "monomolecular"
	desc = "An elegant weapon, its monomolecular edge is capable of cutting through flesh and bone with ease."
	block_chance = 40
	armour_penetration = 75

/obj/item/katana/murasame/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(istype(hitby, /obj/projectile/bullet) && prob(final_block_chance))
		if(istype(hitby, /obj/projectile/bullet))
			owner.visible_message(span_danger("[attack_text] hits [owner]'s [src], while he cuts the air, splitting the bullet in half!"))
			return 1
	return 0

/obj/item/katana/murasame
	name = "\improper Murasame"
	icon_state = "murasame"
	item_state = "murasame"
	desc = "Murasame is a sword whose blade is coated with poison, which nearly instantly kills its victim. As soon as the blade's blade pierces the skin, a deadly poison is injected into the victim's wound, killing him in a matter of seconds."
	block_chance = 50
	armour_penetration = 40
	var/next_blow
	var/death_imminent = FALSE
	var/mob/living/death_wisher = null

/obj/item/katana/murasame/afterattack(atom/target, blocked)
	. = ..()
	if((blocked != 100) && iscarbon(target))
		var/mob/living/carbon/victim = target
		victim.reagents.add_reagent(/datum/reagent/toxin/ambusher_toxin, 5)
		victim.reagents.add_reagent(/datum/reagent/toxin/amanitin, 5)
		victim.reagents.add_reagent(/datum/reagent/toxin/initropidril, 5)
		victim.reagents.add_reagent(/datum/reagent/toxin/cyanide, 5)
		victim.reagents.add_reagent(/datum/reagent/toxin/venom, 5)
		victim.reagents.add_reagent(/datum/reagent/toxin/acid/fluacid, 5)

/obj/item/katana/murasame/attack_self(mob/living/user)
	if(world.time > next_blow && (istype(user, death_wisher)|| !death_wisher))
		balloon_alert(user, "you starting to cut yourself with [src]!")
		if(do_after(user, 0.5 SECONDS, src))
			to_chat(user, span_notice("You feel a sudden surge of energy!"))
			user.adjustStaminaLoss(-60)
			user.adjustBruteLoss(-40)
			user.adjustFireLoss(-40)
			user.reagents.add_reagent(/datum/reagent/medicine/stimulants, 10)
			if (!death_imminent)
				death_imminent = TRUE
				death_wisher = user
				addtimer(CALLBACK(src, PROC_REF(user_death), death_wisher), 30 SECONDS)
				return
			else
				next_blow = world.time + 5 SECONDS
				return
		else
			balloon_alert(user, "interrupted!")
			return
	else
		to_chat(user, span_notice("You catch your breath and can`s blow yourself now!"))

/obj/item/katana/murasame/proc/user_death(mob/living/user)
	user.reagents.add_reagent(/datum/reagent/toxin/cyanide, 5)
	user.reagents.add_reagent(/datum/reagent/toxin/venom, 5)
	sleep(10 SECONDS)
	user.adjustToxLoss(200)
	death_imminent = FALSE
	death_wisher = null

/obj/item/toy/katana
	icon_state = "modern_katana"
	item_state = "modern_katana"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'

/obj/item/toy/katana/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_BELT)
		worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	if(slot == ITEM_SLOT_BACK)
		worn_icon = 'modular_dripstation/icons/mob/clothing/back.dmi'
	//if(slot == ITEM_SLOT_SUITSTORE)
	//	worn_icon = 'modular_dripstation/icons/mob/clothing/suit_storage.dmi'
	update_appearance(UPDATE_ICON)

/obj/item/melee/sabre
	name = "officer's rapier"
	desc = "An elegant weapon, for a more civilized age. Ceremonial version issued to NanoTrasen finest."

/obj/item/storage/belt/sabre
	name = "rapier sheath"
	desc = "An ornate sheath designed to hold an officer's rapier."

/obj/item/storage/belt/sabre/AltClick(mob/user)
	if(!iscarbon(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	if(length(contents))
		var/obj/item/I = contents[1]
		user.visible_message("[user] takes [I] out of [src].", span_notice("You take [I] out of [src]."))
		user.put_in_hands(I)
		playsound(I, 'sound/items/unsheath.ogg', 25, TRUE)
		update_appearance(UPDATE_ICON)
	else
		to_chat(user, "[src] is empty.")

/obj/item/melee/sabre/mono
	name = "\improper monomolecular NanoTrasen rapier"
	desc = "An elegant combat ready weapon of NanoTrasen finest, its monomolecular edge is capable of cutting through flesh and bone with ease."
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	icon_state = "rapier"
	force = 30
	block_chance = 60
	armour_penetration = 100

/obj/item/storage/belt/sabre/mono
	name = "rapier sheath"
	desc = "An ornate sheath designed to preserve monomolecular edge of combat rapier."

/obj/item/storage/belt/sabre/mono/PopulateContents()
	new /obj/item/melee/sabre/mono(src)
	update_appearance(UPDATE_ICON)


/obj/item/melee/ntrep_cane
	name = "\improper NanoTrasen Representative`s cane"
	desc = "A compact yet robust personal defense weapon."
	icon_state = "cane_nt"
	item_state = "cane_nt"
	icon = 'modular_dripstation/icons/obj/weapons/melee.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	var/cooldown = 1.5 SECONDS
	var/on = FALSE

	var/on_item_state = "cane_nt_active"
	var/force_on = 3
	var/force_off = 7
	var/stamina_damage = 35
	var/block_threshold = 40
	bare_wound_bonus = 10

	var/on_stun_sound = "sound/effects/woodhit.ogg" // Default path to sound for when we stun.
	var/knockdown_time_carbon = 1.5 SECONDS // Knockdown length for carbons.
	var/cooldown_check = 0
	///how long a clown stuns themself for, or someone is stunned for if they are hit to >90 stamina damage
	var/stunforce = 10 SECONDS
	///how much stamina damage we deal per hit, this is combatted by energy armor
	var/stamina_damage_on = 70
	///the cell used by the baton
	var/obj/item/stock_parts/cell/cell
	///how much charge is deducted from the cell when we slap someone while on
	var/hitcost = 1000
	///% chance we hit someone with the correct side of the baton when thrown
	var/throw_hit_chance = 35
	///if not empty the baton starts with this type of cell
	var/preload_cell_type
	///used for passive discharge
	var/cell_last_used = 0

// Description for when turning their baton "on"
/obj/item/melee/ntrep_cane/proc/get_on_description()
	. = list()

	.["local_on"] = span_danger("You activate the hidden function of the cane.")
	.["local_off"] = span_danger("You deactivate your cane.")

	return .

/obj/item/melee/ntrep_cane/get_cell()
	return cell

/obj/item/melee/ntrep_cane/Initialize(mapload)
	. = ..()
	if(preload_cell_type)
		if(!ispath(preload_cell_type,/obj/item/stock_parts/cell))
			log_mapping("[src] at [AREACOORD(src)] had an invalid preload_cell_type: [preload_cell_type].")
		else
			cell = new preload_cell_type(src)
	update_appearance(UPDATE_ICON)

/obj/item/melee/ntrep_cane/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(..())
		return
	//Only mob/living types have stun handling
	if(on && prob(throw_hit_chance) && iscarbon(hit_atom))
		baton_stun(hit_atom)

/obj/item/melee/ntrep_cane/loaded //this one starts with a cell pre-installed.
	preload_cell_type = /obj/item/stock_parts/cell/high

/obj/item/melee/ntrep_cane/proc/deductcharge(chrgdeductamt)
	if(cell)
		//Note this value returned is significant, as it will determine
		//if a stun is applied or not
		var/mob/living/M = loc
		if(M && iscyborg(M)) 
			var/mob/living/silicon/robot/R = loc
			R.cell.use(chrgdeductamt)
		else
			. = cell.use(chrgdeductamt)
		if(on && cell.charge < hitcost)
			//we're below minimum, turn off
			on = FALSE
			update_appearance(UPDATE_ICON)
			playsound(loc, "sparks", 75, 1, -1)
			STOP_PROCESSING(SSobj, src) // no more charge? stop checking for discharge

/obj/item/melee/ntrep_cane/update_icon_state()
	. = ..()
	if(on)
		icon_state = "[initial(icon_state)]_active"
	else if(!cell)
		icon_state = "[initial(icon_state)]_nocell"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/melee/ntrep_cane/process()
	if(on)
		++cell_last_used // Will discharge in 13 processes if it is not turned off
		if(cell_last_used >= STUNBATON_DISCHARGE_INTERVAL)
			deductcharge(500)
			cell_last_used = 6 // Will discharge again in 7 processes if it is not turned off

/obj/item/melee/ntrep_cane/examine(mob/user)
	. = ..()
	if(cell)
		. += span_notice("\The [src] is [round(cell.percent())]% charged.")
	else
		. += span_warning("\The [src] does not have a power source installed.")

/obj/item/melee/ntrep_cane/suicide_act(mob/user)
	if(on)
		user.visible_message(span_suicide("[user] is putting the live [name] in [user.p_their()] mouth! It looks like [user.p_theyre()] trying to commit suicide!"))
		return FIRELOSS
	user.visible_message(span_suicide("[user] is putting the [name] in [user.p_their()] mouth! But forgot to turn the [name] on."))
	return SHAME

/obj/item/melee/ntrep_cane/attack_self(mob/user)
	if(cell && cell.charge > hitcost)
		var/list/desc = get_on_description()
		on = !on
		playsound(loc, "sparks", 75, 1, -1)
		cell_last_used = 0
		if(on)
			to_chat(user, desc["local_on"])
			item_state = on_item_state
			force = force_on
			stamina_damage = stamina_damage_on
			attack_verb = list("beaten")
			START_PROCESSING(SSobj, src)
		else
			to_chat(user, desc["local_off"])
			item_state = initial(item_state)
			force = force_off
			stamina_damage = initial(stamina_damage)
			attack_verb = list("smacked", "struck", "cracked", "robusted")
			STOP_PROCESSING(SSobj, src)
		to_chat(user, span_notice("[src] is now [on ? "on" : "off"]."))
	else
		on = FALSE
		item_state = initial(item_state)
		force = force_off
		stamina_damage = initial(stamina_damage)
		attack_verb = list("smacked", "struck", "cracked", "robusted")
		if(!cell)
			to_chat(user, span_warning("[src] does not have a power source!"))
		else
			to_chat(user, span_warning("[src] is out of charge."))
	update_appearance(UPDATE_ICON)
	add_fingerprint(user)

/obj/item/melee/ntrep_cane/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/stock_parts/cell))
		var/obj/item/stock_parts/cell/C = W
		if(cell)
			to_chat(user, span_notice("[src] already has a cell."))
		else
			if(C.maxcharge < hitcost)
				to_chat(user, span_notice("[src] requires a higher capacity cell."))
				return
			if(!user.transferItemToLoc(W, src))
				return
			cell = W
			to_chat(user, span_notice("You install a cell in [src]."))
			update_appearance(UPDATE_ICON)
	else if(W.tool_behaviour == TOOL_SCREWDRIVER)
		if(cell)
			cell.update_appearance(UPDATE_ICON)
			cell.forceMove(get_turf(src))
			cell = null
			to_chat(user, span_notice("You remove the cell from [src]."))
			on = FALSE
			STOP_PROCESSING(SSobj, src) // no cell, no charge; stop processing for on because it cant be on
			update_appearance(UPDATE_ICON)
	else
		return ..()

/obj/item/melee/ntrep_cane/attack(mob/living/target, mob/living/user)
	if(HAS_TRAIT(user, TRAIT_NO_STUN_WEAPONS))
		to_chat(user, span_warning("You can't seem to remember how this works!"))
		return
	add_fingerprint(user)
	if((HAS_TRAIT(user, TRAIT_CLUMSY)) && prob(50))
		to_chat(user, "<span class ='danger'>You hit yourself over the head.</span>")
		user.Paralyze(knockdown_time_carbon * force)
		user.adjustStaminaLoss(stamina_damage)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.apply_damage(2*force, BRUTE, BODY_ZONE_HEAD)
		else
			user.take_bodypart_damage(2*force)
		return
	if(iscyborg(target))
		..()
		return
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if (H.check_shields(src, 0, "[user]'s [name]", MELEE_ATTACK))
			playsound(target, 'sound/weapons/genhit.ogg', 50, 1)
			return
		var/datum/martial_art/M = H.check_block()
		if(M)
			M.handle_counter(target, user)
			return
	if(!isliving(target))
		return
	if (user.a_intent == INTENT_HARM)
		if(!..())
			return
		if(!iscyborg(target))
			return
	else
		if(cooldown_check <= world.time)
			user.do_attack_animation(target)
			if(!on)
				stun(target, user)
			else
				baton_stun(target, user)
		else
			var/wait_desc = get_wait_description()
			if (wait_desc)
				to_chat(user, wait_desc)

/obj/item/melee/ntrep_cane/proc/get_wait_description()
	if(!on)
		return span_danger("You are too exosted to do that!")
	else
		return span_danger("The cane is still charging!")

/obj/item/melee/ntrep_cane/proc/stun(mob/living/target, mob/living/user)
	var/list/desc = get_hit_description(target, user)

	var/obj/item/bodypart/affecting = target.get_bodypart(user.zone_selected)
	var/armor_block = target.run_armor_check(affecting, MELEE)
	target.apply_damage(stamina_damage, STAMINA, user.zone_selected, armor_block)
	var/current_stamina_damage = target.getStaminaLoss()

	if(user)
		target.lastattacker = user.real_name
		target.lastattackerckey = user.ckey
		log_combat(user, target, "stunned")

	playsound(get_turf(src), on_stun_sound, 75, 1, -1)

	if(current_stamina_damage >= 100)
		desc = get_stun_description(target, user)
		target.Knockdown(knockdown_time_carbon)
		target.visible_message(desc["visible"], desc["local"])
		return

	if(armor_block >= block_threshold)
		target.visible_message(desc["visible"], desc["local"])
		playsound(target, 'sound/weapons/genhit.ogg', 50, 1)
		return

	// Special effects
	if(affecting?.stamina_dam >= 50 && (istype(affecting, /obj/item/bodypart/l_leg) || istype(affecting, /obj/item/bodypart/r_leg)))
		desc = get_stun_description(target, user)
		target.Knockdown(knockdown_time_carbon)

	else if(istype(affecting, /obj/item/bodypart/l_arm) && target.held_items[LEFT_HANDS])
		target.dropItemToGround(target.held_items[LEFT_HANDS])
	else if(istype(affecting, /obj/item/bodypart/r_arm) && target.held_items[RIGHT_HANDS])
		target.dropItemToGround(target.held_items[RIGHT_HANDS])
	target.visible_message(desc["visible"], desc["local"])

// Default message for stunning mob.
/obj/item/melee/ntrep_cane/proc/get_stun_description(mob/living/target, mob/living/user)
	. = list()

	.["visible"] =  span_danger("[user] has knocked down [target] with [src]!")
	.["local"] = span_danger("[user] has knocked down [target] with [src]!")

	return .

// Default message for hitting mob.
/obj/item/melee/ntrep_cane/proc/get_hit_description(mob/living/target, mob/living/user)
	. = list()

	.["visible"] =  span_danger("[user] struck [target] with [src]!")
	.["local"] = span_danger("[user] struck [target] with [src]!")

	return .

/obj/item/melee/ntrep_cane/proc/baton_stun(mob/living/L, mob/user)
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(H.check_shields(src, 0, "[user]'s [name]", MELEE_ATTACK)) //No message; check_shields() handles that
			playsound(L, 'sound/weapons/genhit.ogg', 50, 1)
			return 0
	if(iscyborg(loc))
		var/mob/living/silicon/robot/R = loc
		if(!R || !R.cell || !R.cell.use(hitcost))
			return FALSE
	else
		if(!deductcharge(hitcost))
			return FALSE

	var/obj/item/bodypart/affecting = L.get_bodypart(user? user.zone_selected : BODY_ZONE_CHEST)
	var/armor_block = L.run_armor_check(affecting, ENERGY) //check armor on the limb because that's where we are slapping...
	L.apply_damage(stamina_damage, STAMINA, BODY_ZONE_CHEST, armor_block) //...then deal damage to chest so we can't do the old hit-a-disabled-limb-200-times thing, batons are electrical not directed.
	
	
	SEND_SIGNAL(L, COMSIG_LIVING_MINOR_SHOCK)
	var/current_stamina_damage = L.getStaminaLoss()

	if(current_stamina_damage >= 90)
		if(!L.IsParalyzed())
			to_chat(L, span_warning("You muscles seize, making you collapse!"))
		else
			L.Paralyze(stunforce)
		L.adjust_jitter(20 SECONDS)
		L.apply_effect(EFFECT_STUTTER, stunforce)
	else if(current_stamina_damage > 70)
		L.adjust_jitter(10 SECONDS)
		L.apply_effect(EFFECT_STUTTER, stunforce)
	else if(current_stamina_damage >= 20)
		L.adjust_jitter(5 SECONDS)
		L.apply_effect(EFFECT_STUTTER, stunforce)

	if(user)
		L.lastattacker = user.real_name
		L.lastattackerckey = user.ckey
		L.visible_message(span_danger("[user] has stunned [L] with [src]!"), \
								span_userdanger("[user] has stunned you with [src]!"))
		log_combat(user, L, "stunned")

	playsound(loc, 'sound/weapons/egloves.ogg', 50, 1, -1)

	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.forcesay(GLOB.hit_appends)

	cooldown_check = world.time + cooldown

	return TRUE

/obj/item/melee/ntrep_cane/emp_act(severity)
	. = ..()
	if (!(. & EMP_PROTECT_SELF))
		deductcharge(100 * severity)

/obj/item/melee/classic_baton/telescopic/cane
	icon_state = "telecane"
	item_state = "telecane"
	on_icon_state = "telecane_active"
	off_icon_state = "telecane"
	on_item_state = "telecane_active"

/obj/item/melee/hardlight_cane
	icon_state = "holocane"
	item_state = "holocane"
	force = 0
	attack_verb = list("hit", "poked")

/obj/item/melee/hardlight_cane/Initialize(mapload)
	. = ..()

	AddComponent( \
		/datum/component/transforming, \
		force_on = 20, \
		throwforce_on = 18, \
		throw_speed_on = throw_speed, \
		sharpness_on = SHARP_EDGED, \
		hitsound_on = 'sound/weapons/bladeslice.ogg', \
		w_class_on = WEIGHT_CLASS_NORMAL, \
		attack_verb_on = list("cuted", "stabed", "slashed"), \
	)

/obj/item/phone
	icon = 'modular_dripstation/icons/obj/misc.dmi'

/obj/item/access_kit
	icon = 'modular_dripstation/icons/obj/misc.dmi'
