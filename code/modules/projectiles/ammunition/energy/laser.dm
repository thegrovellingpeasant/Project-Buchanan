	/obj/item/ammo_casing/energy/laser
	projectile_type = /obj/item/projectile/beam/laser
	select_name = "kill"

/obj/item/ammo_casing/energy/lasergun
	projectile_type = /obj/item/projectile/beam/laser
	e_cost = 83
	select_name = "kill"

/obj/item/ammo_casing/energy/lasergun/old
	projectile_type = /obj/item/projectile/beam/laser
	e_cost = 200
	select_name = "kill"

/obj/item/ammo_casing/energy/laser/hos
	e_cost = 100

/obj/item/ammo_casing/energy/laser/practice
	projectile_type = /obj/item/projectile/beam/practice
	select_name = "practice"
	harmful = FALSE

/obj/item/ammo_casing/energy/laser/scatter
	projectile_type = /obj/item/projectile/beam/scatter
	pellets = 5
	variance = 25
	select_name = "scatter"

/obj/item/ammo_casing/energy/laser/scatter/disabler
	projectile_type = /obj/item/projectile/beam/disabler
	pellets = 3
	variance = 15
	harmful = FALSE

/obj/item/ammo_casing/energy/laser/heavy
	projectile_type = /obj/item/projectile/beam/laser/heavylaser
	select_name = "anti-vehicle"
	fire_sound = 'sound/weapons/lasercannonfire.ogg'

/obj/item/ammo_casing/energy/laser/hellfire
	projectile_type = /obj/item/projectile/beam/laser/hellfire
	e_cost = 130
	select_name = "maim"

/obj/item/ammo_casing/energy/laser/pulse
	projectile_type = /obj/item/projectile/beam/pulse
	e_cost = 200
	select_name = "DESTROY"
	fire_sound = 'sound/weapons/pulse.ogg'

/obj/item/ammo_casing/energy/laser/bluetag
	projectile_type = /obj/item/projectile/beam/lasertag/bluetag
	select_name = "bluetag"
	harmful = FALSE

/obj/item/ammo_casing/energy/laser/bluetag/hitscan
	projectile_type = /obj/item/projectile/beam/lasertag/bluetag/hitscan

/obj/item/ammo_casing/energy/laser/redtag
	projectile_type = /obj/item/projectile/beam/lasertag/redtag
	select_name = "redtag"
	harmful = FALSE

/obj/item/ammo_casing/energy/laser/redtag/hitscan
	projectile_type = /obj/item/projectile/beam/lasertag/redtag/hitscan

/obj/item/ammo_casing/energy/laser/redtag/hitscan/holy
	projectile_type = /obj/item/projectile/beam/lasertag/redtag/hitscan/holy

/obj/item/ammo_casing/energy/laser/magtag
	projectile_type = /obj/item/projectile/beam/lasertag/mag
	select_name = "magtag"
	pellets = 3
	variance = 30
	e_cost = 1000
	fire_sound = 'sound/weapons/magburst.ogg'

/obj/item/ammo_casing/energy/xray
	projectile_type = /obj/item/projectile/beam/xray
	e_cost = 50
	fire_sound = 'sound/weapons/laser3.ogg'

/obj/item/ammo_casing/energy/mindflayer
	projectile_type = /obj/item/projectile/beam/mindflayer
	select_name = "MINDFUCK"
	fire_sound = 'sound/weapons/laser.ogg'

/*
---Fallout 13---
*/

/* here are the ammo sizes since nobody ever wrote these down
electron chargepack = 2400, this is currently only used in the RCW
mfc = 2000
ec = 1600

each one goes up by 4,000 power. why? nobody fucking knows lmao

also: most hitscan weapons have more charge than their normal projectile counterparts, since the actual projectiles are lower in damage and AP. this is to represent spammability.
*/

/obj/item/ammo_casing/energy/laser/rifle/tribeam
	projectile_type = /obj/item/projectile/beam/laser/rifle/tribeam
	pellets = 3
	variance = 33
	select_name = "scatter"
	e_cost = 200
	fire_sound = 'sound/f13weapons/tribeamfire.ogg'

/obj/item/ammo_casing/energy/laser/pistol/aer7
	projectile_type = /obj/item/projectile/beam/laser/pistol/aer7
	e_cost = 60
	fire_sound = 'sound/f13weapons/aep7fire.ogg'

/obj/item/ammo_casing/energy/laser/pistol/recharger
	projectile_type = /obj/item/projectile/beam/laser/pistol/recharger
	e_cost = 100
	fire_sound = 'sound/f13weapons/aep7fire.ogg'

/obj/item/ammo_casing/energy/laser/pistol/cmple
	projectile_type = /obj/item/projectile/beam/laser/pistol/cmple
	e_cost = 100
	harmful = FALSE

/obj/item/ammo_casing/energy/laser/pistol/wattz
	projectile_type = /obj/item/projectile/beam/laser/pistol/wattz
	e_cost = 100 //20 shots
	fire_sound = 'sound/f13weapons/aer9fire.ogg'

/obj/item/ammo_casing/energy/laser/pistol/wattz/magneto
	projectile_type = /obj/item/projectile/beam/laser/pistol/wattz/magneto
	e_cost = 100 //20 shots
	fire_sound = 'sound/f13weapons/aer9fire.ogg'

/obj/item/ammo_casing/energy/laser/rifle/aer9
	projectile_type = /obj/item/projectile/beam/laser/rifle/aer9
	e_cost = 100 //20 shots
	fire_sound = 'sound/f13weapons/aer9fire.ogg'

/obj/item/ammo_casing/energy/laser/rifle/solar //this gun will be horrible to fight against.
	projectile_type = /obj/item/projectile/beam/laser/rifle/solar
	e_cost = 30 //basically infinite shots
	fire_sound = 'sound/f13weapons/laser_pistol.ogg'

/obj/item/ammo_casing/energy/laser/rifle/rcw
	projectile_type = /obj/item/projectile/beam/laser/rifle/rcw
	e_cost = 70
	fire_sound = 'sound/f13weapons/rcwfire.ogg'

/obj/item/ammo_casing/energy/laser/gatling
	projectile_type = /obj/item/projectile/beam/laser/gatling
	e_cost = 10 //it's actually 240 shots now, as it fires in a burst of 5

/obj/item/ammo_casing/energy/laser/rifle/laer
	projectile_type = /obj/item/projectile/beam/laser/rifle/laer
	e_cost = 200 //16 shots
	fire_sound = 'sound/f13weapons/laerfire.ogg'
n

/obj/item/ammo_casing/energy/laser/rifle/aer14
	projectile_type = /obj/item/projectile/beam/laser/rifle/aer14
	e_cost = 200 //25 shots
	fire_sound = 'sound/f13weapons/aer14fire.ogg'

/obj/item/ammo_casing/energy/laser/rifle/aer12
	projectile_type = /obj/item/projectile/beam/laser/rifle/aer12
	e_cost = 150
	fire_sound = 'sound/f13weapons/aer9fire.ogg'

/obj/item/ammo_casing/energy/gammagun
	projectile_type = /obj/item/projectile/beam/gamma
	e_cost = 75
	fire_sound = 'sound/weapons/laser3.ogg'

/obj/item/ammo_casing/energy/laser/rifle/wattz2k
	projectile_type = /obj/item/projectile/beam/laser/rifle/wattz2k
	e_cost = 125


//musket

/obj/item/ammo_casing/energy/laser/rifle/musket
	projectile_type = /obj/item/projectile/beam/laser/rifle/musket
	e_cost = 250

//autolasers

/obj/item/ammo_casing/energy/laser/autolaser
	projectile_type = /obj/item/projectile/beam/laser/rifle/rcw
	e_cost = 500 //30 shots

/obj/item/ammo_casing/energy/laser/autolaser/shock
	projectile_type = /obj/item/projectile/energy/teslacannon/oasis
	fire_sound = 'sound/weapons/taser.ogg'
	e_cost = 500 //35 shots

// BETA // Obsolete
/obj/item/ammo_casing/energy/laser/pistol/lasertest
	projectile_type = /obj/item/projectile/beam/laser/pistol/lasertesting
