/obj/machinery/vending
	icon = 'modular_dripstation/icons/obj/vending.dmi'
	clicksound = null
	/// How long vendor takes to vend one item.
	var/vend_delay = 12
	var/can_be_shaken = FALSE

/obj/machinery/vending/update_overlays()
	. = ..()
	if(light_mask && !(stat & BROKEN) && powered())
		. += emissive_appearance(icon, light_mask, src)
	if(panel_open)
		. += mutable_appearance(icon, panel_type)
		. += emissive_blocker(icon, panel_type, src, alpha = src.alpha)

/obj/machinery/vending/attack_hand(mob/living/user)
	if(can_be_shaken && !tilted && user.a_intent == INTENT_DISARM)
		user.visible_message(span_notice("[user.name] begins to shake [src]!"), \
		span_notice("You shake [src]!"))
		shaking_anim()
		addtimer(CALLBACK(src, PROC_REF(shake_results), user), 0.75 SECONDS, TIMER_STOPPABLE)
		return
	return ..()

/obj/machinery/vending/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/simple_rotation, ROTATION_ALTCLICK| ROTATION_CLOCKWISE | ROTATION_COUNTERCLOCKWISE | ROTATION_VERBS, can_be_rotated=CALLBACK(src, PROC_REF(can_be_rotated)), after_rotation=CALLBACK(src, PROC_REF(after_rotation)))

/obj/machinery/vending/proc/can_be_rotated(mob/user)
	var/silent = FALSE
	if(!Adjacent(user))
		silent = TRUE

	if(anchored)
		if (!silent)
			to_chat(user, span_warning("[src] cannot be rotated while it is fastened to the floor!"))
		return FALSE

	return TRUE

/obj/machinery/vending/proc/after_rotation(mob/user)
	update_appearance(UPDATE_OVERLAYS)
	add_fingerprint(user)

/obj/machinery/vending/cola
	can_be_shaken = TRUE

/obj/machinery/vending/coffee
	can_be_shaken = TRUE

/obj/machinery/vending/snack
	can_be_shaken = TRUE

/obj/machinery/vending/cigarette
	can_be_shaken = TRUE

/obj/machinery/vending/proc/shake_results(mob/living/user)
	switch(rand(0,10))
		if(0 to 1)
			tilt(user, crit=TRUE)
		if(2 to 3)
			shock(user, 100)
		if(4 to 6)
			give_item(user)

/obj/machinery/vending/proc/give_item(mob/living/carbon/target)
	var/obj/give_item = null
	if(!istype(target))
		return 0

	finish_vend()
	for(var/datum/data/vending_product/R in shuffle(product_records))
		if(R.amount <= 0) //Try to use a record that actually has something to dump.
			continue
		var/dump_path = R.product_path
		if(!dump_path)
			continue
		if(R.amount > LAZYLEN(R.returned_products)) //always throw new stuff that costs before free returned stuff, because of the hacking effort and time between throws involved
			give_item = new dump_path(loc)
		else
			give_item = LAZYACCESS(R.returned_products, LAZYLEN(R.returned_products)) //first in, last out
			give_item.forceMove(loc)
			LAZYREMOVE(R.returned_products, give_item)
		R.amount--
		break
	if(!give_item)
		return 0
	if(target.CanReach(src) && target.put_in_hands(give_item))
		to_chat(usr, span_warning("[src] launches [give_item.name] out of the slot into your hands!"))
	else
		to_chat(usr, span_warning("[src] launches [give_item.name] out of the slot onto the turf!"))

	SSblackbox.record_feedback("nested tally", "vending_machine_shake_exploit", 1, list("[type]", "[give_item]"))
	return 1

/obj/machinery/vending/cart
	icon_vend = "cart-vend"
	req_access = list(ACCESS_HOP)

/obj/machinery/vending/dinnerware
	icon_vend = "dinnerware-vend"
	icon_deny = "dinnerware-deny"
	req_access = list(ACCESS_KITCHEN)

/obj/machinery/vending/medical
	icon_vend = "med-vend"
	req_access = list(ACCESS_MEDICAL)
	light_mask = "med-light-mask"
	products = list(/obj/item/stack/medical/gauze = 8,
					/obj/item/reagent_containers/syringe = 12,
					/obj/item/reagent_containers/dropper = 3,
					/obj/item/reagent_containers/pill/patch/styptic = 5,
					/obj/item/reagent_containers/pill/patch/silver_sulf = 5,
					/obj/item/reagent_containers/syringe/perfluorodecalin = 2,
					/obj/item/reagent_containers/pill/insulin = 5,
					/obj/item/reagent_containers/glass/bottle/charcoal = 4,
					/obj/item/reagent_containers/glass/bottle/epinephrine = 3,
					/obj/item/reagent_containers/glass/bottle/morphine = 4,
					/obj/item/reagent_containers/glass/bottle/potass_iodide = 1,
					/obj/item/reagent_containers/glass/bottle/salglu_solution = 3,
					/obj/item/reagent_containers/glass/bottle/toxin = 3,
					/obj/item/reagent_containers/syringe/antiviral = 6,
					/obj/item/sensor_device = 2,
					/obj/item/pinpointer/crew = 2,
					/obj/item/stack/medical/ointment = 2,
					/obj/item/stack/medical/ointment/antiseptic = 4,
					/obj/item/stack/medical/tourniquet = 4,
					/obj/item/stack/medical/bone_gel = 4)
	contraband = list(/obj/item/reagent_containers/pill/tox = 3,
					/obj/item/reagent_containers/pill/morphine = 4,
					/obj/item/reagent_containers/pill/charcoal = 6,
					/obj/item/storage/pill_bottle/gummies/mindbreaker = 2,
					/obj/item/storage/box/hug/medical = 1)
	premium = list(/obj/item/reagent_containers/medspray/synthflesh = 4,
				/obj/item/reagent_containers/medspray/fluorosurfactant = 2,
				/obj/item/reagent_containers/medspray/sterilizine = 2,
				/obj/item/storage/pill_bottle/psicodine = 2,
				/obj/item/reagent_containers/autoinjector/medipen = 3,
				/obj/item/healthanalyzer/wound = 1,
				/obj/item/storage/pouch/surgery/full = 2,
				/obj/item/storage/belt/medical = 3,
				/obj/item/wrench/medical = 1,
				/obj/item/storage/pill_bottle/gummies/vitamin = 2,
				/obj/item/storage/firstaid/advanced = 2)

/obj/machinery/vending/medical/syndicate_access
	icon_state = "syndi-big-med"
	icon_vend = "syndi-big-med-vend"
	icon_deny = "syndi-big-med-deny"
	light_color = LIGHT_COLOR_INTENSE_RED
	products = list(/obj/item/stack/medical/gauze = 8,
					/obj/item/reagent_containers/syringe = 12,
					/obj/item/reagent_containers/dropper = 3,
					/obj/item/reagent_containers/pill/patch/styptic = 5,
					/obj/item/reagent_containers/pill/patch/silver_sulf = 5,
					/obj/item/reagent_containers/syringe/perfluorodecalin = 2,
					/obj/item/reagent_containers/pill/insulin = 5,
					/obj/item/reagent_containers/glass/bottle/charcoal = 4,
					/obj/item/reagent_containers/glass/bottle/epinephrine = 3,
					/obj/item/reagent_containers/glass/bottle/morphine = 4,
					/obj/item/reagent_containers/glass/bottle/potass_iodide = 1,
					/obj/item/reagent_containers/glass/bottle/salglu_solution = 3,
					/obj/item/reagent_containers/glass/bottle/toxin = 3,
					/obj/item/reagent_containers/glass/bottle/vial/combat = 2,
					/obj/item/reagent_containers/syringe/antiviral = 6,
					/obj/item/sensor_device = 2,
					/obj/item/stack/medical/ointment = 2,
					/obj/item/stack/medical/ointment/antiseptic = 4,
					/obj/item/stack/medical/bone_gel = 4,
					/obj/item/stack/medical/tourniquet/tactical = 4,
					/obj/item/reagent_containers/pill/tox = 3,
					/obj/item/reagent_containers/pill/morphine = 4,
					/obj/item/reagent_containers/pill/charcoal = 6,
					/obj/item/storage/box/hug/medical = 1)
	premium = list(/obj/item/reagent_containers/medspray/synthflesh = 4,
				/obj/item/reagent_containers/medspray/fluorosurfactant = 2,
				/obj/item/reagent_containers/medspray/sterilizine = 2,
				/obj/item/storage/pill_bottle/psicodine = 2,
				/obj/item/reagent_containers/autoinjector/medipen = 3,
				/obj/item/reagent_containers/autoinjector/medipen/morphine = 3,
				/obj/item/reagent_containers/autoinjector/medipen/tramadol = 3,
				/obj/item/reagent_containers/autoinjector/medipen/propithal = 3,
				/obj/item/reagent_containers/autoinjector/medipen/meldonin = 3,
				/obj/item/healthanalyzer/wound = 1,
				/obj/item/healthanalyzer = 1,
				/obj/item/pinpointer/crew = 2,
				/obj/item/storage/pouch/surgery/full = 2,
				/obj/item/storage/belt/medical = 3,
				/obj/item/wrench/medical = 1,
				/obj/item/storage/pill_bottle/gummies/vitamin = 2,
				/obj/item/storage/pill_bottle/gummies/omnizine = 2,
				/obj/item/storage/pill_bottle/gummies/mindbreaker = 2,
				/obj/item/storage/pill_bottle/gummies/meth = 2,
				/obj/item/storage/firstaid/tactical/alt = 2)

/obj/machinery/vending/wallhypo
	req_access = list(ACCESS_MEDICAL)
	light_mask = "wallmed-light-mask"

/obj/machinery/vending/hydroseeds
	icon_vend = "seeds-vend"
	icon_deny = "seeds-deny"
	light_color = LIGHT_COLOR_BLUEGREEN
	req_access = list(ACCESS_HYDROPONICS)

/obj/machinery/vending/wallmed
	icon_vend = "wallmed-vend"
	light_mask = "wallmed-light-mask"
	products = list(/obj/item/stack/medical/gauze = 2,
					/obj/item/stack/medical/tourniquet/emergency = 1,
					/obj/item/reagent_containers/syringe = 3,
					/obj/item/reagent_containers/pill/patch/styptic = 5,
					/obj/item/reagent_containers/pill/patch/silver_sulf = 5,
					/obj/item/reagent_containers/pill/charcoal = 2)

/obj/machinery/vending/wallgene
	req_access = list(ACCESS_GENETICS)
	light_mask = "wallmed-light-mask"

/obj/machinery/vending/hydronutrients
	icon_vend = "nutri-vend"
	light_color = LIGHT_COLOR_BLUEGREEN
	req_access = list(ACCESS_HYDROPONICS)

/obj/machinery/vending/wardrobe/sec_wardrobe
	icon_vend = "secdrobe-vend"
	icon_deny = "secdrobe-deny"
	light_color = LIGHT_COLOR_INTENSE_RED
	req_access = list(ACCESS_SECURITY)

/obj/machinery/vending/wardrobe/medi_wardrobe
	icon_vend = "medidrobe-vend"
	icon_deny = "medidrobe-deny"
	req_access = list(ACCESS_MEDICAL)

/obj/machinery/vending/wardrobe/engi_wardrobe
	icon_vend = "engidrobe-vend"
	icon_deny = "engidrobe-deny"
	req_access = list(ACCESS_ENGINE_EQUIP)

/obj/machinery/vending/wardrobe/atmos_wardrobe
	icon_vend = "atmosdrobe-vend"
	icon_deny = "atmosdrobe-deny"
	req_access = list(ACCESS_ATMOSPHERICS)

/obj/machinery/vending/wardrobe/sig_wardrobe
	icon_vend = "sigdrobe-vend"
	icon_deny = "sigdrobe-deny"
	req_access = list(ACCESS_TCOM_ADMIN)
	light_color = COLOR_VIVID_YELLOW

/obj/machinery/vending/wardrobe/cargo_wardrobe
	icon_vend = "cargodrobe-vend"
	icon_deny = "cargodrobe-deny"
	req_access = list(ACCESS_CARGO)
	light_color = COLOR_TANGERINE_YELLOW

/obj/machinery/vending/wardrobe/robo_wardrobe
	icon_vend = "robodrobe-vend"
	icon_deny = "robodrobe-deny"
	req_access = list(ACCESS_ROBO_CONTROL)

/obj/machinery/vending/wardrobe/science_wardrobe
	icon_vend = "scidrobe-vend"
	icon_deny = "scidrobe-deny"
	req_access = list(ACCESS_RESEARCH)

/obj/machinery/vending/wardrobe/hydro_wardrobe
	icon_vend = "hydrobe-vend"
	icon_deny = "hydrobe-deny"
	req_access = list(ACCESS_HYDROPONICS)

/obj/machinery/vending/wardrobe/curator_wardrobe
	icon_vend = "curadrobe-vend"
	icon_deny = "curadrobe-deny"
	req_access = list(ACCESS_LIBRARY)

/obj/machinery/vending/wardrobe/bar_wardrobe
	icon_vend = "bardrobe-vend"
	icon_deny = "bardrobe-deny"
	req_access = list(ACCESS_BAR)

/obj/machinery/vending/wardrobe/chef_wardrobe
	icon_vend = "chefdrobe-vend"
	icon_deny = "chefdrobe-deny"
	req_access = list(ACCESS_KITCHEN)

/obj/machinery/vending/wardrobe/jani_wardrobe
	icon_vend = "janidrobe-vend"
	icon_deny = "janidrobe-deny"
	req_access = list(ACCESS_JANITOR)

/obj/machinery/vending/wardrobe/law_wardrobe
	icon_vend = "lawdrobe-vend"
	icon_deny = "lawdrobe-deny"
	req_access = list(ACCESS_LAWYER)

/obj/machinery/vending/wardrobe/chap_wardrobe
	icon_vend = "chapdrobe-vend"
	icon_deny = "chapdrobe-deny"
	req_access = list(ACCESS_CHAPEL_OFFICE)

/obj/machinery/vending/wardrobe/chem_wardrobe
	icon_vend = "chemdrobe-vend"
	icon_deny = "chemdrobe-deny"
	req_access = list(ACCESS_CHEMISTRY)

/obj/machinery/vending/wardrobe/gene_wardrobe
	icon_vend = "genedrobe-vend"
	icon_deny = "genedrobe-deny"
	req_access = list(ACCESS_GENETICS)

/obj/machinery/vending/wardrobe/viro_wardrobe
	icon_vend = "virodrobe-vend"
	icon_deny = "virodrobe-deny"
	req_access = list(ACCESS_VIROLOGY)

/obj/machinery/vending/syndichem
	icon_vend = "generic-vend"
	icon_deny = "generic-deny"
	light_mask = "generic-light-mask"

/obj/machinery/vending/tool
	icon_vend = "tool-vend"
	light_color = COLOR_VIVID_YELLOW

/obj/machinery/vending/donksofttoyvendor
	icon_vend = "syndi-vend"
	icon_deny = "syndi-deny"
	light_color = COLOR_THEME_OPERATIVE
	light_mask = "donksoft-light-mask"

/obj/machinery/vending/sustenance
	icon_deny = "sustenance-deny"
	icon_vend = "sustenance-vend"

/obj/machinery/vending/sovietsoda
	icon_deny = "sovietsoda-deny"
	icon_vend = "sovietsoda-vend"
	light_mask = "soviet-light-mask"

/obj/machinery/vending/snack
	icon_vend = "snack-vend"
	icon_deny = "snack-deny"
	light_color = LIGHT_COLOR_BLUEGREEN

/obj/machinery/vending/snack/blue
	icon_vend = "snackblue-vend"
	icon_deny = "snackblue-deny"	

/obj/machinery/vending/snack/orange
	icon_vend = "snackorange-vend"
	icon_deny = "snackorange-deny"	

/obj/machinery/vending/snack/green
	icon_vend = "snackgreen-vend"
	icon_deny = "snackgreen-deny"		

/obj/machinery/vending/snack/teal
	icon_vend = "snackteal-vend"
	icon_deny = "snackteal-deny"

/obj/machinery/vending/security
	icon_vend = "sec-vend"
	light_color = LIGHT_COLOR_HOLY_MAGIC

/obj/machinery/vending/robotics
	icon_vend = "robotics-vend"

/obj/machinery/vending/plasmaresearch
	icon_deny = "generic-deny"
	icon_vend = "generic-vend"
	light_mask = "generic-light-mask"

/obj/machinery/vending/modularpc
	icon_vend = "modularpc-vend"
	light_color = COLOR_WHITE

/obj/machinery/vending/magivend
	icon_deny = "magivend-deny"
	icon_vend = "magivend-vend"

/obj/machinery/vending/toyliberationstation
	icon_vend = "syndi-vend"
	icon_deny = "syndi-deny"
	light_color = COLOR_THEME_OPERATIVE

/obj/machinery/vending/liberationstation
	icon_vend = "liberationstation-vend"
	icon_deny = "liberationstation-deny"

/obj/machinery/vending/games
	icon_deny = "games-deny"
	icon_vend = "games-vend"

/obj/machinery/vending/engivend
	icon_vend = "engivend-vend"

/obj/machinery/vending/engineering
	icon_vend = "engi-vend"

/obj/machinery/vending/cola
	icon_vend = "Cola_Machine-vend"
	icon_deny = "Cola_Machine-deny"	

/obj/machinery/vending/cola/black
	icon_vend = "cola_black-vend"
	icon_deny = "cola_black-deny"			
	light_mask = "cola_black-light-mask"

/obj/machinery/vending/cola/red
	icon_vend = "red_cola-vend"
	icon_deny = "red_cola-deny"
	light_mask = "red_cola-light-mask"

/obj/machinery/vending/cola/space_up
	icon_vend = "space_up-vend"
	icon_deny = "space_up-deny"
	light_mask = "space_up-light-mask"

/obj/machinery/vending/cola/starkist
	icon_vend = "starkist-vend"
	icon_deny = "starkist-deny"
	light_color = LIGHT_COLOR_ORANGE
	light_mask = "starkist-light-mask"

/obj/machinery/vending/cola/sodie
	icon_vend = "soda-vend"
	icon_deny = "soda-deny"
	light_mask = "starkist-light-mask"

/obj/machinery/vending/cola/pwr_game
	icon_vend = "pwr_game-vend"
	icon_deny = "pwr_game-deny"
	light_mask = "pwr-light-mask"

/obj/machinery/vending/cola/shamblers
	icon_vend = "shamblers_juice-vend"
	icon_deny = "shamblers_juice-deny"
	light_mask = "shamblers-light-mask"

/obj/machinery/vending/coffee
	icon_deny = "coffee-deny"
	light_color = LIGHT_COLOR_BROWN

/obj/machinery/vending/clothing
	icon_vend = "clothes-vend"
	light_color = LIGHT_COLOR_ELECTRIC_GREEN

/obj/machinery/vending/cigarette
	icon_vend = "cigs-vend"
	icon_deny = "cigs-deny"

/obj/machinery/vending/boozeomat
	icon_vend = "boozeomat-vend"
	light_color = LIGHT_COLOR_BLUEGREEN

/obj/machinery/vending/autodrobe
	icon_vend = "theater-vend"

/obj/machinery/vending/assist
	icon_vend = "parts-vend"
	icon_deny = "parts-deny"
	light_mask = "parts-light-mask"

/obj/machinery/vending/fishing
	icon_vend = "fishing-vend"
	light_mask = "fishing-light-mask"
	light_color = LIGHT_COLOR_ELECTRIC_GREEN

/obj/machinery/vending/gifts
	icon_vend = "gifts-vend"
	light_mask = "gifts-light-mask"
	light_color = LIGHT_COLOR_HOLY_MAGIC

/obj/machinery/lapvend
	// light_mask = "robotics-light-mask"
