//Fire
/mob/living/simple_animal/hostile/guardian/fire
	a_intent = INTENT_HELP
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_sound = 'sound/items/welder.ogg'
	attack_verb_continuous = "ignites"
	attack_verb_simple = "ignite"
	melee_damage_type = BURN
	damage_coeff = list(BRUTE = 0.7, BURN = 0.1, TOX = 0.7, CLONE = 0.7, STAMINA = 0, OXY = 0.7)
	playstyle_string = span_holoparasite("As a <b>chaos</b> type, you take 30% damage reduction to all but burn, which you are almost immune to. You will ignite any enemy you bump into. in addition, your melee attacks will cause human targets to see everyone as you.")
	magic_fluff_string = span_holoparasite("..And draw the Wizard, bringer of endless chaos!")
	tech_fluff_string = span_holoparasite("Boot sequence complete. Crowd control modules activated. Holoparasite swarm online.")
	carp_fluff_string = span_holoparasite("CARP CARP CARP! You caught one! OH GOD, EVERYTHING'S ON FIRE. Except you and the fish.")

/mob/living/simple_animal/hostile/guardian/fire/Initialize(mapload, theme)
	. = ..()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
	)
	AddElement(/datum/element/connect_loc, loc_connections)

/mob/living/simple_animal/hostile/guardian/fire/BiologicalLife(seconds, times_fired)
	. = ..()
	if(!.)
		return
	if(summoner)
		summoner.ExtinguishMob()
		summoner.adjust_fire_stacks(-20)

/mob/living/simple_animal/hostile/guardian/fire/AttackingTarget()
	. = ..()
	if(. && ishuman(target) && target != summoner)
		new /datum/hallucination/delusion(target,TRUE,"custom",200,0, icon_state,icon)

/mob/living/simple_animal/hostile/guardian/fire/proc/on_entered(datum/source, atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	SIGNAL_HANDLER
	collision_ignite(arrived)

/mob/living/simple_animal/hostile/guardian/fire/Bumped(atom/movable/AM)
	..()
	collision_ignite(AM)

/mob/living/simple_animal/hostile/guardian/fire/Bump(AM as mob|obj)
	..()
	collision_ignite(AM)

/mob/living/simple_animal/hostile/guardian/fire/proc/collision_ignite(AM as mob|obj)
	if(isliving(AM))
		var/mob/living/M = AM
		if(!hasmatchingsummoner(M) && M != summoner && M.fire_stacks < 10)
			M.fire_stacks = 10
			M.IgniteMob()
