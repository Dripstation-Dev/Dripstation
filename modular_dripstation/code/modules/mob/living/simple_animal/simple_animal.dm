/mob/living/simple_animal
	var/desease_prob = 0			//chance based desease spawning at initilising
	var/infect_prob = 0				//chance of infectig on attack (for now at least)
	var/has_desease = FALSE			//has it/can spread
	var/datum/disease/desease_type	//type of illness

/mob/living/simple_animal/Initialize(mapload)
	. = ..()
	if(desease_type && prob(desease_prob))
		has_desease = TRUE
