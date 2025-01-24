/obj/item/clothing/mask/gas/syndicate
	flash_protect = 1
	w_class = WEIGHT_CLASS_SMALL
	armor = list(MELEE = 10, BULLET = 0, LASER = 0, ENERGY = 10, BOMB = 0, BIO = 100, RAD = 0, FIRE = 100, ACID = 55)

/obj/item/clothing/mask/gas/syndicate/balaclava
	icon_state = "syndicate_gasmask_balaclava"
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'

/obj/item/clothing/mask/gas/captain
	name = "captain's gas mask"
	desc = "Nanotrasen cut corners and repainted a spare gas mask, but don't tell anyone."
	icon_state = "gas_cap"
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'
	armor = list(MELEE = 5, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 0, BIO = 50, FIRE = 20, ACID = 10)
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/mask/gas/bio
	name = "bio gas mask"
	desc = "Standart biological gasmask. While not so good for concealing your identity, it is good for blocking gas flow."
	icon_state = "gas_clear"
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'
	w_class = WEIGHT_CLASS_SMALL
	flags_inv = HIDEFACIALHAIR
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 40, FIRE = 0, ACID = 100)
	resistance_flags = ACID_PROOF

/obj/item/clothing/mask/gas/bio/sci
	name = "scientiest`s bio gas mask"
	desc = "Biological gasmask. Reinforced for working in hazard environment. While not so good for concealing your identity, it is good for blocking gas flow."
	icon_state = "gas_sci"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 30, ACID = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/mask/gas/bio/sec
	name = "security bio gas mask"
	desc = "Standart tactical bio gasmask. While not so good for concealing your identity, it is good for blocking gas flow."
	icon_state = "secbio_gasmask"
	armor = list(MELEE = 10, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 30, ACID = 100)

/obj/item/clothing/mask/gas/bio/sci/combat
	desc = "Biological gasmask. Reinforced for working in hazard environment. While good for concealing your identity, it is also good for blocking gas flow."
	icon_state = "heva"
	dynamic_hair_suffix = ""
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDEHAIR
	body_parts_covered = HEAD
	armor = list(MELEE = 10, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 100, ACID = 100)

/obj/item/clothing/mask/breath/tactical/shellguard
	icon_state = "shelg_gasmask"
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'

/obj/item/clothing/mask/scarf
	icon_state = "scarf"
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'
	actions_types = list(/datum/action/item_action/adjust)

/obj/item/clothing/mask/scarf/attack_self(mob/user)
	adjustmask(user)

/obj/item/clothing/mask/russian_balaclava
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'

/obj/item/clothing/mask/russian_balaclava/syndicate
	name = "syndicate balaclava"
	icon_state = "syndicate_balaclava"

/obj/item/clothing/mask/russian_balaclava/black
	name = "black balaclava"
	icon_state = "balaclava_black"

/obj/item/clothing/mask/russian_balaclava/black_skull
	name = "skull balaclava"
	icon_state = "black_skull_balaclava"

/obj/item/clothing/mask/neck_gaiter
	name = "neck gaiter"
	desc = "Protects your face from snow."
	icon_state = "neck_gaiter"
	item_state = "balaclava"
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_SMALL
