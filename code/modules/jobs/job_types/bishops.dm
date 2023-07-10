/datum/job/bishops //do NOT use this for anything, it's just to store faction datums
	department_flag = BISHOPS
	selection_color = "#8CA2BD"
	faction = FACTION_BISHOPS
	exp_type = EXP_TYPE_BISHOPS
	maptype = "reno"

	access = list(ACCESS_BISHOPS)
	minimal_access = list(ACCESS_BISHOPS)
	forbids = "The Bishop family forbids: Due to their diplomatic nature there's little that the Bishop family would not admit nowadays, and the recent growth in numbers is in part because of this very reason. Nevertheless, the general rule ensued to all the members of the family is that they shouldn't act as common thugs, don't destroy property or steal from the casino, and don't pick unnecessary fights with the other gangs."
	enforces = "The Bishops are an ambitious family; make sure to assert dominance among the other families of New Reno to let them know who is the most powerful gang in town. Make sure the Casino doesn't run short of money, alcohol and entretainment. Wearing the family suit is required, unless acting as an infiltrator."
	objectivesList = list("Focus on managing the Shark Club casino.", "Extort the small businesses of New Reno to get a cut from their profits, but be weary, the other families may want a cut from them too.")


/*--------------------------------------------------------------*/

/datum/job/bishops/f13boss
	title = "Bishops Boss"
	flag = F13BISHOPSBOSS
	department_flag = BISHOPS
	total_positions = 1
	spawn_positions = 1
	supervisors = "Yourself"
	description = "You are the head of the Bishop family. Your management of the Shark Club, the most famous casino in the city, and the good relations of the family with he NCR, have placed the gang in a comfortable situation, attracting most of the new blood in the city among their ranks, making the Bishops the most 'populated' family in New Reno. Nevertheless, the Bishops still rely on the other gangs of the city to provide them with new guns, chems, and alcohol. Manage the Casino, organize meetings with the other gangs to make ends meet, rely on prostitution if necessary, assign soldiers to your capos, allow capos to have some level of autonomy regarding their soldiers, as long as it doesn't hinder the flow of business, and remember to get someone to manage the acts at the Shark to attract visitors. Though you have made it to the top, you never know who may be plotting against you to take your place, so always be weary, even of your own family."
	selection_color = "#7C93AF"
	exp_requirements = EXP_TYPE_BISHOPS

	outfit = /datum/outfit/job/bishops/f13boss

/datum/outfit/job/bishops/f13boss
	name = "Boss"
	jobtype = /datum/job/bishops/f13boss

	id = /obj/item/card/id/reno/bishops/ring/boss
	backpack = /obj/item/storage/backpack/satchel/leather
	ears = /obj/item/radio/headset
	satchel = /obj/item/storage/backpack/satchel/leather
	r_hand = /obj/item/gun/ballistic/revolver/caravan_shotgun
	mask = /obj/item/clothing/mask/cigarette/cigar/ncr
	head = /obj/item/clothing/head/helmet/f13/bishops/fedora
	neck = /obj/item/storage/belt/holster/legholster
	shoes = /obj/item/clothing/shoes/laceup
	suit =/obj/item/clothing/suit/armor/f13/reno/bulletproof
	uniform = /obj/item/clothing/under/f13/bishops/boss
	belt = /obj/item/gun/ballistic/revolver/m29
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/ammo_box/m44 = 1,
		/obj/item/storage/bag/money/small/reno/cap/onefivezero = 1,
		/obj/item/circular_saw = 1,
		/obj/item/melee/onehanded/knife/switchblade = 1,
		)

/*--------------------------------------------------------------*/

/datum/job/bishops/f13underboss
	title = "Bishops Underboss"
	flag = F13BISHOPSUNDERBOSS
	department_flag = BISHOPS
	total_positions = 1
	spawn_positions = 1
	supervisors = "Mordino Boss"
	description = "You are the underboss of the Bishop family. Your role may vary from a simple consigliere, to a diplomat with the other families, to assigning soldiers to the capos, or even as the chief supervisor of the family casino; keep the dialogue with the boss constant and clear to know what he needs from you. In a world where treason is treated as common currency, a position such as a 'right hand man' for the boss is extremely valuable... nevertheless, should the boss be unable to lead the family, the job will fall unto you."
	selection_color = "#7C93AF"
	exp_requirements = EXP_TYPE_BISHOPS

	outfit = /datum/outfit/job/bishops/f13underboss
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
/datum/outfit/job/bishops/f13underboss
	name = "Underboss"
	jobtype = /datum/job/bishops/f13underboss

	ears = /obj/item/radio/headset
	id = /obj/item/card/id/reno/bishops/ring/officer
	//glasses =
	//gloves =
	backpack = /obj/item/storage/backpack/satchel
	satchel = /obj/item/storage/backpack/satchel
//	r_hand =
	//l_hand =
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/onezerozero
	r_pocket = /obj/item/ammo_box/m44
	mask = /obj/item/clothing/mask/cigarette/cigar/ncr
	head = /obj/item/clothing/head/helmet/f13/bishops/fedora
	neck = /obj/item/storage/belt/holster/legholster
	shoes = /obj/item/clothing/shoes/laceup
	suit =/obj/item/clothing/suit/armor/f13/reno/bulletproof
	uniform = /obj/item/clothing/under/f13/bishops/officer
	belt = /obj/item/gun/ballistic/revolver/m29
//	backpack_contents = list(
//		/obj/item/ammo_box/m44 = 1,
//		/obj/item/storage/bag/money/small/ncr = 1,
//		)

/*--------------------------------------------------------------*/

/datum/job/bishops/f13capo
	title = "Bishops Capo"
	flag = F13BISHOPSCAPO
	department_flag = BISHOPS
	total_positions = 2
	spawn_positions = 2
	supervisors = "Bishop Underboss and the Bishop Boss"
	description = "You have proven your worth as an earner for the Bishop Family and, as such, it has been trusted to you to lead a small band of soldiers for the boss. You are the mediator between the head of the family and said soldiers, so expect to be given some level of autonomy to use your subordinates in the most efficient way possible to meet the needs of the boss and the family. Should the soldiers not be assigned to you by the Boss or the Underboss, the decision will fall unto you and the other capos. Help to manage the Casino, make sure there's entertainment for the visitors, follow the instructions of your superiors, keep the soldiers in line."
	selection_color = "#8CA2BD"
	exp_requirements = EXP_TYPE_BISHOPS

	outfit = /datum/outfit/job/bishops/f13capo
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
/datum/outfit/job/bishops/f13capo
	name = "Capo"
	jobtype = /datum/job/bishops/f13capo

	ears = /obj/item/radio/headset
	id = /obj/item/card/id/reno/bishops/ring/officer
	//glasses =
	//gloves =
	backpack = /obj/item/storage/backpack/satchel
	satchel = /obj/item/storage/backpack/satchel
//	r_hand =
	//l_hand =
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/sevenzero //placeholder
	r_pocket = /obj/item/ammo_box/c38
	mask = /obj/item/clothing/mask/cigarette/cigar
	head = /obj/item/clothing/head/helmet/f13/bishops/fedora
//	neck = /obj/item/storage/belt/holster/legholster
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/f13/bishops/officer
	suit = /obj/item/clothing/suit/armor/f13/bishops/blue_trench_coat
	belt = /obj/item/gun/ballistic/revolver/detective
//	backpack_contents = list(
//		/obj/item/ammo_box/m44 = 1,
//		/obj/item/storage/bag/money/small/ncr = 1,
//		)

/*--------------------------------------------------------------*/

/datum/job/bishops/f13soldier
	title = "Bishops Soldier"
	flag = F13BISHOPSSOLDIER
	department_flag = BISHOPS
	total_positions = 7
	spawn_positions = 7
	supervisors = "Bishop Capos, the Underboss, and the Bishop Boss"
	description = "You have been made a soldier of the Bishop Family. Expect to be assigned to follow the orders of one of the Capos, be it helping in the casino, extorting businesses, protecting your superiors during a meeting, and so on. Do not disturb the boss or the underboss with unnecessary affairs."
	selection_color = "#8CA2BD"
	exp_requirements = EXP_TYPE_BISHOPS

	outfit = /datum/outfit/job/bishops/f13soldier
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
/datum/outfit/job/bishops/f13soldier
	name = "Soldier"
	jobtype = /datum/job/bishops/f13soldier

	ears = /obj/item/radio/headset
	id = /obj/item/card/id/reno/bishops/ring/soldier
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/fivezero //placeholder
	head = /obj/item/clothing/head/helmet/f13/bishops/fedora
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/f13/bishops/soldier
	suit = /obj/item/clothing/suit/armor/f13/reno/bulletproof/lite

/datum/outfit/job/bishops/f13soldier/pre_equip(mob/living/carbon/human/H)
	. = ..()
	r_hand = pick(
		/obj/item/melee/onehanded/knife/switchblade, \
		/obj/item/melee/onehanded/club, \
		/obj/item/gun/ballistic/automatic/hobo/zipgun, \
		/obj/item/twohanded/sledgehammer/simple, \
		/obj/item/kitchen/knife, \
		/obj/item/twohanded/baseball)

/*--------------------------------------------------------------*/

/datum/job/bishops/f13casinoworker
	title = "Bishops Casino Worker"
	flag = F13BISHOPCASINOWORKER
	department_flag = BISHOPS
	total_positions = 3
	spawn_positions = 3
	supervisors = "Bishop Capos, the Underboss, and the Bishop Boss"
	description = "You are an employee of the Shark Club, the Bishop owned casino in New Reno. Though you're not a proper member of the family, you count with their protection and you're also expected to fulfill their demands. Serve drinks to the costumers, deal the cards on the tables, change money for casino chips (and viceversa), and keep a constant dialogue with whoever is keeping the casino safe to kick out drunkards, cheaters, and the more dangerous folks that may come to pay a visit to the family."
	selection_color = "#8CA2BD"
	exp_requirements = EXP_TYPE_BISHOPS

	outfit = /datum/outfit/job/bishops/f13casinoworker

/datum/outfit/job/bishops/f13casinoworker
	name = "Casino Worker"
	jobtype = /datum/job/bishops/f13casinoworker

	ears = /obj/item/radio/headset
	id = /obj/item/card/id/reno/bishops/papers/worker
	//glasses =
	gloves = /obj/item/clothing/gloves/color/white
	backpack = /obj/item/storage/backpack/satchel
	satchel = /obj/item/storage/backpack/satchel
//	r_hand =
	//l_hand =
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/fivezero
	r_pocket = /obj/item/card/slotmachine
//	mask =
//	head =
//	neck =
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/f13/bishops/casino_worker
//	suit =
//	belt =
//	backpack_contents = list(
//		/obj/item/ammo_box/m44 = 1,
//		/obj/item/storage/bag/money/small/ncr = 1,
//		)

/*--------------------------------------------------------------*/

/datum/job/bishops/f13comedian
	title = "Bishops Comedian"
	flag = F13BISHOPCOMEDIAN
	department_flag = BISHOPS
	total_positions = 1
	spawn_positions = 1
	supervisors = "Bishop Capos, the Underboss, and the Bishop Boss"
	description = "You are... well... the funny person of the Shark Club! Honk honk! This usually means you'll be expected to be funny to the tourists and whoever else is paying to see you. This is harder than it sounds."
	selection_color = "#8CA2BD"
	exp_requirements = EXP_TYPE_BISHOPS

	outfit = /datum/outfit/job/bishops/f13bishopcomedian

/datum/outfit/job/bishops/f13bishopcomedian
	name = "comedian"
	jobtype = /datum/job/bishops/f13comedian

	ears = /obj/item/radio/headset
	id = /obj/item/card/id/reno/bishops/papers/worker
	gloves = /obj/item/clothing/gloves/color/white
	backpack = /obj/item/storage/backpack/satchel
	satchel = /obj/item/storage/backpack/satchel
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/fivezero
	r_pocket = null
	head = /obj/item/clothing/head/jester
	shoes = /obj/item/clothing/shoes/jackboots
	uniform = /obj/item/clothing/under/jester
	backpack_contents = list(
		/obj/item/reagent_containers/food/snacks/pie/cream = 5,
		/obj/item/megaphone/clown = 1
		)
