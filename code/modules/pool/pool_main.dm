/turf/open/pool
	icon = 'icons/turf/pool.dmi'
	name = "poolwater"
	desc = "You're safer here than in the deep."
	icon_state = "pool_tile"
	heat_capacity = INFINITY
	depth = 2
	var/filled = TRUE
	var/next_splash = 0
	var/obj/machinery/pool/controller/controller
	var/obj/effect/overlay/water/watereffect
	//var/obj/effect/overlay/water/top/watertop

/turf/open/pool/Initialize(mapload)
	. = ..()
	update_icon()

/turf/open/pool/Destroy()
	if(controller)
		controller.linked_turfs -= src
		controller = null
	QDEL_NULL(watereffect)
	//QDEL_NULL(watertop)
	return ..()

/turf/open/pool/update_icon()
	. = ..()
	if(!filled)
		name = "drained pool"
		desc = "No diving!"
		depth = 0
		QDEL_NULL(watereffect)
		//QDEL_NULL(watertop)
	else
		name = "water"
		desc = "You're safer here than in the deep."
		depth = 2
		watereffect = new /obj/effect/overlay/water(src)
		//watertop = new /obj/effect/overlay/water/top(src)

/obj/effect/overlay/water
	name = "water"
	icon = 'icons/turf/pool.dmi'
	icon_state = "altunderlay"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = ABOVE_OBJ_LAYER

//obj/effect/overlay/water/top
	//icon_state = "top"

// Mousedrop hook to normal turfs to get out of pools.
/turf/open/MouseDrop_T(atom/from, mob/living/user)
	if(!istype(user))
		return ..()
	// I could make this /open/floor and not have the !istype but ehh - kev
	if(HAS_TRAIT(from, TRAIT_SWIMMING) && isliving(user) && ((user == from) || user.can_reach(from)) && !CHECK_MOBILITY(user, MOBILITY_USE) && !istype(src, /turf/open/pool))
		var/mob/living/L = from
		//The element only exists if you're on water and a living mob, so let's skip those checks.
		var/pre_msg
		var/post_msg
		if(user == from)
			pre_msg = span_notice("[L] is getting out of the pool.")
			post_msg = span_notice("[L] gets out of the pool.")
		else
			pre_msg = span_notice("[L] is being pulled out of the pool by [user].")
			post_msg = span_notice("[user] pulls [L] out of the pool.")
		L.visible_message(pre_msg)
		if(do_mob(user, L, 20))
			L.visible_message(post_msg)
			L.forceMove(src)
	else
		return ..()

// Exit check
/turf/open/pool/Exit(atom/movable/AM, atom/newloc)
	if(!AM.has_gravity(src))
		return ..()
	if(isliving(AM) || isstructure(AM))
		if(AM.throwing)
			return ..()			//WHEEEEEEEEEEE
		if(istype(AM, /obj/structure) && isliving(AM.pulledby))
			return ..()			//people pulling stuff out of pool
		if(!ishuman(AM))
			return ..()			//human weak, monkey (and anyone else) ook ook eek eek strong
		if(isliving(AM) && (locate(/obj/structure/pool/ladder) in src))
			return ..()			//climbing out
		return istype(newloc, /turf/open/pool)
	return ..()

// Exited logic
/turf/open/pool/Exited(atom/A, atom/newLoc)
	. = ..()
	if(isliving(A))
		var/turf/open/pool/P = newLoc
		if(!istype(P) || (P.controller != controller))
			controller?.mobs_in_pool -= A

// Entered logic
/turf/open/pool/Entered(atom/movable/AM, atom/oldloc)
	if(istype(AM, /obj/effect/decal/cleanable))
		var/obj/effect/decal/cleanable/C = AM
		if(prob(C.bloodiness))
			controller.set_bloody(TRUE)
		QDEL_IN(AM, 25)
		animate(AM, alpha = 10, time = 20)
		return ..()
	if(!AM.has_gravity(src))
		return ..()
	if(isliving(AM))
		var/mob/living/victim = AM
		if(!HAS_TRAIT(victim, TRAIT_SWIMMING))		//poor guy not swimming time to dunk them!
			victim.AddElement(/datum/element/swimming)
			controller.mobs_in_pool += victim
			if(locate(/obj/structure/pool/ladder) in src)		//safe climbing
				return
			if(iscarbon(AM))		//FUN TIME!
				var/mob/living/carbon/H = victim
				if(filled)
					if (H.wear_mask && H.wear_mask.flags_cover & MASKCOVERSMOUTH)
						H.visible_message(span_danger("[H] falls in the water!"),
											span_userdanger("You fall in the water!"))
						playsound(src, 'sound/effects/splash.ogg', 60, TRUE, 1)
						H.DefaultCombatKnockdown(20)
						return
					else
						H.DefaultCombatKnockdown(60)
						H.adjustOxyLoss(5)
						H.emote("cough")
						H.visible_message(span_danger("[H] falls in and takes a drink!"),
											span_userdanger("You fall in and swallow some water!"))
						playsound(src, 'sound/effects/splash.ogg', 60, TRUE, 1)
				else if(!H.head || !(H.head.armor.getRating("melee") > 20))
					if(prob(75))
						H.visible_message(span_danger("[H] falls in the drained pool!"),
													span_userdanger("You fall in the drained pool!"))
						H.adjustBruteLoss(7)
						H.DefaultCombatKnockdown(80)
						playsound(src, 'sound/effects/woodhit.ogg', 60, TRUE, 1)
					else
						H.visible_message(span_danger("[H] falls in the drained pool, and cracks his skull!"),
													span_userdanger("You fall in the drained pool, and crack your skull!"))
						H.apply_damage(15, BRUTE, "head")
						H.DefaultCombatKnockdown(200) // This should hurt. And it does.
						playsound(src, 'sound/effects/woodhit.ogg', 60, TRUE, 1)
						playsound(src, 'sound/misc/crack.ogg', 100, TRUE)
				else
					H.visible_message(span_danger("[H] falls in the drained pool, but had an helmet!"),
										span_userdanger("You fall in the drained pool, but you had an helmet!"))
					H.DefaultCombatKnockdown(40)
					playsound(src, 'sound/effects/woodhit.ogg', 60, TRUE, 1)
		else if(filled)
			victim.adjustStaminaLoss(1)
			playsound(src, "water_wade", 20, TRUE)
	return ..()

/turf/open/pool/MouseDrop_T(atom/from, mob/user)
	. = ..()
	if(!isliving(from))
		return
	var/mob/living/victim = from
	if(user.stat || user.lying || !Adjacent(user) || !from.Adjacent(user) || !iscarbon(user) || !victim.has_gravity(src) || HAS_TRAIT(victim, TRAIT_SWIMMING))
		return
	var/victimname = victim == user? "themselves" : "[victim]"
	var/starttext = victim == user? "[user] is descending into [src]." : "[user] is lowering [victim] into [src]."
	user.visible_message(span_notice("[starttext]"))
	if(do_mob(user, victim, 20))
		user.visible_message(span_notice("[user] lowers [victimname] into [src]."))
		victim.AddElement(/datum/element/swimming)		//make sure they have it so they don't fall/whatever
		victim.forceMove(src)

/turf/open/pool/attackby(obj/item/W, mob/living/user)
	if(istype(W, /obj/item/mop) && filled)
		W.reagents.add_reagent(/datum/reagent/water, 5)
		to_chat(user, span_notice("You wet [W] in [src]."))
		playsound(src, 'sound/effects/slosh.ogg', 25, TRUE)
	else
		return ..()

/turf/open/pool/on_attack_hand(mob/living/user, act_intent = user.a_intent, unarmed_attack_flags)
	. = ..()
	if(.)
		return
	if((user.loc != src) && !user.IsStun() && !user.IsKnockdown() && !user.incapacitated() && Adjacent(user) && HAS_TRAIT(user, TRAIT_SWIMMING) && filled && (next_splash < world.time))
		playsound(src, 'sound/effects/watersplash.ogg', 8, TRUE, 1)
		next_splash = world.time + 25
		var/obj/effect/splash/S = new(src)
		animate(S, alpha = 0, time = 8)
		QDEL_IN(S, 10)
		for(var/mob/living/carbon/human/H in src)
			if(!H.wear_mask && (H.stat == CONSCIOUS))
				H.emote("cough")
			H.adjustStaminaLoss(4)

/turf/open/pool/pond
	icon = 'icons/turf/floors.dmi'
	name = "water"
	desc = "You're safer here than in the deep."
	icon_state = "riverwater"
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/pool/ponddark
	icon = 'icons/turf/floors.dmi'
	name = "water"
	desc = "You're safer here than in the deep."
	icon_state = "riverwater"
	sunlight_state = NO_SUNLIGHT

/turf/open/pool/channel
	name = "channel"
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "evaporationpond1"
	sunlight_state = SUNLIGHT_SOURCE
	dir = NORTHWEST

/turf/open/pool/channeldark
	name = "channel"
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "evaporationpond1"
	sunlight_state = NO_SUNLIGHT
	dir = NORTHWEST

/mob/living/proc/poolcheck_submerged()
	if(buckled)
		return 0
	if(locate(/obj/structure/lattice/catwalk) in loc)
		return 0
	var/turf/open/pool/T = loc
	if(istype(T))
		return T.filled
	return 0

/turf/open/pool/Entered(atom/movable/AM, atom/oldloc)
	if(istype(AM, /mob/living/carbon/human))
		var/mob/living/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(oldloc, /turf/open/pool))
			to_chat(L, span_warning("You get drenched in water from entering \the [src]!"))
	if(istype(AM, /mob/living))
		var/mob/living/U = AM
		U.update_water()
		if(U.check_submerged() <= 0)
			return
	if(istype(AM, /obj/vehicle))
		var/obj/vehicle/V = AM
		V.vehicle_update_water()
		if(V.vehicle_check_submerged() <= 0)
			return
	AM.water_act(5)
	..()

/turf/open/pool/Exited(atom/movable/AM, atom/newloc)
	if(istype(AM, /mob/living/carbon/human))
		var/mob/living/carbon/human/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(newloc, /turf/open/pool))
			to_chat(L, span_warning("You climb out of \the [src]."))
	if(istype(AM, /mob/living))
		var/mob/living/U = AM
		U.update_water()
		if(U.check_submerged() <= 0)
			return
	if(istype(AM, /obj/vehicle))
		var/obj/vehicle/V = AM
		V.vehicle_update_water()
		if(V.vehicle_check_submerged() <= 0)
			return
	..()
