/*
BoS access:
Main doors: ACCESS_CAPTAIN 20
*/

/datum/job/losthills //do NOT use this for anything, it's just to store faction datums.
	department_flag = LOSTHILLS
	selection_color = "#95a5a6"
	faction = FACTION_LOSTHILLS
	maptype = "reno"

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals, and cruel torture or experiments on the minds or bodies of prisoners."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	outfit = /datum/outfit/job/losthills/
	exp_type = EXP_TYPE_LOSTHILLS

/datum/outfit/job/losthills
	name = "bosdatums"
	jobtype = 	/datum/job/losthills
	backpack = 	/obj/item/storage/backpack/explorer
	satchel = 	/obj/item/storage/backpack/satchel/explorer
	ears = 		/obj/item/radio/headset/headset_bos
	uniform =	/obj/item/clothing/under/syndicate/brotherhood
	shoes = 	/obj/item/clothing/shoes/combat/swat
	gloves = 	/obj/item/clothing/gloves/combat
	id = 		/obj/item/card/id/dogtag
	box = 		/obj/item/storage/survivalkit_adv


/datum/outfit/job/losthills/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

/datum/outfit/job/losthills/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombatarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombatarmormk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombathelmetmk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/set_vrboard/bos)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gate_bos)

/*
Paladin
*/

/datum/job/losthills/f13lhpaladin
	title = "BOS Paladin"
	flag = F13LHPALADIN
	total_positions = 1
	spawn_positions = 1
	description = "You are the acting field commander until the Brotherhood regains its strength enough to place an Elder for the bunker. And as that authority you are tasked with keeping the bunker operating and out of the sight of the NCR. You are also to recover technology where you can and claim dangerous technology from the hands of the primitives aboveground."
	supervisors = "the Council of Elders"
	selection_color = "#95a5a6"
	exp_requirements = 1000
	exp_type = EXP_TYPE_LOSTHILLS

	loadout_options = list(
	/datum/outfit/loadout/lh_paladina, //Minigun
	/datum/outfit/loadout/lh_paladinb, //WT-550
	/datum/outfit/loadout/lh_paladinc, //Aer9
	/datum/outfit/loadout/lh_paladind //Sledge and fists
	)

	outfit = /datum/outfit/job/losthills/f13lhpaladin

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/losthills,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/losthills,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/losthills/f13lhinitiate,
		),
	)

/datum/outfit/job/losthills/f13paladin/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)

/datum/outfit/job/losthills/f13lhpaladin
	name =	"Paladin"
	jobtype =	/datum/job/losthills/f13lhpaladin
	suit =	/obj/item/clothing/suit/armor/f13/power_armor/t51b/bos
	head =	/obj/item/clothing/head/helmet/f13/power_armor/t51b/bos
	uniform =	/obj/item/clothing/under/f13/recon
	mask =	/obj/item/clothing/mask/gas/sechailer
	belt =	/obj/item/storage/belt/military/assault
	neck =	/obj/item/clothing/neck/mantle/bos/paladin
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak= 1,

	)

/datum/outfit/loadout/lh_paladina
	name = "Firesupport Paladin"
	backpack_contents = list(
		/obj/item/minigunpackbal5mm = 1,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/clothing/accessory/bos/paladin=1,
	)

/datum/outfit/loadout/lh_paladinb
	name = "Tactical Paladin"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/wt550 = 1,
		/obj/item/ammo_box/magazine/m473/small = 3,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/clothing/accessory/bos/paladin=1,
		)

/datum/outfit/loadout/lh_paladinc
	name = "Frontline Paladin"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer9 = 1,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/clothing/accessory/bos/paladin=1
		)

/datum/outfit/loadout/lh_paladind
	name = "Melee Specialist"
	backpack_contents = list(
		/obj/item/melee/powerfist/f13 = 1,
		/obj/item/twohanded/sledgehammer/supersledge =1,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/clothing/accessory/bos/paladin=1
		)

/*
Senior Knight
*/

/datum/job/losthills/f13lhseniorknight
	title = "BOS Senior Knight"
	flag = F13LHSENIORKNIGHT
	total_positions = 1
	spawn_positions = 1
	description = "You are a Brotherhood of Steel Senior Knight. As you have risen to this rank you are tasked with the organization of the knights beneath you and relaying the commands of the Paladin, while also acting as the primary maintainer of the Bunker's facilities and its equipment."
	supervisors = "the paladin"
	selection_color = "#95a5a6"
	exp_requirements = 800

	loadout_options = list(
	/datum/outfit/loadout/lh_sknighta, //AER9
	/datum/outfit/loadout/lh_sknightb, //Browning Auto-5
	/datum/outfit/loadout/lh_sknightc, //R93 PDW
	/datum/outfit/loadout/lh_sknightd,
	)

	outfit = /datum/outfit/job/losthills/f13lhseniorknight

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/losthills,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/losthills,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/losthills/f13lhknight,
		),
	)

/datum/outfit/job/losthills/f13seniorknight/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AER9)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AEP7)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/dks)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/R93)

/datum/outfit/job/losthills/f13lhseniorknight
	name = "Senior Knight"
	jobtype = /datum/job/losthills/f13lhseniorknight
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood/senior
	accessory = 	/obj/item/clothing/accessory/bos/seniorknight
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	glasses =       /obj/item/clothing/glasses/night
	mask =			/obj/item/clothing/mask/gas/sechailer
	belt = 			/obj/item/storage/belt/military/assault
	neck =			/obj/item/storage/belt/holster
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood/senior
	id = 			/obj/item/card/id/dogtag
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = TRUE
	gunsmith_four = TRUE
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/hunting=1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2,
		/obj/item/book/granter/crafting_recipe/gunsmithing/gunsmith_one=1,
		/obj/item/book/granter/crafting_recipe/gunsmithing/gunsmith_two=1
		)

/datum/outfit/loadout/lh_sknighta
	name = "Footknight"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer9=1,
		/obj/item/stock_parts/cell/ammo/mfc=2,
		/obj/item/attachments/scope = 1,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2,
		)

/datum/outfit/loadout/lh_sknightb
	name = "Knight-Defender"
	backpack_contents = list(
		/obj/item/gun/ballistic/shotgun/police=1,
		/obj/item/ammo_box/shotgun/buck=2,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		)

/datum/outfit/loadout/lh_sknightc
	name = "Recon"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/r93=1,
		/obj/item/ammo_box/magazine/m556/rifle=2,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		)

/datum/outfit/loadout/lh_sknightd
	name = "Senior Knight-Cavalry"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/juniorknight=1,
		/obj/item/melee/powered/ripper/prewar=1,
		/obj/item/shield/riot/bullet_proof=1,
		)

/*
Knight
*/

/datum/job/losthills/f13lhknight
	title = "BOS Knight"
	flag = F13LHKNIGHT
	total_positions = 2
	spawn_positions = 2
	description = " You are the Brotherhood Knight, the veritable lifeblood of your organization. You are a versatile and adaptably trained person: from your primary duties of weapon & armor repair to basic combat, survival and stealth skills, the only thing you lack is proper experience. You are also in charge of Initiates."
	supervisors = "the Senior Knight"
	selection_color = "#95a5a6"

	exp_requirements = 600

	loadout_options = list(
	/datum/outfit/loadout/lh_knighta, //AER9
	/datum/outfit/loadout/lh_knightb, //R82
	/datum/outfit/loadout/lh_knightc, //AER9S
	/datum/outfit/loadout/lh_knightd, //R82 J
	/datum/outfit/loadout/lh_knighte, //Ripper J
	/datum/outfit/loadout/lh_knightf, //Ripper S
	)

	outfit = /datum/outfit/job/losthills/f13lhknight

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/losthills,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/losthills,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/losthills/f13lhinitiate,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/losthills/f13lhseniorknight,
		),
	)

/datum/outfit/job/losthills/f13lhknight/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AER9)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AEP7)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/dks)

/datum/outfit/job/losthills/f13lhknight
	name = "Knight"
	jobtype = /datum/job/losthills/f13lhknight
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	mask =			/obj/item/clothing/mask/gas/sechailer
	belt = 			/obj/item/storage/belt/military/assault
	neck =			/obj/item/storage/belt/holster
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood
	id = 			/obj/item/card/id/dogtag
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = TRUE
	gunsmith_four = TRUE
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival=1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1,
		/obj/item/book/granter/crafting_recipe/gunsmithing/gunsmith_one=1,
		/obj/item/book/granter/crafting_recipe/gunsmithing/gunsmith_two=1
		)

/datum/outfit/loadout/lh_knighta
	name = "Junior Footknight"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/juniorknight=1,
		/obj/item/gun/energy/laser/aer9=1,
		/obj/item/stock_parts/cell/ammo/mfc=2,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2,
		)

/datum/outfit/loadout/lh_knightb
	name = "Junior Knight-Defender"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/juniorknight=1,
		/obj/item/gun/ballistic/automatic/r93=1,
		/obj/item/ammo_box/magazine/m556/rifle=2,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		)

/datum/outfit/loadout/lh_knightc
	name = "Junior Knight-Cavalry"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/juniorknight=1,
		/obj/item/melee/powered/ripper=1,
		/obj/item/shield/riot/bullet_proof=1,
		)


/datum/outfit/loadout/lh_knightd
	name = "Footknight"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/knight=1,
		/obj/item/gun/energy/laser/aer9=1,
		/obj/item/stock_parts/cell/ammo/mfc=2,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2,
		)

/datum/outfit/loadout/lh_knighte
	name = "Knight-Defender"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/knight=1,
		/obj/item/gun/ballistic/automatic/smg/mp5=1,
		/obj/item/ammo_box/magazine/uzim9mm=2,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		)

/datum/outfit/loadout/lh_knightf
	name = "Knight-Cavalry"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/knight=1,
		/obj/item/melee/powered/ripper=1,
		/obj/item/shield/riot/bullet_proof=1,
		)

/*
Senior Scribe
*/

/datum/job/losthills/f13lhseniorscribe
	title = "BOS Senior Scribe"
	flag = F13LHSENIORSCRIBE
	total_positions = 1
	spawn_positions = 1
	description =  "You are the bunker's seniormost medical and scientific expert in the bunker. You are trained in both medicine and engineering, while also having extensive studies of the old world to assist in pinpointing what technology would be useful to the Brotherhood and its interests."
	supervisors = "the Paladin"
	selection_color = "#95a5a6"

	exp_requirements = 800

	outfit = /datum/outfit/job/losthills/f13lhseniorscribe

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/losthills,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/losthills,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/losthills/f13lhscribe,
		),
	)


/datum/outfit/job/losthills/f13lhseniorscribe/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST, src)

/datum/outfit/job/losthills/f13seniorscribe
	name =	"Senior Scribe"
	jobtype =	/datum/job/losthills/f13lhseniorscribe
	chemwhiz =	TRUE
	uniform =	/obj/item/clothing/under/syndicate/brotherhood
	shoes =	/obj/item/clothing/shoes/combat
	belt =	/obj/item/storage/belt/utility/full/engi
	accessory =	/obj/item/clothing/accessory/bos/seniorscribe
	suit =	/obj/item/clothing/suit/f13/seniorscribe
	id =	/obj/item/card/id/dogtag
	glasses =	/obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/storage/firstaid/regular = 1,
		/obj/item/reagent_containers/hypospray/CMO = 1,
	)

/*
Scribe
*/

/datum/job/losthills/f13lhscribe
	title = "BOS Scribe"
	flag = F13LHSCRIBE
	total_positions = 2
	spawn_positions = 2
	description = "You answer directly to the Senior Scribe, tasked with researching and reverse-engineering recovered technologies from the old world, while maintaining the brotherhoods scientific archives. You may also be given a trainee to assign duties to."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals, and cruel torture or experiments on the minds or bodies of prisoners."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Senior Scribe"
	selection_color = "#95a5a6"

	exp_requirements = 600

	loadout_options = list(
	/datum/outfit/loadout/lh_scribea,
	/datum/outfit/loadout/lh_scribeb,
	)

	outfit = /datum/outfit/job/losthills/f13lhscribe

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/losthills,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/losthills,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/losthills/f13lhinitiate,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/losthills/f13lhseniorscribe,
		),
	)

/datum/outfit/job/losthills/f13lhscribe
	name = "Scribe"
	jobtype = /datum/job/losthills/f13lhscribe
	chemwhiz = TRUE
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	shoes = 		/obj/item/clothing/shoes/combat
	belt = 			/obj/item/storage/belt/utility/full/engi
	suit = 			/obj/item/clothing/suit/f13/scribe
	id = 			/obj/item/card/id/dogtag
	glasses =		/obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/melee/onehanded/knife/survival=1,
		/obj/item/storage/firstaid/regular=1,
		)

/datum/outfit/job/losthills/f13lhscribe/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)
	ADD_TRAIT(H, TRAIT_MEDICALGRADUATE, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)

/datum/outfit/loadout/lh_scribea
	name = "Junior Scribe"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/juniorscribe=1,
		)

/datum/outfit/loadout/lh_scribeb
	name = "Scribe"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/scribe=1,
		)

/*
Initiate
*/

/datum/job/losthills/f13lhinitiate
	title = "BOS Initiate"
	flag = F13LHINITIATE
	total_positions = 2
	spawn_positions = 2
	description = "Either an absurdly rare exception or one who has come of age in the Brotherhood, you have been given the honor to study the ancient ways. You are to assist your superiors and receive training from them. Attempt to get one to agree to be your mentor. Never leave the bunker unless on a mission given to you by a superior."
	supervisors = "the scribes or knights"
	selection_color = "#95a5a6"

	exp_type = EXP_TYPE_FALLOUT
	exp_requirements = 0

	loadout_options = list(
	/datum/outfit/loadout/lh_initiatek, //AEP7 and Engibelt with combat armor, no helmet
	/datum/outfit/loadout/lh_initiates, //Medical belt and chem knowledge
	)

	outfit = /datum/outfit/job/losthills/f13lhinitiate

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/losthills,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/losthills,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/losthills/f13lhknight,
			/datum/job/losthills/f13lhscribe,
		),
	)

/datum/outfit/job/losthills/f13lhinitiate
	name = "Initiate"
	jobtype = /datum/job/losthills/f13lhinitiate
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	shoes = 		/obj/item/clothing/shoes/combat/swat
	gloves = 		/obj/item/clothing/gloves/combat
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival = 1,
		)

/datum/outfit/job/losthills/f13initiate/post_equip(mob/living/carbon/human/H, visualsOnly)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_LOW, src)


/datum/outfit/loadout/lh_initiatek
	name = "Knight-Aspirant"
	belt = 			/obj/item/storage/belt/utility/full/engi
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood/initiate
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood/initiate
	backpack_contents = list(
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/book/granter/crafting_recipe/gunsmithing/gunsmith_one=1,
		/obj/item/book/granter/crafting_recipe/gunsmithing/gunsmith_two=1,
		/obj/item/clothing/accessory/bos/initiateK=1,
		)

/datum/outfit/loadout/lh_initiates
	name = "Scribe-Aspirant"
	belt =			/obj/item/storage/belt/medical
	suit =			/obj/item/clothing/suit/toggle/labcoat
	glasses =		/obj/item/clothing/glasses/science
	gloves =		/obj/item/clothing/gloves/color/latex
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1,
		/obj/item/book/granter/trait/chemistry=1,
		/obj/item/clothing/accessory/bos/initiateS=1,
		)

/datum/outfit/job/losthills/f13lhoffdutybos
	name = "BoS Off-Duty"
	backpack_contents = list(
		/obj/item/toy/cards/deck = 1
		)


