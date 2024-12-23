/obj/machinery/mass_driver
	name = "mass driver"
	desc = "The finest in spring-loaded piston toy technology, now on a space station near you."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "mass_driver"
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 50
	var/power = 1
	var/code = 1
	var/id = 1
	var/drive_range = 50	//this is mostly irrelevant since current mass drivers throw into space, but you could make a lower-range mass driver for interstation transport or something I guess.

/obj/machinery/mass_driver/connect_to_shuttle(obj/docking_port/mobile/port, obj/docking_port/stationary/dock, idnum, override=FALSE)
	id = "[idnum][id]"

/obj/machinery/mass_driver/proc/drive(amount)
	if(stat & (BROKEN|NOPOWER))
		return
	use_power(500)
	var/O_limit
	var/atom/target = get_edge_target_turf(src, dir)
	for(var/atom/movable/O in loc)
		if(!O.anchored || ismecha(O))	//Mechs need their launch platforms.
			O_limit++
			if(O_limit >= 20)
				audible_message(span_notice("[src] lets out a screech, it doesn't seem to be able to handle the load."))
				break
			use_power(500)
			O.throw_at(target, drive_range * power, power)
	flick("mass_driver1", src)


/obj/machinery/mass_driver/emp_act(severity)
	. = ..()
	if (. & EMP_PROTECT_SELF)
		return
	if(stat & (BROKEN|NOPOWER))
		return
	drive()

#define DRIVE_DELAY (1 SECONDS)

/obj/machinery/mass_driver/pressure_plate
	name = "pressure plated mass driver"

/obj/machinery/mass_driver/pressure_plate/Initialize(mapload)
	. = ..()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
	)
	AddElement(/datum/element/connect_loc, loc_connections)

/obj/machinery/mass_driver/pressure_plate/proc/on_entered(datum/source, atom/movable/enterer, atom/old_loc, list/atom/old_locs)
	SIGNAL_HANDLER
	if(isliving(source))
		to_chat(source, span_warning("You feel something click beneath you!"))
	addtimer(CALLBACK(src, PROC_REF(drive)), DRIVE_DELAY)

#undef DRIVE_DELAY
