/datum/reagent/toxin/leadacetate
	name = "Lead Acetate"
	description = "Used hundreds of years ago as a sweetener, before it was realized that it's incredibly poisonous."
	reagent_state = SOLID
	color = "#2b2b2b" // rgb: 127, 132, 0
	toxpwr = 0.5
	taste_mult = 1.3
	taste_description = "sugary sweetness"

/datum/reagent/toxin/leadacetate/on_mob_life(mob/living/carbon/affected_mob)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_EARS, 1 SECONDS * REM)
	affected_mob.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1 SECONDS * REM)
	if(prob(5))
		to_chat(affected_mob, span_notice("Ah, what was that? You thought you heard something..."))
		affected_mob.adjust_confusion(5 SECONDS)
	return ..()

/datum/reagent/toxin/chlorinetwo
	name = "Chlorine-two"
	description = "A yellow gas that's well known as toxic asphyxiant gas."
	reagent_state = GAS
	color = "#808080" // rgb: 128, 128, 128
	toxpwr = 2
	metabolization_rate = 3 * REAGENTS_METABOLISM
	taste_mult = 1.3
	taste_description = "metalic sweetness"

/datum/reagent/toxin/chlorinetwo/reaction_mob(mob/living/carbon/M, methods=TOUCH, reac_volume, show_message = 1, permeability = 1)
	if(methods & (VAPOR))
		M.adjustOxyLoss(8*reac_volume*permeability)
		M.emote("cough")
		var/obj/item/organ/lungs/our_lungs = M.getorganslot(ORGAN_SLOT_LUNGS)
		if(our_lungs.status == ORGAN_ORGANIC)
			our_lungs.applyOrganDamage(3*reac_volume*permeability)
	..()
