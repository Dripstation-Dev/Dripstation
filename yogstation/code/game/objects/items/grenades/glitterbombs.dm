/obj/item/grenade/plastic/glitterbomb
	name = "plastic party explosive"
	desc = "Used to put the party in specific locations."
	can_attach_mob = TRUE
	var/glitter_type = /datum/reagent/glitter	//dripstation edit

datum/effect_system/fluid_spread/smoke/chem/glitter
	effect_type = /obj/effect/particle_effect/fluid/smoke/chem/glitter

/obj/effect/particle_effect/fluid/smoke/chem/glitter
	lifetime = 6 SECONDS
	opacity = TRUE

/obj/item/grenade/plastic/glitterbomb/Initialize(mapload)
	. = ..()
	create_reagents(20)
	reagents.add_reagent(glitter_type, 20)

/obj/item/grenade/plastic/glitterbomb/prime()
	..()
	var/datum/effect_system/fluid_spread/smoke/chem/glitter/smoke = new()
	smoke.set_up(4, location = target, carry = reagents)
	smoke.start()
	playsound(target, 'sound/items/party_horn.ogg', 50, 1, -1)
	target.cut_overlay(plastic_overlay, TRUE)

/obj/item/grenade/plastic/glitterbomb/suicide_act(mob/user)
	user.visible_message(span_suicide("[user] swallows [src]! It looks like [user.p_they()] WANTS TO PARTY!"))
	target = user
	moveToNullspace()
	addtimer(CALLBACK(src, PROC_REF(prime)), 99)
	addtimer(CALLBACK(user, TYPE_PROC_REF(/mob/living, gib)), 100)
	return MANUAL_SUICIDE

/obj/item/grenade/plastic/glitterbomb/pink
	desc = "Used to put the party in specific locations. This one seems to be pink colored and feels kinda hot."
	glitter_type = /datum/reagent/glitter/pink	//dripstation edit

/obj/item/grenade/plastic/glitterbomb/blue
	desc = "Used to put the party in specific locations. This one seems to be blue colored and feels slightly cold."
	glitter_type = /datum/reagent/glitter/blue	//dripstation edit

/obj/item/grenade/plastic/glitterbomb/white
	desc = "Used to put the party in specific locations. This one seems to be white colored and makes you feel sleepy by just looking at it."
	glitter_type = /datum/reagent/glitter/white	//dripstation edit
