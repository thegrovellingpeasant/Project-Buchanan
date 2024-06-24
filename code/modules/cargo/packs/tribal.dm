
//Reminders-
// If you add something to this list, please group it by type and sort it alphabetically instead of just jamming it in like an animal
// cost = 700- Minimum cost, or infinite points are possible.
//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Emergency ///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/tribal
	group = "Tribal Traders"

/datum/supply_pack/tribal/bow
	name = "Short Bow"
	desc = "A simple wooden bow with small pieces of turquiose, cheaply made and small enough to fit most bags, better then nothing I guess."
	cost = 60
	contains = list(/obj/item/gun/ballistic/bow/tribal)
	crate_name = "Short Bow"
	crate_type = /obj/structure/closet/crate/wicker

/datum/supply_pack/tribal/arrow
	name = "Arrows and Quiver"
	desc = "A simple leather quiver designed for holding arrows."
	cost = 40
	contains = list(/obj/item/storage/belt/tribe_quiver)
	crate_name = "Arrows and Quiver"
	crate_type = /obj/structure/closet/crate/wicker

/datum/supply_pack/tribal/tomahawk
	name = "Tomahawk"
	desc = "Three tomahawks, small enough to fit in your bag or belt."
	cost = 75
	contains = list(/obj/item/throwing_star/tomahawk,
					/obj/item/throwing_star/tomahawk,
					/obj/item/throwing_star/tomahawk)
	crate_name = "Tomahawk"
	crate_type = /obj/structure/closet/crate/wicker

/datum/supply_pack/tribal/javelin
	name = "Throwing Spear Quiver"
	desc = "A leather and iron quiver designed to hold throwing spears and bolas."
	cost = 100
	contains = list(/obj/item/storage/backpack/spearquiver)
	crate_name = "Throwing Spear Quiver"
	crate_type = /obj/structure/closet/crate/wicker

/datum/supply_pack/tribal/warclub
	name = "War Club"
	desc = "A simple carved wooden club with turquoise inlays."
	cost = 60
	contains = list(/obj/item/melee/onehanded/club/warclub)
	crate_name = "War Club"
	crate_type = /obj/structure/closet/crate/wicker

/datum/supply_pack/tribal/accessories
	name = "Tribal Accessories"
	desc = "Odds and ends for the homesick nomad. Ranges from belts to warpaint and even includes a radio."
	cost = 40
	contains = list(/obj/item/radio/tribal,
					/obj/item/reagent_containers/glass/bottle/primitive,
					/obj/item/storage/belt/mining/primitive,
					/obj/item/throwing_star/tomahawk,
					/obj/item/warpaint_bowl,
					/obj/item/clothing/accessory/talisman,
					/obj/item/clothing/accessory/talisman,
					/obj/item/clothing/head/helmet/f13/wayfarer/antler)
	crate_name = "Tribal Accessories"
	crate_type = /obj/structure/closet/crate/wicker

/datum/supply_pack/tribal/doctor
	name = "Alternative Medicine"
	desc = "A collection of surgical tools, storage for medicine, and a mortar and pestle to make your own. Supplies for those who prefer natural medicine."
	cost = 111
	contains = list(/obj/item/surgical_drapes,
					/obj/item/nullrod/tribal_knife,
					/obj/item/hemostat/tribal,
					/obj/item/retractor/tribal,
					/obj/item/storage/bag/chemistry/tribal,
					/obj/item/reagent_containers/glass/bottle/primitive,
					/obj/item/reagent_containers/glass/bottle/primitive,
					/obj/item/reagent_containers/glass/bottle/primitive,
					/obj/item/storage/bag/plants,
					/obj/item/reagent_containers/glass/primitive_chem_isolator,
					/obj/item/reagent_containers/glass/mortar,
					/obj/item/pestle)
	crate_name = "Alternative Medicine"
	crate_type = /obj/structure/closet/crate/wicker

/datum/supply_pack/tribal/wastepelts
	name = "Assorted Pelts"
	desc = "An assortment of all the various excess pelts leftover, fit for either wearing or scrapping. Sure to have something for everyone."
	cost = 50
	contains = list(/obj/item/stack/sheet/animalhide/molerat,
					/obj/item/stack/sheet/animalhide/wolf,
					/obj/item/stack/sheet/animalhide/cat,
					/obj/item/clothing/neck/mantle/peltfur,
					/obj/item/clothing/neck/mantle/peltmountain,
					/obj/item/clothing/shoes/f13/peltboots,
					/obj/item/clothing/shoes/f13/military/khan_pelt,
					/obj/item/clothing/head/bearpelt,
					/obj/item/clothing/head/f13/stalkerpelt)
	crate_name = "Assorted Pelts"
	crate_type = /obj/structure/closet/crate/wicker

/datum/supply_pack/tribal/brahminskins
	name = "Brahmin Hides"
	desc = "A shipment of untreated Brahmin hides, ready for your crafting needs. The most leather for your caps."
	cost = 65
	contains = list(/obj/item/stack/sheet/animalhide/brahmin,
					/obj/item/stack/sheet/animalhide/brahmin,
					/obj/item/stack/sheet/animalhide/brahmin,
					/obj/item/stack/sheet/animalhide/brahmin,
					/obj/item/stack/sheet/animalhide/brahmin)
	crate_name = "Brahmin Hides"
	crate_type = /obj/structure/closet/crate/wicker

/datum/supply_pack/tribal/geckoskins
	name = "Gecko Skins"
	desc = "The perfect material for making tribal clothing, reinforcing leather armor, or any number of other geckoskin accoutrements."
	cost = 55
	contains = list(/obj/item/stack/sheet/animalhide/gecko,
					/obj/item/stack/sheet/animalhide/gecko,
					/obj/item/stack/sheet/animalhide/gecko,
					/obj/item/stack/sheet/animalhide/gecko,
					/obj/item/stack/sheet/animalhide/gecko)
	crate_name = "Gecko Skins"
	crate_type = /obj/structure/closet/crate/wicker

/datum/supply_pack/tribal/datura
	name = "Essence of Datura"
	desc = "Five mugs of sacred datura root tea. Drink at your own peril."
	cost = 111
	contraband = TRUE
	contains = list(/obj/item/reagent_containers/food/drinks/trophy/datura,
					/obj/item/reagent_containers/food/drinks/trophy/datura,
					/obj/item/reagent_containers/food/drinks/trophy/datura,
					/obj/item/reagent_containers/food/drinks/trophy/datura,
					/obj/item/reagent_containers/food/drinks/trophy/datura)
	crate_name = "Essence of Datura"
	crate_type = /obj/structure/closet/crate/wicker

/datum/supply_pack/tribal/retvrn
	name = "Lorem Ipsum's Trekkingwear"
	desc = "An outfit for intrepid desert wanderers who like the color red."
	cost = 125
	contraband = TRUE
	contains = list(/obj/item/clothing/suit/hooded/tribaloutcast,
					/obj/item/clothing/under/f13/exile/legion,
					/obj/item/clothing/shoes/f13/military/legion,
					/obj/item/clothing/suit/armor/f13/legion/vet/explorer)
	crate_name = "Lorem Ipsum Basket"
	crate_type = /obj/structure/closet/crate/wicker
