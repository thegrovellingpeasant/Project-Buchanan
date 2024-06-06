/obj/item/projectile/beam
	name = "laser"
	icon_state = "laser"
	pass_flags = PASSTABLE| PASSGLASS
	damage = 0
	light_range = 2
	damage_type = BURN
	hitsound = 'sound/weapons/sear.ogg'
	hitsound_wall = 'sound/weapons/effects/searwall.ogg'
	flag = "laser"
	eyeblur = 2
	impact_effect_type = /obj/effect/temp_visual/impact_effect/red_laser
	light_color = LIGHT_COLOR_RED
	ricochets_max = 50	//Honk!
	ricochet_chance = 80
	is_reflectable = TRUE
	wound_bonus = 0
	bare_wound_bonus = 0



/obj/item/projectile/beam/laser/pistol
	name = "laser beam"
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

	/obj/item/projectile/beam/laser/rifle
	tracer_type = /obj/effect/projectile/tracer/heavy_laser
	muzzle_type = /obj/effect/projectile/muzzle/heavy_laser
	impact_type = /obj/effect/projectile/impact/heavy_laser

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

/obj/item/projectile/beam/laser/heavylaser
	name = "heavy laser"
	icon_state = "heavylaser"
	damage = 40
	tracer_type = /obj/effect/projectile/tracer/heavy_laser
	muzzle_type = /obj/effect/projectile/muzzle/heavy_laser
	impact_type = /obj/effect/projectile/impact/heavy_laser

/obj/item/projectile/beam/laser/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.IgniteMob()
	else if(isturf(target))
		impact_effect_type = /obj/effect/temp_visual/impact_effect/red_laser/wall

/obj/item/projectile/beam/weak
	damage = 25
	armour_penetration = 0.1

/obj/item/projectile/beam/disabler
	name = "disabler beam"
	icon_state = "omnilaser"
	damage = 0 //nobody should have a gun like this anyway lol
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

/obj/item/projectile/beam/weak/penetrator
	armour_penetration = 0.35

/obj/item/projectile/beam/practice
	name = "practice laser"
	damage = 0
	nodamage = 1

/obj/item/projectile/beam/scatter
	name = "laser pellet"
	icon_state = "scatterlaser"
	damage = 12.5

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
	name = "agereggorray"
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



	//FO13

	//PISTOL

/obj/item/projectile/beam/laser/pistol/aer7
	damage = 25
	wound_bonus = 20
	wound_falloff_tile = -3.5

/obj/item/projectile/beam/laser/pistol/aer7/hitscan
	damage = 20
	wound_bonus = 15
	wound_falloff_tile = -3.5
	hitscan = TRUE

/obj/item/projectile/beam/laser/pistol/wattz
	damage = 20
	wound_bonus = 15
	wound_falloff_tile = -3.5

/obj/item/projectile/beam/laser/pistol/wattz/hitscan
	damage = 15
	wound_bonus = 10
	wound_falloff_tile = -2
	hitscan = TRUE

/obj/item/projectile/beam/laser/pistol/wattz/magneto
	name = "penetrating laser beam"
	damage = 28
	wound_bonus = 10
	wound_falloff_tile = -2
	armour_penetration = 0.1

/obj/item/projectile/beam/laser/pistol/wattz/magneto/hitscan
	name = "penetrating laser beam"
	damage = 23
	wound_bonus = 10
	wound_falloff_tile = -2
	armour_penetration = 0.1
	hitscan = TRUE

/obj/item/projectile/beam/laser/pistol/recharger
	name = "recharger beam"
	damage = 25
	wound_bonus = 20
	wound_falloff_tile = -3.5
	light_color = LIGHT_COLOR_BLUE

/obj/item/projectile/beam/laser/pistol/recharger/hitscan
	damage = 20
	wound_bonus = 15
	wound_falloff_tile = -3.5
	hitscan = TRUE

/obj/item/projectile/beam/laser/pistol/cmple
	name = "compliance beam"
	damage = 45
	damage_type = STAMINA
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE
	tracer_type = /obj/effect/projectile/tracer/disabler
	muzzle_type = /obj/effect/projectile/muzzle/disabler
	impact_type = /obj/effect/projectile/impact/disabler

/obj/item/projectile/beam/gamma
	name = "gamma beam"
	icon_state = "xray"
	damage = 10
	flag = "energy"
	armour_penetration = 1 //gamma gun always sucked, so this should make it real good.
	damage_type = "toxin"
	irradiate = 1000 //instant cancer
	range = 15
	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser
	light_color = LIGHT_COLOR_GREEN
	tracer_type = /obj/effect/projectile/tracer/xray
	muzzle_type = /obj/effect/projectile/muzzle/xray
	impact_type = /obj/effect/projectile/impact/xray

//Securitrons Beam
/obj/item/projectile/beam/laser/pistol/ultraweak
	damage = 25
	wound_bonus = 25
	wound_falloff_tile = -5


	//RIFLE

/obj/item/projectile/beam/laser/rifle/musket
	name = "laser bolt"
	damage = 40
	wound_bonus = 35
	wound_falloff_tile = -5

/obj/item/projectile/beam/laser/rifle/musket/hitscan
	damage = 35
	wound_bonus = 30
	wound_falloff_tile = -5
	hitscan = TRUE

/obj/item/projectile/beam/laser/rifle/wattz2k
	name = "laser bolt"
	damage = 35
	wound_bonus = 25
	wound_falloff_tile = -2.5

/obj/item/projectile/beam/laser/rifle/wattz2k/hitscan
	damage = 30
	wound_bonus = 20
	wound_falloff_tile = -2.5
	hitscan = TRUE

/obj/item/projectile/beam/laser/rifle/solar
	name = "solar scorcher beam"
	damage = 34
	wound_bonus = 27
	wound_falloff_tile = -3.5
	armour_penetration = 0.2

/obj/item/projectile/beam/laser/rifle/aer9
	name = "laser beam"
	damage = 30
	wound_bonus = 25
	wound_falloff_tile = -5

/obj/item/projectile/beam/laser/rifle/aer9/hitscan
	damage = 25
	wound_bonus = 20
	wound_falloff_tile = -5
	hitscan = TRUE

/obj/item/projectile/beam/laser/rifle/aer12
	name = "laser beam"
	damage = 35
	wound_bonus = 30
	wound_falloff_tile = -5

/obj/item/projectile/beam/laser/rifle/aer12/hitscan
	name = "laser beam"
	damage = 30
	wound_bonus = 25
	wound_falloff_tile = -5
	hitscan = TRUE

/obj/item/projectile/beam/laser/rifle/aer14
	name = "laser beam"
	damage = 40
	wound_bonus = 35
	wound_falloff_tile = -4
	icon_state = "xray"
	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser
	light_color = LIGHT_COLOR_GREEN

/obj/item/projectile/beam/laser/rifle/aer14/hitscan
	damage = 35
	wound_bonus = 30
	wound_falloff_tile = -4
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/xray
	muzzle_type = /obj/effect/projectile/muzzle/xray
	impact_type = /obj/effect/projectile/impact/xray
	hitscan_light_intensity = 3
	hitscan_light_range = 0.75
	hitscan_light_color_override = COLOR_LIME
	muzzle_flash_intensity = 6
	muzzle_flash_range = 2
	muzzle_flash_color_override = COLOR_LIME
	impact_light_intensity = 7
	impact_light_range = 2.5
	impact_light_color_override = COLOR_LIME

/obj/item/projectile/beam/laser/rifle/rcw
	name = "rapidfire beam"
	damage = 25
	wound_bonus = 25
	wound_falloff_tile = -5

/obj/item/projectile/beam/laser/rifle/rcw/hitscan
	name = "rapidfire beam"
	damage = 20
	wound_bonus = 20
	wound_falloff_tile = -3
	hitscan = TRUE

/obj/item/projectile/beam/laser/rifle/tribeam
	name = "tribeam laser" //the tribeam was actually cracked before, fucking 25 damage, 3 "shells" and also hitscan, someone must've been a BOS main
	damage = 21 
	wound_bonus = 15
	wound_falloff_tile = -5

/obj/item/projectile/beam/laser/tribeam/hitscan
	name = "tribeam laser"
	damage = 16
	wound_bonus = 10
	wound_falloff_tile = -5
	hitscan = TRUE

/obj/item/projectile/beam/laser/rifle/laer //elder GODS
	name = "advanced laser beam"
	icon_state = "u_laser"
	damage = 45
	wound_bonus = 40
	wound_falloff_tile = -5
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE

/obj/item/projectile/beam/laser/laer/hitscan
	damage = 40
	wound_bonus = 35
	wound_falloff_tile = -5
	hitscan = TRUE


//LASERGATLING

/obj/item/projectile/beam/laser/gatling
	name = "laser beam"
	damage = 28
	wound_bonus = 27
	wound_falloff_tile = -4
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

/obj/item/projectile/beam/laser/gatling/hitscan
	damage = 12




//Plasma




//Rifle/Scatter

/obj/item/projectile/f13plasma
	name = "plasma bolt"
	icon_state = "plasma_clot"
	damage_type = BURN
	damage = 60 //fucc you normies
	armour_penetration = 0 //no AP, armor shouldnt have more than 20 resist against plasma unless its specialized
	flag = "energy" //checks vs. energy protection
	wound_bonus = 45 //being hit with plasma is horrific
	wound_falloff_tile = -5
	eyeblur = 0
	is_reflectable = TRUE
	pixels_per_second =  TILES_TO_PIXELS(10)

/obj/item/projectile/f13plasma/scatter //Multiplas, fires 3 shots, will melt you
	damage = 30 //uhm, sir, 90 damage is already served


/obj/item/projectile/f13plasma/repeater //multiple mobs use this, don't remove it
	name = "plasma stream"
	damage = 60
	wound_bonus = 45 //being hit with plasma is horrific
	wound_falloff_tile = -5
	flag = "energy" //checks vs. energy protection
	eyeblur = 0
	is_reflectable = FALSE

/obj/item/projectile/f13plasma/repeater/mining
	name = "mining plasma stream"
	damage = 5
	flag = "energy"
	eyeblur = 0
	is_reflectable = FALSE

/obj/item/projectile/f13plasma/repeater/mining/on_hit(atom/target)
	. = ..()
	if(ismineralturf(target))
		var/turf/closed/mineral/M = target
		M.gets_drilled(firer)

//plasma caster
/obj/item/projectile/f13plasma/plasmamusket
	name = "plasma bolt"
	damage = 50
	wound_bonus = 35
	wound_falloff_tile = -5
	pixels_per_second = TILES_TO_PIXELS(50)

//Frank's plasmacaster
/obj/item/projectile/f13plasma/frank
	name = "plasma bolt"
	damage = 60
	wound_bonus = 60
	wound_falloff_tile = -5
	armour_penetration = 1
	pixels_per_second = TILES_TO_PIXELS(50)

	//Pistol

/obj/item/projectile/f13plasma/pistol
	damage = 50
	wound_bonus = 35
	wound_falloff_tile = -5

/obj/item/projectile/f13plasma/pistol/worn
	damage = 40
	wound_bonus = 25
	wound_falloff_tile = -5

/obj/item/projectile/f13plasma/pistol/glock //Glock (streamlined plasma pistol)
	damage = 55
	wound_bonus = 40
	wound_falloff_tile = -5

/obj/item/projectile/f13plasma/pistol/alien
	name = "alien projectile"
	icon_state = "ion"
	damage = 110 //this should never be spawned in.
	wound_bonus = 100
	armour_penetration = 1
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_range = 2
	light_color = LIGHT_COLOR_BLUE










// BETA // Obsolete
/obj/item/projectile/beam/laser/pistol/lasertesting //Wattz pistol
	damage = 25
