/obj/item/radio
	icon = 'modular_dripstation/icons/obj/radio.dmi'

/obj/item/radio/examine(mob/user)
	. = ..()
	if((item_flags & IN_INVENTORY && loc == user) || (src in view(1, user)))
		// construction of frequency description
		if(istype(src, /obj/item/radio/headset))
			var/list/avail_chans = list("Use [RADIO_KEY_COMMON] for the currently tuned frequency")
			if(translate_binary)
				avail_chans += "use [MODE_TOKEN_BINARY] for [MODE_BINARY]"
			if(length(channels))
				for(var/i in 1 to length(channels))
					if(i == 1)
						avail_chans += "use [MODE_TOKEN_DEPARTMENT] or [GLOB.channel_tokens[channels[i]]] for [lowertext(channels[i])]"
					else
						avail_chans += "use [GLOB.channel_tokens[channels[i]]] for [lowertext(channels[i])]"
			. += span_notice("A small screen on the headset displays the following available frequencies:\n[english_list(avail_chans)].")
		else
			. += span_notice("Use :[MODE_KEY_RADIO] for current frequency.")

		if(command)
			. += span_info("Alt-click to toggle the high-volume mode.")
	else
		. += span_notice("A small screen on the [src] flashes, it's too small to read without going near the [src].")

/obj/item/radio/security
	icon = 'modular_dripstation/icons/obj/radio.dmi'

/obj/item/radio/headset
	worn_icon = 'modular_dripstation/icons/mob/clothing/ears.dmi'
	var/upgrade_name = "bowman headset"
	var/funny_desc = null
	var/can_be_upgraded = TRUE

/obj/item/radio/headset/attackby(obj/item/I, mob/living/user)
	. = ..()
	if(istype(I, /obj/item/bowman_upgrade))
		var/datum/component/wearertargeting/earprotection/EAPRT = GetComponent(/datum/component/wearertargeting/earprotection)
		if(!EAPRT && can_be_upgraded)
			name = upgrade_name
			if(funny_desc)
				desc = funny_desc
			else
				desc = "[desc] Protects ears from flashbangs."
			icon_state = "[icon_state]_alt"
			AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))
			qdel(src)
		else
			to_chat(user, span_warning("[src] can't be upgraded!"))

/obj/item/radio/headset/wolfears
	can_be_upgraded = FALSE	//eh

/obj/item/radio/headset/alt
	name = "bowman headset"
	icon_state = "headset_alt"

/obj/item/radio/headset/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/syndicate/obv
	icon_state = "syndie_headset"

/obj/item/radio/headset/syndicate/alt
	icon_state = "syndie_headset_alt"

/obj/item/radio/headset/headset_synthetic
	can_be_upgraded = FALSE	//eh

/obj/item/radio/headset/headset_synthetic/CtrlClick(mob/user)
	if(can_interact(user))
		attack_self(user)

/obj/item/radio/headset/headset_synthetic/examine(mob/user)
	. = ..()
	. += span_notice("Ctrl Click on [src] to tweak it.")

/obj/item/radio/headset/headset_synthetic/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, SYNTHETIC_TRAIT)
	//ADD_TRAIT(src, TRAIT_EMPPROOF_CONTENTS, SYNTHETIC_TRAIT)
	//ADD_TRAIT(src, TRAIT_EMPPROOF_SELF, SYNTHETIC_TRAIT)
	
/obj/item/radio/headset/headset_synthetic/attackby(obj/item/W, mob/user, params)
	return FALSE	

/obj/item/radio/headset/headset_synthetic/alt
	icon_state = "hos_headset_alt"

/obj/item/radio/headset/headset_synthetic/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/abductors	// need to check /obj/item/radio/headset/abductor
	name = "psychic headset"
	desc = "A headset designed to boost psychic powers. Protects ears from flashbangs."
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

/obj/item/radio/headset/heads
	icon_state = "com_headset"

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

/obj/item/radio/headset/heads/hos/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/qm
	name = "\proper the quartermaster`s radio headset"
	upgrade_name = "\proper the quartermaster's bowman headset"
	desc = "The headset of the guy who will one day be second on command."
	funny_desc = "Do you see the crates? Load into crates. When you finish, you will receive crates. If you lose crates, you will get crates. If you finish the crates, you'll get nothing. You cum in the shuttle, you get ten credits. If you break ten credits, you'll get nothing. Do you see the shuttle? Load into shuttle."
	icon_state = "qm_headset"
	keyslot = new /obj/item/encryptionkey/heads/qm
	command = TRUE

/obj/item/radio/headset/heads/magistrate
	name = "\proper the magistrate's radio headset"
	upgrade_name = "\proper the magistrate's bowman headset"
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
	upgrade_name = "\proper the Nanotrasen Representative's bowman headset"
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
	upgrade_name = "\proper the blueshield's bowman headset"
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


/obj/item/radio/headset/headset_cent/commander
	name = "\improper CentCom command bowman headset"
	desc = "A headset especially for command personnel. Protects ears from flashbangs."
	command = TRUE


//////Military type radios, funny hearing and talking on different channels///////
/obj/item/radio/headset/military
	name = "\improper military radio headset"
	freerange = TRUE
	command = TRUE
	subspace_switchable = TRUE
	subspace_transmission = FALSE

/obj/item/radio/headset/military/alt
	name = "\improper military bowman headset"
	icon_state = "headset_alt"

/obj/item/radio/headset/military/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/military/militech
	name = "\improper Militech radio headset"
	desc = "A radio headset for Militech operatives."
	frequency = 1211
	icon_state = "militech_headset"

/obj/item/radio/headset/military/militech/alt
	name = "\improper Militech bowman headset"
	icon_state = "militech_headset_alt"

/obj/item/radio/headset/military/militech/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/military/shellguard
	name = "\improper Shellguard radio headset"
	desc = "A headset especially for Shellguard operatives."
	icon_state = "shellguard_headset"
	frequency = 1209

/obj/item/radio/headset/military/shellguard/alt
	name = "\improper Shellguard bowman headset"
	icon_state = "shellguard_headset_alt"

/obj/item/radio/headset/military/shellguard/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/military
	name = "\improper military bounced radio"
	desc = "A radio especially for military."
	freerange = TRUE
	command = TRUE

/obj/item/radio/military/militech
	name = "\improper Militech bounced radio"
	desc = "A radio especially for Militech operatives."
	icon_state = "walkietalkiemilitech"
	frequency = 1211

/obj/item/radio/military/shellguard
	name = "\improper Shellguard bounced radio"
	desc = "A radio especially for Shellguard operatives."
	icon_state = "walkietalkiesec"
	frequency = 1209


//////Bowman upgrade//////
/obj/item/bowman_upgrade
	name = "bowman upgrade"
	desc = "Bowman upgrade for headsets."
	icon = 'modular_dripstation/icons/obj/rig_modules.dmi'
	icon_state = "module"
	custom_premium_price = 300

