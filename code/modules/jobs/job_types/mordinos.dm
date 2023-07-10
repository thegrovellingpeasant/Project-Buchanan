/datum/job/mordinos //do NOT use this for anything, it's just to store faction datums
	department_flag = MORDINOS
	selection_color = "#FF7566"
	faction = FACTION_MORDINOS
	exp_type = EXP_TYPE_MORDINOS
	maptype = "reno"

	access = list(ACCESS_MORDINOS)
	minimal_access = list(ACCESS_MORDINOS)
	forbids = "The Mordino family forbids: The Mordinos are picky when it comes to recruiting new enforcers; due to this policy, anyone not deemed strong enough will not make it into the family, so a strong willed personality is expected of the actual members (though not from the chemists and the casino workers). The family is also well known for their traditional understanding of gender roles, so women, although already rare in the family, will probably not make it past capos."
	enforces = "The Mordino family demands: Honor is the main (and possibly the only) core tenet of the Mordino family; never allow anyone to put in doubt the honor of the family, not even a joke should be left without consequences. Wearing the family suit is required, unless acting as an infiltrator."
	objectivesList = list("Focus on the mass production of chems.", "Focus on managing the Desperado casino", "Extort the small businesses of New Reno to get a cut from their profits, but be weary, the other families may want a cut from them too.")

/*--------------------------------------------------------------*/

/datum/job/mordinos/f13boss
	title = "Mordinos Boss"
	flag = F13MORDINOBOSS
	department_flag = MORDINOS
	total_positions = 1
	spawn_positions = 1
	supervisors = "Yourself"
	description = "You are the head of the Mordino family. As such, you control most of the local production of chems as well as the ownership of one of the big casinos. Outside of the walls of the city, there lies the family stable, where the chems are produced; be certain that the needs of your chemists are met and make sure to stay in top of the chem business in New Reno. Keep an eye in the casino to ensure it's well managed and fulfilling all of it's needs (alcohol, payouts, and so on). Though risky, slavery and prostitution has been practiced by the Mordinos before, so it is an option to be considered. Assign soldiers to your capos. Allow capos to have some level of autonomy regarding their soldiers, as long as it doesn't hinder the flow of business. Though you have made it to the top, you never know who may be plotting against you to take your place, so always be weary, even of your own family."
	selection_color = "#FF4733"
	exp_requirements = EXP_TYPE_MORDINOS

	outfit = /datum/outfit/job/mordinos/f13boss
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
/datum/outfit/job/mordinos/f13boss
	name = "Boss"
	jobtype = /datum/job/mordinos/f13boss

	ears = /obj/item/radio/headset
	id = /obj/item/card/id/reno/mordinos/ring/boss
	//glasses =
	//gloves =
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	r_hand = /obj/item/gun/ballistic/revolver/caravan_shotgun
	//l_hand =
	//l_pocket = /obj/item/storage/bag/money/small/ncr //placeholder
	r_pocket = /obj/item/stock_parts/cell/ammo/ec
	mask = /obj/item/clothing/mask/cigarette/cigar/ncr
	head = /obj/item/clothing/head/helmet/f13/mordinos/fedora
	neck = /obj/item/storage/belt/holster/legholster
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/armor/f13/reno/bulletproof
	uniform = /obj/item/clothing/under/f13/mordinos/boss
	belt = /obj/item/gun/ballistic/revolver/m29
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/ammo_box/m44 = 1,
		/obj/item/storage/bag/money/small/reno/cap/onefivezero = 1,
		/obj/item/circular_saw = 1,
		/obj/item/melee/onehanded/knife/switchblade = 1,
		)

/*--------------------------------------------------------------*/

/datum/job/mordinos/f13underboss
	title = "Mordinos Underboss"
	flag = F13MORDINOUNDERBOSS
	department_flag = MORDINOS
	total_positions = 1
	spawn_positions = 1
	supervisors = "Mordino Boss"
	description = "You are the underboss of the Mordinos family. Your role may vary from a simple consigliere, to a diplomat with the other families, to assigning soldiers to the capos, or even as the chief supervisor of the family businesses; keep the dialogue with the boss constant and clear to know what he needs from you. In a world where treason is treated as common currency, a position such as a 'right hand man' for the boss is extremely valuable... nevertheless, should the boss be unable to lead the family, the job will fall unto you."
	selection_color = "#FF4733"
	exp_requirements = EXP_TYPE_MORDINOS

	outfit = /datum/outfit/job/mordinos/f13underboss
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
/datum/outfit/job/mordinos/f13underboss
	name = "Underboss"
	jobtype = /datum/job/mordinos/f13underboss

	ears = /obj/item/radio/headset
	id = /obj/item/card/id/reno/mordinos/ring/officer
	//glasses =
	//gloves =
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
//	r_hand =
	//l_hand =
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/onezerozero //placeholder
	r_pocket = /obj/item/ammo_box/m44
	mask = /obj/item/clothing/mask/cigarette/cigar/ncr
	head = /obj/item/clothing/head/helmet/f13/mordinos/fedora
	neck = /obj/item/storage/belt/holster/legholster
	shoes = /obj/item/clothing/shoes/laceup
	suit =/obj/item/clothing/suit/armor/f13/reno/bulletproof
	uniform = /obj/item/clothing/under/suit/charcoal
	belt = /obj/item/gun/ballistic/revolver/m29
//	backpack_contents = list(
//		/obj/item/ammo_box/m44 = 1,
//		/obj/item/storage/bag/money/small/ncr = 1,
//		)

/*--------------------------------------------------------------*/

/datum/job/mordinos/f13capo
	title = "Mordinos Capo"
	flag = F13MORDINOCAPO
	department_flag = MORDINOS
	total_positions = 2
	spawn_positions = 2
	supervisors = "Mordino Underboss and the Mordino Boss"
	description = "You have proven your worth as an earner for the Mordino Family and, as such, it has been trusted to you to lead a small band of soldiers for the boss. You are the mediator between the head of the family and said soldiers, so expect to be given some level of autonomy to use your subordinates in the most efficient way possible to meet the needs of the boss and the family. Should the soldiers not be assigned to you by the Boss or the Underboss, the decision will fall unto you and the other capos. Follow the orders of your superiors, protect the family premises and distribute the fabricated chems on the streets of New Reno. Remember though: don't get high on your own supply."
	selection_color = "#FF7566"
	exp_requirements = EXP_TYPE_MORDINOS

	outfit = /datum/outfit/job/mordinos/f13capo
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
/datum/outfit/job/mordinos/f13capo
	name = "Capo"
	jobtype = /datum/job/mordinos/f13capo

	ears = /obj/item/radio/headset
	id = /obj/item/card/id/reno/mordinos/ring/officer
	//glasses =
	//gloves =
	backpack = /obj/item/storage/backpack/satchel
	satchel = /obj/item/storage/backpack/satchel
//	r_hand =
	//l_hand =
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/sevenzero
	r_pocket = /obj/item/ammo_box/c38
	mask = /obj/item/clothing/mask/cigarette/cigar
	head = /obj/item/clothing/head/helmet/f13/mordinos/fedora
//	neck = /obj/item/storage/belt/holster/legholster
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/suit/charcoal
	suit = /obj/item/clothing/suit/armor/f13/mordinos/grey_trench_coat
	belt = /obj/item/gun/ballistic/revolver/detective
//	backpack_contents = list(
//		/obj/item/ammo_box/m44 = 1,
//		/obj/item/storage/bag/money/small/ncr = 1,
//		)

/*--------------------------------------------------------------*/

/datum/job/mordinos/f13goon
	title = "Mordinos Goon"
	flag = F13MORDINOGOON
	department_flag = MORDINOS
	total_positions = 5
	spawn_positions = 5
	supervisors = "Mordino Capos, the Underboss, and the Mordino Boss"
	description = "You have been made a soldier of the Mordino Family. Expect to be assigned to follow the orders of one of the Capos, be it pushing chems on the street, protecting the casino, delivering the family's goods to some other private entity, and so on. Do not disturb the boss or the underboss with unnecessary affairs. Do not allow anyone to question the honor of your family."
	selection_color = "#FF7566"
	exp_requirements = EXP_TYPE_MORDINOS

	outfit = /datum/outfit/job/mordinos/f13goon
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
/datum/outfit/job/mordinos/f13goon
	name = "Goon"
	jobtype = /datum/job/mordinos/f13goon

	ears = /obj/item/radio/headset
	id = /obj/item/card/id/reno/mordinos/ring/soldier
	//glasses =
	//gloves =
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
//	r_hand =
	//l_hand =
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/fivezero
	mask = /obj/item/clothing/mask/cigarette/bigboss
	head = /obj/item/clothing/head/helmet/f13/mordinos/fedora
//	neck = /obj/item/storage/belt/holster/legholster
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/f13/mordinos/goon
	suit = /obj/item/clothing/suit/armor/f13/reno/bulletproof/lite
//	belt = /obj/item/gun/ballistic/revolver/detective
//	backpack_contents = list(
//		/obj/item/ammo_box/m44 = 1,
//		/obj/item/storage/bag/money/small/ncr = 1,
//		)

/datum/outfit/job/mordinos/f13goon/pre_equip(mob/living/carbon/human/H)
	. = ..()
	r_hand = pick(
		/obj/item/melee/onehanded/knife/switchblade, \
		/obj/item/melee/onehanded/club, \
		/obj/item/gun/ballistic/automatic/hobo/zipgun, \
		/obj/item/twohanded/sledgehammer/simple , \
		/obj/item/kitchen/knife, \
		/obj/item/twohanded/baseball)

/*--------------------------------------------------------------*/

/datum/job/mordinos/f13casinoworker
	title = "Mordinos Casino Worker"
	flag = F13MORDINOCASINOWORKER
	department_flag = MORDINOS
	total_positions = 2
	spawn_positions = 2
	supervisors = "Mordino Capos, the Underboss, and the Mordino Boss"
	description = "You are an employee of the Desperado, the Mordinos owned casino in New Reno. Though you're not a proper member of the family, you count with their protection and you're also expected to fulfill their demands. Serve drinks to the costumers, deal the cards on the tables, change money for casino chips (and viceversa), and keep a constant dialogue with whoever is keeping the casino safe to kick out drunkards, cheaters, and the more dangerous folks that may come to pay a visit to the family."
	selection_color = "#FF7566"
	exp_requirements = EXP_TYPE_MORDINOS

	outfit = /datum/outfit/job/mordinos/f13casinoworker
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
/datum/outfit/job/mordinos/f13casinoworker
	name = "Casino Worker"
	jobtype = /datum/job/mordinos/f13casinoworker

	ears = /obj/item/radio/headset
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	id = /obj/item/card/id/reno/mordinos/papers/worker
	r_pocket = /obj/item/card/slotmachine
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/fivezero
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/f13/bartenderalt

/*--------------------------------------------------------------*/

/datum/job/mordinos/f13chemist
	title = "Mordinos Chemist"
	flag = F13MORDINOCHEMIST
	department_flag = MORDINOS
	total_positions = 2
	spawn_positions = 2
	supervisors = "Mordino Capos, the Underboss, and the Mordino Boss"
	description = "You are a chemist for the Mordino family. Instead of working on the city itself, you have been assigned to the family stables, outside of the main walls, in the relative safety of the countryside. Though you are not a proper member of the family, you count with their protection and you're also expected to fulfill their demands. Keep up the expected production of chems, prepare medicine if needed, and be prepared to manage the actual cattle, should it be requested by a superior."
	selection_color = "#FF7566"
	exp_requirements = EXP_TYPE_MORDINOS

	outfit = /datum/outfit/job/mordinos/f13chemist
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
/datum/outfit/job/mordinos/f13chemist
	name = "Mordinos Chemist"
	jobtype = /datum/job/mordinos/f13chemist

	id = /obj/item/card/id/reno/mordinos/papers/chemist
	belt = /obj/item/storage/belt/medical
	shoes = /obj/item/clothing/shoes/laceup
	ears = /obj/item/radio/headset
	r_pocket = /obj/item/flashlight/seclite
	uniform = /obj/item/clothing/under/suit/charcoal
	suit = /obj/item/clothing/suit/toggle/labcoat/chemist
	backpack =	/obj/item/storage/backpack/medic
	gloves =  /obj/item/clothing/gloves/color/white
	head = /obj/item/clothing/head/beret/durathread
	mask =  /obj/item/clothing/mask/bandana/durathread
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2, \
		/obj/item/healthanalyzer=1, \
		/obj/item/storage/bag/money/small/reno/cap/fourzero)

/datum/outfit/job/mordinos/f13chemist/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/jet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/turbo)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/psycho)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/buffout)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/set_vrboard/den)
