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




/obj/item/projectile/beam/laser/mech
	hitscan = TRUE
	wound_bonus = 0

// Low energy drain and cooldown
/obj/item/projectile/beam/laser/mech/light
	name = "laser beam"
	damage = 30
	armour_penetration = 0.1

// More energy drain and higher cooldown
/obj/item/projectile/beam/laser/mech/heavy
	name = "heavy laser beam"
	damage = 40
	armour_penetration = 0.2
	tracer_type = /obj/effect/projectile/tracer/heavy_laser
	muzzle_type = /obj/effect/projectile/muzzle/heavy_laser
	impact_type = /obj/effect/projectile/impact/heavy_laser

// The highest energy drain and cooldown
/obj/item/projectile/beam/laser/mech/pulse
	name = "charged pulse beam"
	damage = 49
	armour_penetration = 0.3
	tracer_type = /obj/effect/projectile/tracer/pulse
	muzzle_type = /obj/effect/projectile/muzzle/pulse
	impact_type = /obj/effect/projectile/impact/pulse

//overclocked laser, does a bit more damage but has much higher wound power (-0 vs -20)
/obj/item/projectile/beam/laser/hellfire
	name = "hellfire laser"
	wound_bonus = 0
	damage = 25

/obj/item/projectile/beam/laser/hellfire/Initialize()
	. = ..()
	transform *= 2



/obj/item/projectile/beam/practice
	name = "practice laser"
	damage = 0
	nodamage = 1


/obj/item/projectile/beam/xray
	name = "\improper X-ray beam"
	icon_state = "xray"
	damage = 15
	irradiate = 300
	range = 15
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE | PASSCLOSEDTURF

	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser
	light_color = LIGHT_COLOR_GREEN
	tracer_type = /obj/effect/projectile/tracer/xray
	muzzle_type = /obj/effect/projectile/muzzle/xray
	impact_type = /obj/effect/projectile/impact/xray


	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser
	light_color = LIGHT_COLOR_GREEN
	tracer_type = /obj/effect/projectile/tracer/xray
	muzzle_type = /obj/effect/projectile/muzzle/xray
	impact_type = /obj/effect/projectile/impact/xray

/obj/item/projectile/beam/disabler
	name = "disabler beam"
	icon_state = "omnilaser"
	damage = 28 // Citadel change for balance from 36
	damage_type = STAMINA
	flag = "energy"
	hitsound = 'sound/weapons/tap.ogg'
	eyeblur = 0
	pixels_per_second = TILES_TO_PIXELS(16.667)
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE
	tracer_type = /obj/effect/projectile/tracer/disabler
	muzzle_type = /obj/effect/projectile/muzzle/disabler
	impact_type = /obj/effect/projectile/impact/disabler

/obj/item/projectile/beam/pulse
	name = "pulse"
	icon_state = "u_laser"
	damage = 50
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE
	tracer_type = /obj/effect/projectile/tracer/pulse
	muzzle_type = /obj/effect/projectile/muzzle/pulse
	impact_type = /obj/effect/projectile/impact/pulse
	wound_bonus = 10

/obj/item/projectile/beam/pulse/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if (!QDELETED(target) && (isturf(target) || istype(target, /obj/structure/)))
		target.ex_act(EXPLODE_HEAVY)

/obj/item/projectile/beam/pulse/shotgun
	damage = 40

/obj/item/projectile/beam/pulse/heavy
	name = "heavy pulse laser"
	icon_state = "pulse1_bl"
	var/life = 20

/obj/item/projectile/beam/pulse/heavy/on_hit(atom/target, blocked = FALSE)
	life -= 10
	if(life > 0)
		. = BULLET_ACT_FORCE_PIERCE
	return ..()

/obj/item/projectile/beam/emitter
	name = "emitter beam"
	icon_state = "emitter"
	damage = 30
	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser
	light_color = LIGHT_COLOR_GREEN
	wound_bonus = -40
	bare_wound_bonus = 70

/obj/item/projectile/beam/emitter/singularity_pull()
	return

/obj/item/projectile/beam/emitter/hitscan
	hitscan = TRUE
	muzzle_type = /obj/effect/projectile/muzzle/laser/emitter
	tracer_type = /obj/effect/projectile/tracer/laser/emitter
	impact_type = /obj/effect/projectile/impact/laser/emitter
	impact_effect_type = null

/obj/item/projectile/beam/lasertag
	name = "laser tag beam"
	icon_state = "omnilaser"
	hitsound = null
	damage = 0
	damage_type = STAMINA
	flag = "laser"
	var/suit_types = list(/obj/item/clothing/suit/redtag, /obj/item/clothing/suit/bluetag)
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE

/obj/item/projectile/beam/lasertag/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/M = target
		if(istype(M.wear_suit))
			if(M.wear_suit.type in suit_types)
				M.adjustStaminaLoss(34)

/obj/item/projectile/beam/lasertag/mag		//the projectile, compatible with regular laser tag armor
	icon_state = "magjectile-toy"
	name = "lasertag magbolt"
	movement_type = FLYING | UNSTOPPABLE		//for penetration memes
	range = 5		//so it isn't super annoying
	light_range = 2
	light_color = LIGHT_COLOR_YELLOW
	eyeblur = 0

/obj/item/projectile/beam/lasertag/redtag
	icon_state = "laser"
	suit_types = list(/obj/item/clothing/suit/bluetag)
	impact_effect_type = /obj/effect/temp_visual/impact_effect/red_laser
	light_color = LIGHT_COLOR_RED
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

/obj/item/projectile/beam/lasertag/redtag/hitscan
	hitscan = TRUE

/obj/item/projectile/beam/lasertag/redtag/hitscan/holy
	name = "lasrifle beam"
	damage = 0.1
	damage_type = BURN

/obj/item/projectile/beam/lasertag/bluetag
	icon_state = "bluelaser"
	suit_types = list(/obj/item/clothing/suit/redtag)
	tracer_type = /obj/effect/projectile/tracer/laser/blue
	muzzle_type = /obj/effect/projectile/muzzle/laser/blue
	impact_type = /obj/effect/projectile/impact/laser/blue

/obj/item/projectile/beam/lasertag/bluetag/hitscan
	hitscan = TRUE

/obj/item/projectile/beam/instakill
	name = "instagib laser"
	icon_state = "purple_laser"
	damage = 200
	damage_type = BURN
	impact_effect_type = /obj/effect/temp_visual/impact_effect/purple_laser
	light_color = LIGHT_COLOR_PURPLE

/obj/item/projectile/beam/instakill/blue
	icon_state = "blue_laser"
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE

/obj/item/projectile/beam/instakill/red
	icon_state = "red_laser"
	impact_effect_type = /obj/effect/temp_visual/impact_effect/red_laser
	light_color = LIGHT_COLOR_RED

/obj/item/projectile/beam/instakill/on_hit(atom/target)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.visible_message("<span class='danger'>[M] explodes into a shower of gibs!</span>")
		M.gib()

//a shrink ray that shrinks stuff, which grows back after a short while.
/obj/item/projectile/beam/shrink
	name = "shrink ray"
	icon_state = "blue_laser"
	hitsound = 'sound/weapons/shrink_hit.ogg'
	damage = 0
	damage_type = STAMINA
	flag = "energy"
	impact_effect_type = /obj/effect/temp_visual/impact_effect/shrink
	light_color = LIGHT_COLOR_BLUE
	var/shrink_time = 90

/obj/item/projectile/beam/shrink/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(isopenturf(target) || istype(target, /turf/closed/indestructible))//shrunk floors wouldnt do anything except look weird, i-walls shouldnt be bypassable
		return
	target.AddComponent(/datum/component/shrink, shrink_time)


// BETA // Obsolete
/obj/item/projectile/beam/laser/pistol/lasertesting //Wattz pistol
	damage = 25
