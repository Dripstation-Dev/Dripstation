/mob/living/simple_animal
	var/disease_prob = 0			//chance based desease spawning at initialising
	var/datum/disease/disease_type

/mob/living/simple_animal/Initialize(mapload)
	. = ..()
	if(disease_type && prob(disease_prob))
		var/datum/disease/D = new disease_type
		D.infect(src, FALSE)
