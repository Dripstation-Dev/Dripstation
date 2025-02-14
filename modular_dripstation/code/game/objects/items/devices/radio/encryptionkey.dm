/obj/item/encryptionkey
	icon = 'modular_dripstation/icons/obj/radio.dmi'

/obj/item/encryptionkey/heads/hop
	name = "\proper the head of personnel's encryption key"
	icon_state = "hop_cypherkey"
	channels = list(RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/heads/qm
	name = "\proper the quartermaster's encryption key"
	icon_state = "qm_cypherkey"
	channels = list(RADIO_CHANNEL_SUPPLY = 1, RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/heads/procedure
	name = "\proper the procedure encryption key"
	icon_state = "proc_cypherkey"
	channels = list(RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_SERVICE = 1)

/obj/item/encryptionkey/heads/bshield
	name = "\proper the close protection encryption key"
	icon_state = "bshield_cypherkey"
	channels = list(RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_MEDICAL = 1)

/obj/item/encryptionkey/cent_med
	name = "\improper CentCom radio encryption key"
	icon_state = "cent_cypherkey"
	independent = TRUE
	channels = list(RADIO_CHANNEL_CENTCOM = 1, RADIO_CHANNEL_MEDICAL = 1)
