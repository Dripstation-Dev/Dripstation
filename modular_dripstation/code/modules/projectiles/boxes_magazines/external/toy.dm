//paintballs
/obj/item/ammo_box/magazine/toy/paintball
	name = "paintball ammo cartridge (red)"
	ammo_type = /obj/item/ammo_casing/caseless/paintball
	caliber = CALIBER_PEPPERBALL
	icon_state = "paintballmag"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	max_ammo = 20

/obj/item/ammo_box/magazine/toy/paintball/blue
	name = "paintball ammo cartridge (blue)"
	ammo_type = /obj/item/ammo_casing/caseless/paintball/blue

/obj/item/ammo_box/magazine/toy/paintball/pink
	name = "paintball ammo cartridge (pink)"
	ammo_type = /obj/item/ammo_casing/caseless/paintball/pink

/obj/item/ammo_box/magazine/toy/paintball/purple
	name = "paintball ammo cartridge (purple)"
	ammo_type = /obj/item/ammo_casing/caseless/paintball/purple

/obj/item/ammo_box/magazine/toy/paintball/orange
	name = "paintball ammo cartridge (orange)"
	ammo_type = /obj/item/ammo_casing/caseless/paintball/orange

/obj/item/ammo_box/magazine/pepperball
	name = "pistol magazine (pepperball)"
	desc = "A gun magazine filled with balls."
	icon_state = "pepperballmag"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	ammo_type = /obj/item/ammo_casing/caseless/paintball/pepper
	caliber = CALIBER_PEPPERBALL
	max_ammo = 8
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/ammo_casing/caseless/paintball
	name = "paintball"
	icon_state = "paintball"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	desc = "A red coloured plastic ball filled with paint."
	color = "#C73232"
	harmful = FALSE
	caliber = CALIBER_PEPPERBALL
	projectile_type = /obj/projectile/bullet/paintball

/obj/item/ammo_casing/caseless/paintball/blue
	desc = "A blue coloured plastic ball filled with paint."
	color = "#5998FF"
	projectile_type = /obj/projectile/bullet/paintball/blue

/obj/item/ammo_casing/caseless/paintball/pink
	desc = "A pink coloured plastic ball filled with paint."
	color = "#FF69DA"
	projectile_type = /obj/projectile/bullet/paintball/pink

/obj/item/ammo_casing/caseless/paintball/purple
	desc = "A purple coloured plastic ball filled with paint."
	color = "#910AFF"
	projectile_type = /obj/projectile/bullet/paintball/purple

/obj/item/ammo_casing/caseless/paintball/orange
	desc = "An orange coloured plastic ball filled with paint."
	color = "#FF9326"
	projectile_type = /obj/projectile/bullet/paintball/orange

/obj/item/ammo_casing/caseless/paintball/pepper
	name = "pepperball"
	icon_state = "pepperball"
	desc = "A red coloured plastic ball filled with paint."
	projectile_type = /obj/projectile/bullet/paintball/pepper

/obj/projectile/bullet/paintball
	damage = 0
	icon = 'modular_dripstation/icons/effects/projectiles/projectiles.dmi'
	icon_state = "paintball"
	color = "#C73232"

/obj/projectile/bullet/paintball/blue
	color = "#5998FF"

/obj/projectile/bullet/paintball/pink
	color = "#FF69DA"

/obj/projectile/bullet/paintball/purple
	color = "#910AFF"

/obj/projectile/bullet/paintball/orange
	color = "#FF9326"

/obj/projectile/bullet/paintball/on_hit(atom/target, blocked = FALSE)
	if(iscarbon(target))
		var/mob/living/carbon/human/H = target
		var/image/paintoverlay = image('modular_dripstation/icons/effects/paintball.dmi')
		paintoverlay.color = color
		paintoverlay.icon_state = pick("1","2","3","4","5","6","7")
		H.overlays += paintoverlay
		to_chat(H, span_warning("You feel a sharp sting."))
		H.adjustStaminaLoss(5)
	else if(isturf(target))
		target.color = color //paints walls that it hits with paint

/obj/projectile/bullet/paintball/pepper
	stamina = 5
	icon_state = "pepperball"
	var/contained_reagent = /datum/reagent/consumable/condensedcapsaicin
	var/reagent_volume = 5

/obj/projectile/bullet/paintball/pepper/on_hit(atom/target, blocked = FALSE, pierce_hit)
	if(isliving(target))
		var/mob/living/M = target
		if(M.can_inject())
			var/datum/reagent/R = new contained_reagent
			R.reaction_mob(M, VAPOR, reagent_volume)
	. = ..()
