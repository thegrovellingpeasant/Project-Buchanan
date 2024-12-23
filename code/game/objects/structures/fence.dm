//Chain link fences
//Sprites derivative from unweathered VG originals.


#define CUT_TIME 50
#define CLIMB_TIME 150

#define NO_HOLE 0 //section is intact
#define MEDIUM_HOLE 1 //medium hole in the section - can climb through
#define LARGE_HOLE 2 //large hole in the section - can walk through
#define DESTROY_HOLE 3 //time to remove that fence

/obj/structure/fence
	name = "fence"
	desc = "A chain link fence. Not as effective as a wall, but generally it keeps people out."
	density = TRUE
	anchored = TRUE
	icon = 'icons/fallout/structures/fences.dmi'
	icon_state = "straight"
	barricade = TRUE
	proj_pass_rate = 95
	var/cuttable = TRUE
	var/hole_size= NO_HOLE
	var/invulnerable = FALSE
	var/hole_visuals = TRUE //Whether the fence piece has visuals for being cut. Used in update_cut_status()

/obj/structure/fence/Initialize()
	. = ..()

	update_cut_status()

/obj/structure/fence/examine(mob/user)
	. = ..()
	switch(hole_size)
		if(MEDIUM_HOLE)
			. += "There is a large hole in \the [src]."
		if(LARGE_HOLE)
			. += "\The [src] has been completely cut through."

/obj/structure/fence/end
	icon_state = "end"
	cuttable = TRUE
	hole_visuals = FALSE

/obj/structure/fence/corner
	icon_state = "corner"
	cuttable = TRUE
	hole_visuals = FALSE

/obj/structure/fence/post
	icon_state = "post"
	cuttable = FALSE

/obj/structure/fence/cut/medium
	icon_state = "straight_cut2"
	hole_size = MEDIUM_HOLE

/obj/structure/fence/cut/large
	icon_state = "straight_cut3"
	hole_size = LARGE_HOLE


/obj/structure/fence/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/wirecutters))
		if(!cuttable)
			to_chat(user, span_notice("This section of the fence can't be cut."))
			return
		if(invulnerable)
			to_chat(user, span_notice("This fence is too strong to cut through."))
			return
		var/current_stage = hole_size

		user.visible_message(span_danger("\The [user] starts cutting through \the [src] with \the [W]."),\
		span_danger("You start cutting through \the [src] with \the [W]."))

		if(do_after(user, CUT_TIME*W.toolspeed, target = src))
			if(current_stage == hole_size)
				switch(++hole_size)
					if(MEDIUM_HOLE)
						visible_message(span_notice("\The [user] cuts into \the [src] some more."))
						to_chat(user, span_info("You could probably fit yourself through that hole now. Although climbing through would be much faster if you made it even bigger."))
						climbable = TRUE
						W.play_tool_sound(user, 20)
					if(LARGE_HOLE)
						visible_message(span_notice("\The [user] completely cuts through \the [src]."))
						to_chat(user, span_info("The hole in \the [src] is now big enough to walk through."))
						climbable = FALSE
						W.play_tool_sound(user, 20)
					if(DESTROY_HOLE)
						visible_message(span_notice("\The [user] removes \the [src]."))
						to_chat(user, span_info("\The [src] is removed."))
						deconstruct(TRUE)
						W.play_tool_sound(user, 20)

				update_cut_status()


	if(istype(W, /obj/item/stack/rods))
		var/obj/item/stack/rods/rods = W
		switch(hole_size)
			if(NO_HOLE)
				to_chat(user, span_warning("You cannot repair \the [src] any further!"))
				return
			if(MEDIUM_HOLE)
				if(rods.get_amount() < 2)
					to_chat(user, span_warning("You need at least two rods to repair \the [src]!"))
					return
				to_chat(user, span_notice("You start repairing \the [src]..."))
				if(do_after(user, 20, target = src))
					if(rods.get_amount() < 2)
						return
					rods.use(2)
					to_chat(user, span_notice("You completely repair the hole in \the [src]."))
					hole_size = NO_HOLE
			if(LARGE_HOLE)
				if(rods.get_amount() < 2)
					to_chat(user, span_warning("You need at least two rods to repair \the [src]!"))
					return
				to_chat(user, span_notice("You start repairing \the [src]..."))
				if(do_after(user, 20, target = src))
					if(rods.get_amount() < 2)
						return
					rods.use(2)
					to_chat(user, span_notice("You repair a bit of the hole in \the [src]."))
					hole_size = MEDIUM_HOLE

		update_cut_status()

	return TRUE

/obj/structure/fence/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/rods(get_turf(src), 4)
	qdel(src)

/obj/structure/fence/proc/update_cut_status()
	if(!cuttable)
		return
	density = TRUE
	switch(hole_size)
		if(NO_HOLE)
			if(!hole_visuals) //This is omega-stupid, fix this idiot
				return
			icon_state = initial(icon_state)
		if(MEDIUM_HOLE)
			if(!hole_visuals)
				return
			icon_state = "straight_cut2"
		if(LARGE_HOLE)
			density = FALSE
			if(!hole_visuals)
				return
			icon_state = "straight_cut3"

//FENCE DOORS

/obj/structure/fence/door
	name = "fence door"
	desc = "Not very useful without a real lock."
	icon_state = "fence"
	cuttable = FALSE
	var/open = FALSE

/obj/structure/fence/door/Initialize()
	. = ..()

	update_door_status()

/obj/structure/fence/door/opened // these were done badly sprite/code wise so the animation of them being opened or closed would always play when they first showed up on screen, i don't know how to fix so i just made open and closed unanimated
	icon_state = "fenceopen"
	open = TRUE
	density = TRUE

/obj/structure/fence/door/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(can_open(user))
		toggle(user)

	return TRUE

/obj/structure/fence/door/proc/toggle(mob/user)
	switch(open)
		if(FALSE)
			visible_message(span_notice("\The [user] opens \the [src]."))
			open = TRUE
		if(TRUE)
			visible_message(span_notice("\The [user] closes \the [src]."))
			open = FALSE

	update_door_status()
	playsound(src, 'sound/machines/click.ogg', 100, 1)

/obj/structure/fence/door/proc/update_door_status()
	switch(open)
		if(FALSE)
			density = TRUE
			icon_state = "fence"
		if(TRUE)
			density = FALSE
			icon_state = "fenceopen"

/obj/structure/fence/door/proc/can_open(mob/user)
	return TRUE

/obj/structure/simple_door/metal/fence
	name = "fence gate"
	desc = "A gate for a fence."
	icon = 'icons/fallout/structures/fences.dmi'
	icon_state = "fence"
	door_type = "fence"
	open_sound = "sound/f13machines/doorchainlink_open.ogg"
	close_sound = "sound/f13machines/doorchainlink_close.ogg"
	opacity = FALSE
	base_opacity = FALSE
	can_hold_padlock = TRUE
	opening_time = 3
	closing_time = 2
	hard_open = 0

//Obsolete handrails, railing is better
/obj/structure/fence/handrail_end
	name = "handrail"
	desc = "A waist high handrail, perhaps you could climb over it."
	icon = 'icons/obj/fence.dmi'
	icon_state = "y_handrail_end"
	cuttable = FALSE

/obj/structure/fence/handrail_corner
	name = "handrail"
	desc = "A waist high handrail, perhaps you could climb over it."
	icon = 'icons/obj/fence.dmi'
	icon_state = "y_handrail_corner"
	cuttable = FALSE
	climbable = TRUE

/obj/structure/fence/handrail
	name = "handrail"
	desc = "A waist high handrail, perhaps you could climb over it."
	icon = 'icons/obj/fence.dmi'
	icon_state = "y_handrail"
	cuttable= FALSE
	climbable = TRUE

/obj/structure/fence/handrail_end/non_dense
	name = "handrail"
	desc = "A waist high handrail, perhaps you could climb over it."
	icon = 'icons/obj/fence.dmi'
	icon_state = "y_handrail_end"
	cuttable = FALSE
	density = FALSE
	layer = ABOVE_MOB_LAYER

#undef CUT_TIME
#undef CLIMB_TIME

#undef NO_HOLE
#undef MEDIUM_HOLE
#undef LARGE_HOLE
#undef DESTROY_HOLE

// Obsolete wooden fences and dancing pole, better in railing.
/obj/structure/fence/wooden
	name = "wooden fence"
	desc = "A fence fashioned out of wood planks. Designed to keep animals in and vagrants out"
	icon = 'icons/obj/fence.dmi'
	icon_state = "straight_wood"
	cuttable = FALSE
	climbable = TRUE
	layer = BELOW_OBJ_LAYER
	proj_pass_rate = 80

/obj/structure/fence/wooden/side
	icon = 'icons/obj/fence.dmi'
	icon_state = "post_wood"
	cuttable = FALSE
	dir = EAST

/obj/structure/fence/end/wooden
	icon = 'icons/obj/fence.dmi'
	icon_state = "end_wood"
	cuttable = FALSE

/obj/structure/fence/corner/wooden
	icon = 'icons/obj/fence.dmi'
	icon_state = "corner_wood"
	cuttable = FALSE

/obj/structure/fence/pole_t
	name = "pole"
	icon_state = "pole_t"
	desc = "A stout pole."
	cuttable = FALSE
	density = FALSE
	layer = ABOVE_MOB_LAYER

/obj/structure/fence/pole_b
	name = "pole"
	icon_state = "pole_b"
	desc = "A pole, commonly used in traditional fertility rituals. Or by degenerates."
	cuttable = FALSE
	density = FALSE

/*
Electric Fences subtype - for use at NCRCF
*/

/obj/structure/fence/electric_fence
	icon = 'icons/fallout/structures/fences.dmi'
	icon_state = "straight"
	name = "electric fence"
	desc = "A chain-link fence that has the capacity to be electrified, and often is. Don't get too close."
	var/obj/machinery/power/fusion_generator/ncrcf/fusion_generator = null
	flags_1 = NODECONSTRUCT_1
	resistance_flags = FIRE_PROOF | ACID_PROOF | UNACIDABLE | FREEZE_PROOF | INDESTRUCTIBLE

/obj/structure/fence/electric_fence/end
	icon_state = "end"
	cuttable = TRUE
	hole_visuals = FALSE

/obj/structure/fence/electric_fence/corner
	icon_state = "corner"
	cuttable = TRUE
	hole_visuals = FALSE

/obj/structure/fence/electric_fence/post
	icon_state = "post"
	cuttable = FALSE

/obj/structure/fence/electric_fence/Initialize()
	. = ..()
	locate_generator()
	update_cut_status()

/obj/structure/fence/electric_fence/proc/locate_generator()
	fusion_generator = locate()

/obj/structure/fence/electric_fence/examine(mob/user)
	. = ..()
	if(fusion_generator.get_cell())
		. += span_info("The wires seem to be currently powered by a nearby generator and cannot be cut safely while its operational.")
	else
		. += span_info("The wires seem to be unpowered and can be safely cut by tools.")

//LIGHTNING BOLT LIGHTNING BOLT
//Taken straight from Grille code, has the electrification stuff ported over.

/obj/structure/fence/electric_fence/Bumped(atom/movable/AM)
	if(!ismob(AM))
		return
	var/mob/M = AM
	shock(M, 70)

/obj/structure/fence/electric_fence/hulk_damage()
	return 60

/obj/structure/fence/electric_fence/CanPass(atom/movable/mover, border_dir)
	if(istype(mover) && (mover.pass_flags & PASSGRILLE))
		return TRUE
	else
		if(istype(mover, /obj/item/projectile) && density)
			return prob(30)
		else
			return !density

/obj/structure/fence/electric_fence/proc/shock(mob/user, prb)
	if(!anchored || broken)		// anchored/broken fence are never connected
		return FALSE
	if(!prob(prb))
		return FALSE
	if(!in_range(src, user))//To prevent TK and mech users from getting shocked
		return FALSE
	//var/turf/T = get_turf(src)
	//var/obj/structure/cable/C = T.get_cable_node()
	/*if(C)
		if(electrocute_mob(user, C, src, 1, TRUE))
			var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
			s.set_up(3, 1, src)
			s.start()
			throwforce = 20
			return TRUE
		else
			return FALSE*/
	if(fusion_generator)
		if(!fusion_generator.get_cell())
			return FALSE
		if(electrocute_mob(user, fusion_generator.get_cell(), src, 1, TRUE))
			var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
			s.set_up(3, 1, src)
			s.start()
			throwforce = 20
			return TRUE
		else
			return FALSE
	return FALSE

/obj/structure/fence/electric_fence/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/wirecutters))
		if(fusion_generator)
			if(fusion_generator.get_cell())
				shock(user, 100)
	.=..()
