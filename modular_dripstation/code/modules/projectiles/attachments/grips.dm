/// Base grip
/obj/item/attachment/grip
	var/accuracy = 0

/obj/item/attachment/grip/on_attach(obj/item/gun/G, mob/user = null)
	. = ..()
	G.recoil -= steady
	G.spread -= accuracy

/obj/item/attachment/grip/on_detach(obj/item/gun/G, mob/living/user = null)
	. = ..()
	G.recoil += steady
	G.spread += accuracy

/obj/item/attachment/grip/vertical
	accuracy = 1

/obj/item/attachment/grip/angled
	name = "vertical grip"
	desc = "A angled grip that increases the control and steadiness of your weapon."
	icon_state = "angled_grip"
	steady = 0.3
	accuracy = 3
