/obj/item/gun/ballistic
	available_attachments = list(
		/obj/item/attachment/scope/simple,
		/obj/item/attachment/scope/holo,
		/obj/item/attachment/scope/infrared,
		/obj/item/attachment/scope/sniper,
		/obj/item/attachment/scope/sniper/nvg,
		/obj/item/attachment/laser_sight,
		/obj/item/attachment/grip/vertical,
		/obj/item/attachment/grip/angled,
		/obj/item/attachment/grip/magnetic_harness,
	)
	var/can_air_shoot = FALSE

/obj/item/gun/ballistic/examine(mapload)
	. = ..()
	if(can_air_shoot)
		. += span_notice("You can shoot at the ceiling while on disarm intent. Simply press Z while gun is in active hand.")

/obj/item/gun/ballistic/attack_self(mob/living/user)
	if(can_air_shoot && try_air_fire(user))
		return TRUE
	return ..()

/obj/item/gun/ballistic/proc/try_air_fire(mob/living/user)
	if(!user || (user.a_intent != INTENT_DISARM) || !isturf(user.loc))
		return FALSE

	INVOKE_ASYNC(src, PROC_REF(perform_air_fire), user)

	return TRUE

/obj/item/gun/ballistic/can_shoot()
	return chambered?.BB

/obj/item/gun/ballistic/revolver/can_shoot()
	return get_ammo(FALSE, FALSE)

/obj/item/gun/ballistic/proc/perform_air_fire(mob/living/user)
	user.balloon_alert(user, "you try to shoot the roof down")
	if(!do_after(user, 1 SECONDS, src, interaction_key = src))
		return
	if(!can_shoot(user))
		shoot_with_empty_chamber(user)
		user.visible_message(
		span_hypnophrase("[user] looks like an idiot while pointing barrel of the [src.name] up and aimlessly clicking!"),
		ignored_mobs = user,
		visible_message_flags = MSG_VISUAL)
		to_chat(user, "<span class='notice'>That was a bit shamefull...</span>")
		return

	if(chambered)
		QDEL_NULL(chambered.BB)
		shoot_live_shot(user, message = 0)

	process_chamber()
	user.balloon_alert_to_viewers(user, "shoots at ceiling", "you shoot at ceiling", vision_distance = COMBAT_MESSAGE_RANGE)
	user.visible_message(
		span_hypnophrase("[user] raises the barrel of the [src.name] up and shoots at the ceiling!"),
		span_notice("You empty one round, making hole in the roof!"),
		span_danger("You hear *BANG* from the roof!"),
		visible_message_flags = MSG_AUDIBLE
	)

	//playsound(user, fire_sound, 120, FALSE)

	//update_icon()

/obj/item/gun/ballistic/revolver
	can_air_shoot = TRUE

/obj/item/gun/ballistic/automatic/pistol/v38
	can_air_shoot = TRUE
