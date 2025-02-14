/////Nanotrasen variants/////
/////Security and export variant/////
/obj/item/implant/mindshield
	var/implant_visible_as = "hud_imp_loyal"
	var/active = TRUE

/obj/item/implant/mindshield/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Nanotrasen Employee Management Implant<BR>
				<b>Life:</b> One year.<BR>
				<b>Important Notes:</b> Personnel injected with this device are much more resistant to brainwashing.<BR>
				<HR>
				<b>Implant Details:</b><BR>
				<b>Function:</b> Contains a small pod of nanobots that protects the host's mental functions from manipulation.<BR>
				<b>Integrity:</b> Implant will last so long as the nanobots are inside the bloodstream."}
	return dat


/obj/item/implant/mindshield/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	if(..())
		if(HAS_TRAIT(target, TRAIT_MINDSHIELD))
			target.visible_message(span_warning("[target] seems to resist the implant!"), span_warning("You already have mind protection!"))
			return FALSE
		if(target.mind && !silent)
			to_chat(target, span_notice("You feel a sense of peace and security. You are now protected from brainwashing."))
		ADD_TRAIT(target, TRAIT_MINDSHIELD, "implant")
		target.sec_hud_set_implants()
		return TRUE

/obj/item/implanter/mindshield
	name = "implanter"

/////High quality variant/////
/obj/item/implant/mindshield/centcom
	name = "high quality mindshield implant"
	desc = "Protects value assets from brainwashing. Grants access to military grade equipment."
	implant_visible_as = "hud_imp_loyal_ert"

/obj/item/implant/mindshield/centcom/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Nanotrasen Human Resourse Menatal Protector<BR>
				<b>Life:</b> Five years.<BR>
				<b>Important Notes:</b> Combat and high value personnel injected with this device are much more resistant to brainwashing. Provides access to military grade equipment.<BR>
				<HR>
				<b>Implant Details:</b><BR>
				<b>Function:</b> Contains a small pod of nanobots that protects the host's mental functions from manipulation.<BR>
				<b>Integrity:</b> Implant will last so long as the nanobots are inside the bloodstream."}
	return dat

/obj/item/implanter/mindshield/centcom
	name = "implanter"
	imp_type = /obj/item/implant/mindshield/centcom

/obj/item/implantcase/mindshield/centcom
	name = "implant case - 'High Quality Mindshield'"
	imp_type = /obj/item/implant/mindshield/centcom

/obj/item/implant/mindshield/centcom/iaa
	icon_state = "iaamindshield"
	actions_types = list(/datum/action/item_action/hands_free/activate)

/obj/item/implant/mindshield/centcom/iaa/activate(status = TRUE)
	. = ..()
	active = !active
	to_chat(imp_in, "You feel a faint click as [name] [active ? "activates" : "deactivates"]")
	implant_visible_as = "[active ? "hud_imp_loyal_ert" : null]"
	imp_in.sec_hud_set_implants()

/////Syndicate variants/////
/////Syndicate agent variant/////
/obj/item/implant/mindshield/tot
	icon_state = "totmindshield"
	actions_types = list(/datum/action/item_action/hands_free/activate)

/obj/item/implant/mindshield/tot/activate()
	. = ..()
	active = !active
	to_chat(imp_in, "You feel a faint click as [name] [active ? "activates" : "deactivates"]")
	implant_visible_as = "[active ? "hud_imp_loyal" : null]"
	imp_in.sec_hud_set_implants()

/obj/item/implant/mindshield/tot/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> NULL_ENTRY Implant<BR>
				<b>Life:</b> Five Days.<BR>
				<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
				<HR>
				<b>Implant Details:</b> <BR>
				<b>Function:</b> Can transmit a specialized cluster of signals that simulates NT brand Employee Management Implant`s signals. <BR>
				<b>Special Features:</b><BR>
				<i>Neuro-Scan</i>- Analyzes certain shadow signals in the nervous system.<BR>
				<HR>
				No Implant Specifics"}
	return dat

/obj/item/implanter/mindshield/tot
	name = "implanter"

/////Syndicate operative variant/////
/obj/item/implant/mindshield/tot_obvious
	icon_state = "totmindshield_obv"
	actions_types = list(/datum/action/item_action/hands_free/activate)
	implant_visible_as = "hud_imp_loyal_totobv"
	implant_color = "r"

/obj/item/implant/mindshield/tot_obvious/activate()
	. = ..()
	active = !active
	to_chat(imp_in, "You feel a faint click as [name] [active ? "activates" : "deactivates"]")
	implant_visible_as = "[active ? "hud_imp_loyal_totobv" : null]"
	imp_in.sec_hud_set_implants()

/obj/item/implant/mindshield/tot_obvious/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Operative Brainwash Denial Implant<BR>
				<b>Life:</b> One Year.<BR>
				<b>Important Notes:</b> Device reverts previous mental interference. Operatives injected with this device are much more resistant to brainwashing during the mission.<BR>
				<HR>
				<b>Implant Details:</b><BR>
				<b>Function:</b> Contains a small pod of nanobots that protects the host's mental functions from manipulation.<BR>
				<b>Special Features:</b> Will revert most forms of brainwashing before brainwash shielding.<BR>
				<b>Integrity:</b> Implant will last so long as the nanobots are inside the bloodstream."}
	return dat

/obj/item/implanter/tot_obvious
	name = "implanter"
	imp_type = /obj/item/implant/mindshield/tot_obvious

/obj/item/implantcase/tot_obvious
	name = "implant case - 'Syndicate Operative Field Mentalshield'"
	desc = "A glass case containing a mindshield implant."
	imp_type = /obj/item/implant/mindshield/tot_obvious

/////Amnestic implant/////
/obj/item/implant/amnestic
	name = "Amnestic implant"
	desc = "Reverts recent mental interference by providing artificial amnesia."
	actions_types = null

/obj/item/implant/amnestic/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Nanotrasen Employee Recovery Implant<BR>
				<b>Life:</b> Three minutes.<BR>
				<b>Important Notes:</b> Personnel injected with this device will remember their true allighment.<BR>
				<HR>
				<b>Implant Details:</b><BR>
				<b>Function:</b> Contains a small pod of nanobots that removes recent memory and restores the host's mental functions.<BR>
				<b>Special Features:</b> Removes recent memory of the host, providing artificial amnesia.<BR>
				<b>Integrity:</b> Implant will last so long as the nanobots are inside the bloodstream."}
	return dat

/obj/item/implant/amnestic/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	if(..())
		if(!target.mind || target.stat == DEAD)
			removed(target, TRUE)
			return TRUE

		for(var/obj/item/implant/I in target.implants)
			if(istype(I, /obj/item/implant/mindshield))
				target.visible_message(span_warning("[target] seems to resist the implant!"), span_warning("You feel something interfering with your curent mental conditioning! And causes heavy influence on your brain functions!!"))
				if(istype(target, /mob/living/carbon/human))
					traumatize(target)
				removed(target, TRUE)
				return FALSE

		if(target.mind.has_antag_datum(/datum/antagonist/brainwashed))
			target.mind.remove_antag_datum(/datum/antagonist/brainwashed)

		var/datum/antagonist/hivemind/host = target.mind.has_antag_datum(/datum/antagonist/hivemind) //Releases the target from mind control beforehand
		if(host)
			var/datum/mind/M = host.owner
			if(M)
				var/datum/action/cooldown/spell/aoe/target_hive/hive_control/the_spell = locate(/datum/action/cooldown/spell/aoe/target_hive/hive_control) in M.current.actions
				if(the_spell && the_spell.active)
					the_spell.release_control() //he basicly forget the targets

		if(target.mind.has_antag_datum(/datum/antagonist/rev/head) || target.mind.has_antag_datum(/datum/antagonist/hivemind) || target.mind.unconvertable)
			if(!silent)
				target.visible_message(span_warning("[target] seems to resist the implant!"), span_warning("You feel something interfering with your curent mental conditioning, but your allighment lasts much more longer and can`t be reverted by this level of braiwashing!"))
			removed(target, TRUE)
			return FALSE
		if(target.mind.has_antag_datum(/datum/antagonist/gang/boss) || target.mind.has_antag_datum(/datum/antagonist/mindslave))
			if(!silent)
				target.visible_message(span_warning("[target] seems to resist the implant!"), span_warning("You feel something interfering with your curent mental conditioning, but your allighment lasts much more longer and can`t be reverted by this level of braiwashing!"))
			removed(target, TRUE)
			return FALSE

		if(IS_VASSAL(target))
			if(IS_FAVORITE_VASSAL(target))
				if(!silent)
					target.visible_message(span_warning("[target] seems to resist the implant!"), span_warning("You feel something interfering with your curent mental conditioning, but your allighment can`t be reverted by this level of braiwashing!"))
				removed(target, TRUE)
				return FALSE
			target.mind.remove_antag_datum(/datum/antagonist/vassal)

		var/datum/antagonist/hivevessel/woke = target.is_wokevessel()
		if(is_hivemember(target))
			for(var/datum/antagonist/hivemind/hive in GLOB.antagonists)
				if(hive.hivemembers.Find(target))
					var/mob/living/carbon/C = hive.owner.current.get_real_hivehost()
					if(C)
						C.apply_status_effect(STATUS_EFFECT_HIVE_TRACKER, target, woke?TRACKER_AWAKENED_TIME:TRACKER_MINDSHIELD_TIME)
						target.apply_status_effect(STATUS_EFFECT_HIVE_TRACKER, C, TRACKER_DEFAULT_TIME)
						if(C.mind) //If you were using mind control, too bad
							C.apply_status_effect(STATUS_EFFECT_HIVE_RADAR)
							to_chat(C, span_assimilator("We detect a surge of psionic energy from a far away vessel before they disappear from the hive. Whatever happened, there's a good chance they're after us now."))
			to_chat(target, span_assimilator("You hear supernatural wailing echo throughout your mind as you are finally set free. Deep down, you can feel the lingering presence of those who enslaved you... as can they!"))
			target.apply_status_effect(STATUS_EFFECT_HIVE_RADAR)
			remove_hivemember(target)
			removed(target, TRUE)
			return TRUE

		if(woke)
			woke.one_mind.remove_member(target.mind)
			target.mind.remove_antag_datum(/datum/antagonist/hivevessel)

		var/datum/antagonist/rev/rev = target.mind.has_antag_datum(/datum/antagonist/rev)
		if(rev)
			rev.remove_revolutionary(FALSE, user)
			removed(target, TRUE)
			return TRUE
		if(target.mind.has_antag_datum(/datum/antagonist/gang))
			target.mind.remove_antag_datum(/datum/antagonist/gang)
			removed(target, TRUE)
			return TRUE
		if(!silent)
			if(target.mind in SSticker.mode.cult)
				to_chat(target, span_warning("You feel something interfering with your mental conditioning, but you FAITH resist it!"))
				removed(target, TRUE)
				return FALSE
		
		to_chat(target, span_warning("You feel odd. It seems you can`t remember anything about that shift..."))
		removed(target, TRUE)
		return TRUE

/obj/item/implant/amnestic/proc/traumatize(mob/living/carbon/human/H)
	var/resistance = pick(
		50;TRAUMA_RESILIENCE_BASIC,
		30;TRAUMA_RESILIENCE_SURGERY,
		15;TRAUMA_RESILIENCE_LOBOTOMY,
		5;TRAUMA_RESILIENCE_MAGIC)

	var/trauma_type = pickweight(list(
		BRAIN_TRAUMA_MILD = 60,
		BRAIN_TRAUMA_SEVERE = 30,
		BRAIN_TRAUMA_SPECIAL = 10
	))

	H.gain_trauma_type(trauma_type, resistance)

/obj/item/implanter/amnestic
	name = "implanter"
	imp_type = /obj/item/implant/mindshield

/obj/item/implantcase/amnestic
	name = "implant case - 'Amnestic'"
	desc = "A glass case containing a Amnestic implant."
	imp_type = /obj/item/implant/amnestic
