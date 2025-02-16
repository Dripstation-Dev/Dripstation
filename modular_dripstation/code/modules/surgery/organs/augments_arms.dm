/obj/item/organ/cyberimp/arm/toolset
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "multitool_utility"

/obj/item/organ/cyberimp/arm/toolset/surgery
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "multitool_medical"

/obj/item/organ/cyberimp/arm/toolset/janitorial
	name = "janitor toolset implant"
	desc = "A set of janitor tools hidden behind a concealed panel on the user's arm."
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "multitool"
	contents = newlist(/obj/item/mop/advanced, /obj/item/soap, /obj/item/lightreplacer, /obj/item/holosign_creator, /obj/item/melee/flyswatter, /obj/item/reagent_containers/spray/cleaner)

/obj/item/organ/internal/cyberimp/arm/hacking
	name = "hacking arm implant"
	desc = "A small arm implant containing an advanced screwdriver, combat wrench and multitool designed for combat engineers and on-the-field machine modification."
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "multitool_syndicate"
	contents = newlist(/obj/item/screwdriver/nuke/hacking, /obj/item/wrench/combat, /obj/item/jawsoflife/syndicate, /obj/item/multitool/ai_detect/red)

/obj/item/organ/internal/cyberimp/arm/hacking/left
	zone = BODY_ZONE_L_ARM

/obj/item/screwdriver/nuke/hacking
	toolspeed = 0.33

/obj/item/organ/cyberimp/arm/esword
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "arm_energy"
	contents = newlist(/obj/item/melee/transforming/energy/blade/mantis)
	syndicate_implant = TRUE

/obj/item/organ/cyberimp/arm/esword/left
	zone = BODY_ZONE_L_ARM

/obj/item/melee/transforming/energy/blade/mantis
	icon_state = "mantis_esword"
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/augment_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/augment_righthand.dmi'

/obj/item/organ/cyberimp/arm/hardlight
	name = "arm-mounted hardlight blade"
	desc = "Combat arm with highly dangerous cybernetic implant that can project a deadly blade of concentrated energy."
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "arm_hardlight"
	contents = newlist(/obj/item/melee/transforming/energy/blade/hardlight)

/obj/item/melee/transforming/energy/blade/hardlight
	lefthand_file = 'modular_dripstation/icons/mob/inhands/augment_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/augment_righthand.dmi'

/obj/item/organ/cyberimp/arm/hardlight/left
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/hardlight/stealth
	syndicate_implant = TRUE

/obj/item/organ/cyberimp/arm/hardlight/stealth/left
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/medibeam
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "multitool_syndicatemedical"

/obj/item/organ/cyberimp/arm/flash
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "arm_flash"

/obj/item/organ/cyberimp/arm/flash/rev
	icon_state = "arm_revflash"

/obj/item/organ/cyberimp/arm/baton
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "arm_baton"

/obj/item/organ/cyberimp/arm/combat
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "multitool_combat"

/obj/item/organ/cyberimp/arm/syndie_mantis
	desc = "Modernized mantis blades designed and coined by Gorlex operatives. Energy actuators makes the blade a much deadlier weapon and provides protection."
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "mantis_syndicate"

/obj/item/organ/cyberimp/arm/syndie_mantis/left
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/nt_mantis
	name = "N.A.N.O. mantis blade implants"
	desc = "Retractable arm-blade implants to get you out of a pinch. This one provides extra armor penetration.  Wielding two will let you double-attack."
	contents = newlist(/obj/item/mantis/blade/NT)
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "mantis"

/obj/item/organ/cyberimp/arm/militech_mantis
	name = "H.E.P.H.A.E.S.T.U.S. mantis blade implants"
	desc = "Retractable arm-blade implants to get you out of a pinch. This one provides extra armor penetration, toolspeed and damage. Wielding two will let you double-attack."
	contents = newlist(/obj/item/mantis/blade/hepestus)
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "mantis_militech"

/obj/item/organ/cyberimp/arm/militech_mantis/left
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/blade
	name = "unbranded mantis blade implants"
	desc = "Retractable arm-blade implants to get you out of a pinch. Wielding two will let you double-attack."
	contents = newlist(/obj/item/mantis/blade)
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "mantis"

/obj/item/organ/cyberimp/arm/blade/left
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/shellguard_mantis
	name = "S.H.E.L.L. mantis blade implants"
	desc = "Retractable arm-blade implants to get you out of a pinch. This one provides extra protection and leaves more wounds. Wielding two will let you double-attack."
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "mantis_shellguard"
	contents = newlist(/obj/item/mantis/blade/shellguard)

/obj/item/organ/cyberimp/arm/shellguard_mantis/left
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/hfreq_mantis
	name = "N.A.N.O. HFR mantis blade implants"
	desc = "Retractable arm-blade implants to get you out of a pinch. This one provides best armor penetration. Wielding two will let you double-attack."
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "mantis_hfreq"
	contents = newlist(/obj/item/mantis/blade/hfreq)

/obj/item/organ/cyberimp/arm/hfreq_mantis/left
	zone = BODY_ZONE_L_ARM

/obj/item/mantis/blade
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/augment_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/augment_righthand.dmi'
	icon_state = "mantis"
	force = 16
	block_chance = 0
	var/block_projectile_mod = 0

/obj/item/mantis/blade/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
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

/obj/item/mantis/blade/NT
	name = "N.A.N.O. mantis blade"
	icon_state = "mantis"
	force = 18
	armour_penetration = 35

/obj/item/mantis/blade/hepestus
	name = "H.E.P.H.A.E.S.T.U.S. mantis blade"
	icon_state = "mantis_militech"
	force = 26	//kill people in a doubleclick when dualwielded, let`s f go
	armour_penetration = 35
	toolspeed = 0.2

/obj/item/mantis/blade/shellguard
	name = "S.H.E.L.L. mantis blade"
	icon_state = "mantis_shelg"
	force = 18
	block_chance = 35
	wound_bonus = 30

/obj/item/mantis/blade/hfreq
	name = "high frequency N.A.N.O. mantis blade"
	force = 18
	armour_penetration = 50
	block_chance = 20
	block_projectile_mod = 0.5
	icon_state = "mantis_hfreq"

/obj/item/mantis/blade/syndicate
	icon_state = "mantis_syndicate"
	force = 22
	toolspeed = 0.3
	block_chance = 20
	block_projectile_mod = 1

/obj/item/organ/cyberimp/arm/stechkin_implant
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "popout_stechkin"

/obj/item/gun/ballistic/automatic/pistol/implant
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "popout_stechkin"

/obj/item/organ/cyberimp/arm/shotgun_implant
	name = "pop-out shotgun"
	desc = "A galvanized steel mechanism that replaces most of the flesh below the elbow. Using the arm's natural range of motion as a hinge, it can be flicked open to reveal a 12-gauge shotgun with room for a single shell."
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "popout_shotgun"
	contents = newlist(/obj/item/gun/ballistic/shotgun/popout)
	syndicate_implant = TRUE

/obj/item/gun/ballistic/shotgun/popout
	name = "pop-out shotgun"
	desc = "A specialized 12-gauge shotgun concealed in the forearm. A deadly surprise."
	mag_type = /obj/item/ammo_box/magazine/internal/shot/popout
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "popout_shotgun"
	item_state = "popout_shotgun"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/augment_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/augment_righthand.dmi'
	semi_auto = TRUE
	casing_ejector = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT
	rack_sound_volume = 0
	w_class = WEIGHT_CLASS_HUGE
	force = 5
	slot_flags = null

/obj/item/ammo_box/magazine/internal/shot/popout
	name = "implant shotgun internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot/syndie
	max_ammo = 1

/obj/item/organ/cyberimp/arm/powerfist
	name = "powerfist implant"
	desc = "A military grade version of the powerfist placed inside of the forearm, allows for easy concealment."
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	icon_state = "powerfist"
	contents = newlist(/obj/item/melee/powerfist)
	syndicate_implant = TRUE

/obj/item/melee/powerfist
	name = "military powerfist"
	desc = "A military-grade metal gauntlet with a energy-powered fist to throw back enemies. Altclick to clamp it around your hand, use it to change power settings and screwdriver to pop out the cell."
	icon_state = "powerfist"
	item_state = "powerfist"
	icon = 'modular_dripstation/icons/obj/augment.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/augment_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/augment_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	force = 15
	wound_bonus = 5
	armour_penetration = 35
	attack_verb = list("smashed", "rammed", "power-fisted")
	var/obj/item/stock_parts/cell/cell
	///the higher the power level the harder it hits
	var/setting = 1

/obj/item/melee/powerfist/Destroy()
	if(cell)
		QDEL_NULL(cell)
	return ..()

/obj/item/melee/powerfist/examine(user)
	. = ..()
	. += "It's power setting is set to [setting]."
	if(cell)
		. += "It has [cell.charge] power remaining."
	else
		. += "There is no cell installed!"

/obj/item/melee/powerfist/attack_self(mob/user)
	. = ..()
	if(setting == 3)
		setting = 1
	else
		setting += 1
	balloon_alert(user, "Power level [setting].")

/obj/item/melee/powerfist/AltClick(mob/user)
	if(!can_interact(user))
		return ..()
	if(!ishuman(user))
		return ..()
	if(!(user.is_holding(src)))
		return ..()

	if(!HAS_TRAIT(src, TRAIT_NODROP))
		ADD_TRAIT(src, TRAIT_NODROP, HAND_REPLACEMENT_TRAIT)
		to_chat(user, span_warning("You feel the [src] clamp shut around your hand!"))
		playsound(user, 'modular_dripstation/sound/weapons/tgmc/fistclamp.ogg', 25, 1, 7)
	else
		REMOVE_TRAIT(src, TRAIT_NODROP, HAND_REPLACEMENT_TRAIT)
		to_chat(user, span_notice("You feel the [src] loosen around your hand!"))
		playsound(user, 'modular_dripstation/sound/weapons/tgmc/fistunclamp.ogg', 25, 1, 7)



/obj/item/melee/powerfist/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!cell)
		to_chat(user, span_warning("\The [src] can't operate without a source of power!"))
		return

	var/powerused = setting * 1000
	if(powerused >= cell.charge)
		to_chat(user, span_warning("\The [src]'s cell doesn't have enough power!"))
		M.apply_damage((force/3), BRUTE)
		playsound(loc, 'sound/weapons/punch1.ogg', 50, TRUE)
		M.visible_message(span_danger("[user]'s powerfist lets out a dull thunk as they punch [M.name]!"), \
			span_userdanger("[user] punches you!"))
		return ..()
	M.apply_damage(force * setting, BRUTE, wound_bonus = wound_bonus * setting)
	M.visible_message(span_danger("[user]'s powerfist shudders as they punch [M.name], flinging them away!"), \
		span_userdanger("You [user]'s punch flings you backwards!"))
	playsound(loc, 'modular_dripstation/sound/weapons/tgmc/energy_blast.ogg', 50, TRUE)
	playsound(loc, 'sound/weapons/genhit2.ogg', 50, TRUE)
	var/atom/throw_target = get_edge_target_turf(M, get_dir(src, get_step_away(M, src)))
	var/throw_distance = setting * LERP(5 , 2, M.mob_size / MOB_SIZE_LARGE)
	M.throw_at(throw_target, throw_distance, 0.5 + (setting / 2))
	cell.charge -= powerused
	return ..()

/obj/item/melee/powerfist/attackby(obj/item/I, mob/user, params)
	if(!istype(I, /obj/item/stock_parts/cell))
		return ..()
	if(!istype(I, /obj/item/stock_parts/cell))	///obj/item/stock_parts/cell/gun - when implemented
		to_chat(user, span_warning("The powerfist only accepts gun cells!"))
		return
	if(cell)
		unload(user)
	user.transferItemToLoc(I,src)
	cell = I
	to_chat(user, span_notice("You insert the [I] into the [src]."))
	update_appearance(UPDATE_OVERLAYS)

/obj/item/melee/powerfist/screwdriver_act(mob/living/user, obj/item/I)
	if(..())
		return TRUE
	if(!cell)
		to_chat(user, span_notice("There is no cell installed!"))
		return TRUE
	unload(user)
	to_chat(user, span_notice("You pop open the cover and remove the cell."))
	update_appearance(UPDATE_OVERLAYS)
	return TRUE

/// Remove the cell from the powerfist
/obj/item/melee/powerfist/proc/unload(mob/user)
	user.dropItemToGround(cell)
	cell = null
	playsound(user, 'modular_dripstation/sound/weapons/tgmc/rifle_reload.ogg', 25, TRUE)

/obj/item/melee/powerfist/update_overlays()
	. = ..()
	if(cell)
		. += "[initial(icon_state)]_cell"
