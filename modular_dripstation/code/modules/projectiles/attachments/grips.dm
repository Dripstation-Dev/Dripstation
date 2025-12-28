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
	icon = 'modular_dripstation/icons/obj/weapons/attachment.dmi'
	steady = 0.3
	accuracy = 3

/obj/item/attachment/grip/magnetic_harness
	name = "magnetic harness"
	desc = "A magnetically attached harness kit that attaches to the grip mount of a weapon. When dropped, the weapon will sling to armor."
	icon_state = "magnetic"
	icon = 'modular_dripstation/icons/obj/weapons/attachment.dmi'

/obj/item/attachment/grip/magnetic_harness/on_attach(obj/item/gun/G, mob/user = null)
	. = ..()
	G.has_magnetic_harness = TRUE

/obj/item/attachment/grip/magnetic_harness/on_detach(obj/item/gun/G, mob/living/user = null)
	. = ..()
	G.has_magnetic_harness = initial(G.has_magnetic_harness)
