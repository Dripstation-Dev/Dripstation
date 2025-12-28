/obj/item/ammo_box/magazine/internal/nitro_express
	name = "nitro express internal magazine (.700)"
	ammo_type = /obj/item/ammo_casing/nitro_express
	caliber = NITRO_EXPRESS
	max_ammo = 2
	multiload = 1

///gets a round from the magazine, if keep is TRUE the round will stay in the gun
/obj/item/ammo_box/magazine/internal/nitro_express/proc/remove_casing(obj/item/ammo_casing/AC)
	if (!stored_ammo.len)
		return
	else
		if(AC in stored_ammo)
			stored_ammo -= AC
