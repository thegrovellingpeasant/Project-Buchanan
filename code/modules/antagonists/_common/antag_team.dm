//A barebones antagonist team.
/datum/team
	var/list/datum/mind/members = list()
	var/name = "team"
	var/member_name = "member"
	var/list/objectives = list() //common objectives, these won't be added or removed automatically, subtypes handle this, this is here for bookkeeping purposes.
	var/show_roundend_report = TRUE

/datum/team/New(starting_members)
	. = ..()
	if(starting_members)
		if(islist(starting_members))
			for(var/datum/mind/M in starting_members)
				add_member(M)
		else
			add_member(starting_members)

/datum/team/proc/is_solo()
	return members.len == 1

/datum/team/proc/add_member(datum/mind/new_member)
	members |= new_member

/datum/team/proc/remove_member(datum/mind/member)
	members -= member

//Display members/victory/failure/objectives for the team
/datum/team/proc/roundend_report()
	if(!show_roundend_report)
		return
	var/list/report = list()

	report += span_header("[name]:")
	report += "The [member_name]s were:"
	report += printplayerlist(members)

	if(objectives.len)
		report += span_header("Team had following objectives:")
		var/win = TRUE
		var/objective_count = 1
		for(var/datum/objective/objective in objectives)
			if(objective.completable)
				var/completion = objective.check_completion()
				if(completion >= 1)
					report += "<B>Objective #[objective_count]</B>: [objective.explanation_text] [span_greentext("<B>Success!</B>")]"
				else if(completion <= 0)
					report += "<B>Objective #[objective_count]</B>: [objective.explanation_text] [span_redtext("Fail.")]"
					win = FALSE
				else
					report += "<B>Objective #[objective_count]</B>: [objective.explanation_text] [span_yellowtext("[completion*100]%")]"
			else
				report += "<B>Objective #[objective_count]</B>: [objective.explanation_text]"
			objective_count++
		if(win)
			report += span_greentext("The [name] was successful!")
		else
			report += span_redtext("The [name] have failed!")


	return "<div class='panel redborder'>[report.Join("<br>")]</div>"
