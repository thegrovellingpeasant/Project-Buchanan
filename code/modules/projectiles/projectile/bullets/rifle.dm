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
	wound_bonus = 29

/obj/item/projectile/bullet/a556/match
	name = "5.56 match bullet"
	damage = 0
	wound_bonus = 0

/obj/item/projectile/bullet/a556/sport
	name = ".223 FMJ bullet"
	damage = 25
	wound_bonus = 22

/obj/item/projectile/bullet/a556/rubber
	name = "5.56 rubber bullet"
	damage = 5
	stamina = 30
	sharpness = SHARP_NONE
	wound_bonus = 0
	bare_wound_bonus = 0

/obj/item/projectile/bullet/a556/microshrapnel
	name = "5.56 microshrapnel bullet"
	damage = 23
	wound_bonus = 20
	bare_wound_bonus = 15
	embed_falloff_tile = 0.5
	embedding = list(embed_chance=15, fall_chance=1, jostle_chance=1, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.5, pain_mult=5, jostle_pain_mult=6, rip_time=10, embed_chance_turf_mod=100, projectile_payload = /obj/item/shrapnel/bullet/a556/microshrapnel)

/*
/obj/item/projectile/bullet/a556/uraniumtipped
	name = "5.56 uranium-tipped bullet"
	damage = 23
	wound_bonus = 0
	irradiate = 500
*/

/obj/item/projectile/bullet/a556/simple //for simple mobs, separate to allow balancing
	name = "5.56 bullet"
	damage = 35

/obj/item/projectile/bullet/a556/ap/simple //for simple mobs, separate to allow balancing
	name = "5.56 bullet"
	damage = 35
	armour_penetration = 0.2

////////////////////
// 7.62 MM & .308 //
////////////////////			- heavy rifle round, powerful but high recoil and less rof in the guns that can use it. .308 civilian version for hunting.

/obj/item/projectile/bullet/a762
	name = "7.62 FMJ bullet"
	damage = 36
	wound_bonus = 32

/obj/item/projectile/bullet/a762/simple
	name = "7.62 FMJ bullet"
	damage = 41



//.308 Winchester
/obj/item/projectile/bullet/a762/sport
	name = ".308 bullet"
	damage = 31
	wound_bonus = 25

/obj/item/projectile/bullet/a762/rubber
	name = "7.62 rubber bullet"
	damage = 7
	stamina = 35
	sharpness = SHARP_NONE
	armour_penetration = 0
	wound_bonus = 0
	bare_wound_bonus = 0

/obj/item/projectile/bullet/a762/sport/simple //for simple mobs, separate to allow balancing
	name = ".308 bullet"
	damage = 36

/*
/obj/item/projectile/bullet/a762/uraniumtipped
	name = "7.62 uranium-tipped bullet"
	damage = 29
	wound_bonus = 0
	armour_penetration = 0
	irradiate = 500
*/

/obj/item/projectile/bullet/a762/microshrapnel
	name = "7.62 microshrapnel bullet"
	damage = 29
	wound_bonus = 25
	bare_wound_bonus = 10
	wound_falloff_tile = 1
	embed_falloff_tile = 1
	embedding = list(embed_chance=15, fall_chance=1, jostle_chance=1, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.3, pain_mult=5, jostle_pain_mult=6, rip_time=10, embed_chance_turf_mod=100, projectile_payload = /obj/item/shrapnel/bullet/a762/microshrapnel)

/////////
// .50 //
/////////			bobnote/if a fucking idiot doesn't spawn this in job loadouts or admin shittery, it should be perfectly balanced.

/obj/item/projectile/bullet/a50MG
	damage = 60
	armour_penetration = 0.3
	wound_bonus = 50

/obj/item/projectile/bullet/a50MG/incendiary
	damage = 40
	wound_bonus = 0
	var/fire_stacks = 2

/obj/item/projectile/bullet/a50MG/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

/obj/item/projectile/bullet/a50MG/explosive
	damage = 40
	wound_bonus = 0

/obj/item/projectile/bullet/a50MG/explosive/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, 0, 1, 1, 1)

/obj/item/projectile/bullet/a50MG/rubber
	name = ".50 rubber bullet"
	damage = 20
	stamina = 90
	wound_bonus = 0
	armour_penetration = 0
	sharpness = SHARP_NONE

/obj/item/projectile/bullet/a50MG/penetrator
	name = ".50 penetrator round"
	damage = 40
	wound_bonus = 0
	movement_type = FLYING | UNSTOPPABLE

/*
/obj/item/projectile/bullet/a50MG/uraniumtipped
	name = "12.7mm uranium-tipped bullet"
	damage = 40
	wound_bonus = 0
	irradiate = 1000
*/

/obj/item/projectile/bullet/a50MG/contam
	name = "12.7mm contaminated bullet"
	damage = 40
	wound_bonus = 0
	var/smoke_radius = 1

/obj/item/projectile/bullet/a50MG/contam/Initialize()
	. = ..()
	create_reagents(20, NO_REACT, NO_REAGENTS_VALUE)
	reagents.add_reagent(/datum/reagent/toxin/metabtoxin, 20)

/obj/item/projectile/bullet/a50MG/contam/on_hit(atom/target, blocked = FALSE)
	var/location = get_turf(src)
	var/datum/effect_system/smoke_spread/chem/S = new
	S.attach(location)
	playsound(location, 'sound/effects/smoke.ogg', 50, 1, -3)
	if(S)
		S.set_up(src.reagents, smoke_radius, location, 0)
		S.start()
	..()

	//______________________________________________________

//////////////////////
// 4.73 MM CASELESS //
//////////////////////			-Small rifle bullet/ bobnote/whoever "coded" this bullet was a special person, it straight up did 29+16 damage, 20 wounding 30 bare wounding with the "dum dum" bullet, and because of this, I don't care about this bullet, I'm going to give it 0 in everything
//because fuck you.

/obj/item/projectile/bullet/a473
	name = "4.73 FMJ bullet"
	damage = 0
	armour_penetration = 0
	wound_bonus = 0

/obj/item/projectile/bullet/a473/rubber
	name = "4.73 polyurethane bullet"


/obj/item/projectile/bullet/a473/incendiary
	name = "4.73 tracer bullet"


/obj/item/projectile/bullet/a473/incendiary/on_hit(atom/target, blocked = FALSE)


/*
/obj/item/projectile/bullet/a473/uraniumtipped
	name = "4.73 U-235 bullet"
*/


/obj/item/projectile/bullet/a473/dumdum
	name = "4.73 flat-nose bullet"

/obj/item/projectile/bullet/a473/explosive
	name = "4.73 explosive bullet"

/obj/item/projectile/bullet/a473/shock
	name = "4.73mm shock bullet"

/obj/item/projectile/bullet/a473/shock/on_hit(atom/target, blocked = FALSE)


/obj/item/projectile/bullet/a473/hv
	name = "This bullet shouldn't exist, don't use it."

	_______________________________________________

//////////////////////////
// 5 MM rifle			 //
//////////////////////////

/obj/item/projectile/bullet/m5mm  //for rifles// one of the only bullets to have integral AP
    name = "5mm bullet"
    damage = 28
    sharpness = SHARP_EDGED
    armour_penetration = 0.4
    wound_bonus = 29

/obj/item/projectile/bullet/m5mm/simple //for simple mobs, separate to allow balancing
	name = "5mm bullet"
	damage = 33
	wound_bonus = 34

/obj/item/projectile/bullet/m5mm/shock
	name = "5mm shock bullet"
	damage = 21
	armour_penetration = 0
	wound_bonus = 0
	sharpness = SHARP_NONE

/obj/item/projectile/bullet/m5mm/shock/on_hit(atom/target, blocked = FALSE)
	..()
	target.emp_act(15)//5 severity is very, very low

//////////////////////////
// 5 MM minigun special //
//////////////////////////

/obj/item/projectile/bullet/c5mm //bobnote, I would make it 30 damage but then I thought of the laser gatling.
	damage = 25
	wound_bonus = 20
	armour_penetration = 0.5


/////////////////////////
//2 MM ELECTROMAGNETIC //
/////////////////////////			- Gauss rifle/bobnote, nobody should have this weapon, don't spawn it in, you dumbass ADMIN fuck.

/obj/item/projectile/bullet/c2mm
	damage = 80
	armour_penetration = 1
	wound_bonus = 70

/obj/item/projectile/bullet/c2mm/blender //welcome to pain town
	name = "2mm blender projectile"
	damage = 60
	wound_bonus = 100
