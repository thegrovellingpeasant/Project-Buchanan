/datum/job/wastes
	department_flag = WASTES
	exp_type = EXP_TYPE_WASTES
	maptype = "reno"
	selection_color = "#e6e1cf"


/datum/job/wastes/f13vagrant
	title = "Vagrant"
	flag = F13RENORAIDER
	faction = FACTION_WASTES
	total_positions = 5
	spawn_positions = 5
	description = "In The Biggest Little City, life isn't so prosperous for those outside of the gangs running the place, and you aren't some tourist, you live here. Make by with whatever means you can, even if it means breaking a few knees. Maybe that's too violent so you'll beg for a handout instead or maybe deceive a few schmucks for their money. And who says you can't do a job for one of the gangs?"
	supervisors = "the man with the biggest stick"

	outfit = /datum/outfit/job/wastes/f13vagrant

	loadout_options = list(
	/datum/outfit/loadout/vagrant_addict,
	/datum/outfit/loadout/vagrant_59thstreet,
	/datum/outfit/loadout/vagrant_yakuza,
	/datum/outfit/loadout/vagrant_khan,
	/datum/outfit/loadout/vagrant_veteran,
	/datum/outfit/loadout/vagrant_viper,
	/datum/outfit/loadout/vagrant_jackal
	)

/datum/outfit/job/wastes/f13vagrant
	name = "Vagrant"
	jobtype = /datum/job/wastes/f13vagrant
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	ears = null
	l_pocket = /obj/item/storage/bag/money/small/meager
	id = null
	shoes = null
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/radio = 1
		)

/datum/outfit/job/wastes/f13vagrant/pre_equip(mob/living/carbon/human/H)
	. = ..()
	uniform = pick(
		/obj/item/clothing/under/f13/brahmin,
		/obj/item/clothing/under/f13/rag,
		/obj/item/clothing/under/f13/raider_leather,
		/obj/item/clothing/under/f13/raiderrags,
		/obj/item/clothing/under/pants/f13/ghoul,
		/obj/item/clothing/under/jabroni)

/datum/outfit/loadout/vagrant_addict
	name = "Addict"
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/jet = 2,
		/obj/item/reagent_containers/hypospray/medipen/psycho = 1)

/datum/outfit/loadout/vagrant_59thstreet
	name = "59th street killer"
	suit = /obj/item/clothing/suit/armor/f13/reno/fiftyninthstreet
	uniform = /obj/item/clothing/under/f13/redz
	head = /obj/item/clothing/head/helmet/f13/khan/bandana/generic
	glasses = /obj/item/clothing/glasses/f13/biker
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/twohanded/baseball = 1,
		/obj/item/kitchen/knife = 1)

/datum/outfit/loadout/vagrant_yakuza
	name = "Yakuza"
	suit = /obj/item/clothing/suit/armor/f13/reno/bulletproof/lite
	belt = /obj/item/storage/belt/military/assault/ncr
	uniform = /obj/item/clothing/under/f13/yakuza
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/katana = 1)

/datum/outfit/loadout/vagrant_khan
	name = "Khan"
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/khan_jacket
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	uniform = /obj/item/clothing/under/f13/khan
	gloves = /obj/item/melee/unarmed/brass/spiked
	head = /obj/item/clothing/head/helmet/f13/khan/pelt
	shoes = /obj/item/clothing/shoes/f13/military/khan_pelt
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/improvised = 2)

/datum/outfit/loadout/vagrant_veteran
	name = "Veteran"
	suit = /obj/item/clothing/suit/armor/f13/exile/ncrexile
	uniform = /obj/item/clothing/under/f13/exile
	id = /obj/item/card/id/rusted
	shoes = /obj/item/clothing/shoes/f13/military/ncr
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/varmint = 1,
		/obj/item/ammo_box/magazine/m556/rifle = 1,
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/storage/box/ration/menu_two = 1)

/datum/outfit/loadout/vagrant_viper
	name = "Viper"
	suit = /obj/item/clothing/suit/armored/light/duster/vet
	suit_store = /obj/item/gun/ballistic/automatic/pistol/n99
	glasses = /obj/item/clothing/glasses/f13/biker
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/toy/plush/snakeplushie = 1,
		/obj/item/viper_venom = 2,
		/obj/item/ammo_box/magazine/m10mm_adv = 2)

/datum/outfit/loadout/vagrant_jackal
	name = "Jackal"
	uniform = /obj/item/clothing/under/f13/raider_leather
	shoes = /obj/item/clothing/shoes/f13/raidertreads
	backpack_contents = list(
		/obj/item/twohanded/fireaxe/bmprsword = 1,
		/obj/item/reagent_containers/hypospray/medipen/medx = 1,
		/obj/item/reagent_containers/food/snacks/meat/cutlet/plain/human = 2,
		/obj/item/kitchen/knife/butcher = 1)


/*--------------------------------------------------------------*/
/datum/job/wastes/f13tribalmigrant
	title = "Tribal Migrant"
	flag = F13TRIBALMIGRANT
	faction = FACTION_WASTES
	total_positions = 5
	spawn_positions = 5
	description = "You are a member of some tribe that wandered into the area, maybe you'll take a look at the pretty colors in the big village, or scalp someone..."
	supervisors = "your instincts"

	loadout_options = list(
	/datum/outfit/loadout/nomad_oregon_cannibal,
	/datum/outfit/loadout/nomad_rustwalker,
	/datum/outfit/loadout/nomad_great_khan,
	/datum/outfit/loadout/nomad_tribal_trader,
	/datum/outfit/loadout/nomad_chosen_one,
	/datum/outfit/loadout/nomad_whiteleg,
	/datum/outfit/loadout/nomad_80
	)

/datum/outfit/job/wastes/f13tribalmigrant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_TRAPPER, src)
	ADD_TRAIT(H, TRAIT_MACHINE_SPIRITS, src)
	ADD_TRAIT(H, TRAIT_AUTO_DRAW, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	H.grant_language(/datum/language/tribal)
	var/list/recipes = list(
		/datum/crafting_recipe/tribal_combat_armor,
		/datum/crafting_recipe/tribal_combat_armor_helmet,
		/datum/crafting_recipe/tribal_r_combat_armor,
		/datum/crafting_recipe/tribal_r_combat_armor_helmet,
		/datum/crafting_recipe/tribalwar/chitinarmor,
		/datum/crafting_recipe/tribalwar/deathclawspear,
		/datum/crafting_recipe/tribalwar/lightcloak,
		/datum/crafting_recipe/tribalwar/legendaryclawcloak,
		/datum/crafting_recipe/warpaint,
		/datum/crafting_recipe/tribalradio,
		/datum/crafting_recipe/tribalwar/goliathcloak,
		/datum/crafting_recipe/tribalwar/bonebow,
		/datum/crafting_recipe/tribalwar/tribe_bow,
		/datum/crafting_recipe/tribalwar/sturdybow,
		/datum/crafting_recipe/tribalwar/warclub,
		/datum/crafting_recipe/tribalwar/silverbow,
		/datum/crafting_recipe/tribalwar/arrowbone,
		/datum/crafting_recipe/tribalwar/bonespear,
		/datum/crafting_recipe/tribalwar/bonecodpiece,
		/datum/crafting_recipe/tribalwar/bracers,
		/datum/crafting_recipe/tribal/bonetalisman,
		/datum/crafting_recipe/tribal/bonebag,
		/datum/crafting_recipe/tribalwar/spearquiver
	)
	for(var/datum/crafting_recipe/recipe as() in recipes)
		H.mind.teach_crafting_recipe(recipe)
	H.grant_language(/datum/language/tribal)
	H.social_faction = FACTION_WASTELAND
	add_verb(H, /mob/living/proc/create_tribe)

/datum/outfit/job/wastes/f13tribalmigrant
	name = "Tribal"
	jobtype = /datum/job/wastes/f13tribalmigrant
	id = null
	ears = null
	belt = /obj/item/melee/onehanded/knife/bone
	uniform = /obj/item/clothing/under/f13/settler
	box = /obj/item/storage/survivalkit_tribal
	shoes = /obj/item/clothing/shoes/sandal
	gloves = /obj/item/clothing/gloves/f13/handwraps
	r_hand = /obj/item/book/granter/trait/selection/tribal
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/warpaint_bowl = 1,
		/obj/item/melee/onehanded/knife/trench = 1,
		/obj/item/restraints/handcuffs = 2,
		)


/datum/outfit/loadout/nomad_oregon_cannibal
	name = "Oregeon Cannibal"
	uniform = /obj/item/clothing/under/f13/exile/tribal
	suit = /obj/item/clothing/suit/hooded/tribaloutcast
	suit_store = /obj/item/twohanded/spear/bonespear
	belt = /obj/item/storage/backpack/spearquiver
	backpack_contents = list(
		/obj/item/clothing/mask/cigarette/pipe = 1,
		/obj/item/melee/onehanded/knife/bone = 1,
		/obj/item/radio/tribal = 1,
		/obj/item/book/granter/trait/trekking = 1)

/datum/outfit/loadout/nomad_rustwalker
	name = "Rustwalkers Scipher"
	suit = /obj/item/clothing/suit/f13/tribal/rustwalkers
	backpack_contents = list(
		/obj/item/clothing/under/f13/rustwalkers = 1,
		/obj/item/clothing/under/f13/female/rustwalkers = 1,
		/obj/item/gun/ballistic/automatic/autopipe = 1,
		/obj/item/ammo_box/magazine/autopipe = 2,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/circular_saw = 1,
		/obj/item/storage/belt/utility/full = 1
	)

/datum/outfit/loadout/nomad_great_khan
	name = "Khan"
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/khan_jacket
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	uniform = /obj/item/clothing/under/f13/khan
	gloves = /obj/item/melee/unarmed/brass/spiked
	head = /obj/item/clothing/head/helmet/f13/khan/pelt
	shoes = /obj/item/clothing/shoes/f13/military/khan_pelt
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/improvised = 2)

/datum/outfit/loadout/nomad_tribal_trader
	name = "Tribal Trader"
	uniform = /obj/item/clothing/under/f13/tribe
	suit = /obj/item/clothing/suit/armored/light/tribalraider
	head = /obj/item/clothing/head/helmet/f13/fiend
	mask = /obj/item/clothing/mask/facewrap
	backpack_contents = list(
		/obj/item/twohanded/spear = 1,
		/obj/item/storage/box/vendingmachine = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2,
		/obj/item/storage/backpack/duffelbag/equipment/tribal_goods = 1
		)

/obj/item/storage/backpack/duffelbag/equipment/tribal_goods/PopulateContents()
	for(var/i in 1 to 5)
		var/randomGoods = pick(/obj/item/reagent_containers/pill/patch/healingpowder,
							  /obj/item/reagent_containers/food/drinks/bottle/f13nukacola,
							  /obj/item/restraints/handcuffs/sinew,
							  /obj/item/storage/pill_bottle/chem_tin/buffout,
							  /obj/item/reagent_containers/food/drinks/bottle/molotov/filled,
							  /obj/item/grenade/f13/dynamite,
							  /obj/item/restraints/legcuffs/beartrap,
							  /obj/item/throwing_star/tomahawk,
							  /obj/item/reagent_containers/pill/patch/bitterdrink,
							  /obj/item/restraints/legcuffs/bola,
							  /obj/item/binoculars,
							  /obj/item/reagent_containers/pill/patch/healpoultice,
							  /obj/item/twohanded/sledgehammer/warmace,
							  /obj/item/storage/backpack/spearquiver,
							  /obj/item/twohanded/fireaxe/bmprsword,
							  /obj/item/stack/medical/gauze/improvised)
		new randomGoods(src)

/datum/outfit/loadout/nomad_chosen_one
	name = "Chosen One"
	uniform = /obj/item/clothing/under/f13/chosen
	backpack_contents = list(
		/obj/item/clothing/under/f13/chosenf = 1,
		/obj/item/twohanded/spear = 1,
		/obj/item/stack/medical/gauze/improvised = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
	)

/datum/outfit/loadout/nomad_whiteleg
	name = "White Leg"
	suit = /obj/item/clothing/suit/f13/tribal/light/whitelegs
	uniform = /obj/item/clothing/under/f13/whitelegs
	backpack_contents = list(
		/obj/item/clothing/under/f13/female/whitelegs = 1,
		/obj/item/throwing_star/tomahawk = 3,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/book/granter/crafting_recipe/tribal/whitelegs = 1
	)

/datum/outfit/loadout/nomad_80
	name = "80s"
	suit = /obj/item/clothing/suit/armor/f13/raiders/roadwarriors
	belt = /obj/item/storage/backpack/spearquiver
	uniform = /obj/item/clothing/under/pants/f13/warboy
	head = /obj/item/clothing/head/helmet/f13/raider/arclight
	glasses = /obj/item/clothing/glasses/f13/biker
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/scrapsabre = 1,
		/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
		/obj/item/reagent_containers/pill/patch/turbo = 2,
		/obj/item/book/granter/crafting_recipe/tribal/eighties = 1)


