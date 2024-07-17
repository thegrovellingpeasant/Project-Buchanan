
//Reminders-
// If you add something to this list, please group it by type and sort it alphabetically instead of just jamming it in like an animal
// cost = 700- Minimum cost, or infinite points are possible.
//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Emergency ///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/winnemucca
	group = "Winnemucca Traders"

/datum/supply_pack/winnemucca/revolver
	name = ".44 Revolver"
	desc = "Single action, brass frame, .44 caliber. Unmatched workmanship at an unbelievable price. Comes with free holster."
	cost = 125
	contains = list(/obj/item/storage/belt/holster/ranger44)
	crate_name = ".44 Revolver"
	crate_type = /obj/structure/closet/crate/footchest

/datum/supply_pack/winnemucca/redemption
	name = ".45 Revolver"
	desc = "Why settle for a six-shooter? This revolver comes complete with a seven round cylinder. Serious inquiries only."
	cost = 150
	contains = list(/obj/item/storage/belt/holster/ranger45)
	crate_name = ".45 Revolver"
	crate_type = /obj/structure/closet/crate/footchest

/datum/supply_pack/winnemucca/gotaplan
	name = "Lever Action Repeater"
	desc = "A lever action rifle chambered in .357 Magnum. Side loaded via a spring port, burnished stock and 12 round capacity."
	cost = 275
	contains = list(/obj/item/gun/ballistic/rifle/repeater/cowboy)
	crate_name = "Lever Action Repeater"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/winnemucca/shoulderholster
	name = "Shoulder Holster"
	desc = "Quickdraw leg holster. Secure and reliable, providing a clean draw and space for ammo, slim to fit under suit jackets."
	cost = 50
	goody = PACK_GOODY_PUBLIC
	contains = list(/obj/item/storage/belt/holster)
	crate_name = "Holster Shipment"
	crate_type = /obj/structure/closet/crate/footchest

/datum/supply_pack/winnemucca/legholster
	name = "Leg Holster"
	desc = "Quickdraw leg holster. Secure and reliable, providing a clean draw and space for ammo, low hanging hip variant."
	cost = 50
	goody = PACK_GOODY_PUBLIC
	contains = list(/obj/item/storage/belt/holster/legholster)
	crate_name = "Holster Shipment"
	crate_type = /obj/structure/closet/crate/footchest

/datum/supply_pack/winnemucca/bowie
	name = "Bowie Knife"
	desc = "Classic outdoorsmen knife with a long, clipped blade. Ideal for hunters or those expecting a brawl."
	cost = 80
	goody = PACK_GOODY_PUBLIC
	contains = list(/obj/item/melee/onehanded/knife/bowie)
	crate_name = "Holster Shipment"
	crate_type = /obj/structure/closet/crate/footchest

/datum/supply_pack/winnemucca/cow
	name = "Brahmin Crate"
	desc = "Outstanding Humboldt Brahmin certified to be in good health. Possessing of great strength, naturally pasteurized milk, and keen intellect. Suited for beef and dairy ranching or for beast of burden work on long lonely trail. One year warranty."
	cost = 150
	contains = list(/obj/item/brahmincollar,
					/obj/item/brahminbags,
					/obj/item/brahminbridle,
					/mob/living/simple_animal/cow/brahmin)
	crate_name = "Brahmin Crate"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/winnemucca/chicken
	name = "Chicken Crate"
	desc = "Stop! Do not miss out on this deal! Our top-of-the-line Avian companion is guaranteed to improve your quality of life. Steady source of eggs, feathers, companionship; tender, low cholestrol meat. A natural, low maintenance pest-repellent for the modern farmer."
	cost = 60
	contains = list(/obj/item/storage/fancy/egg_box,
					/mob/living/simple_animal/chicken)
	crate_name = "Radchicken Crate"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/winnemucca/miner
	name = "Prospector Kit"
	desc = "A reworked mining car full of gear to get started as a prospector in the famed Sierra Nevadas. Find out why Nevada was called the Silver State and strike it rich."
	cost = 149
	contains = list(/obj/item/clothing/under/f13/caravaneer,
					/obj/item/clothing/shoes/workboots/mining,
					/obj/item/circuitboard/machine/ore_redemption,
					/obj/item/circuitboard/machine/ore_silo,
					/obj/item/storage/bag/ore,
					/obj/item/storage/bag/ore,
					/obj/item/pickaxe/mini,
					/obj/item/flashlight/lantern)
	crate_name = "mining car"
	crate_type = /obj/structure/closet/crate/miningcar

/datum/supply_pack/winnemucca/tan
	name = "Rural Outfitters - Survivalist"
	desc = "The latest from Rural Outfitters, a lightweight, beige ensemble for those who choose to spend their days in sunbaked deserts."
	cost = 65
	contains = list(/obj/item/clothing/neck/mantle/poncho,
					/obj/item/clothing/suit/toggle/armor/f13/cloakranger,
					/obj/item/clothing/under/f13/cowboyt,
					/obj/item/clothing/suit/armored/light/cowboyvest,
					/obj/item/clothing/accessory/waistcoat/sheepskin,
					/obj/item/clothing/mask/bandana/red,
					/obj/item/clothing/shoes/f13/cowboy,
					/obj/item/clothing/head/f13/cowboy)
	crate_name = "Survivalist Attire"
	crate_type = /obj/structure/closet/crate/footchest

/datum/supply_pack/winnemucca/grey
	name = "Rural Outfitters - Gentleman"
	desc = "Classic formal attire, perfect for cards with friends, banking appointments or a visit to that special someone."
	cost = 65
	contains = list(/obj/item/clothing/under/f13/cowboyg,
					/obj/item/clothing/accessory/waistcoat,
					/obj/item/clothing/suit/f13/cowboygvest,
					/obj/item/clothing/mask/bandana/gold,
					/obj/item/clothing/shoes/cowboyboots/black,
					/obj/item/clothing/head/cowboyhat/white,
					/obj/item/clothing/head/cowboyhat/black)
	crate_name = "Gentlemen's Attire"
	crate_type = /obj/structure/closet/crate/footchest

/datum/supply_pack/winnemucca/brown
	name = "Rural Outfitters - Ranger"
	desc = "A conservative brown wardrobe for the hardworking, no-nonsense man of yesterday."
	cost = 65
	contains = list(/obj/item/clothing/under/f13/cowboyb,
					/obj/item/clothing/suit/armor/f13/trailranger,
					/obj/item/clothing/suit/armored/light/cowboyvest,
					/obj/item/clothing/mask/bandana/red,
					/obj/item/clothing/shoes/f13/cowboy,
					/obj/item/clothing/head/helmet/f13/brahmincowboyhat)
	crate_name = "Ranger Attire"
	crate_type = /obj/structure/closet/crate/footchest

/datum/supply_pack/winnemucca/slaver
	name = "Lorem Ipsum's Farming Solutions"
	desc = "A crate full of shock collars guaranteed to tame even the most stubborn... farm animals."
	cost = 125
	contraband = TRUE
	contains = list(/obj/item/electropack/shockcollar,
					/obj/item/electropack/shockcollar,
					/obj/item/electropack/shockcollar,
					/obj/item/restraints/legcuffs/bola,
					/obj/item/restraints/legcuffs/bola,
					/obj/item/assembly/signaler/advanced,
					/obj/item/reagent_containers/food/snacks/grown/wheat)
	crate_name = "Lorem Ipsum Crate"
	crate_type = /obj/structure/closet/crate/large
