// #### FILING CABINET ####
/obj/structure/filingcabinet
	icon = 'modular_dripstation/icons/obj/bureaucracy.dmi'

/obj/structure/filingcabinet/attackby(obj/item/P, mob/user, params) //overwrite in order to implement animated insertion icons and sounds
	if(istype(P, /obj/item/pen))
		var/str = reject_bad_text(stripped_input(user, "Label Cabinet(Blank to reset)", "Set label","", MAX_NAME_LEN))
		if(str)
			name = str
		else
			name = initial(name)
		return
	if(istype(P, /obj/item/paper) || istype(P, /obj/item/folder) || istype(P, /obj/item/photo) || istype(P, /obj/item/documents))
		if(!user.transferItemToLoc(P, src))
			return
		to_chat(user, span_notice("You put [P] in [src]."))
		if(istype(src, /obj/structure/filingcabinet/colored))
			var/obj/structure/filingcabinet/colored/cab = src
			var/mutable_appearance/opentrim = mutable_appearance(icon, "coloredcabinet-open-trim")
			var/mutable_appearance/open = mutable_appearance(icon, "coloredcabinet-open")
			opentrim.color = cab.colour
			var/overlays = list(opentrim, open)
			add_overlay(overlays)
			sleep(0.5 SECONDS)
			cut_overlay(overlays)
		else
			playsound(loc, 'modular_dripstation/sound/effects/filingcabinet.ogg', 30, 1)
			flick("[initial(icon_state)]-open", src)
			updateUsrDialog()
	else if(P.tool_behaviour == TOOL_WRENCH)
		to_chat(user, span_notice("You begin to [anchored ? "unwrench" : "wrench"] [src]."))
		if(P.use_tool(src, user, 20, volume=50))
			to_chat(user, span_notice("You successfully [anchored ? "unwrench" : "wrench"] [src]."))
			anchored = !anchored
	else if(user.a_intent != INTENT_HARM)
		to_chat(user, span_warning("You can't put [P] in [src]!"))
	else
		return ..()

/obj/structure/filingcabinet/Topic(href, href_list) //overwrite in order to implement animated insertion icons and sounds
	if(!usr.canUseTopic(src, BE_CLOSE, ismonkey(usr)))
		return
	if(href_list["retrieve"])
		usr << browse(null, "window=filingcabinet") // Close the menu

		var/obj/item/P = locate(href_list["retrieve"]) in src //contents[retrieveindex]
		if(istype(P) && in_range(src, usr))
			usr.put_in_hands(P)
			updateUsrDialog()
			if(istype(src, /obj/structure/filingcabinet/colored))
				var/obj/structure/filingcabinet/colored/cab = src
				var/mutable_appearance/opentrim = mutable_appearance(icon, "coloredcabinet-open-trim")
				var/mutable_appearance/open = mutable_appearance(icon, "coloredcabinet-open")
				opentrim.color = cab.colour
				var/overlays = list(opentrim, open)
				add_overlay(overlays)
				playsound(loc, 'modular_dripstation/sound/effects/filingcabinet.ogg', 30, 1)
				sleep(0.5 SECONDS)
				cut_overlay(overlays)
			else
				playsound(loc, 'modular_dripstation/sound/effects/filingcabinet.ogg', 30, 1)
				flick("[initial(icon_state)]-open", src)

/*
 * Employment contract Cabinets
 */

GLOBAL_LIST_EMPTY(employmentCabinets)

/obj/structure/filingcabinet/employment
	var/cooldown = FALSE // Only used for devils
	icon_state = "employmentcabinet"
	var/populated = FALSE

/obj/structure/filingcabinet/employment/Initialize(mapload)
	. = ..()
	GLOB.employmentCabinets += src

/obj/structure/filingcabinet/employment/Destroy()
	GLOB.employmentCabinets -= src
	return ..()

/obj/structure/filingcabinet/employment/proc/fillCurrent()
	//This proc fills the cabinet with the current crew.
	for(var/record in GLOB.data_core.locked)
		var/datum/data/record/G = record
		if(!G)
			continue
		if(G.fields["reference"])
			addFile(G.fields["reference"])


/obj/structure/filingcabinet/employment/proc/addFile(mob/living/carbon/human/employee)
	new /obj/item/paper/contract/employment(src, employee)

/obj/structure/filingcabinet/employment/attack_hand(mob/user)
	if(cooldown)
		to_chat(user, "<span class='warning'>[src] is jammed, give it a few seconds.</span>")
	else
		if(!populated)
			fillCurrent()
			populated = TRUE
		if(user.mind.special_role != "devil")
			return ..()

		else
			cooldown = TRUE
			..()
			sleep(10 SECONDS) // prevents the devil from just instantly emptying the cabinet, ensuring an easy win.
			cooldown = FALSE
