/obj/machinery/cell_charger
	name = "cell charger"
	desc = "It charges power cells."
	icon = 'icons/obj/power.dmi'
	icon_state = "ccharger"
	use_power = IDLE_POWER_USE
	idle_power_usage = 15
	active_power_usage = 180
	power_channel = EQUIP
	circuit = /obj/item/circuitboard/machine/cell_charger
	pass_flags = PASSTABLE
	var/obj/item/stock_parts/cell/charging = null
	var/charge_rate = 500

/obj/machinery/cell_charger/update_overlays()
	. += ..()

	if(!charging)
		return

	. += mutable_appearance(charging.icon, charging.icon_state)
	. += "ccharger-on"
	if(!(stat & (BROKEN|NOPOWER)))
		var/newlevel = round(charging.percent() * 4 / 100)
		. += "ccharger-o[newlevel]"

/obj/machinery/cell_charger/examine(mob/user)
	. = ..()
	. += "There's [charging ? "a" : "no"] cell in the charger."
	if(charging)
		. += "Current charge: [round(charging.percent(), 1)]%."
	if(in_range(user, src) || isobserver(user))
		. += span_notice("The status display reads: Charge rate at <b>[charge_rate]J</b> per cycle.")

/obj/machinery/cell_charger/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/stock_parts/cell) && !panel_open)
		var/obj/item/stock_parts/cell/C = W
		if(stat & BROKEN)
			to_chat(user, span_warning("[src] is broken!"))
			return
		if(!anchored)
			to_chat(user, span_warning("[src] isn't attached to the ground!"))
			return
		if(charging)
			to_chat(user, span_warning("There is already a cell in the charger!"))
			return
		if(!C.cancharge)
			to_chat(user, span_warning("The cell isn't compatible with this charger!"))
			return
		else
			var/area/a = loc.loc // Gets our locations location, like a dream within a dream
			if(!isarea(a))
				return
			if(!a.powered(EQUIP)) // There's no APC in this area, don't try to cheat power!
				to_chat(user, span_warning("[src] blinks red as you try to insert the cell!"))
				return
			if(!user.transferItemToLoc(W,src))
				return

			charging = W
			user.visible_message("[user] inserts a cell into [src].", span_notice("You insert a cell into [src]."))
			update_icon()
	else
		if(!charging && default_deconstruction_screwdriver(user, icon_state, icon_state, W))
			return
		if(default_deconstruction_crowbar(W))
			return
		if(!charging && default_unfasten_wrench(user, W))
			return
		return ..()

/obj/machinery/cell_charger/deconstruct()
	if(charging)
		charging.forceMove(drop_location())
	return ..()

/obj/machinery/cell_charger/Destroy()
	QDEL_NULL(charging)
	return ..()

/obj/machinery/cell_charger/proc/removecell()
	charging.update_icon()
	charging = null
	update_icon()

/obj/machinery/cell_charger/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(!charging)
		return

	user.put_in_hands(charging)
	charging.add_fingerprint(user)

	user.visible_message("[user] removes [charging] from [src].", span_notice("You remove [charging] from [src]."))

	removecell()

/obj/machinery/cell_charger/attack_tk(mob/user)
	if(!charging)
		return

	charging.forceMove(loc)
	to_chat(user, span_notice("You telekinetically remove [charging] from [src]."))

	removecell()

/obj/machinery/cell_charger/attack_ai(mob/user)
	if(!charging)
		return

	charging.forceMove(loc)
	to_chat(user, span_notice("You remotely disconnect the battery port and eject [charging] from [src]."))

	removecell()
	return

/obj/machinery/cell_charger/attack_robot(mob/user)
	attack_ai(user)

/obj/machinery/cell_charger/emp_act(severity)
	. = ..()

	if(stat & (BROKEN|NOPOWER) || . & EMP_PROTECT_CONTENTS)
		return

	if(charging)
		charging.emp_act(severity)

/obj/machinery/cell_charger/RefreshParts()
	charge_rate = 500
	for(var/obj/item/stock_parts/capacitor/C in component_parts)
		charge_rate *= C.rating

/obj/machinery/cell_charger/process()
	if(!charging || !anchored || (stat & (BROKEN|NOPOWER)))
		return

	if(charging.percent() >= 100)
		return
	use_power(charge_rate)
	charging.give(charge_rate)	//this is 2558, efficient batteries exist

	update_icon()
