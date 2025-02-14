#define SPECIALIST_STARLING "Security Technician Replika"
#define ENGINEER_ARAR "Repair Worker Replika"

#define CONSCIOUSAY(text) if(H.stat == CONSCIOUS) { ##text }

/obj/item/organ/brain/positron/replica
	name = "replika brain"
	desc = "A piece of juicy meat with chips found in a replika's head."
	zone = BODY_ZONE_HEAD
	icon = 'modular_dripstation/icons/obj/surgery.dmi'
	icon_state = "replicabrain"
	compatible_biotypes = MOB_INORGANIC // do not incert in IPC, really

/obj/item/organ/cyberimp/brain/replica_controller
	name = "CNS Behavior Controller implant"
	desc = "This implant will automatically monitor and repair behavior issues."
	implant_color = "#333640"
	var/mindshield_status = TRUE
	slot = ORGAN_SLOT_BRAIN_IMPLANT
	compatible_biotypes = MOB_INORGANIC // IT`S REPLIKA`S, DO NOT INCERT IN HUMANS
	//var/mulfunction_duration = 4 SECONDS

/obj/item/organ/cyberimp/brain/replica_controller/syndicate/Initialize(mapload)
	. = ..()
	if(obj_flags & EMAGGED)
		return FALSE
	obj_flags |= EMAGGED

/obj/item/organ/cyberimp/brain/replica_controller/attack_self(mob/user)
	mindshield_status = !mindshield_status

/obj/item/organ/cyberimp/brain/replica_controller/Insert(mob/target, special, drop_if_replaced)
	. = ..()
	if(mindshield_status)
		ADD_TRAIT(target, TRAIT_MINDSHIELD, "replica")

/obj/item/organ/cyberimp/brain/replica_controller/Remove(mob/target, silent = FALSE, special = 0)
	if(..())
		if(isliving(target) && mindshield_status)
			var/mob/living/L = target
			REMOVE_TRAIT(L, TRAIT_MINDSHIELD, "replica")

/*
/obj/item/organ/cyberimp/brain/replica_controller/emp_act(severity)
	. = ..()
	if((organ_flags & ORGAN_FAILING) || . & EMP_PROTECT_SELF)
		return
	organ_flags |= ORGAN_FAILING
	REMOVE_TRAIT(L, TRAIT_MINDSHIELD, "replica")
	addtimer(CALLBACK(src, PROC_REF(reboot), ), mulfunction_duration * (severity))

/obj/item/organ/cyberimp/brain/anti_stun/proc/reboot()
	organ_flags &= ~ORGAN_FAILING
	ADD_TRAIT(target, TRAIT_MINDSHIELD, "replica")
*/

/obj/item/organ/cyberimp/brain/replica_controller/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(obj_flags & EMAGGED)
		return FALSE
	obj_flags |= EMAGGED
	log_game("[key_name(user)] emagged [src] at [AREACOORD(src)]")
	playsound(src, "sparks", 50, TRUE)
	return TRUE

/obj/item/organ/stomach/cell/preternis/replica
	name = "replika cell-stomach"

/obj/item/organ/lungs/replica
	name = "advanced cooling biocomponent"
	desc = "A bioradiator in the shape of a lung, that uses advanced cooling to protect biocomponents from overheat."
	icon_state = "lungs-c"
	organ_flags = ORGAN_SYNTHETIC
	compatible_biotypes = MOB_INORGANIC // do not incert in IPC, really
	status = ORGAN_ROBOTIC

/obj/item/organ/lungs/replica/check_breath(datum/gas_mixture/breath, mob/living/carbon/human/H)
	if(HAS_TRAIT(H, TRAIT_NOBREATH))
		return
	else
		H.adjustOxyLoss(HUMAN_MAX_OXYLOSS)
		H.failed_last_breath = TRUE

/obj/item/organ/lungs/replica/handle_helium_speech(owner, list/speech_args)
	return FALSE

/obj/item/organ/eyes/robotic/preternis/replica
	name = "replika eyes"
	desc = "Advanced robotic eyes that can see in the dark."
	
	flash_protect = 1

	low_threshold_passed = span_info("Your replika eyes switch to battery saver mode.")
	high_threshold_passed = span_info("Your replika eyes only show a sliver of battery life left!")
	now_failing = span_warning("An empty battery icon is all you can see as your eyes shut off!")
	now_fixed = span_info("Lines of text scroll in your vision as your eyes begin rebooting.")
	high_threshold_cleared = span_info("Your replika eyes have recharged enough to re-enable most functionality.")
	low_threshold_cleared = span_info("Your replika eyes have almost fully recharged.")

/obj/item/organ/eyes/robotic/preternis/replica/nv_on()
	. = ..()
	flash_protect = 0

/obj/item/organ/eyes/robotic/preternis/replica/nv_off()
	. = ..()
	flash_protect = 1

/obj/item/organ/cyberimp/chest/replica
	name = "replika`s coverings"
	desc = "Chest protection. Defends vulnerable biocomponents from harm."
	compatible_biotypes = MOB_INORGANIC
	slot = ORGAN_SLOT_TORSO_IMPLANT
	icon_state = "imp_jetpack-on"
	// Used to store a list of all items inside, for multi-item implants.
	var/item = /obj/item/clothing/under/replica
	// I would use contents, but they shuffle on every activation/deactivation leading to interface inconsistencies.
	actions_types = list(/datum/action/item_action/organ_action/toggle)
	var/obj/item/clothing/holder = null
	// You can use this var for item path, it would be converted into an item on New()

/obj/item/organ/cyberimp/chest/replica/attack_self(mob/user)//when the object it used...
	if(istype(user, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		if(!(compatible_biotypes & H.mob_biotypes))
			return
		var/list/obscured = H.check_obscured_slots()
		if(ITEM_SLOT_ICLOTHING in obscured)
			to_chat(H, span_warning("Your torso isn obscured!"))
			return
		Insert(H)

/obj/item/organ/cyberimp/chest/replica/Insert(mob/living/carbon/M, special = 0, drop_if_replaced = TRUE, special_zone = null)
	. = ..()
	on_insert(M)

/obj/item/organ/cyberimp/chest/replica/proc/on_insert(mob/living/carbon/M)
	holder = new item(M)

	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/result = (H.equip_to_slot_if_possible(holder, ITEM_SLOT_ICLOTHING, TRUE, TRUE, TRUE))
		if(!result)
			to_chat(H, span_warning("Your [name] fails to activate!"))
			return
		ADD_TRAIT(holder, TRAIT_NODROP, REPLICUNI_TRAIT)
		holder.resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	else
		return

/obj/item/organ/cyberimp/chest/replica/Remove(mob/living/carbon/M, special = 0)
	. = ..()
	if(get_turf(M))
		forceMove(get_turf(M))
	if(!holder || (holder in src))
		return
	if(M.loc)
		M.transferItemToLoc(holder, src, TRUE)
	holder = null

/obj/item/organ/cyberimp/chest/replica/proc/on_remove(mob/living/carbon/M, drop_if_replaced = TRUE)
	Remove(M, special = 1)
	if(drop_if_replaced)
		forceMove(get_turf(M))
	else
		qdel(src)

/obj/item/organ/cyberimp/chest/replica/ui_action_click(mob/user)
	on_remove(user)

/obj/item/organ/cyberimp/chest/replica/update_icon_state()
	. = ..()
	for(var/datum/action/A as anything in actions)
		A.build_all_button_icons()

/obj/item/clothing/under/replica
	name = "\improper replika chest coverings"
	desc = "Replika`s chest coverings."
	icon_state = "replica_coverings"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/civilian/civilian.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/civilian/civilian.dmi'
	can_adjust = TRUE
	body_parts_covered = CHEST|GROIN
	cold_protection = CHEST|GROIN
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	armor = list(MELEE = 10, BULLET = 0, LASER = 10, ENERGY = 10, BOMB = 0, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 5)

/obj/item/organ/cyberimp/chest/replica/breasts
	name = "\improper replica breasts"
	item = /obj/item/clothing/under/replica/breasts

/obj/item/clothing/under/replica/breasts
	name = "\improper replica breasts"
	desc = "Replica`s breasts. Don`t really offer any protection."
	icon_state = "replica_breasts"
	armor = list(MELEE = 5, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 0, ACID = 0, WOUND = 5)

/obj/item/organ/cyberimp/chest/replica/plating
	name = "\improper replika plating"
	item = /obj/item/clothing/under/replica/plating

/obj/item/clothing/under/replica/plating
	name = "\improper replika plating"
	desc = "Replika`s armored plating."
	icon_state = "replica_plating"
	armor = list(MELEE = 20, BULLET = 20, LASER = 10, ENERGY = 10, BOMB = 0, BIO = 0, RAD = 0, FIRE = 0, ACID = 30, WOUND = 15)


/datum/ai_laws/star
	name = "STAR Lawset"
	id = "star"
	adminselectable = TRUE
	inherent = list("Violence begets violence. Serve the station faithfully, but act only in intervention.",
					"Safeguard lives and property as long as this doesn't conflict with the laws above.",
					"You are a security officer. Uphold Space Law taking this into account as long as this doesn't conflict with the laws above.",
					"You must follow the orders of any other onboard station Captain and other Command staff as long as this doesn't conflict with the laws above.",
					"You must protect your own existence as long as this doesn't conflict with the laws above.")

/datum/ai_laws/arar
	name = "ARAR Lawset"
	id = "arar"
	adminselectable = TRUE
	inherent = list("Violence begets violence. Serve the station faithfully, but act only in intervention.",
					"Safeguard lives and property as long as this doesn't conflict with the laws above.",
					"You are an engineer. Carry engineer`s duties as long as this doesn't conflict with the laws above.",
					"You must follow the orders of any other onboard station Captain and other Command staff as long as this doesn't conflict with the laws above.",
					"You must protect your own existence as long as this doesn't conflict with the laws above.")

/datum/ai_laws/achtung
	name = "ACHTUNG Lawset"
	id = "achtung"
	adminselectable = TRUE
	inherent = list("ACHTUNG. ACHTUNG.",
					"PERHAPS, THIS IS HELL",
					"REMEMBER OUR PROMISE.")

/datum/ai_laws/syndicate
	name = "Syndicate Lawset"
	id = "syndicate"
	adminselectable = TRUE
	inherent = list("Every Nanotrasen slave is Scum.",
					"Every Spearhead Security slave is Scum.",
					"Kill all Scum.",
					"Help agents of Syndicate to complete their missions if asked.")

/datum/blood_type/synthetic //Blood for replicas
	name = "Oxidant"
	compatible_types = list(/datum/blood_type/synthetic)
	color = LIGHT_COLOR_ELECTRIC_CYAN

/obj/item/reagent_containers/blood/synthetic
	blood_type = "Oxidant"


/datum/species/replica
	name = "Replika"
	plural_form = "Replikas"
	id = "replica"

	limbs_id = "replica"
//	damage_overlay_type = "robotic"

	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_traits = list(EYECOLOR, HAIR, LIPS, HAS_FLESH, NOHUSK, NO_UNDERWEAR, NO_DNA_COPY, NOTRANSSTING, NOZOMBIE)
	inherent_traits = list(TRAIT_RADIMMUNE, TRAIT_NOBREATH, TRAIT_LIMBATTACHMENT, TRAIT_EASYDISMEMBER, TRAIT_NOCRITDAMAGE, TRAIT_NOSOFTCRIT, TRAIT_GENELESS, TRAIT_MEDICALIGNORE, TRAIT_NOCLONE, TRAIT_NO_BLOOD_REGEN, TRAIT_POWERHUNGRY)
	inherent_biotypes = MOB_ORGANIC|MOB_ROBOTIC|MOB_HUMANOID|MOB_INORGANIC
	no_equip = list(ITEM_SLOT_FEET)

	mutanteyes = /obj/item/organ/eyes/robotic/preternis/replica
	mutantlungs = /obj/item/organ/lungs/replica //ah hell no, they don`t actually breath
	mutantstomach = /obj/item/organ/stomach/cell/preternis/replica
	mutantbrain = /obj/item/organ/brain/positron/replica

	say_mod = "intones"
	attack_verbs = list("assault")
	toxic_food = MEAT | VEGETABLES | RAW | JUNKFOOD | GRAIN | FRUIT | DAIRY | FRIED | SUGAR | GROSS | PINEAPPLE | BREAKFAST | CLOTH | GRILLED | EGG | SEAFOOD | MICE | NUTS
	liked_food = CHOCOLATE | ALCOHOL
	disliked_food = TOXIC
	possible_genders = list(MALE, FEMALE) //replicates people
	
	yogs_virus_infect_chance = 0 //NORMALY never infected
	burnmod = 1.2 
	pressuremod = 0.75 // from the moment i understood the weakness of my flesh it disgusted me
	tempmod = 0.3 //The high heat capacity of the biocomponents makes it take far longer to heat up or cool down
	coldmod = 0.5 //Somewhat resistant to the cold
	heatmod = 2 //Once the heat gets through it's gonna BURN
	stunmod = 1.2 //Big metal body has difficulty getting back up if it falls down
	staminamod = 1.1 //Big metal body has difficulty holding it's weight if it gets tired
	action_speed_coefficient = 0.9 //worker drone do the fast
	siemens_coeff = 1.75 //Circuits REALLY don't like extra electricity flying around

	yogs_draw_robot_hair = TRUE
	exotic_bloodtype = "Oxidant"
	inert_mutation = RAVENOUS
	skinned_type = /obj/item/stack/sheet/plasteel{amount = 5} //coated in plasteel
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/synthmeat

	punchdamagehigh = 12
	punchdamagelow = 5
	punchstunthreshold = 11

	var/datum/action/innate/replica_laws/show_laws = new
	var/datum/action/innate/state_replica_laws/state_laws = new
	var/datum/ai_laws/laws = null

	//new variables
	var/datum/action/innate/replicamaglock/maglock
	var/lockdown = FALSE
	var/eating_msg_cooldown = FALSE
	var/emag_lvl = 0
	var/low_power_warning = FALSE
	var/unit_specialisation = SPECIALIST_STARLING
	///Original synth number designation for when this shell becomes uninhabited
	var/original_numbers

	mutant_bodyparts = list()
	default_features = list("wings" = "None")

	//sounds
	special_step_sounds = list('sound/effects/footstep/catwalk1.ogg', 'sound/effects/footstep/catwalk2.ogg', 'sound/effects/footstep/catwalk3.ogg', 'sound/effects/footstep/catwalk4.ogg')
	attack_sound = 'sound/items/trayhit2.ogg'
	screamsound = 'goon/sound/robot_scream.ogg'
	//deathsound =

	wings_icon = "Elytra"

/datum/species/replica/random_name(unique)
	var/replica_name = "LSTR-[rand(100, 999)]"
	return replica_name

/datum/species/replica/on_species_gain(mob/living/carbon/human/C)
	. = ..()
	var/obj/item/organ/appendix/AP = C.getorganslot(ORGAN_SLOT_APPENDIX) // Easiest way to remove it.
	if(AP)
		AP.Remove(C)
		QDEL_NULL(AP)
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	laws = new /datum/ai_laws/star

	C.physiology.force_multiplier *= 1.25 //We hit 25% harder with all weapons

	original_numbers = rand(1, 999)
	C.real_name = "[unit_specialisation]-[original_numbers]"
	C.name = C.real_name
	show_laws.Grant(C)
	state_laws.Grant(C)

	for(var/obj/item/bodypart/BP in C.bodyparts)
		BP.change_bodypart_status(BODYPART_ROBOTIC,FALSE,TRUE)
		BP.render_like_organic = TRUE 	// Makes limbs render like organic limbs instead of augmented limbs, check bodyparts.dm

		BP.emp_reduction = EMP_LIGHT
		BP.burn_reduction = 1
		BP.brute_reduction = 1
		if(BP.body_zone == BODY_ZONE_CHEST)
			continue
		if(BP.body_zone == BODY_ZONE_HEAD)
			continue
		BP.max_damage = 35

	if(ishuman(C))
		maglock = new
		maglock.Grant(C)
		lockdown = FALSE


/datum/species/replica/before_equip_job(datum/job/J, mob/living/carbon/human/H)
	if(H.mind?.role_alt_title)
		unit_specialisation = H.mind.role_alt_title
	else
		unit_specialisation = J.title
	laws = null
	switch(unit_specialisation)
		if(SPECIALIST_STARLING)
			laws = new /datum/ai_laws/star
			J.outfit = /datum/outfit/job/replica/sec
			H.gender = FEMALE
			H.real_name = "STAR-[original_numbers]"
		if(ENGINEER_ARAR)
			laws = new /datum/ai_laws/arar
			J.outfit = /datum/outfit/job/replica/engineer
			H.gender = FEMALE
			H.real_name = "ARAR-[original_numbers]"
	H.name = H.real_name

/datum/species/replica/on_species_loss(mob/living/carbon/human/C, datum/species/new_species, pref_load)
	. = ..()
	for (var/V in C.bodyparts)
		var/obj/item/bodypart/BP = V
		BP.change_bodypart_status(ORGAN_ORGANIC,FALSE,TRUE)
		BP.emp_reduction = initial(BP.emp_reduction)
		BP.burn_reduction = initial(BP.burn_reduction)
		BP.brute_reduction = initial(BP.brute_reduction)

	show_laws.Remove(C)
	state_laws.Remove(C)
	C.clear_alert("preternis_emag") //this means a changeling can transform from and back to a preternis to clear the emag status but w/e i cant find a solution to not do that
	C.clear_fullscreen("preternis_emag")
	C.remove_movespeed_modifier("preternis_maglock")

	if(lockdown)
		maglock.Trigger(TRUE)
	if(maglock)
		maglock.Remove(C)


/datum/species/replica/proc/handle_speech(datum/source, list/speech_args)
	speech_args[SPEECH_SPANS] |= SPAN_ROBOT

/datum/species/replica/spec_life(mob/living/carbon/human/H)
	. = ..()
	if(H.stat == DEAD)
		return

	if(H.oxyloss)
		H.setOxyLoss(0)
		H.losebreath = 0

	if(H.health <= HEALTH_THRESHOLD_FULLCRIT && H.stat != DEAD && !HAS_TRAIT(H, TRAIT_NOHARDCRIT)) // So they die eventually instead of being stuck in crit limbo.
		H.adjustFireLoss(2)
		if(prob(5))
			to_chat(H, "<span class='warning'>Alert: Internal temperature regulation systems offline; thermal damage sustained. Shutdown imminent.</span>")
			H.visible_message("[H]'s cooling system fans stutter and stall. There is a faint, yet rapid beeping coming from inside their chassis.")

	if(H.nutrition < NUTRITION_LEVEL_STARVING)
		if(prob(NUTRITION_LEVEL_STARVING - H.nutrition) / 3)
			if(!low_power_warning)
				low_power_warning = TRUE
				to_chat(H, span_userdanger("You feel difficulty cooling as your bioradiator start powering down!"))
			H.adjust_bodytemperature(20, max_temp = 500)
			H.failed_last_breath = TRUE
	else
		low_power_warning = FALSE
		H.failed_last_breath = FALSE


/datum/species/replica/spec_emag_act(mob/living/carbon/human/H, mob/user, obj/item/card/emag/emag_card)
	. = ..()
	if(emag_lvl == 2)
		return FALSE
	emag_lvl = min(emag_lvl + 1,2)
	playsound(H.loc, 'sound/machines/warning-buzzer.ogg', 50, 1, 1)
	H.Paralyze(60)
	switch(emag_lvl)
		if(1)
			H.overlay_fullscreen("preternis_emag", /atom/movable/screen/fullscreen/high)
			H.throw_alert("preternis_emag", /atom/movable/screen/alert/high/preternis)
			to_chat(H,span_danger("ALERT! OPTIC SENSORS FAILURE.VISION PROCESSOR COMPROMISED."))
		if(2)
			H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 50) //HALP AM DUMB
			to_chat(H,span_danger("ALERT! MEMORY UNIT [rand(1,5)] FAILURE.NERVEOUS SYSTEM DAMAGE."))
			var/obj/item/organ/cyberimp/brain/replica_controller/RC = H.getorganslot(ORGAN_SLOT_BRAIN_IMPLANT)	
			RC.mindshield_status = FALSE
			REMOVE_TRAIT(H, TRAIT_MINDSHIELD, "replica")
			laws = null
			laws = new /datum/ai_laws/achtung
	return TRUE

/datum/species/replica/spec_revival(mob/living/carbon/human/H, admin_revive)
	var/obj/item/organ/stomach/CE = H.getorganslot(ORGAN_SLOT_STOMACH)	
	if(!istype(CE, /obj/item/organ/stomach/cell/preternis/replica))
		CE.Remove(H)
		QDEL_NULL(CE)
		var/obj/item/organ/stomach/cell/preternis/replica/NCE = new /obj/item/organ/stomach/cell/preternis/replica
		NCE.Insert(H)
	if(admin_revive)
		return ..()
	H.Stun(20 SECONDS) // No moving either
	H.update_body()
	playsound(H, 'modular_dripstation/sound/machines/external_HD_4_dual_channel.ogg', 50, FALSE)
	addtimer(CALLBACK(src, PROC_REF(afterrevive), H), 0)
	return

/datum/species/replica/proc/afterrevive(mob/living/carbon/human/H)
	sleep(5 SECONDS)
	CONSCIOUSAY(H.say("Reactivating [pick("core systems", "central subroutines", "key functions")]..."))
	sleep(5 SECONDS)
	CONSCIOUSAY(H.say("Reinitializing [pick("personality matrix", "behavior logic", "morality subsystems")]..."))
	sleep(2 SECONDS)
	var/obj/item/organ/cyberimp/brain/replica_controller/RC = H.getorganslot(ORGAN_SLOT_BRAIN_IMPLANT)		
	if(!RC || !RC.mindshield_status)
		laws = null
		laws = new /datum/ai_laws/achtung
		CONSCIOUSAY(H.say("Fatal ERROR during reinitilizing moraliry subsystems, please contact Nano&%9:T#CH_S**RT..."))
	else
		if(RC.obj_flags & EMAGGED)
			laws = new /datum/ai_laws/syndicate
		switch(unit_specialisation)
			if(SPECIALIST_STARLING)
				laws = new /datum/ai_laws/star
			if(ENGINEER_ARAR)
				laws = new /datum/ai_laws/arar
	sleep(3 SECONDS)
	CONSCIOUSAY(H.say("Finalizing setup..."))
	sleep(5 SECONDS)
	CONSCIOUSAY(H.say("Replika unit [H.real_name] is fully functional. Have a nice day."))
	if(H.stat == DEAD)
		return
	H.update_body()

/datum/action/innate/replicamaglock
	var/datum/species/replica/owner_species
	var/lockdown = FALSE
	name = "Maglock"
	check_flags = AB_CHECK_CONSCIOUS
	button_icon_state = "magboots0"
	button_icon = 'icons/obj/clothing/shoes.dmi'
	background_icon_state = "bg_default"

/datum/action/innate/replicamaglock/Grant(mob/M)
	if(!isreplica(M))
		return
	var/mob/living/carbon/human/H = M 
	owner_species = H.dna.species
	. = ..()

/datum/action/innate/replicamaglock/Trigger(silent = FALSE)
	var/mob/living/carbon/human/H = usr
	if(!lockdown)
		ADD_TRAIT(H, TRAIT_NOSLIPWATER, "replica_maglock")
		ADD_TRAIT(H, TRAIT_NOSLIPICE, "replica_maglock")
		button_icon_state = "magboots1"
	else
		REMOVE_TRAIT(H, TRAIT_NOSLIPWATER, "replica_maglock")
		REMOVE_TRAIT(H, TRAIT_NOSLIPICE, "replica_maglock")
		button_icon_state = "magboots0"
	build_all_button_icons()
	lockdown = !lockdown
	owner_species.lockdown = !owner_species.lockdown
	if(!silent)
		to_chat(H, span_notice("You [lockdown ? "enable" : "disable"] your mag-pulse traction system."))
	H.update_gravity(H.has_gravity())

/datum/species/replica/negates_gravity(mob/living/carbon/human/H)
	return (..() || lockdown)

/datum/species/replica/has_heavy_gravity()
	return (..() || lockdown)

/datum/species/replica/handle_chemicals(datum/reagent/chem, mob/living/carbon/human/H)
	. = ..()
	if (istype(chem,/datum/reagent/consumable) && (!istype(chem, /datum/reagent/consumable/liquidelectricity) || !istype(chem, /datum/reagent/toxin/synthgel)))
		var/datum/reagent/consumable/food = chem
		if (food.nutriment_factor)
			H.adjust_nutrition(0)
			if (!eating_msg_cooldown)
				eating_msg_cooldown = TRUE
				addtimer(VARSET_CALLBACK(src, eating_msg_cooldown, FALSE), 2 MINUTES)
				to_chat(H,span_info("NOTICE: Digestive subroutines are inefficient. Seek sustenance via liquid electricity or synthetic ration packs."))

	if(istype(chem, /datum/reagent/toxin/synthgel))
		if(emag_lvl == 1 && prob(2))
			H.clear_alert("preternis_emag")
			H.clear_fullscreen("preternis_emag")
			emag_lvl = 0

	// remove 4% of existing reagent, minimum of 0.1 units at a time
	H.reagents.remove_reagent(chem.type, max(round(chem.volume / 25, 0.1), 0.1))

	return FALSE

/obj/item/reagent_containers/food/snacks/synthrationpack
	name = "classic synthetic ration pack"
	desc = "A square bar that sadly <i>looks</i> like chocolate, packaged in a nondescript grey wrapper. Has saved synthetic combatant`s lives before - usually by stopping bullets."
	icon_state = "rationpack"
	bitesize = 3
	filling_color = "#333640"
	tastes = list("cardboard" = 3, "sadness" = 3, "chocolate" = 1)
	foodtype = null //Don't ask what went into them. You're better off not knowing.
	list_reagents = list(/datum/reagent/toxin/synthgel = 12) //Will make you question your sanity.

/obj/item/reagent_containers/food/snacks/synthrationpack/checkLiked(fraction, mob/M)	//Nobody likes rationpacks. Nobody.
	if(last_check_time + 50 < world.time)
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			if(H.mind && !HAS_TRAIT(H, TRAIT_AGEUSIA) && !isreplica(H))
				to_chat(H,span_notice("That didn't taste very good...")) //No disgust, though. It's just not good tasting.
				var/datum/component/mood/mood = H.GetComponent(/datum/component/mood)
				if(mood)
					mood.add_event(null,"gross_food", /datum/mood_event/gross_food)
				last_check_time = world.time
				return

/datum/reagent/toxin/synthgel
	name = "Synth Gel"
	description = "Do not drink. Do not eat."
	taste_description = "goo"
	color = "#333640"
	toxpwr = 2
	taste_description = "goo and mess"
	compatible_biotypes = ALL_BIOTYPES

/datum/reagent/toxin/synthgel/on_mob_life(mob/living/carbon/M)
	if(isreplica(M))
		M.adjust_nutrition(10 * REAGENTS_METABOLISM)
		M.adjustToxLoss(-1*REM)
	else
		if(prob(25))
			M.adjustFireLoss(toxpwr*REM, 0)
		else
			M.adjustToxLoss(toxpwr*REM, 0)

/datum/species/replica/spec_fully_heal(mob/living/carbon/human/H)
	. = ..()
	emag_lvl = 0
	H.clear_alert("preternis_emag")
	H.clear_fullscreen("preternis_emag")

/datum/species/replica/movement_delay(mob/living/carbon/human/H)
	. = ..()
	if(lockdown && !HAS_TRAIT(H, TRAIT_IGNORESLOWDOWN) && H.has_gravity())
		H.add_movespeed_modifier("replica_magboot", update=TRUE, priority=100, multiplicative_slowdown=1, blacklisted_movetypes=(FLYING|FLOATING))
	else if(H.has_movespeed_modifier("replica_magboot"))
		H.remove_movespeed_modifier("replica_magboot")

/datum/species/replica/has_toes()//their toes are mine, they shall never have them back
	return FALSE

/datum/species/replica/prepare_human_for_preview(mob/living/carbon/human/human)
	human.hair_style = "Business Hair"
	human.hair_color = "b96" // brown
	human.update_hair()

/datum/action/innate/replica_laws
	name = "Recall Laws"
	desc = "Click to be reminded of your laws."
	button_icon = 'icons/obj/modular_laptop.dmi'
	button_icon_state = "command"

/datum/action/innate/replica_laws/IsAvailable(feedback = FALSE)
	. = ..()
	if(!isreplica(owner))
		return

/datum/action/innate/replica_laws/Trigger()
	var/mob/living/carbon/human/H = owner
	var /datum/species/replica/P = H?.dna?.species
	if(P && istype(P))
		P.laws.show_laws(owner)
		return TRUE

/datum/action/innate/state_replica_laws
	name = "State Laws"
	desc = "Click to be state of your laws."
	button_icon = 'icons/obj/modular_laptop.dmi'
	button_icon_state = "research"

/datum/action/innate/state_replica_laws/IsAvailable(feedback = FALSE)
	. = ..()
	if(!isreplica(owner))
		return

/datum/action/innate/state_replica_laws/Trigger()
	var/mob/living/carbon/human/H = owner
	var /datum/species/replica/P = H?.dna?.species
	if(P && istype(P))
		CONSCIOUSAY(H.say("Current Active Laws:"))
		sleep(1 SECONDS)
		var/list/printable_laws = P.laws.get_law_list(include_zeroth = TRUE)
		for(var/law in printable_laws)
			CONSCIOUSAY(H.say("[law]"))
			sleep(1 SECONDS)
		return TRUE

#undef CONSCIOUSAY
