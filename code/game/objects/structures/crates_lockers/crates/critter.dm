/obj/structure/closet/critter
	name = "animal carrier"
	desc = "A crate designed for safe transport of animals. It has an oxygen tank for safe transport in space."
	icon = 'icons/obj/crates.dmi'
	icon_state = "crittercrate"
	horizontal = FALSE
	allow_objects = FALSE
	breakout_time = 600
	material_drop = /obj/item/stack/sheet/mineral/wood
	material_drop_amount = 4
	delivery_icon = "deliverybox"
	var/obj/item/tank/internals/emergency_oxygen/tank
	max_mob_size = MOB_SIZE_LARGE

/obj/structure/closet/critter/New()
	..()
	tank = new

/obj/structure/closet/critter/Destroy()
	var/turf/T = get_turf(src)
	if(tank)
		tank.forceMove(T)
		tank = null

	return ..()

/obj/structure/closet/critter/update_icon_state()
	return

/obj/structure/closet/critter/closet_update_overlays(list/new_overlays)
	. = new_overlays
	if(opened)
		. += "crittercrate_door_open"
	else
		. += "crittercrate_door"
		
/obj/structure/closet/critter/return_air()
	if(tank)
		return tank.air_contents
	else
		return loc.return_air()
