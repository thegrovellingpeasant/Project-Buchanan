/*---------------------------------------------------------------------------------------------*\
|	> Faction Task Controller			<														|
|	> Original PR by Fulminating Gold	<														|
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
		"/datum/faction_task/individual_faction/frame" = 30,
		"/datum/faction_task/individual_faction/assassination" = 40,
		"/datum/faction_task/individual_faction/recruit" = 30,
		"/datum/faction_task/individual_player/coupdetat" = 20
		),
	"/datum/job/bishops" = list(
		"/datum/faction_task/global_faction/wealth" = TRUE,
		"/datum/faction_task/individual_faction/frame" = 30,
		"/datum/faction_task/individual_faction/assassination" = 40,
		"/datum/faction_task/individual_faction/recruit" = 30,
		"/datum/faction_task/individual_player/coupdetat" = 20
		),
	"/datum/job/vangraffs" = list(
		"/datum/faction_task/global_faction/wealth" = TRUE,
		"/datum/faction_task/individual_faction/frame" = 30,
		"/datum/faction_task/individual_faction/assassination" = 40,
		"/datum/faction_task/individual_faction/recruit" = 30,
		"/datum/faction_task/individual_player/coupdetat" = 20
		),
	"/datum/job/citizens/f13tourist" = list(
		"/datum/faction_task/individual_player/heist" = 100,
		),
))

GLOBAL_DATUM_INIT(faction_task_controller, /datum/faction_task_controller, new)

/datum/faction_task_controller
	var/list/all_tasks = list()				// Available tasks. ("[cat]" = list([task], ...), ...)
	var/IFT_total_chance = 0				// Individual faction task total because chances are weights so all factions are tasked.
	var/list/list/faction_tasks = list()			// Tasks assigned to faction: ("[faction]" = list(/datum/faction_task/individual_faction/[task], ...), ...)
	var/list/datum/faction_task/player_tasks = list()			// Player tasks assigned to factions: ("[faction]" = /datum/faction_task/individual_player/[task], ...)
	var/list/datum/faction_task/global_tasks = list()			// Tasks that are shared between multiple factions: ("[faction]" = /datum/faction_task/global_faction/[task], ...)
	var/ticks_elapsed = 0
	var/mob/living/players[] = list()	// List of players with faction: ("[faction]" = list(/mob/living/[player], ...), ...)

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
	for(var/datum/faction_task/F as anything in global_tasks)
		global_tasks[F].update()
	for(var/datum/faction_task/F as anything in player_tasks)
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
/datum/faction_task_controller/proc/assign_faction_tasks(amount)
	var/shifted_chance
	var/r_num
	var/_amount
	var/list/task_names = list()

	// Loop Through Factions
	for(var/F in GLOB.faction_task_probabilities)
		// Select Tasks
		task_names = list()
		var/num_FT = 0
		for(var/T in GLOB.faction_task_probabilities[F])
			if(ispath(text2path(T), /datum/faction_task/individual_faction))
				num_FT++
		for(var/datum/faction_task/T in faction_tasks[F])
			num_FT--
			task_names.Add(T.name)
		_amount = min(amount, num_FT)
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


/////////////////
/* Get Faction */
/////////////////

/datum/faction_task_controller/proc/getFaction(var/mob/living/L)
	var/datum/job/job = SSjob.GetJob(L.mind.assigned_role)
//	return "/datum/job/[splittext("[job]", "/")[4]]"
	for(var/F in GLOB.faction_task_probabilities)
		if(istype(job, text2path(F)))
			return F
	return null


////////////////
/* Add Player */
////////////////

/datum/faction_task_controller/proc/add_player(var/mob/living/L)
	var/datum/job/job = SSjob.GetJob(L.mind.assigned_role)
	var/faction = getFaction(L)
	var/player_assigned = FALSE

	// Global Tasks
	var/datum/faction_task/global_task = global_tasks[faction]
	if(global_task)
		if(global_task.add_player(L))
			player_assigned = TRUE

	// Faction Tasks
	if(initial(job.has_faction_task) && faction_tasks.Find(faction))
		for(var/T in faction_tasks[faction])
			var/datum/faction_task/task_datum = T
			if(task_datum.add_player(L))
				player_assigned = TRUE

	// Player Tasks
	if(initial(job.has_player_task))
		var/datum/faction_task/player_task = player_tasks[faction]
		if(player_task && player_task.add_player(L))
			player_assigned = TRUE
			player_assigned = TRUE

	// Spawn Message
	if(player_assigned)
		addtimer(CALLBACK(src, PROC_REF(spawn_message), L), max(30, 300 - ticks_elapsed*2) SECONDS)


////////////////////
/* Spawn Messages */
////////////////////

/datum/faction_task_controller/proc/spawn_message(var/mob/living/L)
	to_chat(L, "<h1><b><font color='#139e3a'>Assigned Tasks:</font></b><h1>")

	var/counter = 1
	var/faction = getFaction(L)
	var/datum/faction_task/global_task = global_tasks[faction]
	if(global_task)
		to_chat(L, "<b>\[#[counter] [global_task.name]\]: [global_task.task_status_msg()]</b>")
		counter++
	if(faction_tasks[faction])
		for(var/T in faction_tasks[faction])
			var/datum/faction_task/task_datum = T
			to_chat(L, "<b>\[#[counter] [task_datum.name]\]: [task_datum.task_status_msg()]</b>")
			counter++
	var/datum/faction_task/player_task = player_tasks[faction]
	if(player_task)
		if(player_task.players.Find(L))
			to_chat(L, "<b>\[#[counter] [player_task.name]\]: [player_task.task_status_msg()]</b>")
			counter++


////////////////////////
/* End Round Messages */
////////////////////////

/datum/faction_task_controller/proc/end_message(var/mob/living/L)
	to_chat(L, "<h1><b><font color='#139e3a'>Task Completion:</font></b><h1>")

	var/counter = 1
	var/faction = getFaction(L)
	var/datum/faction_task/global_task = global_tasks[faction]
	if(global_task)
		to_chat(L, "<b>\[#[counter] [global_task.name]\]: [global_task.end_round_msg()]</b>")
		counter++
	if(faction_tasks[faction])
		for(var/T in faction_tasks[faction])
			var/datum/faction_task/task_datum = T
			to_chat(L, "<b>\[#[counter] [task_datum.name]\]: [task_datum.end_round_msg()]</b>")
			counter++
	var/datum/faction_task/player_task = player_tasks[faction]
	if(player_task)
		if(player_task.players.Find(L))
			to_chat(L, "<b>\[#[counter] [player_task.name]\]: [player_task.end_round_msg()]</b>")
			counter++


///////////////
/* Round End */
///////////////

/datum/faction_task_controller/proc/round_end()
	for(var/datum/faction_task/F as anything in global_tasks)
		global_tasks[F].round_end()
	for(var/datum/faction_task/F as anything in player_tasks)
		player_tasks[F].round_end()
	for(var/F in faction_tasks)
		for(var/FT in faction_tasks[F])
			var/datum/faction_task/task_datum = FT
			task_datum.round_end()
	for(var/mob/living/L in players)
		if(L != null && istype(L))
			end_message(L)






//////////////////
/* Faction Task */
//////////////////

/datum/faction_task
	var/faction							// Job datum the task is assigned to
	var/name							// Task name
	var/chance							// Chance of this task being selected for a faction (Global tasks only)
	var/mob/living/players[] = list()	// Players in the faction as a /mob
	var/task_completed = FALSE			// Task completion status

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

// Just use TRUE or FALSE if it is a boolean. Score is not tallied.
/datum/faction_task/proc/calculate_score()
	return FALSE

/datum/faction_task/proc/task_status_msg()
	return null

/datum/faction_task/proc/end_round_msg()
	return

/datum/faction_task/proc/round_end()		// Runs at round end.
	return

/datum/faction_task/proc/update()			// Runs every tick.
	return


GLOBAL_LIST_INIT(faction_vault_areas, list(
	"/datum/job/bishops" = /area/f13/vangraffs_vault, \
	"/datum/job/vangraffs" = /area/f13/wrights_vault, \
	"/datum/job/wrights" = /area/f13/reno_sharkclub_vault, \
	"/datum/job/citizen/f13tourist" = /area/f13/heist, \
))

// Can be an item or object
GLOBAL_LIST_INIT(faction_relics, list(
	"/datum/job/bishops" = /obj/structure/closet/crate/grave/ark, \
	"/datum/job/vangraffs" = /obj/structure/closet/crate/grave/experimental_crate, \
	"/datum/job/wrights" = /obj/structure/closet/crate/grave/strangebird, \
))
/area/f13/vangraffs_vault

/area/f13/wrights_vault

/area/f13/reno_sharkclub_vault

/area/f13/heist

/obj/structure/closet/crate/grave/ark

/obj/structure/closet/crate/grave/experimental_crate

/obj/structure/closet/crate/grave/strangebird


/////////////////////////
/* Global Faction Task */
/////////////////////////

/datum/faction_task/global_faction
	name = "global task"



/* Wealth */

/datum/faction_task/global_faction/wealth
	name = "Wealth"
	chance = 100

/datum/faction_task/global_faction/wealth/calculate_score()
	var/area/task_area = GLOB.areas_by_type[GLOB.faction_vault_areas["[faction]"]]
	var/total_money = 0
	if(task_area)
		for(var/turf/T in task_area)
			for(var/obj/item/stack/f13Cash/C in T)
				total_money += C.get_item_credit_value()
	return total_money

/datum/faction_task/global_faction/wealth/task_status_msg()
	return "Secure more cash in your faction's vault that any other."

/datum/faction_task/global_faction/wealth/end_round_msg()
	var/highest_score = 0
	var/personal_score = 0
	var/winning_faction = null
	for(var/datum/faction_task/F as anything in GLOB.faction_task_controller.global_tasks)
		var/score = GLOB.faction_task_controller.global_tasks[F].calculate_score()
		if(F == "[faction]")
			personal_score = score
		if(score > highest_score)
			highest_score = score
			winning_faction = F
	if(winning_faction == "[faction]" && highest_score > 0)
		return "<font color='#097f10'>Your faction's wealth exceeds all others ($[highest_score]).</font>"
	else if(highest_score == 0)
		return "<font color='#c7863e'>You're all cashless losers.</font>"
	else
		return "<font color='#bc2621'>Another faction ([initial(text2path(winning_faction).faction)], $[highest_score]) has exceeded yours in wealth ($[personal_score]).</font>"




/////////////////////////
/* Single Faction Task */
/////////////////////////

/datum/faction_task/individual_faction
	name = "faction task"



/* Frame */

/datum/faction_task/individual_faction/frame
	name = "Frame"
	var/datum/job/target_faction
	var/mob/living/carbon/target
	var/list/prison_area = list(	// Where the target must be by the end of the round to win
		/area/f13/reno_prison,
		/area/f13/reno_prison_yard)
	var/target_chosen = FALSE

/datum/faction_task/individual_faction/frame/New()
	. = ..()
	while(!target_faction || "[target_faction]" == "[faction]")
		target_faction = text2path(pick(GLOB.faction_task_probabilities))
	addtimer(CALLBACK(src, PROC_REF(pick_target)), 225 SECONDS)

/datum/faction_task/individual_faction/frame/proc/pick_target()
	var/datum/faction_task/FT = null
	if(GLOB.faction_task_controller.faction_tasks.Find("[target_faction]"))
		FT = GLOB.faction_task_controller.faction_tasks["[target_faction]"][1]
	if(FT && length(FT.players) > 0)
		target = pick(FT.players)
	if(!target)
		addtimer(CALLBACK(src, PROC_REF(pick_target)), 30 SECONDS)
		return
	target_chosen = TRUE
	if(GLOB.faction_task_controller.ticks_elapsed > 150)
		for(var/P in players)
			to_chat(P, "<span class='boldnotice'>[task_status_msg()]</span>")

/datum/faction_task/individual_faction/frame/calculate_score()
	var/turf/T = get_turf(target)
	for(var/A in prison_area)
		if(target && istype(T.loc, A))
			return TRUE
	return FALSE

/datum/faction_task/individual_faction/frame/task_status_msg()
	if(target_chosen)
		return "Frame [target.name] ([initial(target_faction.faction)]) into the NCR prison."
	else
		return "Frame someone from the [initial(target_faction.faction)] into the NCR prison (Target to be announced)..."

/datum/faction_task/individual_faction/frame/end_round_msg()
	if(!target_chosen)
		return "<font color='#c7863e'>Your target never arrived.</font>"
	else if(calculate_score())
		return "<font color='#097f10'>Your target has been imprisoned.</font>"
	else
		return "<font color='#bc2621'>The target evaded imprisonment.</font>"



/* Assassination */

/datum/faction_task/individual_faction/assassination
	name = "Assassination"
	var/target_chosen = FALSE
	var/datum/job/target_faction
	var/mob/living/carbon/target

/datum/faction_task/individual_faction/assassination/New()
	..()
	while(!target_faction || "[target_faction]" == "[faction]")
		target_faction = text2path(pick(GLOB.faction_task_probabilities))
	addtimer(CALLBACK(src, PROC_REF(pick_target)), 225 SECONDS)

/datum/faction_task/individual_faction/assassination/proc/pick_target()
	var/datum/faction_task/FT = null
	if(GLOB.faction_task_controller.faction_tasks.Find("[target_faction]"))
		FT = GLOB.faction_task_controller.faction_tasks["[target_faction]"][1]
	if(FT && length(FT.players) > 0)
		target = pick(FT.players)
	if(!target)
		addtimer(CALLBACK(src, PROC_REF(pick_target)), 30 SECONDS)
		return
	target_chosen = TRUE
	if(GLOB.faction_task_controller.ticks_elapsed > 150)
		for(var/P in players)
			to_chat(P, "<span class='boldnotice'>[task_status_msg()]</span>")

/datum/faction_task/individual_faction/assassination/calculate_score()
	if(target_chosen && (!target || !considered_alive(target.mind)))
		return TRUE
	return FALSE

/datum/faction_task/individual_faction/assassination/task_status_msg()
	if(target_chosen)
		return "Kill [target.name] ([initial(target_faction.faction)])."
	else
		return "Kill someone from the [initial(target_faction.faction)] (Target to be announced)..."

/datum/faction_task/individual_faction/assassination/end_round_msg()
	if(!target_chosen)
		return "<font color='#c7863e'>Your target never arrived.</font>"
	else if(calculate_score())
		return "<font color='#097f10'>Your target is dead.</font>"
	else
		return "<font color='#bc2621'>The target survived.</font>"



/* Recruit */

/datum/faction_task/individual_faction/recruit
	name = "Recruit"
	var/recruits = 0													// Number of people recruited
	var/recruit_target = 1												// Number of people to recruit
	var/datum/job/recruit_faction	= /datum/job/citizens/f13tourist	// Faction to recruit from

/datum/faction_task/individual_faction/recruit/add_player(mob/living/user)
	..()
	var/obj/item/storage/recruit_forms/forms = new /obj/item/storage/recruit_forms(get_turf(user))
	forms.set_task(src)
	user.put_in_active_hand(forms)

/datum/faction_task/individual_faction/recruit/calculate_score()
	if(recruits >= recruit_target)
		return TRUE
	return FALSE

/datum/faction_task/individual_faction/recruit/task_status_msg()
	return "Recruit [recruit_target] [(recruit_target == 1 ? "person" : "people")] into your faction from the [initial(recruit_faction.faction)]."

/datum/faction_task/individual_faction/recruit/end_round_msg()
	if(calculate_score())
		return "<font color='#097f10'>You recruited enough people.</font>"
	else
		return "<font color='#bc2621'>You failed to recruit enough people.</font>"





///////////////////////
/* Player Group Task */
///////////////////////

/datum/faction_task/individual_player
	name = "player task"
	var/player_chance = 100
	var/max_players = 0
	var/overlapping_faction_task = TRUE

/datum/faction_task/individual_player/add_player(var/mob/living/user)
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
	var/datum/job/job = SSjob.GetJob(user.mind.assigned_role)
	if(initial(job.faction_head))
		target_chosen = TRUE
		target = user
		for(var/mob/living/P in players)
			to_chat(P, "<span class='boldnotice'>[task_status_msg()]</span>")
		return FALSE
	return ..()

/datum/faction_task/individual_player/coupdetat/calculate_score()
	if(target_chosen && (!target || !considered_alive(target.mind)))
		return TRUE
	return FALSE

/datum/faction_task/individual_player/coupdetat/task_status_msg()
	return "Kill your tyrant of a leader and don't get caught by his loyalists."

/datum/faction_task/individual_player/coupdetat/end_round_msg()
	if(!target_chosen)
		return "<font color='#c7863e'>Your target never arrived.</font>"
	else if(calculate_score())
		return "<font color='#097f10'>The scoundrel is dead.</font>"
	else
		return "<font color='#bc2621'>Your leader survived.</font>"



/* Heist */

/datum/faction_task/individual_player/heist
	name = "Heist"
	max_players = 5
	player_chance = 75
	var/datum/job/target_faction
	var/obj/target
	var/area/drop_off

/datum/faction_task/individual_player/heist/New()
	..()
	addtimer(CALLBACK(src, PROC_REF(pick_target)), 225 SECONDS)

/datum/faction_task/individual_player/heist/proc/pick_target()
	drop_off = GLOB.faction_vault_areas["[faction]"]
	target_faction = text2path(pick(GLOB.faction_relics))
	target = locate(GLOB.faction_relics["[target_faction]"])

/datum/faction_task/individual_player/heist/calculate_score()
	var/turf/T = get_turf(target)
	if(target && istype(T.loc, drop_off))
		return TRUE
	return FALSE

/datum/faction_task/individual_player/heist/task_status_msg()
	return "Steal the relic from the vault of your target ([initial(target_faction.faction)])."

/datum/faction_task/individual_player/heist/end_round_msg()
	if(calculate_score())
		return "<font color='#097f10'>The heist was successful.</font>"
	else
		return "<font color='#bc2621'>The heist failed.</font>"




///////////////////
/* Miscellaneous */
///////////////////


// Display Task Data to Chat
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
	for(var/datum/faction_task/F as anything in GLOB.faction_task_controller.global_tasks)
		to_chat(usr, "[F]: [GLOB.faction_task_controller.global_tasks[F]]")

	to_chat(usr, "-=-=-=-=- Faction Tasks -=-=-=-=-")
	for(var/F in GLOB.faction_task_controller.faction_tasks)
		var/text = ""
		for(var/T in GLOB.faction_task_controller.faction_tasks[F])
			text += "[(text == "" ? "" : ", ")][T]"
		to_chat(usr, "[F]: [text]")

	to_chat(usr, "-=-=-=-=- Player Tasks -=-=-=-=-")
	for(var/datum/faction_task/F as anything in GLOB.faction_task_controller.player_tasks)
		to_chat(usr, "[F]: [GLOB.faction_task_controller.player_tasks[F]]")
	to_chat(usr, "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")



// Recruit Form
/obj/item/recruit_form
	name = "recruitment form"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "paper_words"
	item_state = "paper"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	throw_range = 1
	throw_speed = 1
	resistance_flags = FLAMMABLE
	grind_results = list(/datum/reagent/cellulose = 3)
	var/datum/faction_task/individual_faction/recruit/task
	var/todays_date = "September 11th, 2251"	// Roleplay relevant date. Should be static.
	// Signed information
	var/form_date = null
	var/form_name = null
	var/form_faction_history = null
	var/form_age = null
	var/form_availability = null
	var/form_residence = null
	var/form_profession = null
	var/mob/living/carbon/human/signee = null
	var/mob/living/carbon/human/approved_by = null

/obj/item/recruit_form/attackby(obj/item/I, mob/user)
	// Sign & Approve
	if(ishuman(user) && istype(I, /obj/item/pen))
		var/mob/living/carbon/human/H = user
		if(user in task.players)
			if(!signee)
				to_chat(user, "<span class='notice'>The document has nobody to approve.</span>")
			else
				// Begin Approval
				user.visible_message(
					"<span class='notice'>[user] begins to review \the [src] for approval</span>",
					"<span class='notice'>You begin to review \the [src] for approval. <b>Be sure you have read it first!</b></span>")
				if(do_after(user, 5 SECONDS, target = src))
					// Recruitment Slots Filled Check
					if(task.recruits >= task.recruit_target)
						user.visible_message(
							"<span class='notice'>[user] removes their pen from \the [src]. Seems something's wrong.</span>",
							"<span class='notice'>You realize no more people can be recruited so you take \the [I] away from the \the [src].</span>")
						return
					// Signee In View Check
					if(!signee || !(signee in view(7, user)))
						user.visible_message(
							"<span class='notice'>[user] removes their pen from \the [src]. Seems something's wrong.</span>",
							"<span class='notice'>After realizing the signee isn't present, you take \the [I] away from \the [src].</span>")
						return
					// Signee Alive Check
					if(!considered_alive(signee.mind))
						user.visible_message(
							"<span class='notice'>[user] removes their pen from \the [src]. Seems something's wrong.</span>",
							"<span class='notice'>After realizing the signee isn't alive, you take \the [I] away from \the [src].</span>")
						return
					// Recruitable Faction Check
					if(!ispath(SSjob.GetJob(H.mind.assigned_role), task.recruit_faction))
						user.visible_message(
							"<span class='notice'>[user] removes their pen from \the [src]. Seems something's wrong.</span>",
							"<span class='notice'>After reviewing the form and seeing that their faction experience disqualifies them, you take \the [I] away from \the [src].</span>")
						return
					// Approve
					user.visible_message(
						"<span class='notice'>[user] approves \the [src]</span>",
						"<span class='notice'>You approve \the [src].</span>")
					approved_by = H
					approve()
		else
			user.visible_message(
				"<span class='notice'>[user] begins to sign \the [src]</span>",
				"<span class='notice'>You begin to sign \the [src].</span>")
			if(do_after(user, 5 SECONDS, target = src) && alert("Joining the faction means you abide by faction rules.", "OOC Rules", "Sign", "Cancel") == "Sign")
				user.visible_message(
					"<span class='notice'>[user] sign \the [src]</span>",
					"<span class='notice'>You sign \the [src].</span>")

				signee = user
				form_date = todays_date
				form_name = H.real_name

				form_faction_history = SSjob.GetJob(H.mind.assigned_role).faction

				form_age = H.age

				if(alert("What do you want to put as your availability?.", "[name]", "Always available", "Custom") == "Custom")
					form_availability = input(H, "Sign your residence.", "[name]", "Always Available") as text
				else
					form_availability = "Always available"

				if(alert("What do you want to put as your residence?.", "[name]", "None", "Custom") == "Custom")
					form_residence = input(H, "Sign your residence.", "[name]", "None") as text
				else
					form_residence = "None"

				form_profession = SSjob.GetJob(H.mind.assigned_role).title
				ui_interact(user)
		return
	// Ignite
	if(!(resistance_flags & FIRE_PROOF) && (resistance_flags & FLAMMABLE) && !(resistance_flags & ON_FIRE))
		var/ignition_message = ignition_effect(src, user)
		if(ignition_message)
			if(user.is_holding(src))
				user.dropItemToGround(src)
			user.visible_message(
				"<span class='boldwarning'>[user] lights \the [src] on fire</span>",
				"<span class='boldwarning'>You light \the [src] on fire.</span>")
			return
	return ..()

/obj/item/recruit_form/proc/approve()
	signee.faction = task.faction
	task.recruits++
	return

/obj/item/recruit_form/examine(mob/user)
	. = ..()
	if(!in_range(user, src) && !isobserver(user))
		. += "<span class='warning'>You're too far away to read it!</span>"
		return
	if(!user.can_read(src))
		return
	ui_interact(user)

/obj/item/recruit_form/ui_interact(mob/user)
	. = ..()
	var/dat = {"
		<html><head><style>
		table {
			border-collapse: collapse;
		 	width: 100%;
		}
		td, th {
			border: 2px solid #dddddd;
			text-align: left;
			padding: 8px;
		}

		tr:nth-child(1), tr:nth-child(9){
			background-color: #004d99;
		}
		</style>
		</head>
		<body>
		<center><b><h1>Recruitment Form</h1></b></center>
		<table>
			<tr><td><center><span style="color:#d9d9d9;"><b>PLEASE COMPLETE ALL INFORMATION REQUESTED<br> IN PRINT EXCEPT SIGNATURE</b></span></center></td></tr>
			<tr><td><b>Date:</b> [form_date]</td></tr>
			<tr><td><b>Name:</b> [form_name]</td></tr>
			<tr><td><b>Faction History:</b> [form_faction_history]</td></tr>
			<tr><td><b>Age:</b> [form_age]</td></tr>
			<tr><td><b>Availability:</b> [form_availability]</td></tr>
			<tr><td><b>Residence:</b> [form_residence]</td></tr>
			<tr><td><b>Current Profession:</b> [form_profession]</td></tr>
			<tr><td><b><center><span style="color:#d9d9d9;">By signing this signature you agree to the terms of the job and give your loyalty to the company and that failure to comply will result in your proportional punishment as decided by your given superiors.</span></center></b></td></tr>
			<tr><td><b>Signature:</b> <span style="font-family:cursive"><i>[form_name]<i></span></td></tr>
			<tr><td>After signing please hand this document to an employee of the company for approval. You must be present for them to sign.</td></tr>
			<tr><td><b>Approved by Signature:</b> <span style="font-family:cursive"><i>[approved_by ? approved_by.real_name : null]<i></span></td></tr>
		</table>
		</body>
		</html>
		"}
	var/datum/browser/popup = new(user, "recruitment_form", "recruitment form")
	popup.set_content(dat)
	popup.open()



// Box of Recruitment Forms
/obj/item/storage/box/recruit_forms
	name = "box of recruitment forms"
	desc = "Contains several scanners and labelers for shipping things. Wrapping Paper not included."
	illustration = "shipping"

/obj/item/storage/recruit_forms/PopulateContents()
	var/static/items_inside = list(
		/obj/item/pen=1,
		/obj/item/recruit_form=4,
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/recruit_forms/proc/set_task(var/datum/faction_task/individual_faction/recruit/task)
	for(var/I in contents)
		if(istype(I, /obj/item/recruit_form))
			var/obj/item/recruit_form/form = I
			form.task = task
