/obj/item/paper/contract/employment
	icon = 'modular_dripstation/icons/obj/bureaucracy.dmi'
	icon_state = "good_contract"
	signed = TRUE

/obj/item/paper/contract/employment/New(atom/loc, mob/living/nOwner)
	. = ..()
	if(!nOwner || !nOwner.mind)
		qdel(src)
		return -1
	target = nOwner.mind
	update_text()


/obj/item/paper/contract/employment/update_text()
	name = "Document - Employment contract — [target]"
	info = "<center>Employment contract extract</center><BR><BR><BR><BR>This Agreement is concluded between [target], hereinafter referred to as the Employee, and Nanotrasen Strategic Investment Company, hereinafter referred to as the Employer. The Agreement shall enter into force upon its signing.\
	<BR>Signed,<BR><i>[target]</i>"

/obj/item/paper/contract/employment/examine(mob/user)
	. = ..()
	. += "The paper definitely contains more text than it should normally have."
	if(user.mind && user.mind.has_antag_datum(/datum/antagonist/ert) || user.mind.assigned_role in list("Lawyer", "Head of Personnel", "Nanotrasen Representative", "Magistrate", "Captain", get_all_centcom_jobs()))
		. += "You notise some clauses in the contract: \
			Something about non-insurance cases. \
			Something about working on rival corps.\
			Something about work etics. \
			Something about body replication, termination and cloning. \
			Something about information imprint dublicates. \
			Nothing special though, nowadays corps loves to write such clauses in contracts."
	else if(user.mind && user.mind == target)
		. += "Your gaze can't focus on the intricacies of references to references and sub-clauses of sub-clauses. \
		 	The only thing you can say for sure is that your signature is at the end, and you even vaguely remember putting it down."
	else
		. += "Your gaze can't focus on the intricacies of references to references and sub-clauses of sub-clauses."

/obj/item/paper/contract/employment/examine_more(mob/user)
	. = ..()
	var/msg
	if(user.mind && user.mind.has_antag_datum(/datum/antagonist/ert) || user.mind.assigned_role in list("Lawyer", "Head of Personnel", "Nanotrasen Representative", "Magistrate", "Captain", get_all_centcom_jobs()))
		msg = "<BR>Preamble \
		<BR>Employee, being a naturally born human (or other humanoid species approved for existence at commercial facilities in the Terragov space), possesses skills that can be useful to the Employer. Employee seeks employment with the Employer. \
		<BR>Employer agrees to regulary pay Employee a salary in exchange for his continued service... \
		<BR>Hereby, taking into account the above mutual benefits and other considerations, the parties mutually agree as follows: \
		<BR>In exchange for a regular salary, Employee agrees to work for Employer for the rest of his current and all future lives until it is cancelled at the request of one of the parties in a procedural manner. \
		<BR>Employee must work for two standart cycles after filing a notice of termination of this Agreement. Early termination of the Agreement may result in termination of the Employee.\
		<BR>The Employer reserves the right to terminate Agreement with Employee in any time while the Employee works for the company and for 1000 cycles after the termination of the current contract.\
		<BR>The Employer reserves the right to change any other additional signed documents without further notification. \
		<BR>In addition, Employee agrees to temporally transfer ownership of his bluespace information imprint, hereinafter referred to as Soul, to Employer's Paradimensional Control Department, hereinafter referred to as Owner, for the duration of this Agreement. \
		<BR>In the event that the transfer of Employee's bluespace information imprint is impossible, Employee must post a deposit of equal value in its place... \
		<BR>The Employee undertakes to provide the Owner with full temporary possession, and the Owner agrees to accept the Soul of the Employee and maintain it in good condition, taking into account normal wear and tear and possible damage during operation. \
		<BR>The Employee guarantees that prior to the signing of this Agreement, the transferred Soul has not been sold, gifted, mortgaged or encumbered by the rights of third parties to anyone else. \
		<BR>The Owner guarantees that after signing this Agreement and until its expiration, the transferred Soul will not be sold, donated, mortgaged or encumbered by the rights of third parties. \
		<BR>In addition to the specified restrictions, the Owner is considered the full owner of the Soul and may dispose of it at his own discretion throughout the term of this Agreement..."
	else
		msg = "You really starting to feel ill while doublechecking this text."
		if(isliving(user))
			var/mob/living/M = user 
			var/obj/item/organ/brain/B = M.getorgan(/obj/item/organ/brain)
			M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
			if(B.can_gain_trauma(/datum/brain_trauma/mild/hallucinations, 1))
				B.brain_gain_trauma(/datum/brain_trauma/mild/hallucinations, 1)
	return list(span_notice("<i>[msg]</i>"))

/obj/item/paper/contract/employment/attack(mob/living/M, mob/living/carbon/human/user)
	var/deconvert = 0
	if(M.mind == target && target.soulOwner != target)
		if(user.mind && (user.mind.assigned_role == "Lawyer"))
			deconvert = 60
		else if (user.mind && (user.mind.assigned_role in list("Head of Personnel", "Nanotrasen Representative", "Magistrate")) || (user.mind.assigned_role in get_all_centcom_jobs()))
			deconvert = 40
		else if(user.mind && (user.mind.assigned_role == "Captain") || (user.mind.has_antag_datum(/datum/antagonist/ert)))
			deconvert = 25
		else
			deconvert = 0.0001
	if(prob(deconvert))
		M.visible_message("<span class='notice'>Thanks to [user] [M] remembers, that his soul [M] has already been owned by Nanotrasen!</span>")
		to_chat(M,"<span class='boldnotice'>You feel your soul returning to its rightful owner — Nanotrasen.</span>")
		M.return_soul()
	return ..()

/obj/item/paper/contract/infernal
	icon = 'modular_dripstation/icons/obj/bureaucracy.dmi'
	icon_state = "evil_contract"	
