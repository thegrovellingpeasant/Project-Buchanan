``LASER``
(PISTOLS START FIRST)


/obj/item/projectile/beam
	name = "laser"
	icon_state = "laser"
	pass_flags = PASSTABLE| PASSGLASS
	damage = 0
	light_range = 0
	damage_type = BURN
	hitsound = 'sound/weapons/sear.ogg'
	hitsound_wall = 'sound/weapons/effects/searwall.ogg'
	flag = "laser"
	eyeblur = 5
	impact_effect_type = /obj/effect/temp_visual/impact_effect/red_laser
	light_color = LIGHT_COLOR_RED
	is_reflectable = TRUE
	wound_bonus = 0
	bare_wound_bonus = 0



	/obj/item/projectile/beam/laser/pistol
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser
	eyeblur = 2
    
	/obj/item/projectile/beam/laser/rifle
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser
	eyeblur = 5


``PISTOL``



/obj/item/projectile/beam/laser/pistol/wattz
    name = "weak laser beam"
	damage = 20
	wound_bonus = 20
	wound_falloff_tile = -2.5
	armour_penetration = 0.2

/obj/item/projectile/beam/laser/pistol/wattz/hitscan
	name = "weak laser beam"
	damage = 15
	wound_bonus = 15
	wound_falloff_tile = -2.5
	hitscan = TRUE


/obj/item/projectile/beam/laser/pistol/wattz/magneto
	name = "penetrating laser beam"
	damage = 22
	wound_bonus = 20
	wound_falloff_tile = -2.5
	armour_penetration = 0.2

/obj/item/projectile/beam/laser/pistol/wattz/magneto/hitscan
	name = "penetrating laser beam"
	damage = 17
	wound_bonus = 15
	wound_falloff_tile = -2.5
	hitscan = TRUE
	armour_penetration = 0.1


	/obj/item/projectile/beam/laser/pistol/aer7
	name = "laser beam"
	damage = 25
	wound_bonus = 20
	wound_falloff_tile = -2.5

/obj/item/projectile/beam/laser/pistol/aer7/hitscan
	name = "laser beam"
	damage = 20
	wound_bonus = 20
	wound_falloff_tile = -2.5
	hitscan = TRUE


/obj/item/projectile/beam/laser/pistol/compbeam
	name = "compliance beam"
	damage = 45
	damage_type = STAMINA
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE
	tracer_type = /obj/effect/projectile/tracer/disabler
	muzzle_type = /obj/effect/projectile/muzzle/disabler
	impact_type = /obj/effect/projectile/impact/disabler


/obj/item/projectile/beam/laser/pistol/recharger //bobnote, I fucking hate this, we should remove it, this sucks so fucking much, literally a useless gimmick gun.
	name = "recharger beam"
	damage = 20
	wound_bonus = 15
	wound_falloff_tile = -1.5
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/pulse
	muzzle_type = /obj/effect/projectile/muzzle/pulse
	impact_type = /obj/effect/projectile/impact/pulse
	light_color = LIGHT_COLOR_BLUE

/obj/item/projectile/beam/laser/pistol/recharger/hitscan
	name = "recharger beam"
	damage = 15
	wound_bonus = 10
	wound_falloff_tile = -1.5
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/pulse
	muzzle_type = /obj/effect/projectile/muzzle/pulse
	impact_type = /obj/effect/projectile/impact/pulse
	light_color = LIGHT_COLOR_BLUE

/obj/item/projectile/beam/laser/pistol/gamma
	name = "gamma beam"
	icon_state = "xray"
	damage = 10
	flag = "energy"
	armour_penetration = 1 //it only does 5 damage.
	damage_type = "toxin"
	irradiate = 500
	range = 15
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE | PASSCLOSEDTURF
	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser
	light_color = LIGHT_COLOR_GREEN
	tracer_type = /obj/effect/projectile/tracer/xray
	muzzle_type = /obj/effect/projectile/muzzle/xray
	impact_type = /obj/effect/projectile/impact/xray



``RIFLE``



/obj/item/projectile/beam/laser/rifle/wattz2k
	name = "focused laser beam"
	damage = 33
	wound_bonus = 24
	wound_falloff_tile = -1.5
	armour_penetration = 0.1
	tracer_type = /obj/effect/projectile/tracer/heavy_laser
	muzzle_type = /obj/effect/projectile/muzzle/heavy_laser
	impact_type = /obj/effect/projectile/impact/heavy_laser

/obj/item/projectile/beam/laser/rifle/wattz2k/hitscan
	name = "focused laser beam"
	damage = 28
	wound_bonus = 19
	wound_falloff_tile = -1.5
	tracer_type = /obj/effect/projectile/tracer/heavy_laser
	muzzle_type = /obj/effect/projectile/muzzle/heavy_laser
	impact_type = /obj/effect/projectile/impact/heavy_laser
	hitscan = TRUE


/obj/item/projectile/beam/laser/rifle/musket
	name = "charged laser bolt"
	damage = 40
	armour_penetration = 0.3
	wound_bonus = 22
	wound_falloff_tile = -1.5
	tracer_type = /obj/effect/projectile/tracer/heavy_laser
	muzzle_type = /obj/effect/projectile/muzzle/heavy_laser
	impact_type = /obj/effect/projectile/impact/heavy_laser

/obj/item/projectile/beam/laser/rifle/musket/hitscan
	name = "charged laser bolt"
	damage = 35
	armour_penetration = 0.2
	hitscan = TRUE
	wound_bonus = 17
	wound_falloff_tile = -1.5
	tracer_type = /obj/effect/projectile/tracer/heavy_laser
	muzzle_type = /obj/effect/projectile/muzzle/heavy_laser
	impact_type = /obj/effect/projectile/impact/heavy_laser
	

	/obj/item/projectile/beam/laser/rifle/rcw
	name = "rapidfire laser beam"
	damage = 30
	wound_bonus = 30
	wound_falloff_tile = -3.5

/obj/item/projectile/beam/laser/rifle/rcw/hitscan
	name = "rapidfire laser beam"
	damage = 25
	wound_bonus = 25
	wound_falloff_tile = -3.5
	hitscan = TRUE


/obj/item/projectile/beam/laser/rifle/solar
	name = "solar scorcher beam"
	damage = 34
	wound_bonus = 27
	wound_falloff_tile = -3.5
	armour_penetration = 0.2

/obj/item/projectile/beam/laser/rifle/solar/hitscan
	name = "solar scorcher beam"
	damage = 29
	wound_bonus = 22
	wound_falloff_tile = -3.5
	armour_penetration = 0.2
	hitscan = TRUE


/obj/item/projectile/beam/laser/rifle/tribeam
	name = "tribeam laser"
	damage = 25
	wound_bonus = 21
	wound_falloff_tile = -3.5

/obj/item/projectile/beam/laser/rifle/tribeam/hitscan
	name = "tribeam laser"
	damage = 20
	hitscan = TRUE
	bare_wound_bonus = 16
	wound_falloff_tile = -3.5


/obj/item/projectile/beam/laser/rifle/aer9
	name = "laser beam"
	damage = 30
	wound_bonus = 30
	wound_falloff_tile = -4.5

 obj/item/projectile/beam/laser/rifle/aer9/hitscan
	name = "laser beam"
	damage = 25
	wound_bonus = 25
	wound_falloff_tile = -4.5
	hitscan = TRUE


/obj/item/projectile/beam/laser/rifle/aer12
	name = "laser beam"
	damage = 35
	wound_bonus = 35
	wound_falloff_tile = -4.5
	armour_penetration = 0.1

/obj/item/projectile/beam/laser/rifle/aer12/hitscan
	name = "laser beam"
	hitscan = TRUE
	damage = 30
	wound_bonus = 30
	wound_falloff_tile = -4.5


/obj/item/projectile/beam/laser/rifle/aer14
	name = "experimental laser beam"
	damage = 40
	wound_bonus = 40
	wound_falloff_tile = -4.5
	armour_penetration = 0.2
	icon_state = "xray"
	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser
	light_color = LIGHT_COLOR_GREEN

/obj/item/projectile/beam/laser/rifle/aer14/hitscan
    name = "experimental laser beam"
	hitscan = TRUE
	damage = 35
	wound_bonus = 35
	wound_falloff_tile = -4.5
	armour_penetration = 0.1
	icon_state = "xray"
	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser
	light_color = LIGHT_COLOR_GREEN


/obj/item/projectile/beam/laser/rifle/laer //bobnote, the reason why this is flagged as "energy" is because the LAER is considered a energy-based weapon.
	name = "advanced laser beam"
	flag = "energy"
	icon_state = "u_laser"
	damage = 45
	wound_bonus = 45
	wound_falloff_tile = -4.5
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE

/obj/item/projectile/beam/laser/rifle/laer/hitscan
	name = "advanced laser beam"
	flag = "energy"
	icon_state = "u_laser"
	damage = 40
	wound_bonus = 40
	wound_falloff_tile = -4.5
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE
	hitscan = TRUE



	``LASER-GATLING``



/obj/item/projectile/beam/laser/gatling
	name = "rapid-fire laser beam"
	damage = 25
	wound_bonus = 30
	wound_falloff_tile = -2.5

/obj/item/projectile/beam/laser/gatling/hitscan
	name = "laser beam"
	damage = 20
	wound_bonus = 25
	wound_falloff_tile = -2.5
	hitscan = TRUE



	``MOB``


//Securitrons Beam
/obj/item/projectile/beam/laser/ultraweak
	damage = 25
	wound_bonus = 20
	wound_falloff_tile = -1.5

/obj/item/projectile/beam/laser/lasgun/hitscan/focused
	name = "overcharged laser beam"
	damage = 34
	armour_penetration = 0.6



``PLASMA``



/obj/item/projectile/f13plasma
	name = "plasma bolt"
	icon_state = "plasma_clot"
	damage_type = BURN
	damage = 0
	flag = "energy"
	wound_bonus = 0
	wound_falloff_tile = 0
	is_reflectable = TRUE



	``PISTOL``



	/obj/item/projectile/f13plasma/pistol
	damage = 40
	wound_bonus = 40
	wound_falloff_tile = -4.5

/obj/item/projectile/f13plasma/pistol/worn
	damage = 35
	wound_bonus = 30
	wound_falloff_tile = -4.5

/obj/item/projectile/f13plasma/pistol/glock
	damage = 40
	wound_bonus = 30
	wound_falloff_tile = -4.5

	obj/item/projectile/f13plasma/pistol/alien
	name = "alien projectile"
	icon_state = "ion"
	damage = 70
	wound_bonus = 60
	wound_falloff_tile = -4.5
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_range = 2
	light_color = LIGHT_COLOR_BLUE


	/obj/item/projectile/f13plasma/scatter
	damage = 30
	wound_bonus = 35
	wound_falloff_tile = -4.5


	/obj/item/projectile/f13plasma/repeater
	name = "plasma stream"
	icon_state = "plasma_clot"
	damage_type = BURN
	damage = 40
	wound_bonus = 50
	wound_falloff_tile = -5.5
	flag = "energy" //checks vs. energy protection
	eyeblur = 0
	is_reflectable = FALSE


/obj/item/projectile/f13plasma/plasmamusket
	name = "plasma bolt"
	icon_state = "plasma_clot"
	damage = 55
	wound_bonus = 50
	wound_falloff_tile = -5.5
	is_reflectable = TRUE


/obj/item/projectile/f13plasma/repeater/mining
	name = "mining plasma stream"
	icon_state = "plasma_clot"
	damage_type = BURN
	damage = 5
	flag = "energy"
	is_reflectable = FALSE

/obj/item/projectile/f13plasma/repeater/mining/on_hit(atom/target)
	. = ..()
	if(ismineralturf(target))
		var/turf/closed/mineral/M = target
		M.gets_drilled(firer)



// BETA // Obsolete



/obj/item/projectile/beam/laser/pistol/lasertesting
	damage = 0

	/obj/item/projectile/beam/laser/ultra_pistol
	name = "laser beam"
	damage = 40
	armour_penetration = 0.35
	irradiate = 200

/obj/item/projectile/beam/laser/ultra_rifle
	name = "laser beam"
	damage = 45
	armour_penetration = 0.42
	irradiate = 200
