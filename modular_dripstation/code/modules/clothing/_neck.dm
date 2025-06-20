/obj/item/clothing/neck/mantle
	name = "mantle"
	desc = "A decorative drape over the shoulders. This one has a simple, dry color."
	icon = 'modular_dripstation/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/neck.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/clothing_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/clothing_righthand.dmi'
	icon_state = "mantle"

/obj/item/clothing/neck/mantle/regal
	name = "regal mantle"
	desc = "A colorful felt mantle. You feel posh just holding this thing."
	icon_state = "regal-mantle"

/obj/item/clothing/neck/mantle/hopmantle
	name = "\proper the head of personnel's mantle"
	desc = "A decorative draping of blue and red over your shoulders, signifying your stamping prowess."
	icon_state = "hopmantle"

/obj/item/clothing/neck/mantle/cmomantle
	name = "\proper the chief medical officer's mantle"
	desc = "A light blue shoulder draping for THE medical professional. Contrasts well with blood."
	icon_state = "cmomantle"

/obj/item/clothing/neck/mantle/rdmantle
	name = "\proper the research director's mantle"
	desc = "A terribly comfortable shoulder draping for the discerning scientist of fashion."
	icon_state = "rdmantle"

/obj/item/clothing/neck/mantle/cemantle
	name = "\proper the chief engineer's mantle"
	desc = "A matte grey shoulder covering. Do not wear around active machinery."
	icon_state = "cemantle"

/obj/item/clothing/neck/mantle/bsmantle
	name = "\proper the blueshield's shawl"
	desc = "A plated mantle with command colors. Suitable for the one assigned to making sure they're still breathing."
	icon_state = "bsmantle"

/obj/item/clothing/neck/mantle/capmantle
	name = "\proper the captain's mantle"
	desc = "A formal mantle to drape around the shoulders. Others stand on the shoulders of giants. You're the giant they stand on."
	icon_state = "capmantle"

/obj/item/clothing/neck/mantle/hosmantle
	name = "\proper the head of security's shawl"
	desc = "A shawl worn by the Head of Security. Do you dare take up their mantle?"
	icon_state = "hosmantle"

/obj/item/clothing/neck/mantle/blueshield
	name = "\proper the blueshield's shawl"
	desc = "Worn by the Lieutenant of an elite safeguard team. Be prepared to watch everybody die horribly and stay alive to help em other day."
	icon_state = "bsmantle"

/obj/item/clothing/neck/cloak/nanotrasen_representative
	name = "\proper the nanotrasen representative's cloak"
	desc = "A cloak worn by the Nanotrasen Representative. Be careful and don't arouse Nanotrasen wrath upon you."
	icon_state = "ntrcloak"
	icon = 'modular_dripstation/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/neck.dmi'	

/obj/item/clothing/neck/cloak/magistrate
	name = "\proper the magistrate's cloak"
	desc = "A cloak worn by the Magistrate. And remember - The Law comes first."
	icon_state = "magistratecloak"
	icon = 'modular_dripstation/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/neck.dmi'	

/obj/item/clothing/neck/cloak/blueshield
	name = "\proper the blueshield's cloak"
	desc = "A cloak worn by the Blueshield. Bad bodyguard - dead bodyguard. Dead bodyguard - bad bodyguard. Stay alive."
	icon_state = "blueshieldcloak"
	icon = 'modular_dripstation/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/neck.dmi'	

/obj/item/clothing/neck/cloak/hos
	icon = 'modular_dripstation/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/neck.dmi'	

/obj/item/clothing/neck/cloak/qm
	icon = 'modular_dripstation/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/neck.dmi'

/obj/item/clothing/neck/cloak/cmo
	icon = 'modular_dripstation/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/neck.dmi'

/obj/item/clothing/neck/cloak/cap
	icon = 'modular_dripstation/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/neck.dmi'

/obj/item/clothing/neck/cloak/hop
	icon = 'modular_dripstation/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/neck.dmi'	

/obj/item/clothing/neck/cloak/ce
	icon = 'modular_dripstation/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/neck.dmi'

/obj/item/clothing/neck/cloak/ce/alt
	name = "chief engineer's green cloak"
	icon_state = "cecloak_green"

/obj/item/clothing/neck/cloak/rd
	icon = 'modular_dripstation/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/neck.dmi'	

/obj/item/clothing/neck/petcollar
	name = "silver tag collar"
	desc = "A collar for your little pets... or the big ones."
	icon_state = "collar_bksilv"
	icon = 'modular_dripstation/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/neck.dmi'	
	var/tagname = null
	var/pet_worn_icon = 'modular_dripstation/icons/mob/pet.dmi'
	var/tagtype = "silver"
	var/collar = "black"

/obj/item/clothing/neck/petcollar/attack_self(mob/user)
	tagname = stripped_input(user, "Would you like to change the name on the tag?", "Name your new pet", "Spot", MAX_NAME_LEN)
	name = "[initial(name)] - [tagname]"

/obj/item/clothing/neck/petcollar/bell
	name = "bell collar"
	desc = "It has a little bell!"
	icon_state = "petcollar"
	tagtype = "gold"
	collar = "cyan"

/obj/item/clothing/neck/petcollar/bell/Initialize(mapload)
	.= ..()
	AddComponent(/datum/component/squeak, list('sound/effects/collarbell1.ogg'=1,'sound/effects/collarbell2.ogg'=1), 50, 100, 2)

/obj/item/clothing/neck/petcollar/sec
	name = "security pet collar"
	desc = "Blood-hungry security dogs."
	icon_state = "seccollar"
	tagtype = "gold"
	collar = "sec"

/obj/item/clothing/neck/petcollar/spike
	name = "spiked collar"
	desc = "A collar with spikes that look as sharp as your teeth."
	icon_state = "collar_bkspike"
	tagtype = "spike"
	collar = "black"

/obj/item/clothing/neck/petcollar/pink
	name = "pink collar"
	desc = "This collar will make your pets look FA-BU-LOUS."
	icon_state = "collar_pisilv"
	tagtype = "silver"
	collar = "pink"

/obj/item/clothing/neck/petcollar/holo
	name = "holo-collar"
	desc = "An expensive holo-collar for the modern day pet."
	icon_state = "collar_bkholo"
	tagtype = "holo"
	collar = "black"

/obj/item/clothing/neck/collar/shock
	name = "shock collar"
	desc = "A collar used to ease hungry predators."
	icon_state = "collar_bkshk0"
	flags_1 = CONDUCT_1
	var/on = TRUE
	var/code = 2
	var/frequency = FREQ_ELECTROPACK
	var/shock_cooldown = FALSE

/obj/item/clothing/neck/collar/shock/Initialize(mapload)
	. = ..()
	set_frequency(frequency)

/obj/item/clothing/neck/collar/shock/Destroy()  //Clean up your toys when you're done.
	SSradio.remove_object(src, frequency)
	return ..()

/obj/item/clothing/neck/collar/shock/suicide_act(mob/user)
	user.visible_message(span_suicide("[user] hooks [user.p_them()]self to the shock collar and spams the trigger! It looks like [user.p_theyre()] trying to commit suicide!"))
	return (FIRELOSS)

//ATTACK HAND IGNORING PARENT RETURN VALUE
/obj/item/clothing/neck/collar/shock/attack_hand(mob/user)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(src == C.back)
			to_chat(user, span_warning("You need help taking this off!"))
			return
	return ..()

/obj/item/clothing/neck/collar/shock/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/clothing/head/helmet))
		var/obj/item/assembly/shock_kit/A = new /obj/item/assembly/shock_kit(user)
		A.icon = 'icons/obj/assemblies.dmi'

		if(!user.transferItemToLoc(W, A))
			to_chat(user, span_warning("[W] is stuck to your hand, you cannot attach it to [src]!"))
			return
		W.master = A
		A.part1 = W

		user.transferItemToLoc(src, A, TRUE)
		master = A
		A.part2 = src

		user.put_in_hands(A)
		A.add_fingerprint(user)
	else
		return ..()



/obj/item/clothing/neck/collar/shock/receive_signal(datum/signal/signal)
	if(!signal || signal.data["code"] != code)
		return

	if(isliving(loc) && on)
		if(shock_cooldown)
			return
		shock_cooldown = TRUE
		addtimer(VARSET_CALLBACK(src, shock_cooldown, FALSE), 100)
		var/mob/living/L = loc
		step(L, pick(GLOB.cardinals))

		to_chat(L, span_danger("You feel a sharp shock!"))
		var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
		s.set_up(3, 1, L)
		s.start()

		L.Paralyze(5 SECONDS)

	if(master)
		master.receive_signal()
	return

/obj/item/clothing/neck/collar/shock/proc/set_frequency(new_frequency)
	SSradio.remove_object(src, frequency)
	frequency = new_frequency
	SSradio.add_object(src, frequency, RADIO_SIGNALER)

/obj/item/clothing/neck/collar/shock/ui_status(mob/user)
	var/mob/living/carbon/C = user
	if(C?.back == src)
		return UI_CLOSE
	return ..()

/obj/item/clothing/neck/collar/shock/ui_state(mob/user)
	return GLOB.hands_state

/obj/item/clothing/neck/collar/shock/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Shock collar", name)
		ui.open()

/obj/item/clothing/neck/collar/shock/ui_data(mob/user)
	var/list/data = list()
	data["power"] = on
	data["frequency"] = frequency
	data["code"] = code
	data["minFrequency"] = MIN_FREE_FREQ
	data["maxFrequency"] = MAX_FREE_FREQ
	return data

/obj/item/clothing/neck/collar/shock/ui_act(action, params)
	if(..())
		return

	var/mob/living/carbon/C = usr
	if(C?.back == src)
		return

	switch(action)
		if("power")
			on = !on
			icon_state = "shock collar[on]"
			. = TRUE
		if("freq")
			var/value = unformat_frequency(params["freq"])
			if(value)
				frequency = sanitize_frequency(value, TRUE)
				set_frequency(frequency)
				. = TRUE
		if("code")
			var/value = text2num(params["code"])
			if(value)
				value = round(value)
				code = clamp(value, 1, 100)
				. = TRUE
		if("reset")
			if(params["reset"] == "freq")
				frequency = initial(frequency)
				. = TRUE
			else if(params["reset"] == "code")
				code = initial(code)
				. = TRUE

/obj/item/clothing/neck/choker
	name = "choker"
	desc = "Close-fitting necklace worn around the neck, 15 inch in length. Made of velvet."
	icon_state = "choker_black"

/obj/item/clothing/neck/choker/gold
	name = "gold choker"
	desc = "Close-fitting necklace worn around the neck, 15 inch in length. Made of gold."
	icon_state = "choker_gold"

/obj/item/clothing/neck/maid
	name = "maid neck cover"
	desc = "A neckpiece for a maid costume, it smells faintly of disappointment."
	icon_state = "maid_neck"