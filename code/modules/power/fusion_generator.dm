#define UPSTATE_CELL_IN		(1<<0)

#define GENERATOR_WIRING_INTACT 0
#define GENERATOR_WIRING_DISABLED 1

#define GENERATOR_COVER_CLOSED 0
#define GENERATOR_COVER_OPENED 1
#define GENERATOR_COVER_REMOVED 2

/obj/machinery/power/fusion_generator
	name = "fusion generator"
	desc = "It's a high efficiency pre-war fusion generator, able to last for ages provided its fusion core is intact."
	icon = 'icons/obj/power.dmi'
	icon_state = "generator"
	density = TRUE
	req_access = null
	use_power = NO_POWER_USE

	var/area/area
	var/opened = GENERATOR_COVER_CLOSED
	var/wiring = GENERATOR_WIRING_INTACT
	var/obj/item/stock_parts/cell/cell
	var/cell_type = /obj/item/stock_parts/cell/fusion

/obj/machinery/power/fusion_generator/Initialize(mapload)
	. = ..()
	cell = new cell_type
	connect_to_network()

/obj/machinery/power/fusion_generator/examine(mob/user)
	. = ..()
	
/obj/machinery/power/fusion_generator/crowbar_act(mob/living/user, obj/item/I)
	. = ..()
	if(opened == GENERATOR_COVER_CLOSED)
		opened = GENERATOR_COVER_OPENED
		user.visible_message("[user] pries open the panel cover from the [src]!","<span class='notice'>You remove \the panel cover.</span>")
	
/obj/machinery/power/fusion_generator/wirecutter_act(mob/living/user, obj/item/I)
	. = ..()
	if(opened == GENERATOR_COVER_OPENED)
		wiring = GENERATOR_WIRING_DISABLED
		user.visible_message("[user] removes \the [cell] from [src]!","<span class='notice'>You remove \the [cell].</span>")

/obj/machinery/power/fusion_generator/screwdriver_act(mob/living/user, obj/item/I)
	. = ..()
	if(wiring == GENERATOR_WIRING_DISABLED)
		if(cell)
			user.visible_message("[user] removes \the [cell] from [src]!","<span class='notice'>You remove \the [cell].</span>")
			cell = null

/obj/machinery/power/fusion_generator/attackby(obj/item/W, mob/living/user, params)

	if	(istype(W, /obj/item/stock_parts/cell) && (opened && wiring))
		if(cell)
			to_chat(user, "<span class='warning'>There is a power cell already installed!</span>")
			return
		else
			if (stat & MAINT)
				to_chat(user, "<span class='warning'>There is no connector for your power cell!</span>")
				return
			if(!user.transferItemToLoc(W, src))
				return
			cell = W
			user.visible_message(\
				"[user.name] has inserted the power cell to [src.name]!",\
				"<span class='notice'>You insert the power cell.</span>")
