//Copy-pasted ash drake code with some changed names here and, to make tweaks to this mob more precise

/mob/living/simple_animal/hostile/megafauna/watcher
	name = "Yperaspistis"
	desc = "Be not afraid."
	health = 2500
	maxHealth = 2500
	spacewalk = TRUE
	attack_verb_continuous = "smites"
	attack_verb_simple = "smite"
	attack_sound = 'sound/magic/demon_attack1.ogg'
	icon = 'icons/fallout/mobs/megafauna/watcher.dmi'
	icon_state = "benotafraid"
	icon_living = "benotafraid"
	icon_dead = "benotafraid"
	speak = list("Be not afraid.")
	friendly_verb_continuous = "watches"
	friendly_verb_simple = "watch"
	faction = list("boss")
	speak_emote = list("sings")
	armour_penetration = 0.4
	melee_damage_lower = 40
	melee_damage_upper = 40
	speed = 0
	move_to_delay = 6
	ranged = 1
	pixel_x = -16
	gender = MALE
	wander = FALSE
	loot = list(/obj/item/melee/powered/ripper/prewar)
	decompose = FALSE
	can_devour = FALSE
	stat_attack = UNCONSCIOUS
	var/swooping = NONE
	var/swoop_cooldown = 0
	var/fire_rain_cooldown = 0
	var/datum/action/small_sprite/smallsprite = new/datum/action/small_sprite/drake()

	footstep_type = FOOTSTEP_MOB_HEAVY

/mob/living/simple_animal/hostile/megafauna/watcher/Initialize()
	smallsprite.Grant(src)
	. = ..()

/mob/living/simple_animal/hostile/megafauna/watcher/BiologicalLife(seconds, times_fired)
	if(!(. = ..()))
		return
	move_to_delay = clamp(round((health/maxHealth) * 10), 3, 6)

/mob/living/simple_animal/hostile/megafauna/watcher/ex_act(severity, target)
	if(severity == 3)
		return
	..()

/mob/living/simple_animal/hostile/megafauna/watcher/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	if(!forced && (swooping & SWOOP_INVULNERABLE))
		return FALSE
	return ..()

/mob/living/simple_animal/hostile/megafauna/watcher/visible_message(message, self_message, blind_message, vision_distance = DEFAULT_MESSAGE_RANGE, list/ignored_mobs, mob/target, target_message, visible_message_flags = NONE)
	if(swooping & SWOOP_INVULNERABLE) //to suppress attack messages without overriding every single proc that could send a message saying we got hit
		return
	return ..()

/mob/living/simple_animal/hostile/megafauna/watcher/AttackingTarget()
	if(!swooping)
		return ..()

/mob/living/simple_animal/hostile/megafauna/watcher/DestroySurroundings()
	if(!swooping)
		..()

/mob/living/simple_animal/hostile/megafauna/watcher/Move()
	if(!swooping)
		if(!stat)
			playsound(src.loc, 'sound/effects/meteorimpact.ogg', 200, 1, 2, 1)
			..()

/mob/living/simple_animal/hostile/megafauna/watcher/Goto(target, delay, minimum_distance)
	if(!swooping)
		..()

/mob/living/simple_animal/hostile/megafauna/watcher/OpenFire()
	if(swooping)
		return
	anger_modifier = clamp(((maxHealth - health)/50),0,20)
	ranged_cooldown = world.time + ranged_cooldown_time

	if(prob(25 + anger_modifier) && !client)
		if(health < maxHealth/2)
			INVOKE_ASYNC(src, PROC_REF(swoop_attack), TRUE, null, 50)
		else
			if(fire_rain_cooldown <= world.time)
				fire_rain(anger_modifier)

	else if(prob(10+anger_modifier) && !client)
		if(health > maxHealth/2)
			INVOKE_ASYNC(src, PROC_REF(swoop_attack))
		else
			INVOKE_ASYNC(src, PROC_REF(triple_swoop))
	else
		fire_walls(anger_modifier)

/mob/living/simple_animal/hostile/megafauna/watcher/proc/fire_rain(anger_modifier)
	if(!target)
		return
	target.visible_message("<span class='boldwarning'>Prepares a barrage of fire!</span>")
	fire_rain_cooldown = world.time + 125
	swooping = 1
	sleep(30 - anger_modifier)
	for(var/turf/turf in range(8,get_turf(target)))
		if(prob(10 + anger_modifier))
			new /obj/effect/temp_visual/target(turf)
	sleep(30 - anger_modifier)
	for(var/turf/turf in range(8,get_turf(target)))
		if(prob(15 + anger_modifier))
			new /obj/effect/temp_visual/target(turf)
	sleep(30 - anger_modifier)
	for(var/turf/turf in range(8,get_turf(target)))
		if(prob(20 + anger_modifier))
			new /obj/effect/temp_visual/target(turf)
	sleep(15)
	swooping = 0

/mob/living/simple_animal/hostile/megafauna/watcher/proc/fire_walls(anger_modifier)
	playsound(get_turf(src),'sound/magic/fireball.ogg', 200, 1)

	for(var/d in GLOB.cardinals)
		INVOKE_ASYNC(src, PROC_REF(fire_wall), d)

	if(health < (maxHealth * 0.8))
		sleep(40 - anger_modifier)
		INVOKE_ASYNC(src, PROC_REF(diagonal_shots))

/mob/living/simple_animal/hostile/megafauna/watcher/proc/fire_wall(dir)
	var/list/hit_things = list(src)
	var/turf/E = get_edge_target_turf(src, dir)
	var/range = 10
	var/turf/previousturf = get_turf(src)
	for(var/turf/J in getline(src,E))
		if(!range || (J != previousturf && (!previousturf.atmos_adjacent_turfs || !previousturf.atmos_adjacent_turfs[J])))
			break
		range--
		new /obj/effect/hotspot(J)
		J.hotspot_expose(DRAKE_FIRE_TEMP, DRAKE_FIRE_EXPOSURE, 1)
		for(var/mob/living/L in J.contents - hit_things)
			if(istype(L, /mob/living/simple_animal/hostile/megafauna/watcher))
				continue
			L.adjustFireLoss(20)
			to_chat(L, "<span class='userdanger'>You're reproved by the Watcher's holy fire!</span>")
			hit_things += L
		previousturf = J
		sleep(1)

/mob/living/simple_animal/hostile/megafauna/watcher/proc/shoot_projectile(turf/marker, set_angle)
	if(!isnum(set_angle) && (!marker || marker == loc))
		return
	var/turf/startloc = get_turf(src)
	var/obj/item/projectile/P = new /obj/item/projectile/magic/aoe/fireball/gecko(startloc)
	P.preparePixelProjectile(marker, startloc)
	P.firer = src
	if(target)
		P.original = target
	P.fire(set_angle)

/mob/living/simple_animal/hostile/megafauna/watcher/proc/diagonal_shots(list/dirs)
	if(!islist(dirs))
		dirs = GLOB.diagonals.Copy()
	playsound(src, 'sound/magic/fireball.ogg', 200, 1, 2)
	for(var/d in dirs)
		var/turf/E = get_step(src, d)
		shoot_projectile(E)

/mob/living/simple_animal/hostile/megafauna/watcher/proc/triple_swoop()
	swoop_attack(swoop_duration = 30)
	swoop_attack(swoop_duration = 20)
	swoop_attack(swoop_duration = 10)

/mob/living/simple_animal/hostile/megafauna/watcher/proc/swoop_attack(fire_rain, atom/movable/manual_target, swoop_duration = 40)
	if(stat || swooping)
		return
	if(manual_target)
		target = manual_target
	if(!target)
		return
	swoop_cooldown = world.time + 200
	stop_automated_movement = TRUE
	swooping |= SWOOP_DAMAGEABLE
	density = FALSE
	icon_state = "shadow"
	visible_message("<span class='boldwarning'>[src] soars high!</span>")

	var/negative
	var/initial_x = x
	if(target.x < initial_x)
		negative = TRUE
	else if(target.x > initial_x)
		negative = FALSE
	else if(target.x == initial_x)
		negative = prob(50)
	var/obj/effect/temp_visual/watcher_flight/F = new /obj/effect/temp_visual/watcher_flight(loc, negative)

	negative = !negative

	var/oldtransform = transform
	alpha = 255
	animate(src, alpha = 204, transform = matrix()*0.9, time = 3, easing = BOUNCE_EASING)
	for(var/i in 1 to 3)
		sleep(1)
		if(QDELETED(src) || stat == DEAD) //we got hit and died, rip us
			qdel(F)
			if(stat == DEAD)
				swooping &= ~SWOOP_DAMAGEABLE
				animate(src, alpha = 255, transform = oldtransform, time = 0, flags = ANIMATION_END_NOW) //reset immediately
			return
	animate(src, alpha = 100, transform = matrix()*0.7, time = 7)
	swooping |= SWOOP_INVULNERABLE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	sleep(7)
	var/list/flame_hit = list()
	while(swoop_duration > 0)
		if(!target && !FindTarget())
			break //we lost our target while chasing it down and couldn't get a new one
		if(swoop_duration < 7)
			fire_rain = FALSE //stop raining fire near the end of the swoop
		if(loc == get_turf(target))
			if(!fire_rain)
				break //we're not spewing fire at our target, slam they
			if(isliving(target))
				var/mob/living/L = target
				if(L.stat == DEAD)
					break //target is dead and we're on em, slam they
		if(fire_rain)
			new /obj/effect/temp_visual/target(loc, flame_hit)
		forceMove(get_step(src, get_dir(src, target)))
		if(loc == get_turf(target))
			if(!fire_rain)
				break
			if(isliving(target))
				var/mob/living/L = target
				if(L.stat == DEAD)
					break
		var/swoop_speed = 1.5
		swoop_duration -= swoop_speed
		sleep(swoop_speed)

	//ensure swoop direction continuity.
	if(negative)
		if(ISINRANGE(x, initial_x + 1, initial_x + DRAKE_SWOOP_DIRECTION_CHANGE_RANGE))
			negative = FALSE
	else
		if(ISINRANGE(x, initial_x - DRAKE_SWOOP_DIRECTION_CHANGE_RANGE, initial_x - 1))
			negative = TRUE
	new /obj/effect/temp_visual/watcher_flight/end(loc, negative)
	new /obj/effect/temp_visual/watcher_swoop(loc)
	animate(src, alpha = 255, transform = oldtransform, time = 5)
	sleep(5)
	swooping &= ~SWOOP_INVULNERABLE
	mouse_opacity = initial(mouse_opacity)
	icon_state = "mega_gekko"
	playsound(loc, 'sound/effects/meteorimpact.ogg', 200, 1)
	for(var/mob/living/L in orange(1, src))
		if(L.stat)
			visible_message("<span class='warning'>[src] slams down on [L], crushing [L.p_them()]!</span>")
		else
			L.adjustBruteLoss(75)
			if(L && !QDELETED(L)) // Some mobs are deleted on death
				var/throw_dir = get_dir(src, L)
				if(L.loc == loc)
					throw_dir = pick(GLOB.alldirs)
				var/throwtarget = get_edge_target_turf(src, throw_dir)
				L.throw_at(throwtarget, 3)
				visible_message("<span class='warning'>[L] is thrown clear of [src]!</span>")

	for(var/mob/M in range(7, src))
		shake_camera(M, 15, 1)

	density = TRUE
	sleep(1)
	swooping &= ~SWOOP_DAMAGEABLE
	SetRecoveryTime(MEGAFAUNA_DEFAULT_RECOVERY_TIME)

/mob/living/simple_animal/hostile/megafauna/watcher/AltClickOn(atom/movable/A)
	if(!istype(A))
		AltClickNoInteract(src, A)
		return
	if(swoop_cooldown >= world.time)
		to_chat(src, "<span class='warning'>You need to wait 20 seconds between jump attacks!</span>")
		return
	swoop_attack(TRUE, A, 25)


/obj/effect/temp_visual/fireball
	icon = 'icons/obj/wizard.dmi'
	icon_state = "fireball"
	name = "fireball"
	desc = "Get out of the way!"
	layer = FLY_LAYER
	randomdir = FALSE
	duration = 9
	pixel_z = DRAKE_SWOOP_HEIGHT

/obj/effect/temp_visual/fireball/Initialize()
	. = ..()
	animate(src, pixel_z = 0, time = duration)

/obj/effect/temp_visual/target
	icon = 'icons/mob/actions/actions_items.dmi'
	icon_state = "sniper_zoom"
	layer = BELOW_MOB_LAYER
	light_range = 2
	duration = 9

/obj/effect/temp_visual/target/ex_act()
	return

/obj/effect/temp_visual/target/Initialize(mapload, list/flame_hit)
	. = ..()
	INVOKE_ASYNC(src, PROC_REF(watcher_fall), flame_hit)

/obj/effect/temp_visual/target/proc/watcher_fall(list/flame_hit)
	var/turf/T = get_turf(src)
	playsound(T,'sound/magic/fleshtostone.ogg', 80, 1)
	new /obj/effect/temp_visual/fireball(T)
	sleep(duration)
	if(ismineralturf(T))
		var/turf/closed/mineral/M = T
		M.gets_drilled()
	playsound(T, "explosion", 80, 1)
	new /obj/effect/hotspot(T)
	T.hotspot_expose(700, 50, 1)
	for(var/mob/living/L in T.contents)
		if(istype(L, /mob/living/simple_animal/hostile/megafauna/watcher))
			continue
		if(islist(flame_hit) && !flame_hit[L])
			L.adjustFireLoss(40)
			to_chat(L, "<span class='userdanger'>You're purified by the Watcher's rehabilitative fire!</span>")
			flame_hit[L] = TRUE
		else
			L.adjustFireLoss(10) //if we've already hit them, do way less damage

/obj/effect/temp_visual/watcher_swoop
	name = "certain death"
	desc = "Don't just stand there, move!"
	icon = 'icons/effects/96x96.dmi'
	icon_state = "landing"
	layer = BELOW_MOB_LAYER
	pixel_x = -32
	pixel_y = -32
	color = "#FF0000"
	duration = 5

/obj/effect/temp_visual/watcher_flight
	icon = 'icons/fallout/mobs/megafauna/64x64megafauna.dmi'
	icon_state = "mega_gekko"
	layer = ABOVE_ALL_MOB_LAYER
	pixel_x = -16
	duration = 10
	randomdir = FALSE

/obj/effect/temp_visual/watcher_flight/Initialize(mapload, negative)
	. = ..()
	INVOKE_ASYNC(src, PROC_REF(flight), negative)

/obj/effect/temp_visual/watcher_flight/proc/flight(negative)
	if(negative)
		animate(src, pixel_x = -DRAKE_SWOOP_HEIGHT*0.1, pixel_z = DRAKE_SWOOP_HEIGHT*0.15, time = 3, easing = BOUNCE_EASING)
	else
		animate(src, pixel_x = DRAKE_SWOOP_HEIGHT*0.1, pixel_z = DRAKE_SWOOP_HEIGHT*0.15, time = 3, easing = BOUNCE_EASING)
	sleep(3)
	icon_state = "swoop"
	if(negative)
		animate(src, pixel_x = -DRAKE_SWOOP_HEIGHT, pixel_z = DRAKE_SWOOP_HEIGHT, time = 7)
	else
		animate(src, pixel_x = DRAKE_SWOOP_HEIGHT, pixel_z = DRAKE_SWOOP_HEIGHT, time = 7)

/obj/effect/temp_visual/watcher_flight/end
	pixel_x = DRAKE_SWOOP_HEIGHT
	pixel_z = DRAKE_SWOOP_HEIGHT
	duration = 5

/obj/effect/temp_visual/watcher_flight/end/flight(negative)
	if(negative)
		pixel_x = -DRAKE_SWOOP_HEIGHT
		animate(src, pixel_x = -16, pixel_z = 0, time = 5)
	else
		animate(src, pixel_x = -16, pixel_z = 0, time = 5)

/mob/living/simple_animal/hostile/megafauna/watcher/proc/do_death_beep()
    playsound(src, 'sound/creatures/legion_death.ogg', 75, TRUE)
    visible_message(span_warning("The Watcher collapses onto the floor, its' impact shaking the ground [src]!"), span_warning("The Watcher collapses onto the floor, its' impact shaking the ground!"))

/mob/living/simple_animal/hostile/megafauna/watcher/proc/self_destruct()
    explosion(src,5,5,6,6)

/mob/living/simple_animal/hostile/megafauna/watcher/death()
	playsound(src, 'sound/creatures/legion_death_far.ogg', 75, TRUE)
	do_sparks(3, TRUE, src)
	for(var/i in 1 to 3)
		addtimer(CALLBACK(src, PROC_REF(do_death_beep)), i*i SECONDS)
	addtimer(CALLBACK(src, PROC_REF(self_destruct)), 2 SECONDS)
	return ..()
