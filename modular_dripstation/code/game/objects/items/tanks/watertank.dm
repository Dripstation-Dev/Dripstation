/obj/item/reagent_containers/spray/mister/janitor
	possible_transfer_amounts = list(5, 10)

/obj/item/reagent_containers/spray/mister/janitor/attack_self(var/mob/user)
	amount_per_transfer_from_this = (amount_per_transfer_from_this == 10 ? 5 : 10)
	to_chat(user, span_notice("You [amount_per_transfer_from_this == 10 ? "remove" : "affix"] the nozzle. You'll now use [amount_per_transfer_from_this] units per spray."))

//Security tank
/obj/item/watertank/pepperspray
	name = "ANTI-TIDER-2500 suppression backpack"
	desc = "The ultimate crowd-control device; this tool allows the user to quickly and efficiently pacify groups of hostile targets."
	icon = 'modular_dripstation/icons/obj/hydroponics/equipment.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/backpacks.dmi'
	icon_state = "pepperbackpacksec"
	item_state = "pepperbackpacksec"
	custom_price = 600
	volume = 1000
	slowdown = 0.3

/obj/item/watertank/pepperspray/Initialize(mapload)
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/condensedcapsaicin, 1000)

/obj/item/reagent_containers/spray/mister/pepperspray
	name = "security spray nozzle"
	desc = "A pacifying spray nozzle attached to a pepperspray tank, designed to silence perps."
	icon = 'modular_dripstation/icons/obj/hydroponics/equipment.dmi'
	icon_state = "mistersec"
	item_state = "mistersec"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/equipment/mister_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/equipment/mister_righthand.dmi'
	amount_per_transfer_from_this = 5
	possible_transfer_amounts = list(5, 10)
	current_range = 6

/obj/item/watertank/pepperspray/make_noz()
	return new /obj/item/reagent_containers/spray/mister/pepperspray(src)

/obj/item/reagent_containers/spray/mister/janitor/attack_self(var/mob/user)
	amount_per_transfer_from_this = (amount_per_transfer_from_this == 10 ? 5 : 10)
	to_chat(user, span_notice("You [amount_per_transfer_from_this == 10 ? "remove" : "affix"] the nozzle. You'll now use [amount_per_transfer_from_this] units per spray."))
