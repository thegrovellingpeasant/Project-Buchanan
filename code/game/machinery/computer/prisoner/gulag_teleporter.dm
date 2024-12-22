//computer that handle the points and teleports the prisoner
/obj/machinery/computer/prisoner/gulag_teleporter_computer
	name = "labor camp teleporter console"
	desc = "Used to send criminals to the Labor Camp."
	req_access = list(ACCESS_ARMORY)
	circuit = /obj/item/circuitboard/computer/gulag_teleporter_console

	var/default_goal = 200
	var/obj/machinery/gulag_teleporter/teleporter = null
	var/obj/structure/gulag_beacon/beacon = null
	var/mob/living/carbon/human/prisoner = null
	var/datum/data/record/temporary_record = null

/obj/machinery/computer/prisoner/gulag_teleporter_computer/Initialize()
	. = ..()
	scan_machinery()

/obj/machinery/computer/prisoner/gulag_teleporter_computer/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GulagTeleporterConsole", name)
		ui.open()

/obj/machinery/computer/prisoner/gulag_teleporter_computer/ui_data(mob/user)
	var/list/data = list()

	var/list/prisoner_list = list()
	var/can_teleport = FALSE

	if(teleporter && (teleporter.occupant && ishuman(teleporter.occupant)))
		prisoner = teleporter.occupant
		prisoner_list["name"] = prisoner.real_name
		if(inserted_id)
			can_teleport = TRUE
		if(!isnull(GLOB.data_core.general))
			for(var/r in GLOB.data_core.security)
				var/datum/data/record/R = r
				if(R.fields["name"] == prisoner_list["name"])
					temporary_record = R
					prisoner_list["crimstat"] = temporary_record.fields["criminal"]

	data["prisoner"] = prisoner_list

	if(teleporter)
		data["teleporter"] = teleporter
		data["teleporter_location"] = "([teleporter.x], [teleporter.y], [teleporter.z])"
		data["teleporter_lock"] = teleporter.locked
		data["teleporter_state_open"] = teleporter.state_open
	else
		data["teleporter"] = null
	if(beacon)
		data["beacon"] = beacon
		data["beacon_location"] = "([beacon.x], [beacon.y], [beacon.z])"
	else
		data["beacon"] = null
	if(inserted_id)
		data["id"] = inserted_id
		data["id_name"] = inserted_id.registered_name
		data["goal"] = inserted_id.goal
	else
		data["id"] = null
	data["can_teleport"] = can_teleport

	return data

/obj/machinery/computer/prisoner/gulag_teleporter_computer/ui_act(action, list/params)
	if(isliving(usr))
		playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 50, FALSE)
	if(..())
		return
	if(!allowed(usr))
		to_chat(usr, span_warning("Access denied."))
		return
	switch(action)
		if("scan_teleporter")
			teleporter = findteleporter()
			return TRUE
		if("scan_beacon")
			beacon = findbeacon()
			return TRUE
		if("handle_id")
			if(inserted_id)
				id_eject(usr)
			else
				id_insert(usr)
			return TRUE
		if("set_goal")
			var/new_goal = text2num(params["value"])
			if(!isnum(new_goal))
				return
			if(!new_goal)
				new_goal = default_goal
			inserted_id.goal = clamp(new_goal, 0, 1000) //maximum 1000 points
			return TRUE
		if("toggle_open")
			if(teleporter.locked)
				to_chat(usr, span_alert("The teleporter must be unlocked first."))
				return
			teleporter.toggle_open()
			return TRUE
		if("teleporter_lock")
			if(teleporter.state_open)
				to_chat(usr, span_alert("The teleporter must be closed first."))
				return
			teleporter.locked = !teleporter.locked
			return TRUE
		if("teleport")
			if(!teleporter || !beacon)
				return
			addtimer(CALLBACK(src, PROC_REF(teleport), usr), 5)
			return TRUE

/obj/machinery/computer/prisoner/gulag_teleporter_computer/proc/scan_machinery()
	teleporter = findteleporter()
	beacon = findbeacon()

/obj/machinery/computer/prisoner/gulag_teleporter_computer/proc/findteleporter()
	var/obj/machinery/gulag_teleporter/teleporterf = null

	for(var/direction in GLOB.cardinals)
		teleporterf = locate(/obj/machinery/gulag_teleporter, get_step(src, direction))
		if(teleporterf && teleporterf.is_operational())
			return teleporterf

/obj/machinery/computer/prisoner/gulag_teleporter_computer/proc/findbeacon()
	return locate(/obj/structure/gulag_beacon)

/obj/machinery/computer/prisoner/gulag_teleporter_computer/proc/teleport(mob/user)
	if(!inserted_id) //incase the ID was removed after the transfer timer was set.
		say("Warning: Unable to transfer prisoner without a valid Prisoner ID inserted!")
		return
	var/id_goal_not_set
	if(!inserted_id.goal)
		id_goal_not_set = TRUE
		inserted_id.goal = default_goal
		say("[inserted_id]'s ID card goal defaulting to [inserted_id.goal] points.")
	log_game("[key_name(user)] teleported [key_name(prisoner)] to the Labor Camp [COORD(beacon)] for [id_goal_not_set ? "default goal of ":""][inserted_id.goal] points.")
	teleporter.handle_prisoner(inserted_id, temporary_record)
	playsound(src, 'sound/weapons/emitter.ogg', 50, TRUE)
	prisoner.forceMove(get_turf(beacon))
	prisoner.Stun(40) // small travel dizziness
	to_chat(prisoner, span_warning("The teleportation makes you a little dizzy."))
	new /obj/effect/particle_effect/sparks(get_turf(prisoner))
	playsound(src, "sparks", 50, TRUE)
	if(teleporter.locked)
		teleporter.locked = FALSE
	teleporter.toggle_open()
	inserted_id = null
	temporary_record = null
