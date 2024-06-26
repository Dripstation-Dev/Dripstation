/*
//////////////////////////////////////

Sneezing

	Very Noticable.
	Increases resistance.
	Doesn't increase stage speed.
	Very transmissible.
	Low Level.

Bonus
	Forces a spread type of AIRBORNE
	with extra range!

//////////////////////////////////////
*/

/datum/symptom/sneeze
	name = "Sneezing"
	icon = "sneezing"
	desc = "The virus causes irritation of the nasal cavity, making the host sneeze occasionally."
	stealth = -2
	resistance = 3
	stage_speed = 0
	transmittable = 4
	level = 1
	severity = 1
	symptom_delay_min = 5
	symptom_delay_max = 35
	threshold_descs = list(
		"Transmission 9" = "Increases sneezing range, spreading the virus over 6 meter cone instead of over a 4 meter cone.",
		"Stealth 4" = "The symptom remains hidden until active.",
	)

/datum/symptom/sneeze/Start(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	if(A.totalTransmittable() >= 9) //longer spread range
		power = 2
	if(A.totalStealth() >= 4)
		suppress_warning = TRUE

/datum/symptom/sneeze/Activate(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	var/mob/living/M = A.affected_mob
	switch(A.stage)
		if(1, 2, 3)
			if(!suppress_warning)
				M.emote("sniff")
		else
			M.emote("sneeze")
			if(M.CanSpreadAirborneDisease()) //don't spread germs if they covered their mouth
				A.spread(4 + power)
