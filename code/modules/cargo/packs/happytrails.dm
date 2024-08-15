
//Reminders-
// If you add something to this list, please group it by type and sort it alphabetically instead of just jamming it in like an animal
// cost = 700- Minimum cost, or infinite points are possible.
//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Emergency ///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/happytrails
	group = "Happy Trails Caravan"

/datum/supply_pack/happytrails/brahminbaron
	name = "Brahmin Meat Shipment"
	desc = "A slaughtered Brahmin, shipped in from a ranch in Northern California."
	cost = 60
	contains = list(/obj/item/reagent_containers/food/snacks/meat/slab,
					/obj/item/reagent_containers/food/snacks/meat/slab,
					/obj/item/reagent_containers/food/snacks/meat/slab,
					/obj/item/reagent_containers/food/snacks/meat/slab,
					/obj/item/reagent_containers/food/snacks/meat/slab,
					/obj/item/reagent_containers/food/snacks/rawbrahmintongue,
					/obj/item/reagent_containers/food/snacks/rawbrahmintongue,
					/obj/item/reagent_containers/food/snacks/rawbrahminliver)
	crate_name = "Brahmin Meat Shipment"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/happytrails/seeds
	name = "Seed Crate"
	desc = "A crate of assorted seeds, the fruit of the New California Republic's many homesteading initiatives."
	cost = 70
	contains = list(/obj/item/seeds/ambrosia,
					/obj/item/seeds/cannabis,
					/obj/item/seeds/apple,
					/obj/item/seeds/banana,
					/obj/item/seeds/cotton,
					/obj/item/seeds/berry,
					/obj/item/seeds/poppy/broc,
					/obj/item/seeds/cabbage,
					/obj/item/seeds/carrot,
					/obj/item/seeds/carrot/parsnip,
					/obj/item/seeds/cherry,
					/obj/item/seeds/chanterelle,
					/obj/item/seeds/chili,
					/obj/item/seeds/cocoapod,
					/obj/item/seeds/coffee,
					/obj/item/seeds/corn,
					/obj/item/seeds/eggplant,
					/obj/item/seeds/grape,
					/obj/item/seeds/grass,
					/obj/item/seeds/lemon,
					/obj/item/seeds/lime,
					/obj/item/seeds/onion,
					/obj/item/seeds/orange,
					/obj/item/seeds/pineapple,
					/obj/item/seeds/potato,
					/obj/item/seeds/poppy,
					/obj/item/seeds/pumpkin,
					/obj/item/seeds/wheat/rice,
					/obj/item/seeds/soya,
					/obj/item/seeds/sugarcane,
					/obj/item/seeds/sunflower,
					/obj/item/seeds/tea,
					/obj/item/seeds/coyotetobacco,
					/obj/item/seeds/tomato,
					/obj/item/seeds/watermelon,
					/obj/item/seeds/wheat,
					/obj/item/seeds/whitebeet,
					/obj/item/seeds/xander,
					/obj/item/seeds/mutfruit,
					/obj/item/seeds/punga,
					/obj/item/seeds/tato,
					/obj/item/seeds/yucca,
					/obj/item/seeds/pinyon,
					/obj/item/seeds/mesquite,
					/obj/item/seeds/horsenettle,
					/obj/item/storage/bag/plants)
	crate_name = "Seed Crate"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/happytrails/clothes
	name = "Assorted Clothing"
	desc = "A wide variety of clothing for the fashion conscious waster."
	cost = 45
	contains = list(/obj/item/clothing/under/f13/brahminm,
					/obj/item/clothing/under/f13/brahminf,
					/obj/item/clothing/under/f13/caravaneer,
					/obj/item/clothing/under/f13/ikeduds,
					/obj/item/clothing/under/pants/mustangjeans,
					/obj/item/clothing/under/f13/brahminbaron/foreign_suit,
					/obj/item/clothing/under/f13/ranger/vet/thaxflannel,
					/obj/item/clothing/suit/jacket/flannel/brown,
					/obj/item/clothing/suit/jacket/flannel/red)
	crate_name = "Clothing Crate"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/happytrails/wood
	name = "Lumber Delivery"
	desc = "50 wood planks. Furnish your home, or build one from scratch!"
	cost = 60
	contains = list(/obj/item/stack/sheet/mineral/wood/fifty)
	crate_name = "Lumber Delivery"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/happytrails/cigar
	name = "San Francisco Sunlights"
	desc = "A one of a kind taste, for a one of a kind man. San Francisco Sunlights, the best of old California for the best of New California."
	cost = 150
	goody = PACK_GOODY_PUBLIC
	contains = list(/obj/item/storage/fancy/cigarettes/cigars/sanfran)

/datum/supply_pack/happytrails/cigarette
	name = "Redding Handrolls"
	desc = "Every cigarette hand-rolled by someone who gives a damn. Redding, the GOLD standard in cigarettes."
	cost = 25
	goody = PACK_GOODY_PUBLIC
	contains = list(/obj/item/storage/fancy/cigarettes/cigpack_redding)

/datum/supply_pack/happytrails/wine
	name = "Napa Valley Wine"
	desc = "A 2267 vintage made in the waste-famous Napa Valley. From our vineyards to your table."
	cost = 67
	goody = PACK_GOODY_PUBLIC
	contains = list(/obj/item/reagent_containers/food/drinks/bottle/napa)

/datum/supply_pack/happytrails/whiskey
	name = "Sac-Town Barrel-Aged Whiskey"
	desc = "Richly flavored, aged for five years. Open up a good time with Sac-Town. 49% ABV."
	cost = 30
	goody = PACK_GOODY_PUBLIC
	contains = list(/obj/item/reagent_containers/food/drinks/bottle/sactown)
