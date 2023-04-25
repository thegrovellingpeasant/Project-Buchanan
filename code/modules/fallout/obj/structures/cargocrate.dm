/obj/structure/cargocrate
	name = "cargo crate"
	desc = "A rusty cargo crate."
	icon = 'icons/fallout/cargocrate.dmi'
	icon_state = "cargocrate"
	anchored = TRUE
	density = TRUE
	layer = LATTICE_LAYER
	plane = GAME_PLANE
	resistance_flags = INDESTRUCTIBLE
	bound_width = 64
	var/mutable_appearance/crateoverlay

/obj/structure/cargocrate/Initialize()
	. = ..()
	crateoverlay = mutable_appearance(icon, "[icon_state]overlay", ABOVE_ALL_MOB_LAYER, GAME_PLANE)
	add_overlay(crateoverlay)

/obj/structure/cargocrate/dynamic // this is the old style where it randomizes the sprite
	name = "cargo crate"
	var/mutable_appearance/dynamiccrateoverlay

/obj/structure/cargocrate/dynamic/Initialize()
	. = ..()
	icon_state = pick("cargocrate1","cargocrate2","cargocrate3","cargocrate4","cargocrate5")
	dynamiccrateoverlay = mutable_appearance(icon, "[icon_state]overlay", ABOVE_ALL_MOB_LAYER, GAME_PLANE)
	add_overlay(dynamiccrateoverlay)
