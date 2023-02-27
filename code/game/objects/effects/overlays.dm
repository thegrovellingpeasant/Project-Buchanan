/obj/effect/overlay
	name = "overlay"

/obj/effect/overlay/singularity_act()
	return

/obj/effect/overlay/singularity_pull()
	return

/obj/effect/overlay/beam//Not actually a projectile, just an effect.
	name="beam"
	icon='icons/effects/beam.dmi'
	icon_state="b_beam"
	var/atom/BeamSource

/obj/effect/overlay/beam/Initialize()
	. = ..()
	QDEL_IN(src, 10)

/obj/effect/overlay/palmtree_r
	name = "palm tree"
	icon = 'icons/misc/beach2.dmi'
	icon_state = "palm1"
	density = FALSE
	layer = WALL_OBJ_LAYER
	anchored = TRUE

/obj/effect/overlay/palmtree_l
	name = "palm tree"
	icon = 'icons/misc/beach2.dmi'
	icon_state = "palm2"
	density = FALSE
	layer = WALL_OBJ_LAYER
	anchored = TRUE

/obj/effect/overlay/shadow
	name = ""
	icon = 'icons/fallout/turfs/sidewalk.dmi'
	icon_state = "outermiddle"
	color = "#000000"
	density = FALSE
	layer = FLY_LAYER
	anchored = TRUE
	alpha = 50
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/effect/overlay/catwalk
	name = ""
	icon = 'icons/obj/smooth_structures/catwalk.dmi'
	icon_state = "catwalk"
	color = "#000000"
	density = FALSE
	layer = FLY_LAYER
	anchored = TRUE
	alpha = 20
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/effect/overlay/coconut
	gender = PLURAL
	name = "coconuts"
	icon = 'icons/misc/beach.dmi'
	icon_state = "coconuts"

/obj/effect/overlay/sparkles
	gender = PLURAL
	name = "sparkles"
	icon = 'icons/effects/effects.dmi'
	icon_state = "shieldsparkles"
	anchored = TRUE

/obj/effect/overlay/vis
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	anchored = TRUE
	vis_flags = NONE
	var/unused = 0 //When detected to be unused it gets set to world.time, after a while it gets removed
	var/cache_expiration = 2 MINUTES // overlays which go unused for 2 minutes get cleaned up
