/client/proc/toggle_ert_calling()
	set name = "Toggle ERT"
	set category = "Admin.Round Interaction"

	set desc = "Toggle the station's ability to call a response team."
	if(!check_rights(R_FUN))
		return

	if(SSticker.mode.ert_disabled)
		SSticker.mode.ert_disabled = 0
		to_chat(holder, "<span class='notice'>ERT has been <b>Enabled</b>.</span>")
		message_admins("Admin [key_name_admin(holder)] has enabled ERT calling.", 1)
		SSblackbox.record_feedback("tally", "admin_verb", 1, "Toggle ERT") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	else
		SSticker.mode.ert_disabled = 1
		to_chat(holder, "<span class='warning'>ERT has been <b>Disabled</b>.</span>")
		message_admins("Admin [key_name_admin(holder)] has disabled ERT calling.", 1)
		SSblackbox.record_feedback("tally", "admin_verb", 1, "Toggle ERT") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
