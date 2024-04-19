/////////////////////////////
/* Faction Task Controller */
/////////////////////////////

/*---------------------------------------------------------------------------------------------*\
|																								|
|	Chance of a global task occuring is determined in the global_faction datum.					|
|	To enable the global task for a faction, the datum path as a string should be added and		|
|	set equal to TRUE.																			|
|	--	Ex: "datum/job/[FACTION] = list("/datum/faction_task/global_faction/[TASKK]" = TRUE		|
|																								|
|	Individual faction tasks (tasks assigned to a single faction) function the same except		|
|	instead of setting them to true, they should be to their % chance of being chosen.			|
|	-- Individual task values should never exceed 100%											|
|																								|
|	Player factions function exactly like individual tasks.										|
|	-- Their values do not interfere with eachother.											|
|																								|
\*---------------------------------------------------------------------------------------------*/

GLOBAL_LIST_INIT(faction_task_probabilities, list(
	"/datum/job/wrights" = list(
		"/datum/faction_task/global_faction/wealth" = TRUE,
		"/datum/faction_task/global_faction/heist" = TRUE,
		"/datum/faction_task/individual_faction/frame" = 50,
		"/datum/faction_task/individual_faction/assassination" = 50,
		"/datum/faction_task/individual_player/coupdetat" = 20
		),
	"/datum/job/bishops" = list(
		"/datum/faction_task/global_faction/wealth" = TRUE,
		"/datum/faction_task/global_faction/heist" = TRUE,
		"/datum/faction_task/individual_faction/frame" = 50,
		"/datum/faction_task/individual_faction/assassination" = 50,
		"/datum/faction_task/individual_player/coupdetat" = 20
		),
	"/datum/job/vangraffs" = list(
		"/datum/faction_task/global_faction/wealth" = TRUE,
		"/datum/faction_task/global_faction/heist" = TRUE,
		"/datum/faction_task/individual_faction/frame" = 50,
		"/datum/faction_task/individual_faction/assassination" = 50,
		"/datum/faction_task/individual_player/coupdetat" = 20
		),
//	"tourists" = list(
//		"/datum/faction_task/global_faction/heist" = TRUE,			/////------------------------pick tasks and fix path
//	)
))

GLOBAL_DATUM_INIT(faction_task_controller, /datum/faction_task_controller, new)

/datum/faction_task_controller
	var/list/all_tasks = list()				// Available tasks. ("[cat]" = list([task], ...), ...)
	var/IFT_total_chance = 0				// Individual faction task total because chances are weights so all factions are tasked.
	var/list/faction_tasks = list()			// Tasks assigned to faction: ("[faction]" = list(/datum/faction_task/individual_faction/[task], ...), ...)
	var/list/player_tasks = list()			// Player tasks assigned to factions: ("[faction]" = /datum/faction_task/individual_player/[task], ...)
	var/list/global_tasks = list()			// Tasks that are shared between multiple factions: ("[faction]" = /datum/faction_task/global_faction/[task], ...)
	var/ticks_elapsed = 0
	var/mob/living/list/players = list()	// List of players with faction: ("[faction]" = list(/mob/living/[player], ...), ...)

/datum/faction_task_controller/New()
	. = ..()
	build_faction_tasks_list()
	assign_global_tasks()
	assign_player_tasks()
	assign_faction_tasks(2)
	START_PROCESSING(SSobj, src)


//////////////////////////
/* Update Faction Tasks */
//////////////////////////

/datum/faction_task_controller/process()
	for(var/F in global_tasks)
		global_tasks[F].update()
	for(var/F in player_tasks)
		player_tasks[F].update()
	for(var/F in faction_tasks)
		for(var/FT in faction_tasks[F])
			var/datum/faction_task/task_datum = FT
			task_datum.update()
	ticks_elapsed++


////////////////////////////////
/* Build "faction_tasks" List */
////////////////////////////////

/datum/faction_task_controller/proc/build_faction_tasks_list()
	var/task_categories = subtypesof(/datum/faction_task)
	for(var/TC in task_categories)
		var/datum/faction_task/task_category = TC

		// Get Category Name
		var/list/cat_split = splittext("[task_category]", "/")
		var/cat_name = cat_split[4]

		// Not a Category
		if(length(cat_split) > 4)
			continue

		// Do Not re-do Work
		if(all_tasks["[cat_name]"])
			continue

		// Create Category List
		all_tasks["[cat_name]"] = list()
		var/tasks = subtypesof(task_category)
		for(var/T in tasks)
			var/datum/faction_task/task = T
			if(ispath(T, /datum/faction_task/individual_faction))
				IFT_total_chance += initial(task.chance)

			// Add Faction Tasks to Category
			all_tasks["[cat_name]"].Add(task)


//////////////////////////////
/* Assign Tasks to Factions */
//////////////////////////////

// -- Player Tasks --//
/datum/faction_task_controller/proc/assign_player_tasks()
	var/shifted_chance
	var/r_num

	// Loop Through Factions
	for(var/F in GLOB.faction_task_probabilities)
		// Random Task Selection
		shifted_chance = 0
		r_num = rand(1, 100)
		for(var/T in GLOB.faction_task_probabilities[F])
			// Task Type Check
			var/T_path = text2path(T)
			if(!ispath(T_path, /datum/faction_task/individual_player))
				continue
			// Assign Task if Selected
			shifted_chance += GLOB.faction_task_probabilities[F]["[T]"]
			if(r_num <= shifted_chance)
				var/datum/faction_task/task_datum = new T_path(text2path(F))
				player_tasks["[F]"] = task_datum
				task_datum.faction = text2path(F)
				break

// -- Global Tasks --//
/datum/faction_task_controller/proc/assign_global_tasks()
	var/shifted_chance = 0
	var/r_num = rand(1, 100)

	// Random Task Selection
	for(var/T in all_tasks["global_faction"])
		// Assign Task to all Factions if Selected
		var/datum/faction_task/T_path = T
		shifted_chance += initial(T_path.chance)
		if(r_num <= shifted_chance)
			for(var/F in GLOB.faction_task_probabilities)
				if(!GLOB.faction_task_probabilities[F]["[T]"])
					continue
				var/datum/faction_task/task_datum = new T_path(text2path(F))
				global_tasks[F] = task_datum
				task_datum.faction = text2path(F)
			break

//-- Faction Tasks --//
/datum/faction_task_controller/proc/assign_faction_tasks(var/amount)
	var/shifted_chance
	var/r_num
	var/_amount
	var/list/task_names = list()

	// Loop Through Factions
	for(var/F in GLOB.faction_task_probabilities)
		// Select Tasks
		_amount = amount
		task_names = list()
		for(var/datum/faction_task/T in faction_tasks[F])
			task_names.Add(T.name)
		while(_amount > 0)
			// Random Task Selection
			shifted_chance = 0
			r_num = rand(1, 100)
			for(var/T in GLOB.faction_task_probabilities[F])
				// Task Type Check
				var/datum/faction_task/T_path = text2path(T)
				if(!ispath(T_path, /datum/faction_task/individual_faction))
					continue
				// Assign Task if Selected
				shifted_chance += GLOB.faction_task_probabilities[F]["[T]"]
				if(r_num <= shifted_chance)
					// No Repeat Tasks
					if(task_names.Find(initial(T_path.name)))
						break
					task_names.Add(initial(T_path.name))
					var/datum/faction_task/task_datum = new T_path(text2path(F))
					if(!faction_tasks[F])
						faction_tasks[F] = list()
					faction_tasks[F].Add(task_datum)
					_amount--
					break


////////////////
/* Add Player */
////////////////

/datum/faction_task_controller/proc/add_player(var/mob/living/L)
	var/datum/job/job = SSjob.GetJob(L.mind.assigned_role)
	var/faction = "/datum/job/[splittext("[job]", "/")[4]]"
	var/player_assigned = FALSE

	// Global Tasks
	if(global_tasks.Find(faction))
		if(global_tasks[faction].add_player(L))
			player_assigned = TRUE

	// Faction Tasks
	if(initial(job.has_faction_task) && faction_tasks.Find(faction))
		for(var/T in faction_tasks[faction])
			var/datum/faction_task/task_datum = T
			if(task_datum.add_player(L))
				player_assigned = TRUE

	// Player Tasks
	if(initial(job.has_player_task) && player_tasks.Find(faction))
		if(player_tasks[faction].add_player(L))
			player_assigned = TRUE

	// Spawn Message
	if(player_assigned)
		addtimer(CALLBACK(src, .proc/spawn_message, L), max(30, 300 - ticks_elapsed*2) SECONDS)


////////////////////
/* Spawn Messages */
////////////////////

/datum/faction_task_controller/proc/spawn_message(var/mob/living/L)
	to_chat(L, "<h1><b><font color='#139e3a'>Assigned Tasks:</font></b><h1>")

	var/counter = 1
	var/datum/job/job = SSjob.GetJob(L.mind.assigned_role)
	var/faction = "/datum/job/[splittext("[job]", "/")[4]]"
	if(global_tasks[faction])
		var/datum/faction_task/task_datum = global_tasks[faction]
		to_chat(L, "<b>\[#[counter] [task_datum.name]\]: [task_datum.task_status_msg()]</b>")
		counter++
	if(faction_tasks[faction])
		for(var/T in faction_tasks[faction])
			var/datum/faction_task/task_datum = T
			to_chat(L, "<b>\[#[counter] [task_datum.name]\]: [task_datum.task_status_msg()]</b>")
			counter++
	if(player_tasks[faction])
		var/datum/faction_task/task_datum = player_tasks[faction]
		to_chat(L, "<b>\[#[counter] [task_datum.name]\]: [task_datum.task_status_msg()]</b>")
		counter++


////////////////////////
/* End Round Messages */
////////////////////////

/datum/faction_task_controller/proc/end_message(var/mob/living/L)
	to_chat(L, "<h1><b><font color='#139e3a'>Task Completion:</font></b><h1>")

	var/counter = 1
	var/datum/job/job = SSjob.GetJob(L.mind.assigned_role)
	var/faction = "/datum/job/[splittext("[job]", "/")[4]]"
	if(global_tasks[faction])
		var/datum/faction_task/task_datum = global_tasks[faction]
		to_chat(L, "<b>\[#[counter] [task_datum.name]\]: [task_datum.end_round_msg()]</b>")
		counter++
	if(faction_tasks[faction])
		for(var/T in faction_tasks[faction])
			var/datum/faction_task/task_datum = T
			to_chat(L, "<b>\[#[counter] [task_datum.name]\]: [task_datum.end_round_msg()]</b>")
			counter++
	if(player_tasks[faction])
		var/datum/faction_task/task_datum = player_tasks[faction]
		to_chat(L, "<b>\[#[counter] [task_datum.name]\]: [task_datum.end_round_msg()]</b>")
		counter++


///////////////
/* Round End */
///////////////

/datum/faction_task_controller/proc/round_end()
	for(var/F in global_tasks)
		global_tasks[F].round_end()
	for(var/F in player_tasks)
		player_tasks[F].round_end()
	for(var/F in faction_tasks)
		for(var/FT in faction_tasks[F])
			var/datum/faction_task/task_datum = FT
			task_datum.round_end()
	for(var/mob/living/L in players)
		end_message(L)






//////////////////
/* Faction Task */
//////////////////

/datum/faction_task
	var/faction						// Job datum the task is assigned to
	var/name						// Task name
	var/chance						// Chance of this task being selected for a faction
	var/mob/list/players = list()	// Players in the faction as a /mob
	var/task_completed = FALSE		// Task completion status

/datum/faction_task/New(_faction)
	faction = _faction
	..()

/datum/faction_task/proc/add_player(var/mob/living/user)
	players.Add(user)
	if(!GLOB.faction_task_controller.players.Find(user))
		GLOB.faction_task_controller.players.Add(user)
	return TRUE

/datum/faction_task/proc/remove_player(var/mob/living/user)
	players.Remove(user)
	return TRUE

/datum/faction_task/proc/calculate_score()	// Just use TRUE or FALSE if it is a boolean. Score is not tallied.
	return FALSE

/datum/faction_task/proc/task_status_msg()
	return null

/datum/faction_task/proc/end_round_msg()
	return

/datum/faction_task/proc/round_end()		// Runs at round end.
	return

/datum/faction_task/proc/update()			// Runs every tick.
	return




/////////////////////////
/* Global Faction Task */
/////////////////////////

GLOBAL_LIST_INIT(faction_vault_areas, list(
	"/datum/job/bishops" = /area/f13/reno_building, \
	"/datum/job/vangraffs" = /area/f13/vangraffs , \
	"/datum/job/wrights" = /area/f13/wrights, \
))

/datum/faction_task/global_faction
	name = "global task"



/* Wealth */

/datum/faction_task/global_faction/wealth
	name = "Wealth"
	chance = 100

/datum/faction_task/global_faction/wealth/calculate_score()
	var/area/task_area = GLOB.faction_vault_areas["[faction]"]
	var/total_money = 0
	if(task_area)
		for(var/turf/T in task_area)
			for(var/obj/item/I in T.contents)
				if(istype(I, /obj/item/stack/f13Cash))
					var/obj/item/stack/f13Cash/C = I
					total_money += C.get_item_credit_value()
	return total_money

/datum/faction_task/global_faction/wealth/task_status_msg()
	return "Secure more cash in your faction's vault that any other."

/datum/faction_task/global_faction/wealth/end_round_msg()
	var/highest_score = 0
	var/winning_faction = null
	for(var/F in GLOB.faction_task_controller.global_tasks)
		var/score = GLOB.faction_task_controller.global_tasks[F].calculate_score()
		if(score > highest_score)
			highest_score = score
			winning_faction = faction
	if(winning_faction == faction && highest_score > 0)
		return "<font color='#097f10'>Your faction's wealth exceeds all others.</font>"
	else if(highest_score == 0)
		return "<font color='#c7863e'>You're all cashless losers.</font>"
	else
		return "<font color='#bc2621'>Another faction ([winning_faction]) has exceeded yours in wealth.</font>"




/////////////////////////
/* Single Faction Task */
/////////////////////////

/datum/faction_task/individual_faction
	name = "faction task"



/* Frame */

/datum/faction_task/individual_faction/frame
	name = "Frame"
	chance = 20
	var/datum/job/target_faction
	var/mob/living/carbon/target
	var/prison_area = /area/f13/reno_prison	// Where the target must be by the end of the round to win	////-- PESTARZT!!
	var/target_chosen = FALSE

/datum/faction_task/individual_faction/frame/New()
	. = ..()
	while(!target_faction || "[target_faction]" == "[faction]")
		target_faction = text2path(pick(GLOB.faction_task_probabilities))
	addtimer(CALLBACK(src, .proc/pick_target), 225 SECONDS)

/datum/faction_task/individual_faction/frame/proc/pick_target()
	var/datum/faction_task/FT = GLOB.faction_task_controller.faction_tasks["[target_faction]"][1]
	if(length(FT.players) > 0)
		target = pick(FT.players)
	if(!target)
		addtimer(CALLBACK(src, .proc/pick_target), 30 SECONDS)
		return
	target_chosen = TRUE
	if(GLOB.faction_task_controller.ticks_elapsed > 150)
		for(var/P in players)
			to_chat(P, "<span class='boldnotice'>[task_status_msg()]</span>")

/datum/faction_task/individual_faction/frame/calculate_score()
	var/turf/T = get_turf(target)
	if(target && istype(T.loc, prison_area))
		return TRUE
	return FALSE

/datum/faction_task/individual_faction/frame/task_status_msg()
	if(target_chosen)
		return "Frame [target.name] ([initial(target_faction.faction)]) into the NCR prison."
	else
		return "Frame someone from the [initial(target_faction.faction)] into the NCR prison (Target to be announced)..."

/datum/faction_task/individual_faction/frame/end_round_msg()
	if(calculate_score())
		return "<font color='#097f10'>Your target has been imprisoned.</font>"
	else
		return "<font color='#bc2621'>The target evaded imprisonment.</font>"



/* Assassination */

/datum/faction_task/individual_faction/assassination
	name = "Assassination"
	chance = 20
	var/target_chosen = FALSE
	var/datum/job/target_faction
	var/mob/living/carbon/target

/datum/faction_task/individual_faction/assassination/New()
	..()
	while(!target_faction || "[target_faction]" == "[faction]")
		target_faction = text2path(pick(GLOB.faction_task_probabilities))
	addtimer(CALLBACK(src, .proc/pick_target), 225 SECONDS)

/datum/faction_task/individual_faction/assassination/proc/pick_target()
	var/datum/faction_task/FT = GLOB.faction_task_controller.faction_tasks["[target_faction]"][1]
	if(length(FT.players) > 0)
		target = pick(FT.players)
	if(!target)
		addtimer(CALLBACK(src, .proc/pick_target), 30 SECONDS)
		return
	target_chosen = TRUE
	if(GLOB.faction_task_controller.ticks_elapsed > 150)
		for(var/P in players)
			to_chat(P, "<span class='boldnotice'>[task_status_msg()]</span>")

/datum/faction_task/individual_faction/assassination/calculate_score()
	if(target_chosen && (!target || !considered_alive(target)))
		return TRUE
	return FALSE

/datum/faction_task/individual_faction/assassination/task_status_msg()
	if(target_chosen)
		return "Kill [target.name] ([initial(target_faction.faction)])."
	else
		return "Kill someone from the [initial(target_faction.faction)] (Target to be announced)..."

/datum/faction_task/individual_faction/assassination/end_round_msg()
	if(calculate_score())
		return "<font color='#097f10'>Your target is dead.</font>"
	else
		return "<font color='#bc2621'>The target survived.</font>"




///////////////////////
/* Player Group Task */
///////////////////////

/datum/faction_task/individual_player
	name = "player task"
	var/player_chance
	var/max_players = 0
	var/overlapping_faction_task = TRUE

/datum/faction_task/individual_player/add_player(var/mob/user)
	if(prob(player_chance) && length(players) < max_players)
		return ..()



/* Coup d'etat */

/datum/faction_task/individual_player/coupdetat
	name = "Coup d'etat"
	max_players = 5
	player_chance = 30
	var/target_chosen = FALSE
	var/mob/living/carbon/target

/datum/faction_task/individual_player/coupdetat/add_player(mob/user)
	if(calculate_score())
		return FALSE
	if(initial(SSjob.GetJob(user.mind.assigned_role).faction_head))
		target_chosen = TRUE
		target = user
		for(var/mob/living/P in players)
			to_chat(P, "<span class='boldnotice'>[task_status_msg()]</span>")
		return FALSE
	..()

/datum/faction_task/individual_player/coupdetat/calculate_score()
	if(target_chosen && (!target || !considered_alive(target)))
		return TRUE
	return FALSE

/datum/faction_task/individual_player/coupdetat/task_status_msg()
	return "Kill your tyrant of a leader and don't get caught by his loyalists."

/datum/faction_task/individual_player/coupdetat/end_round_msg()
	if(calculate_score())
		return "<font color='#097f10'>The scoundrel is dead.</font>"
	else
		return "<font color='#bc2621'>Your leader survived.</font>"






////////////////////////////
/* Read Faction Task Data */
////////////////////////////

/client/proc/read_faction_task_data()
	set category = "Debug"
	set name = "Faction Task Data"
	set desc = "Display faction task data to you."

	to_chat(usr, "-=-=-=-=-=- All Tasks -=-=-=-=-=-")
	for(var/cat in GLOB.faction_task_controller.all_tasks)
		to_chat(usr, "[cat]:")
		for(var/T in GLOB.faction_task_controller.all_tasks[cat])
			var/datum/faction_task/task = T
			to_chat(usr, "- [initial(task.name)]")
	to_chat(usr, "-=-=-=-=- Global Tasks -=-=-=-=-")
	for(var/F in GLOB.faction_task_controller.global_tasks)
		to_chat(usr, "[F]: [GLOB.faction_task_controller.global_tasks[F]]")

	to_chat(usr, "-=-=-=-=- Faction Tasks -=-=-=-=-")
	for(var/F in GLOB.faction_task_controller.faction_tasks)
		var/text = ""
		for(var/T in GLOB.faction_task_controller.faction_tasks[F])
			text += "[(text == "" ? "" : ", ")][T]"
		to_chat(usr, "[F]: [text]")
	to_chat(usr, "-=-=-=-=- Player Tasks -=-=-=-=-")
	for(var/F in GLOB.faction_task_controller.player_tasks)
		to_chat(usr, "[F]: [GLOB.faction_task_controller.player_tasks[F]]")
	to_chat(usr, "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
