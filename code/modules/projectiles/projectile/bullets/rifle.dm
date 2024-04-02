//In this document: Rifle calibre cartridges values for damage and penetration.

//////////////////////
// AMMUNITION TYPES //
//////////////////////
/*
FMJ (full metal jacket)		=	Baseline
+P/+P+ = used by simplemobs
SHOCK = low-severity emp, -damage base, bonus burn damage (5-10)
Incin = -damage, sets target on fire
Acid = Heavy -damage, coats target in small amount of acid (1-5u)
Uranium = Irradiates, high AP, lower damage
Micro-Shrapnel = Wound bonus, embed bonus, high falloff for both
Contaminated = -damage, spawns a gas cloud that heavily reduces healing efficiency
Improvised = -1 to -4 damage
Civilian round				=	-10% damage. AP reduced by 50%
*/

/*
Ammo groupings for specialty:
5mm/22lr: Shock
Small Pistol calibers (38 357 9mm): Acid/Incin
Large Pistol Calibers (44 45 10mm): Incin
Very Large pistol (45-70): Knockback, Acid
autorifle calibers (5.56 7.62): Micro-Shrapnel (wound/embed)
heavy rifle calibers (12.7, 14mm, 7.62): Uranium, Contaminated, Incin
*/

// Explanation: Two major ammo stats, AP and Damage. Bullets placed in classes. Light rounds for example balanced with each other, one more AP, one more Damage.
// Balance between classes mostly done on the gun end, bigger rounds typically fire slower and have more recoil. They are not supposed to be totally equal either.


// Explanation: Two major ammo stats, AP and Damage. Bullets placed in classes. Light rounds for example balanced with each other, one more AP, one more Damage.
// Balance between classes mostly done on the gun end, bigger rounds typically fire slower and have more recoil. They are not supposed to be totally equal either.

////////////////////
// 5.56 MM & .223 //
////////////////////		- Moderate damage .223 civilian version for hunting/sport.

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
