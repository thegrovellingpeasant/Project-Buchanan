
//Reminders-
// If you add something to this list, please group it by type and sort it alphabetically instead of just jamming it in like an animal
// cost = 700- Minimum cost, or infinite points are possible.
//////////////////////////////////////////////////////////////////////////////
//////////////////////////// shi ///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/shi
	group = "Shi Merchants"

/datum/supply_pack/shi/clothing
	name = "Shi Clothing"
	desc = "A collection of clothing in the styles popular in San Francisco."
	cost = 100
	contains = list(/obj/item/clothing/under/costume/qipao/white,
					/obj/item/clothing/under/costume/qipao,
					/obj/item/clothing/under/costume/qipao/red,
					/obj/item/clothing/under/pants/blackjeans,
					/obj/item/clothing/gloves/fingerless/pugilist,
					/obj/item/clothing/head/beret/headband,
					/obj/item/clothing/under/f13/shiny,
					/obj/item/clothing/suit/f13/vest,
					/obj/item/clothing/gloves/fingerless,
					/obj/item/clothing/shoes/sneakers/white)
	crate_name = "Shi Clothing"
	crate_type = /obj/structure/closetundense/locker/oldstyle

/datum/supply_pack/shi/type17
	name = "Type 17"
	desc = "Chinese military sidearm at the time of the Great War. The ones around are old and worn, but somewhat popular due to the long barrel and rechambered in 10mm after the original ammo ran dry decades ago."
	cost = 80
	contains = list(/obj/item/gun/ballistic/automatic/pistol/type17)
	crate_name = "Type 17"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/shi/type93
	name = "Type 93 Assault Rifle"
	desc = "The Type 93 Chinese assault rifle was designed and manufactured by a Chinese industrial conglomerate for the People's Liberation Army during the Resource Wars, for the purpose of equipping the Chinese infiltrators and American fifth-columnists. Chambered in 5.56x45."
	cost = 575
	contains = list(/obj/item/gun/ballistic/automatic/type93/worn)
	crate_name = "Type 93 Assault Rifle"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/shi/botany
	name = "Advanced Botanical Equipment"
	desc = "Brought to you by the Shi Botany Department, the latest in genetic modification, material recycling, and seed removal, for the farmer of the 23rd century and beyond."
	cost = 350
	contains = list(/obj/item/circuitboard/machine/seed_extractor,
					/obj/item/circuitboard/machine/biogenerator,
					/obj/item/circuitboard/machine/plantgenes,
					/obj/item/stock_parts/manipulator,
					/obj/item/stock_parts/micro_laser,
					/obj/item/stack/sheet/glass,
					/obj/item/stock_parts/scanning_module,
					/obj/item/stock_parts/matter_bin,
					/obj/item/stock_parts/manipulator,
					/obj/item/stack/cable_coil,
					/obj/item/stack/sheet/glass,
					/obj/item/stock_parts/matter_bin,
					/obj/item/stock_parts/manipulator)
	crate_name = "Shi Botany Crate"
	crate_type = /obj/structure/closet/crate/hydroponics

/datum/supply_pack/shi/tray
	name = "Hydroponics Kit"
	desc = "Brought to you by the Shi Botany Department, a state of the art tray for easier, more efficient farming, for culinary or scientific use."
	cost = 50
	contains = list(/obj/item/circuitboard/machine/hydroponics,
					/obj/item/stock_parts/matter_bin,
					/obj/item/stock_parts/matter_bin,
					/obj/item/stock_parts/manipulator,
					/obj/item/stack/sheet/glass)
	crate_name = "Shi Hydroponics Crate"
	crate_type = /obj/structure/closet/crate/hydroponics

/datum/supply_pack/shi/gla
	name = "Revolutionary Kit"
	desc = "A pair of outfits for aspiring radicals, comes with matching bullet proof vests and a piece of sheet music."
	cost = 100
	contraband = TRUE
	contains = list(/obj/item/clothing/under/f13/chinese,
					/obj/item/clothing/head/f13/chinese,
					/obj/item/clothing/suit/armored/medium/vestchinese,
					/obj/item/clothing/shoes/jackboots,
					/obj/item/clothing/under/f13/chinese/officer,
					/obj/item/clothing/head/f13/chinese/officer,
					/obj/item/clothing/suit/armored/medium/vestchinese,
					/obj/item/clothing/shoes/jackboots,
					/obj/item/paper/goatsheetmusic)
	crate_name = "Revolutionary Kit"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/shi/hubology
	name = "Hubologist Gear"
	desc = "A crate with robes, pamphlets and a copy of the Elron bible to assist you in spreading Scientific Spirituality!"
	cost = 99
	contraband = TRUE
	contains = list(/obj/item/clothing/suit/f13/hubologist,
					/obj/item/clothing/suit/f13/hubologist,
					/obj/item/clothing/suit/f13/hubologist,
					/obj/item/paper/hubologyteachings,
					/obj/item/paper/hubologyad,
					/obj/item/paper/hubologyad,
					/obj/item/paper/hubologyad,
					/obj/item/assembly/playback)
	crate_name = "Hubologist gear"
	crate_type = /obj/structure/closet/crate/engineering/electrical
