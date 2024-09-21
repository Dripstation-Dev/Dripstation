/obj/item/melee/sledgehammer
	var/force_wielded_twohand = 15

/obj/item/melee/sledgehammer/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, \
		force_wielded = force_wielded_twohand, \
		wield_callback = CALLBACK(src, PROC_REF(on_wield)), \
		unwield_callback = CALLBACK(src, PROC_REF(on_unwield)), \
		require_twohands = TRUE, \
		wielded_stats = list(SWING_SPEED = 1.5, ENCUMBRANCE = 0.5, ENCUMBRANCE_TIME = 1 SECONDS, REACH = 1, DAMAGE_LOW = 0, DAMAGE_HIGH = 0), \
	)
	AddComponent(/datum/component/cleave_attack, \
		arc_size=180, \
		requires_wielded=TRUE, \
		no_multi_hit=TRUE, \
	) // big and heavy hammer makes wide arc

/obj/item/melee/sledgehammer/security
	name = "\improper security kuvalda"
	desc = "Tactical version of sledgehammer with more unbalanced weight. Was designed to harm walls, not crewmembers."
	icon = 'modular_dripstation/icons/obj/weapons/security.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/back.dmi'
	icon_state = "sledgehammer"
	item_state = "sledgehammer"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	slowdown = 0.2	//You need some strength to cary this shit
	armour_penetration = -10//Tactical, but still not very practical
	throwforce = 30			//OUCH
	throw_range = 3 		//Doesn't throw very far
	wound_bonus = -10		//So it`s somewhat combat
	bare_wound_bonus = 20	//So it`s somewhat combat
	force_wielded_twohand = 25

/obj/item/melee/sledgehammer/security/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		H.adjustStaminaLoss(10)
		var/atom/throw_target = get_edge_target_turf(target, get_dir(src, get_step_away(target, src)))
		H.throw_at(throw_target, 200, 4)
		to_chat(H, span_danger("\The [src] hits you very hard and throws you back!"))
