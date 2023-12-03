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

/datum/outfit/job/bishops
	name = "bishopsdatums"
	jobtype = /datum/job/bishops
	ears = /obj/item/radio/headset/headset_bishops

/*--------------------------------------------------------------*/

/datum/job/bishops/f13boss
	title = "Bishop Boss"
	flag = F13BISHOPSBOSS
	department_flag = BISHOPS
	total_positions = 1
	spawn_positions = 1
	supervisors = "Mr Bishop"
	description = "You are the head of the Bishop family. Your management of the Shark Club, the most famous casino in the city, and the good relations of the family with the NCR, have placed the gang in a comfortable situation, attracting most of the new blood in the city among their ranks, making the Bishops the most 'populated' family in New Reno. Manage the Casino, organize meetings with the other gangs to make ends meet, rely on prostitution, if necessary, assign soldiers to your capos, allow capos to have some level of autonomy regarding their soldiers, as long as it doesn't hinder the flow of business, and remember to get someone to manage the acts at the Shark to attract visitors. Though you have made it to the top, you never know who may be plotting against you to take your place, so always be weary, even of your own family."
	selection_color = "#7C93AF"
	exp_requirements = EXP_TYPE_BISHOPS

	outfit = /datum/outfit/job/bishops/f13boss

	loadout_options = list(
		/datum/outfit/loadout/handcannon,		// Desert Eagle
		/datum/outfit/loadout/mylittlefriend,	// American180
		)

/datum/outfit/job/bishops/f13boss
	name = "Bishop Boss"
	jobtype = /datum/job/bishops/f13boss

	uniform	= /obj/item/clothing/under/f13/bishops/boss
	id = /obj/item/card/id/reno/bishops/ring/boss
	accessory = null
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/helmet/f13/bishops/fedora
	neck = /obj/item/storage/belt/holster/legholster
	gloves = null
	suit = /obj/item/clothing/suit/armor/f13/bishops/boss
	suit_store = null
	r_hand = null
	backpack = /obj/item/storage/backpack/satchel/leather/withwallet
	satchel = /obj/item/storage/backpack/satchel/leather/withwallet
	backpack_contents = list(
		/obj/item/clothing/mask/cigarette/cigar/ncr = 1,
		/obj/item/lighter/gold = 1,
		/obj/item/melee/onehanded/knife/switchblade = 1,
		/obj/item/storage/bag/money/reno/huge = 1
		)

/datum/outfit/loadout/handcannon
	name = "Hand Cannon"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/deagle = 1,
		/obj/item/ammo_box/magazine/m44 = 2,
		)

/datum/outfit/loadout/mylittlefriend
	name = "My little friend"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/smg/american180 = 1,
		/obj/item/ammo_box/magazine/m22smg = 1,
		)

/datum/outfit/job/bishops/f13boss/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(SSticker.mode.objs_generated && SSticker.mode.name == "mobsters")
		H.mind.special_role = ROLE_MOBSTER
		H.mind.add_antag_datum(/datum/antagonist/mobster, SSticker.mode.bishopteam)
	if(H.gender == FEMALE)
		H.gender = MALE
		H.real_name = random_unique_name(MALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/reno/bishops/ring/boss/L = H.wear_id
			L.registered_name = H.name
			L.update_label()

	ADD_TRAIT(H, TRAIT_LEADER, src)

/*--------------------------------------------------------------*/

/datum/job/bishops/f13wife
	title = "Bishop Wife"
	flag = F13BISHOPSWIFE
	department_flag = BISHOPS
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Bishop Boss"
	description = "You are the wife of the Boss; how this happened? Who knows, maybe it was a drunken marriage. While you have no real responsibilities you do hold some level of authority, albeit lesser than that of the boss. You may find yourself doing things like micromanaging the casino staff, pestering the boss and the mobsters, and getting thrown off the third story of the Shark Club in an impromptu divorce."
	selection_color = "#7C93AF"
	exp_requirements = EXP_TYPE_BISHOPS

	outfit = /datum/outfit/job/bishops/f13wife

/datum/outfit/job/bishops/f13wife
	name = "Boss Wife"
	jobtype = /datum/job/bishops/f13wife

	id = /obj/item/card/id/reno/bishops/ring/wedding
	accessory = null
	shoes = /obj/item/clothing/shoes/laceup
	head = null
	neck = null
	gloves = null
	suit = null
	suit_store = null
	r_hand = null
	backpack = /obj/item/storage/backpack/satchel/leather/withwallet
	satchel = /obj/item/storage/backpack/satchel/leather/withwallet
	backpack_contents = list(
		/obj/item/melee/onehanded/club/fryingpan = 1,
		/obj/item/gun/ballistic/automatic/pistol/sig = 1,
		/obj/item/suppressor = 1,
		/obj/item/storage/bag/money/reno/huge = 1
		)

/datum/outfit/job/bishops/f13wife/pre_equip(mob/living/carbon/human/H)
	. = ..()
	uniform = pick(
		/obj/item/clothing/under/f13/picnicdress50s,
		/obj/item/clothing/under/f13/housewifedress50s,
		/obj/item/clothing/under/f13/bluedress)

/datum/outfit/job/bishops/f13wife/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(SSticker.mode.objs_generated && SSticker.mode.name == "mobsters")
		H.mind.special_role = ROLE_MOBSTER
		H.mind.add_antag_datum(/datum/antagonist/mobster, SSticker.mode.bishopteam)

	if(H.gender == MALE)
		H.gender = FEMALE
		H.real_name = random_unique_name(FEMALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/reno/bishops/ring/wedding/L = H.wear_id
			L.registered_name = H.name
			L.update_label()

	ADD_TRAIT(H, TRAIT_LEADER, src)


/*--------------------------------------------------------------*/

/datum/job/bishops/f13capo
	title = "Bishop Capo"
	flag = F13BISHOPSCAPO
	department_flag = BISHOPS
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Bishop Boss"
	description = "You have proven your worth as an earner for the Bishop Family and, as such, it has been trusted to you to lead a small band of made men for the boss. You are the mediator between the head of the family and said made men, so expect to be given some level of autonomy to use your subordinates in the most efficient way possible to meet the needs of the boss and the family. Should the made men not be assigned to you by the Boss, the decision will fall unto you and the other capos. Help to manage the Casino, make sure there's entertainment for the visitors, follow the instructions of your superior, keep the made men in line."
	selection_color = "#8CA2BD"
	exp_requirements = EXP_TYPE_BISHOPS

	outfit = /datum/outfit/job/bishops/f13capo

	loadout_options = list(
	/datum/outfit/loadout/shotgun,
	/datum/outfit/loadout/smg,
	)

/datum/outfit/job/bishops/f13capo
	name = "Bishop Capo"
	jobtype = /datum/job/bishops/f13capo

	uniform	= /obj/item/clothing/under/f13/bishops/soldier
	id = /obj/item/card/id/reno/bishops/ring/officer
	accessory = null
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/helmet/f13/bishops/fedora
	neck = /obj/item/storage/belt/holster/legholster
	gloves = null
	suit = /obj/item/clothing/suit/armor/f13/bishops/blue_trench_coat
	suit_store = null
	r_hand = null
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/clothing/mask/cigarette/cigar = 1,
		/obj/item/lighter/greyscale = 1,
		/obj/item/melee/onehanded/knife/switchblade = 1,
		/obj/item/storage/bag/money/reno/big = 1
		)

/datum/outfit/loadout/shotgun
	name = "Heavy Hitter"
	backpack_contents = list(
		/obj/item/gun/ballistic/shotgun/hunting = 1,
		/obj/item/ammo_box/shotgun/buck = 2,
		)

/datum/outfit/loadout/smg
	name = "Greaser"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/smg/greasegun = 1,
		/obj/item/ammo_box/magazine/greasegun = 2,
		)

/datum/outfit/job/bishops/f13capo/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(SSticker.mode.objs_generated && SSticker.mode.name == "mobsters")
		H.mind.special_role = ROLE_MOBSTER
		H.mind.add_antag_datum(/datum/antagonist/mobster, SSticker.mode.bishopteam)

	ADD_TRAIT(H, TRAIT_LEADER, src)

/*--------------------------------------------------------------*/

/datum/job/bishops/f13mademan
	title = "Bishop Made Man"
	flag = F13MADEMAN
	department_flag = BISHOPS
	total_positions = 7
	spawn_positions = 7
	supervisors = "Capos and the Bishop Boss"
	description = "You have become a made man of the Bishop Family. Expect to be assigned to follow the orders of one of the Capos, be it helping in the casino, extorting businesses, protecting your superiors during a meeting, and so on. Do not disturb the boss with unnecessary affairs."
	selection_color = "#8CA2BD"
	exp_requirements = EXP_TYPE_BISHOPS

	outfit = /datum/outfit/job/bishops/f13mademan

	loadout_options = list(
	/datum/outfit/loadout/batterup,
	/datum/outfit/loadout/buttonman,
	/datum/outfit/loadout/hitman,
	)
/*
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
/datum/outfit/job/bishops/f13mademan
	name = "Bishop Soldier"
	jobtype = /datum/job/bishops/f13mademan

	uniform	= /obj/item/clothing/under/f13/bishops/soldier
	id = /obj/item/card/id/reno/bishops/ring/soldier
	accessory = null
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/helmet/f13/bishops/fedora
	neck = null
	gloves = null
	suit = /obj/item/clothing/suit/armor/f13/reno/bulletproof/lite
	suit_store = null
	r_hand = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/storage/bag/money/reno/few = 1,
		/obj/item/melee/onehanded/knife/switchblade = 1,
		)

/datum/outfit/job/bishops/f13soldier/pre_equip(mob/living/carbon/human/H)
	. = ..()
	uniform = pick(
		/obj/item/clothing/under/f13/bishops/soldier,
		/obj/item/clothing/under/f13/bishops/soldier/alt)

/datum/outfit/loadout/batterup
	name = "Batter up"
	backpack_contents = list(
		/obj/item/twohanded/baseball = 1,
		/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
		)

/datum/outfit/loadout/buttonman
	name = "Button Man"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/varmint = 1,
		/obj/item/ammo_box/magazine/m556/rifle/small = 2,
		/obj/item/melee/unarmed/brass
		)

/datum/outfit/loadout/hitman
	name = "Hitman"
	backpack_contents = list(
		/obj/item/gun/ballistic/rifle/hunting = 1,
		/obj/item/ammo_box/a308 = 2,
		/obj/item/melee/onehanded/knife/switchblade = 1,
		)

/datum/outfit/job/bishops/f13soldier/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(SSticker.mode.objs_generated && SSticker.mode.name == "mobsters")
		H.mind.special_role = ROLE_MOBSTER
		H.mind.add_antag_datum(/datum/antagonist/mobster, SSticker.mode.bishopteam)

/*--------------------------------------------------------------*/

/datum/job/bishops/f13floorman
	title = "Bishop Floorman"
	flag = F13BISHOPFLOORMAN
	department_flag = BISHOPS
	total_positions = 3
	spawn_positions = 3
	supervisors = "Bishop Capos, the Underboss, and the Bishop Boss"
	description =  "You are an employee of the Shark Club, the Bishop owned casino in New Reno. Though you're not a proper member of the family, you count with their protection, and you're also expected to fulfill their demands. Serve drinks to the costumers, deal the cards on the tables, change money for casino chips (and vice versa), and keep a constant dialogue with whoever is keeping the casino safe to kick out drunkards, cheaters, and the more dangerous folks that may come to pay a visit to the family."
	selection_color = "#8CA2BD"
	exp_requirements = EXP_TYPE_BISHOPS

	outfit = /datum/outfit/job/bishops/f13floorman

/datum/outfit/job/bishops/f13floorman
	name = "Casino Worker"
	jobtype = /datum/job/bishops/f13floorman

	uniform	= /obj/item/clothing/under/f13/bishops/casino_worker
	id = /obj/item/card/id/reno/bishops/papers/worker
	accessory = null
	shoes = /obj/item/clothing/shoes/laceup
	head = null
	neck = null
	gloves = /obj/item/clothing/gloves/color/white
	suit = null
	suit_store = null
	r_hand = null
	backpack = /obj/item/storage/backpack/satchel
	satchel = /obj/item/storage/backpack/satchel
	backpack_contents = list(
		/obj/item/card/slotmachine = 1,
		/obj/item/storage/bag/money/reno/few = 1,
		)
/*--------------------------------------------------------------*/

/datum/job/bishops/f13racketeer
	title = "Bishop Racketeer"
	flag = F13RACKETEER
	department_flag = BISHOPS
	total_positions = 3
	spawn_positions = 3
	supervisors = "Bishop Capos and the Bishop Boss"
	description = "You're an affiliate of the Bishops, though while you are not a member of the family you are under their protection provided you pull your weight in your respective racket and give them their share."
	selection_color = "#8CA2BD"
	exp_requirements = EXP_TYPE_BISHOPS

	outfit = /datum/outfit/job/bishops/f13racketeer

	loadout_options = list(
		/datum/outfit/loadout/fightpromotor,
		/datum/outfit/loadout/escort,
		/datum/outfit/loadout/filmdirector,
		/datum/outfit/loadout/pusher,
		/datum/outfit/loadout/pimp,
		)


/datum/outfit/job/bishops/f13racketeer
	name = "Comedian"
	jobtype = /datum/job/bishops/f13racketeer

	uniform	= /obj/item/clothing/under/f13/sleazeball
	id = /obj/item/card/id/reno/bishops/papers/worker
	accessory = null
	shoes = /obj/item/clothing/shoes/jackboots
	head = null
	neck = null
	gloves = null
	suit = null
	suit_store = null
	r_hand = null
	backpack = /obj/item/storage/backpack/satchel
	satchel = /obj/item/storage/backpack/satchel
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m44 = 2,
		/obj/item/storage/bag/money/reno/meager = 1,
		/obj/item/gun/ballistic/revolver/detective = 1,
		/obj/item/ammo_box/c38 = 1
		)

/datum/outfit/loadout/fightpromotor
	name = "Fight Promotor"
	uniform = /obj/item/clothing/under/f13/bennys
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/megaphone = 1,
		/obj/item/storage/pill_bottle/chem_tin/buffout = 1,
		)

/datum/outfit/loadout/escort
	name = "Escort"
	backpack_contents = list(
		/obj/item/clothing/under/f13/fprostitute = 1,
		/obj/item/clothing/under/f13/mprostitute = 1,
		/obj/item/picket_sign = 1,
		)

/datum/outfit/loadout/filmdirector
	name = "Film Director"
	uniform = /obj/item/clothing/under/f13/jamrock
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/camera = 1,
		/obj/item/taperecorder = 1,
		/obj/item/tape = 1,
		)

/datum/outfit/loadout/pusher
	name = "Pusher"
	uniform = /obj/item/clothing/under/f13/sleazeball
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/book/granter/trait/chemistry = 1,
		)

/datum/outfit/loadout/pimp
	name = "Pimp"
	uniform = /obj/item/clothing/under/suit_jacket/tan
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/orange
	backpack_contents = list(
		/obj/item/cane = 1,
		/obj/item/restraints/handcuffs/fake/kinky = 1,
		)
