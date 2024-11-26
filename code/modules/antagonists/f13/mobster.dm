/datum/antagonist/mobster
	name = "Mobster"
	antagpanel_category = "Mobster"
	job_rank = ROLE_MOBSTER
	f13_antag = TRUE
	var/special_role = ROLE_MOBSTER
	var/is_conspirator = FALSE
	var/datum/team/mob_family/team
	antag_moodlet = /datum/mood_event/focused
	threat = 3

/datum/antagonist/mobster/create_team(datum/team/mob_family/mob_team)
	team = mob_team
	team.add_member(owner)

/datum/antagonist/mobster/get_team()
	return team

/datum/antagonist/mobster/on_gain()
	SSticker.mode.mobsters += owner
	objectives += team.objectives
	owner.special_role = special_role
	return ..()

/datum/antagonist/mobster/on_removal()
	SSticker.mode.mobsters -= owner
	if(owner.current)
		to_chat(owner.current,span_userdanger("You are no longer a [special_role]!"))
	owner.special_role = null
	return ..()

/datum/antagonist/mobster/greet()
	to_chat(owner.current, "<B><font size=3 color=red>You are a [owner.special_role] of [team.name].</font></B>")
	to_chat(owner.current, "[team.name] looks to have total control over New Reno. Work with your fellow mobsters by completing your objectives together, and ensure that is the case!")
	owner.announce_objectives()

/datum/antagonist/mobster/admin_add(datum/mind/new_owner, mob/admin)
	var/datum/team/mob_family/new_team = new

	//Show list of mob teams
	var/choice = input(admin,"Choose the mob family.", "Mobster") as null|anything in list("The Bishops", "The Wrights", "The Van Graffs")
	if(!choice)
		return
	switch(choice)
		if("The Bishops")
			new_team = SSticker.mode.bishopteam
		if("The Wrights")
			new_team = SSticker.mode.wrightteam
		if("The Van Graffs")
			new_team = SSticker.mode.vgraffteam
	new_owner.special_role = special_role
	new_owner.add_antag_datum(/datum/antagonist/mobster, new_team)
	message_admins("[key_name_admin(admin)] made [new_owner.current] into a mobster for [new_team.name].")
	log_admin("[key_name_admin(admin)] made [new_owner.current] into a mobster for [new_team.name].")

/datum/team/mob_family
	name = "mob"
	member_name = "mobster" //If you see this in game somehow, scream!
	var/mob_jobs

/datum/team/mob_family/bishop
	name = "The Bishops"
	member_name = "Bishop Member"
	mob_jobs = list("Bishop Boss", "Bishop Wife", "Bishop Capo", "Bishop Made Man")

/datum/team/mob_family/wright
	name = "The Wrights"
	member_name = "Wright Member"
	mob_jobs = list("Wrights Elder", "Wright Enforcer", "Wright Hooligan")

/datum/team/mob_family/vangraff
	name = "The Van Graffs"
	member_name = "Van Graff Member"
	mob_jobs = list("Van Graff Branch Manager", "Van Graff Enforcer", "Van Graff Weapon Smith", "Research Contractor", "Van Graff Guard")

/datum/team/mob_family/roundend_report()
	var/list/parts = list()

	parts += span_header("The mobsters of [name] were:")
	for(var/datum/mind/M in members)
		parts += printplayer(M)
	var/win = TRUE
	var/objective_count = 1
	for(var/datum/objective/objective in objectives)
		if(objective.completable)
			var/completion = objective.check_completion()
			if(completion >= 1)
				parts += "<B>Objective #[objective_count]</B>: [objective.explanation_text] [span_greentext("<B>Success!</B>")]"
			else if(completion <= 0)
				parts += "<B>Objective #[objective_count]</B>: [objective.explanation_text] [span_redtext("Fail.")]"
				win = FALSE
			else
				parts += "<B>Objective #[objective_count]</B>: [objective.explanation_text] [span_yellowtext("[completion*100]%")]"
		else
			parts += "<B>Objective #[objective_count]</B>: [objective.explanation_text]"
		objective_count++
	if(win)
		parts += span_greentext("[name] were successful!")
	else
		parts += span_redtext("[name] have failed!")

	return "<div class='panel redborder'>[parts.Join("<br>")]</div>"

/datum/team/mob_family/proc/add_objective(datum/objective/f13/O, needs_target = FALSE, against_rival = FALSE, random = FALSE)
	O.team = src
	if(needs_target && against_rival)
		O.find_rival_target()
	if(!needs_target && against_rival)
		var/datum/objective/f13/mob_steal/G = O
		G.find_target()
	if(needs_target && !against_rival)
		var/target = O.find_coup_target()
		if(target == null)
			return FALSE	//If there were no eligible targets found for coup, then the objective is not added at all
		coup_conspirators(target)
	if(random)
		O.find_target()
	O.update_explanation_text()
	objectives += O

/datum/team/mob_family/proc/forge_mob_objectives()
	objectives = list()
	var/is_coup = prob(10)
	for(var/i = 1 to rand(1,2))
		forge_single_objective()
	if(is_coup && name == "The Bishops")
		if(!locate(/datum/objective/f13/mob_coup) in objectives)
			var/coup = add_objective(new/datum/objective/f13/mob_coup, TRUE, FALSE)
			if(coup)
				clear_coup_obj() //Removes the Coup objective for mobsters who aren't conspirators

/datum/team/mob_family/proc/forge_single_objective()
	if(prob(50))
		if(prob(30))
			add_objective(new/datum/objective/f13/mob_frame, TRUE, TRUE)
		else if(name == "The Bishops" && prob(30))
			add_objective(new/datum/objective/f13/mob_recruit, random = TRUE)
		else if(prob(30))
			add_objective(new/datum/objective/f13/mob_wealth)
		else
			add_objective(new/datum/objective/f13/mob_assassinate, TRUE, TRUE)
	else
		add_objective(new/datum/objective/f13/mob_steal, FALSE, TRUE)

/datum/team/mob_family/proc/coup_conspirators(datum/mind/target)
	var/list/datum/mind/possible_candidates = members
	var/coup_amount = rand(1,(members.len/3))
	for(var/datum/mind/M in possible_candidates)
		if(M == target || M.assigned_role == "Bishop Boss")
			possible_candidates -= M
	for(var/i = 1 to coup_amount)
		var/datum/mind/conspirator = pick(possible_candidates)
		var/datum/antagonist/mobster/G = conspirator.antag_datums[1]
		G.is_conspirator = TRUE

/datum/team/mob_family/proc/clear_coup_obj()
	var/list/datum/mind/candidates = members
	for(var/datum/mind/M in candidates)
		var/datum/antagonist/mobster/G = M.antag_datums[1]
		var/datum/objective/coup_obj = locate(/datum/objective/f13/mob_coup) in G.objectives
		if(!G.is_conspirator)
			G.objectives -= coup_obj

/datum/team/mob_family/antag_listing_name()
	return "[name]"
