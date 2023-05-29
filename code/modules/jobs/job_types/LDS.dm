/*
Town access doors
latterdaysaints government: 130  ACCESS_COMMAND
templeguard/Deputy, Gatehouse etc: 62 ACCESS_GATEWAY
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

/datum/job/latterdaysaints
	exp_type = EXP_TYPE_FALLOUT
	faction = FACTION_LDS
	department_flag = LDS
	selection_color = "#ffffff"
	forbids = "the Church forbids: Sin, blasphemy, marriage with non-believers."
	enforces = "the Church demands: Piety to God and loyalty to the tribe."
	objectivesList = list("Grow the flock by converting outsiders to the faith.","Avenge the loss of New Canaan, strike the White Legs.","Perform charity for the people of Wendover.")
	exp_type = EXP_TYPE_LDS

	access = list(ACCESS_BAR, ACCESS_CHAPEL_OFFICE)
	minimal_access = list(ACCESS_BAR, ACCESS_CHAPEL_OFFICE)

/datum/outfit/job/latterdaysaints
	ears = /obj/item/radio/headset/headset_lds
	l_pocket = /obj/item/storage/bag/money/small/settler
	box = /obj/item/storage/survivalkit

/datum/outfit/job/latterdaysaints/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/job/latterdaysaints/f13templepresident
	title = "Temple President"
	flag = F13TEMPLEPRESIDENT
	department_flag = FACTION_LDS
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Prophet, YHWH"
	description = "You are the President of the Wendover Temple, chosen for your willingness to serve the community. Spiritual, political and, if need be, military leadership rests with you. Protect your people from the wrath of the White Legs and the fickle cruelty of the local raiders."
	selection_color = "#D4AF37"
	display_order = JOB_DISPLAY_ORDER_TEMPLEPRESIDENT

	outfit = /datum/outfit/job/latterdaysaints/f13templepresident
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/latterdaysaints,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/latterdaysaints,
			/datum/job/whitelegs,
		),
	)

	loadout_options = list(
			/datum/outfit/loadout/exodus,
			/datum/outfit/loadout/apostle,
					)

/datum/outfit/job/latterdaysaints/f13templepresident/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_SPIRITUAL, src)

/datum/outfit/job/latterdaysaints/f13templepresident
	name = "Temple President"
	jobtype = /datum/job/latterdaysaints/f13templepresident

	id = /obj/item/card/id/templepresident
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/leather
	accessory = /obj/item/clothing/accessory/waistcoat
	gloves = /obj/item/pda/chaplain
	shoes = /obj/item/clothing/shoes/laceup 
	neck = /obj/item/storage/belt/holster
	uniform = /obj/item/clothing/under/rank/civilian/lawyer/black/alt
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	suit_store = /obj/item/gun/ballistic/automatic/pistol/m1911/custom
	backpack_contents = list(
		/obj/item/clothing/suit/armor/bulletproof = 1,
		/obj/item/clothing/head/helmet/f13/combat/swat = 1,
		/obj/item/storage/book/bible = 1,
		/obj/item/ammo_box/magazine/m45 = 3,
		)

/datum/outfit/loadout/exodus
	name = "The American Moses"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/smg/tommygun = 1,
		/obj/item/ammo_box/magazine/tommygunm45/stick = 2,
		/obj/item/nullrod/claymore/bostaff = 1,
		/obj/item/clothing/head/collectable/tophat = 1,
		/obj/item/clothing/under/rank/civilian/bartender = 1,
		)

/datum/outfit/loadout/apostle
	name = "Apostle to the Gentiles"
	backpack_contents = list(
		/obj/item/clothing/accessory/talisman = 1,
		/obj/item/gun/ballistic/automatic/m1carbine = 1,
		/obj/item/attachments/scope = 1,
		/obj/item/ammo_box/magazine/m10mm_adv = 2,
		/obj/item/book/book_of_babelf13 = 1,
		)


/*--------------------------------------------------------------*/

/datum/job/latterdaysaints/f13missionary
	title = "Missionary"
	flag = F13MISSIONARY
	department_flag = FACTION_LDS
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Temple President"
	description = "You were chosen to become a missionary for your proficiency at learning languages. How you'll best serve the Church is up to you and the Temple President, but your time among the tribes has given you a unique insight into their ways of living."
	selection_color = "#d9c687"
	display_order = JOB_DISPLAY_ORDER_MISSIONARY

	outfit = /datum/outfit/job/latterdaysaints/f13missionary

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/latterdaysaints,
			/datum/job/wendover,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/latterdaysaints,
			/datum/job/whitelegs,
		),
	)

datum/outfit/job/latterdaysaints/f13missionary/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		uniform = pick(
		/obj/item/clothing/under/f13/picnicdress50s, \
		/obj/item/clothing/under/f13/picnicdress50s, \
		/obj/item/clothing/under/f13/bluedress, \
		/obj/item/clothing/under/rank/civilian/lawyer/black/alt/skirt, \
		/obj/item/clothing/under/misc/durathread/skirt, \
		/obj/item/clothing/under/rank/civilian/lawyer/female/skirt \
		)
	if(H.gender == MALE)
		uniform = pick(
		/obj/item/clothing/under/f13/caravaneer, \
		/obj/item/clothing/under/rank/civilian/lawyer/black/alt, \
		/obj/item/clothing/under/rank/security/detective, \
		/obj/item/clothing/under/suit/sl, \
		/obj/item/clothing/under/f13/marlowduds, \
		/obj/item/clothing/under/rank/security/detective/grey \
		)

/datum/outfit/job/latterdaysaints/f13missionary
	name = "Missionary"
	jobtype = /datum/job/latterdaysaints/f13missionary
	
	id = /obj/item/card/id/newcanaanite
	belt = /obj/item/storage/belt/mining/primitive
	accessory = /obj/item/clothing/accessory/talisman
	gloves = /obj/item/pda/chaplain
	shoes = /obj/item/clothing/shoes/laceup
	backpack = /obj/item/storage/backpack/satchel/bone
	satchel = /obj/item/storage/backpack/satchel/leather
	suit = /obj/item/clothing/suit/armor/f13/reno/bulletproof
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m45 = 3,
		/obj/item/melee/onehanded/club/warclub = 1,
		/obj/item/gun/ballistic/automatic/pistol/m1911/custom = 1,
		)


/datum/outfit/job/latterdaysaints/f13missionary/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.grant_language(/datum/language/tribal)
	ADD_TRAIT(H, TRAIT_MACHINE_SPIRITS, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	ADD_TRAIT(H, TRAIT_TRAPPER, src)


/*--------------------------------------------------------------*/

/datum/job/latterdaysaints/f13templeguard
	title = "Temple Guard"
	flag = F13TEMPLEGUARD
	department_flag = FACTION_LDS
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Temple President"
	description = "You are charged with the protection of the President, the Temple and all its inhabitants. If God is with you, who can be against you?"
	selection_color = "#d9c687"
	display_order = JOB_DISPLAY_ORDER_TEMPLEGUARD

	outfit = /datum/outfit/job/latterdaysaints/f13templeguard

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/latterdaysaints,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/latterdaysaints,
			/datum/job/whitelegs,
		),
	)

/datum/outfit/job/latterdaysaints/f13templeguard
	name = "Temple Guard"
	jobtype = /datum/job/latterdaysaints/f13templeguard

	id = /obj/item/card/id/newcanaanite
	belt = /obj/item/storage/belt/military/assault
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/leather
	uniform = /obj/item/clothing/under/rank/security/detective/grey
	suit = /obj/item/clothing/suit/armor/f13/combat/swat
	suit_store = /obj/item/gun/ballistic/automatic/smg/smg10mm/worn
	head = /obj/item/clothing/head/helmet/riot
	neck = /obj/item/storage/belt/holster/legholster
	gloves = /obj/item/clothing/gloves/combat
	shoes = /obj/item/clothing/shoes/combat
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/m1911 = 1,
		/obj/item/restraints/handcuffs = 2,
		/obj/item/melee/classic_baton/telescopic = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/ext = 2,
		/obj/item/ammo_box/magazine/m45/empty = 2,
		/obj/item/ammo_box/c45/rubber = 1,
		)


/datum/outfit/job/latterdaysaints/f13templeguard/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)


/*--------------------------------------------------------------*/

/datum/job/latterdaysaints/f13newcanaanite
	title = "New Canaanite"
	flag = F13NEWCANAANITE
	department_flag = FACTION_LDS
	total_positions = -1
	spawn_positions = -1
	supervisors = "the Temple President"
	description = "Through birth, marriage or some other circumstance, you are a New Canaanite. A survivor of the exodus from your homeland. It's beautiful towns in the mountains and on the shores of the Great Salt Lake now ash, fallen to the treachery of the White Legs."
	selection_color = "#d9c687"
	display_order = JOB_DISPLAY_ORDER_NEWCANAANITE

	outfit = /datum/outfit/job/latterdaysaints/f13newcanaanite
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/latterdaysaints,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/latterdaysaints,
			/datum/job/whitelegs,
		),
	)

datum/outfit/job/latterdaysaints/f13newcanaanite/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		uniform = pick(
		/obj/item/clothing/under/f13/picnicdress50s, \
		/obj/item/clothing/under/f13/picnicdress50s, \
		/obj/item/clothing/under/f13/bluedress, \
		/obj/item/clothing/under/rank/civilian/lawyer/black/alt/skirt, \
		/obj/item/clothing/under/misc/durathread/skirt, \
		/obj/item/clothing/under/rank/civilian/lawyer/female/skirt \
		)
	if(H.gender == MALE)
		uniform = pick(
		/obj/item/clothing/under/f13/caravaneer, \
		/obj/item/clothing/under/rank/civilian/lawyer/black/alt, \
		/obj/item/clothing/under/rank/security/detective, \
		/obj/item/clothing/under/suit/sl, \
		/obj/item/clothing/under/f13/marlowduds, \
		/obj/item/clothing/under/rank/security/detective/grey \
		)

/datum/outfit/job/latterdaysaints/f13newcanaanite
	name = "New Canaanite"
	jobtype = /datum/job/latterdaysaints/f13newcanaanite

	id = /obj/item/card/id/newcanaanite
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/m1911 = 1,
		/obj/item/ammo_box/magazine/m45 = 3,
		)

/datum/outfit/job/den/f13deputy/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)


/*--------------------------------------------------------------*/
