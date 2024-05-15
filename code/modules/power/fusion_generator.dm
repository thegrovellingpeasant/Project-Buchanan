#define UPSTATE_CELL_IN		(1<<0)

#define GENERATOR_COVER_CLOSED 0
#define GENERATOR_COVER_OPENED 1
#define GENERATOR_COVER_REMOVED 2

/obj/machinery/power/fusion_generator
	name = "fusion generator"
	desc = "It's a high efficiency pre-war fusion generator, able to last for ages provided its fusion core is intact."
	icon = 'icons/obj/power.dmi'
	icon_state = "generator"
	density = TRUE
	req_access =  = null
	use_power = NO_POWER_USE

	var/opened = GENERATOR_COVER_CLOSED

/obj/machinery/power/fusion_generator/Initialize(mapload)
	. = ..()
	
/obj/machinery/power/fusion_generator/crowbar_act(mob/living/user, obj/item/I)
	. = ..()
	
/obj/machinery/power/fusion_generator/wirecutter_act(mob/living/user, obj/item/I)
	. = ..()
	
/obj/machinery/power/fusion_generator/screwdriver_act(mob/living/user, obj/item/I)
	. = ..()
	