/obj/structure/railing
	name = "railing"
	desc = "Basic railing meant to protect idiots like you from falling."
	icon = 'icons/fallout/structures/fences.dmi'
	icon_state = "railing"
	density = TRUE
	anchored = TRUE
	climbable = TRUE
	///Initial direction of the railing.
	var/ini_dir
	var/list/directional_railing_layers = list()

/obj/structure/railing/corner //aesthetic corner sharp edges hurt oof ouch
	icon_state = "railing_corner"
	density = FALSE
	climbable = FALSE

/obj/structure/railing/casino
	icon_state = "railing_casino"

/obj/structure/railing/casino/corner //aesthetic corner sharp edges hurt oof ouch
	icon_state = "casino_corner"
	density = FALSE
	climbable = FALSE

/obj/structure/railing/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/simple_rotation,ROTATION_ALTCLICK | ROTATION_CLOCKWISE | ROTATION_COUNTERCLOCKWISE | ROTATION_VERBS ,null,CALLBACK(src, PROC_REF(can_be_rotated)),CALLBACK(src, PROC_REF(after_rotation)))

/obj/structure/railing/Initialize()
	. = ..()
	ini_dir = dir

/obj/structure/railing/attackby(obj/item/I, mob/living/user, params)
	..()
	add_fingerprint(user)
	if(I.tool_behaviour == TOOL_WELDER && user.a_intent == INTENT_HELP)
		if(obj_integrity < max_integrity)
			if(!I.tool_start_check(user, amount=0))
				return
			to_chat(user, span_notice("You begin repairing [src]..."))
			if(I.use_tool(src, user, 40, volume=50))
				obj_integrity = max_integrity
				to_chat(user, span_notice("You repair [src]."))
		else
			to_chat(user, span_warning("[src] is already in good condition!"))
		return

/obj/structure/railing/wirecutter_act(mob/living/user, obj/item/I)
	. = ..()
	if(!anchored)
		to_chat(user, span_warning("You cut apart the railing."))
		I.play_tool_sound(src, 100)
		deconstruct()
		return TRUE

/obj/structure/railing/deconstruct(disassembled)
	. = ..()
	if(!loc) //quick check if it's qdeleted already.
		return
	if(!(flags_1 & NODECONSTRUCT_1))
		var/obj/item/stack/rods/rod = new /obj/item/stack/rods(drop_location(), 3)
		transfer_fingerprints_to(rod)
		qdel(src)
///Implements behaviour that makes it possible to unanchor the railing.
/obj/structure/railing/wrench_act(mob/living/user, obj/item/I)
	. = ..()
	if(flags_1&NODECONSTRUCT_1)
		return
	to_chat(user, span_notice("You begin to [anchored ? "unfasten the railing from":"fasten the railing to"] the floor..."))
	if(I.use_tool(src, user, volume = 75, extra_checks = CALLBACK(src, PROC_REF(check_anchored), anchored)))
		setAnchored(!anchored)
		to_chat(user, span_notice("You [anchored ? "fasten the railing to":"unfasten the railing from"] the floor."))
	return TRUE

/obj/structure/railing/CanPass(atom/movable/mover, border_dir)
	. = ..()
	if(border_dir & dir)
		var/checking = FLYING | FLOATING
		return . || mover.throwing || mover.movement_type & checking
	return TRUE

/obj/structure/railing/corner/CanPass()
	..()
	return TRUE

/obj/structure/railing/CheckExit(atom/movable/mover, turf/target)
	..()
	if(get_dir(loc, target) & dir)
		var/checking = UNSTOPPABLE | FLYING | FLOATING
		return !density || mover.throwing || mover.movement_type & checking || mover.move_force >= MOVE_FORCE_EXTREMELY_STRONG
	return TRUE

/obj/structure/railing/corner/CheckExit()
	return TRUE

/obj/structure/railing/proc/can_be_rotated(mob/user,rotation_type)
	if(anchored)
		to_chat(user, span_warning("[src] cannot be rotated while it is fastened to the floor!"))
		return FALSE

	var/target_dir = turn(dir, rotation_type == ROTATION_CLOCKWISE ? -90 : 90)

	if(!valid_window_location(loc, target_dir)) //Expanded to include rails, as well!
		to_chat(user, span_warning("[src] cannot be rotated in that direction!"))
		return FALSE
	return TRUE

/obj/structure/railing/proc/check_anchored(checked_anchored)
	if(anchored == checked_anchored)
		return TRUE

/obj/structure/railing/proc/handle_railing_layer() //this can be done more efficiently but i don't know how and am too tired to figure out
	if(dir == NORTH)
		layer = BELOW_OBJ_LAYER
	if(dir == EAST)
		layer = BELOW_OBJ_LAYER
	if(dir == SOUTH)
		layer = WALL_OBJ_LAYER
	if(dir == WEST)
		layer = BELOW_OBJ_LAYER
	if(dir == NORTHWEST)
		layer = BELOW_OBJ_LAYER
	if(dir == NORTHEAST)
		layer = BELOW_OBJ_LAYER
	if(dir == SOUTHEAST)
		layer = WALL_OBJ_LAYER
	if(dir == SOUTHWEST)
		layer = WALL_OBJ_LAYER

/obj/structure/railing/proc/after_rotation(mob/user,rotation_type)
	air_update_turf(1)
	ini_dir = dir
	add_fingerprint(user)
	handle_railing_layer()

/////////////
// RAILING //
/////////////

//Wooden fence
/obj/structure/railing/wood
	name = "wooden fence"
	desc = "Marks property and prevents accidents."
	icon = 'icons/fallout/structures/fences.dmi'
	icon_state = "straight_wood"
	layer = WALL_OBJ_LAYER

/obj/structure/railing/wood/Initialize()
	. = ..()
	ini_dir = dir

/obj/structure/railing/wood/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/railing/wood/post
	icon_state = "post_wood"
	density = FALSE

/obj/structure/railing/wood/post/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/simple_door/metal/fence/wooden
	name = "wood fence gate"
	desc = "A wooden gate for a wood fence."
	icon_state = "fence_wood"
	door_type = "fence_wood"
	open_sound = "sound/machines/door_open.ogg"
	close_sound = "sound/machines/door_close.ogg"
	opacity = FALSE
	base_opacity = FALSE
	can_hold_padlock = TRUE

/obj/structure/railing/corrugated
	name = "fence"
	desc = "Marks property and prevents accidents."
	icon = 'icons/obj/fence.dmi'
	icon_state = "corrugatedfence"
	layer = BELOW_OBJ_LAYER

/obj/structure/railing/corrugated/two
	name = "fence"
	icon_state = "corrugatedfence2"

/obj/structure/railing/corrugated/three
	name = "fence"
	icon_state = "corrugatedfence3"

/obj/structure/railing/corrugated/four
	name = "fence"
	icon_state = "corrugatedfence4"

/obj/structure/railing/corrugated/five
	name = "fence"
	icon_state = "corrugatedfence5"

/obj/structure/railing/corrugated/six
	name = "fence"
	icon_state = "corrugatedfence6"

/obj/structure/railing/corrugated/Initialize()
	. = ..()
	ini_dir = dir

//Yellow rail
/obj/structure/railing/handrail
	name = "handrail"
	desc = "A waist high handrail, perhaps you could climb over it."
	icon_state = "handrail_y"
	layer = WALL_OBJ_LAYER

/obj/structure/railing/handrail/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/railing/handrail/end
	icon_state = "handrail_y_end"
	density = FALSE

/obj/structure/railing/handrail/end/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/railing/handrail/intersect
	icon_state = "handrail_y_intersect"

//Rusty rail
/obj/structure/railing/handrail/rusty
	name = "handrail"
	desc = "Old, rusted metal handrails. The green paint is chipping off in spots."
	icon_state = "handrail_g"

/obj/structure/railing/handrail/rusty/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/railing/handrail/rusty/end
	icon_state = "handrail_g_end"
	density = FALSE

/obj/structure/railing/handrail/rusty/end/underlayer
	layer = BELOW_MOB_LAYER

//Blue rail
/obj/structure/railing/handrail/blue
	name = "handrail"
	desc = "Old, rusted metal handrails. The green paint is chipping off in spots."
	icon_state = "handrail_b"

/obj/structure/railing/handrail/blue/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/railing/handrail/blue/end
	icon_state = "handrail_b_end"

/obj/structure/railing/handrail/blue/end/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/railing/handrail/blue/intersect
	icon_state = "handrail_b_intersect"


///////////
// POLES //
/////////// For tents and such

/obj/structure/railing/tent_pole
	icon_state = "pole_tent"
	density = FALSE

/obj/structure/railing/tent_pole/top
	icon_state = "pole_tent_top"

/obj/structure/railing/dancing_pole
	icon_state = "pole_b"
	layer = BELOW_MOB_LAYER

/obj/structure/railing/dancing_pole/top
	icon_state = "pole_t"

/obj/structure/railing/ridiculousattentiontodetail
	name = "railing"
	icon_state = "stairrailing"
	var/mutable_appearance/railingoverlay

/obj/structure/railing/ridiculousattentiontodetail/Initialize()
	. = ..()
	ini_dir = dir
	railingoverlay = mutable_appearance(icon, "[icon_state]overlay", ABOVE_ALL_MOB_LAYER)
	add_overlay(railingoverlay)
