/datum/market_item/tool
	category = "Tools"

/datum/market_item/tool/caravan_wrench
	name = "Experimental Wrench"
	desc = "The extra fast and handy wrench you always wanted!"
	item = /obj/item/wrench/caravan
	stock = 1

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 4
	availability_prob = 20

/datum/market_item/tool/caravan_wirecutters
	name = "Experimental Wirecutters"
	desc = "The extra fast and handy wirecutters you always wanted!"
	item = /obj/item/wirecutters/caravan
	stock = 1

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 4
	availability_prob = 20

/datum/market_item/tool/caravan_screwdriver
	name = "Experimental Screwdriver"
	desc = "The extra fast and handy screwdriver you always wanted!"
	item = /obj/item/screwdriver/caravan
	stock = 1

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 4
	availability_prob = 20

/datum/market_item/tool/caravan_crowbar
	name = "Experimental Crowbar"
	desc = "The extra fast and handy crowbar you always wanted!"
	item = /obj/item/crowbar/red/caravan
	stock = 1

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 4
	availability_prob = 20

/datum/market_item/tool/binoculars
	name = "Binoculars"
	desc = "Increase your sight by 150% with this handy Tool!"
	item = /obj/item/binoculars
	stock = 1

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 4.8
	availability_prob = 30

/datum/market_item/tool/riot_shield
	name = "Riot Shield"
	desc = "Protect yourself from an unexpected Riot at your local Police department!"
	item = /obj/item/shield/riot

	price_min = CARGO_CRATE_VALUE * 2.25
	price_max = CARGO_CRATE_VALUE * 3.25
	stock_max = 2
	availability_prob = 50

/datum/market_item/tool/thermite_bottle
	name = "Thermite Bottle"
	desc = "30u of Thermite to assist in creating a quick access point or get away!"
	item = /obj/item/reagent_containers/glass/beaker/thermite

	price_min = CARGO_CRATE_VALUE * 2.5
	price_max = CARGO_CRATE_VALUE * 7.5
	stock_max = 3
	availability_prob = 30

/datum/market_item/tool/science_goggles
	name = "Science Goggles"
	desc = "These glasses scan the contents of containers and projects their contents to the user in an easy to read format."
	item = /obj/item/clothing/glasses/science

	price_min = CARGO_CRATE_VALUE * 0.75
	price_max = CARGO_CRATE_VALUE
	stock_max = 3
	availability_prob = 50
