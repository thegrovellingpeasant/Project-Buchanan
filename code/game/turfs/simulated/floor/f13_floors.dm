/* Fallout stuff*/
/* Also, a terrain class or something needs to be used as the common parent  for asteroid and outside */
/* lazy Saturday coding */

/*	Planetary atmos makes the gas infinite basicaly, if you're siphoning it, the world will
	just spawn more.
*/

/turf/open/floor/plating/f13 // don't use this for anything, /f13/ is essentially just the new /unsimulated/ but for planets and should probably be phased out entirely everywhere
	gender = PLURAL
	baseturfs = /turf/open/floor/plating/f13
	attachment_holes = FALSE
	planetary_atmos = TRUE

/* so we can't break this */
/turf/open/floor/plating/f13/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/plating/f13/burn_tile()
	return

/turf/open/floor/plating/f13/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return

/turf/open/floor/plating/f13/MakeDry()
	return

/turf/open/floor/plating/f13/outside
	name = "What the fuck mappers? why is this here"
	desc = "If found, scream at the github repo about this"
	icon_state = "wasteland1"
	icon = 'icons/turf/f13desert.dmi'
	sunlight_state = SUNLIGHT_SOURCE

/* Outside turfs get global lighting */
/turf/open/floor/plating/f13/outside/Initialize()
	. = ..()
	flags_2 |= GLOBAL_LIGHT_TURF_2

#define GRASS_SPONTANEOUS 		2
#define GRASS_WEIGHT 			4
#define LUSH_PLANT_SPAWN_LIST list(/obj/structure/flora/grass/wasteland = 10, /obj/structure/flora/wasteplant/wild_broc = 7, /obj/structure/flora/wasteplant/wild_mesquite = 4, /obj/structure/flora/wasteplant/wild_feracactus = 5, /obj/structure/flora/wasteplant/wild_punga = 5, /obj/structure/flora/wasteplant/wild_coyote = 5, /obj/structure/flora/wasteplant/wild_tato = 5, /obj/structure/flora/wasteplant/wild_yucca = 5, /obj/structure/flora/wasteplant/wild_mutfruit = 5, /obj/structure/flora/wasteplant/wild_prickly = 5, /obj/structure/flora/wasteplant/wild_datura = 5, /obj/structure/flora/wasteplant/wild_buffalogourd = 5, /obj/structure/flora/wasteplant/wild_pinyon = 3, /obj/structure/flora/wasteplant/wild_xander = 5, /obj/structure/flora/wasteplant/wild_agave = 5, /obj/structure/flora/tree/joshua = 3, /obj/structure/flora/tree/cactus = 2, /obj/structure/flora/tree/wasteland = 2)
#define DESOLATE_PLANT_SPAWN_LIST list(/obj/structure/flora/grass/wasteland = 1)

/turf/open/floor/plating/f13/outside/desert
	name = "\proper desert"
	desc = "A stretch of desert."
	icon = 'icons/turf/f13desert.dmi'
	icon_state = "wasteland1"

	archdrops = list(/obj/item/stack/ore/glass = list(ARCH_PROB = 100,ARCH_MAXDROP = 5)) //sand
	var/obj/structure/flora/turfPlant = null
	slowdown = 0
	var/dug = FALSE				//FALSE = has not yet been dug, TRUE = has already been dug
	var/pit_sand = 2
	var/storedindex = 0			//amount of stored items
	var/mob/living/gravebody	//is there a body in the pit?
	var/obj/structure/closet/crate/coffin/gravecoffin //or maybe a coffin?
	var/pitcontents = list()
	var/obj/dugpit/mypit
	var/unburylevel = 0

/turf/open/floor/plating/f13/outside/desert/Initialize()
	. = ..()
	icon_state = "wasteland[rand(1,31)]"
	//If no fences, machines (soil patches are machines), etc. try to plant grass
	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()

//Pass PlantForce for admin stuff I guess?
/turf/open/floor/plating/f13/outside/desert/proc/plantGrass(Plantforce = FALSE)
	var/Weight = 0
	var/randPlant = null

	//spontaneously spawn grass
	if(Plantforce || prob(GRASS_SPONTANEOUS))
		randPlant = pickweight(LUSH_PLANT_SPAWN_LIST) //Create a new grass object at this location, and assign var
		turfPlant = new randPlant(src)
		. = TRUE //in case we ever need this to return if we spawned
		return .

	//loop through neighbouring desert turfs, if they have grass, then increase weight
	for(var/turf/open/floor/plating/f13/outside/desert/T in RANGE_TURFS(3, src))
		if(T.turfPlant)
			Weight += GRASS_WEIGHT

	//use weight to try to spawn grass
	if(prob(Weight))

		//If surrounded on 5+ sides, pick from lush
		if(Weight == (5 * GRASS_WEIGHT))
			randPlant = pickweight(LUSH_PLANT_SPAWN_LIST)
		else
			randPlant = pickweight(DESOLATE_PLANT_SPAWN_LIST)
		turfPlant = new randPlant(src)
		. = TRUE

//Make sure we delete the plant if we ever change turfs
/turf/open/floor/plating/f13/outside/desert/ChangeTurf(path, new_baseturf, flags)
	if(turfPlant)
		qdel(turfPlant)
	. =  ..()

/turf/open/floor/plating/f13/outside/road
	name = "\proper road"
	desc = "A stretch of road."
	icon = 'icons/turf/f13road.dmi'
	icon_state = "outermiddle"

//GRAVEL INDOORS
/turf/open/floor/plating/f13/inside/gravel
	name = "gravel"
	desc = "Small pebbles, lots of them."
	icon = 'icons/fallout/turfs/ground.dmi'
	icon_state = "gravel"

/turf/open/floor/plating/f13/inside/gravel/edge
	icon_state = "graveledge"

/turf/open/floor/plating/f13/inside/gravel/corner
	icon_state = "gravelcorner"


//GRAVEL OUTDOORS
/turf/open/floor/plating/f13/inside/gravel
	name = "gravel"
	desc = "Small pebbles, lots of them."
	icon = 'icons/fallout/turfs/ground.dmi'
	icon_state = "gravel"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plating/f13/inside/gravel/edge
	icon_state = "graveledge"

/turf/open/floor/plating/f13/inside/gravel/corner
	icon_state = "gravelcorner"


//New standard wood floor for most areas, oak for Legion and pure log cabins only, maple for NCR and mayor only, maybe a diner.

/turf/open/floor/wood/f13
	icon = 'icons/turf/floors.dmi'
	icon_state = "housewood1"

	New()
		..()
		if(icon_state == "housewood1")
			icon_state = "housewood[rand(1,4)]"

/turf/open/floor/wood/f13/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wood/f13/oak
	icon = 'icons/turf/floors.dmi'
	icon_state = "oakfloor1"

	New()
		..()
		if(icon_state == "oakfloor1")
			icon_state = "oakfloor[rand(1,4)]"

/turf/open/floor/wood/f13/housewoodbroken
	icon_state = "housewood1-broken"

/turf/open/floor/wood/f13/housewoodbroken2
	icon_state = "housewood2-broken"

/turf/open/floor/wood/f13/housewoodbroken3
	icon_state = "housewood3-broken"

/turf/open/floor/wood/f13/housewoodbroken4
	icon_state = "housewood4-broken"

/turf/open/floor/wood/f13/oakbroken
	icon_state = "oakfloor1-broken"

/turf/open/floor/wood/f13/oakbroken2
	icon_state = "oakfloor2-broken"

/turf/open/floor/wood/f13/oakbroken3
	icon_state = "oakfloor3-broken"

/turf/open/floor/wood/f13/oakbroken4
	icon_state = "oakfloor4-broken"

/turf/open/floor/wood/f13/oakbase
	icon_state = "housebase"

/turf/open/floor/wood/f13/oak/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wood/f13/housewoodbroken/lit
	icon_state = "housewood1-broken"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wood/f13/housewoodbroken2/lit
	icon_state = "housewood2-broken"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wood/f13/housewoodbroken3/lit
	icon_state = "housewood3-broken"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wood/f13/housewoodbroken4/lit
	icon_state = "housewood4-broken"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wood/f13/oakbroken/lit
	icon_state = "oakfloor1-broken"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wood/f13/oakbroken2/lit
	icon_state = "oakfloor2-broken"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wood/f13/oakbroken3/lit
	icon_state = "oakfloor3-broken"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wood/f13/oakbroken4/lit
	icon_state = "oakfloor4-broken"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wood/f13/oakbase/lit
	icon_state = "housebase"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wood/f13/maple
	icon_state = "maplefloor1"

/turf/open/floor/wood/f13/maple/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE	

/turf/open/floor/wood/f13/carpet
	icon_state = "carpet"

/turf/open/floor/wood/f13/carpet/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wood/f13/old
	name = "wood planks"
	desc = "Rotting wooden flooring."

/turf/open/floor/wood/f13/old/ruinedcornerendbr	//WHAT THE FUCK IS THIS
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandcornerbr"

/turf/open/floor/wood/f13/old/ruinedcornerendbl
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandcornerbl"

/turf/open/floor/wood/f13/old/ruinedcornerendtr
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandcornertr"

/turf/open/floor/wood/f13/old/ruinedcornerendtl
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandcornertl"

/turf/open/floor/wood/f13/old/ruinedcornerbr
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandmorecornerbr"

/turf/open/floor/wood/f13/old/ruinedcornerbl
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandmorecornerbl"

/turf/open/floor/wood/f13/old/ruinedcornertr
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandmorecornertr"

/turf/open/floor/wood/f13/old/ruinedcornertl
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandmorecornertl"

/turf/open/floor/wood/f13/old/ruinedstraightsouth
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandsouth"

/turf/open/floor/wood/f13/old/ruinedstraightnorth
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandnorth"

/turf/open/floor/wood/f13/old/ruinedstraighteast
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandeast"

/turf/open/floor/wood/f13/old/ruinedstraightwest
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandwest"

/turf/open/floor/wood/f13/reno
	name = "wood planks"
	desc = "Rotting wooden flooring."
	icon = 'icons/fallout/turfs/reno.dmi'
	sunlight_state = TRUE

/turf/open/floor/wood/f13/reno/ruinedcornerendbr	//WHAT THE FUCK IS THIS
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandcornerbr"

/turf/open/floor/wood/f13/reno/ruinedcornerendbl
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandcornerbl"

/turf/open/floor/wood/f13/reno/ruinedcornerendtr
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandcornertr"

/turf/open/floor/wood/f13/reno/ruinedcornerendtl
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandcornertl"

/turf/open/floor/wood/f13/reno/ruinedcornerbr
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandmorecornerbr"

/turf/open/floor/wood/f13/reno/ruinedcornerbl
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandmorecornerbl"

/turf/open/floor/wood/f13/reno/ruinedcornertr
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandmorecornertr"

/turf/open/floor/wood/f13/reno/ruinedcornertl
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandmorecornertl"

/turf/open/floor/wood/f13/reno/ruinedstraightsouth
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandsouth"

/turf/open/floor/wood/f13/reno/ruinedstraightnorth
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandnorth"

/turf/open/floor/wood/f13/reno/ruinedstraighteast
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandeast"

/turf/open/floor/wood/f13/reno/ruinedstraightwest
	name = "wood planks"
	desc = "Rotting wooden flooring, with a mix of dirt."
	icon_state = "housewastelandwest"

/turf/open/floor/wood/f13/stage_tl
	icon_state = "housewood_stage_top_left"
/turf/open/floor/wood/f13/stage_t
	icon_state = "housewood_stage_top"
/turf/open/floor/wood/f13/stage_l
	icon_state = "housewood_stage_left"
/turf/open/floor/wood/f13/stage_bl
	icon_state = "housewood_stage_bottom_left"
/turf/open/floor/wood/f13/stage_b
	icon_state = "housewood_stage_bottom"
/turf/open/floor/wood/f13/stage_tr
	icon_state = "housewood_stage_top_right"
/turf/open/floor/wood/f13/stage_r
	icon_state = "housewood_stage_right"
/turf/open/floor/wood/f13/stage_br
	icon_state = "housewood_stage_bottom_right"

//WOOD FLOOR FOR BRIDGES ETC, OUTDOORS
/turf/open/floor/wood/f13/stage_b/outdoors
	sunlight_state = SUNLIGHT_SOURCE

#define SHROOM_SPAWN	1

/turf/open/floor/plating/f13/inside/mountain
	name = "mountain"
	desc = "Damp cave flooring."
	icon = 'icons/turf/f13floors2.dmi'
	icon_state = "mountain0"
	var/obj/structure/flora/turfPlant = null

/turf/open/floor/plating/f13/inside/mountain/Initialize()
	. = ..()
	icon_state = "mountain[rand(0,10)]"
	//If no fences, machines, etc. try to plant mushrooms
	if(!(\
			(locate(/obj/structure) in src) || \
			(locate(/obj/machinery) in src) ))
		plantShrooms()

/turf/open/floor/plating/f13/inside/mountain/proc/plantShrooms()
	if(prob(SHROOM_SPAWN))
		turfPlant = new /obj/structure/flora/wasteplant/wild_fungus(src)
		. = TRUE //in case we ever need this to return if we spawned
		return.

/turf/open/floor/plasteel/f13/vault_floor
	name = "vault floor"
	icon = 'icons/turf/f13floors2.dmi'
	icon_state = "vault_floor"
	planetary_atmos = FALSE // They're _inside_ a vault.

/turf/open/floor/plasteel/f13/vault_floor/plating
	icon_state = "plating"

/turf/open/floor/plasteel/f13/vault_floor/plating/curb
	name = "floor"
	icon_state = "platingcurb"

/turf/open/floor/plasteel/f13/vault_floor/plating/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/vrnothing
	name = "nothing"
	icon = 'icons/turf/space.dmi'
	icon_state = "black"

/turf/open/floor/plasteel/f13/vault_floor/floor
	icon_state = "floor"

/turf/open/floor/plasteel/f13/vault_floor/floor/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/floor/floorsolid
	icon_state = "floorsolid"

	/* DARK TILES */

/turf/open/floor/plasteel/f13/vault_floor/dark
	icon_state = "dark"

/turf/open/floor/plasteel/f13/vault_floor/dark/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/dark/darksolid
	icon_state = "darksolid"

/turf/open/floor/plasteel/f13/vault_floor/dark/darksolid/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/darkrusty
	icon = 'icons/fallout/turfs/floors.dmi'
	icon_state = "floorrustysolid"

/turf/open/floor/plasteel/f13/vault_floor/darkrusty/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/darkerrusty/
	name = "floor"
	icon = 'icons/fallout/turfs/floors.dmi'
	icon_state = "floorrustysolid"
	color = "#818181"

/turf/open/floor/plasteel/f13/vault_floor/darkerrusty/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE

	/* WHITE TILES */

/turf/open/floor/plasteel/f13/vault_floor/white
	icon_state = "white"

/turf/open/floor/plasteel/f13/vault_floor/white/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/white/whitesolid
	icon_state = "whitesolid"

	/* RED TILES */

/turf/open/floor/plasteel/f13/vault_floor/red
	icon_state = "redfull"

/turf/open/floor/plasteel/f13/vault_floor/red/whiteredfull
	icon_state = "whiteredfull"

/turf/open/floor/plasteel/f13/vault_floor/red/side
	icon_state = "red"

/turf/open/floor/plasteel/f13/vault_floor/red/corner
	icon_state = "redcorner"

/turf/open/floor/plasteel/f13/vault_floor/red/redchess
	icon_state = "redchess"

/turf/open/floor/plasteel/f13/vault_floor/red/redchess/redchess2
	icon_state = "redchess2"

/turf/open/floor/plasteel/f13/vault_floor/red/white/side
	icon_state = "whitered"

/turf/open/floor/plasteel/f13/vault_floor/red/white/corner
	icon_state = "whiteredcorner"

/turf/open/floor/plasteel/f13/vault_floor/red/white/whiteredchess
	icon_state = "whiteredchess"

/turf/open/floor/plasteel/f13/vault_floor/red/white/whiteredchess/whiteredchess2
	icon_state = "whiteredchess2"

/turf/open/floor/plasteel/f13/vault_floor/red/lit
	icon_state = "redfull"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/red/whiteredfull/lit
	icon_state = "whiteredfull"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/red/side/lit
	icon_state = "red"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/red/corner/lit
	icon_state = "redcorner"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/red/redchess/lit
	icon_state = "redchess"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/red/redchess/redchess2/lit
	icon_state = "redchess2"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/red/white/side/lit
	icon_state = "whitered"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/red/white/corner/lit
	icon_state = "whiteredcorner"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/red/white/whiteredchess/lit
	icon_state = "whiteredchess"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/red/white/whiteredchess/whiteredchess2/lit
	icon_state = "whiteredchess2"
	sunlight_state = SUNLIGHT_SOURCE

	/* BLUE TILES */

/turf/open/floor/plasteel/f13/vault_floor/blue
	icon_state = "bluefull"

/turf/open/floor/plasteel/f13/vault_floor/blue/whitebluefull
	icon_state = "whitebluefull"

/turf/open/floor/plasteel/f13/vault_floor/blue/side
	icon_state = "blue"

/turf/open/floor/plasteel/f13/vault_floor/blue/corner
	icon_state = "bluecorner"

/turf/open/floor/plasteel/f13/vault_floor/blue/bluechess
	icon_state = "bluechess"

/turf/open/floor/plasteel/f13/vault_floor/blue/bluechess/bluechess2
	icon_state = "bluechess2"

/turf/open/floor/plasteel/f13/vault_floor/blue/white/side
	icon_state = "whiteblue"

/turf/open/floor/plasteel/f13/vault_floor/blue/white/corner
	icon_state = "whitebluecorner"

/turf/open/floor/plasteel/f13/vault_floor/blue/white/whitebluechess
	icon_state = "whitebluechess"

/turf/open/floor/plasteel/f13/vault_floor/blue/white/whitebluechess/whitebluechess2
	icon_state = "whitebluechess2"

/turf/open/floor/plasteel/f13/vault_floor/blue/lit
	icon_state = "bluedirtyfull"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/blue/whitebluefull/lit
	icon_state = "bluedirtysolid"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/blue/side/lit
	icon_state = "bluedirty"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/blue/corner/lit
	icon_state = "bluedirtycorner"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/blue/bluechess/lit
	icon_state = "bluedirtychess"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/blue/bluechess/bluechess2/lit
	icon_state = "bluedirtychess2"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/blue/white/side/lit
	icon_state = "whitebluedirty"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/blue/white/corner/lit
	icon_state = "whitebluedirtycorner"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/blue/white/whitebluechess/lit
	icon_state = "whitebluedirtychess"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/blue/white/whitebluechess/whitebluechess2/lit
	icon_state = "whitebluedirtychess2"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/blueredchess
	icon_state = "redbluefull"

/turf/open/floor/plasteel/f13/vault_floor/blueredchess/lit
	icon_state = "redbluefull"
	sunlight_state = SUNLIGHT_SOURCE

	/* GREEN TILES */

/turf/open/floor/plasteel/f13/vault_floor/green
	icon_state = "greendirtyfull"

/turf/open/floor/plasteel/f13/vault_floor/green/whitegreenfull
	icon_state = "greendirtysolid"

/turf/open/floor/plasteel/f13/vault_floor/green/side
	icon_state = "greendirty"

/turf/open/floor/plasteel/f13/vault_floor/green/corner
	icon_state = "greendirtycorner"

/turf/open/floor/plasteel/f13/vault_floor/green/greenchess
	icon_state = "greendirtychess"

/turf/open/floor/plasteel/f13/vault_floor/green/greenchess/greenchess2
	icon_state = "greendirtychess2"

/turf/open/floor/plasteel/f13/vault_floor/green/white/side
	icon_state = "whitegreendirty"

/turf/open/floor/plasteel/f13/vault_floor/green/white/corner
	icon_state = "whitegreendirtycorner"

/turf/open/floor/plasteel/f13/vault_floor/green/white/whitegreenchess
	icon_state = "whitegreenchessdirty"

/turf/open/floor/plasteel/f13/vault_floor/green/white/whitegreenchess/whitegreenchess2
	icon_state = "whitegreendirtychess2"

/turf/open/floor/plasteel/f13/vault_floor/green/lit
	icon_state = "greendirtyfull"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/green/whitegreenfull/lit
	icon_state = "greendirtysolid"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/green/side/lit
	icon_state = "greendirty"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/green/corner/lit
	icon_state = "greendirtycorner"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/green/greenchess/lit
	icon_state = "greendirtychess"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/green/greenchess/greenchess2/lit
	icon_state = "greendirtychess2"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/green/white/side/lit
	icon_state = "whitegreendirty"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/green/white/corner/lit
	icon_state = "whitegreencorner"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/green/white/whitegreenchess/lit
	icon_state = "whitegreenchessdirty"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/green/white/whitegreenchess/whitegreenchess2/lit
	icon_state = "whitegreendirtychess2"
	sunlight_state = SUNLIGHT_SOURCE

	/* YELLOW TILES */

/turf/open/floor/plasteel/f13/vault_floor/yellow
	icon_state = "yellowfull"

/turf/open/floor/plasteel/f13/vault_floor/yellow/whiteyellowfull
	icon_state = "whiteyellowfull"

/turf/open/floor/plasteel/f13/vault_floor/yellow/side
	icon_state = "yellow"

/turf/open/floor/plasteel/f13/vault_floor/yellow/corner
	icon_state = "yellowcorner"

/turf/open/floor/plasteel/f13/vault_floor/yellow/yellowchess
	icon_state = "yellowchess"

/turf/open/floor/plasteel/f13/vault_floor/yellow/yellowchess/yellowchess2
	icon_state = "yellowchess2"

/turf/open/floor/plasteel/f13/vault_floor/yellow/white/side
	icon_state = "whiteyellow"

/turf/open/floor/plasteel/f13/vault_floor/yellow/white/corner
	icon_state = "whiteyellowcorner"

/turf/open/floor/plasteel/f13/vault_floor/yellow/white/whiteyellowchess
	icon_state = "whiteyellowchess"

/turf/open/floor/plasteel/f13/vault_floor/yellow/white/whiteyellowchess/whiteyellowchess2
	icon_state = "whiteyellowchess2"

/turf/open/floor/plasteel/f13/vault_floor/yellow/lit
	icon_state = "yellowdirtyfull"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/yellow/whiteyellowfull/lit
	icon_state = "whiteyellowdirtyfull"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/yellow/side/lit
	icon_state = "yellowdirty"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/yellow/corner/lit
	icon_state = "yellowdirtycorner"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/yellow/yellowchess/lit
	icon_state = "yellowdirtychess"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/yellow/yellowchess/yellowchess2/lit
	icon_state = "yellowdirtychess2"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/yellow/white/side/lit
	icon_state = "whiteyellowdirty"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/yellow/white/corner/lit
	icon_state = "whiteyellowdirtycorner"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/yellow/white/whiteyellowchess/lit
	icon_state = "whiteyellowdirtychess"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/yellow/white/whiteyellowchess/whiteyellowchess2/lit
	icon_state = "whiteyellowdirtychess2"
	sunlight_state = SUNLIGHT_SOURCE

	/* PURPLE TILES */

/turf/open/floor/plasteel/f13/vault_floor/purple
	icon_state = "purplefull"

/turf/open/floor/plasteel/f13/vault_floor/purple/whitepurplefull
	icon_state = "purpledirtysolid"

/turf/open/floor/plasteel/f13/vault_floor/purple/side
	icon_state = "purple"

/turf/open/floor/plasteel/f13/vault_floor/purple/corner
	icon_state = "purplecorner"

/turf/open/floor/plasteel/f13/vault_floor/purple/purplechess
	icon_state = "purplechess"

/turf/open/floor/plasteel/f13/vault_floor/purple/purplechess/purplechess2
	icon_state = "purplechess2"

/turf/open/floor/plasteel/f13/vault_floor/purple/white/side
	icon_state = "whitepurple"

/turf/open/floor/plasteel/f13/vault_floor/purple/white/corner
	icon_state = "whitepurplecorner"

/turf/open/floor/plasteel/f13/vault_floor/purple/white/whitepurplechess
	icon_state = "whitepurplechess"

/turf/open/floor/plasteel/f13/vault_floor/purple/white/whitepurplechess/whitepurplechess2
	icon_state = "whitepurplechess2"

/turf/open/floor/plasteel/f13/vault_floor/purple/lit
	icon_state = "purpledirtyfull"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/purple/whitepurplefull/lit
	icon_state = "purpledirtysolid"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/purple/side/lit
	icon_state = "purpledirty"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/purple/corner/lit
	icon_state = "purpledirtycorner"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/purple/purplechess/lit
	icon_state = "purpledirtychess"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/purple/purplechess/purplechess2/lit
	icon_state = "purpledirtychess2"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/purple/white/side/lit
	icon_state = "whitepurpledirty"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/purple/white/corner/lit
	icon_state = "whitepurpledirtycorner"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/purple/white/whitepurplechess/lit
	icon_state = "whitepurpledirtychess"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/purple/white/whitepurplechess/whitepurplechess2/lit
	icon_state = "whitepurpledirtychess2"
	sunlight_state = SUNLIGHT_SOURCE

	/* neutral TILES */

/turf/open/floor/plasteel/f13/vault_floor/neutral
	icon_state = "neutralfull2"

/turf/open/floor/plasteel/f13/vault_floor/neutral/neutralsolid
	icon_state = "neutralsolid"

/turf/open/floor/plasteel/f13/vault_floor/neutral/side
	icon_state = "neutral"

/turf/open/floor/plasteel/f13/vault_floor/neutral/corner
	icon_state = "neutralcorner"

/turf/open/floor/plasteel/f13/vault_floor/neutral/neutralchess
	icon_state = "neutralchess"

/turf/open/floor/plasteel/f13/vault_floor/neutral/neutralchess/neutralchess2
	icon_state = "neutralchess2"

/turf/open/floor/plasteel/f13/vault_floor/neutral/white/side
	icon_state = "whiteneutral"

/turf/open/floor/plasteel/f13/vault_floor/neutral/white/corner
	icon_state = "whiteneutralcorner"

/turf/open/floor/plasteel/f13/vault_floor/neutral/white/whitepurplechess
	icon_state = "whitepurplechess"

/turf/open/floor/plasteel/f13/vault_floor/neutral/white/whitepurplechess/whitepurplechess2
	icon_state = "whitepurplechess2"

	/* MISC TILES */

/turf/open/floor/plasteel/f13/vault_floor/misc/bar
	icon_state = "bar"

/turf/open/floor/plasteel/f13/vault_floor/misc/bar/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/misc/cafeteria
	icon_state = "cafeteria"

/turf/open/floor/plasteel/f13/vault_floor/misc/cafeteria/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/misc/cmo
	icon_state = "cmo"

/turf/open/floor/plasteel/f13/vault_floor/misc/cmo/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/misc/freezer
	icon_state = "freezerfloor"

/turf/open/floor/plasteel/f13/vault_floor/misc/freezer/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/misc/rarewhite
	icon_state = "rarewhite"

/turf/open/floor/plasteel/f13/vault_floor/misc/rarewhite/lit
	name = "floor"
	icon_state = "rarewhite"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/misc/rarerwhite
	icon_state = "rarerwhite"

/turf/open/floor/plasteel/f13/vault_floor/misc/rarerwhite/lit
	name = "floor"
	icon_state = "rarerwhite"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/misc/rarewhite/rarecyan
	icon_state = "rarecyan"

/turf/open/floor/plasteel/f13/vault_floor/misc/rarewhite/side
	icon_state = "rare"

/turf/open/floor/plasteel/f13/vault_floor/misc/rarewhite/corner
	icon_state = "rarecorner"

/turf/open/floor/plasteel/f13/vault_floor/misc/recharge
	icon_state = "recharge"

/turf/open/floor/plasteel/f13/vault_floor/misc/plaque
	icon_state = "plaque"

/turf/open/floor/plasteel/f13/vault_floor/misc/vaultrust
	icon_state = "vaultrust"

/turf/open/floor/plasteel/f13/vault_floor/misc/vaultrust/lit
	name = "floor"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/misc/reebe
	name = "carpet"
	icon = 'icons/turf/floors.dmi'
	icon_state = "reebe"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/plasteel/f13/vault_floor/misc/vault1
	icon_state = "vault1"

/turf/open/floor/plasteel/f13/vault_floor/misc/vault1/lit
	icon_state = "vault1"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/circuit/f13_blue
	icon = 'icons/turf/f13floors2.dmi'
	icon_state = "bcircuit2"
	icon_normal = "bcircuit2"

/turf/open/floor/circuit/f13_blue/off
	icon_state = "bcircuitoff2"
	on = FALSE

/turf/open/floor/circuit/f13_green
	icon = 'icons/turf/f13floors2.dmi'
	icon_state = "gcircuit2"
	icon_normal = "gcircuit2"
	light_color = LIGHT_COLOR_GREEN
	floor_tile = /obj/item/stack/tile/circuit/green

/turf/open/floor/circuit/f13_green/off
	icon_state = "gcircuitoff2"
	on = FALSE

/turf/open/floor/circuit/f13_red
	icon = 'icons/turf/f13floors2.dmi'
	icon_state = "rcircuit1"
	icon_normal = "rcircuit1"
	light_color = LIGHT_COLOR_FLARE
	floor_tile = /obj/item/stack/tile/circuit/red

/turf/open/floor/circuit/f13_red/off
	icon_state = "rcircuitoff1"
	on = FALSE

/turf/open/water/ice //ice is water, ok?
	name = "ice floor"
	icon = 'icons/turf/ice.dmi'
	icon_state = "ice_floor"
	
// Rooftops, enjoy - Asterix

/turf/open/floor/plating/f13/outside/roof
	name = "\proper rooftop"
	desc = "It's a roof. What more do you want?"
	icon = 'icons/turf/f13rooftop.dmi'
	icon_state = "brick_1"

/turf/open/floor/plating/f13/outside/roof/red
	icon_state = "brick_r"

/turf/open/floor/plating/f13/outside/roof/blue
	icon_state = "brick_b"

/turf/open/floor/plating/f13/outside/roof/metal
	name = "\proper metal roof"
	icon_state = "rust_1"

/turf/open/floor/plating/f13/outside/roof/metal/verdigris
	icon_state = "rust_c"

/turf/open/floor/plating/f13/outside/roof/metal/corrugated
	icon_state = "shingles_1"

/turf/open/floor/plating/f13/outside/roof/metal/corrugated/red
	icon_state = "shingles_r"

/turf/open/floor/plating/f13/outside/roof/metal/corrugated/green
	icon_state = "shingles_g"

/turf/open/floor/plating/f13/outside/roof/wood
	name = "\proper wooden roof"
	icon_state = "wood_1"

/turf/open/floor/plating/f13/outside/roof/wood/old
	icon_state = "wood_2"
