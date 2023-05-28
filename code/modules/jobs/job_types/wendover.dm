/*
Town access doors
Wendover government: 130  ACCESS_COMMAND
Sheriff/Deputy, Gatehouse etc: 62 ACCESS_GATEWAY
General access: 25 ACCESS_BAR
Clinic: 133 ACCESS_CLINIC
Church: 22 ACCESS_CHAPEL_OFFICE
Shopkeeper: 34 ACCESS_CARGO_BOT
Barkeep : 28 ACCESS_KITCHEN - you jebronis made default bar for no reason bruh
Prospector : 48 ACCESS_MINING
Detective : 4 ACCESS_FORENSICS_LOCKERS
here's a tip, go search DEFINES/access.dm
*/

/*
Mayor
*/

/datum/job/wendover
	exp_type = EXP_TYPE_WENDOVER
	faction = FACTION_WENDOVER

	matchmaking_allowed = list(
		/datum/matchmaking_pref/bounty_hunter = list(
			/datum/job/wasteland/f13raider,
			/datum/job/wendover,
			/datum/job/CaesarsLegion,
			/datum/job/whitelegs,
			/datum/job/eighties,
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/outlaw = list(
			/datum/job/wendover,
			/datum/job/wasteland,
		),
	)

/datum/job/wendover/f13wendovermayor
	title = "Mayor"
	flag = F13WNDMAYOR
	department_flag = WENDOVER
	total_positions = 1
	spawn_positions = 1
	supervisors = "Wendover"
	description = "You are the Mayor of Wendover, the last stop before the Great Salt Lake desert. With the fall of New Canaan to the White Legs, and decreased NCR Ranger presence due to the coming dustup at Hoover dam, trade along the I-80 has never been lower. The lack of traffic has caused the town to fall on hard times, but it's still the only speck of civilization for a hundred miles in any direction, and with a little luck and some shrewd diplomacy, Wendover can prosper again."
	selection_color = "#d7b088"
	exp_requirements = 900

	outfit = /datum/outfit/job/wendover/f13wendovermayor
	access = list(ACCESS_BAR, ACCESS_COMMAND, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS, ACCESS_SECURITY, ACCESS_ARMORY)
	minimal_access = list(ACCESS_BAR, ACCESS_COMMAND, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS, ACCESS_SECURITY, ACCESS_ARMORY)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wendover,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wendover,
		),
	)

	loadout_options = list(
			/datum/outfit/loadout/manofthepeople,
			/datum/outfit/loadout/executive,
			/datum/outfit/loadout/firstcitizen,
					)


/datum/outfit/job/wendover/f13wendovermayor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/wendover/f13wendovermayor
	name = "Mayor"
	jobtype = /datum/job/wendover/f13wendovermayor
	ears = 			/obj/item/radio/headset/headset_town
	id =            /obj/item/card/id/silver/mayor
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/oasis
	r_pocket = /obj/item/flashlight/seclite
	shoes = 		/obj/item/clothing/shoes/f13/tan
	uniform = /obj/item/clothing/under/f13/cowboyt
	suit = null
	head = null
	backpack_contents = list(
		/obj/item/storage/box/citizenship_permits = 1, \
		/obj/item/pda = 1,
		/obj/item/gun/ballistic/automatic/smg/smg10mm = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/ext= 1,
		)

/datum/outfit/loadout/manofthepeople
	name = "Frontier Leader"
	backpack_contents = list(
		/obj/item/clothing/suit/armor/f13/modif_r_vest = 1,
		/obj/item/clothing/under/f13/ranger/vet/thaxflannel = 1,
		/obj/item/clothing/under/f13/ranger/vet/foxflannel = 1,
		/obj/item/clothing/head/f13/cowboy = 1,
		/obj/item/gun/ballistic/revolver/revolver44 = 1,
		/obj/item/ammo_box/m44 = 4,
		/obj/item/clothing/shoes/f13/cowboy = 1,
		/obj/item/clothing/mask/cigarette/cigar = 1,
		)

/datum/outfit/loadout/firstcitizen
	name = "First Citizen"
	backpack_contents = list(
		/obj/item/clothing/under/f13/vault/v93 = 1,
		/obj/item/clothing/shoes/jackboots = 1,
		/obj/item/reagent_containers/food/drinks/flask/vault93 = 1,
		/obj/item/gun/energy/laser/pistol= 1,
		/obj/item/stock_parts/cell/ammo/ec = 1,
		/obj/item/clothing/head/helmet/riot/vaultsec = 1,
		/obj/item/clothing/suit/armored/light/vest/bulletproof = 1,
		)

/datum/outfit/loadout/executive
	name = "Executive"
	backpack_contents = list(
		/obj/item/clothing/suit/toggle/lawyer/black = 1,
		/obj/item/clothing/under/rank/security/detective/grey = 1,
		/obj/item/clothing/accessory/waistcoat = 1,
		/obj/item/clothing/shoes/laceup = 1,
		/obj/item/gun/ballistic/automatic/pistol/type17 = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
		/obj/item/clothing/suit/armor/f13/reno/bulletproof = 1,
	)


/*--------------------------------------------------------------*/

/datum/job/wendover/f13wendoversecretary
	title = "Secretary"
	flag = F13WNDSECRETARY
	department_flag = WENDOVER
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Mayor"
	description = "You are the mayor's assistant, you help them with anything and everything they require and make sure trivial problems do not concern them. You handle clerical work, hear complaints, and set meetings. An efficient and smooth running town means a happy mayor."
	selection_color = "#d7b088"

	outfit = /datum/outfit/job/wendover/f13wendoversecretary

	loadout_options = list(
	/datum/outfit/loadout/pr,
	/datum/outfit/loadout/pw,
	)

	access = list(ACCESS_BAR, ACCESS_COMMAND, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS, ACCESS_ARMORY)
	minimal_access = list(ACCESS_BAR, ACCESS_COMMAND, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS, ACCESS_ARMORY)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wendover,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wendover,
		),
	)

/datum/outfit/job/wendover/f13wendoversecretary/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/suit/modeusformalwear
		shoes = /obj/item/clothing/shoes/f13/highheels
	if(H.gender == MALE)
		uniform = /obj/item/clothing/under/rank/civilian/lawyer/black/alt
		shoes = /obj/item/clothing/shoes/f13/fancy

/datum/outfit/job/wendover/f13wendoversecretary
	name = "Secretary"
	jobtype = /datum/job/wendover/f13wendoversecretary

	ears = 			/obj/item/radio/headset/headset_town
	id =            /obj/item/card/id/silver
	glasses = /obj/item/clothing/glasses/regular/hipster
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	suit_store = /obj/item/gun/ballistic/automatic/pistol/n99
	r_hand = /obj/item/storage/briefcase/secretary
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/seclite
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
		/obj/item/melee/onehanded/knife/switchblade = 1,
		/obj/item/pda = 1,
		/obj/item/pen/fourcolor = 1,
		/obj/item/gun/ballistic/revolver/detective = 1,
		/obj/item/clothing/suit/armor/f13/reno/bulletproof = 1,
		)

/datum/outfit/loadout/pr
	name = "Public Relations"
	backpack_contents = list(
		/obj/item/megaphone = 1,
		/obj/item/reagent_containers/food/snacks/store/cake/birthday = 1,
		/obj/item/clothing/accessory/medal/ribbon = 1,
		/obj/item/clothing/gloves/color/latex/nitrile = 1,
		/obj/item/camera = 1,
		/obj/item/storage/crayons = 1,
		/obj/item/choice_beacon/box/carpet = 1,
		/obj/item/reagent_containers/food/drinks/bottle/champagne = 1,
		)

/datum/outfit/loadout/pw
	name = "Public Works"
	backpack_contents = list(
		/obj/item/clothing/head/hardhat = 1,
		/obj/item/clothing/suit/hazardvest = 1,
		/obj/item/stack/sheet/metal/twenty = 2,
		/obj/item/stack/sheet/glass/ten = 2,
		/obj/item/stack/sheet/mineral/concrete/ten = 2
		)

/datum/outfit/job/wendover/f13wendoversecretary/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policepistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steelbib/heavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/armyhelmetheavy)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)


/*--------------------------------------------------------------*/

/datum/job/wendover/f13desertranger
	title = "Sheriff"
	flag = F13DESERTRANGER
	department_flag = WENDOVER
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	supervisors = "the people of Wendover and the Mayor"
	description = "You are the democratically elected law enforcement in town, you are in charge of appointing deputies and organizing your team to defend the town and enforce its laws."
	selection_color = "#d7b088"
	exp_requirements = 600

	outfit = /datum/outfit/job/wendover/f13desertranger

	loadout_options = list(
	/datum/outfit/loadout/dessertranger,
	/datum/outfit/loadout/cowboy,
	/datum/outfit/loadout/tacticool,
	)

	access = list(ACCESS_BAR, ACCESS_SECURITY, ACCESS_LAWYER, ACCESS_COMMAND, ACCESS_ARMORY)
	minimal_access = list(ACCESS_BAR, ACCESS_SECURITY, ACCESS_LAWYER, ACCESS_COMMAND, ACCESS_ARMORY)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wendover,
			/datum/job/latterdaysaints,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wendover,
			/datum/job/ncr,
		),
	)

/datum/outfit/job/wendover/f13desertranger
	name = "Sheriff"
	jobtype = /datum/job/wendover/f13desertranger

	id = /obj/item/card/id/desertranger
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	ears = /obj/item/radio/headset/headset_wndranger
	uniform = /obj/item/clothing/under/f13/cowboyt
	
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/storage/bag/money/small/den
	backpack_contents = list(
		/obj/item/storage/box/deputy_badges = 1,
		/obj/item/restraints/handcuffs = 2,
		/obj/item/melee/classic_baton = 1,
		/obj/item/grenade/flashbang = 1,
		/obj/item/binoculars = 1,
		)

/datum/outfit/loadout/dessertranger
	name = "Desert Ranger"
	head = /obj/item/clothing/head/helmet/f13/rangercombat/eliteriot/reclaimed
	neck = /obj/item/storage/belt/holster
	belt = /obj/item/storage/belt/military/alt
	suit = /obj/item/clothing/suit/armor/f13/rangercombat/desert
	suit_store = /obj/item/gun/ballistic/automatic/marksman/sniper
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308 = 2,
		/obj/item/ammo_box/m44 = 3,
		/obj/item/gun/ballistic/revolver/revolver44/desert_ranger = 1,
		/obj/item/clothing/under/f13/ranger/modif_ranger = 1,
		/obj/item/clothing/suit/armor/f13/rangercombat/desert = 1,
		/obj/item/melee/onehanded/knife/trench = 1,
		)

/datum/outfit/loadout/cowboy
	name = "Sheriff"
	head = /obj/item/clothing/head/f13/cowboy
	neck = /obj/item/storage/belt/holster/ranger45
	belt = /obj/item/storage/belt/holster/ranger45
	suit = /obj/item/clothing/suit/armor/f13/modif_r_vest
	suit_store = /obj/item/gun/ballistic/rifle/repeater/trail
	backpack_contents = list(
		/obj/item/ammo_box/tube/m44 = 2,
		/obj/item/clothing/under/f13/ranger/trail = 1,
		/obj/item/clothing/mask/cigarette/pipe = 1,
		/obj/item/toy/cards/deck = 1,
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/clothing/suit/toggle/armor/f13/cloakranger = 1,
		/obj/item/clothing/accessory/waistcoat/sheepskin = 1,
		)

/datum/outfit/loadout/tacticool
	name = "Police Sergeant"
	head = /obj/item/clothing/head/helmet/police
	neck = /obj/item/storage/belt/holster/legholster/police
	belt = /obj/item/storage/belt/military/assault
	accessory = /obj/item/clothing/accessory/cia_badge
	glasses = /obj/item/clothing/glasses/sunglasses
	suit = /obj/item/clothing/suit/f13/police/chief
	suit_store = /obj/item/gun/ballistic/shotgun/police
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/bean = 1,
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/melee/classic_baton/telescopic = 1,
		/obj/item/reagent_containers/spray/pepper = 1,
		)

/datum/outfit/job/wendover/f13desertranger/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policepistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steelbib/heavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/armyhelmetheavy)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)

/*--------------------------------------------------------------*/

/datum/job/wendover/f13greenhorn
	title = "Deputy"
	flag = F13GREENHORN
	department_flag = WENDOVER
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Sheriff"
	description = "You have been appointed by the Sheriff to enforce the laws of the town and protect its inhabitants."
	selection_color = "#dcba97"

	loadout_options = list(
	/datum/outfit/loadout/greenhorn,
	/datum/outfit/loadout/beatcop,
	/datum/outfit/loadout/gumshoe,
	/datum/outfit/loadout/undercover,
	)

	outfit = /datum/outfit/job/wendover/f13greenhorn
	access = list(ACCESS_SECURITY, ACCESS_ARMORY)
	minimal_access = list(ACCESS_SECURITY, ACCESS_ARMORY)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wendover,
			/datum/job/latterdaysaints,
			/datum/job/ncr,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wendover,
			/datum/job/latterdaysaints,
			/datum/job/ncr,
			/datum/job/whitelegs,
			/datum/job/eighties,
		),
	)

/datum/outfit/job/wendover/f13greenhorn
	name = "Officer"
	jobtype = /datum/job/wendover/f13greenhorn
	ears = /obj/item/radio/headset/headset_wndranger
	id = /obj/item/card/id/greenhorn
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	belt = /obj/item/storage/belt/military/assault
	neck = /obj/item/storage/belt/holster/legholster/police
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/flare
	shoes = /obj/item/clothing/shoes/jackboots
	uniform = /obj/item/clothing/under/f13/cowboyb
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 2,
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/grenade/flashbang = 1,
		/obj/item/binoculars = 1,
		)

/datum/outfit/loadout/greenhorn
	name = "Greenhorn"
	head = /obj/item/clothing/head/helmet/f13/brahmincowboyhat
	suit = /obj/item/clothing/suit/armored/light/cowboyvest
	suit_store = /obj/item/gun/ballistic/rifle/repeater/cowboy
	gloves = /obj/item/clothing/gloves/rifleman
	shoes = /obj/item/clothing/shoes/cowboyboots
	backpack_contents = list(
		/obj/item/ammo_box/tube/a357 = 2,
		)

/datum/outfit/loadout/beatcop
	name = "Beat Cop"
	uniform = /obj/item/clothing/under/f13/police/lieutenant
	accessory = /obj/item/clothing/accessory/cia_badge
	head = /obj/item/clothing/head/f13/police/lieutenant
	gloves = /obj/item/clothing/gloves/color/black
	suit = /obj/item/clothing/suit/f13/police/lieutenant
	suit_store = /obj/item/gun/ballistic/shotgun/police
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/bean = 1,
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/melee/classic_baton/police = 1,
		/obj/item/reagent_containers/spray/pepper = 1,
		)

/datum/outfit/loadout/gumshoe
	name = "Gumshoe"
	uniform = /obj/item/clothing/under/f13/detectivealt
	accessory = /obj/item/clothing/accessory/cia_badge
	head = /obj/item/clothing/head/fedora
	gloves = /obj/item/clothing/gloves/color/black
	suit = /obj/item/clothing/suit/armor/f13/reno/bulletproof
	suit_store = /obj/item/gun/ballistic/automatic/assault_carbine/policerifle
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m5mm = 2,
		/obj/item/gun/ballistic/revolver/detective = 1,
		/obj/item/taperecorder = 1,
		/obj/item/camera = 1,
		)

/datum/outfit/loadout/undercover
	name = "Undercover"
	head = /obj/item/clothing/head/f13/town/officer
	mask = /obj/item/clothing/mask/fakemoustache
	uniform = /obj/item/clothing/under/misc/vice_officer
	accessory = /obj/item/clothing/accessory/cia_badge
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	suit = /obj/item/clothing/suit/f13/mfp/raider
	shoes = /obj/item/clothing/shoes/f13/diesel
	suit_store = /obj/item/gun/ballistic/rifle/hunting/remington
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/detective = 1,
		/obj/item/ammo_box/a762 = 3,
		/obj/item/book/granter/trait/rifleman = 1,
		)



/datum/outfit/job/wendover/f13greenhorn/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/*--------------------------------------------------------------*/

/datum/job/wendover/f13rancher
	title = "Farmer"
	flag = F13RANCHER
	department_flag = WENDOVER
	total_positions = 5
	spawn_positions = 5
	supervisors = "the Mayor"
	description = "The Salt Flats grow every year at the expense of what passes for fertile farmland in this county. There's an old abandoned farming community to the north, some plots lying around town, and if you're willing to get your hands dirty, with a shovel you could set up anywhere. The wasteland has a variety of flora on offer, but if you're hoping for something unirradiated, your best bet would be the vault below the town."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/wendover/f13rancher

	access = list(ACCESS_BAR)
	minimal_access = list(ACCESS_BAR)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wendover,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wendover,
		),
	)

/datum/outfit/job/wendover/f13rancher
	name = "Farmer"
	jobtype = /datum/job/wendover/f13rancher

	id = /obj/item/card/id/dogtag/town
	ears = 	/obj/item/radio/headset/headset_town
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/flare
	belt = /obj/item/storage/bag/plants
	shoes = /obj/item/clothing/shoes/workboots
	backpack_contents = list(
		/obj/item/cultivator = 1, \
		/obj/item/hatchet = 1,
		/obj/item/shovel/spade = 1, \
		/obj/item/gun/ballistic/automatic/pistol/n99, \
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 3)
	

/datum/outfit/job/wendover/f13rancher/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/brahminm, \
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)

/*--------------------------------------------------------------*/

/datum/job/wendover/f13scavver
	title = "Scavenger"
	flag = F13SCAVVER
	department_flag = WENDOVER
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Mayor"
	description = "A prospector in Wendover needs a keen eye, there's a lot more than old cars you can scavenge from the olden days. With a liberal use of your welder you're sure to find it. Of course, if you prefer scrapping old cars, most of them have been hauled away by the 80s to a hellish landscape east of town. Be careful if you head that way. And if you prefer traditional underground mining, there's a mine underneath the smithy in the bazaar downtown."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/wendover/f13scavver

	access = list(ACCESS_BAR, ACCESS_MINING)
	minimal_access = list(ACCESS_BAR, ACCESS_MINING)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wendover,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wendover,
		),
	)

/datum/outfit/job/wendover/f13scavver
	name = "Scavenger"
	jobtype = /datum/job/wendover/f13scavver

	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	suit = /obj/item/clothing/suit/armor/f13/utilityvest
	head = /obj/item/clothing/head/f13/stormchaser
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/lantern
	r_hand = /obj/item/pickaxe
	belt = /obj/item/storage/bag/ore
	shoes = /obj/item/clothing/shoes/workboots
	backpack_contents = list(
		/obj/item/mining_scanner,
		/obj/item/shovel,
		/obj/item/melee/onehanded/knife/hunting,
		/obj/item/gun/ballistic/automatic/pistol/n99,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
		/obj/item/storage/bag/salvage = 1,
		)

/datum/outfit/job/wendover/f13scavver/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/roving, \
		/obj/item/clothing/under/f13/cowboyt)

/datum/outfit/job/wendover/f13scavver/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/*--------------------------------------------------------------*/

/datum/job/wendover/f13radiohost
	title = "Radio Host"
	flag = F13RADIOHOST
	department_flag = WENDOVER
	total_positions = 1
	spawn_positions = 1
	supervisors = "the fans"
	description = "Keep the wastes informed, hold interviews, entertain your audience. Don't neglect your advertisers. And above all, make sure to use your radio channel, and not common."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/wendover/f13radiohost

	access = list(ACCESS_BAR, ACCESS_MINING)
	minimal_access = list(ACCESS_BAR, ACCESS_MINING)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wendover,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wendover,
		),
	)

/datum/outfit/job/wendover/f13radiohost
	name = "Radio Host"
	jobtype = /datum/job/wendover/f13radiohost

	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	belt = /obj/item/gun/ballistic/automatic/pistol/ninemil
	l_pocket = /obj/item/storage/bag/money/small/settler
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/camera = 1,
		/obj/item/camera_film = 1,
		/obj/item/tape = 3,
		/obj/item/taperecorder = 1,
		/obj/item/ammo_box/magazine/m9mmds = 2,
		/obj/item/encryptionkey/headset_wnd = 1,
		)

/datum/outfit/job/wendover/f13radiohost/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/bennys, \
		/obj/item/clothing/under/rank/civilian/lawyer/bluesuit, \
		/obj/item/clothing/under/suit_jacket/navy, \
		/obj/item/clothing/under/suit_jacket/tan, \
		/obj/item/clothing/under/suit_jacket/charcoal, \
		/obj/item/clothing/under/suit_jacket/checkered, \
		/obj/item/clothing/under/suit_jacket/burgundy, \
		/obj/item/clothing/under/rank/civilian/lawyer/bluesuit, \
		/obj/item/clothing/under/f13/merccharm)

/datum/outfit/job/wendover/f13radiohost/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	ADD_TRAIT(H, TRAIT_GENERIC, src)


/*--------------------------------------------------------------*/

/datum/job/wendover/f13montegobayhost
	title = "Montego Bay Host"
	flag = F13MOBAYHOST
	department_flag = WENDOVER
	total_positions = 1
	spawn_positions = 1
	supervisors = "the free market"
	description = "You are the proprietor of Wendover's only attraction, the Montego Bay Resort & Casino. Possessing a casino, a pool, rooms for rent, a stage, and a wide assortment of chems and alcohol. It's up to you to provide an irresistible experience or sink with the rest of the town."
	selection_color = "#dcba97"
	exp_requirements = 300

	outfit = /datum/outfit/job/wendover/f13montegobayhost

	access = list(ACCESS_LAWYER)
	minimal_access = list(ACCESS_LAWYER)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wendover,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wendover,
		),
	)

/datum/outfit/job/wendover/f13montegobayhost
	name = "Montego Bay Host"
	jobtype = /datum/job/wendover/f13montegobayhost

	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_montegobay
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	uniform = /obj/item/clothing/under/rank/security/detective/grey
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	suit_store = /obj/item/gun/ballistic/automatic/smg/smg10mm
	l_pocket = /obj/item/storage/bag/money/small/banker
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/lighter/gold = 1,
		/obj/item/clothing/mask/cigarette/pipe = 1,
		/obj/item/storage/fancy/cigarettes/cigars = 1,
		/obj/item/storage/fancy/cigarettes/cigpack_greytort = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/ext = 1
		)


/*--------------------------------------------------------------*/

/datum/job/wendover/f13montegobaystaff
	title = "Montego Bay Staff"
	flag = F13MOBAYSTAFF
	department_flag = WENDOVER
	total_positions = 5
	spawn_positions = 5
	supervisors = "your supervisor"
	description = "An employee of the best and only luxury resort casino in Wendover. Cater to your guest's every whim, obey the manager, and uphold the Montego Bay's reputation for unbeatable service."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/wendover/f13montegobaystaff

	access = list(ACCESS_LAWYER)
	minimal_access = list(ACCESS_LAWYER)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wendover,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wendover,
		),
	)

/datum/outfit/job/wendover/f13montegobaystaff
	name = "Montego Bay Staff"
	jobtype = /datum/job/wendover/f13montegobaystaff

	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_montegobay
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/leather
	l_pocket = /obj/item/storage/bag/money/small/settler
	uniform = /obj/item/clothing/under/suit/waiter
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/lighter = 1,
		/obj/item/pen/fountain = 1,
		/obj/item/storage/fancy/cracker_pack = 1,
		/obj/item/melee/onehanded/knife/cosmicdirty = 1,
		/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
		)

/datum/outfit/job/wendover/f13montegobaystaff/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_FRIENDLY, src)

/*--------------------------------------------------------------*/

/datum/job/wendover/f13kebab
	title = "Bartender"
	flag = F13KEBAB
	department_flag = WENDOVER
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Mayor"
	description = "You live in the town of Wendover, on the Nevada/Utah border, the last stop for travelers on the I-80 headed between California and New Canaan. Your restaurant is located in the center of town in the bazaar, prime real estate, even if your accomodations could be considered lacking compared to the Montego Bay."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/wendover/f13kebab

	loadout_options = list(
	/datum/outfit/loadout/rugged,
	/datum/outfit/loadout/frontier,
	/datum/outfit/loadout/richmantender,
	/datum/outfit/loadout/diner,
	)

	access = list(ACCESS_BAR, ACCESS_KITCHEN)
	minimal_access = list(ACCESS_BAR, ACCESS_KITCHEN)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wendover,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wendover,
		),
	)


/datum/outfit/job/wendover/f13kebab
	name = "Bartender"
	jobtype = /datum/job/wendover/f13kebab

	uniform = /obj/item/clothing/under/f13/bartenderalt
	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	belt = /obj/item/gun/ballistic/revolver/caravan_shotgun
	shoes = /obj/item/clothing/shoes/workboots/mining
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/storage/bag/money/small/settler = 1,
		/obj/item/book/granter/action/drink_fling = 1,
		/obj/item/ammo_box/shotgun/bean = 2,
		/obj/item/book/manual/nuka_recipes = 1,
		/obj/item/stack/f13Cash/caps/onezerozero = 1,
		/obj/item/reagent_containers/food/drinks/bottle/rotgut = 1,
		)

/datum/outfit/loadout/rugged
	name = "Rugged"
	head = /obj/item/clothing/head/helmet/f13/brahmincowboyhat
	uniform = /obj/item/clothing/under/f13/cowboyb
	suit = /obj/item/clothing/suit/f13/cowboybvest
	gloves = /obj/item/clothing/gloves/color/brown
	shoes = /obj/item/clothing/shoes/f13/brownie

/datum/outfit/loadout/frontier
	name = "Frontier"
	head = /obj/item/clothing/head/bowler
	mask = /obj/item/clothing/mask/fakemoustache
	uniform = /obj/item/clothing/under/f13/westender
	suit = /obj/item/clothing/suit/f13/westender
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/f13/fancy

/datum/outfit/loadout/richmantender
	name = "Fancy"
	head = /obj/item/clothing/head/fedora
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/bartender
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/f13/fancy
	neck = /obj/item/clothing/neck/tie/black

/datum/outfit/loadout/diner
	name = "Diner"
	glasses = /obj/item/clothing/glasses/orange
	uniform = /obj/item/clothing/under/f13/brahminf
	neck = /obj/item/clothing/neck/apron/chef
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/f13/military/ncr

/*--------------------------------------------------------------*/
/datum/job/wendover/f13townsperson
	title = "Citizen"
	flag = F13TOWNSPERSON
	department_flag = WENDOVER
	total_positions = 8
	spawn_positions = 8
	supervisors = "the Mayor"
	description = "You live in the town of Wendover, on the Nevada/Utah border, the last stop for travelers on the I-80 headed from California to New Canaan."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/wendover/f13townsperson

	loadout_options = list(
		/datum/outfit/loadout/provisioner,
		/datum/outfit/loadout/hobo,
		/datum/outfit/loadout/mechanic,
		/datum/outfit/loadout/wanderer,
		/datum/outfit/loadout/norcal,
		/datum/outfit/loadout/singer,
	)
	access = list(ACCESS_BAR)
	minimal_access = list(ACCESS_BAR)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wendover,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wendover,
		),
	)

/datum/outfit/job/wendover/f13townsperson
	name = "Citizen"
	jobtype = /datum/job/wendover/f13townsperson
	ears = /obj/item/radio/headset/headset_town
	belt = null
	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/jackboots
	backpack = /obj/item/storage/backpack/satchel/explorer
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/book/granter/trait/selection
	backpack_contents = list(
		/obj/item/storage/bag/money/small/settler = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		)

/datum/outfit/loadout/provisioner
	name = "Hunter"
	neck = /obj/item/clothing/neck/scarf/cptpatriot
	suit = /obj/item/clothing/suit/armor/f13/modif_r_vest
	head = /obj/item/clothing/head/helmet/f13/brahmincowboyhat
	uniform = /obj/item/clothing/under/f13/merca
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	shoes = /obj/item/clothing/shoes/f13/explorer
	backpack_contents = list(/obj/item/reagent_containers/food/drinks/flask = 1,
	/obj/item/gun/ballistic/revolver/widowmaker = 1,
	/obj/item/ammo_box/shotgun/buck = 2,
	)

/datum/outfit/loadout/hobo
	name = "Hobo"
	head = /obj/item/clothing/head/soft/grey
	belt = /obj/item/storage/belt
	suit = /obj/item/clothing/under/f13/mechanic
	shoes = /obj/item/clothing/shoes/f13/raidertreads
	gloves = /obj/item/clothing/gloves/color/yellow
	backpack_contents = list(/obj/item/storage/bag/trash = 1, /obj/item/reagent_containers/spray/cleaner = 1,
	/obj/item/gun/ballistic/revolver/hobo/piperifle = 1,
	/obj/item/ammo_box/a556/stripper = 2,
	/obj/item/picket_sign = 1,
	/obj/item/pen = 1,
	)

/datum/outfit/loadout/mechanic
	name = "Mechanic"
	glasses = /obj/item/clothing/glasses/welding
	suit = /obj/item/clothing/under/f13/petrochico
	belt = /obj/item/storage/belt/utility
	gloves = /obj/item/clothing/gloves/f13/blacksmith
	backpack_contents = list(/obj/item/twohanded/sledgehammer/simple = 1,
	/obj/item/stack/sheet/metal/twenty = 1,
	/obj/item/book/granter/crafting_recipe/ODF = 1,
	/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
	/obj/item/ammo_box/magazine/m10mm_adv/simple = 1,
	)

/datum/outfit/loadout/wanderer
	name = "Wanderer"
	head = /obj/item/clothing/head/f13/stormchaser
	suit = /obj/item/clothing/suit/f13/veteran
	belt = /obj/item/storage/belt/bandolier
	uniform = /obj/item/clothing/under/f13/mercc
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
	/obj/item/ammo_box/magazine/m9mmds = 2,
	)

/datum/outfit/loadout/norcal
	name = "Caravaneer"
	head = /obj/item/clothing/head/f13/cowboy
	suit = /obj/item/clothing/suit/jacket/flannel/red
	uniform = /obj/item/clothing/under/pants/khaki
	r_hand = /obj/item/gun/ballistic/rifle/hunting
	backpack_contents = list(/obj/item/ammo_box/a308 = 2, 
	/obj/item/storage/bag/money/small/ncrenlisted = 1,
	/obj/item/card/id/dogtag/town/ncr = 1,
	)

/datum/outfit/loadout/singer
	name = "Entertainer"
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(/obj/item/clothing/under/f13/classdress = 1,
	/obj/item/clothing/under/suit/black_really = 1,
	/obj/item/clothing/gloves/evening = 1,
	/obj/item/clothing/gloves/color/white = 1,
	/obj/item/gun/ballistic/revolver/police = 1,
	/obj/item/ammo_box/a357 = 2,
	)

/*----------------------------------------------------------------
--							Detective							--
----------------------------------------------------------------*/
/*datum/job/oasis/f13detective
	title = "Detective"
	flag = F13DETECTIVE
	total_positions = 0
	spawn_positions = 0
	description = "As a Detective you are a private eye who assists clients to gather evidence, conduct surveillance, find missing people, and verify information. As a private investigator you are not responsible for peacekeeping the valley, but for finding answers. Your life is already over, make the ending mean something."
	supervisors = "paying clients"
	selection_color = "#dcba97"
	outfit = /datum/outfit/job/oasis/f13detective

	access = list(ACCESS_BAR, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/wendover/f13detective,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/wendover/f13detective,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/wasteland/f13wastelander,
		),
	)


/datum/outfit/job/oasis/f13detective
	name = "Detective"
	jobtype = /datum/job/wendover/f13detective
	suit = /obj/item/clothing/suit/det_suit/grey
	ears = /obj/item/radio/headset/headset_town
	uniform = /obj/item/clothing/under/f13/detectivealt
	head = /obj/item/clothing/head/f13/det_hat_alt
	shoes =  /obj/item/clothing/shoes/laceup
	id = /obj/item/card/id/silver
	l_pocket = /obj/item/storage/bag/money/small/oasis
	r_pocket = /obj/item/flashlight/flare
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	suit_store = /obj/item/gun/ballistic/revolver/police
	backpack_contents = list(
		/obj/item/pda/detective=1,
		/obj/item/camera/detective=1,
		/obj/item/toy/crayon/white=1,
		/obj/item/detective_scanner=1,
		/obj/item/storage/box/gloves=1,
		/obj/item/storage/box/evidence=1,
		/obj/item/ammo_box/a357=2)

*/
/*--------------------------------------------------------------*/

/datum/job/wendover/f13pawnshop
	title = "Shopkeeper"
	flag = F13PAWNSHOP
	department_flag = WENDOVER
	total_positions = 1
	spawn_positions = 1
	supervisors = "the free hand of the market"
	description = "The greed of the United States survived better than its people. You are an organ of this greed. Ensure its continuation."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/wendover/f13pawnshop
	access = list(ACCESS_BAR, ACCESS_CARGO_BOT)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wendover,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wendover,
		),
	)

/datum/outfit/job/wendover/f13pawnshop
	name = "Shopkeeper"
	jobtype = /datum/job/wendover/f13pawnshop

	id = /obj/item/card/id/dogtag/town
	uniform = /obj/item/clothing/under/f13/roving
	ears = /obj/item/radio/headset/headset_town
	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	gloves = /obj/item/clothing/gloves/fingerless
	l_pocket = /obj/item/storage/bag/money/small/oasis
	r_pocket = /obj/item/flashlight/glowstick
	shoes = /obj/item/clothing/shoes/f13/explorer
	backpack_contents = list(/obj/item/storage/box/shopkeeper = 1)

/datum/outfit/job/wendover/f13pawnshop/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policepistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steelbib/heavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/armyhelmetheavy)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/trail_carbine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lever_action)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/a180)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/varmintrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingshotgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/thatgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/uzi)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/smg10mm)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/frag_shrapnel)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/concussion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/explosive/shrapnelmine)

/datum/outfit/job/wendover/f13pawnshop/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	
/datum/job/wendover/f13entrepreneur
	title = "Entrepreneur"
	flag = F13ENTREPRENEUR
	department_flag = WENDOVER
	total_positions = 1
	spawn_positions = 1
	supervisors = "free hand of the market"
	description = "One way or another you've saved up a hefty sum of caps, and one way or another you're introducing them to the local economy. Start a business, invest in someone else's, or get robbed by one of the local tribes."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/wendover/f13entrepreneur
	access = list(ACCESS_BAR, ACCESS_CARGO_BOT)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wendover,
			/datum/job/ncr,
			/datum/job/latterdaysaints,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wendover,
			/datum/job/ncr,
			/datum/job/latterdaysaints,
		),
	)

/datum/outfit/job/wendover/f13entrepreneur
	name = "Entrepreneur"
	jobtype = /datum/job/wendover/f13entrepreneur

	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	backpack = /obj/item/storage/backpack/satchel/leather/withwallet
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	gloves = null
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/lighter = 1,
		/obj/item/stack/f13Cash/caps/onezerozerozero = 1,
		)
/datum/outfit/job/wendover/f13entrepreneur/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/bennys, \
		/obj/item/clothing/under/suit_jacket/navy, \
		/obj/item/clothing/under/suit_jacket/tan, \
		/obj/item/clothing/under/suit_jacket/charcoal, \
		/obj/item/clothing/under/suit_jacket/checkered, \
		/obj/item/clothing/under/suit_jacket/burgundy, \
		/obj/item/clothing/under/f13/merccharm)
