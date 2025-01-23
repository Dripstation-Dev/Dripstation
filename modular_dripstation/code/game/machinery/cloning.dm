/obj/machinery/clonepod
	grab_ghost_when = CLONER_FRESH_CLONE
	var/not_self = FALSE

//Start growing a human clone in the pod!
/obj/machinery/clonepod/growclone(clonename, ui, mutation_index, makeup, mindref, last_death, datum/species/mrace, list/features, factions, list/quirks, datum/bank_account/insurance, list/traumas, empty, mood)
	if(panel_open)
		return NONE
	if(mess || attempting)
		return NONE

	if(!empty & prob(100-(efficiency*10)))	//like 80% at 1-tier components and 20% at 4-tier components 
		not_self = TRUE

	if(!empty || not_self) //Doesn't matter if we're just making a copy or it`s not the soul we were searching for
		clonemind = locate(mindref) in SSticker.minds
		if(!istype(clonemind))	//not a mind
			return NONE
		if(clonemind.last_death != last_death) //The soul has advanced, the record has not.
			return NONE
		if(!QDELETED(clonemind.current))
			if(clonemind.current.stat != DEAD)	//mind is associated with a non-dead body
				not_self = TRUE
			if(clonemind.current.suiciding) // Mind is associated with a body that is suiciding.
				return NONE
		if(!clonemind.active)
			// get_ghost() will fail if they're unable to reenter their body
			var/mob/dead/observer/G = clonemind.get_ghost()
			if(!G)
				not_self = TRUE
			if(G.suiciding) // The ghost came from a body that is suiciding.
				return NONE
		if(clonemind.damnation_type) //Can't clone the damned.
			INVOKE_ASYNC(src, PROC_REF(horrifyingsound))
			mess = TRUE
			icon_state = "pod_g"
			update_appearance(UPDATE_ICON)
			return NONE
		if(clonemind.zombified) //Can't clone the damned x2
			INVOKE_ASYNC(src, PROC_REF(horrifyingsound))
			mess = TRUE
			icon_state = "pod_g"
			update_appearance(UPDATE_ICON)
			return NONE
		current_insurance = insurance
	attempting = TRUE //One at a time!!
	biomass -= 100
	countdown.start()

	var/mob/living/carbon/human/H = new /mob/living/carbon/human(src)

	H.hardset_dna(ui, mutation_index, makeup, H.real_name, null, mrace, features)

	if(!HAS_TRAIT(H, TRAIT_RADIMMUNE))//dont apply mutations if the species is Mutation proof.
		if(efficiency > 2)
			var/list/unclean_mutations = (GLOB.not_good_mutations|GLOB.bad_mutations)
			H.dna.remove_mutation_group(unclean_mutations)
		if(efficiency > 5 && prob(20))
			H.easy_random_mutate(POSITIVE)
		if(efficiency < 3 && prob(50))
			var/mob/M = H.easy_random_mutate(NEGATIVE+MINOR_NEGATIVE)
			if(ismob(M))
				H = M
	
	var/list/possible_genders = H.dna.species.possible_genders
	if(!possible_genders || possible_genders.len < 1)
		stack_trace("[H.dna.species.type] has no possible genders!")
		H.gender = PLURAL // uh oh
	else if(possible_genders.len == 1)
		H.gender = possible_genders[1] // some species only have one gender

	if(!H.GetComponent(/datum/component/mood) && mood)
		H.AddComponent(/datum/component/mood)

	H.silent = 20 //Prevents an extreme edge case where clones could speak if they said something at exactly the right moment.
	occupant = H

	if(!clonename)	//to prevent null names
		clonename = "clone ([rand(1,999)])"
	H.real_name = clonename

	icon_state = "pod_1"
	//Get the clone body ready
	maim_clone(H)
	ADD_TRAIT(H, TRAIT_STABLEHEART, CLONING_POD_TRAIT)
	ADD_TRAIT(H, TRAIT_STABLELIVER, CLONING_POD_TRAIT)
	ADD_TRAIT(H, TRAIT_EMOTEMUTE, CLONING_POD_TRAIT)
	ADD_TRAIT(H, TRAIT_MUTE, CLONING_POD_TRAIT)
	ADD_TRAIT(H, TRAIT_NOBREATH, CLONING_POD_TRAIT)
	ADD_TRAIT(H, TRAIT_NOCRITDAMAGE, CLONING_POD_TRAIT)
	H.Unconscious(80)

	if(!empty)
		if(not_self)
			var/list/candidates = pollCandidatesForMob("Do you want to play as [clonename]'s defective clone?", null, null, null, 100, H, POLL_IGNORE_DEFECTIVECLONE)
			if(LAZYLEN(candidates))
				var/mob/dead/observer/C = pick(candidates)
				H.key = C.key
		else
			clonemind.transfer_to(H)

		if(grab_ghost_when == CLONER_FRESH_CLONE)
			H.grab_ghost()
			to_chat(H, span_notice("<b>Consciousness slowly creeps over you as your body regenerates.</b><br><i>So this is what cloning feels like?</i>"))

		if(grab_ghost_when == CLONER_MATURE_CLONE)
			H.ghostize(TRUE)	//Only does anything if they were still in their old body and not already a ghost
			to_chat(H.get_ghost(TRUE), span_notice("Your body is beginning to regenerate in a cloning pod. You will become conscious when it is complete."))

	if(H)
		H.faction |= factions
		remove_hivemember(H)

		for(var/V in quirks)
			var/datum/quirk/Q = new V(H)
			Q.on_clone(quirks[V])

		for(var/t in traumas)
			var/datum/brain_trauma/BT = t
			var/datum/brain_trauma/cloned_trauma = BT.on_clone()
			if(cloned_trauma)
				H.gain_trauma(cloned_trauma, BT.resilience)

		H.set_cloned_appearance()

		H.set_suicide(FALSE)
	attempting = FALSE
	if(!empty)
		return CLONING_DELETE_RECORD | CLONING_SUCCESS //I don`t want to autoprocess security officers
	else
		return CLONING_SUCCESS
