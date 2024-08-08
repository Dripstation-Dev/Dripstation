/obj/item/gun/energy/update_overlays()
	if(QDELETED(src))
		return
	. = ..()
	if(!automatic_charge_overlays)
		return
	
	var/overlay_icon_state = "[icon_state]_charge"
	var/obj/item/ammo_casing/energy/shot = ammo_type[select]
	if(modifystate)
		. += mutable_appearance(icon, "[icon_state]_[initial(shot.select_name)]")
	if(cell.charge < shot.e_cost)
		. += "[icon_state]_empty"
		return
	if(modifystate)
		overlay_icon_state += "_[initial(shot.select_name)]"

	var/ratio = get_charge_ratio()
	if(shaded_charge)
		. += "[icon_state]_charge[ratio]"
		return
	for(var/i = ratio, i >= 1, i--)
		var/mutable_appearance/charge_overlay = mutable_appearance(icon, overlay_icon_state)
		charge_overlay.pixel_x = ammo_x_offset * (i - 1)
		charge_overlay.pixel_y = ammo_y_offset * (i - 1)
		. += charge_overlay