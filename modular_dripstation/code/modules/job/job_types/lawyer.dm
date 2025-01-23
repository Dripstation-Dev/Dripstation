/datum/job/lawyer
	title = "Lawyer"
	description = "Advocate for prisoners, create law-binding contracts, \
		ensure personnel is following corporate protocols. \
		When something global kicks in, side with Security Officers."
	department_head = list("Magistrate")
	supervisors = "the magistrate and the nanotrasen representative"
	paycheck_department = ACCOUNT_CAR
	department_for_prefs = /datum/job_department/central_command
	departments_list = list(
		/datum/job_department/command
	)
	alt_titles = list("Internal Affair`s Observer", "Corporate Defense Attorney",)

/datum/outfit/job/lawyer

/datum/outfit/job/plasmaman/lawyer
