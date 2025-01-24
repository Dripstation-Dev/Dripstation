/obj/item/firing_pin
	var/jammed = FALSE	//OH NO, MY GUUUN, IT DOESN`T WOOOORK. WHO DID THAT?

/obj/item/firing_pin/examine(mob/user)
	. = ..()
	if(in_range(user, src) || isobserver(user))
		if(jammed)
			. += "<span class='boldwarning'><b>Warning: PIN MALFUNCTION DETECTED.</b></span>"

/obj/item/firing_pin/CtrlClick(mob/living/user)
	if(!iscarbon(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	if(jammed)
		user.visible_message(span_notice("[user] starting unjamming [user.p_their()] [src]."), \
								 span_notice("You start fixing the [src]."))
		fix(user, 1 SECONDS)

/obj/item/firing_pin/proc/fix(mob/living/user, time = 1 SECONDS)
	if (do_after(user, time, src))
		var/datum/effect_system/spark_spread/spark_system = new /datum/effect_system/spark_spread
		spark_system.start()
		playsound(loc, "sparks", 50, 1)
		jammed = FALSE
		to_chat(user, span_notice("The [src] fixed."))

/obj/item/firing_pin/dna/secure
	name = "secure dna firing pin"

/obj/item/firing_pin/dna/secure/gun_remove(mob/living/user)
	auth_fail(user)
	return FALSE

/obj/item/firing_pin/dna/dredd/gun_remove(mob/living/user)
	auth_fail(user)
	return FALSE

/obj/item/firing_pin/implant/mindshield
	desc = "This Security firing pin authorizes the weapon for only Nanotrasen Brand mindshield-implanted users."

/obj/item/firing_pin/implant/mindshield/pin_auth(mob/living/user)
	if(user)
		for(var/obj/item/implant/I in user.implants)
			if(req_implant && (I.type == /obj/item/implant/mindshield || I.type == /obj/item/implant/mindshield/centcom))
				return TRUE
	return FALSE

/obj/item/firing_pin/implant/centcom_mindshield
	name = "mindshield firing pin"
	desc = "This Centcom firing pin authorizes the weapon for only high quality mindshield-implanted users."
	icon_state = "firing_pin_centcomloyalty"
	req_implant = /obj/item/implant/mindshield/centcom

/obj/item/firing_pin/implant/centcom_mindshield/gun_remove(mob/living/user)
	auth_fail(user)
	return FALSE
