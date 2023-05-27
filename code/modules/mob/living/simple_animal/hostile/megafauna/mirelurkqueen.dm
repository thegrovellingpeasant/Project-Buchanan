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
	guaranteed_butcher_results = list(/obj/item/stack/sheet/sinew = 15, /obj/item/stack/sheet/animalhide/chitin/mirelurk = 20)
	decompose = FALSE
	var/grabbing = 0
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
	move_to_delay = clamp(round((health/maxHealth) * 10), 4, 6)

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/OpenFire()
	anger_modifier = clamp(((maxHealth - health)/50),0,20)
	if(grabbing)
		return

	if((grabbing_cooldown <= world.time) && !client)
		if(in_melee == TRUE)
			if(prob(80+anger_modifier/2))
				INVOKE_ASYNC(src, .proc/grab_attack)
	
/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/ranged, mob_types, spawn_time, faction, spawn_text, max_mobs, _range = 7)

	for(var/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/B in GLOB.mob_list)
		if(B != src)
			return INITIALIZE_HINT_QDEL //There can be only one

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/AttackingTarget()
	if(!grabbing)
		return ..()

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/DestroySurroundings()
	if(!grabbing)
		..()

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/Move()
	if(!grabbing)
		if(!stat)
			playsound(src.loc, 'sound/effects/meteorimpact.ogg', 200, 1, 2, 1)
			..()

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/Goto(target, delay, minimum_distance)
	if(!grabbing)
		..()

/mob/living/simple_animal/hostile/megafauna/mirelurkqueen/proc/grab_attack(atom/movable/manual_target)
	if(stat || grabbing)
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

