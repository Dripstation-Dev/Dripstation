/datum/game_mode/traitor
	protected_jobs = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_jobs = list("Cyborg", "Repair Worker Replika")

/datum/game_mode/traitor/internal_affairs
	restricted_jobs = list("Cyborg", "Repair Worker Replika")

/datum/game_mode/bloodsucker
	protected_jobs = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Curator", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_jobs = list("AI", "Cyborg", "Repair Worker Replika")

/datum/game_mode/changeling
	protected_jobs = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_jobs = list("AI", "Cyborg", "Repair Worker Replika")

/datum/game_mode/traitor/bloodsucker
	protected_jobs = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Curator", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_jobs = list("AI", "Cyborg", "Repair Worker Replika")

/datum/game_mode/traitor/changeling
	restricted_jobs = list("AI", "Cyborg", "Repair Worker Replika")

/datum/game_mode/devil
	restricted_jobs = list("Cyborg", "AI", "Synthetic")
	protected_jobs = list("Lawyer", "Curator", "Chaplain", "Head of Security", "Captain")

/datum/game_mode/traitor/bros
	restricted_jobs = list("AI", "Cyborg", "Repair Worker Replika")

/datum/game_mode/zombie
	protected_jobs = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_jobs = list("AI", "Cyborg", "Repair Worker Replika")

/datum/game_mode/vampire
	protected_jobs = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Chaplain", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_jobs = list("AI", "Cyborg", "Repair Worker Replika")

/datum/game_mode/traitor/vampire
	restricted_jobs = list("AI", "Cyborg", "Repair Worker Replika")

/datum/game_mode/heretics
	protected_jobs = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Chaplain", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_jobs = list("AI", "Cyborg", "Repair Worker Replika")

/datum/game_mode/darkspawn
	protected_jobs = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_jobs = list("AI", "Cyborg", "Repair Worker Replika")

/datum/game_mode/gang
	restricted_jobs = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield", "AI", "Cyborg", "Repair Worker Replika")

/datum/game_mode/hivemind
	protected_jobs = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_jobs = list("AI", "Cyborg", "Repair Worker Replika")

/datum/game_mode/cult
	restricted_jobs = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Chaplain", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield", "AI", "Cyborg", "Repair Worker Replika")

/datum/game_mode/clockwork_cult
	protected_jobs = list("AI", "Cyborg", "Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_jobs = list("Chaplain", "Captain", "Repair Worker Replika")

/datum/game_mode/revolution
	protected_jobs = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Captain", "Head of Personnel", "Chief Engineer", "Research Director", "Chief Medical Officer", "Magistrate", "Nanotrasen Representative", "Blueshield", "Shaft Miner", "Mining Medic", "AI", "Cyborg", "Repair Worker Replika")

//////////////////////////////////////////////
//                                          //
//             dynamic rulesets            	//
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/roundstart/traitor
	protected_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_roles = list("Cyborg", "Repair Worker Replika")

/datum/dynamic_ruleset/roundstart/traitorbro
	protected_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_roles = list("AI", "Cyborg", "Repair Worker Replika")

/datum/dynamic_ruleset/roundstart/changeling
	protected_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_roles = list("AI", "Cyborg", "Repair Worker Replika")

/datum/dynamic_ruleset/roundstart/heretics
	protected_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Chaplain", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_roles = list("AI", "Cyborg", "Repair Worker Replika")

/datum/dynamic_ruleset/roundstart/bloodcult
	restricted_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Chaplain", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield", "AI", "Cyborg", "Repair Worker Replika")

/datum/dynamic_ruleset/roundstart/revs
	restricted_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Captain", "Head of Personnel", "Chief Engineer", "Research Director", "Chief Medical Officer", "Magistrate", "Nanotrasen Representative", "Blueshield", "Shaft Miner", "Mining Medic", "AI", "Cyborg", "Repair Worker Replika")

/datum/dynamic_ruleset/roundstart/clockcult
	protected_roles = list("AI", "Cyborg", "Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_roles = list("Chaplain", "Captain", "Repair Worker Replika")

/datum/dynamic_ruleset/roundstart/devil
	restricted_roles = list("Cyborg", "AI", "Synthetic")
	protected_roles = list("Lawyer", "Curator", "Chaplain", "Captain", "Magistrate", "Nanotrasen Representative", "Blueshield")

/datum/dynamic_ruleset/roundstart/vampire
	protected_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Chaplain", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_roles = list("AI", "Cyborg", "Repair Worker Replika")

/datum/dynamic_ruleset/roundstart/darkspawn
	protected_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_roles = list("AI", "Cyborg", "Repair Worker Replika")

/datum/dynamic_ruleset/roundstart/bloodsucker
	protected_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Curator", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_roles = list("AI", "Cyborg", "Repair Worker Replika")

/datum/dynamic_ruleset/midround/autotraitor
	protected_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_roles = list("Cyborg", "AI", "Positronic Brain", "Repair Worker Replika")

/datum/dynamic_ruleset/midround/autovamp
	protected_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Chaplain", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_roles = list("Cyborg", "AI", "Positronic Brain", "Repair Worker Replika")

/datum/dynamic_ruleset/midround/bloodsucker
	protected_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Curator", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_roles = list("Cyborg", "AI", "Positronic Brain", "Repair Worker Replika")

/datum/dynamic_ruleset/latejoin/infiltrator	//traitor
	protected_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_roles = list("Cyborg", "AI", "Positronic Brain", "Repair Worker Replika")

/datum/dynamic_ruleset/latejoin/provocateur	//rev
	restricted_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Head of Security", "Captain", "Head of Personnel", "Chief Engineer", "Research Director", "Chief Medical Officer", "Magistrate", "Nanotrasen Representative", "Blueshield", "Shaft Miner", "Mining Medic", "AI", "Cyborg", "Repair Worker Replika")

/datum/dynamic_ruleset/latejoin/vampire
	protected_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Chaplain", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_roles = list("AI", "Cyborg", "Repair Worker Replika")

/datum/dynamic_ruleset/latejoin/heretic_smuggler
	protected_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Chaplain", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_roles = list("AI", "Cyborg", "Positronic Brain", "Repair Worker Replika")

/datum/dynamic_ruleset/latejoin/bloodsucker
	protected_roles = list("Security Officer", "Warden", "Detective", "Brig Physician", "Customs Agent", "Curator", "Head of Security", "Captain", "Head of Personnel", "Magistrate", "Nanotrasen Representative", "Blueshield")
	restricted_roles = list("Cyborg", "AI", "Positronic Brain", "Repair Worker Replika") 
