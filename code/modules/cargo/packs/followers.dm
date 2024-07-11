
//Reminders-
// If you add something to this list, please group it by type and sort it alphabetically instead of just jamming it in like an animal
// cost = 700- Minimum cost, or infinite points are possible.
//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Emergency ///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/followers
	group = "Followers"

/datum/supply_pack/followers/stim
	name = "Stimpak (x5) Crate"
	desc = "A crate containing five stimpaks."
	cost = 150
	goody = PACK_GOODY_PUBLIC
	contains = list(/obj/item/storage/box/medicine/stimpaks/stimpaks5)
	crate_name = "Stimpak (x5) Crate"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/followers/stimsuper
	name = "Super Stimpak (x5) Crate"
	desc = "A crate containing five super stimpaks."
	cost = 300
	goody = PACK_GOODY_PUBLIC
	contains = list(/obj/item/storage/box/medicine/stimpaks/superstimpaks5)
	crate_name = "Super Stimpak (x5) Crate"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/followers/rads
	name = "Radaway Crate"
	desc = "A mix of Rad-X and Radaway, for use in treatment of radiation poisoning as well as prevention."
	cost = 60
	contains = list(/obj/item/reagent_containers/blood/radaway,
					/obj/item/reagent_containers/blood/radaway,
					/obj/item/reagent_containers/blood/radaway,
					/obj/item/storage/pill_bottle/chem_tin/radx,
					/obj/item/storage/pill_bottle/chem_tin/radx)
	crate_name = "Radaway Crate"
	crate_type = /obj/structure/closet/crate/radiation

/datum/supply_pack/followers/surgery
	name = "Surgical Supplies"
	desc = "A full surgery kit including personal protective equipment, a disassembled operating table and a duffelbag full of surgical tools."
	cost = 130
	contains = list(/obj/item/stack/rods,
					/obj/item/stack/rods,
					/obj/item/stack/sheet/mineral/silver,
					/obj/item/clothing/gloves/color/latex/nitrile,
					/obj/item/clothing/mask/surgical,
					/obj/item/storage/backpack/duffelbag/med/surgery)
	crate_name = "Surgical Supplies"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/followers/blood
	name = "Blood Supply"
	desc = "A supply of blood donated by generous wastelanders. Non-pasteurized, use with caution, in case of emergency."
	cost = 150
	contains = list(/obj/item/reagent_containers/blood/random,
					/obj/item/reagent_containers/blood/random,
					/obj/item/reagent_containers/blood/random,
					/obj/item/reagent_containers/blood/random,
					/obj/item/reagent_containers/blood/random,
					/obj/item/reagent_containers/blood/random)
	crate_name = "Blood Supply"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/followers/prosthetics
	name = "Prosthetic Limbs"
	desc = "Two sets of basic prosthetic limbs to help reenable those with severe injuries."
	cost = 180
	contains = list(/obj/item/bodypart/l_arm/robot/surplus,
					/obj/item/bodypart/l_arm/robot/surplus,
					/obj/item/bodypart/r_arm/robot/surplus,
					/obj/item/bodypart/r_arm/robot/surplus,
					/obj/item/bodypart/l_leg/robot/surplus,
					/obj/item/bodypart/l_leg/robot/surplus,
					/obj/item/bodypart/r_leg/robot/surplus,
					/obj/item/bodypart/r_leg/robot/surplus)
	crate_name = "Prosthetic Limbs"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/followers/defibrillator
	name = "Makeshift Defibrillator"
	desc = "Kickstart your heart with this DelCo brand car engine, handle with care."
	cost = 175
	contains = list(/obj/item/defibrillator/primitive)
	crate_name = "Defibrillator Crate"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/followers/fixer
	name = "Fixer Crate"
	desc = "Contains pills used to treat addiction and chem overdoses."
	cost = 250
	contains = list(/obj/item/storage/pill_bottle/chem_tin/fixer)
	crate_name = "Fixer Crate"
	crate_type = /obj/structure/closet/crate/internals
