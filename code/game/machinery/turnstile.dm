/obj/machinery/turnstile
	name = "turnstile"
	desc = "A mechanical door that permits one-way access and prevents tailgating."
	icon = 'icons/obj/turnstile.dmi'
	icon_state = "turnstile_map"
	density = FALSE
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 50, bomb = 10, bio = 100, rad = 100, fire = 90, acid = 70)
	anchored = TRUE
	use_power = FALSE
	idle_power_usage = 2
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	layer = OPEN_DOOR_LAYER

/obj/machinery/turnstile/Initialize(mapload)
	. = ..()
	icon_state = "turnstile"
	var/static/list/loc_connections = list(
		COMSIG_ATOM_EXIT = PROC_REF(on_exit),
	)

	AddElement(/datum/element/connect_loc, loc_connections)

/obj/machinery/turnstile/CanAtmosPass(turf/T)
	return TRUE

/obj/machinery/turnstile/proc/allowed_access(mob/B)
	if(B.pulledby && ismob(B.pulledby))
		return allowed(B.pulledby) || allowed(B)
	else
		return allowed(B)

/obj/machinery/turnstile/CanPass(atom/movable/AM, border_dir)
	if(istype(AM, /obj/item/projectile))
		return TRUE
	if(ismob(AM))
		var/mob/B = AM
		if(isliving(AM))
			var/mob/living/M = AM

			if(world.time - M.last_bumped <= 5)
				return FALSE
			M.last_bumped = world.time

			var/allowed_access = FALSE
			var/turf/behind = get_step(src, dir)

			if(B in behind.contents)
				allowed_access = allowed_access(B)
			else
				to_chat(usr, span_notice("\the [src] resists your efforts."))
				return FALSE

			if(allowed_access)
				flick("operate", src)
				playsound(src,'sound/items/ratchet.ogg',50,0,3)
				return TRUE
			else
				flick("deny", src)
				playsound(src,'sound/machines/deniedbeep.ogg',50,0,3)
				return FALSE
	if(ispath(AM, /obj/item/))
		return TRUE
	else
		return FALSE

/obj/machinery/turnstile/proc/on_exit(datum/source, atom/movable/leaving, direction)
	SIGNAL_HANDLER

	if(!isliving(leaving))
		return FALSE
	var/mob/living/leaving_mob = leaving
	//can only go in the opposite direction you came in from.
	var/canexit = (direction == REVERSE_DIR(dir))

	leaving_mob.last_bumped = world.time
	if(!canexit)
		if(world.time - leaving_mob.last_bumped <= 5)
			to_chat(usr, span_notice("You find yourself unable to climb over \the [src]."))
		return COMPONENT_ATOM_BLOCK_EXIT
