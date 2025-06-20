/obj/item/firing_pin/implant/mindshield
	name = "mindshield firing pin"
	desc = "This Security firing pin authorizes the weapon for only Nanotrasen Brand mindshield-implanted users."
	icon_state = "firing_pin_loyalty"
	req_implant = /obj/item/implant/mindshield

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