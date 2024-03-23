/obj/item/projectile/bullet
	name = "bullet"
	icon_state = "bullet"
	damage = 0
	damage_type = BRUTE
	nodamage = FALSE
	candink = TRUE
	flag = "bullet"
	hitsound_wall = "ricochet"
	impact_effect_type = /obj/effect/temp_visual/impact_effect
	sharpness = SHARP_POINTY

	/obj/item/projectile/bullet/reusable
	name = "reusable bullet"
	desc = "How do you even reuse a bullet?"
	var/ammo_type = /obj/item/ammo_casing/caseless
	wound_falloff_tile = -1.5
	embed_falloff_tile = -2.0
	var/dropped = FALSE
	impact_effect_type = null

    /obj/item/projectile/bullet/reusable/on_hit(atom/target, blocked = FALSE)
	. = ..()
	handle_drop()

    /obj/item/projectile/bullet/reusable/on_range()
	handle_drop()
	..()

    /obj/item/projectile/bullet/reusable/proc/handle_drop()
	if(!dropped)
		var/turf/T = get_turf(src)
		new ammo_type(T)
		dropped = TRUE


``BULLETS AND ARROW``
``PISTOL/LOWER CALIBERS FIRST``
``RIFLES/LOWER CALIBERS SECOND FIRST``
``SHOTGUN AMMO/SPECIAL SHOTGUN AMMO`` SECOND LAST``
``ARROW LAST``


FMJ (full metal jacket)		=	Baseline
+P/+P+ = used by simplemobs
SHOCK = low-severity emp, -damage base, bonus burn damage (5-10)
Incin = -damage, sets target on fire
Acid = Heavy -damage, coats target in small amount of acid (1-5u)
Uranium = Irradiates, high AP, lower damage
Micro-Shrapnel = Wound bonus, embed bonus, high falloff for both
Contaminated = -damage, spawns a gas cloud that heavily reduces healing efficiency
Improvised = -1 to -4 damage
Ammo groupings for specialty:



``PISTOL/LOWER CALIBER``



/obj/item/projectile/bullet/c22
	name = ".22lr bullet"
	damage = 14
	sharpness = SHARP_EDGED
	bare_wound_bonus = 10
	is_reflectable = TRUE

/obj/item/projectile/bullet/c22/rubber
	name = ".22lr rubber bullet"
	damage = 3
	stamina = 24
	sharpness = SHARP_NONE

/obj/item/projectile/bullet/c22/shock
	name = ".22lr shock bullet"
	damage = 14
	wound_bonus = 0
	sharpness = SHARP_NONE

/obj/item/projectile/bullet/c22/shock/on_hit(atom/target, blocked = FALSE)
	..()
	target.emp_act(15)//5 severity is very, very low

/obj/item/projectile/bullet/c38
	name = ".38 bullet"
	damage = 19
	sharpness = SHARP_EDGED
	wound_bonus = 8
	is_reflectable = TRUE

/obj/item/projectile/bullet/c38/rubber
	name = ".38 rubber bullet"
	damage = 5
	stamina = 29
	wound_bonus = 0
	sharpness = SHARP_NONE

/obj/item/projectile/bullet/c38/improv
	damage = 13
	wound_bonus = 6

/obj/item/projectile/bullet/c38/acid
	name = ".38 acid-tipped bullet"
	damage = 10
	var/acid_type = /datum/reagent/toxin/acid/fluacid
	is_reflectable = FALSE

/obj/item/projectile/bullet/c38/acid/Initialize()
	. = ..()
	create_reagents(5, NO_REACT, NO_REAGENTS_VALUE)
	reagents.add_reagent(acid_type, 5)

/obj/item/projectile/bullet/c38/acid/on_hit(atom/target, blocked = FALSE)
	..()
	if(isliving(target))
		var/mob/living/M = target
		reagents.reaction(M, TOUCH)
		reagents.trans_to(M, reagents.total_volume)


/obj/item/projectile/bullet/c38/incendiary
	name = ".38 incendiary bullet"
	damage = 10
	var/fire_stacks = 1

/obj/item/projectile/bullet/c38/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()


/obj/item/projectile/bullet/c9mm
	name = "9mm FMJ bullet"
	damage = 16.5
	sharpness = SHARP_EDGED
	wound_bonus = 10
	is_reflectable = TRUE

/obj/item/projectile/bullet/c9mm/op //not in
	name = "9mm +P bullet"
	damage = 26.5
	sharpness = SHARP_EDGED
	wound_bonus = 15

/obj/item/projectile/bullet/c9mm/rubber
	name = "9mm rubber bullet"
	damage = 6
	stamina = 27
	wound_bonus = 0
	sharpness = SHARP_NONE

/obj/item/projectile/bullet/c9mm/acid
	name = "9mm acid-tipped bullet"
	damage = 10.5
	wound_bonus = 0
	sharpness = SHARP_NONE
	var/acid_type = /datum/reagent/toxin/acid/fluacid
	is_reflectable = FALSE

/obj/item/projectile/bullet/c9mm/acid/Initialize()
	. = ..()
	create_reagents(2.5, NO_REACT, NO_REAGENTS_VALUE)
	reagents.add_reagent(acid_type, 2.5)

/obj/item/projectile/bullet/c9mm/acid/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(isliving(target))
		var/mob/living/M = target
		reagents.reaction(M, TOUCH)
		reagents.trans_to(M, reagents.total_volume)

/obj/item/projectile/bullet/c9mm/incendiary
	name = "9mm incendiary bullet"
	damage = 11.5
	var/fire_stacks = 1

/obj/item/projectile/bullet/c9mm/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

/obj/item/projectile/bullet/c9mm/improv
	damage = 11.5
	sharpness = SHARP_EDGED
	wound_bonus = 5

/obj/item/projectile/bullet/c9mm/simple //for simple mobs, separate to allow balancing
	name = "9mm bullet"
	damage = 26.5
	sharpness = SHARP_EDGED
	wound_bonus = 15




/obj/item/projectile/bullet/c10mm
	name = "10mm FMJ bullet"
	damage = 20
	sharpness = SHARP_EDGED
	wound_bonus = 14
	is_reflectable = TRUE

/obj/item/projectile/bullet/c10mm/simple
	name = "10mm FMJ bullet"
	damage = 30
	sharpness = SHARP_EDGED
	wound_bonus = 19

/obj/item/projectile/bullet/c10mm/rubber
	name = "10mm rubber bullet"
	damage = 6
	stamina = 28
	wound_bonus = 0
	sharpness = SHARP_NONE

/obj/item/projectile/bullet/c10mm/incendiary
	name = "10mm incendiary bullet"
	damage = 14
	var/fire_stacks = 1

/obj/item/projectile/bullet/c10mm/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()




/obj/item/projectile/bullet/c45
	name = ".45 FMJ bullet"
	damage = 18
	sharpness = SHARP_EDGED
	wound_bonus = 15
	is_reflectable = TRUE

/obj/item/projectile/bullet/c45/simple
	name = ".45 FMJ bullet"
	damage = 28
	sharpness = SHARP_EDGED
	wound_bonus = 20

/obj/item/projectile/bullet/c45/op //not in
	name = ".45 +P bullet"
	damage = 28
	sharpness = SHARP_EDGED
	wound_bonus = 20

/obj/item/projectile/bullet/c45/rubber
	name = ".45 rubber bullet"
	damage = 5
	stamina = 32
	sharpness = SHARP_NONE
	wound_bonus = 0

/obj/item/projectile/bullet/c45/incendiary
	name = ".45 incendiary bullet"
	damage = 12
	var/fire_stacks = 1

/obj/item/projectile/bullet/c45/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()



/obj/item/projectile/bullet/a357
	name = ".357 FMJ bullet"
	damage = 23
	sharpness = SHARP_EDGED
	armour_penetration = 0.1
	wound_bonus = 23


// 3 ricochets, more than enough to kill anything that moves
/obj/item/projectile/bullet/a357/ricochet
	name = ".357 ricochet bullet"
	damage = 17
	ricochets_max = 3
	ricochet_chance = 140
	ricochet_auto_aim_angle = 50
	ricochet_auto_aim_range = 6
	ricochet_incidence_leeway = 80

/obj/item/projectile/bullet/a357/acid
	name = ".357 acid-tipped bullet"
	damage = 17
	wound_bonus = 0
	sharpness = SHARP_NONE
	var/acid_type = /datum/reagent/toxin/acid/fluacid

/obj/item/projectile/bullet/a357/acid/Initialize()
	. = ..()
	create_reagents(5, NO_REACT, NO_REAGENTS_VALUE)
	reagents.add_reagent(acid_type, 2.5)

/obj/item/projectile/bullet/a357/acid/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(isliving(target))
		var/mob/living/M = target
		reagents.reaction(M, TOUCH)
		reagents.trans_to(M, reagents.total_volume)

/obj/item/projectile/bullet/a357/incendiary
	name = ".357 incendiary bullet"
	damage = 17
	var/fire_stacks = 1

/obj/item/projectile/bullet/a357/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

/obj/item/projectile/bullet/a357/improv
	name = "poor .357 bullet"
	damage = 17
	sharpness = SHARP_EDGED
	wound_bonus = 15


/obj/item/projectile/bullet/m44
	name = ".44 FMJ bullet"
	damage = 28
	sharpness = SHARP_EDGED
	armour_penetration = 0.1
	wound_bonus = 28



/obj/item/projectile/bullet/m44/simple //for simple mobs, separate to allow balancing
	name = ".44 bullet"
	damage = 38
	sharpness = SHARP_EDGED
	armour_penetration = 0.1
	wound_bonus = 33

/obj/item/projectile/bullet/m44/incendiary
	name = ".44 incendiary bullet"
	damage = 22
	var/fire_stacks = 1

/obj/item/projectile/bullet/m44/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()




/obj/item/projectile/bullet/mm14
	name = "14mm FMJ bullet"
	damage = 32
	sharpness = SHARP_EDGED
	armour_penetration = 0.2
	wound_bonus = 32

/obj/item/projectile/bullet/mm14/contam
	name = "14mm contaiminated bullet"
	damage = 26
	var/smoke_radius = 1

/obj/item/projectile/bullet/mm14/contam/Initialize()
	. = ..()
	create_reagents(15, NO_REACT, NO_REAGENTS_VALUE)
	reagents.add_reagent(/datum/reagent/toxin/metabtoxin, 15)

/obj/item/projectile/bullet/mm14/contam/on_hit(atom/target, blocked = FALSE)
	. = ..()
	var/location = get_turf(src)
	var/datum/effect_system/smoke_spread/chem/S = new
	S.attach(location)
	playsound(location, 'sound/effects/smoke.ogg', 50, 1, -3)
	if(S)
		S.set_up(src.reagents, smoke_radius, location, 0)
		S.start()

/*
/obj/item/projectile/bullet/mm14/uraniumtipped
	name = "14mm uranium-tipped bullet"
	damage = 26
	armour_penetration = 0.1
	irradiate = 500
*/





//45 Long Colt. Bouncy ammo but less damage then the Sequoia. It's in one of the Vet Ranger kits
/obj/item/projectile/bullet/a45lc
	name = ".45 LC bullet"
	damage = 26
	armour_penetration = 0.1
	sharpness = SHARP_EDGED
	wound_bonus = 25
	ricochets_max = 3
	ricochet_incidence_leeway = 130
	ricochet_decay_damage = 1.1 //48 damage on first bounce, 53 on second, 58 on third. Unless you bounce, the DPS dual wielding is lower then a single M29
	ricochet_decay_chance = 11
	ricochet_chance = 100 //100% if you have the vet's trait //bobnote bouncy bullet go bounce bounce
	ricochet_auto_aim_range = 4




/obj/item/projectile/bullet/needle
	name = "needle"
	icon_state = "cbbolt"
	damage = 30
	armour_penetration = 0.5
	var/piercing = FALSE


	``RIFLE/HIGHER END CALIBERS``


	/obj/item/projectile/bullet/a556
	name = "5.56 FMJ bullet"
	damage = 30
	sharpness = SHARP_EDGED
	wound_bonus = 26

/obj/item/projectile/bullet/a556/match //bobnote/ WHAT THE FUCK IS THIS BULLET, fuck it i'm making it exactly the same.
	name = "5.56 match bullet"
	damage = 30
	sharpness = SHARP_EDGED
	wound_bonus = 26

/obj/item/projectile/bullet/a556/sport
	name = ".223 FMJ bullet"
	damage = 24
	sharpness = SHARP_EDGED
	wound_bonus = 20

/obj/item/projectile/bullet/a556/rubber
	name = "5.56 rubber bullet"
	damage = 7
	stamina = 30

/obj/item/projectile/bullet/a556/microshrapnel
	name = "5.56 microshrapnel bullet"
	damage = 24
	sharpness = SHARP_EDGED
	wound_bonus = 10
	bare_wound_bonus = 10
	wound_falloff_tile = 0.5
	embed_falloff_tile = 0.5
	embedding = list(embed_chance=15, fall_chance=1, jostle_chance=1, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.5, pain_mult=5, jostle_pain_mult=6, rip_time=10, embed_chance_turf_mod=100, projectile_payload = /obj/item/shrapnel/bullet/a556/microshrapnel)

/*
/obj/item/projectile/bullet/a556/uraniumtipped
	name = "5.56 uranium-tipped bullet"
	damage = 24
	irradiate = 500
*/

/obj/item/projectile/bullet/a556/simple //for simple mobs, separate to allow balancing
	name = "5.56 bullet"
	damage = 40
	sharpness = SHARP_EDGED
	wound_bonus = 31

/obj/item/projectile/bullet/a556/ap/simple //for simple mobs, separate to allow balancing
	name = "5.56 bullet"
	damage = 40
	sharpness = SHARP_EDGED
	armour_penetration = 0.1
	wound_bonus = 31



/obj/item/projectile/bullet/a762
	name = "7.62 FMJ bullet"
	damage = 40
	wound_bonus = 10
	sharpness = SHARP_EDGED
	armour_penetration = 0.1
	wound_bonus = 35

/obj/item/projectile/bullet/a762/simple
	name = "7.62 FMJ bullet"
	damage = 50
	sharpness = SHARP_EDGED
	armour_penetration = 0.1
	wound_bonus = 40


//.308 Winchester
/obj/item/projectile/bullet/a762/sport
	name = ".308 bullet"
	damage = 34
	sharpness = SHARP_EDGED
	wound_bonus = 29

/obj/item/projectile/bullet/a762/rubber
	name = "7.62 rubber bullet"
	damage = 8
	stamina = 35
	sharpness = SHARP_NONE

/obj/item/projectile/bullet/a762/sport/simple //for simple mobs, separate to allow balancing
	name = ".308 bullet"
	damage = 44
	sharpness = SHARP_EDGED
	wound_bonus = 35

/*
/obj/item/projectile/bullet/a762/uraniumtipped
	name = "7.62 uranium-tipped bullet"
	damage = 34
	irradiate = 500
*/

/obj/item/projectile/bullet/a762/microshrapnel
	name = "7.62 microshrapnel bullet"
	damage = 34
	sharpness = SHARP_EDGED
	wound_bonus = 15
	bare_wound_bonus = 15
	wound_falloff_tile = 0.5
	embed_falloff_tile = 0.5
	embedding = list(embed_chance=15, fall_chance=1, jostle_chance=1, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.3, pain_mult=5, jostle_pain_mult=6, rip_time=7, embed_chance_turf_mod=100, projectile_payload = /obj/item/shrapnel/bullet/a762/microshrapnel)




/obj/item/projectile/bullet/c4570
	name = ".45-70 FMJ bullet"
	damage = 45
	sharpness = SHARP_EDGED
	armour_penetration = 0.2
	wound_bonus = 41

/obj/item/projectile/bullet/c4570/explosive //bobnote, I don't know how to balance this
	damage = 39
	pixels_per_second = TILES_TO_PIXELS(500)
	name = ".45-70 explosive bullet"

/obj/item/projectile/bullet/c4570/explosive/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, 0, 0, 1, 1, flame_range = 1)

/obj/item/projectile/bullet/c4570/acid
	name = ".45-70 acid-tipped bullet"
	damage = 39
	sharpness = SHARP_NONE
	var/acid_type = /datum/reagent/toxin/acid/fluacid

/obj/item/projectile/bullet/c4570/acid/Initialize()
	. = ..()
	create_reagents(10, NO_REACT, NO_REAGENTS_VALUE)
	reagents.add_reagent(acid_type, 10)

/obj/item/projectile/bullet/c4570/acid/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(isliving(target))
		var/mob/living/M = target
		reagents.reaction(M, TOUCH)
		reagents.trans_to(M, reagents.total_volume)

/obj/item/projectile/bullet/c4570/knockback
	name = ".45-70 ultradense bullet"
	damage = 39
	sharpness = SHARP_NONE
	pixels_per_second = TILES_TO_PIXELS(500)

/obj/item/projectile/bullet/c4570/knockback/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(ismovable(target) && prob(50))
		var/atom/movable/M = target
		var/atom/throw_target = get_edge_target_turf(M, get_dir(src, get_step_away(M, src)))
		M.safe_throw_at(throw_target, 2, 3)


//bobnote, assume this will never be in a round unless admin shittery
/obj/item/projectile/bullet/a50MG
	damage = 70
	armour_penetration = 0.2
	sharpness = SHARP_EDGED
	wound_bonus = 70
	hitscan = TRUE

/obj/item/projectile/bullet/a50MG/incendiary
	damage = 50
	var/fire_stacks = 3
	zone_accuracy_factor = 100

/obj/item/projectile/bullet/a50MG/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

/obj/item/projectile/bullet/a50MG/explosive
	damage = 50

/obj/item/projectile/bullet/a50MG/explosive/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, 0, 1, 1, 1)

/obj/item/projectile/bullet/a50MG/rubber
	name = ".50 rubber bullet"
	damage = 15
	stamina = 80
	armour_penetration = 0
	sharpness = SHARP_NONE

/obj/item/projectile/bullet/a50MG/penetrator
	name = ".50 penetrator round"
	damage = 60
	armour_penetration = 0.1
	movement_type = FLYING | UNSTOPPABLE

/*
/obj/item/projectile/bullet/a50MG/uraniumtipped
	name = "12.7mm uranium-tipped bullet"
	damage = 60
	armour_penetration = 0.1
	irradiate = 500
*/

/obj/item/projectile/bullet/a50MG/contam
	name = "12.7mm contaminated bullet"
	damage = 60
	var/smoke_radius = 1

/obj/item/projectile/bullet/a50MG/contam/Initialize()
	. = ..()
	create_reagents(15, NO_REACT, NO_REAGENTS_VALUE)
	reagents.add_reagent(/datum/reagent/toxin/metabtoxin, 15)

/obj/item/projectile/bullet/a50MG/contam/on_hit(atom/target, blocked = FALSE)
	var/location = get_turf(src)
	var/datum/effect_system/smoke_spread/chem/S = new
	S.attach(location)
	playsound(location, 'sound/effects/smoke.ogg', 50, 1, -3)
	if(S)
		S.set_up(src.reagents, smoke_radius, location, 0)
		S.start()
	..()



/obj/item/projectile/bullet/a473
	name = "4.73 FMJ bullet"
	damage = 25
	armour_penetration = 0.1
	sharpness = SHARP_EDGED
	wound_bonus = 21

/obj/item/projectile/bullet/a473/rubber
	name = "4.73 polyurethane bullet"
	damage = 5
	stamina = 25

/obj/item/projectile/bullet/a473/incendiary
	name = "4.73 tracer bullet"
	damage = 19
	var/fire_stacks = 1

/obj/item/projectile/bullet/a473/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

/*
/obj/item/projectile/bullet/a473/uraniumtipped
	name = "4.73 U-235 bullet"
	damage = 19
	irradiate = 500
*/

/obj/item/projectile/bullet/a473/dumdum //bobnote, whoever tweaked this gun before was a fucking idiot, 5 damage, with better wounding, negative AP, did more damage to mobs, straight up a buff with no downsides lol (negative ap does nothing)
	name = "4.73 flat-nose bullet"
	damage = 25
	sharpness = SHARP_EDGED
	wound_bonus = 28

/obj/item/projectile/bullet/a473/explosive
	name = "4.73 explosive bullet"
	damage = 19

/obj/item/projectile/bullet/a473/explosive/on_hit(atom/target, blocked = FALSE)
	..()
	if(prob(10))
		explosion(target, 0, 0, 1, 1, adminlog = FALSE, flame_range = 0)
	else
		explosion(target, 0, 0, 0, 1, adminlog = FALSE, flame_range = 1) //no boom, just flame and flash

/obj/item/projectile/bullet/a473/shock
	name = "4.73mm shock bullet"
	wound_bonus = 19
	sharpness = SHARP_NONE

/obj/item/projectile/bullet/a473/shock/on_hit(atom/target, blocked = FALSE)
	..()
	target.emp_act(15)//5 severity is very, very low

/obj/item/projectile/bullet/a473/hv //bobnote, what, remove this NOW!!!!!!!
	name = "4.73mm highvelocity bullet"
	damage = 25
	armour_penetration = 0.1
	wound_bonus = 21



/obj/item/projectile/bullet/m5mm  //for rifles// one of the only bullets to have integral AP
	damage = 35
	armour_penetration = 0.2
	sharpness = SHARP_EDGED
	wound_bonus = 16
	

/obj/item/projectile/bullet/m5mm/simple //for simple mobs, separate to allow balancing
	name = "5mm bullet"
	damage = 40
	armour_penetration = 0.3
	sharpness = SHARP_EDGED
	wound_bonus = 22

/obj/item/projectile/bullet/m5mm/shock
	name = "5mm shock bullet"
	damage = 29
	wound_bonus = 0
	sharpness = SHARP_NONE

/obj/item/projectile/bullet/m5mm/shock/on_hit(atom/target, blocked = FALSE)
	..()
	target.emp_act(15)//5 severity is very, very low



/obj/item/projectile/bullet/c5mm //bobnote, we do a little bit of trolling
	damage = 25
	wound_bonus = 20
	sharpness = SHARP_EDGED
	armour_penetration = 0.5



/obj/item/projectile/bullet/c2mm
	damage = 80
	wound_bonus = 80
	sharpness = SHARP_EDGED
	armour_penetration = 1

/obj/item/projectile/bullet/c2mm/blender //welcome to pain town
	name = "2mm blender projectile"
	damage = 60
	hitscan = TRUE
	wound_bonus = 80
	sharpness = SHARP_EDGED
	pass_flags = PASSTABLE
	armour_penetration = 1
	ricochets_max = 9 //ain't called the 'blender' for nothin'
	ricochet_incidence_leeway = 130
	ricochet_decay_damage = 1
	ricochet_decay_chance = 11
	ricochet_chance = 100
	var/collats = 3

/obj/item/projectile/bullet/c2mm/blender/process_hit(turf/T, atom/target, qdel_self, hit_something = FALSE)
	if(isliving(target) && collats)
		collats--
		temporary_unstoppable_movement = TRUE
		ENABLE_BITFIELD(movement_type, UNSTOPPABLE)
	..()



	/obj/item/projectile/bullet/pellet
	var/tile_dropoff = 0.45
	var/tile_dropoff_s = 1.25

	/obj/item/projectile/bullet/pellet/Range()
	..()
	if(damage > 0)
		damage -= tile_dropoff
	if(stamina > 0)
		stamina -= tile_dropoff_s
	if(damage < 0 && stamina < 0)
		qdel(src)

    /obj/item/projectile/bullet/pellet/shotgun_buckshot
	name = "buckshot pellet"
	damage = 9.5
	wound_bonus = 10
	bare_wound_bonus = 10
	wound_falloff_tile = -1.5
	is_reflectable = TRUE

	/obj/item/projectile/bullet/pellet/shotgun_improvised
	damage = 7
	wound_bonus = 5
	bare_wound_bonus = 5

/obj/item/projectile/bullet/pellet/shotgun_improvised/Initialize()
	. = ..()
	range = rand(1, 8)

	/obj/item/projectile/bullet/shotgun_slug
	name = "12g shotgun slug"
	damage = 35
	sharpness = SHARP_EDGED
	wound_bonus = 26

	/obj/item/projectile/bullet/pellet/shotgun_rubbershot
	name = "rubbershot pellet"
	damage = 4
	stamina = 10
	sharpness = SHARP_NONE
	embedding = null
	is_reflectable = TRUE

    /obj/item/projectile/bullet/shotgun_beanbag
	name = "beanbag slug"
	damage = 8
	stamina = 50
	sharpness = SHARP_NONE
	embedding = null


		/obj/item/projectile/bullet/pellet/magnum_buckshot
	name = "magnum buckshot pellet"
	damage = 13
	wound_bonus = 15
	wound_falloff_tile = -1.5
	bare_wound_bonus = 15

		/obj/item/projectile/bullet/pellet/trainshot
	damage = 11
	armour_penetration = 0.2
	sharpness = SHARP_NONE

       /obj/item/projectile/bullet/pellet/trainshot/on_hit(atom/target)
	. = ..()
	if(ismovable(target) && prob(25))
		var/atom/movable/M = target
		var/atom/throw_target = get_edge_target_turf(M, get_dir(src, get_step_away(M, src)))
		M.safe_throw_at(throw_target, 2, 3)


		/obj/item/projectile/bullet/incend_shotgun/shotgun
	name = "incendiary slug"
	damage = 25

/obj/item/projectile/bullet/incend_shotgun/shotgun/dragonsbreath
	name = "dragonsbreath pellet"
	damage = 5

	/obj/item/projectile/bullet/incend_shotgun/shotgun/Move()
	. = ..()
	var/turf/location = get_turf(src)
	if(location)
		new /obj/effect/hotspot(location)
		location.hotspot_expose(700, 5, 1)

		/obj/item/projectile/bullet/incend_shotgun/shotgun/on_hit(atom/target)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(2)
		M.IgniteMob()

		/obj/item/projectile/bullet/incend_shotgun/shotgun/dragonsbreath/on_hit(atom/target). = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(2)
		M.IgniteMob()















   ``Arrows``


	/obj/item/projectile/bullet/reusable/arrow
	name = "metal arrow"
	desc = "a simple arrow with a metal head."
	damage = 34
	wound_bonus = 25
	icon_state = "arrow"
	ammo_type = /obj/item/ammo_casing/caseless/arrow
    embedding = list(embed_chance=30, fall_chance=65, jostle_chance=3, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.2, pain_mult=2, jostle_pain_mult=1, rip_time=25, projectile_payload = /obj/item/ammo_casing/caseless/arrow)


	/obj/item/projectile/bullet/reusable/arrow/ap
	name = "sturdy arrow"
	desc = "A reinforced arrow with a metal shaft and heavy duty head."
	damage = 34
	wound_bonus = 20
	armour_penetration = 0.3
	icon_state = "arrow"
	ammo_type = /obj/item/ammo_casing/caseless/arrow/ap
	embedding = list(embed_chance=15, fall_chance=65, jostle_chance=3, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.2, pain_mult=2, jostle_pain_mult=1, rip_time=25, projectile_payload = /obj/item/ammo_casing/caseless/arrow/ap)


/obj/item/projectile/bullet/reusable/arrow/bone
	name = "bone arrow"
	desc = "Arrow made of bone and sinew."
	damage = 25
	bare_wound_bonus = 15
	embedding = list(embed_chance=15, fall_chance=65, jostle_chance=3, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.2, pain_mult=2, jostle_pain_mult=1, rip_time=25, projectile_payload = /obj/item/ammo_casing/caseless/arrow/bone)
	ammo_type = /obj/item/ammo_casing/caseless/arrow/bone


/obj/item/projectile/bullet/reusable/arrow/cheap
	name = "lightweight arrow"
	desc = "A cheap, lightweight wooden arrow. Not as effective against armor."
	damage = 25
	bare_wound_bonus = 10
	icon_state = "arrow"
	embedding = list(embed_chance=20, fall_chance=65, jostle_chance=3, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.2, pain_mult=2, jostle_pain_mult=1, rip_time=25, projectile_payload = /obj/item/ammo_casing/caseless/arrow/cheap)
	ammo_type = /obj/item/ammo_casing/caseless/arrow/cheap


/obj/item/projectile/bullet/reusable/arrow/poison
	name = "poison arrow"
	desc = "A simple arrow, tipped in a poisonous paste."
	damage = 20
	icon_state = "arrow"
	ammo_type = /obj/item/ammo_casing/caseless/arrow/poison

/obj/item/projectile/bullet/reusable/arrow/poison/on_hit(atom/target, blocked)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/targetHuman = target
		targetHuman.reagents.add_reagent(/datum/reagent/toxin, 10) //so you get some toxin damage! around 30

/obj/item/projectile/bullet/reusable/arrow/burning
	name = "burn arrow"
	desc = "A sumple arrow slathered in a paste that burns skin on contact."
	damage = 20
	icon_state = "arrow"
	ammo_type = /obj/item/ammo_casing/caseless/arrow/burning

/obj/item/projectile/bullet/reusable/arrow/burning/on_hit(atom/target, blocked)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/targetHuman = target
		targetHuman.adjust_fire_stacks(5)
		targetHuman.IgniteMob() //you just got burned!


/obj/item/projectile/bullet/reusable/arrow/broadhead
	name = "broadhead arrow"
	desc = "An arrow that sticks in wounds. Badly."
	damage = 20
	wound_bonus = 15
	ammo_type = /obj/item/ammo_casing/caseless/arrow/broadhead
	embedding = list(embed_chance=80, fall_chance=40, jostle_chance=3, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.2, pain_mult=2, jostle_pain_mult=1, rip_time=25, projectile_payload = /obj/item/ammo_casing/caseless/arrow/broadhead)

/obj/item/projectile/bullet/reusable/arrow/broadhead/on_hit(atom/target, blocked)
	if(iscarbon(target))
		dropped = TRUE
	..()

/obj/item/projectile/bullet/reusable/arrow/serrated
	name = "serrated arrow"
	desc = "An arrow that can sever arteries!"
	wound_bonus = 20
	bare_wound_bonus = 20
	sharpness = SHARP_EDGED
	damage = 30
	ammo_type = /obj/item/ammo_casing/caseless/arrow/serrated
	embedding = list(embed_chance=50, fall_chance=75, jostle_chance=1, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.2, pain_mult=2, jostle_pain_mult=0.5, rip_time=25, projectile_payload = /obj/item/ammo_casing/caseless/arrow/cheap)
