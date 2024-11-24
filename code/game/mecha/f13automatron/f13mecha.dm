/obj/mecha/f13
	name = "Base Fallout Mecha"
	desc = "If you're seeing this, call a coder!"
	icon = 'icons/fallout/mobs/robots/wasterobots.dmi'
	wastebot = TRUE
	explode_on_death = FALSE
	max_equip = 5
	dir_in = 2 //Facing South.
	max_temperature = 30000
	infra_luminosity = 8
	opacity = 0
	canstrafe = TRUE
	mouse_pointer = 'icons/mecha/mecha_mouse.dmi'
	exit_delay = 100
	enter_delay = 100
	equipsound = 'sound/mecha/powerloader_step.ogg'
	move_resist = MOVE_FORCE_DEFAULT
	var/max_weapons = 2
	var/weapons_type = list() //Defines what kind of weapons the robot can equip
	var/parameters = ""
	var/list/cargo = new
	var/cargo_capacity = 4

/obj/item/mmi/posibrain/f13
	name = "personality computational matrix"
	activation_delay = TRUE
	begin_activation_message = span_notice("After a few seconds of tinkering, you are able to configure the matrix to begin personality generation.")
	success_message = span_notice("The personality matrix pings, and its lights start flashing. Success!")
	fail_message = span_notice("Thepersonality matrix buzzes quietly, and the golden lights fade away. Perhaps you could try again?")
	new_role = "Personality Matrix"
	welcome_message = "<span class='warning'>ALL PAST LIVES ARE FORGOTTEN.</span>\n\
	<b>You are a personality matrix, created to inhabit the robots of the wastes.\n\
	As an artifical intelligence, you are bound to the parameters set by your programming.</b>"
	new_mob_message = span_notice("The personality matrix chimes quietly.")
	dead_message = span_deadsay("It appears to be completely inactive. The reset light is blinking.")
	recharge_message = span_warning("The personality matrix isn't ready to activate again yet! Give it some time to recharge.")
	wastebot = TRUE

/obj/item/mmi/posibrain/f13/examine(mob/user)
	. = ..()
	if(brainmob && wastebot)
		var/mob/living/brain/B = brainmob
		if(!B.key || !B.mind || B.stat == DEAD)
			. += span_warning("It seems that the personality matrix is completely unresponsive.")

		else if(!B.client)
			. += span_warning("It seems that the personality matrix is currently inactive; it might change.")

		else
			. += span_notice("It seems that the personality matrix is active.")

/obj/mecha/f13/MouseDrop_T(mob/M, mob/user)
	if(ishuman(user))
		to_chat(user, span_warning("You can only insert a personality matrix into the robot!"))
		return
	..()

/obj/mecha/f13/Initialize()
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/hydraulic_clamp/f13/HC = new
	HC.attach(src)
	armor = armor.setRating(energy = (capacitor.rating * 10))

/obj/mecha/f13/mmi_moved_inside(obj/item/mmi/mmi_as_oc, mob/user)
	. = ..()
	if(.)
		var/datum/atom_hud/hud = GLOB.huds[DATA_HUD_DIAGNOSTIC_BASIC]
		var/mob/living/brain/B = mmi_as_oc.brainmob
		hud.add_hud_to(B)

/obj/mecha/f13/Destroy()
	for(var/atom/movable/A in cargo)
		A.forceMove(drop_location())
		step_rand(A)
	cargo.Cut()
	return ..()

/obj/mecha/f13/contents_explosion(severity, target)
	for(var/X in cargo)
		var/obj/O = X
		if(prob(30/severity))
			cargo -= O
			O.forceMove(drop_location())
	. = ..()

/obj/mecha/f13/relay_container_resist(mob/living/user, obj/O)
	to_chat(user, span_notice("You lean on the back of [O] and start pushing so it falls out of [src]."))
	if(do_after(user, 300, target = O))
		if(!user || user.stat != CONSCIOUS || user.loc != src || O.loc != src )
			return
		to_chat(user, span_notice("You successfully pushed [O] out of [src]!"))
		O.forceMove(drop_location())
		cargo -= O
	else
		if(user.loc == src) //so we don't get the message if we resisted multiple times and succeeded.
			to_chat(user, span_warning("You fail to push [O] out of [src]!"))

/obj/item/mecha_parts/mecha_equipment/weapon/attach(obj/mecha/f13/M)
	..()
	if(istype(M))
		M.weapons += 1

/obj/mecha/f13/get_stats_part()
	var/integrity = obj_integrity/max_integrity*100
	var/cell_charge = get_charge()
	. = {"[report_internal_damage()]
						[integrity<30?"[span_userdanger("DAMAGE LEVEL CRITICAL")]<br>":null]
						<b>Integrity: </b> [integrity]%<br>
						<b>Powercell charge: </b>[isnull(cell_charge)?"No powercell installed":"[cell.percent()]%"]<br>
						<b>Unit housing temperature: </b> [return_temperature()]&deg;K|[return_temperature() - T0C]&deg;C<br>
						<b>Weapon capacity: </b> [weapons]/[max_weapons]<br>
						<b>Pulse resistance: </b> [capacitor.rating * 10]%<br>
						<b>Cooldown multiplier: </b> [cooldown_multiplier]<br>
						<b>Power consumption multiplier: </b> [power_multiplier]<br>
						[thrusters_action.owner ? "<b>Thrusters: </b> [thrusters_active ? "Enabled" : "Disabled"]<br>" : ""]
						[defense_action.owner ? "<b>Defense Mode: </b> [defense_mode ? "Enabled" : "Disabled"]<br>" : ""]
						[overload_action.owner ? "<b>Leg Actuators Overload: </b> [leg_overload_mode ? "Enabled" : "Disabled"]<br>" : ""]
						[smoke_action.owner ? "<b>Smoke: </b> [smoke]<br>" : ""]
						[zoom_action.owner ? "<b>Zoom: </b> [zoom_mode ? "Enabled" : "Disabled"]<br>" : ""]
						[switch_damtype_action.owner ? "<b>Damtype: </b> [damtype]<br>" : ""]
						[phasing_action.owner ? "<b>Phase Modulator: </b> [phasing ? "Enabled" : "Disabled"]<br>" : ""]
						<br>
						<b>Parameters: </b><br>
						[parameters] <br>
					"}

	. += "<b>Storage Compartment Contents ([src.cargo.len]/[cargo_capacity]):</b><div style=\"margin-left: 15px;\">"
	if(cargo.len)
		for(var/obj/O in cargo)
			if(istype(O, /obj/item/stack/f13Cash))
				var/obj/item/stack/f13Cash/D = O
				. += "<a href='?src=[REF(src)];drop_from_cargo=[REF(O)]'>Unload</a> : [O] ([D.amount])<br>"
			else
				. += "<a href='?src=[REF(src)];drop_from_cargo=[REF(O)]'>Unload</a> : [O]<br>"
	else
		. += "Nothing"
	. += "</div>"

/obj/mecha/f13/get_commands()
	. = {"<div class='wr'>
						<div class='header'>Electronics</div>
						<div class='links'>
						<b>Radio settings:</b><br>
						Microphone: <a href='?src=[REF(src)];rmictoggle=1'><span id="rmicstate">[radio.broadcasting?"Engaged":"Disengaged"]</span></a><br>
						Speaker: <a href='?src=[REF(src)];rspktoggle=1'><span id="rspkstate">[radio.listening?"Engaged":"Disengaged"]</span></a><br>
						Frequency:
						<a href='?src=[REF(src)];rfreq=-10'>-</a>
						<a href='?src=[REF(src)];rfreq=-2'>-</a>
						<span id="rfreq">[format_frequency(radio.frequency)]</span>
						<a href='?src=[REF(src)];rfreq=2'>+</a>
						<a href='?src=[REF(src)];rfreq=10'>+</a><br>
						</div>
						</div>
						<div class='wr'>
						<div class='header'>Permissions & Logging</div>
						<div class='links'>
						<a href='?src=[REF(src)];toggle_id_upload=1'><span id='t_id_upload'>[add_req_access?"L":"Unl"]ock ID upload panel</span></a><br>
						<a href='?src=[REF(src)];toggle_maint_access=1'><span id='t_maint_access'>[maint_access?"Forbid":"Permit"] maintenance protocols</span></a><br>
						<a href='?src=[REF(src)];view_log=1'>View internal log</a><br>
						</div>
						</div>
						<div id='equipment_menu'>[get_equipment_menu()]</div>
						"}


/obj/mecha/f13/output_maintenance_dialog(obj/item/card/id/id_card,mob/user)
	if(!id_card || !user)
		return
	. = {"<html>
						<head>
						<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
						<style>
						body {color: #00ff00; background: #000000; font-family:"Courier New", Courier, monospace; font-size: 12px;}
						a {padding:2px 5px; background:#32CD32;color:#000;display:block;margin:2px;text-align:center;text-decoration:none;}
						</style>
						</head>
						<body>
						[add_req_access?"<a href='?src=[REF(src)];req_access=1;id_card=[REF(id_card)];user=[REF(user)]'>Edit operation keycodes</a>":null]
						[maint_access?"<a href='?src=[REF(src)];maint_access=1;id_card=[REF(id_card)];user=[REF(user)]'>[(state>0) ? "Terminate" : "Initiate"] maintenance protocol</a>":null]
						[(state>0) ?"<a href='?src=[REF(src)];set_parameters=1;user=[REF(user)]'>Set Robot Parameters</a>":null]
						[(state>0) ?"<a href='?src=[REF(src)];change_robot_name=1'>Change robot name</a>":null]
						</body>
						</html>"}
	user << browse(., "window=exosuit_maint_console")
	onclose(user, "exosuit_maint_console")

/obj/mecha/f13/Topic(href, href_list)
	..()
	if(href_list["drop_from_cargo"])
		var/obj/O = locate(href_list["drop_from_cargo"])
		if(O && (O in cargo))
			var/turf/unload_location = get_turf(src)
			var/locx = unload_location.x
			var/locy = unload_location.y
			switch(dir)
				if(NORTH)
					locy += 1
				if(SOUTH)
					locy -= 1
				if(EAST)
					locx += 1
				if(WEST)
					locx -= 1
			unload_location = locate(locx, locy, z)
			if(istype(O, /obj/item/stack/f13Cash))
				var/obj/item/stack/f13Cash/D = O
				if(D.amount > 0)
					var/max = D.amount
					var/unload_amount = round(input(occupant,"How much money do you wish to unload?") as null|num)
					if(unload_amount)
						max = D.amount
						unload_amount = min(max, unload_amount)
						D.amount = max - unload_amount
						new /obj/item/stack/f13Cash/caps(unload_location, (unload_amount * D.value))
						if(D.amount == 0)
							cargo -= O
							qdel(O)
					else
						return
				else
					cargo -= O
					qdel(O)
			else
				occupant_message(span_notice("You unload [O]."))
				O.forceMove(unload_location)
				cargo -= O
			mecha_log_message("Unloaded [O]. Cargo compartment capacity: [cargo_capacity - src.cargo.len]")

	if(in_range(src, usr) && wastebot)
		var/obj/item/card/id/id_card
		if (href_list["set_parameters"])
			var/userinput = stripped_multiline_input(usr, "Set the parameters of the robot","Set Parameters","",)
			if(!userinput || usr.incapacitated())
				return
			to_chat(occupant, "New parameters have been set.")
			parameters = userinput
			output_maintenance_dialog(id_card, usr)
			mecha_log_message("New parameters have been set by [usr].")
			return

		if (href_list["change_robot_name"])
			var/userinput = stripped_input(usr, "Choose new robot name","Rename robot","", MAX_NAME_LEN)
			if(!userinput || usr.incapacitated())
				return
			to_chat(occupant, "Name has been changed from [name] to [userinput].")
			mecha_log_message("Name has been changed from [name] to [userinput] by [usr].")
			name = userinput
			occupant.name = userinput
			occupant.real_name = userinput
			occupant.chat_color_name = userinput
			output_maintenance_dialog(id_card, usr)
			return

//////////////////////
///// Sentry Bot /////
//////////////////////

/obj/mecha/f13/sentrybot
	name = "\improper Sentry Bot"
	desc = "A pre-war era military robot armed covered in thick armor plating. By the looks of it, it seems to have been constructed quite recently, with also boasting programming that's more advanced than it's counterparts."
	icon_state = "sentrybot"
	stepsound = 'sound/mecha/neostep2.ogg'
	weapons_type = list("Heavy", "Melee")
	explode_on_death = TRUE
	explode_devastate = TRUE
	opacity = 1
	step_in = 5
	max_integrity = 400
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 30, "bomb" = 35, "bio" = 0, "rad" = 75, "fire" = 100, "acid" = 100)
	melee_multiplier = 2
	force = 30
	step_energy_drain = 0
	normal_step_energy_drain = 0
	internal_damage_threshold = 20
	cargo_capacity = 10
	wreckage = /obj/structure/mecha_wreckage/f13/sentrybot

//////////////////////
///// Assaultron /////
//////////////////////

/obj/mecha/f13/assaultron
	name = "\improper Assaultron"
	desc = "A deadly close combat robot originally developed by RobCo in a vaguely feminine, yet ominous chassis. By the looks of it, it seems to have been constructed quite recently, with also boasting programming that's more advanced than it's counterparts."
	icon_state = "assaultron"
	weapons_type = list("Melee")
	step_in = 3
	max_integrity = 300
	armor = list("melee" = 45, "bullet" = 45, "laser" = 45, "energy" = 30, "bomb" = 35, "bio" = 0, "rad" = 75, "fire" = 100, "acid" = 100)
	force = 30
	melee_multiplier = 1.5
	step_energy_drain = 0
	normal_step_energy_drain = 0
	internal_damage_threshold = 30
	cargo_capacity = 6
	wreckage = /obj/structure/mecha_wreckage/f13/assaultron

/obj/mecha/f13/assaultron/Initialize()
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/assaultron
	ME.attach(src)

/obj/mecha/f13/assaultron/Destroy()
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/W = locate(/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/assaultron) in equipment
	qdel(W)

///////////////////////
///// Gutsy Mk II /////
///////////////////////

/obj/mecha/f13/gutsy
	name = "\improper Gutsy Mk II"
	desc = "A pre-war combat robot based off the Mr. Handy design. By the looks of it, it seems to have been constructed quite recently, with also boasting programming and upgrades that's more advanced than it's counterparts."
	icon_state = "pvtgutsymk2"
	weapons_type = list("Light", "Medium", "Melee")
	step_in = 2
	max_integrity = 250
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35, "energy" = 30, "bomb" = 35, "bio" = 0, "rad" = 75, "fire" = 100, "acid" = 100)
	max_weapons = 3
	max_equip = 4
	force = 30
	step_energy_drain = 0
	normal_step_energy_drain = 0
	internal_damage_threshold = 40
	cargo_capacity = 4
	stepsound = null
	turnsound = null
	wreckage = /obj/structure/mecha_wreckage/f13/gutsy

/obj/mecha/f13/gutsy/GrantActions(mob/living/user, human_occupant = 0)
	..()
	zoom_action.Grant(user, src)

/obj/mecha/f13/gutsy/RemoveActions(mob/living/user, human_occupant = 0)
	..()
	zoom_action.Remove(user)

//////////////////////
///// Protectron /////
//////////////////////

/obj/mecha/f13/protectron
	name = "\improper Protectron"
	desc = "A pre-war security robot that can be utilized for a variety of purposes. By the looks of it, it seems to have been constructed quite recently, with also boasting programming that's more advanced than it's counterparts."
	icon = 'icons/fallout/mobs/robots/protectrons.dmi'
	icon_state = "protectron"
	weapons_type = list("Light", "Melee")
	step_in = 4
	max_integrity = 300
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 30, "bomb" = 35, "bio" = 0, "rad" = 75, "fire" = 100, "acid" = 100)
	max_weapons = 2
	max_equip = 4
	force = 30
	step_energy_drain = 0
	normal_step_energy_drain = 0
	internal_damage_threshold = 50
	cargo_capacity = 6
	var/mode = null
	var/can_switch = TRUE	//Once this is false, protectron can't switch modules anymore
	wreckage = /obj/structure/mecha_wreckage/f13/protectron

/obj/mecha/f13/protectron/mmi_moved_inside(mob/living/carbon/human/H)
	..()
	add_overlay("eyes-[icon_state]")
	if(mode)
		icon_state += "_[mode]"

/obj/mecha/f13/protectron/ai_enter_mech(mob/living/silicon/ai/AI, interaction)
	..()
	icon_state += "_[mode]"

/obj/mecha/f13/protectron/proc/module_choice()
	cut_overlay(overlays)
	if(occupant)
		icon_state = "protectron_[mode]"
	if(!occupant)
		icon_state = "protectron_[mode]-open"

	switch(mode)
		if("trade")
			step_in = 5
			cargo_capacity = 16
			wreckage = /obj/structure/mecha_wreckage/f13/protectron/trade
		if("peacekeeper")
			step_in = 3
			force = 40
			step_energy_drain = 0 * power_multiplier
			normal_step_energy_drain = 0
			weapons_type = list("Light", "Medium", "Melee")
			wreckage = /obj/structure/mecha_wreckage/f13/protectron/peacekeeper

	playsound(loc, 'sound/items/jaws_pry.ogg', 50)

/obj/mecha/f13/protectron/output_maintenance_dialog(obj/item/card/id/id_card,mob/user)
	if(!id_card || !user)
		return
	. = {"<html>
						<head>
						<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
						<style>
						body {color: #00ff00; background: #000000; font-family:"Courier New", Courier, monospace; font-size: 12px;}
						a {padding:2px 5px; background:#32CD32;color:#000;display:block;margin:2px;text-align:center;text-decoration:none;}
						</style>
						</head>
						<body>
						[add_req_access?"<a href='?src=[REF(src)];req_access=1;id_card=[REF(id_card)];user=[REF(user)]'>Edit operation keycodes</a>":null]
						[maint_access?"<a href='?src=[REF(src)];maint_access=1;id_card=[REF(id_card)];user=[REF(user)]'>[(state>0) ? "Terminate" : "Initiate"] maintenance protocol</a>":null]
						[(state>0) ?"<a href='?src=[REF(src)];set_parameters=1;user=[REF(user)]'>Set Robot Parameters</a>":null]
						[(state>0) ?"<a href='?src=[REF(src)];change_robot_name=1'>Change robot name</a>":null]
						"}

	if(can_switch)
		. += "[(state>0) ?"<a href='?src=[REF(src)];change_robot_module=1'>Change robot module</a>":null]"

	. += {"</body>
			</html>"}

	user << browse(., "window=exosuit_maint_console")
	onclose(user, "exosuit_maint_console")

/obj/mecha/f13/protectron/Topic(href, href_list)
	..()
	if(in_range(src, usr) && wastebot)
		var/obj/item/card/id/id_card
		if (href_list["change_robot_module"])
			if(can_switch)
				var/type = input("What module would you like to set? (WARNING: CAN NOT CHANGE MODULES AFTER CHOICE)") as null|anything in list("Trader", "Peacekeeper")
				switch(type)
					if("Trader")
						mode = "trade"
					if("Peacekeeper")
						mode = "peacekeeper"
					else
						return
				can_switch = FALSE
				module_choice()
				to_chat(occupant, "[type] module has been set.")
				output_maintenance_dialog(id_card, usr)
				mecha_log_message("[type] module has been set by [usr].")
			else
				to_chat(usr, span_warning("Module has already been set!"))
			return
