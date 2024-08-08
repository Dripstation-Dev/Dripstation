/obj/item/firing_pin/dna/secure
	name = "secure dna firing pin"

/obj/item/firing_pin/dna/secure/gun_remove(mob/living/user)
	auth_fail(user)
	return FALSE

/obj/item/firing_pin/dna/dredd/gun_remove(mob/living/user)
	auth_fail(user)
	return FALSE