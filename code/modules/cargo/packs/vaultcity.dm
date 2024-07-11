
//Reminders-
// If you add something to this list, please group it by type and sort it alphabetically instead of just jamming it in like an animal
// cost = 700- Minimum cost, or infinite points are possible.
//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Emergency ///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/vaultcity
	group = "Vault City"

/datum/supply_pack/vaultcity/limbs
	name = "Cloned Limbs"
	desc = "A full set of limbs grown in a VC laboratory."
	cost = 500
	contains = list(/obj/item/bodypart/l_leg,
					/obj/item/bodypart/r_leg,
					/obj/item/bodypart/r_arm,
					/obj/item/bodypart/l_arm)
	crate_name = "Limb Freezer"
	crate_type = /obj/structure/closet/crate/freezer

/datum/supply_pack/vaultcity/organ
	name = "Organ Freezer"
	desc = "A crate containing an assortment of human organs, artisanally grown in Vault City's many petri dishes."
	cost = 300
	contains = list(/obj/item/organ/heart,
					/obj/item/organ/heart,
					/obj/item/organ/lungs,
					/obj/item/organ/lungs,
					/obj/item/organ/stomach,
					/obj/item/organ/stomach,
					/obj/item/organ/liver,
					/obj/item/organ/liver,
					/obj/item/organ/eyes,
					/obj/item/organ/eyes,
					/obj/item/organ/ears,
					/obj/item/organ/ears,
					/obj/item/organ/tongue,
					/obj/item/organ/tongue)
	crate_name = "Organ Freezer"
	crate_type = /obj/structure/closet/crate/freezer

/datum/supply_pack/vaultcity/purifier
	name = "Water Purifier"
	desc = "A water purification unit, providing the user with unlimited amounts of clean water, at the cost of reduced speed compared to traditional wasteland methods (e.g. drinking from puddles, bucketing up from wells, mirages)."
	cost = 150
	contains = list(/obj/machinery/water_purifier/unanchored)
	crate_name = "Water Purifier"
	crate_type = /obj/structure/closet/crate/internals

/datum/supply_pack/vaultcity/autolathe
	name = "Autolathe"
	desc = "A state of the art assembler of a wide variety of small items, from complex electrical equipment to the most mundane cutlery."
	cost = 150
	contains = list(/obj/item/circuitboard/machine/autolathe,
					/obj/item/stock_parts/matter_bin,
					/obj/item/stock_parts/matter_bin,
					/obj/item/stock_parts/matter_bin,
					/obj/item/stock_parts/manipulator,
					/obj/item/stack/sheet/glass)
	crate_name = "Autolathe crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vaultcity/ammolathe
	name = "Reloading Bench"
	desc = "A semi-automatic brass loader capable of producing a variety of ammunition types from blueprints. Magazines not included."
	cost = 150
	contains = list(/obj/item/circuitboard/machine/autolathe/ammo,
					/obj/item/stock_parts/matter_bin,
					/obj/item/stock_parts/matter_bin,
					/obj/item/stock_parts/matter_bin,
					/obj/item/stock_parts/manipulator)
	crate_name = "Reloading Bench crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vaultcity/ammolathe
	name = "Chemistry Set"
	desc = "A complete chemistry set for the scientifically inclined. Some assembly required. Vault City is not responsible for damages caused by any chemicals mixed."
	cost = 200
	contains = list(/obj/item/circuitboard/machine/chem_dispenser,
					/obj/item/circuitboard/machine/chem_heater,
					/obj/item/circuitboard/machine/chem_master,
					/obj/item/stock_parts/matter_bin,
					/obj/item/stock_parts/matter_bin,
					/obj/item/stock_parts/capacitor,
					/obj/item/stock_parts/manipulator,
					/obj/item/stock_parts/manipulator,
					/obj/item/stack/sheet/glass,
					/obj/item/stack/sheet/glass,
					/obj/item/stock_parts/cell,
					/obj/item/stock_parts/micro_laser,
					/obj/item/stack/sheet/glass,
					/obj/item/reagent_containers/glass/beaker,
					/obj/item/reagent_containers/glass/beaker)
	crate_name = "Chemistry Set crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vaultcity/taser
	name = "Compliance Regulator"
	desc = "A less-than-lethal tool designed to subdue threats to your person or experiments. Handle with caution."
	cost = 75
	goody = PACK_GOODY_PUBLIC
	contains = list(/obj/item/gun/energy/laser/complianceregulator,
					/obj/item/stock_parts/cell/ammo/ec)

/datum/supply_pack/vaultcity/gammagulp
	name = "Gamma Gulp Beer"
	desc = "When your skin's lacking that 'special glow'... Choose Gamma Gulp Beer!"
	cost = 12
	contraband = TRUE
	goody = PACK_GOODY_PUBLIC
	contains = list(/obj/item/reagent_containers/food/drinks/bottle/gammagulp)

/datum/supply_pack/vaultcity/roentgenrum
	name = "Roentgen Rum"
	desc = "Gecko's classic rum, brewed at The Harp by a team with combined centuries of experience. Unleash your inner ghoul with Roentgen Rum."
	cost = 25
	contraband = TRUE
	goody = PACK_GOODY_PUBLIC
	contains = list(/obj/item/reagent_containers/food/drinks/bottle/roentgen)
