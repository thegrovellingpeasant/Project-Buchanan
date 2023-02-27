/datum/crafting_recipe/roulette
	name = "Roulette Table"
	result = /obj/structure/roulettetable
	reqs = list(/obj/item/stack/sheet/mineral/wood = 5,
				/obj/item/stack/sheet/cloth = 5,
				/obj/item/stack/sheet/metal = 5)
	tools = list(TOOL_WRENCH, TOOL_SCREWDRIVER)
	time = 80
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/obj/structure/roulettetable
	name = "roulette table"
	desc = "A table with a roulette wheel. The wheel is of a 'single zero' design."
	icon = 'icons/fallout/machines/64x32.dmi'
	icon_state = "roulette"
	density = TRUE
	anchored = TRUE
	layer = TABLE_LAYER
	climbable = TRUE
	obj_flags = CAN_BE_HIT|SHOVABLE_ONTO
	pass_flags = LETPASSTHROW
	pass_flags_self = PASSTABLE
	max_integrity = 100
	bound_width = 64
	var/working = FALSE
	var/result
	var/spin_timer = 30

/obj/structure/roulettetable/wrench_act(mob/living/user, obj/item/I)
	if(working)
		to_chat(user, "<span class='warning'>You cannot unwrench the table during operation!</span>")
		return FALSE
	default_unfasten_wrench(user, I)
	return TRUE

/obj/structure/roulettetable/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(working)
		to_chat(user, "<span class='warning'>The wheel is already spinning!</span>")
		return
	if(!anchored)
		to_chat(user, "<span class='warning'>The table must be secured before spinning!</span>")
		return
	spinroulettewheel(user)

/obj/structure/roulettetable/proc/spinroulettewheel(mob/user)
	visible_message("<span class='notice'>[user] spins the roulette wheel!</span>")
	working = TRUE
	update_icon()

	spawn(spin_timer)
		result = rand(0,36)
		var/comment = ""
		//if result 
		if(result in list(1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,35,36))
			comment = "Red!"
		else if(result in list(2,4,6,8,10,11,13,15,17,20,22,24,26,28,29,31,33))
			comment = "Black!"
		else
			comment = "Zero!"
		visible_message("The roulette wheel lands on [result]. [comment]")
		working = FALSE
		update_icon()

/obj/structure/roulettetable/update_icon_state()
	if(working)
		icon_state = "roulette_act"
	else
		icon_state = "roulette"

