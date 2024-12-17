#define STAIR_TERMINATOR_AUTOMATIC 0
#define STAIR_TERMINATOR_NO 1
#define STAIR_TERMINATOR_YES 2

// dir determines the direction of travel to go upwards (due to lack of sprites, currently only 1 and 2 make sense)
// stairs require /turf/open/transparent/openspace as the tile above them to work
// multiple stair objects can be chained together; the Z level transition will happen on the final stair object in the chain

/obj/structure/stairs
	name = "stairs"
	icon = 'icons/obj/stairs.dmi'
	icon_state = "stairs"
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

	var/force_open_above = FALSE // replaces the turf above this stair obj with /turf/open/transparent/openspace
	var/terminator_mode = STAIR_TERMINATOR_AUTOMATIC
	var/turf/listeningTo

/obj/structure/stairs/north
	dir = NORTH

/obj/structure/stairs/south
	dir = SOUTH

/obj/structure/stairs/east
	dir = EAST

/obj/structure/stairs/west
	dir = WEST

/obj/structure/stairs/slopes
	name = "slope"
	icon = 'icons/obj/stairs.dmi'
	icon_state = "slopes"
	plane = FLOOR_PLANE

/obj/structure/stairs/slopes/north
	dir = NORTH

/obj/structure/stairs/slopes/south
	dir = SOUTH

/obj/structure/stairs/slopes/east
	dir = EAST

/obj/structure/stairs/slopes/west
	dir = WEST

/obj/structure/stairs/alt
	name = "stairs"
	icon = 'icons/obj/stairs.dmi'
	icon_state = "rampdowntop"
	plane = FLOOR_PLANE

/obj/structure/stairs/alt/north
	dir = NORTH

/obj/structure/stairs/alt/south
	dir = SOUTH

/obj/structure/stairs/alt/east
	dir = EAST

/obj/structure/stairs/alt/west
	dir = WEST

/obj/structure/stairs/north/invisible
	invisibility = INVISIBILITY_ABSTRACT

/obj/structure/stairs/south/invisible
	invisibility = INVISIBILITY_ABSTRACT

/obj/structure/stairs/east/invisible
	invisibility = INVISIBILITY_ABSTRACT

/obj/structure/stairs/west/invisible
	invisibility = INVISIBILITY_ABSTRACT

/obj/structure/stairs/Initialize(mapload)
	if(force_open_above)
		force_open_above()
		build_signal_listener()
	update_surrounding()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_EXIT = PROC_REF(on_exit),
	)
	AddElement(/datum/element/connect_loc, loc_connections)
	return ..()

/obj/structure/stairs/Destroy()
	listeningTo = null
	return ..()

/obj/structure/stairs/Move()			//Look this should never happen but...
	. = ..()
	if(force_open_above)
		build_signal_listener()
	update_surrounding()

/obj/structure/stairs/proc/update_surrounding()
	update_icon()
	for(var/i in GLOB.cardinals)
		var/turf/T = get_step(get_turf(src), i)
		var/obj/structure/stairs/S = locate() in T
		if(S)
			S.update_icon()

/obj/structure/stairs/proc/on_exit(datum/source, atom/movable/leaving, direction)
	SIGNAL_HANDLER

	if(leaving == src)
		return //Let's not block ourselves.

	if(!isobserver(leaving) && isTerminator() && direction == dir)
		INVOKE_ASYNC(src, PROC_REF(stair_ascend), leaving)
		leaving.Bump(src)
		return COMPONENT_ATOM_BLOCK_EXIT

/* // seeing if removing this will let buggies work, the cost is that stairs will be walkable from all directions
/obj/structure/stairs/Cross(atom/movable/AM)
	if(isTerminator() && (get_dir(src, AM) == dir))
		return FALSE
	return ..()
*/

/obj/structure/stairs/update_icon_state()
	if(isTerminator())
		icon_state = "stairs_t"
	else
		icon_state = "stairs"

/obj/structure/stairs/proc/stair_ascend(atom/movable/AM)
	var/turf/checking = get_step_multiz(get_turf(src), UP)
	if(!istype(checking))
		return
	if(!checking.zPassIn(AM, UP, get_turf(src)))
		return
	var/turf/target = get_step_multiz(get_turf(src), (dir|UP))
	if(istype(target) && !target.can_zFall(AM, null, get_step_multiz(target, DOWN)))			//Don't throw them into a tile that will just dump them back down.
		if(isliving(AM))
			var/mob/living/L = AM
			var/pulling = L.pulling
			if(pulling)
				L.pulling.forceMove(target)
			L.forceMove(target)
			L.start_pulling(pulling)
		else
			AM.forceMove(target)

/obj/structure/stairs/vv_edit_var(var_name, var_value)
	. = ..()
	if(!.)
		return
	if(var_name != NAMEOF(src, force_open_above))
		return
	if(!var_value)
		if(listeningTo)
			UnregisterSignal(listeningTo, COMSIG_TURF_MULTIZ_NEW)
			listeningTo = null
	else
		build_signal_listener()
		force_open_above()

/obj/structure/stairs/proc/build_signal_listener()
	if(listeningTo)
		UnregisterSignal(listeningTo, COMSIG_TURF_MULTIZ_NEW)
	var/turf/open/transparent/openspace/T = get_step_multiz(get_turf(src), UP)
	RegisterSignal(T, COMSIG_TURF_MULTIZ_NEW, PROC_REF(on_multiz_new))
	listeningTo = T

/obj/structure/stairs/proc/force_open_above()
	var/turf/open/transparent/openspace/T = get_step_multiz(get_turf(src), UP)
	if(T && !istype(T))
		T.ChangeTurf(/turf/open/transparent/openspace, flags = CHANGETURF_INHERIT_AIR)

/obj/structure/stairs/proc/on_multiz_new(turf/source, dir)
	//SIGNAL_HANDLER
	SHOULD_NOT_SLEEP(TRUE) //the same thing.

	if(dir == UP)
		var/turf/open/transparent/openspace/T = get_step_multiz(get_turf(src), UP)
		if(T && !istype(T))
			T.ChangeTurf(/turf/open/transparent/openspace, flags = CHANGETURF_INHERIT_AIR)

/obj/structure/stairs/intercept_zImpact(atom/movable/AM, levels = 1)
	. = ..()
	if(isTerminator())
		. |= FALL_INTERCEPTED | FALL_NO_MESSAGE

/obj/structure/stairs/proc/isTerminator()			//If this is the last stair in a chain and should move mobs up
	if(terminator_mode != STAIR_TERMINATOR_AUTOMATIC)
		return (terminator_mode == STAIR_TERMINATOR_YES)
	var/turf/T = get_turf(src)
	if(!T)
		return FALSE
	var/turf/them = get_step(T, dir)
	if(!them)
		return FALSE
	for(var/obj/structure/stairs/S in them)
		if(S.dir == dir)
			return FALSE
	return TRUE

/obj/structure/stairs/slopes/update_icon_state()
	if(isTerminator())
		icon_state = "slopes_t"
	else
		icon_state = "slopes"
