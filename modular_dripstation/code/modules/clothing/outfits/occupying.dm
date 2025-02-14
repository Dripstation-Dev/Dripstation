// Peacekeeping force clothing
/obj/item/clothing/under/rank/centcom/officer/occ/Initialize(mob/user)
	. = ..()
	if(prob(50)) // Adds variation to the uniform. 50% will be worn casually.
		rolldown(TRUE)

/obj/item/clothing/head/beret/sec/centcom/occupying
	name = "peacekeeping force beret"
	desc = "A special beret for the mundane life of an Peacekeeper force commander."

/obj/item/clothing/head/helmet/riot/raised/occupying
	name = "peacekeeping force riot helmet"
	desc = "It's a helmet specifically designed for the Peacekeeping force to protect against close range attacks."

// Peacekeeping force vest loadouts
// To note: each vest has 7 normal slots - Hopek
/obj/item/storage/belt/military/occupying_officer/Initialize() // Occupying Officer
	. = ..()
	new /obj/item/ammo_box/magazine/wt550m9/wtr(src)
	new /obj/item/ammo_box/magazine/wt550m9/wtr(src)
	new /obj/item/reagent_containers/autoinjector/medipen(src)
	new /obj/item/reagent_containers/autoinjector/medipen/stimpack(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)
	new /obj/item/reagent_containers/food/snacks/pizzaslice/pepperoni(src)


/obj/item/storage/belt/military/occupying_commander/Initialize() // Occupying force Commander
	. = ..()
	new /obj/item/ammo_box/magazine/wt550m9/wtr(src)
	new /obj/item/ammo_box/magazine/wt550m9/wtr(src)
	new /obj/item/reagent_containers/autoinjector/medipen(src)
	new /obj/item/reagent_containers/autoinjector/medipen/stimpack(src)
	new /obj/item/reagent_containers/food/snacks/pizzaslice/pepperoni(src)
	new /obj/item/megaphone(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)

/obj/item/storage/belt/military/occupying_heavy/Initialize() // Occupying Riot Officer
	. = ..()
	new /obj/item/restraints/legcuffs/bola/energy(src)
	new /obj/item/restraints/legcuffs/bola/energy(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/reagent_containers/food/snacks/pizzaslice/pepperoni(src)
	new /obj/item/reagent_containers/autoinjector/medipen(src)
	new /obj/item/reagent_containers/autoinjector/medipen/stimpack(src)
	new /obj/item/flashlight/flare/signal(src)


/datum/outfit/occupying
	name = "Peacekeeping Officer"
	uniform = /obj/item/clothing/under/rank/centcom/officer/occ
	suit = /obj/item/clothing/suit/armor/vest/alt
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black/tactifool
	ears = /obj/item/radio/headset/headset_cent/alt
	mask = /obj/item/clothing/mask/cigarette/lit
	belt = /obj/item/storage/belt/military/occupying_officer
	suit_store = /obj/item/gun/ballistic/automatic/wt550/armory
	back = /obj/item/melee/baton/cattleprod/tactical
	head = /obj/item/clothing/head/helmet/sec/occupying
	l_pocket = /obj/item/storage/pouch/tools/ert
	r_pocket = /obj/item/storage/pouch/pistol/advtaser
	id = /obj/item/card/id/ert/occupying
	box = /obj/item/storage/box/ert
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert)
	

/datum/outfit/occupying/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	H.facial_hair_style = "None" // Everyone in the Peacekeeping force has no facial hair
	H.hair_style = "Buzzcut"
	H.hair_color = "#1C1C1C"
	
	var/obj/item/radio/R = H.ears
	R.set_frequency(FREQ_CENTCOM)
	R.freqlock = TRUE

	var/obj/item/card/id/W = H.wear_id
	W.access = get_centcom_access("CentCom Official")
	W.access += ACCESS_MAINT_TUNNELS
	W.access += ACCESS_WEAPONS
	W.access += ACCESS_BRIG
	W.registered_name = W.assignment
	W.update_label(W.registered_name)

	H.ignores_capitalism = TRUE // Yogs -- Lets the Peacekeeping force buy a damned smoke for christ's sake


/datum/outfit/occupying/commander
	name = "Peacekeeping force Commander"
	head = /obj/item/clothing/head/beret/sec/centcom/occupying
	belt = /obj/item/storage/belt/military/occupying_commander
	l_pocket = /obj/item/storage/pouch/general/large/command/ert
	mask = /obj/item/clothing/mask/cigarette/cigar/cohiba
	glasses = /obj/item/clothing/glasses/hud/security/military
	r_hand = /obj/item/lighter/greyscale

/datum/outfit/occupying/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	var/obj/item/card/id/W = H.wear_id
	W.assignment = "Peacekeeping Officer"
	W.originalassignment = "Occupying Officer"
	W.registered_name = W.assignment
	W.update_label()

/datum/outfit/occupying/heavy
	name = "Peacekeeping Riot Officer"
	belt = /obj/item/storage/belt/military/occupying_heavy
	back = /obj/item/shield/riot
	l_pocket = /obj/item/reagent_containers/spray/pepper
	head = /obj/item/clothing/head/helmet/riot/raised/occupying
	suit = /obj/item/clothing/suit/armor/riot/occupying
	mask = /obj/item/clothing/mask/breath/tactical
	suit_store = /obj/item/melee/classic_baton/blc 
	glasses = /obj/item/clothing/glasses/sunglasses 

/datum/outfit/occupying/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	var/obj/item/card/id/W = H.wear_id
	W.assignment = "Peacekeeping Specialist"
	W.registered_name = W.assignment
	W.update_label()
