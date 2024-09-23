/datum/design/robot_posibrain
	name = "Personality Computational Matrix"
	desc = "A relative upgrade in intelligence for robots compared to their counterparts in the wastes."
	id = "robot_posi"
	build_type = PROTOLATHE | MECHFAB
	materials = list(/datum/material/iron = 1700, /datum/material/glass = 1350, /datum/material/gold = 500) //Gold, because SWAG.
	construction_time = 75
	build_path = /obj/item/mmi/posibrain/f13
	category = list("Misc", "Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

//////////////////////
///// Protectron /////
//////////////////////

/datum/design/board/protectron_main
	name = "Protectron Central Control module"
	desc = "Allows for the construction of a Protectron Central Control module."
	id = "protectron_main"
	build_path = /obj/item/circuitboard/mecha/protectron/main
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/protectron_peri
	name = "Protectron Peripherals Control module"
	desc = "Allows for the construction of a Protectron Peripheral Control module."
	id = "protectron_peri"
	build_path = /obj/item/circuitboard/mecha/protectron/peripherals
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/protectron_targ
	name = "Protectron Weapons & Targeting Control module"
	desc = "Allows for the construction of a Protectron Weapons & Targeting Control module."
	id = "protectron_targ"
	build_path = /obj/item/circuitboard/mecha/protectron/targeting
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/protectron_chassis
	name = "Robot Chassis (Protectron)"
	id = "protectron_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/f13/protectron
	materials = list(/datum/material/iron=15000,/datum/material/uranium=4000)
	construction_time = 100
	category = list("Protectron")

/datum/design/protectron_head
	name = "Robot Head (Protectron)"
	id = "protectron_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/protectron_head
	materials = list(/datum/material/iron=10000,/datum/material/glass=5000)
	construction_time = 200
	category = list("Protectron")

/datum/design/protectron_torso
	name = "Robot Torso (Protectron)"
	id = "protectron_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/protectron_torso
	materials = list(/datum/material/iron=15000,/datum/material/glass=5000,/datum/material/uranium=6000)
	construction_time = 200
	category = list("Protectron")

/datum/design/protectron_left_arm
	name = "Robot Left Arm (Protectron)"
	id = "protectron_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/protectron_left_arm
	materials = list(/datum/material/iron=75000)
	construction_time = 150
	category = list("Protectron")

/datum/design/protectron_right_arm
	name = "Robot Right Arm (Protectron)"
	id = "protectron_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/protectron_right_arm
	materials = list(/datum/material/iron=75000)
	construction_time = 150
	category = list("Protectron")

/datum/design/protectron_left_leg
	name = "Robot Left Leg (Protectron)"
	id = "protectron_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/protectron_left_leg
	materials = list(/datum/material/iron=75000)
	construction_time = 150
	category = list("Protectron")

/datum/design/protectron_right_leg
	name = "Robot Right Leg (Protectron)"
	id = "protectron_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/protectron_right_leg
	materials = list(/datum/material/iron=7500)
	construction_time = 150
	category = list("Protectron")

///////////////////////
///// Gutsy Mk II /////
///////////////////////

/datum/design/board/gutsy_main
	name = "Gutsy Mk II Central Control module"
	desc = "Allows for the construction of a Gutsy Mk II Central Control module."
	id = "gutsy_main"
	build_path = /obj/item/circuitboard/mecha/gutsy/main
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/gutsy_peri
	name = "Gutsy Mk II Peripherals Control module"
	desc = "Allows for the construction of a Gutsy Mk II Peripheral Control module."
	id = "gutsy_peri"
	build_path = /obj/item/circuitboard/mecha/gutsy/peripherals
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/gutsy_targ
	name = "Gutsy Mk II Weapons & Targeting Control module"
	desc = "Allows for the construction of a Gutsy Mk II Weapons & Targeting Control module."
	id = "gutsy_targ"
	build_path = /obj/item/circuitboard/mecha/gutsy/targeting
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/gutsy_chassis
	name = "Robot Chassis (Gutsy Mk II)"
	id = "gutsy_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/f13/gutsy
	materials = list(/datum/material/iron=15000,/datum/material/uranium=12000,/datum/material/silver=4000)
	construction_time = 100
	category = list("Gutsy Mk II")

/datum/design/gutsy_head
	name = "Robot Head (Gutsy Mk II)"
	id = "gutsy_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/gutsy_head
	materials = list(/datum/material/iron=10000,/datum/material/glass=5000,/datum/material/silver=4000)
	construction_time = 200
	category = list("Gutsy Mk II")

/datum/design/gutsy_torso
	name = "Robot Torso (Gutsy Mk II)"
	id = "gutsy_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/gutsy_torso
	materials = list(/datum/material/iron=15000,/datum/material/glass=5000,/datum/material/uranium=8000,/datum/material/gold=4000)
	construction_time = 200
	category = list("Gutsy Mk II")

/datum/design/gutsy_left_arm
	name = "Robot Left Arm (Gutsy Mk II)"
	id = "gutsy_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/gutsy_left_arm
	materials = list(/datum/material/iron=10000)
	construction_time = 150
	category = list("Gutsy Mk II")

/datum/design/gutsy_right_arm
	name = "Robot Right Arm (Gutsy Mk II)"
	id = "gutsy_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/gutsy_right_arm
	materials = list(/datum/material/iron=10000)
	construction_time = 150
	category = list("Gutsy Mk II")

/datum/design/gutsy_left_leg
	name = "Robot Left Leg (Gutsy Mk II)"
	id = "gutsy_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/gutsy_left_leg
	materials = list(/datum/material/iron=10000)
	construction_time = 150
	category = list("Gutsy Mk II")

/datum/design/gutsy_right_leg
	name = "Robot Right Leg (Gutsy Mk II)"
	id = "gutsy_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/gutsy_right_leg
	materials = list(/datum/material/iron=10000)
	construction_time = 150
	category = list("Gutsy Mk II")

///////////////////////
///// Assaultron /////
///////////////////////

/datum/design/board/assaultron_main
	name = "Assaultron Central Control module"
	desc = "Allows for the construction of a Assaultron Central Control module."
	id = "assaultron_main"
	build_path = /obj/item/circuitboard/mecha/assaultron/main
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/assaultron_peri
	name = "Assaultron Peripherals Control module"
	desc = "Allows for the construction of a Assaultron Peripheral Control module."
	id = "assaultron_peri"
	build_path = /obj/item/circuitboard/mecha/assaultron/peripherals
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/assaultron_targ
	name = "Assaultron Weapons & Targeting Control module"
	desc = "Allows for the construction of a Assaultron Weapons & Targeting Control module."
	id = "assaultron_targ"
	build_path = /obj/item/circuitboard/mecha/assaultron/targeting
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/assaultron_chassis
	name = "Robot Chassis (Assaultron)"
	id = "assaultron_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/f13/assaultron
	materials = list(/datum/material/iron=20000,/datum/material/uranium=10000,/datum/material/gold=6000,/datum/material/titanium=10000)
	construction_time = 100
	category = list("Assaultron")

/datum/design/assaultron_head
	name = "Robot Head (Assaultron)"
	id = "assaultron_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/assaultron_head
	materials = list(/datum/material/iron=10000,/datum/material/glass=2500,/datum/material/silver=2000)
	construction_time = 200
	category = list("Assaultron")

/datum/design/assaultron_torso
	name = "Robot Torso (Assaultron)"
	id = "assaultron_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/assaultron_torso
	materials = list(/datum/material/iron=20000,/datum/material/glass=7500,/datum/material/titanium=20000,/datum/material/gold=14000,/datum/material/uranium=10000)
	construction_time = 200
	category = list("Assaultron")

/datum/design/assaultron_left_arm
	name = "Robot Left Arm (Assaultron)"
	id = "assaultron_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/assaultron_left_arm
	materials = list(/datum/material/iron=12500)
	construction_time = 150
	category = list("Assaultron")

/datum/design/assaultron_right_arm
	name = "Robot Right Arm (Assaultron)"
	id = "assaultron_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/assaultron_right_arm
	materials = list(/datum/material/iron=12500)
	construction_time = 150
	category = list("Assaultron")

/datum/design/assaultron_left_leg
	name = "Robot Left Leg (Assaultron)"
	id = "assaultron_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/assaultron_left_leg
	materials = list(/datum/material/iron=12500)
	construction_time = 150
	category = list("Assaultron")

/datum/design/assaultron_right_leg
	name = "Robot Right Leg (Assaultron)"
	id = "assaultron_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/assaultron_right_leg
	materials = list(/datum/material/iron=12500)
	construction_time = 150
	category = list("Assaultron")

/datum/design/assaultron_armor
	name = "Robot Armor (Assaultron)"
	id = "assaultron_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/assaultron_armor
	materials = list(/datum/material/iron=12500,/datum/material/diamond=10000,/datum/material/titanium=10000)
	construction_time = 600
	category = list("Assaultron")

///////////////////////
///// Sentry Bot /////
///////////////////////

/datum/design/board/sentry_main
	name = "Sentry Bot Central Control module"
	desc = "Allows for the construction of a Sentry Bot Central Control module."
	id = "sentry_main"
	build_path = /obj/item/circuitboard/mecha/sentry/main
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/sentry_peri
	name = "Sentry Bot Peripherals Control module"
	desc = "Allows for the construction of a Sentry Bot Peripheral Control module."
	id = "sentry_peri"
	build_path = /obj/item/circuitboard/mecha/sentry/peripherals
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/sentry_targ
	name = "Sentry Bot Weapons & Targeting Control module"
	desc = "Allows for the construction of a Sentry Bot Weapons & Targeting Control module."
	id = "sentry_targ"
	build_path = /obj/item/circuitboard/mecha/sentry/targeting
	category = list("Exosuit Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/sentry_chassis
	name = "Robot Chassis (Sentry Bot)"
	id = "sentry_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/f13/sentry
	materials = list(/datum/material/iron=25000,/datum/material/uranium=10000,/datum/material/titanium=15000,/datum/material/diamond=4000,/datum/material/silver=10000,/datum/material/gold=20000)
	construction_time = 100
	category = list("Sentry Bot")

/datum/design/sentry_head
	name = "Robot Head (Sentry Bot)"
	id = "sentry_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/sentry_head
	materials = list(/datum/material/iron=15000,/datum/material/glass=75000)
	construction_time = 200
	category = list("Sentry Bot")

/datum/design/sentry_torso
	name = "Robot Torso (Sentry Bot)"
	id = "sentry_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/sentry_torso
	materials = list(/datum/material/iron=25000, /datum/material/glass=12500,/datum/material/uranium=30000,/datum/material/diamond=6000,/datum/material/silver=10000,/datum/material/gold=30000)
	construction_time = 200
	category = list("Sentry Bot")

/datum/design/sentry_left_arm
	name = "Robot Left Arm (Sentry Bot)"
	id = "sentry_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/sentry_left_arm
	materials = list(/datum/material/iron=16250)
	construction_time = 150
	category = list("Sentry Bot")

/datum/design/sentry_right_arm
	name = "Robot Right Arm (Sentry Bot)"
	id = "sentry_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/sentry_right_arm
	materials = list(/datum/material/iron=16250)
	construction_time = 150
	category = list("Sentry Bot")

/datum/design/sentry_left_leg
	name = "Robot Left Leg (Sentry Bot)"
	id = "sentry_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/sentry_left_leg
	materials = list(/datum/material/iron=16250)
	construction_time = 150
	category = list("Sentry Bot")

/datum/design/sentry_right_leg
	name = "Robot Right Leg (Sentry Bot)"
	id = "sentry_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/sentry_right_leg
	materials = list(/datum/material/iron=16250)
	construction_time = 150
	category = list("Sentry Bot")

/datum/design/sentry_armor
	name = "Robot Armor (Sentry Bot)"
	id = "sentry_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/f13/sentry_armor
	materials = list(/datum/material/iron=15000,/datum/material/diamond=10000,/datum/material/titanium=10000)
	construction_time = 600
	category = list("Sentry Bot")

///////////////////////
///// Weapons /////
///////////////////////

/datum/design/robot_saw
	name = "Robot Weapon (Robot-fitted Buzzsaw)"
	desc = "Allows for the construction of Robot-fitted Buzzsaw."
	id = "robot_saw"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/melee/saw
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Robot Weapons")

/datum/design/robot_hammer
	name = "Robot Weapon (Robot-fitted Sledgehammer)"
	desc = "Allows for the construction of Robot-fitted Sledgehammer."
	id = "robot_hammer"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/melee/hammer
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Robot Weapons")

/datum/design/robot_pistol
	name = "Robot Weapon (Robot-fitted 10mm pistol)"
	desc = "Allows for the construction of Robot-fitted 10mm pistol."
	id = "robot_pistol"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/pistol
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Robot Weapons")

/datum/design/robot_laser_pistol
	name = "Robot Weapon (Robot-fitted AEP7)"
	desc = "Allows for the construction of Robot-fitted AEP7."
	id = "robot_laser_pistol"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/pistol
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Robot Weapons")

/datum/design/robot_plasma_pistol
	name = "Robot Weapon (Robot-fitted Plasma pistol)"
	desc = "Allows for the construction of Robot-fitted Plasma pistol."
	id = "robot_plasma_pistol"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/plasma/pistol
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Robot Weapons")

/datum/design/robot_light_flamethrower
	name = "Robot Weapon (Robot-fitted Light flamethrower)"
	desc = "Allows for the construction of Robot-fitted Light flamethrower."
	id = "robot_light_flamethrower"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/flamethrower/light
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Robot Weapons")

/datum/design/robot_laser_rifle
	name = "Robot Weapon (Robot-fitted AER9)"
	desc = "Allows for the construction of Robot-fitted AER9."
	id = "robot_laser_rifle"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/rifle
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Robot Weapons")
 
/datum/design/robot_laser_sniper
	name = "Robot Weapon (Robot-fitted Wattz 2k)"
	desc = "Allows for the construction of Robot-fitted Wattz 2k."
	id = "robot_laser_sniper"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/sniper
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Robot Weapons")

/datum/design/robot_plasma_rifle
	name = "Robot Weapon (Robot-fitted Plasma rifle)"
	desc = "Allows for the construction of Robot-fitted Plasma rifle."
	id = "robot_plasma_rifle"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/plasma
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Robot Weapons")

/datum/design/robot_ballistic_minigun
	name = "Robot Weapon (Robot-fitted CZ53 minigun)"
	desc = "Allows for the construction of Robot-fitted CZ53 minigun."
	id = "robot_ballistic_minigun"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/lmg/minigun
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Robot Weapons")
 
/datum/design/robot_heavy_flamethrower
	name = "Robot Weapon (Robot-fitted Heavy flamethrower)"
	desc = "Allows for the construction of Robot-fitted Heavy flamethrower."
	id = "robot_heavy_flamethrower"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/flamethrower
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Robot Weapons")

/datum/design/robot_grenade_launcher
	name = "Robot Weapon (Robot-fitted Heavy grenade launcher)"
	desc = "Allows for the construction of Robot-fitted Heavy grenade launcher."
	id = "robot_grenade_launcher"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/grenade_launcher
	materials = list(/datum/material/iron=22000,/datum/material/gold=6000,/datum/material/silver=8000)
	construction_time = 100
	category = list("Robot Weapons")

/datum/design/robot_missle_rack
	name = "Robot Weapon (Robot-fitted Rocket rack)"
	desc = "Allows for the construction of Robot-fitted Rocket rack."
	id = "robot_missle_rack"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/f13
	materials = list(/datum/material/iron=30000,/datum/material/gold=8000,/datum/material/silver=8000)
	construction_time = 100
	category = list("Robot Weapons")

/datum/design/robot_laser_minigun
	name = "Robot Weapon (Robot-fitted Gatling laser)"
	desc = "Allows for the construction of Robot-fitted Gatling laser."
	id = "robot_laser_minigun"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/minigun
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Robot Weapons")

/datum/design/robot_plasma_minigun
	name = "Robot Weapon (Robot-fitted Winchester P94 plasma caster)"
	desc = "Allows for the construction of Robot-fitted Winchester P94 plasma caster."
	id = "robot_plasma_minigun"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/caster
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Robot Weapons")

///////////////////////
///// Equipment /////
///////////////////////

/datum/design/robot_medical_beamgun
	name = "Robot Medical Equipment (Medical Beamgun)"
	desc = "Equipment for medical robot. A mounted medical nanite projector which will treat patients with a focused beam."
	id = "robot_medi_beam"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 15000, /datum/material/glass = 8000, /datum/material/plasma = 3000, /datum/material/gold = 8000, /datum/material/diamond = 2000)
	construction_time = 250
	build_path = /obj/item/mecha_parts/mecha_equipment/medical/mechmedbeam/f13
	category = list("Robot Equipment")

/datum/design/robot_repair_eyebot
	name = "Robot Module (Repair Eyebot Module)"
	desc = "Automated Repair Eyebot. KRZZK."
	id = "robot_repair_eyebot"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/repair_droid/f13
	materials = list(/datum/material/iron=10000,/datum/material/glass=5000,/datum/material/gold=1000,/datum/material/silver=2000)
	construction_time = 100
	category = list("Robot Equipment")

/datum/design/robot_drill
	name = "Robot Engineering Equipment (Drill)"
	id = "robot_drill"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/drill/f13
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Robot Equipment")

/datum/design/robot_diamond_drill
	name = "Robot Module (Diamond Mining Drill)"
	desc = "An upgraded version of the standard drill."
	id = "robot_diamond_drill"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/drill/diamonddrill/f13
	materials = list(/datum/material/iron=10000,/datum/material/diamond=6500)
	construction_time = 100
	category = list("Robot Equipment")

/datum/design/robot_mining_scanner
	name = "Robot Engineering Equipment (Mining Scanner)"
	id = "robot_mscanner"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/mining_scanner/f13
	materials = list(/datum/material/iron=5000,/datum/material/glass=2500)
	construction_time = 50
	category = list("Robot Equipment")

/datum/design/robot_ccw_armor
	name = "Robot Module (Reactive Armor Booster Module)"
	desc = "Robot-mounted armor booster."
	id = "robot_ccw_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/anticcw_armor_booster/f13
	materials = list(/datum/material/iron=20000,/datum/material/silver=5000)
	construction_time = 100
	category = list("Robot Equipment")

/datum/design/robot_proj_armor
	name = "Robot Module (Reflective Armor Booster Module)"
	desc = "ERobot-mounted armor booster."
	id = "robot_proj_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/antiproj_armor_booster/f13
	materials = list(/datum/material/iron=20000,/datum/material/gold=5000)
	construction_time = 100
	category = list("Robot Equipment")

/datum/design/robot_rcd
	name = "Robot Module (RCD Module)"
	desc = "A robot-mounted Rapid Construction Device."
	id = "robot_rcd"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/rcd/f13
	materials = list(/datum/material/iron=30000,/datum/material/gold=20000,/datum/material/plasma=25000,/datum/material/silver=20000)
	construction_time = 1200
	category = list("Robot Equipment")

/datum/design/robot_extinguisher
	name = "Robot Engineering Equipment (Extinguisher)"
	id = "robot_extinguisher"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/extinguisher/f13
	materials = list(/datum/material/iron=10000)
	construction_time = 100
	category = list("Robot Equipment")

///////////////////////
///// Ammo /////
///////////////////////

/datum/design/robot_flamethrower_ammo
	name = "Box of Flamethrower Fuel"
	desc = "Fuel for a robot-mounted flamethrower."
	id = "robot_flamethrower_ammo"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/mecha_ammo/flamethrower
	materials = list(/datum/material/iron=6000)
	construction_time = 20
	category = list("Robot Ammunition", "Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/robot_flamethrower_ammo/large
	name = "Large Box of Flamethrower Fuel"
	id = "robot_flamethrower_ammo_large"
	build_path = /obj/item/mecha_ammo/flamethrower
	materials = list(/datum/material/iron=12000)
	construction_time = 40

/datum/design/robot_pistol_ammo
	name = "10mm Pistol Ammunition"
	desc = "Ammunition for the robot-mounted 10mm Pistol."
	id = "robot_pistol_ammo"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/mecha_ammo/pistol
	materials = list(/datum/material/iron=4000)
	construction_time = 20
	category = list("Robot Ammunition", "Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/robot_minigun_ammo
	name = "5mm Minigun Ammunition"
	desc = "Ammunition for the robot-mounted minigun."
	id = "robot_minigun_ammo"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/mecha_ammo/minigun
	materials = list(/datum/material/iron=12000)
	construction_time = 40
	category = list("Robot Ammunition", "Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/robot_grenade_ammo
	name = "40mm Grenade Launcher Ammunition"
	desc = "Ammunition for the robot-mounted 40mm grenade launcher."
	id = "robot_grenade_ammo"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/mecha_ammo/grenades
	materials = list(/datum/material/iron=8000,/datum/material/gold=500,/datum/material/silver=500)
	construction_time = 20
	category = list("Robot Ammunition", "Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/robot_rocket_ammo
	name = "Missle Rack Ammunition"
	desc = "Ammunition for the robot-mounted missle rack."
	id = "robot_rocket_ammo"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/mecha_ammo/rockets
	materials = list(/datum/material/iron=10000,/datum/material/gold=2000,/datum/material/silver=2000)
	construction_time = 40
	category = list("Robot Ammunition", "Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
