/obj/item/radio
	icon = 'modular_dripstation/icons/obj/radio.dmi'

/obj/item/radio/security
	icon = 'modular_dripstation/icons/obj/radio.dmi'

/obj/item/radio/headset
	worn_icon = 'modular_dripstation/icons/mob/clothing/ears.dmi'

/obj/item/radio/headset/syndicate/obv
	icon_state = "syndie_headset"

/obj/item/radio/headset/syndicate/alt
	icon_state = "syndie_headset_alt"
	

/obj/item/radio/headset/abductors
	name = "psychic headset"
	desc = "A headset designed to boost psychic powers. Protects ears from flashbangs"
	icon_state = "abductor_headset_alt"
	keyslot = new /obj/item/encryptionkey/abductors

/obj/item/encryptionkey/abductors
	name = "unknown encryption key"
	icon_state = "abductor_cypherkey"
	syndie = TRUE//Signifies that it de-crypts Syndicate transmissions

/obj/item/radio/headset/abductors/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/headset_cargo
	name = "supply radio headset"
	desc = "A headset used by QM`s slaves."

/obj/item/radio/headset/headset_cargo/mining

/obj/item/encryptionkey/headset_mining
	name = "mining&exploring radio encryption key"
	icon_state = "mine_cypherkey"
	channels = list(RADIO_CHANNEL_SUPPLY = 1)

/obj/item/radio/headset/headset_cargo/explorer
	name = "explorer`s radio headset"
	desc = "Headset used by explorers."
	icon_state = "expl_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_mining

/obj/item/radio/headset/headset_medcargo
	icon_state = "medcargo_headset"

/obj/item/radio/headset/headset_medsec
	icon_state = "medsec_headset"

/obj/item/radio/headset/headset_com/alt
	icon_state = "com_headset_alt"

/obj/item/radio/headset/headset_com/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/headset_com/alt/security_consultant
	keyslot2 = new /obj/item/encryptionkey/headset_sec

/obj/item/radio/headset/heads/captain
	icon_state = "cap_headset"

/obj/item/radio/headset/heads/captain/alt
	icon_state = "cap_headset_alt"

/obj/item/radio/headset/heads/rd
	icon_state = "rd_headset"

/obj/item/radio/headset/heads/hos
	icon_state = "hos_headset"

/obj/item/radio/headset/heads/hos/alt
	icon_state = "hos_headset_alt"

/obj/item/radio/headset/heads/ce
	icon_state = "ce_headset"

/obj/item/radio/headset/heads/cmo
	icon_state = "cmo_headset"

/obj/item/radio/headset/heads/hop
	icon_state = "hop_headset"

/obj/item/radio/headset/headset_rob
	icon_state = "sci_headset"

/obj/item/radio/headset/qm
	name = "\proper the quartermaster`s radio headset"
	desc = "The headset of the guy who will one day be second on command."
	icon_state = "qm_headset"
	keyslot = new /obj/item/encryptionkey/heads/qm
	command = TRUE

/obj/item/radio/headset/qm/alt
	name = "\proper the quartermaster`s bowman headset"
	desc = "Do you see the crates? Load into crates. When you finish, you will receive crates. If you lose crates, you will get crates. If you finish the crates, you'll get nothing. You cum in the shuttle, you get ten credits. If you break ten credits, you'll get nothing. Do you see the shuttle? Load into shuttle."
	icon_state = "qm_headset"

/obj/item/radio/headset/qm/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/heads/magistrate
	name = "\proper the magistrate's radio headset"
	desc = "The headset of the Magistrate."
	icon_state = "proc_headset"
	keyslot = new /obj/item/encryptionkey/heads/procedure
	command = TRUE

/obj/item/radio/headset/heads/magistrate/alt
	name = "\proper the magistrate's bowman headset"
	desc = "The headset of the Magistrate. Protects ears from flashbangs."
	icon_state = "proc_headset_alt"

/obj/item/radio/headset/heads/magistrate/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/heads/ntrep
	name = "\proper the Nanotrasen Representative's radio headset"
	desc = "The headset of the Nanotrasen Representative."
	icon_state = "proc_headset"
	keyslot = new /obj/item/encryptionkey/heads/procedure
	command = TRUE

/obj/item/radio/headset/heads/ntrep/alt
	name = "\proper the Nanotrasen Representative's bowman headset"
	desc = "The headset of the Nanotrasen Representative. Protects ears from flashbangs."
	icon_state = "proc_headset_alt"

/obj/item/radio/headset/heads/ntrep/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/blueshield
	name = "\proper the blueshield's radio headset"
	desc = "The headset of the Blueshield."
	icon_state = "cent_headset"
	keyslot = new /obj/item/encryptionkey/heads/bshield

/obj/item/radio/headset/blueshield/alt
	name = "\proper the blueshield's bowman headset"
	desc = "The headset of the Blueshield. Protects ears from flashbangs."
	icon_state = "shield_headset_alt"

/obj/item/radio/headset/blueshield/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))
