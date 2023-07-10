/datum/job/wrights //do NOT use this for anything, it's just to store faction datums
	department_flag = WRIGHTS
	selection_color = "#B3875E"
	faction = FACTION_WRIGHTS
	exp_type = EXP_TYPE_WRIGHTS
	maptype = "reno"

	access = list(ACCESS_WRIGHTS)
	minimal_access = list(ACCESS_WRIGHTS)
	forbids = "The Wright family forbids: Due to the relations of the family with the Temperance Faction of New Reno, gambling, prostitution, and drugs are forbidden. Also, due to the close blood ties among the members of the families, ghouls are not allowed."
	enforces = "The Wright family demands: The Wrights are the only Reno family that are a literal family, so it is expected of all of its members to have blood ties to the family. Due to this, extreme loyalty and obedience to a strong chain of command are also expected of its members. Wearing the family suit is required, unless acting as an infiltrator."
	objectivesList = list ("Focus on the mass production of cheap guns.", "Focus on the mass production of alcohol to provide to the other families and the people of New Reno.", "Extort the small businesses of New Reno to get a cut from their profits, but be weary, the other families may want a cut from them too.")
/*--------------------------------------------------------------*/

/datum/job/wrights/f13boss
	title = "Wrights Boss"
	flag = F13WRIGHTSBOSS
	department_flag = WRIGHTS
	total_positions = 1
	spawn_positions = 1
	supervisors = "yourself"
	description = "You are the head of the Wright family. Although small, the Wrights are a proud and prosperous family, and it falls onto you to ensure that all the members keep the core tenets of your organization by avoiding both the consumption and distribution of chems and prostitution. To compensate, you have in your power the monopoly to the local production of alcohol and access to most of the cheap guns in the area. Assign soldiers to your capos. Allow capos to have some level of autonomy regarding their soldiers, as long as it doesn't hinder the flow of business. Talk to your underboss to help you coordinate the affairs of the gang. You are the most proper and correct family in New Reno: Be polite, don't act like a thug, and keep bums and vagrants away from your territory."
	selection_color = "#A27954"
	exp_requirements = EXP_TYPE_WRIGHTS

	outfit = /datum/outfit/job/wrights/f13boss
/*
	loadout_options = list(
	/datum/outfit/loadout/pr,
	/datum/outfit/loadout/pw,
	)

	access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)
*/
/datum/outfit/job/wrights/f13boss
	name = "Boss"
	jobtype = /datum/job/wrights/f13boss

	ears = /obj/item/radio/headset
	id = /obj/item/card/id/reno/wrights/ring/boss
	//glasses =
	//gloves =
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	r_hand = /obj/item/gun/ballistic/revolver/caravan_shotgun
	r_pocket = /obj/item/stock_parts/cell/ammo/ec
	mask = /obj/item/clothing/mask/cigarette/pipe
	head = /obj/item/clothing/head/helmet/f13/wrights/tophat
	neck = /obj/item/storage/belt/holster/legholster
	shoes = /obj/item/clothing/shoes/laceup
	suit =/obj/item/clothing/suit/armor/f13/reno/bulletproof
	uniform = /obj/item/clothing/under/f13/wrights/boss
	belt = /obj/item/gun/ballistic/revolver/m29
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/ammo_box/m44 = 1,
		/obj/item/storage/bag/money/small/reno/cap/onefivezero = 1,
		/obj/item/circular_saw = 1,
		/obj/item/melee/onehanded/knife/switchblade = 1,
		/obj/item/reagent_containers/food/snacks/grown/tobacco/dried = 2,
		)

/*--------------------------------------------------------------*/

/datum/job/wrights/f13underboss
	title = "Wrights Underboss"
	flag = F13WRIGHTSUNDERBOSS
	department_flag = WRIGHTS
	total_positions = 1
	spawn_positions = 1
	supervisors = "Wright Boss"
	description = "You are one of the most trusted members of the family and, as such, you have been assigned to answer directly to the Boss himself. Your role may vary from a simple consigliere, to a diplomat with the other families, to assigning soldiers to the capos, or even as the chief supervisor of the family businesses; keep the dialogue with the boss constant and clear to know what he needs from you. Assert the core tenets of the Wright family to your subordinates by making them avoid drugs and prostitution, and enforce loyalty as well among the ranks. Remember that you are also bound by these tenets; treason against the boss is out of the question. Should the boss be unable to lead the family, the job will fall unto you."
	selection_color = "#A27954"
	exp_requirements = EXP_TYPE_MORDINOS

	outfit = /datum/outfit/job/wrights/f13underboss
/*
	loadout_options = list(
	/datum/outfit/loadout/pr,
	/datum/outfit/loadout/pw,
	)

	access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)
*/
/datum/outfit/job/wrights/f13underboss
	name = "Underboss"
	jobtype = /datum/job/wrights/f13underboss

	ears = /obj/item/radio/headset
	id = /obj/item/card/id/reno/wrights/ring/officer
	//glasses =
	//gloves =
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
//	r_hand =
	//l_hand =
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/onezerozero
	r_pocket = /obj/item/ammo_box/m44
	//mask =
	head = /obj/item/clothing/head/helmet/f13/wrights/tophat
	neck = /obj/item/storage/belt/holster/legholster
	shoes = /obj/item/clothing/shoes/laceup
	suit =/obj/item/clothing/suit/armor/f13/reno/bulletproof
	uniform = /obj/item/clothing/under/f13/wrights/officer
	belt = /obj/item/gun/ballistic/revolver/m29
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/switchblade = 1,
		)

/*--------------------------------------------------------------*/

/datum/job/wrights/f13capo
	title = "Wrights Capo"
	flag = F13WRIGHTSCAPO
	department_flag = WRIGHTS
	total_positions = 2
	spawn_positions = 2
	supervisors = "Wright Underboss and the Wright Boss"
	description = "You have proven your worth as an earner for the Wright Family and, as such, it has been trusted to you to lead a small band of soldiers for the boss. You are the mediator between the head of the family and said soldiers, so expect to be given some level of autonomy to use your subordinates in the most efficient way possible to meet the needs of the boss and the family. Should the soldiers not be assigned to you by the Boss or the Underboss, the decision will fall unto you and the other capos. Assert the core tenets of the Wright family to your subordinates by making them avoid drugs and prostitution, and enforce loyalty as well among the ranks. Remember that you are also bound by these tenets; treason against your superiors is out of the question. Follow the orders of your superiors, protect the family premises and help produce and distribute the fabricated alcohol on the streets of New Reno."
	selection_color = "#B3875E"
	exp_requirements = EXP_TYPE_WRIGHTS

	outfit = /datum/outfit/job/wrights/f13capo
/*
	loadout_options = list(
	/datum/outfit/loadout/pr,
	/datum/outfit/loadout/pw,
	)

	access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)
*/
/datum/outfit/job/wrights/f13capo
	name = "Capo"
	jobtype = /datum/job/wrights/f13capo

	ears = /obj/item/radio/headset
	id = /obj/item/card/id/reno/wrights/ring/officer
	//glasses =
	//gloves =
	backpack = /obj/item/storage/backpack/satchel
	satchel = /obj/item/storage/backpack/satchel
	r_hand = /obj/item/gun/ballistic/revolver/detective
	//l_hand =
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/sevenzero
	r_pocket = /obj/item/ammo_box/a556/sport/improvised
	mask = /obj/item/clothing/mask/cigarette/cigar
	head =/obj/item/clothing/head/helmet/f13/wrights/tophat
//	neck = /obj/item/storage/belt/holster/legholster
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/f13/wrights/soldier
	suit = /obj/item/clothing/suit/armor/f13/wrights/armored_vest
	suit_store = /obj/item/gun/ballistic/revolver/hobo/piperifle
	belt = null
//	backpack_contents = list(
//		/obj/item/ammo_box/m44 = 1,
//		/obj/item/storage/bag/money/small/ncr = 1,
//		)

/*--------------------------------------------------------------*/

/datum/job/wrights/f13soldier
	title = "Wrights Soldier"
	flag = F13WRIGHTSSOLDIER
	department_flag = WRIGHTS
	total_positions = 6
	spawn_positions = 6
	supervisors = "Wright Capos, the Underboss, and the Wright Boss"
	description = "You have been made a soldier of the Wright Family. Expect to be assigned to follow the orders of one of the Capos. Do not disturb the boss or the underboss with unnecessary affairs. Remember to follow the core tenets of the Wright family by avoiding drugs and prostitution, and keeping yourself loyal to your superiors whatever the cost."
	selection_color = "#B3875E"
	exp_requirements = EXP_TYPE_WRIGHTS

	outfit = /datum/outfit/job/wrights/f13soldier
/*
	loadout_options = list(
	/datum/outfit/loadout/pr,
	/datum/outfit/loadout/pw,
	)

	access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)
*/
/datum/outfit/job/wrights/f13soldier
	name = "Soldier"
	jobtype = /datum/job/wrights/f13soldier

	ears = /obj/item/radio/headset
	id = /obj/item/card/id/reno/wrights/ring/soldier
	//glasses =
	//gloves =
	backpack = /obj/item/storage/backpack/satchel
	satchel = /obj/item/storage/backpack/satchel
//	r_hand =
	//l_hand =
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/fivezero
	//r_pocket =
//	mask = /obj/item/clothing/mask/cigarette/cigar
	head = /obj/item/clothing/head/bowler
//	neck = /obj/item/storage/belt/holster/legholster
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/f13/wrights/soldier
	suit = /obj/item/clothing/suit/armor/f13/reno/bulletproof/lite
//	belt = /obj/item/gun/ballistic/revolver/detective
//	backpack_contents = list(
//		/obj/item/ammo_box/m44 = 1,
//		/obj/item/storage/bag/money/small/ncr = 1,
//		)

/datum/outfit/job/wrights/f13soldier/pre_equip(mob/living/carbon/human/H)
	. = ..()
	r_hand = pick(
		/obj/item/melee/onehanded/knife/switchblade, \
		/obj/item/melee/onehanded/club, \
		/obj/item/gun/ballistic/automatic/hobo/zipgun, \
		/obj/item/twohanded/sledgehammer/simple, \
		/obj/item/kitchen/knife, \
		/obj/item/twohanded/baseball)
