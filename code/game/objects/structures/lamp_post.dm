/obj/structure/lamp_post
	name = "lamp post"
	desc = "A relic of the past that continues to illuminate the darkness."
	icon = 'icons/fallout/objects/96x160_street_decore.dmi'
	icon_state = "nvlamp-singles"

	light_system = MOVABLE_LIGHT
	light_range = 30
	light_color = "#a8a582"
	light_on = FALSE

	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	layer = GASFIRE_LAYER
	anchored = TRUE
	opacity = 0
	density = TRUE

	pixel_x = -32
	var/mutable_appearance/lampunderlay

/obj/structure/lamp_post/tall/singles
	icon_state = "nvlamp-singles"

/obj/structure/lamp_post/tall/doubles
	icon_state = "nvlamp-straight-doubles"

/obj/structure/lamp_post/tall/doubles/bent
	icon_state = "nvlamp-corner-doubles"

/obj/structure/lamp_post/tall/triples
	icon_state = "nvlamp-tripples"

/obj/structure/lamp_post/tall/quadra
	icon_state = "nvlamp-quadra"

/obj/structure/lamp_post/floodlight
	name = "floodlight"
	desc = "A securely fastened floodlight, this one is rigged to turn off during the day to save power."
	icon = 'icons/obj/lighting.dmi'
	icon_state = "floodlight"
	layer = OBJ_LAYER
	pixel_x = 0

/obj/structure/lamp_post/floodlight/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/wrench))
		to_chat(user, "<span class='notice'>You begin to [anchored ? "unwrench" : "wrench"] [src].</span>")
		if(I.use_tool(src, user, 20, volume=50))
			to_chat(user, "<span class='notice'>You successfully [anchored ? "unwrench" : "wrench"] [src].</span>")
			setAnchored(!anchored)
	else
		return ..()

/obj/structure/lamp_post/floodlight/setdressing
	invisibility = SEE_INVISIBLE_MINIMUM
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	density = FALSE
	alpha = 0

/obj/structure/lamp_post/discoball
	name = "disco ball"
	desc = "A securely fastened disco ball, this one is rigged to turn off during the day to save power."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "disco"
	layer = OBJ_LAYER
	pixel_x = 0

/obj/structure/lamp_post/discoball/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/wrench))
		to_chat(user, "<span class='notice'>You begin to [anchored ? "unwrench" : "wrench"] [src].</span>")
		if(I.use_tool(src, user, 20, volume=50))
			to_chat(user, "<span class='notice'>You successfully [anchored ? "unwrench" : "wrench"] [src].</span>")
			setAnchored(!anchored)
	else
		return ..()

/obj/structure/lamp_post/Initialize()
	. = ..()
	GLOB.lamppost += src

/obj/structure/lamp_post/tall/Initialize()
	. = ..()
	GLOB.lamppost += src
	lampunderlay = mutable_appearance(icon, "lampunderlay", LATTICE_LAYER)
	add_overlay(lampunderlay)

/obj/structure/lamp_post/Destroy()
	GLOB.lamppost -= src
	. = ..()

/obj/effect/lamp_post/traffic_light
	name = "traffic light"
	desc = "A relic of the past, associated with sirens of justice and tickets."
	icon = 'icons/fallout/objects/96x160_street_decore.dmi'

	anchored = TRUE
	opacity = 0
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	layer = GASFIRE_LAYER

	pixel_x = -32

/obj/effect/lamp_post/traffic_light/left
	icon_state = "traffic-light-leftside"

/obj/effect/lamp_post/traffic_light/right
	icon_state = "traffic-light-rightside"

/obj/effect/lamp_post/traffic_light/blinking
	icon_state = "traffic-light-south-blinking"
