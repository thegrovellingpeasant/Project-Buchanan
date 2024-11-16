/mob/living/simple_animal/hostile/megafauna/mirelurkqueen
	name = "Hivizoh-Tsi Paakate"
	desc = "A towering mirelurk, completely covered in moss and sewage. As the mother of all mirelurks in the region, it is best to tread carefully around this beast, lest you end up as her children's food."
	health = 3500
	maxHealth = 3500
	attack_verb_continuous = "claws"
	attack_verb_simple = "claw"
	attack_sound = 'sound/magic/demon_attack1.ogg'
	icon = 'icons/fallout/mobs/megafauna/64x64megafauna.dmi'
	icon_state = "mega_mirelurk"
	icon_living = "mega_mirelurk"
	icon_dead = "mega_mirelurk_dead"
	friendly_verb_continuous = "stares down"
	friendly_verb_simple = "stare down"
	speak_emote = list("chitters")
	armour_penetration = 0.7
	melee_damage_lower = 45
	melee_damage_upper = 45
	speed = 1
	move_to_delay = 6
	ranged = 1
	faction = list("mirelurk")
	pixel_x = -32
	gender = FEMALE
	wander = FALSE
	can_devour = FALSE
	stat_attack = UNCONSCIOUS
	loot = list(/obj/effect/spawner/lootdrop/f13/weapon/melee/tier5, /obj/effect/spawner/lootdrop/f13/weapon/gun/energy/mid, /obj/effect/spawner/lootdrop/f13/weapon/gun/ballistic/highmid, /obj/item/throwing_star/tomahawk/pvc)
	guaranteed_butcher_results = list(/obj/item/stack/sheet/sinew = 15, /obj/item/stack/sheet/animalhide/chitin/mirelurk = 20)
	decompose = FALSE
	var/grabbing = 0
	var/charging = FALSE
	var/grabbing_cooldown = 0
	var/max_mobs = 4
	var/mob_types = list(/mob/living/simple_animal/hostile/mirelurk, /mob/living/simple_animal/hostile/mirelurk/hunter, /mob/living/simple_animal/hostile/mirelurk/baby)
	var/spawn_time = 5 SECONDS
	var/spawn_text = "hatches from"
	deathmessage = "collapses onto the ground, the light from its' eyes fading."
	death_sound = 'sound/f13npc/deathclaw/death.ogg'

	footstep_type = FOOTSTEP_MOB_HEAVY


/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/death()
	qdel(GetComponent(/datum/component/spawner/ranged))
	. = ..()

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/Destroy()
	qdel(GetComponent(/datum/component/spawner/ranged))
	. = ..()

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/Aggro()
	..()
	summon_backup(10)

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/BiologicalLife(seconds, times_fired)
	if(!(. = ..()))
		return
	if(change_behaviour == TRUE)
		move_to_delay = 3
	if(change_behaviour == FALSE)
		move_to_delay = 6

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/OpenFire()
	anger_modifier = clamp(((maxHealth - health)/50),0,20)
	if(grabbing)
		return

	if((grabbing_cooldown <= world.time) && !client)
		if(in_melee == TRUE)
			if(prob(80+anger_modifier/2))
				INVOKE_ASYNC(src, PROC_REF(grab_attack))

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/ranged, mob_types, spawn_time, faction, spawn_text, max_mobs, _range = 7)

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/AttackingTarget()
	if(!grabbing || !charging)
		return ..()

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/DestroySurroundings()
	if(!grabbing || !charging)
		..()

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/Move()
	if(!grabbing || !charging)
		if(!stat)
			playsound(src.loc, 'sound/effects/meteorimpact.ogg', 200, 1, 2, 1)
			..()

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/Goto(target, delay, minimum_distance)
	if(!grabbing || !charging)
		..()

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/proc/grab_attack(atom/movable/manual_target)
	if(stat || grabbing || charging)
		return
	if(manual_target)
		target = manual_target
	if(!target)
		return
	grabbing = 1
	grabbing_cooldown = world.time + 125
	stop_automated_movement = TRUE


	var/mob/living/L = target
	L.Paralyze(30)
	animate(target, pixel_z = 20, time = 10, loop = 1)
	visible_message("<span class='boldwarning'>[src] grabs [L] with its' claw and lifts them up, squeezing them!</span>")
	sleep(15)
	L.apply_damage(20, BRUTE, wound_bonus=WOUND_SLASH)
	playsound(get_turf(L), 'sound/effects/meteorimpact.ogg', 100, 1)
	shake_camera(L, 4, 3)
	shake_camera(src, 2, 3)
	visible_message("<span class='boldwarning'>[src] slams [L] down!</span>")
	var/throwtarget = get_edge_target_turf(target, dir)
	L.throw_at(throwtarget, 4, 3)
	L.pixel_z = 0
	L.apply_damage(20, BRUTE, wound_bonus=CANT_WOUND)

	stop_automated_movement = FALSE
	grabbing = 0

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/proc/Charge()
	var/turf/T = get_turf(target)
	if(!T || T == loc)
		return
	charging = TRUE
	visible_message(span_danger(">[src] charges!"))
	DestroySurroundings()
	walk(src, 0)
	setDir(get_dir(src, T))
	var/obj/effect/temp_visual/decoy/D = new /obj/effect/temp_visual/decoy(loc,src)
	animate(D, alpha = 0, color = "#FF0000", transform = matrix()*2, time = 1)
	throw_at(T, get_dist(src, T), 1, src, 0, callback = CALLBACK(src, PROC_REF(charge_end)))

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/proc/charge_end(list/effects_to_destroy)
	charging = FALSE
	if(target)
		Goto(target, move_to_delay, minimum_distance)

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/Bump(atom/A)
	if(charging)
		if(isturf(A) || isobj(A) && A.density)
			A.ex_act(EXPLODE_HEAVY)
		DestroySurroundings()
	..()

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/throw_impact(atom/A)
	if(!charging)
		return ..()

	else if(isliving(A))
		var/mob/living/L = A
		L.visible_message(span_danger("[src] slams into [L]!"), span_userdanger("[src] slams into you!"))
		L.apply_damage(melee_damage_lower/2, BRUTE)
		playsound(get_turf(L), 'sound/effects/meteorimpact.ogg', 100, 1)
		shake_camera(L, 4, 3)
		shake_camera(src, 2, 3)
		var/throwtarget = get_edge_target_turf(src, get_dir(src, get_step_away(L, src)))
		L.throw_at(throwtarget, 3)


	charging = FALSE
	charging = FALSE

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(10))
		if(change_behaviour == TRUE)
			visible_message(span_danger("\The [src] hisses, enraged!"))

			addtimer(CALLBACK(src, PROC_REF(Charge)), 3)
	if(prob(85) || Proj.damage > 30)
		return ..()
	else
		visible_message(span_danger("\The [Proj] bounces off \the [src]'s thick shell!"))
		return 0


