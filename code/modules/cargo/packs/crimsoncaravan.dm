
//Reminders-
// If you add something to this list, please group it by type and sort it alphabetically instead of just jamming it in like an animal
// cost = 700- Minimum cost, or infinite points are possible.
//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Emergency ///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/crimsoncaravan
	group = "Happy Trails Caravan"

/datum/supply_pack/crimsoncaravan/trader
	name = "Leather Armor"
	desc = "A set of leather armor, protection without all the baggage of heavier armors."
	cost = 99
	contains = list(/obj/item/clothing/suit/armored/light/leathersuit,
					/obj/item/clothing/gloves/fingerless,
					/obj/item/clothing/glasses/legiongoggles,
					/obj/item/clothing/head/f13/stormchaser)
	crate_name = "Leather Armor"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/crimsoncaravan/bodyguard
	name = "Metal Armor"
	desc = "A suit of metal armor, medium weight and ideal for going up against energy weapons."
	cost = 149
	contains = list(/obj/item/clothing/suit/armor/f13/metalarmor,
					/obj/item/clothing/shoes/jackboots,
					/obj/item/clothing/gloves/f13/military,
					/obj/item/melee/unarmed/brass/spiked,
					/obj/item/clothing/head/helmet/f13/motorcycle)
	crate_name = "Metal Armor"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/crimsoncaravan/mercenary
	name = "Combat Armor"
	desc = "The best protection available, popular among mercenaries and adventurers. Comes in green."
	cost = 249
	contains = list(/obj/item/clothing/under/f13/combat,
					/obj/item/clothing/suit/armor/f13/combat,
					/obj/item/storage/belt/military/army,
					/obj/item/clothing/shoes/jackboots,
					/obj/item/clothing/head/helmet/f13/combat)
	crate_name = "Combat Armor"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/crimsoncaravan/metal
	name = "Metal Shipment"
	desc = "50 iron sheets, suited for various industrial or personal projects."
	cost = 60
	contains = list(/obj/item/stack/sheet/mineral/wood/fifty)
	crate_name = "metal shipment"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/crimsoncaravan/glass
	name = "Glass Shipment"
	desc = "50 sheets of glass. 100% salvaged materials. See through a glass, but dimly."
	cost = 60
	contains = list(/obj/item/stack/sheet/mineral/wood/fifty)
	crate_name = "glass shipment"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/crimsoncaravan/wastefashion
	name = "Bulk Clothing"
	desc = "A selection of popular wasteland fashions."
	cost = 99
	contains = list(/obj/item/clothing/under/f13/mercadv,
					/obj/item/clothing/under/f13/female/mercadv,
					/obj/item/clothing/under/f13/merchant,
					/obj/item/clothing/under/f13/female/doctor,
					/obj/item/clothing/under/f13/brahmin,
					/obj/item/clothing/under/f13/brahminf,
					/obj/item/clothing/under/f13/merccharm,
					/obj/item/clothing/under/f13/female/merccharm,
					/obj/item/clothing/suit/armored/light/duster/vet,
					/obj/item/clothing/shoes/jackboots,
					/obj/item/clothing/head/f13/stormchaser,
					/obj/item/clothing/glasses/legiongoggles,
					/obj/item/clothing/gloves/fingerless)
	crate_name = "Crimson Caravan Clothing"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/crimsoncaravan/water
	name = "Water Shipment"
	desc = "A shipment of purified water, the foundation of life."
	cost = 49
	contains = list(/obj/item/reagent_containers/glass/beaker/waterbottle/purified,
					/obj/item/reagent_containers/glass/beaker/waterbottle/purified,
					/obj/item/reagent_containers/glass/beaker/waterbottle/purified,
					/obj/item/reagent_containers/glass/beaker/waterbottle/purified,
					/obj/item/reagent_containers/glass/beaker/waterbottle/purified)
	crate_name = "Water Shipment"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vaultcity/varpack
	name = "Variety Lunch Pack"
	desc = "An assortment of packaged pre-war meals for the wastelander who doesn't have time to cook."
	cost = 50
	goody = PACK_GOODY_PUBLIC
	contains = list(/obj/item/storage/box/papersack,
					/obj/item/reagent_containers/food/snacks/f13/canned/porknbeans,
					/obj/item/reagent_containers/food/snacks/f13/caravanlunch,
					/obj/item/reagent_containers/food/snacks/f13/cram,
					/obj/item/storage/fancy/cigarettes/cigpack_greytort,
					/obj/item/storage/box/matches)

/datum/supply_pack/vaultcity/varpacktwo
	name = "Variety Dessert Pack"
	desc = "An assortment of packaged pre-war food intended for dessert."
	cost = 50
	goody = PACK_GOODY_PUBLIC
	contains = list(/obj/item/storage/box/papersack,
					/obj/item/reagent_containers/food/snacks/f13/canned/ncr/dinner,
					/obj/item/reagent_containers/food/snacks/f13/crisps,
					/obj/item/reagent_containers/food/snacks/f13/dandyapples,
					/obj/item/storage/fancy/cigarettes/cigpack_bigboss,
					/obj/item/storage/box/matches)

/datum/supply_pack/vaultcity/khanmade
	name = "Great Khans Chem Shipment"
	desc = "What it says on the tin. You buying or what?"
	cost = 120
	contraband = TRUE
	goody = PACK_GOODY_PUBLIC
	contains = list(/obj/item/storage/pill_bottle/chem_tin/buffout,
					/obj/item/storage/pill_bottle/chem_tin/mentats,
					/obj/item/reagent_containers/hypospray/medipen/psycho,
					/obj/item/reagent_containers/hypospray/medipen/medx,
					/obj/item/reagent_containers/pill/patch/turbo,
					/obj/item/reagent_containers/pill/patch/jet)


