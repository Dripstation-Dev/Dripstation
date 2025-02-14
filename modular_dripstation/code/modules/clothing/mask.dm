/obj/item/clothing/mask/gas/syndicate
	flash_protect = 1
	w_class = WEIGHT_CLASS_SMALL
	armor = list(MELEE = 10, BULLET = 0, LASER = 0, ENERGY = 10, BOMB = 0, BIO = 100, RAD = 0, FIRE = 100, ACID = 55)

/obj/item/clothing/mask/gas/syndicate/balaclava
	icon_state = "syndicate_gasmask_balaclava"
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'

/obj/item/clothing/mask/gas/captain
	name = "captain's gas mask"
	desc = "Nanotrasen cut corners and repainted a spare gas mask, but don't tell anyone."
	icon_state = "gas_cap"
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'
	armor = list(MELEE = 5, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 0, BIO = 50, FIRE = 20, ACID = 10)
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/mask/gas/combat
	name = "combat gas mask"
	desc = "Easy storrage militarygade gas mask. Property of Militech Corp&Gov Asset Security."
	icon_state = "gas_combat"
	w_class = WEIGHT_CLASS_SMALL
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'
	armor = list(MELEE = 10, BULLET = 10, LASER = 0, ENERGY = 10, BOMB = 0, BIO = 100, RAD = 0, FIRE = 100, ACID = 55)

/obj/item/clothing/mask/gas/bio
	name = "bio gas mask"
	desc = "Standart biological gasmask. While not so good for concealing your identity, it is good for blocking gas flow."
	icon_state = "gas_clear"
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'
	w_class = WEIGHT_CLASS_SMALL
	flags_inv = HIDEFACIALHAIR
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 40, FIRE = 0, ACID = 100)
	resistance_flags = ACID_PROOF

/obj/item/clothing/mask/gas/bio/sci
	name = "scientiest`s bio gas mask"
	desc = "Biological gasmask. Reinforced for working in hazard environment. While not so good for concealing your identity, it is good for blocking gas flow."
	icon_state = "gas_sci"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 30, ACID = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/mask/gas/bio/sec
	name = "security bio gas mask"
	desc = "Standart tactical bio gasmask. While not so good for concealing your identity, it is good for blocking gas flow."
	icon_state = "secbio_gasmask"
	armor = list(MELEE = 10, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 30, ACID = 100)

/obj/item/clothing/mask/gas/bio/sci/combat
	desc = "Biological gasmask. Reinforced for working in hazard environment. While good for concealing your identity, it is also good for blocking gas flow."
	icon_state = "heva"
	dynamic_hair_suffix = ""
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDEHAIR
	body_parts_covered = HEAD
	armor = list(MELEE = 10, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 100, ACID = 100)

/obj/item/clothing/mask/breath/tactical/shellguard
	icon_state = "shelg_gasmask"
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'

/obj/item/clothing/mask/scarf
	icon_state = "scarf"
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'
	actions_types = list(/datum/action/item_action/adjust)

/obj/item/clothing/mask/scarf/attack_self(mob/user)
	adjustmask(user)

/obj/item/clothing/mask/russian_balaclava
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'

/obj/item/clothing/mask/russian_balaclava/no_ru
	name = "green balaclava"

/obj/item/clothing/mask/russian_balaclava/syndicate
	name = "syndicate balaclava"
	icon_state = "syndicate_balaclava"

/obj/item/clothing/mask/russian_balaclava/black
	name = "black balaclava"
	icon_state = "balaclava_black"

/obj/item/clothing/mask/russian_balaclava/black_skull
	name = "skull balaclava"
	icon_state = "black_skull_balaclava"

/obj/item/clothing/mask/neck_gaiter
	name = "neck gaiter"
	desc = "Protects your face from snow."
	icon_state = "neck_gaiter"
	item_state = "balaclava"
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/mask/gas/sechailer/task_force
	name = "task force gas mask"
	aggressiveness = 4
	radio_key = /obj/item/encryptionkey/cent_med
	options = list(
		"code 601 (Murder) in progress" = RADIO_CHANNEL_CENTCOM, 
		"code 101 (Resisting Arrest) in progress" = RADIO_CHANNEL_CENTCOM, 
		"code 309 (Breaking and entering) in progress" = RADIO_CHANNEL_CENTCOM, 
		"code 306 (Riot) in progress" = RADIO_CHANNEL_CENTCOM, 
		"code 401 (Assault, Officer) in progress" = RADIO_CHANNEL_CENTCOM,
		"reporting an injured civilian" = RADIO_CHANNEL_MEDICAL
		)

/obj/item/clothing/mask/gas/sechailer/task_force/halt()
	set category = "Object"
	set name = "HALT"
	set src in usr

	if(!isliving(usr))
		return
	if(!can_use(usr))
		return
	if(broken_hailer)
		to_chat(usr, span_warning("\The [src]'s hailing system is broken."))
		return

	var/phrase = 0	//selects which phrase to use
	var/phrase_text = null
	var/phrase_sound = null


	if(cooldown < world.time - 30) // A cooldown, to stop people being jerks
		recent_uses++
		if(cooldown_special < world.time - 180) //A better cooldown that burns jerks
			recent_uses = initial(recent_uses)

		switch(recent_uses)
			if(3)
				to_chat(usr, span_warning("\The [src] is starting to heat up."))
			if(4)
				to_chat(usr, span_userdanger("\The [src] is heating up dangerously from overuse!"))
			if(5) //overload
				broken_hailer = 1
				to_chat(usr, span_userdanger("\The [src]'s power modulator overloads and breaks."))
				return

		phrase = rand(1,4)	// set the upper limit as the phrase above the first 'bad cop' phrase, the mask will only play 'nice' phrases
		switch(phrase)	//sets the properties of the chosen phrase
			if(1)
				phrase_text = "YOU CALL THIS RESISTING ARREST?!"
				phrase_sound = "resisting_arrest"
			if(2)
				phrase_text = "WE CALL THIS A DIFFICULTY TWEAK!"
				phrase_sound = "difficulty_tweak"
			if(3)
				phrase_text = "WHO`S THE CLOWN NOW?!"
				phrase_sound = "whos_the_clown_now"
			if(4)
				phrase_text = "STOP HITTING YOURSELF!"
				phrase_sound = "stop_hitting_yourself"

		usr.audible_message("[usr]'s Compli-o-Nator: <font color='red' size='4'><b>[phrase_text]</b></font>")
		playsound(loc, "modular_dripstation/sound/voice/[phrase_sound].wav", 60, 0, 4)
		cooldown = world.time
		cooldown_special = world.time
	
/obj/item/clothing/mask/gas/sechailer/task_force/swat
	name = "\improper task force mask"
	desc = "A close-fitting tactical mask with an especially aggressive Compli-o-nator 3000."
	actions_types = list(/datum/action/item_action/halt, /datum/action/item_action/dispatch)
	icon_state = "swat"
	item_state = "swat"
	flags_inv = HIDEFACIALHAIR|HIDEFACE|HIDEEYES|HIDEEARS|HIDEHAIR
	visor_flags_inv = 0
	mutantrace_variation = DIGITIGRADE_VARIATION

/obj/item/clothing/mask/gas/tactical
	name = "\improper tactical gas mask"
	desc = "A close-fitting tactical mask designed to conceal both the identity of the operator and act as an air-filter."
	icon_state = "gas_tactical"
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'
	flags_inv = HIDEFACE|HIDEEYES|HIDEEARS
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = HEAD
	armor = list(MELEE = 10, BULLET = 10, LASER = 10,ENERGY = 10, BOMB = 0, BIO = 100, RAD = 50, FIRE = 100, ACID = 100)

/obj/item/clothing/mask/gas/tactical/alt
	icon_state = "tacalt_gasmask"
