/datum/game_mode
	var/list/datum/mind/mobsters = list()
	var/list/datum/team/mob_family/mobster_teams = list()
	var/datum/team/mob_family/bishop/bishopteam
	var/datum/team/mob_family/wright/wrightteam
	var/datum/team/mob_family/vangraff/vgraffteam

/datum/game_mode/mobster
	name = "mobsters"
	config_tag = "mobster"
	required_players = 0

	announce_span = "danger"
	announce_text = "There are Syndicate agents and Blood Brothers on the station!\n\
	<span class='danger'>Traitors</span>: Accomplish your objectives.\n\
	<span class='danger'>Blood Brothers</span>: Accomplish your objectives.\n\
	<span class='notice'>Crew</span>: Do not let the traitors or brothers succeed!"

	var/const/team_amount = 3
	var/const/min_team_size = 1

/datum/game_mode/mobster/proc/get_players_for_mobs()
	var/list/players = list()
	var/list/candidates = list()

	for(var/mob/player in GLOB.player_list)
		if(player.client)
			players += player

	for(var/mob/player in players)
		if(player.client)
			candidates += player.mind

	return candidates

/datum/game_mode/mobster/proc/assign_mob_teams(datum/team/mob_family/mob_team, list/datum/mind/candidates)
	for(var/datum/mind/mobster in candidates)
		if(mobster.assigned_role in mob_team.mob_jobs)
			candidates -= mobster
			mob_team.add_member(mobster)
			mobster.special_role = "mobster"
			mobster.add_antag_datum(/datum/antagonist/mobster, mob_team)
			log_game("[key_name(mobster)] has been selected as a mobster for [mob_team.name]")

	return candidates

/datum/game_mode/mobster/proc/generate_objectives()
	for(var/datum/team/mob_family/team in mobster_teams)
		team.forge_mob_objectives()
	objs_generated = TRUE

/datum/game_mode/mobster/proc/generate_teams()
	var/list/datum/mind/possible_mobsters = get_players_for_mobs()
	for(var/datum/team/mob_family/team in mobster_teams)
		possible_mobsters = assign_mob_teams(team, possible_mobsters)

/datum/game_mode/mobster/pre_setup()
	bishopteam = new
	wrightteam = new
	vgraffteam = new
	mobster_teams += bishopteam
	mobster_teams += wrightteam
	mobster_teams += vgraffteam

	return ..()

/datum/game_mode/mobster/post_setup()
	addtimer(CALLBACK(src, TYPE_PROC_REF(/datum/game_mode/mobster, generate_objectives)), 5 MINUTES)	//Mob objectives are generated a little bit into the round to allow for
	addtimer(CALLBACK(src, TYPE_PROC_REF(/datum/game_mode/mobster, generate_teams)), 6 MINUTES)		//a viable pool to pick from for certain objectives

	return ..()
