/obj/item/grenade
	// dealing with creating a [/datum/component/pellet_cloud] on detonate
	/// if set, will spew out projectiles of this type
	var/shrapnel_type
	/// the higher this number, the more projectiles are created as shrapnel
	var/shrapnel_radius
	///Did we add the component responsible for spawning sharpnel to this?
	var/shrapnel_initialized

/obj/item/grenade/stingbang
	name = "stingbang"
	icon_state = "stingbang"
	icon = 'modular_dripstation/icons/obj/weapons/grenade.dmi'
	item_state = "flashbang"
	lefthand_file = 'icons/mob/inhands/equipment/security_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/security_righthand.dmi'
	var/flashbang_range = 1 //how many tiles away the mob will be stunned.
	shrapnel_type = /obj/projectile/bullet/pellet/stingball
	shrapnel_radius = 5
	custom_premium_price = 350 // mostly gotten through cargo, but throw in one for the sec vendor ;)

/obj/item/grenade/stingbang/prime(mob/living/lanced_by)
	if(iscarbon(loc))
		var/mob/living/carbon/user = loc
		var/obj/item/bodypart/bodypart = user.get_holding_bodypart_of_item(src)
		if(bodypart)
			forceMove(get_turf(user))
			user.visible_message("<b>[span_danger("[src] goes off in [user]'s hand, blowing [user.p_their()] [bodypart.name] to bloody shreds!")]</b>", span_userdanger("[src] goes off in your hand, blowing your [bodypart.name] to bloody shreds!"))
			bodypart.dismember()

	..()
	update_mob()
	var/flashbang_turf = get_turf(src)
	if(flashbang_turf)
		do_sparks(rand(5, 9), FALSE, src)
		playsound(flashbang_turf, 'sound/weapons/flashbang.ogg', 50, TRUE, 8, 0.9)
		new /obj/effect/dummy/lighting_obj (flashbang_turf, flashbang_range + 2, 2, COLOR_WHITE, 1)
		for(var/mob/living/living_mob in get_hearers_in_view(flashbang_range, flashbang_turf))
			pop(get_turf(living_mob), living_mob)
	qdel(src)

/obj/item/grenade/stingbang/proc/pop(turf/turf, mob/living/living_mob)
	if(living_mob.stat == DEAD) //They're dead!
		return
	living_mob.show_message(span_warning("POP"), MSG_AUDIBLE)
	var/distance = max(0, get_dist(get_turf(src), turf))
//Flash
	if(living_mob.flash_act(affect_silicon = 1))
		living_mob.Paralyze(max(10/max(1, distance), 5))
		living_mob.Knockdown(max(100/max(1, distance), 60))

//Bang
	if(!distance || loc == living_mob || loc == living_mob.loc)
		living_mob.Paralyze(20)
		living_mob.Knockdown(200)
		living_mob.soundbang_act(1, 200, 10, 15)
		if(living_mob.apply_damages(10, 10))
			to_chat(living_mob, span_userdanger("The blast from \the [src] bruises and burns you!"))

	// only checking if they're on top of the tile, cause being one tile over will be its own punishment

/obj/item/grenade/syndieminibomb
	var/d_range = 1
	var/h_range = 2
	var/l_range = 4
	var/f_range = 2

/obj/item/grenade/syndieminibomb/prime()
	. = ..()
	update_mob()
	explosion(src.loc,d_range,h_range,l_range,flame_range = f_range)
	qdel(src)

/obj/item/grenade/syndieminibomb/concussion
	d_range = 0
	h_range = 2
	l_range = 4
	f_range = 3

/obj/item/grenade/syndieminibomb/nt
	name = "\improper nanotrasen minibomb"
	desc = "A nanotrasen manufactured explosive used to sow destruction and chaos."
	icon = 'modular_dripstation/icons/obj/weapons/grenade.dmi'
	icon_state = "nanotrasen"

/obj/item/grenade/syndieminibomb/concussion/frag
	shrapnel_type = /obj/projectile/bullet/shrapnel
	shrapnel_radius = 4
	d_range = 0
	h_range = 1
	l_range = 3
	f_range = 4
