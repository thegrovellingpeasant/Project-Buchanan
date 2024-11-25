//Mix of bubblegum and wendigo code

/mob/living/simple_animal/hostile/megafauna/yaoguai
	name = "Ainka-Akoiah"
	desc = "A vicious, hulking yao guai that has terrorized the wilds of wastes for decades. Its' fur is all but gone and some of its' skin tears away to reveal the flesh of its' muscles, most likely due to the myriad of battles it has endured, of man and beast."
	health = 3000
	maxHealth = 3000
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/magic/demon_attack1.ogg'
	icon = 'icons/fallout/mobs/megafauna/96x96megafauna.dmi'
	icon_state = "mega_bear"
	icon_living = "mega_bear"
	icon_dead = "mega_bear_dead"
	friendly_verb_continuous = "stares down"
	friendly_verb_simple = "stare down"
	speak_emote = list("roars")
	faction = list("yaoguai")
	armour_penetration = 0.7
	melee_damage_lower = 55
	melee_damage_upper = 55
	speed = 1
	move_to_delay = 4
	ranged_cooldown_time = 10
	ranged = 1
	pixel_x = -32

	gender = MALE
	wander = FALSE
	loot = list(/obj/effect/spawner/lootdrop/f13/weapon/melee/tier5, /obj/effect/spawner/lootdrop/f13/weapon/melee/tier5, /obj/effect/spawner/lootdrop/f13/weapon/gun/ballistic/lowmid)
	guaranteed_butcher_results = list(/obj/item/organ/heart/freedom/yaoguai = 1, /obj/item/stack/sheet/sinew = 15, /obj/item/stack/sheet/bone/yaoguai = 30)
	decompose = FALSE
	can_devour = FALSE
	stat_attack = UNCONSCIOUS
	var/charging = 0
	deathmessage = "collapses onto the ground, letting out one last guttural roar."
	death_sound = 'sound/f13npc/deathclaw/death.ogg'
	attack_action_types = list(/datum/action/innate/megafauna_attack/disorienting_scream)
	var/can_move = TRUE
	var/stored_move_dirs = 0

	footstep_type = FOOTSTEP_MOB_HEAVY

/mob/living/simple_animal/hostile/megafauna/yaoguai/BiologicalLife(seconds, times_fired)
	if(!(. = ..()))
		return
	move_to_delay = clamp(round((health/maxHealth) * 10), 2, 4)

/mob/living/simple_animal/hostile/megafauna/yaoguai/OpenFire()
	anger_modifier = clamp(((maxHealth - health)/50),0,20)
	if(charging)
		return

	if(prob(40))
		INVOKE_ASYNC(src, PROC_REF(charge))

	else if(prob(15))
		disorienting_scream()

	else if(prob(40+anger_modifier/2))
		INVOKE_ASYNC(src, PROC_REF(triple_charge))
		disorienting_scream()

/mob/living/simple_animal/hostile/megafauna/yaoguai/Initialize()
	. = ..()

/mob/living/simple_animal/hostile/megafauna/yaoguai/do_attack_animation(atom/A, visual_effect_icon, obj/item/used_item, no_effect)
	if(charging)
		return
	..()

/mob/living/simple_animal/hostile/megafauna/yaoguai/AttackingTarget()
	if(charging)
		return
	..()

/mob/living/simple_animal/hostile/megafauna/yaoguai/Goto(target, delay, minimum_distance)
	if(charging)
		return
	..()

/mob/living/simple_animal/hostile/megafauna/yaoguai/Move(atom/newloc, direct)
	if(!can_move)
		return
	stored_move_dirs |= direct
	return ..()

/mob/living/simple_animal/hostile/megafauna/yaoguai/Move()
	if(!stat)
		playsound(src.loc, 'sound/effects/meteorimpact.ogg', 200, 1, 2, 1)
	if(charging)
		new/obj/effect/temp_visual/decoy/fading(loc,src)
		DestroySurroundings()
	. = ..()
	if(charging)
		DestroySurroundings()

/mob/living/simple_animal/hostile/megafauna/yaoguai/proc/triple_charge()
	charge()
	sleep(10)
	charge()
	sleep(10)
	charge()
	sleep(30)

/mob/living/simple_animal/hostile/megafauna/yaoguai/proc/charge()
	var/turf/T = get_turf(target)
	if(!T || T == loc)
		return
	new /obj/effect/temp_visual/dragon_swoop(T)
	charging = 1
	DestroySurroundings()
	walk(src, 0)
	setDir(get_dir(src, T))
	var/obj/effect/temp_visual/decoy/D = new /obj/effect/temp_visual/decoy(loc,src)
	animate(D, alpha = 0, color = "#FF0000", transform = matrix()*2, time = 5)
	sleep(5)
	throw_at(T, get_dist(src, T), 1, src, 0)
	charging = 0
	Goto(target, move_to_delay, minimum_distance)


/mob/living/simple_animal/hostile/megafauna/yaoguai/Bump(atom/A)
	if(charging)
		if(isturf(A) || isobj(A) && A.density)
			A.ex_act(EXPLODE_HEAVY)
		DestroySurroundings()
	..()

/mob/living/simple_animal/hostile/megafauna/yaoguai/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(!charging)
		return ..()

	else if(isliving(hit_atom))
		var/mob/living/L = hit_atom
		L.visible_message("<span class='danger'>[src] slams into [L]!</span>", "<span class='userdanger'>[src] slams into you!</span>")
		L.apply_damage(40, BRUTE)
		playsound(get_turf(L), 'sound/effects/meteorimpact.ogg', 100, 1)
		shake_camera(L, 4, 3)
		shake_camera(src, 2, 3)
		var/throwtarget = get_edge_target_turf(src, get_dir(src, get_step_away(L, src)))
		L.throw_at(throwtarget, 3)

	charging = 0

/mob/living/simple_animal/hostile/megafauna/yaoguai/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(20))
		visible_message(span_danger("\The [src] growls, enraged!"))

		addtimer(CALLBACK(src, PROC_REF(charge)), 3)
	if(prob(85) || Proj.damage > 30) //prob(x) = chance for proj to actually do something
		return ..()
	else
		visible_message(span_danger("\The [Proj] is abosrbed by \the [src]'s thick hide!"))
		return 0

/mob/living/simple_animal/hostile/megafauna/yaoguai/proc/disorienting_scream()
	can_move = FALSE
	playsound(src, 'sound/magic/demon_dies.ogg', 600, FALSE, 10)
	animate(src, pixel_z = rand(5, 15), time = 1, loop = 6)
	animate(pixel_z = 0, time = 1)
	for(var/mob/living/L in get_hearers_in_view(7, src) - src)
		shake_camera(L, 30, 1)
		to_chat(L, "<span class='danger'>The yao guai roars loudly!</span>")
	SetRecoveryTime(30, 0)
	SLEEP_CHECK_DEATH(12)
	can_move = TRUE
	return
