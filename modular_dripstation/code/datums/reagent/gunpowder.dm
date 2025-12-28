/datum/reagent/gunpowder
	name = "Gun Powder"
	description = "Explodes."
	reagent_state = SOLID
	color = "#000000"
	metabolization_rate = REAGENTS_METABOLISM * 2.5
	taste_description = "like gun"

/datum/reagent/gunpowder/on_mob_life(mob/living/carbon/M)
	..()
	M.adjust_hallucinations(20 SECONDS)

/datum/reagent/gunpowder/on_ex_act()
	var/location = get_turf(holder.my_atom)
	var/datum/effect_system/reagents_explosion/e = new()
	e.set_up(1 + round(volume/8, 1), location, 0, 0, message = 0)
	e.start()
	holder.clear_reagents()

