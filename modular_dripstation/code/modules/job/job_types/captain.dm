/datum/job/captain
	supervisors = "Nanotrasen`s Admirals, Executives and Corporate Law"
	paycheck_department = ACCOUNT_CAR	//station main acc
	supervisor_corporation = /datum/corporation/nanotrasen

	loyalties = LOYALTY_NANOTRASEN_CAPTAIN
	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM, TRAIT_ILLEGAL_IDENTIFICATION_BASIC)

/datum/job/captain/GetIngameDesc(corp, stationname)
	return "<center>You are a high ranking corporate and governer of the vast rusting hulk that is this station. At least, as long as you keep up business.<br>\
	<br>\
	Your position is high, but you should remember, that you always can fall down from the ladder you climbed. You are the supreme leader of this world, and your word is law. But only as long as you can enforce that law.<br>\
	<br>\
	Try not to break Corporate Law and Standart Regulations as it written in your contract. The consecquences could be fatal. Remember that Security Department on your station do not serve you, but their corporation`s contract with [corp]. Try to convince and overhelm them with charisma or enforce your leadership from other sources.<br>\
	<br>\
	The heads of the departments which make up your command staff, each have their own agendas and even other loyalities. Their interests must be served too. If you make them unhappy, the loyalty of their department goes with them, and you may have a mutiny on your hands. Treat your command officers with respect, and listen to their council. Try not to micromanage their departments or interfere in their affairs, and they should serve you well.<br>\
	<br>\
	You are not a free agent, able to go where you will. You tied to your station, try not to leave it for too long. Your rank is high enough to do not fully obey personel from Central Command. But you should remember that they have their own pressure levers and they WOULD use them. Be free in abusing their resolutions, but try not to contradict them fully. Beware of Nanotrasen Admirals and Executives, their rank is even higher than Centcom Staff and their authority is superior even than yours.<br>\
	<br>\
	[corp] expects great achivements from you, so wherever you go, you should be sure a profitable venture awaits.</center>"

/datum/outfit/job/captain
	id_type = /obj/item/card/id/gold/captain
	head = /obj/item/clothing/head/beret/captain
	glasses = /obj/item/clothing/glasses/sunglasses 
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/laceup
	box = /obj/item/storage/box/captain
	implants = list(/obj/item/implant/mindshield/centcom)
