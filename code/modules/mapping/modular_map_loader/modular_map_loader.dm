/obj/modular_map_root
	invisibility = INVISIBILITY_ABSTRACT
	icon = 'icons/obj/device.dmi'
	icon_state = "pinonclose"

	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	anchored = TRUE

	/// Points to a .toml file storing configuration data about the modules associated with this root
	var/config_file = null
	/// Key used to look up the appropriate map paths in the associated .toml file
	var/key = null
	/// Orientation to spawn template
	var/temp_dir = SOUTH

/obj/modular_map_root/Initialize(mapload)
	. = ..()
	INVOKE_ASYNC(src, PROC_REF(load_map))

/// Randonly selects a map file from the TOML config specified in config_file, loads it, then deletes itself.
/obj/modular_map_root/proc/load_map()
	var/turf/spawn_area = get_turf(src)

	var/datum/map_template/map_module/map = new()

	if(!config_file)
		return

	if(!key)
		return

	var/config = rustg_read_toml_file(config_file)
	var/directory = config["directory"]
	var/current_pick = pick(config["buildings"][key]["modules"])
	var/mapfile = directory + current_pick


	map.load(spawn_area, FALSE, mapfile, temp_dir, is_above = FALSE)

	mapfile = directory + "/upper/" + current_pick
	if(mapfile)
		map.load(spawn_area, FALSE, mapfile, temp_dir, is_above = TRUE)

	qdel(src, force=TRUE)


/datum/map_template/map_module
	name = "Base Map Module Template"

	var/x_offset = 0
	var/y_offset = 0

/datum/map_template/map_module/load(turf/T, centered = FALSE, mapfile = null, orientation, annihilate = default_annihilate, force_cache = FALSE, rotate_placement_to_orientation = TRUE, is_above = is_above, z = 4)

	if(!mapfile)
		return

	mappath = mapfile

	preload_size(mappath, orientation) // We need to run this here as the map path has been null until now

	T = locate(T.x - x_offset, T.y - y_offset, z)

	if(is_above)
		z++

	var/old_T = T
	if(centered)
		T = locate(T.x - round(((orientation & (NORTH|SOUTH))? width : height) / 2) , T.y - round(((orientation & (NORTH|SOUTH)) ? height : width) / 2) , z) // %180 catches East/West (90,270) rotations on true, North/South (0,180) rotations on false
	else if(rotate_placement_to_orientation && (orientation != SOUTH))
		var/newx = T.x
		var/newy = T.y
		if(orientation == NORTH)
			newx -= width
			newy -= height - 1
		else if(orientation == WEST)
			newy -= width
		else if(orientation == EAST)
			newx -= height - 1
		// eh let's not silently fail.
		if(!ISINRANGE(newx, 1, world.maxx) || !ISINRANGE(newy, 1, world.maxy))
			stack_trace("Warning: Rotation placed a map template load spot ([COORD(T)]) out of bounds of the game world. Clamping to world borders, this might cause issues.")
		T = locate(clamp(newx, 1, world.maxx), clamp(newy, 1, world.maxy), z)
	if(!T)
		return
	if(T.x+width-1 > world.maxx)
		return
	if(T.y+height-1 > world.maxy)
		return

	var/list/border = block(locate(max(T.x - 1, 1), max(T.y - 1, 1), z),
		locate(min(T.x + width + 1, world.maxx), min(T.y + height + 1, world.maxy), z))
	for(var/i in border)
		var/turf/turf_to_disable = i
		turf_to_disable.atmos_adjacent_turfs?.Cut()

	if(annihilate == MAP_TEMPLATE_ANNIHILATE_PRELOAD)
		annihilate_bounds(old_T, centered, orientation)

	// Accept cached maps, but don't save them automatically - we don't want
	// ruins clogging up memory for the whole round.
	var/is_cached = cached_map
	var/datum/parsed_map/parsed = is_cached || new(file(mappath))
	cached_map = (force_cache || keep_cached_map) ? parsed : is_cached
	if(!parsed.load(T.x, T.y, z, cropMap=TRUE, no_changeturf=(SSatoms.initialized == INITIALIZATION_INSSATOMS), placeOnTop=TRUE, orientation = orientation, annihilate_tiles = (annihilate == MAP_TEMPLATE_ANNIHILATE_LOADING)))
		return
	var/list/bounds = parsed.bounds
	if(!bounds)
		return

	if(!SSmapping.loading_ruins) //Will be done manually during mapping ss init
		repopulate_sorted_areas()

	//initialize things that are normally initialized after map load
	parsed.initTemplateBounds()

	log_game("[name] loaded at [T.x],[T.y],[z]")
	on_map_loaded(z, parsed.bounds)

	return bounds

/datum/map_template/map_module/preload_size(path, orientation, cache)
	. = ..(path, TRUE) // Done this way because we still want to know if someone actualy wanted to cache the map
	if(!cached_map)
		return

	var/list/offset = discover_offset(/obj/modular_map_connector)

	if(orientation == SOUTH)
		x_offset = offset[1] - 1
		y_offset = offset[2] - 1
	if(orientation == NORTH)
		x_offset = offset[1] - 8
		y_offset = offset[2] - 1
	if(orientation == WEST)
		x_offset = offset[1] - 4
		y_offset = offset[2] - 5
	if(orientation == EAST)
		x_offset = offset[1] - 4
		y_offset = offset[2] + 2

	if(!cache)
		cached_map = null

/obj/modular_map_connector
	invisibility = INVISIBILITY_ABSTRACT
	icon = 'icons/obj/device.dmi'
	icon_state = "pinonclose"

	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	anchored = TRUE

//Objects pertaining to Town Modularity

/obj/modular_map_root/town
	config_file = "strings/modular_maps/buildings.toml"

/obj/modular_map_root/town/New(var/location, var/value)
	key = value
	Initialize()

/obj/item/building_door_key
	name = "building key"
	desc = "A small grey key."
	icon = 'icons/fallout/objects/keys.dmi'
	icon_state = "empty_key"
	var/building = "shelter"
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_BELT

/obj/structure/obstacle/old_locked_door/modular_building
	name = "building door"
	resistance_flags = INDESTRUCTIBLE

/obj/structure/obstacle/old_locked_door/modular_building/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/building_door_key))
		var/obj/item/building_door_key/D = I
		new /obj/modular_map_root/town(drop_location(), D.building)
		qdel(I)
		qdel(src)

