// ###### Botany ######
/obj/item/clothing/under/rank/civilian/hydroponics
	icon = 'modular_dripstation/icons/obj/clothing/uniform/service/botany.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/service/botany.dmi'
	icon_state = "botany_jean"
	item_state = "g_suit"
	mutantrace_variation = DIGITIGRADE_VARIATION

/obj/item/clothing/under/rank/civilian/hydroponics/skirt
	icon = 'modular_dripstation/icons/obj/clothing/uniform/service/botany.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/service/botany.dmi'
	icon_state = "botany_skirt"
	item_state = "g_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NONE

/obj/item/clothing/under/rank/civilian/hydroponics/turtleneck
	name = "botanist's turtleneck"
	desc = "It's a tactical turtleneck designed to protect against minor plant-related hazards."
	icon_state = "hydroponics_turtle"

/obj/item/clothing/under/rank/civilian/hydroponics/turtleneckalt
	name = "botanist's turtleneck"
	desc = "It's a tactical turtleneck designed to protect against minor plant-related hazards. With additional pouches!"
	icon_state = "hydroponics_turtlealt"

/obj/item/clothing/under/rank/civilian/hydroponics/turtleneckalt/skirt
	name = "botanist's skirtleneck"
	desc = "It's a tactical skirtleneck designed to protect against minor plant-related hazards. With additional pouches!"
	icon_state = "hydroponics_turtlealt_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NONE

/obj/machinery/vending/wardrobe/hydro_wardrobe
	products = list(/obj/item/storage/backpack/botany = 2,
					/obj/item/storage/backpack/satchel/hyd = 2,
					/obj/item/clothing/suit/hooded/wintercoat/hydro = 2,
					/obj/item/clothing/suit/apron = 2,
					/obj/item/clothing/suit/apron/overalls = 3,
					/obj/item/clothing/under/yogs/botanyuniform = 3,
					/obj/item/clothing/under/rank/civilian/hydroponics = 3,
					/obj/item/clothing/under/rank/civilian/hydroponics/skirt = 3,
					/obj/item/clothing/mask/bandana = 3,
					/obj/item/clothing/accessory/armband/hydro = 3)
	premium = list(/obj/item/clothing/under/rank/civilian/hydroponics/turtleneck = 1,
					/obj/item/clothing/under/rank/civilian/hydroponics/turtleneckalt = 1,
					/obj/item/clothing/under/rank/civilian/hydroponics/turtleneckalt/skirt = 1)

// ###### Janitor ######
/obj/item/clothing/under/rank/janitor
	icon_state = "janitor"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/service/janitor.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/service/janitor.dmi'

/obj/item/clothing/under/rank/janitor/skirt
	icon_state = "janitor_skirt"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/service/janitor.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/service/janitor.dmi'

// ###### Mime ######
/obj/item/clothing/under/rank/civilian/mime
	icon = 'modular_dripstation/icons/obj/clothing/uniform/service/mime.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/service/mime.dmi'
	can_adjust = TRUE

/obj/item/clothing/under/rank/civilian/mime/skirt
	icon = 'modular_dripstation/icons/obj/clothing/uniform/service/mime.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/service/mime.dmi'
	can_adjust = TRUE

/obj/item/clothing/under/rank/civilian/mime/twosexytwomime
	icon = 'modular_dripstation/icons/obj/clothing/uniform/service/mime.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/service/mime.dmi'
	icon_state = "mime_skirt"
	can_adjust = TRUE

/obj/item/clothing/under/sexymime
	can_adjust = FALSE
	icon_state = "sexymime"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/service/mime.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/service/mime.dmi'

/obj/item/clothing/under/rank/civilian/mime/skirt/sexymime
	icon_state = "mime_skirtle"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/service/mime.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/uniform/service/mime.dmi'
	can_adjust = FALSE
	mutantrace_variation = NONE
	fitted = FEMALE_UNIFORM_TOP


/obj/machinery/vending/autodrobe
	req_access = null
	products = list(/obj/item/clothing/suit/chickensuit = 1,
					/obj/item/clothing/head/chicken = 1,
					/obj/item/clothing/under/rank/civilian/clown/blue = 1,
					/obj/item/clothing/under/rank/civilian/clown/green = 1,
					/obj/item/clothing/under/rank/civilian/clown/yellow = 1,
					/obj/item/clothing/under/rank/civilian/clown/orange = 1,
					/obj/item/clothing/under/rank/civilian/clown/purple = 1,
					/obj/item/clothing/under/costume/gladiator = 1,
					/obj/item/clothing/head/helmet/gladiator = 1,
					/obj/item/clothing/under/rank/command/captain/suit = 1,
					/obj/item/clothing/under/rank/command/captain/suit/skirt = 1,
					/obj/item/clothing/mask/rmask = 1,
					/obj/item/clothing/head/flatcap = 1,
					/obj/item/clothing/suit/toggle/labcoat/mad = 1,
					/obj/item/clothing/shoes/jackboots = 10, //yogs added more jack boots
					/obj/item/clothing/under/costume/schoolgirl = 1,
					/obj/item/clothing/under/costume/schoolgirl/red = 1,
					/obj/item/clothing/under/costume/schoolgirl/green = 1,
					/obj/item/clothing/under/costume/schoolgirl/orange = 1,
					/obj/item/clothing/head/fox = 1,
					/obj/item/clothing/head/kitty = 1,
					/obj/item/clothing/under/dress/skirt/black = 1,
					/obj/item/clothing/head/beret = 1,
					/obj/item/clothing/accessory/waistcoat = 1,
					/obj/item/clothing/under/suit = 1,
					/obj/item/clothing/head/that = 1,
					/obj/item/clothing/under/costume/kilt = 1,
					/obj/item/clothing/head/beret/vintage = 1,
					/obj/item/clothing/head/beret/archaic = 1,
					/obj/item/clothing/glasses/monocle = 1, //yogs added a single space the horrors!
					/obj/item/clothing/head/bowler = 1,
					/obj/item/cane = 1,
					/obj/item/clothing/under/suit/sl_suit = 1,
					/obj/item/clothing/mask/fakemoustache = 1,
					/obj/item/clothing/suit/bio_suit/plaguedoctorsuit = 1,
					/obj/item/clothing/head/plaguedoctorhat = 1,
					/obj/item/clothing/mask/gas/plaguedoctor = 1,
					/obj/item/clothing/suit/toggle/owlwings = 1,
					/obj/item/clothing/under/costume/owl = 1,
					/obj/item/clothing/mask/gas/owl_mask = 1,
					/obj/item/clothing/suit/toggle/owlwings/griffinwings = 1,
					/obj/item/clothing/under/costume/griffin = 1,
					/obj/item/clothing/shoes/griffin = 1,
					/obj/item/clothing/head/griffin = 1,
					/obj/item/clothing/head/lobsterhat = 1,
					/obj/item/clothing/under/costume/lobster = 1,
					/obj/item/clothing/gloves/boxing/crustacean = 1,
					/obj/item/clothing/under/costume/weiner = 1,
					/obj/item/clothing/suit/buns = 1,
					/obj/item/clothing/head/hatsky = 1,
					/obj/item/clothing/suit/apron = 1,
					/obj/item/clothing/under/suit/waiter = 1,
					/obj/item/clothing/suit/jacket/miljacket = 1,
					/obj/item/clothing/under/costume/pirate = 1,
					/obj/item/clothing/suit/pirate = 1,
					/obj/item/clothing/head/pirate = 1,
					/obj/item/clothing/head/pirate/bandana = 1,
					/obj/item/clothing/under/soviet = 1,
					/obj/item/clothing/head/ushanka = 1,
					/obj/item/clothing/suit/imperium_monk = 1,
					/obj/item/clothing/mask/gas/cyborg = 1,
					/obj/item/clothing/suit/chaplainsuit/holidaypriest = 1,
					/obj/item/clothing/suit/chaplainsuit/whiterobe = 1,
					/obj/item/clothing/head/wizard/marisa/fake = 1,
					/obj/item/clothing/suit/wizrobe/marisa/fake = 1,
					/obj/item/clothing/under/dress/sundress = 1,
					/obj/item/clothing/head/witchwig = 1,
					/obj/item/staff/broom = 1,
					/obj/item/clothing/suit/wizrobe/fake = 1,
					/obj/item/clothing/head/wizard/fake = 1,
					/obj/item/clothing/head/wizard/fake/brown = 1,
					/obj/item/staff = 3,
					/obj/item/toy/dummy = 2,
					/obj/item/clothing/mask/gas/sexyclown = 1,
					/obj/item/clothing/under/rank/civilian/clown/sexy = 1,
					/obj/item/clothing/mask/gas/sexymime = 1,
					/obj/item/clothing/under/sexymime = 1,
					/obj/item/clothing/under/rank/civilian/mime/skirt = 1,
					/obj/item/clothing/under/rank/civilian/mime/skirt/sexymime = 1,
					/obj/item/clothing/mask/rat/bat = 1,
					/obj/item/clothing/mask/rat/bee = 1,
					/obj/item/clothing/mask/rat/bear = 1,
					/obj/item/clothing/mask/rat/raven = 1,
					/obj/item/clothing/mask/rat/jackal = 1,
					/obj/item/clothing/mask/rat/fox = 1,
					/obj/item/clothing/mask/frog = 1,
					/obj/item/clothing/mask/rat/tribal = 1,
					/obj/item/clothing/mask/rat = 1,
					/obj/item/clothing/suit/apron/overalls = 1,
					/obj/item/clothing/head/rabbitears =1,
					/obj/item/clothing/head/sombrero = 1,
					/obj/item/clothing/head/sombrero/green = 1,
					/obj/item/clothing/suit/poncho = 1,
					/obj/item/clothing/suit/poncho/green = 1,
					/obj/item/clothing/suit/poncho/red = 1,
					/obj/item/clothing/head/pharaoh = 1,
					/obj/item/clothing/head/nemes = 1,
					/obj/item/clothing/mask/mummy = 2,
					/obj/item/clothing/under/costume/mummy = 2,
					/obj/item/clothing/under/maid = 1,
					/obj/item/clothing/under/rank/civilian/janitor/maid = 1,
					/obj/item/clothing/gloves/maid = 1,
					/obj/item/clothing/accessory/maidapron = 1,
					/obj/item/clothing/suit/apron/maid = 1,
					/obj/item/clothing/suit/apron/maid/red = 1,
					/obj/item/clothing/suit/apron/maid/purple = 1,
					/obj/item/clothing/suit/apron/maid/teal = 1,
					/obj/item/clothing/suit/apron/maid/yellow = 1,
					/obj/item/clothing/suit/maiddress = 1,
					/obj/item/clothing/glasses/cold=1,
					/obj/item/clothing/glasses/heat=1,
					/obj/item/clothing/suit/whitedress = 1,
					/obj/item/clothing/under/costume/jester = 1,
					/obj/item/clothing/head/jester = 1,
					/obj/item/clothing/under/costume/villain = 1,
					/obj/item/clothing/shoes/singery = 1,
					/obj/item/clothing/under/costume/singery = 1,
					/obj/item/clothing/shoes/singerb = 1,
					/obj/item/clothing/under/costume/singerb = 1,
					/obj/item/clothing/suit/hooded/carp_costume = 1,
					/obj/item/clothing/suit/hooded/ian_costume = 1,
					/obj/item/clothing/suit/hooded/bee_costume = 1,
					/obj/item/clothing/suit/snowman = 1,
					/obj/item/clothing/head/snowman = 1,
					/obj/item/clothing/mask/joy = 1,
					/obj/item/clothing/head/cueball = 1,
					/obj/item/clothing/under/suit/scratch = 1,
					/obj/item/clothing/under/costume/sailor = 1,
        			/obj/item/clothing/ears/headphones = 2,
        			/obj/item/clothing/head/wig/random = 3, // yogs added a ,
        			/obj/item/clothing/under/yogs/ronaldmcdonald = 1, // yogs clothes for autodrobe start here
					/obj/item/clothing/mask/yogs/ronald = 1,
					/obj/item/clothing/mask/yogs/cluwne/happy_cluwne = 1,
					/obj/item/clothing/mask/yogs/bananamask = 1,
					/obj/item/storage/backpack/banana = 1,
					/obj/item/clothing/mask/yogs/gigglesmask = 1,
					/obj/item/storage/backpack/clownface = 1,
					/obj/item/clothing/mask/yogs/scaryclown = 1,
					/obj/item/clothing/under/yogs/scaryclown = 1,
					/obj/item/clothing/shoes/clown_shoes/scaryclown = 1,
					/obj/item/clothing/shoes/clown_shoes/clowncrocs = 1,
					/obj/item/clothing/under/yogs/barber = 4,
					/obj/item/clothing/head/yogs/boater = 4,
					/obj/item/clothing/under/yogs/bluecoatuniform = 5,
					/obj/item/clothing/suit/yogs/bluecoatcoat = 5,
					/obj/item/clothing/head/yogs/tricornhat = 5,
					/obj/item/clothing/head/yogs/microwave = 1,
					/obj/item/clothing/head/yogs/drinking_hat = 1,
					/obj/item/clothing/suit/yogs/beaker = 1,
					/obj/item/clothing/suit/yogs/facebook = 1,
					/obj/item/clothing/suit/yogs/gothic = 1,
					/obj/item/clothing/under/yogs/zootsuit = 1,
					/obj/item/clothing/head/yogs/zoothat = 1,
					/obj/item/clothing/under/yogs/hamiltonuniform = 1,
					/obj/item/clothing/suit/yogs/hamiltoncoat = 1,
					/obj/item/clothing/suit/hooded/sandsuit = 1,
					/obj/item/clothing/under/yogs/thejester = 1,
					/obj/item/clothing/suit/yogs/thejestercoat = 1,
					/obj/item/clothing/under/yogs/trickster = 1,
					/obj/item/clothing/suit/yogs/trickstercoat = 1,
					/obj/item/clothing/head/yogs/trickster = 1,
					/obj/item/clothing/under/yogs/harveyflint = 1,
					/obj/item/clothing/under/yogs/penguinsuit = 1,
					/obj/item/clothing/head/yogs/penguin = 1,
					/obj/item/clothing/under/yogs/dresdenunder = 1,
					/obj/item/clothing/head/yogs/dresden = 1,
					/obj/item/clothing/under/yogs/doomsday = 1,
					/obj/item/clothing/under/yogs/lederhosen = 1,
					/obj/item/clothing/head/yogs/folkhat = 1,
					/obj/item/clothing/glasses/yogs/hypno = 1,
					/obj/item/clothing/under/yogs/soldieruniform = 4,
					/obj/item/clothing/suit/yogs/soldierwebbing = 4,
					/obj/item/clothing/head/yogs/soldierhelmet = 4,
					/obj/item/clothing/head/yogs/headpiece = 1,
					/obj/item/clothing/head/yogs/indianfether = 3,
					/obj/item/clothing/glasses/yogs/eyepatch = 2,
					/obj/item/clothing/under/yogs/infmob = 4,
					/obj/item/clothing/suit/yogs/infsuit = 4,
					/obj/item/clothing/head/yogs/infhat = 4,
					/obj/item/clothing/head/yogs/bike = 1,
					/obj/item/clothing/mask/yogs/freddy = 1,
					/obj/item/clothing/mask/yogs/bonnie = 1,
					/obj/item/clothing/mask/yogs/chica = 1,
					/obj/item/clothing/mask/yogs/foxy = 1,
					/obj/item/clothing/mask/yogs/fawkes = 1,
					/obj/item/clothing/mask/yogs/thejester = 1,
					/obj/item/clothing/mask/yogs/dallas = 1,
					/obj/item/clothing/mask/yogs/hoxton = 1,
					/obj/item/clothing/mask/yogs/robwolf = 1,
					/obj/item/clothing/mask/yogs/chains = 1,
					/obj/item/clothing/head/yogs/turban = 1,
					/obj/item/clothing/under/yogs/cowboy2 = 1,
					/obj/item/clothing/under/yogs/cowboy = 1,
					/obj/item/clothing/head/yogs/truecowboy = 1,
					/obj/item/clothing/head/yogs/truecowboy2 = 1,
					/obj/item/clothing/head/yogs/cowboy = 1,
					/obj/item/clothing/head/yogs/cowboy_sheriff = 1,
					/obj/item/clothing/under/yogs/familiartunic = 1,
					/obj/item/clothing/head/yogs/sith_hood = 1,
					/obj/item/clothing/neck/yogs/sith_cloak = 1,
					/obj/item/clothing/suit/yogs/armor/sith_suit = 1,
					/obj/item/clothing/shoes/clown_shoes/beeshoes = 1,
					/obj/item/clothing/suit/santa = 1,
					/obj/item/clothing/head/santa = 1,
					/obj/item/clothing/suit/pocketcat = 1,
					/obj/item/clothing/mask/pocketcatmask = 1,
					/obj/item/clothing/neck/skillcape/admin = 1,
					/obj/item/clothing/neck/skillcape/trimmed/admin = 1,
					/obj/item/clothing/neck/skillcape/mentor = 1,
					/obj/item/clothing/neck/skillcape = 1) //yogs clothes for autodrobe end here
	contraband = list(/obj/item/clothing/suit/judgerobe = 1,
					  /obj/item/clothing/head/powdered_wig = 1,
					  /obj/item/clothing/head/fox = 1,
					  /obj/item/gun/magic/wand = 2,
					  /obj/item/clothing/glasses/sunglasses/garb = 2,
					  /obj/item/clothing/glasses/blindfold = 1,
					  /obj/item/clothing/mask/muzzle = 2,
					  /obj/item/clothing/suit/hooded/cultrobes/eldritch_toy = 1)
	premium = list(/obj/item/clothing/suit/pirate/captain = 2,
				   /obj/item/clothing/head/pirate/captain = 2,
				   /obj/item/clothing/under/rank/civilian/clown/rainbow = 1,
				   /obj/item/clothing/head/helmet/roman/fake = 1,
				   /obj/item/clothing/head/helmet/roman/legionnaire/fake = 1,
				   /obj/item/clothing/under/costume/roman = 1,
				   /obj/item/clothing/shoes/roman = 1,
				   /obj/item/shield/riot/roman/fake = 1,
				   /obj/item/clothing/suit/chaplainsuit/clownpriest = 1,
				   /obj/item/clothing/head/clownmitre = 1,
		           /obj/item/skub = 1,
		           /obj/item/clothing/under/costume/lampskirt = 1,
		           /obj/item/clothing/under/yogs/soviet_dress_uniform = 1, //yogs start
		           /obj/item/clothing/under/yogs/rycliesuni = 1,
		           /obj/item/clothing/head/yogs/toad = 1,
		           /obj/item/clothing/head/helmet/justice = 1,
		           /obj/item/clothing/mask/yogs/richard = 1) //yogs end
