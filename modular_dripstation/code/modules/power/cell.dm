/obj/item/stock_parts/cell
	icon = 'modular_dripstation/icons/obj/power.dmi'
	var/indicator_icon = "standard"
	var/last_overlay_state = null // Used to optimize calls.

/obj/item/stock_parts/cell/Initialize(mapload, override_maxcharge)
	. = ..()
	update_appearance(UPDATE_OVERLAYS)

/obj/item/stock_parts/cell/update_overlays()
	. = ..()
	if(grown_battery)
		cut_overlays()
		. += image('icons/obj/power.dmi',"grown_wires")
	var/ratio = clamp(round(charge / maxcharge, 0.25) * 100, 0, 100)
	var/new_state = "[indicator_icon]_[ratio]"
	if(new_state != last_overlay_state)
		cut_overlay(last_overlay_state)
		add_overlay(new_state)
		last_overlay_state = new_state
	if(!grown_battery)
		. += emissive_appearance(icon, "standard_0", src)


// gun power cell //
/obj/item/stock_parts/cell/gun
	name = "weapon power cell"
	icon_state = "g-cell"
	rating = 0 //gun batteries now incompatible with RPED WS edit

/obj/item/stock_parts/cell/gun/empty/Initialize()
	. = ..()
	charge = 0
	update_icon()

/obj/item/stock_parts/cell/gun/update_icon()
	cut_overlays()
	if(grown_battery)
		. += mutable_appearance('icons/obj/power.dmi', "grown_wires")
	if(charge < 0.1)
		return
	else if(charge/maxcharge >=0.995)
		add_overlay("[initial(icon_state)]-o4")
	else if(charge/maxcharge >=0.745)
		add_overlay("[initial(icon_state)]-o3")
	else if(charge/maxcharge >=0.495)
		add_overlay("[initial(icon_state)]-o2")
	else
		add_overlay("[initial(icon_state)]-o1")

/obj/item/stock_parts/cell/gun/upgraded
	name = "upgraded weapon power cell"
	icon_state = "ug-cell"
	maxcharge = 2000
	custom_materials = list(/datum/material/glass=300)
	chargerate = 200

/obj/item/stock_parts/cell/gun/upgraded/empty/Initialize()
	. = ..()
	charge = 0
	update_icon()

/obj/item/stock_parts/cell/gun/mini
	name = "miniature weapon power cell"
	icon_state = "mg-cell"
	maxcharge = 600
	custom_materials = list(/datum/material/glass=300)
	chargerate = 100

/obj/item/stock_parts/cell/gun/mini/empty/Initialize()
	. = ..()
	charge = 0
	update_icon()

/obj/item/stock_parts/cell/gun/bluespace
	name = "bluespace weapon power cell"
	desc = "A rechargeable transdimensional weapon power cell."
	icon_state = "bsg-cell"
	maxcharge = 4000
	materials = list(/datum/material/glass=600)
	chargerate = 400	

/obj/item/stock_parts/cell/gun/bluespace/empty/Initialize()
	. = ..()
	charge = 0
	update_icon()

/obj/item/stock_parts/cell/gun/large
	name = "extra-large weapon power cell"
	icon_state = "bg-cell"
	maxcharge = 5000
	custom_materials = list(/datum/material/glass=1000)
	chargerate = 500
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/stock_parts/cell/gun/large/empty/Initialize()
	. = ..()
	charge = 0
	update_icon()

/obj/item/stock_parts/cell/gun/pulse //25 pulse shots
	name = "pulse power weapon cell"
	icon_state = "bsg-cell"
	maxcharge = 5000
	chargerate = 1000

/obj/item/stock_parts/cell/gun/pulse/large //200 pulse shots
	name = "large pulse weapon power cell"
	icon_state = "bbg-cell"
	maxcharge = 40000
	chargerate = 8000
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/stock_parts/cell/gun/pulse/pistol //10 pulse shots
	name = "mini pulse weapon power cell"
	icon_state = "mg-cell"
	maxcharge = 2000
	chargerate = 400

/obj/item/stock_parts/cell/gun/infinite
	name = "infinite-capacity weapon power cell"
	icon_state = "bg-cell"
	maxcharge = 30000
	materials = list(/datum/material/glass=1000)
	chargerate = 30000
