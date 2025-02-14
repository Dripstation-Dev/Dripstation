// ###### HOS ######
/obj/item/clothing/under/rank/security/head_of_security
	icon = 'modular_dripstation/icons/obj/clothing/uniform/security/hos.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/security/hos.dmi'

/obj/item/clothing/under/rank/security/head_of_security/skirt
	can_adjust = TRUE
	fitted = NO_FEMALE_UNIFORM

/obj/item/clothing/under/rank/security/head_of_security/corporate
	name = "head of security's corporate uniform"
	desc = "Standart issue fancy corporate uniform issued to the Head of Security."
	icon_state = "hos_corporate"
	can_adjust = FALSE
	mutantrace_variation = NONE	

/obj/item/clothing/under/rank/security/head_of_security/corporate/skirt
	name = "head of security's corporate dress"
	desc = "Standart issue fancy corporate dress issued to the Head of Security."
	icon_state = "hos_corporatef"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = NO_FEMALE_UNIFORM

/obj/item/clothing/mask/gas/sechailer/swat/hos
	name = "\improper HOS SWAT mask"
	icon_state = "hosmask"	
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'	

/obj/item/clothing/head/HoS
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'

/obj/item/clothing/head/helmet/HoS
	name = "\improper HOS SWAT helmet"
	desc = "It's a helmet specifically designed to protect against all types of attacks. Exclusive for station Head of Security."
	icon_state = "hosswat"
	item_state = "swat"
	armor = list(MELEE = 40, BULLET = 30, LASER = 30, ENERGY = 40, BOMB = 50, BIO = 90, RAD = 20, FIRE = 70, ACID = 90, WOUND = 15)
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	flags_inv = HIDEMASK|HIDEEARS|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/suit/armor/riot/hos
	name = "\improper HOS SWAT suit"
	desc = "A suit of semi-flexible polycarbonate body armor with heavy padding and plastitanium inserts to protect against both melee and range attacks. Helps the wearer resist shoving in close quarters."
	icon_state = "armor_hos"
	item_state = "hos"
	mutantrace_variation = NONE
	armor = list(MELEE = 50, BULLET = 30, LASER = 30, ENERGY = 40, BOMB = 50, BIO = 0, RAD = 0, FIRE = 70, ACID = 90, WOUND = 15)
	slowdown = 0.2

/obj/item/clothing/head/HoS/beret
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'

/obj/item/clothing/head/HoS/dictator
	icon_state = "policechiefcap"	
	item_state = "policechiefcap"	
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	name = "dictator head of security cap"
	desc = "Kill your own, to keep enemy in fear."

/obj/item/clothing/suit/armor/hos/trenchcoat
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	mutantrace_variation = NONE

/obj/item/clothing/suit/armor/hos/trenchcoat/winter
	name = "head of Security's winter trenchcoat"
	icon_state = "coathos_alt"
	item_state = "coathos_alt"	
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT	
	armor = list(MELEE = 35, BULLET = 25, LASER = 40, ENERGY = 20, BOMB = 35, BIO = 0, RAD = 0, FIRE = 0, ACID = 55)

// ###### WARDEN ######

/obj/item/clothing/under/rank/security/warden
	name = "warden's jumpsuit"
	alt_covers_chest = FALSE
	icon = 'modular_dripstation/icons/obj/clothing/uniform/security/warden.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/security/warden.dmi'

/obj/item/clothing/under/rank/security/warden/skirt
	name = "warden's jumpskirt"
	alt_covers_chest = TRUE
	can_adjust = TRUE
	fitted = NO_FEMALE_UNIFORM

/obj/item/clothing/under/rank/security/warden/alt
	name = "black warden uniform"
	desc = "A jumpsuit made of strong material, providing robust protection."
	icon_state = "bwarden"
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/security/warden/corporate
	name = "warden's corporate uniform"
	desc = "Standart issue fancy corporate uniform issued to the Warden."
	icon_state = "warden_corporate"
	can_adjust = FALSE
	mutantrace_variation = NONE	
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/security/warden/classic
	name = "warden's classic uniform"
	desc = "Old issue fancy security uniform, this one has silver lining."
	icon_state = "warden-collar"
	can_adjust = FALSE
	mutantrace_variation = NONE	
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/security/warden/corporate/skirt
	name = "head of security's corporate dress"
	desc = "Standart issue fancy corporate dress issued to the Head of Security."
	icon_state = "warden_corporatef"
	can_adjust = FALSE
	mutantrace_variation = NONE	

/obj/item/clothing/mask/gas/sechailer/swat/warden
	name = "\improper Warden SWAT mask"
	icon_state = "wardenmask"	
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'	

/obj/item/clothing/under/rank/security/warden/navyblue
	mutantrace_variation = NONE	

/obj/item/clothing/suit/armor/wardenjacket
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'

/obj/item/clothing/suit/armor/vest/warden
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "warden_jacket"

/obj/item/clothing/suit/armor/vest/warden/alt
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "warden_alt"

/obj/item/clothing/suit/armor/vest/warden/winter
	name = "warden's winter coat"
	desc = "High fashion is required even if the armory is a literal freezer."
	icon_state = "coatwarden"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'	
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	mutantrace_variation = NONE	
	armor = list(MELEE = 35, BULLET = 25, LASER = 30, ENERGY = 10, BOMB = 15, BIO = 0, RAD = 0, FIRE = 50, ACID = 75, WOUND = 20)

/obj/item/clothing/suit/armor/vest/warden/short
	name = "Warden's short jacket"
	desc = "A short, armored jacket, perfect for desk duty."
	icon_state = "warden_sjacket"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	mutantrace_variation = NONE

/obj/item/clothing/head/warden
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	armor = list(MELEE = 35, BULLET = 30, LASER = 25, ENERGY = 10, BOMB = 25, BIO = 10, RAD = 0, FIRE = 50, ACID = 50, WOUND = 5)	

/obj/item/clothing/head/beret/sec/navywarden
	armor = list(MELEE = 35, BULLET = 30, LASER = 25, ENERGY = 10, BOMB = 25, BIO = 10, RAD = 0, FIRE = 50, ACID = 50, WOUND = 5)

/obj/item/clothing/head/warden/drill
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'

/obj/item/clothing/head/beret/corpwarden
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "beret_corporate_warden"
	armor = list(MELEE = 35, BULLET = 30, LASER = 25, ENERGY = 10, BOMB = 25, BIO = 10, RAD = 0, FIRE = 50, ACID = 50, WOUND = 5)

// ###### OFFICER ######

/obj/item/clothing/under/rank/security/officer
	icon = 'modular_dripstation/icons/obj/clothing/uniform/security/security.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/security/security.dmi'

/obj/item/clothing/under/rank/security/officer/skirt
	can_adjust = TRUE
	fitted = NO_FEMALE_UNIFORM

/obj/item/clothing/under/rank/security/officer/alt
	name = "black security uniform"
	desc = "A jumpsuit made of strong material, providing robust protection."
	icon_state = "bsecurity"

/obj/item/clothing/under/rank/security/officer/redshirt
	name = "white classic security uniform"
	desc = "A jumpsuit made of strong material, providing robust protection."
	icon_state = "redshirt"

/obj/item/clothing/under/rank/security/officer/corporate
	name = "corporate security uniform"
	desc = "Standart issue fancy corporate uniform issued to offcers."
	icon_state = "sec_corporate"

/obj/item/clothing/under/rank/security/officer/classic
	name = "classic security uniform"
	desc = "Old issue fancy security uniform, this one has gold lining."
	icon_state = "clsecurity"

/obj/item/clothing/under/rank/security/officer/navyblue
	icon = 'icons/obj/clothing/uniforms.dmi'
	worn_icon = 'icons/mob/clothing/uniform/uniform.dmi'

/obj/item/clothing/under/rank/security/officer/navyblue/russian
	icon_state = "officertanclothes"
	icon = 'icons/obj/clothing/uniforms.dmi'
	worn_icon = 'icons/mob/clothing/uniform/uniform.dmi'
	
/obj/item/clothing/head/soft/sec/corp
	name = "corporate security cap"
	desc = "It's a baseball hat in corporate colours."
	icon_state = "corpsoft"
	soft_type = "corp"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'		

/obj/item/clothing/head/officer
	name = "officer's cap"
	desc = "A red cap with an old-fashioned badge on the front for establishing that you are, in fact, the law."
	icon_state = "customshelm"
	item_state = "customshelm"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'	
	armor = list(MELEE = 25, BULLET = 15, LASER = 15, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 20, ACID = 50)
	strip_delay = 60
	dynamic_hair_suffix = ""

/obj/item/clothing/head/beret/sec
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'	
	armor = list(MELEE = 25, BULLET = 15, LASER = 15, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 20, ACID = 50)

/obj/item/clothing/head/beret/corpsec
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "beret_corporate_officer"
	armor = list(MELEE = 25, BULLET = 15, LASER = 15, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 20, ACID = 50)

/obj/item/clothing/suit/armor/officerjacket
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'	

/obj/item/clothing/shoes/jackboots/jacksandal
	name = "jacksandals"
	desc = "Nanotrasen-issue Security combat sandals for combat scenarios. They're jacksandals, however that works."
	icon_state = "jacksandal"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'	
	pocket_storage_component_path = null

/*
 *Physician
 */

/obj/item/clothing/under/yogs/rank/physician
	name = "brig recovery medic's undersuit"
	desc = "A verstile red and white uniform honored to hard working recovery medics in hazardous environments. It has minor protection against biohazards."
	icon_state = "recovery_bm"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/security/brig_physician.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/security/brig_physician.dmi'

/obj/item/clothing/under/yogs/rank/physician/alt
	name = "brig recovery medic's undersuit"
	desc = "A verstile black and red uniform honored to hard working recovery medics in hazardous environments. It has minor protection against biohazards."
	icon_state = "brig_medical"
	can_adjust = TRUE
	alt_covers_chest = FALSE

/obj/item/clothing/under/yogs/rank/physician/alt/skirt
	name = "brig recovery medic's underskirt"
	icon_state = "brigmed_skirt"
	mutantrace_variation = NONE
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/yogs/rank/physician/white
	icon_state = "security_medic"
	desc = "White formal jumpsuit that connects you to your medsci brothers and sisters."
	icon = 'modular_dripstation/icons/obj/clothing/uniform/security/brig_physician.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/security/brig_physician.dmi'
	can_adjust = TRUE

/obj/item/clothing/under/yogs/rank/physician/white/skirt
	icon_state = "security_medic_skirt"
	desc = "White formal jumpskirt that connects you to your medsci brothers and sisters."

/obj/item/clothing/under/yogs/rank/physician/turtle
	name = "brig physician's turtleneck"
	desc = "A stylish turtleneck complete with tactical pants."
	icon_state = "security_medic_turtleneck"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/security/brig_physician.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/security/brig_physician.dmi'
	can_adjust = TRUE

/obj/item/clothing/under/yogs/rank/physician/turtle/skirt
	name = "brig physician's turtleneck skirt"
	desc = "A stylish turtleneck complete with tactical skirt."
	icon_state = "security_medic_turtleneck_skirt"
	mutantrace_variation = NONE
	fitted = FEMALE_UNIFORM_TOP

////Detective////
/obj/item/clothing/under/rank/security/detective
	icon = 'modular_dripstation/icons/obj/clothing/uniform/security/detective.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/security/detective.dmi'

/obj/item/clothing/under/rank/security/detective/grey
	icon_state = "noirdet"

/obj/item/clothing/under/rank/security/detective/grey/skirt
	icon_state = "noirdet_skirt"

/obj/item/clothing/suit/det_suit
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	armor = list(MELEE = 25, BULLET = 15, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 0, ACID = 45, WOUND = 10)
	mutantrace_variation = NONE

/obj/item/clothing/suit/det_suit/noir
	icon_state = "noir_detective"

// ###### SECURITY CONSULTANT ######
/obj/item/clothing/under/rank/security/consultant
	name = "security consultant's uniform"
	desc = "Black and blue formal jumpsuit that shows your NanoTrasen alighment."
	icon_state = "bluesec_black"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/security/security_consultant.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/security/security_consultant.dmi'
	can_adjust = TRUE
	mutantrace_variation = NONE

/obj/item/clothing/under/rank/security/consultant/skirt
	name = "security consultant's skirt"
	desc = "Black and blue formal jumpskirt that shows your NanoTrasen alighment."
	icon_state = "bluesec_longskirt"
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/rank/security/consultant/tactical
	name = "security consultant's turtleneck"
	desc = "A stylish turtleneck complete with tactical pants."
	icon_state = "blueturtle"

/obj/item/clothing/under/rank/security/consultant/skirt/tactical
	name = "security consultant's turtleneck skirt"
	desc = "A stylish turtleneck complete with tactical skirt."
	icon_state = "blueturtle_skirt_blue"

// ###### CORRECTIONS OFFICER ######
/obj/item/clothing/under/rank/security/corrections_officer
	name = "corrections officer's uniform"
	desc = "Black and white formal jumpsuit that shows your NanoTrasen alighment."
	icon_state = "corrections_officer"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/security/corrections.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/security/corrections.dmi'
	can_adjust = TRUE
	mutantrace_variation = NONE

/obj/item/clothing/under/rank/security/corrections_officer/skirt
	name = "corrections officer's skirt"
	desc = "Black and white formal jumpskirt that shows your NanoTrasen alighment."
	icon_state = "corrections_officerw"
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/rank/security/corrections_officer/tactical
	name = "corrections officer's turtleneck"
	desc = "A stylish turtleneck complete with tactical pants."
	icon_state = "corrections_officer_sweat"

/obj/item/clothing/under/rank/security/corrections_officer/skirt/tactical
	name = "corrections officer's turtleneck skirt"
	desc = "A stylish turtleneck complete with tactical skirt."
	icon_state = "corrections_officer_sweatw"

/obj/item/clothing/head/brigoff
	name = "corrections officer's cap"
	desc = "A black visor cap with a round Nanotrasen logo made out of silver in the center. Uses reinforced fabric to offer sufficient protection."
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'	
	icon_state = "brigguard"
	armor = list(MELEE = 35, BULLET = 15, LASER = 15, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 20, ACID = 50, WOUND = 5)

// ###### VENDORS ######
/obj/machinery/vending/security
	req_access = list(ACCESS_BRIG)
	products = list(/obj/item/clothing/head/helmet/plated = 6,
					/obj/item/clothing/suit/armor/plated = 6,
					/obj/item/restraints/handcuffs = 8,
					/obj/item/clothing/neck/anti_magic_collar = 3,
					/obj/item/restraints/handcuffs/cable/zipties = 10,
					/obj/item/grenade/flashbang = 4,
					/obj/item/assembly/flash/handheld = 5,
					/obj/item/reagent_containers/food/snacks/donut = 12,
					/obj/item/storage/box/evidence = 6,
					/obj/item/flashlight/seclite = 4,
					/obj/item/flashlight/flare = 20,
					/obj/item/restraints/legcuffs/bola/energy = 7,
					/obj/item/storage/pouch/pistol = 2,
					/obj/item/storage/pouch/magazine/pistol = 2,
					/obj/item/storage/pouch/magazine = 2,
					/obj/item/storage/pouch/explosive = 2,
					/obj/item/storage/pouch/flare = 2,
					/obj/item/storage/belt/bandolier = 2)
	contraband = list(/obj/item/clothing/glasses/sunglasses = 2,
					/obj/item/storage/fancy/donut_box = 2)
	premium = list(/obj/item/storage/belt/security/webbing = 5,
					/obj/item/clothing/gloves/tackler/security = 3,
					/obj/item/clothing/glasses/hud/security/sunglasses/aviators = 1,
					/obj/item/coin/antagtoken = 1,
					/obj/item/bowman_upgrade = 2,
					/obj/item/clothing/head/helmet/warhelmet = 5,
					/obj/item/clothing/suit/armor/vest/rycliesarmour = 5,
					/obj/item/clothing/head/helmet/blueshirt = 5,
					/obj/item/clothing/suit/armor/vest/blueshirt = 5)


/obj/machinery/vending/wardrobe/sec_wardrobe
	req_access = list(ACCESS_SECURITY)
	products = list(/obj/item/storage/backpack/security = 3,
					/obj/item/storage/backpack/satchel/sec = 3,
					/obj/item/storage/backpack/duffelbag/sec = 3,
					/obj/item/clothing/under/rank/security/officer = 3,
					/obj/item/clothing/under/rank/security/officer/alt = 3,
					/obj/item/clothing/under/rank/security/officer/skirt = 3,
					/obj/item/clothing/under/rank/security/officer/grey = 3,
					/obj/item/clothing/under/rank/security/officer/redshirt = 3,
					/obj/item/clothing/under/rank/security/officer/classic = 3,
					/obj/item/clothing/under/rank/security/officer/corporate = 3,
					/obj/item/clothing/suit/hooded/wintercoat/security = 3,					
					/obj/item/clothing/suit/armor/vest/secmiljacket = 2,
					/obj/item/clothing/suit/toggle/bomber/secbomber/soft = 2,
					/obj/item/clothing/suit/poncho/sec = 2,	
					/obj/item/clothing/glasses/hud/security/ballistic = 2,	
					/obj/item/clothing/gloves/color/black/tactifool = 3,		
					/obj/item/clothing/shoes/jackboots = 3,
					/obj/item/clothing/shoes/jackboots/jacksandal = 3,
					/obj/item/clothing/shoes/xeno_wraps/jackboots = 3,
					/obj/item/clothing/head/beret/sec = 3,
					/obj/item/clothing/head/officer = 3,
					/obj/item/clothing/head/soft/sec = 3,
					/obj/item/clothing/head/soft/sec/corp = 3,
					/obj/item/clothing/mask/bandana/red = 3,
					/obj/item/badge/security/cadet = 3)
	premium = list(/obj/item/clothing/under/rank/security/navyblue = 3,
					/obj/item/clothing/under/rank/security/navyblue/russian = 3,
					/obj/item/clothing/suit/armor/officerjacket = 3,
					/obj/item/clothing/head/beret/sec/navyofficer = 3)

/obj/machinery/vending/wardrobe/det_wardrobe
	name = "\improper DetDrobe"
	desc = "A machine for all your detective needs, as long as you need clothes."
	icon_state = "detdrobe"
	icon_vend = "detdrobe-vend"
	icon_deny = "detdrobe_deny"
	product_ads = "Apply your brilliant deductive methods in style!"
	vend_reply = "Thank you for using the DetDrobe!"
	light_mask = "detdrobe-light-mask"
	req_access = list(ACCESS_FORENSICS_LOCKERS)
	products = list(/obj/item/clothing/under/rank/security/detective = 1,
					/obj/item/clothing/under/rank/security/detective/skirt = 1,
					/obj/item/clothing/under/rank/security/detective/grey = 1,
					/obj/item/clothing/under/rank/security/detective/skirt = 1,
					/obj/item/clothing/under/rank/det/yogs = 1,
					/obj/item/clothing/suit/det_suit = 1,
					/obj/item/clothing/suit/det_suit/grey = 1,
					/obj/item/clothing/suit/det_suit/noir = 1,
					/obj/item/clothing/suit/det_suit/tan = 1,
					/obj/item/clothing/suit/det_suit/yogs = 1,
					/obj/item/clothing/suit/det_suit/yogs/golddetective = 1,
					/obj/item/clothing/suit/det_suit/yogs/bluedetective = 1,
					/obj/item/clothing/head/fedora/det_hat = 1,
					/obj/item/clothing/head/fedora/det_hat/grey = 1,
					/obj/item/clothing/head/fedora/det_hat/black = 1,
					/obj/item/clothing/head/fedora/det_hat/brown = 1,
					/obj/item/clothing/gloves/color/black = 2,
					/obj/item/clothing/gloves/color/latex = 2,
					/obj/item/clothing/shoes/laceup = 1,
					/obj/item/clothing/shoes/laceup/brown = 1,
					/obj/item/clothing/shoes/laceup/grey  = 1,
					/obj/item/clothing/shoes/sneakers/brown = 2)
					// /obj/item/clothing/suit/det_suit/dark = 1,					
					// /obj/item/clothing/under/rank/security/detective = 2,
					// /obj/item/clothing/under/rank/security/detective/skirt = 2,
					// /obj/item/clothing/under/rank/security/detective/noir = 2,
					// /obj/item/clothing/under/rank/security/detective/noir/skirt = 2,					
					// /obj/item/clothing/under/rank/security/detective/disco = 1,
					// /obj/item/clothing/suit/det_suit/disco = 1,
					// /obj/item/clothing/shoes/discoshoes = 1,
					// /obj/item/clothing/neck/tie/disco = 1,
					// /obj/item/clothing/under/rank/security/detective/kim = 1,
					// /obj/item/clothing/suit/det_suit/kim = 1,
					// /obj/item/clothing/shoes/kim = 1,
					// /obj/item/clothing/gloves/kim = 1,
					// /obj/item/clothing/glasses/regular/kim = 1
	premium = list(/obj/item/clothing/head/flatcap = 1,
					/obj/item/reagent_containers/food/drinks/flask/det)
	refill_canister = /obj/item/vending_refill/wardrobe/det_wardrobe
	extra_price = PAYCHECK_COMMAND * 1.75
	payment_department = ACCOUNT_SEC

/obj/item/vending_refill/wardrobe/det_wardrobe
	machine_name = "DetDrobe"

