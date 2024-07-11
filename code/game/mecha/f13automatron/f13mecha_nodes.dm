/datum/techweb_node/protectron
	id = "robot_protectron"
	display_name = "ROBOT: Protectron"
	description = "Protectron robot designs."
	prereq_ids = list("mecha")
	design_ids = list("protectron_chassis", "protectron_head", "protectron_torso", "protectron_left_arm", "protectron_right_arm", "protectron_left_leg", "protectron_right_leg", "protectron_main", "protectron_peri", "protectron_targ")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/gutsy
	id = "robot_gutsy"
	display_name = "ROBOT: Gutsy Mk II"
	description = "Gutsy Mk II robot designs."
	prereq_ids = list("mecha")
	design_ids = list("gutsy_chassis", "gutsy_head", "gutsy_torso", "gutsy_left_arm", "gutsy_right_arm", "gutsy_left_leg", "gutsy_right_leg", "gutsy_main", "gutsy_peri", "gutsy_targ")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/assaultron
	id = "robot_assaultron"
	display_name = "ROBOT: Assaultron"
	description = "Assaultron robot designs."
	prereq_ids = list("adv_mecha")
	design_ids = list("assaultron_chassis", "assaultron_head", "assaultron_torso", "assaultron_left_arm", "assaultron_right_arm", "assaultron_left_leg", "assaultron_right_leg", "assaultron_armor", "assaultron_main", "assaultron_peri", "assaultron_targ")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/sentry
	id = "robot_sentry"
	display_name = "ROBOT: Sentry Bot"
	description = "Sentry Bot robot designs."
	prereq_ids = list("adv_mecha", "weaponry")
	design_ids = list("sentry_chassis", "sentry_head", "sentry_torso", "sentry_left_arm", "sentry_right_arm", "sentry_left_leg", "sentry_right_leg", "sentry_armor", "sentry_main", "sentry_peri", "sentry_targ")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3000)

/datum/techweb_node/melee_weapons
	id = "robot_weapons_melee"
	display_name = "Robot Melee Weapons"
	description = "Designs for melee weapons fitted for robots."
	prereq_ids = list("weaponry")
	design_ids = list("robot_saw", "robot_hammer")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/light_weapons
	id = "robot_weapons_light"
	display_name = "Robot Light Weapons"
	description = "Designs for light weapons fitted for robots."
	prereq_ids = list("weaponry")
	design_ids = list("robot_pistol", "robot_laser_pistol", "robot_pistol_ammo")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/medium_weapons
	id = "robot_weapons_medium"
	display_name = "Robot Medium Weapons"
	description = "Designs for medium weapons fitted for robots."
	prereq_ids = list("robot_weapons_light")
	design_ids = list("robot_light_flamethrower", "robot_laser_rifle", "robot_laser_sniper", "robot_flamethrower_ammo")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/heavy_weapons
	id = "robot_weapons_heavy"
	display_name = "Robot Heavy Weapons"
	description = "Designs for heavy weapons fitted for robots."
	prereq_ids = list("robot_weapons_medium", "adv_weaponry")
	design_ids = list("robot_ballistic_minigun", "robot_heavy_flamethrower", "robot_grenade_launcher", "robot_laser_minigun", "robot_flamethrower_ammo_large", "robot_minigun_ammo", "robot_grenade_ammo")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3000)

/datum/techweb_node/robot_equipment
	id = "robot_equipment"
	display_name = "Robot Equipment"
	description = "Designs for robot equipment."
	prereq_ids = list("mecha")
	design_ids = list("robot_drill", "robot_mscanner", "robot_extinguisher", "robot_medi_beam", "robot_rcd")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/robot_equipment_adv
	id = "robot_equipment_adv"
	display_name = "Advanced Robot Equipment"
	description = "Designs for advanced robot equipment."
	prereq_ids = list("adv_mecha", "robot_equipment")
	design_ids = list("robot_diamond_drill", "robot_ccw_armor", "robot_proj_armor")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3000)
