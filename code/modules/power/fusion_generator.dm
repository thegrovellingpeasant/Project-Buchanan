#define UPSTATE_CELL_IN		(1<<0)

#define GENERATOR_WIRING_INTACT 0
#define GENERATOR_WIRING_DISABLED 1

#define GENERATOR_COVER_CLOSED 0
#define GENERATOR_COVER_OPENED 1

/obj/machinery/power/fusion_generator
	name = "fusion generator"
	desc = "It's a high efficiency pre-war fusion generator, able to last for centuries provided its fusion core is intact and remains in the port."
	icon = 'icons/obj/power.dmi'
	icon_state = "generator"
	density = TRUE
	req_access = null
	use_power = NO_POWER_USE

	var/start_charge = 95
	var/area/area
	var/opened = GENERATOR_COVER_CLOSED
	var/wiring = GENERATOR_WIRING_INTACT
	var/obj/item/stock_parts/cell/cell
	var/cell_type = /obj/item/stock_parts/cell/fusion

/obj/machinery/power/fusion_generator/get_cell()
	return cell

/obj/machinery/power/fusion_generator/Initialize(mapload)
	. = ..()
	cell = new cell_type
	cell.charge = start_charge * cell.maxcharge / 100 
	connect_to_network()

/obj/machinery/power/fusion_generator/examine(mob/user)
	. = ..()
	if(opened)
		. += "The cover to the fusion core pod has been pried open!"
		if(wiring)
			. += "The wiring has been mangled and tampered with!"
			if(cell)
				. += "The [cell] remains intact in the generator."
			else
				. += "The generator lacks an energy cell!"
	else
		. += "The cover to the fusion core pod is closed and intact."
	
/obj/machinery/power/fusion_generator/crowbar_act(mob/user, obj/item/I)
	. = TRUE
	if(opened == GENERATOR_COVER_CLOSED)
		I.play_tool_sound(src)
		if(I.use_tool(src,user,70))
			if(opened == GENERATOR_COVER_CLOSED)
				opened = GENERATOR_COVER_OPENED
				user.visible_message(\
					"[user.name] has pried open the fusion core cover panel of the[src.name]!",\
					"<span class='notice'>You pry open the fusion core's cover panel.</span>")
				return
			else
				return
	
/obj/machinery/power/fusion_generator/wirecutter_act(mob/living/user, obj/item/I)
	. = TRUE
	if(opened == GENERATOR_COVER_OPENED)
		I.play_tool_sound(src)
		if(I.use_tool(src,user,100))
			if(wiring == GENERATOR_WIRING_INTACT)
				wiring = GENERATOR_WIRING_DISABLED
				user.visible_message("[user] removes \the [cell] from [src.name]!","<span class='notice'>You remove \the [cell].</span>")
				update_icon_state()
	else
		to_chat(user, "<span class='warning'>The panel is still on!</span>")
		return

/obj/machinery/power/fusion_generator/screwdriver_act(mob/living/user, obj/item/I)
	if(..())
		return TRUE
	. = TRUE
	if(wiring)
		if(cell)
			user.visible_message("[user] removes \the [cell] from [src.name]!","<span class='notice'>You remove \the [cell].</span>")
			var/turf/T = get_turf(user)
			cell.forceMove(T)
			cell.update_icon()
			update_icon()
			return
	else
		to_chat(user, "<span class='warning'>The wiring is still in the way!</span>")
		return

/obj/machinery/power/fusion_generator/attackby(obj/item/I, mob/living/user, params)

	if	(istype(I, /obj/item/stock_parts/cell) && (opened && wiring))
		if(cell)
			to_chat(user, "<span class='warning'>There is a power cell already installed!</span>")
			return
		else
			if(!user.transferItemToLoc(I, src))
				return
			cell = I
			user.visible_message(\
				"[user.name] has inserted the [cell] to [src.name]!",\
				"<span class='notice'>You insert the [cell].</span>")
				cell.update_icon()
				update_icon()
