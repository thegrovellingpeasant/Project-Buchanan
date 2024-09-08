#define UPSTATE_CELL_IN		(1<<0)

#define GENERATOR_WIRING_INTACT 0
#define GENERATOR_WIRING_DISABLED 1

#define GENERATOR_COVER_CLOSED 0
#define GENERATOR_COVER_OPENED 1

/obj/machinery/power/fusion_generator
	name = "fusion generator"
	desc = "It's a high efficiency pre-war fusion generator, able to last for centuries provided its fusion core is intact and enabled."
	icon = 'icons/obj/fusion_generator.dmi'
	icon_state = "fusion_generator"
	density = TRUE
	bound_width = 64
	req_access = null
	use_power = NO_POWER_USE
	idle_power_usage = 0
	active_power_usage = 0
	var/start_charge = 100
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

/obj/machinery/power/fusion_generator/process()
	var/lastused_light = 0
	var/lastused_equip = 0
	var/lastused_environ = 0
	var/lastused_total = 0
	lastused_light = area.usage(CHANNEL_STATIC_LIGHT)
	lastused_light += area.usage(LIGHT)
	lastused_equip = area.usage(EQUIP)
	lastused_equip += area.usage(STATIC_EQUIP)
	lastused_environ = area.usage(ENVIRON)
	lastused_environ += area.usage(STATIC_ENVIRON)
	area.clear_usage()

	lastused_total = lastused_light + lastused_equip + lastused_environ
	var/cur_used = lastused_total
	if(cell)
		var/cell_use = cell.use(GLOB.CELLRATE * cur_used)
		add_avail(cell_use)
		add_load(cell_use)
		avail(cell_use)
		surplus()
	..()

/obj/machinery/power/fusion_generator/update_icon_state()
	if(cell)
		icon_state = "[initial(icon_state)]_on"
	else
		icon_state = "[initial(icon_state)]_off"

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
		. += "The cover to the fusion core pod is closed and intact,"
		if(cell)
			. += " and the [cell] remains intact in the generator."
		else
			. += " but there is no visible cell in the generator."

/obj/machinery/power/fusion_generator/crowbar_act(mob/user, obj/item/I)
	. = TRUE
	if(opened == GENERATOR_COVER_CLOSED)
		I.play_tool_sound(src)
		to_chat(user, "<span class='notice'>You start to pry upen the cover of the fusion core slot...</span>")
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
		to_chat(user, "<span class='notice'>You start to cut the wires connected to the fusion core...</span>")
		if(I.use_tool(src,user,100))
			if(wiring == GENERATOR_WIRING_INTACT)
				wiring = GENERATOR_WIRING_DISABLED
				user.visible_message("[user] removes \the [cell] from [src.name]!","<span class='notice'>You cut the wires in the way of the fusion core.</span>")
				return
			else
				user.visible_message("You already cut the wires in the way!")
				return
	else
		to_chat(user, "<span class='warning'>The panel is still on!</span>")
		return

/obj/machinery/power/fusion_generator/screwdriver_act(mob/living/user, obj/item/I)
	if(..())
		return TRUE
	. = TRUE
	if(!opened)
		to_chat(user, "<span class='warning'>The slot cover is still in the way!</span>")
		return
	if(wiring)
		if(cell)
			user.visible_message("[user] removes \the [cell] from [src.name]!","<span class='notice'>You remove \the [cell].</span>")
			user.put_in_hands(cell)
			cell.update_icon()
			cell = null
			update_icon_state()
			return
		else
			to_chat(user, "<span class='notice'>There's no fusion core for you to remove!</span>")
	else
		to_chat(user, "<span class='warning'>The wiring is still in the way!</span>")
		return

/obj/machinery/power/fusion_generator/attackby(obj/item/I, mob/living/user, params)

	if(istype(I, /obj/item/stock_parts/cell) && (opened && wiring))
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
			update_icon_state()

/obj/machinery/power/fusion_generator/ncrcf
	name = "fusion generator"
	desc = "It's a high efficiency pre-war fusion generator, refurbished by NCR engineers and scientists in order to provide power for the New Reno NCR Correctional Facility."
