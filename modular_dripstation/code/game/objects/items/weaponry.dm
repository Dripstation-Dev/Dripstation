/obj/item/ectoplasm
	icon = 'modular_dripstation/icons/obj/wizard.dmi'

/obj/item/vibro_weapon
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	block_sound = 'modular_dripstation/sound/weapons/block/sound_weapons_parry.ogg'

/obj/item/melee/transforming/vib_blade 
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	block_sound = 'modular_dripstation/sound/weapons/block/sound_weapons_parry.ogg'
	w_class = WEIGHT_CLASS_SMALL
	w_class_on = WEIGHT_CLASS_NORMAL

/obj/item/energy_katana
	icon_state = "energy_katana"
	item_state = "energy_katana"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/weapons_on_belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	block_sound = 'modular_dripstation/sound/weapons/block/sound_weapons_block_blade.ogg'
	block_color = COLOR_GREEN

/obj/item/energy_katana/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_BELT)
		worn_icon = 'modular_dripstation/icons/mob/clothing/weapons_on_belt.dmi'
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
	worn_icon = 'modular_dripstation/icons/mob/clothing/weapons_on_belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	block_chance = 50
	var/block_projectile_mod = 0.5
	block_sound = 'modular_dripstation/sound/weapons/block/sound_weapons_parry.ogg'

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
		playsound(src, block_sound, 70, vary = TRUE)
		return 1
	return 0

/obj/item/katana/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_BELT)
		worn_icon = 'modular_dripstation/icons/mob/clothing/weapons_on_belt.dmi'
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
	worn_icon = 'modular_dripstation/icons/mob/clothing/weapons_on_belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	block_projectile_mod = 0	//too heavy

/obj/item/katana/cursed
	icon_state = "cursed"
	item_state = "cursed"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/weapons_on_belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	block_projectile_mod = 0.2	//curse uppon ya

/obj/item/katana/monomolecular
	name = "molecular katana"
	icon_state = "monomolecular"
	item_state = "monomolecular"
	desc = "An elegant weapon, its molecular edge is capable of cutting through flesh and bone with ease."
	block_chance = 40	//pretty hard 
	force = 35 	//not too deadly though
	block_projectile_mod = 1.5	// 60 projectile block chance
	armour_penetration = 75

/obj/item/katana/murasame
	name = "\improper Murasame"
	icon_state = "murasame"
	item_state = "murasame"
	desc = "Murasame is a katana whose blade is coated with poison, which nearly instantly kills its victim. As soon as the katana's blade pierces the skin, a deadly poison is injected into the victim's wound, killing him in a matter of seconds."
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
	worn_icon = 'modular_dripstation/icons/mob/clothing/weapons_on_belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'

/obj/item/toy/katana/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_BELT)
		worn_icon = 'modular_dripstation/icons/mob/clothing/weapons_on_belt.dmi'
	if(slot == ITEM_SLOT_BACK)
		worn_icon = 'modular_dripstation/icons/mob/clothing/back.dmi'
	//if(slot == ITEM_SLOT_SUITSTORE)
	//	worn_icon = 'modular_dripstation/icons/mob/clothing/suit_storage.dmi'
	update_appearance(UPDATE_ICON)

/obj/item/melee/sabre
	name = "officer's rapier"
	desc = "An elegant weapon, for a more civilized age. Ceremonial version issued to NanoTrasen finest."
	block_sound = 'modular_dripstation/sound/weapons/block/sound_weapons_parry.ogg'

/obj/item/storage/belt/sabre
	name = "rapier sheath"
	desc = "An ornate sheath designed to hold an officer's rapier."
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	hit_reaction_chance = 20
	block_sound = 'modular_dripstation/sound/weapons/block/sound_weapons_parry.ogg'

/obj/item/storage/belt/sabre/Initialize(mapload)
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.attack_hand_interact = FALSE

/obj/item/storage/belt/sabre/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(attack_type == MELEE_ATTACK && prob(hit_reaction_chance))
		owner.visible_message(span_danger("[owner] fends off [attack_text] with [src]!"))
		playsound(src, block_sound, 70, vary = TRUE)
		return 1
	return 0

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
	name = "\improper molecular NanoTrasen rapier"
	desc = "An elegant combat ready weapon of NanoTrasen finest, its molecular edge is capable of cutting through flesh and bone with ease."
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	icon_state = "monorapier"
	item_state = "monorapier"
	force = 30
	block_chance = 60
	armour_penetration = 100

/obj/item/storage/belt/sabre/mono
	name = "rapier sheath"
	desc = "An ornate sheath designed to preserve molecular edge of combat rapier."
	icon_state = "msheath"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/weapons_on_belt.dmi'

/obj/item/storage/belt/sabre/mono/PopulateContents()
	new /obj/item/melee/sabre/mono(src)
	update_appearance(UPDATE_ICON)

/obj/item/melee/sabre/syndie
	name = "\improper combat sabre"
	desc = "An elegant plastitanium combat ready weapon of pirate capitans, its edge is capable of cutting through flesh and bone with ease."
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	icon_state = "sabre"
	force = 30
	block_chance = 40
	armour_penetration = 30

/obj/item/storage/belt/sabre/syndie
	name = "sabre sheath"
	desc = "An red and black sheath designed to preserve edge of combat sabre."
	icon_state = "ssheath"
	item_state = "ssheath"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/weapons_on_belt.dmi'

/obj/item/storage/belt/sabre/syndie/PopulateContents()
	new /obj/item/melee/sabre/syndie(src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/sabre/cane
	name = "cane"
	desc = "A cane used by a true gentleman. Or a clown."
	icon = 'icons/obj/weapons/misc.dmi'
	icon_state = "canesheath"
	item_state = "stick"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	equip_sound = null
	force = 5
	throwforce = 5
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("bludgeoned", "whacked", "disciplined", "thrashed")

/obj/item/storage/belt/sabre/cane/Initialize(mapload)
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 1
	STR.rustle_sound = FALSE
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.set_holdable(list(
		/obj/item/melee/sabre/cane
		))


/obj/item/storage/belt/sabre/cane/PopulateContents()
	new /obj/item/melee/sabre/cane(src)
	update_appearance(UPDATE_ICON)

/obj/item/melee/sabre/cane
	name = "\improper stealth blade"
	desc = "An elegant plastitanium combat ready stealth blade, its edge isn`t that robust, but capable of hurting badly."
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	icon_state = "sabre"
	force = 20
	block_chance = 50
	armour_penetration = 20
	wound_bonus = -20
	bare_wound_bonus = 30

/obj/item/melee/ntrep_cane
	name = "\improper NanoTrasen Representative`s cane"
	desc = "A compact yet robust personal defense weapon."
	icon_state = "cane_nt"
	item_state = "cane_nt"
	icon = 'modular_dripstation/icons/obj/weapons/melee.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/weapons_on_belt.dmi'
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

/obj/item/melee/classic_baton/telescopic
	lefthand_file = 'modular_dripstation/icons/mob/inhands/security_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/security_righthand.dmi'
	item_state = "telebaton_0"
	on_item_state = "telebaton_1"

/obj/item/melee/classic_baton/telescopic/cane
	name = "telescopic cane"
	icon_state = "telecane"
	item_state = "telecane"
	on_icon_state = "telecane_active"
	off_icon_state = "telecane"
	on_item_state = "telecane_active"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	icon = 'modular_dripstation/icons/obj/weapons/melee.dmi'

/obj/item/melee/classic_baton/blc
	desc = "A rubber truncheon for beating criminal scum."
	icon_state = "baton_blc"
	item_state = "baton_blc"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/security_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/security_righthand.dmi'
	icon = 'modular_dripstation/icons/obj/weapons/security.dmi'


/obj/item/melee/baton/loaded/departmental
	name = "departmental stun baton"
	desc = "A stun baton fitted with a departmental area-lock, based off the station's blueprint layout - outside of its department, it only has three uses."
	icon = 'modular_dripstation/icons/obj/weapons/security.dmi'
	icon_state = "prison_baton"
	var/list/valid_areas = list()
	var/emagged = FALSE
	var/non_departmental_uses_left = 3

/obj/item/melee/baton/loaded/departmental/baton_stun(mob/living/target, mob/living/user, modifiers)
	if(status && !emagged && cooldown_check <= world.time)
		var/area/current_area = get_area(user)
		if(!is_type_in_list(current_area, valid_areas))
			if(non_departmental_uses_left)
				non_departmental_uses_left--
				if(non_departmental_uses_left)
					say("[non_departmental_uses_left] non-departmental uses left!")
				else
					say("[src] is out of non-departmental uses! Return to your department and reactivate the baton to refresh it!")
			else
				target.visible_message(span_warning("[user] prods [target] with [src]. Luckily, it shut off due to being in the wrong area."), \
					span_warning("[user] prods you with [src]. Luckily, it shut off due to being in the wrong area."))
				balloon_alert(user, "wrong department")
				attack_self()
				return TRUE
	. = ..()

/obj/item/melee/baton/loaded/departmental/attack_self(mob/user)
	. = ..()
	if(status) // just turned on
		var/area/current_area = get_area(user)
		if(!is_type_in_list(current_area, valid_areas))
			return
		if(non_departmental_uses_left < 3)
			say("Non-departmental uses refreshed!")
			non_departmental_uses_left = 3

/obj/item/melee/baton/loaded/departmental/emag_act(mob/user)
	if(!emagged)
		if(user)
			user.visible_message(span_warning("Sparks fly from [src]!"),
							span_warning("You scramble [src]'s departmental lock, allowing it to be used freely!"),
							span_hear("You hear a faint electrical spark."))
		balloon_alert(user, "emagged")
		playsound(src, SFX_SPARKS, 100, vary = TRUE, extrarange = SHORT_RANGE_SOUND_EXTRARANGE)
		do_sparks(3, cardinal_only = FALSE, source = src)
		obj_flags |= EMAGGED
		emagged = TRUE
		return TRUE
	return FALSE

/obj/item/melee/baton/loaded/departmental/cargo
	name = "cargo stun baton"
	desc = "A stun baton that doesn't operate outside of the Cargo department, based off the station's blueprint layout. Can be used outside of Cargo up to three times before needing to return!"
	icon_state = "cargo_baton"
	valid_areas = list(/area/quartermaster, /area/maintenance/department/cargo, /area/shuttle/escape, /area/shuttle/supply, /area/construction/storage_wing)

/obj/item/melee/baton/loaded/departmental/prison
	name = "prison stun baton"
	desc = "A stun baton that doesn't operate outside of the Prison, based off the station's blueprint layout. Can be used outside of the Prison up to three times before needing to return!"
	icon_state = "prison_baton"
	valid_areas = list(/area/security/prison, /area/security/processing, /area/security/execution, /area/shuttle/escape)

/obj/item/melee/hardlight_cane
	icon_state = "holocane"
	item_state = "holocane"
	w_class = WEIGHT_CLASS_NORMAL
	icon = 'modular_dripstation/icons/obj/weapons/melee.dmi'
	force = 0
	wound_bonus = -10
	bare_wound_bonus = 10
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
		w_class_on = WEIGHT_CLASS_BULKY, \
		attack_verb_on = list("cuted", "stabed", "slashed"), \
	)

/obj/item/melee/cultblade/dagger
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'

/obj/item/melee/emergency_forcing_tool
	name = "emergency forcing tool"
	desc = "Basic forcing tool, capable of prying firelocks or destroing stuff in critical situations."
	force = 20
	armour_penetration = -30
	throwforce = 5
	throw_range = 2
	throw_speed = 1
	toolspeed = 1.2
	demolition_mod = 2
	usesound = 'sound/items/jaws_pry.ogg'
	tool_behaviour = TOOL_MINING
	icon = 'modular_dripstation/icons/obj/weapons/melee.dmi'
	icon_state = "emergency_forcing_tool"
	item_state = "emergency_forcing_tool"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "sliced", "torn", "ripped", "diced")
	sharpness = SHARP_EDGED
	wound_bonus = -20
	bare_wound_bonus = 20

/obj/item/melee/emergency_forcing_tool/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(istype(target, /obj/structure/table))
		var/obj/structure/table/T = target
		T.deconstruct(FALSE)

	else if(istype(target, /obj/machinery/computer))
		var/obj/machinery/computer/C = target
		C.attack_alien(user) //muh copypasta

	else if(istype(target, /obj/machinery/door/airlock))
		var/obj/machinery/door/airlock/A = target

		if((!A.requiresID() || A.allowed(user)) && A.hasPower()) //This is to prevent stupid shit like hitting a door with an arm blade, the door opening because you have acces and still getting a "the airlocks motors resist our efforts to force it" message, power requirement is so this doesn't stop unpowered doors from being pried open if you have access
			return

		if(A.locked)
			to_chat(user, span_warning("The airlock's bolts prevent it from being forced!"))
			return
		if(A.welded)
			to_chat(user, span_warning("The airlock is welded shut, it won't budge!"))
			return

		if(A.hasPower())
			user.visible_message(span_warning("[user] jams [src] into the airlock and starts prying it open!"), span_warning("We start forcing the airlock open."), //yogs modified description
			span_italics("You hear a metal screeching sound."))
			playsound(A, 'sound/machines/airlock_alien_prying.ogg', 100, 1)
			if(!do_after(user, 6 SECONDS, A))
				return
		//user.say("Heeeeeeeeeerrre's Johnny!")
		user.visible_message(span_warning("[user] forces the airlock to open with [user.p_their()] [src]!"), span_warning("We force the airlock to open."), //yogs modified description
		span_italics("You hear a metal screeching sound."))
		A.open(2)

/obj/item/melee/emergency_forcing_tool/varyag
	name = "Varyag"
	desc = "Combat forcing tool, capable of prying firelocks, destroing stuff and killing someone in emergency situations."
	force = 30
	//w_class = WEIGHT_CLASS_NORMAL
	armour_penetration = 0
	wound_bonus = 0
	throwforce = 35
	throw_range = 7
	throw_speed = 2
	icon_state = "varyag"
	item_state = "varyag"

/obj/item/melee/emergency_forcing_tool/varyag/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 70, 100)

/obj/item/phone
	icon = 'modular_dripstation/icons/obj/misc.dmi'

/obj/item/access_kit
	icon = 'modular_dripstation/icons/obj/misc.dmi'
