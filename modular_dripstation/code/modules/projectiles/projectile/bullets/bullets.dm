
/obj/projectile/bullet
	speed = 2
	icon_state = "bullet"
	icon = 'modular_dripstation/icons/effects/projectiles/projectiles.dmi'
	shrapnel_type = /obj/item/shrapnel/bullet
	embedding = list("pain_multiplier" = 3, "embed_chance" = 45, "fall_chance" = 0, "ignore_throwspeed_threshold" = TRUE, "remove_pain_mult" = 3)
	ap_falloff_tile = 5
	embed_falloff_tile = 2

/obj/item/shrapnel // frag grenades
	name = "shrapnel shard"
	custom_materials = list(/datum/material/iron=50)
	icon = 'icons/obj/shards.dmi'
	icon_state = "large"
	w_class = WEIGHT_CLASS_TINY
	//item_flags = DROPDEL
	sharpness = SHARP_EDGED

/obj/item/shrapnel/bullet // bullets
	name = "bullet"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	icon_state = "bullet"
	embedding = null // embedding vars are taken from the projectile itself

/obj/projectile/bullet/a40mm
	icon_state = "40mm"
	shrapnel_type = null

/obj/projectile/bullet/gyro
	icon_state = "40mm"
	shrapnel_type = null

/obj/projectile/bullet/p50
	speed = 1.5

/obj/projectile/bullet/m308
	speed = 1.5

/obj/projectile/bullet/a762
	speed = 1.5

/obj/projectile/bullet/c10mm/cs
	speed = 1

/obj/projectile/bullet/c38/bluespace
	speed = 5

