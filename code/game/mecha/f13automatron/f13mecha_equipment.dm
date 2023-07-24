
////////////////////
///// Weapons /////
///////////////////

///Innate

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/assaultron
	name = "\improper Assaultron eye laser"
	desc = "A laser weapon for assaultrons, fitted right into its head."
	icon_state = "mecha_laser"
	energy_drain = 50
	equip_cooldown = 100
	projectile = /obj/item/projectile/beam/laser/mech/light
	fire_sound = 'sound/weapons/laser.ogg'
	innate = TRUE

///Heavy

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/lmg/minigun
	name = "\improper Robot-fitted CZ53 minigun"
	desc = "A heavy ballistic minigun, fit for only the deadliest of machines."
	icon = 'icons/obj/guns/minigun.dmi'
	icon_state = "minigunbal"
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	projectile = /obj/item/projectile/bullet/m5mm/simple
	projectiles = 250
	projectiles_cache = 250
	projectiles_cache_max = 1000
	projectiles_per_shot = 4
	variance = 20
	randomspread = 1
	weapons_type = "Heavy"
	ammo_type = "minigun"
	harmful = TRUE

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/minigun
	name = "\improper Robot-fitted Gatling laser"
	desc = "A heavy gatling laser, fit for only the deadliest of machines."
	icon = 'icons/obj/guns/minigun.dmi'
	icon_state = "minigun"
	equip_cooldown = 10
	energy_drain = 100
	projectile = /obj/item/projectile/beam/laser/gatling/hitscan
	projectiles_per_shot = 4
	projectile_delay = 2
	variance = 20
	randomspread = 1
	fire_sound = 'sound/weapons/laser.ogg'
	weapons_type = "Heavy"
	harmful = TRUE

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/caster
	name = "\improper Robot-fitted Winchester P94 plasma caster"
	desc = "A heavy plasma caster, fit for only the deadliest of machines."
	icon = 'icons/obj/guns/energy.dmi'
	icon_state = "protolaser"
	equip_cooldown = 10
	energy_drain = 150
	projectile = /obj/item/projectile/f13plasma/repeater
	projectiles_per_shot = 3
	projectile_delay = 2
	variance = 20
	randomspread = 1
	fire_sound = 'sound/f13weapons/plasma_pistol.ogg'
	weapons_type = "Heavy"
	harmful = TRUE

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/f13
	name = "\improper Rocket rack"
	desc = "A shoulder-mounted heavy rocket rack, fit for only the deadliest of machines."
	projectile = /obj/item/projectile/bullet/a84mm_he_big
	weapons_type = "Heavy"
	ammo_type = "rocket"

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/flamethrower
	name = "\improper Robot-fitted Heavy flamethrower"
	desc = "A heavy flamethrower, fit for only the deadliest of machines."
	icon = 'icons/obj/guns/flamethrower.dmi'
	icon_state = "m2_flamethrower_back_unholstered"
	fire_sound = 'sound/weapons/flamethrower.ogg'
	equip_cooldown = 50
	projectile = /obj/item/projectile/incendiary/flamethrower/robot
	projectiles = 20
	projectiles_cache = 20
	projectiles_cache_max = 100
	projectiles_per_shot = 4
	variance = 50
	harmful = TRUE
	ammo_type = "flamethrower"
	weapons_type = "Heavy"

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/grenade_launcher
	name = "\improper Robot-fitted Heavy grenade launcher"
	desc = "A heavy grenade launcher, fit for only the deadliest of machines."
	icon = 'icons/obj/guns/energy.dmi'
	icon_state = "hellgun"
	fire_sound = 'sound/weapons/grenadelaunch.ogg'
	equip_cooldown = 40
	projectile = /obj/item/projectile/bullet/a40mm
	projectiles = 6
	projectiles_cache = 6
	projectiles_cache_max = 12
	harmful = TRUE
	ammo_type = "grenade"
	weapons_type = "Heavy"

///Medium

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/sniper
	name = "\improper Robot-fitted Wattz 2k"
	desc = "A laser sniper, fit for a deadly machine."
	icon = 'icons/obj/guns/energy.dmi'
	icon_state = "esniper"
	equip_cooldown = 30
	energy_drain = 100
	projectile = /obj/item/projectile/beam/laser/wattz2k/hitscan
	fire_sound = 'sound/weapons/lasercannonfire.ogg'
	harmful = TRUE
	weapons_type = "Medium"

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/rifle
	name = "\improper Robot-fitted AER9"
	desc = "A laser rifle, fit for a deadly machine."
	icon = 'icons/obj/guns/energy.dmi'
	icon_state = "lasercannon"
	equip_cooldown = 20
	energy_drain = 70
	projectile = /obj/item/projectile/beam/laser/lasgun/hitscan
	fire_sound = 'sound/f13weapons/aer9fire.ogg'
	harmful = TRUE
	weapons_type = "Medium"

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/plasma
	name = "\improper Robot-fitted Plasma rifle"
	desc = "A plasma rifle, fit for deadly machines."
	icon = 'icons/obj/guns/energy.dmi'
	icon_state = "xray"
	equip_cooldown = 25
	energy_drain = 100
	projectile = /obj/item/projectile/f13plasma
	fire_sound = 'sound/f13weapons/plasma_pistol.ogg'
	harmful = TRUE
	weapons_type = "Medium"

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/flamethrower/light
	name = "\improper Robot-fitted Light flamethrower"
	desc = "A light flamethrower, fit for deadly machines."
	icon = 'icons/obj/guns/flamethrower.dmi'
	icon_state = "m2_flamethrower_back_unholstered"
	equip_cooldown = 50
	projectile = /obj/item/projectile/incendiary/flamethrower/robot
	projectiles = 10
	projectiles_cache = 10
	projectiles_cache_max = 40
	projectiles_per_shot = 2
	variance = 25
	harmful = TRUE
	ammo_type = "flamethrower"
	weapons_type = "Medium"

///Light

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/pistol
	name = "\improper Robot-fitted AEP7"
	desc = "A laser pistol, fit for a deadly machine."
	icon = 'icons/obj/guns/energy.dmi'
	icon_state = "alienpistol"
	equip_cooldown = 8
	energy_drain = 40
	projectile = /obj/item/projectile/beam/laser/pistol/hitscan
	fire_sound = 'sound/f13weapons/aep7fire.ogg'
	harmful = TRUE
	weapons_type = "Light"

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/plasma/pistol
	name = "\improper Robot-fitted Plasma pistol"
	desc = "A plasma pistol, fit for deadly machines."
	icon = 'icons/obj/guns/energy.dmi'
	icon_state = "glock86a"
	equip_cooldown = 10
	energy_drain = 70
	projectile = /obj/item/projectile/f13plasma/pistol/glock
	fire_sound = 'sound/f13weapons/plasma_pistol.ogg'
	harmful = TRUE
	weapons_type = "Light"

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/pistol
	name = "\improper Robot-fitted 10mm pistol"
	desc = "A 10mm pistol, fit for deadly machines."
	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "gyropistolloaded"
	fire_sound = 'sound/f13weapons/10mm_fire_02.ogg'
	equip_cooldown = 5
	projectile = /obj/item/projectile/bullet/c10mm/simple
	projectiles = 12
	projectiles_cache = 24
	projectiles_cache_max = 60
	harmful = TRUE
	ammo_type = "pistol"
	weapons_type = "Light"

///Melee

/obj/item/mecha_parts/mecha_equipment/weapon/melee
	weapons_type = "Melee"
	range = MELEE
	equip_cooldown = 40
	var/dam_force = 20

/obj/item/mecha_parts/mecha_equipment/weapon/melee/action(atom/target)
	if(equip_ready)
		if(ismecha(target))
			var/obj/mecha/M = target
			M.take_damage(dam_force * chassis.melee_multiplier)
			playsound(src, hitsound, 50)
			start_cooldown()
			target.visible_message("<span class='danger'>[chassis] attacks [target] with the [src]!</span>", \
								"<span class='userdanger'>[chassis] attacks [target] with the [src]!</span>")
			log_combat(chassis.occupant, M, "attacked", "[name]", "(INTENT: [uppertext(chassis.occupant.a_intent)]) (DAMTYE: [uppertext(damtype)])")
			return 1
		if(isliving(target))
			var/mob/living/M = target
			if(M.stat == DEAD)
				return
			M.take_overall_damage(dam_force * chassis.melee_multiplier)
			if(!M)
				return
			M.updatehealth()
			playsound(src, hitsound, 50)
			start_cooldown()
			target.visible_message("<span class='danger'>[chassis] attacks [target] with the [src]!</span>", \
								"<span class='userdanger'>[chassis] attacks [target] with the [src]!</span>")
			log_combat(chassis.occupant, M, "attacked", "[name]", "(INTENT: [uppertext(chassis.occupant.a_intent)]) (DAMTYE: [uppertext(damtype)])")
			return 1
		if(istype(target, /obj/structure))
			var/obj/structure/W = target
			W.take_damage(((dam_force * chassis.melee_multiplier) * 2), BRUTE, "melee", 0)
			playsound(src, hitsound, 50)
			start_cooldown()

/obj/item/mecha_parts/mecha_equipment/weapon/melee/saw
	name = "\improper Robot-fitted Buzzsaw"
	desc = "A buzzsaw, fit for deadly machines."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "saw"
	dam_force = 15
	hitsound = 'sound/weapons/circsawhit.ogg'
	harmful = TRUE

/obj/item/mecha_parts/mecha_equipment/weapon/melee/hammer
	name = "\improper Robot-fitted Sledgehammer"
	desc = "A sledgehammer, fit for deadly machines."
	icon = 'icons/fallout/objects/melee/twohanded.dmi'
	icon_state = "hammer-rocket"
	dam_force = 20
	hitsound = "sound/f13effects/explosion_distant_2.ogg"
	harmful = TRUE


////////////////////
///// Utility /////
///////////////////

/obj/item/mecha_parts/mecha_equipment/hydraulic_clamp/f13
	name = "Hand clamp"
	desc = "A handy clamp, useful for robots to pick up and drop things. It can also load objects into their storage departments."
	innate = TRUE

/obj/item/mecha_parts/mecha_equipment/medical/mechmedbeam/f13
	name = "medical beamgun"
	desc = "Equipment fitted for robots. Generates a focused beam of medical nanites."

/obj/item/mecha_parts/mecha_equipment/drill/f13
	name = "robot drill"
	desc = "Equipment fitted for mining robots. And maybe some light bludgeoning."

/obj/item/mecha_parts/mecha_equipment/drill/diamonddrill/f13
	name = "diamond-tipped robot drill"
	desc = "Equipment fitted for mining robots. And maybe some moderate bludgeoning, with its diamond tip."

/obj/item/mecha_parts/mecha_equipment/mining_scanner/f13
	name = "robot mining scanner"
	desc = "Equipment fitted for mining robots. It will automatically check surrounding rock for useful minerals."

/obj/item/mecha_parts/mecha_equipment/anticcw_armor_booster/f13
	name = "armor booster module (Close Combat Weaponry)"
	desc = "Boosts armor against armed melee attacks. Requires energy to operate."
	energy_drain = 200

/obj/item/mecha_parts/mecha_equipment/antiproj_armor_booster/f13
	name = "armor booster module (Ranged Weaponry)"
	desc = "Boosts armor against ranged attacks. Requires energy to operate."
	energy_drain = 200

/obj/item/mecha_parts/mecha_equipment/repair_droid/f13
	name = "repair eyebot"
	desc = "An automated repair eyebot for robots. Scans for damage and repairs it. Can fix almost all types of external or internal damage."
	energy_drain = 200

/obj/item/mecha_parts/mecha_equipment/extinguisher/f13
	name = "robot fire extinguisher"
	desc = "Equipment for general purpose robots. A rapid-firing high capacity fire extinguisher."

/obj/item/mecha_parts/mecha_equipment/rcd/f13
	name = "mounted RCD"
	desc = "Equipment for construction robots. A shoulder-mounted Rapid Construction Device."

////////////////
///// Ammo /////
////////////////

/obj/item/mecha_ammo/flamethrower
	name = "flamethrower fuel (small)"
	desc = "A box of flamethrower fuel, ready for loading into a flamethrower."
	icon_state = "flashbang"
	round_term = "fuel"
	rounds = 20
	ammo_type = "flamethrower"

/obj/item/mecha_ammo/flamethrower/large
	name = "flamethrower fuel (large)"
	desc = "A large box of flamethrower fuel, ready for loading into a flamethrower."
	rounds = 40

/obj/item/mecha_ammo/pistol
	name = "10mm ammo"
	desc = "A box of 10mm ammunition, ready for loading into a pistol."
	icon_state = "lmg"
	rounds = 36
	ammo_type = "pistol"

/obj/item/mecha_ammo/minigun
	name = "5mm ammo"
	desc = "A box of 5mm ammunition, ready for loading into a minigun."
	icon_state = "clusterbang"
	rounds = 350
	ammo_type = "minigun"

/obj/item/mecha_ammo/rockets
	name = "rockets"
	desc = "A large box of rockets, ready for loading into a rocket rack."
	icon_state = "missile_br"
	rounds = 6
	round_term = "rocket"
	direct_load = TRUE
	load_audio = "sound/weapons/bulletinsert.ogg"
	ammo_type = "rocket"

/obj/item/mecha_ammo/grenades
	name = "40mm grenades"
	desc = "A box of 40mm grenades, ready for loading into a grenade launcher."
	icon_state = "incendiary"
	rounds = 8
	round_term = "grenade"
	load_audio = "sound/weapons/bulletinsert.ogg"
	ammo_type = "grenade"

