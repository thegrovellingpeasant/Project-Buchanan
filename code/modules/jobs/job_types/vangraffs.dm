/datum/job/vangraffs //do NOT use this for anything, it's just to store faction datums
	department_flag = VANGRAFFS
	selection_color = "#98e698"
	faction = FACTION_VANGRAFFS
	exp_type = EXP_TYPE_VANGRAFFS
	maptype = "reno"

	access = list(ACCESS_VANGRAFFS)
	minimal_access = list(ACCESS_VANGRAFFS)
	forbids = "The NCR forbids: Chem and drug use such as jet or alcohol while on duty. Execution of unarmed or otherwise subdued targets without authorisation."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republic's laws. Wearing the uniform."
	objectivesList = list("Leadership recommends the following goal for this week: Establish an outpost at the radio tower","Leadership recommends the following goal for this week: Neutralize and capture dangerous criminals", "Leadership recommends the following goal for this week: Free slaves and establish good relations with unaligned individuals.")

/datum/outfit/job/vangraffs
	name = "vangraffsdatums"
	jobtype = /datum/job/vangraffs
	ears = /obj/item/radio/headset/headset_vangraffs
	id = /obj/item/card/id/reno/vangraffs/business
	backpack = /obj/item/storage/backpack/satchel/old
	satchel = /obj/item/storage/backpack/satchel/old

/datum/outfit/job/vangraffs/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/vangraffgate)

/*--------------------------------------------------------------*/

/datum/job/vangraffs/f13branchmanager
	faction_head = TRUE
	title = "Van Graff Branch Manager"
	flag = F13BRANCHMANAGER
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Matriarch"
	description = "You are the Branch Manager of the Reno Branch of the Van Graffs.  You are a member of the Van Graff family by blood and entrusted with the management of the local operation and its assets. Make sure profits continue to flow in, strike deals with the locals, and further your power in the city."
	selection_color = "#5bd75b"
	exp_requirements = EXP_TYPE_VANGRAFFS

	outfit = /datum/outfit/job/vangraffs/f13branchmanager

/datum/outfit/job/vangraffs/f13branchmanager
	name = "Branch Manager"
	jobtype = /datum/job/vangraffs/f13branchmanager

	accessory = null
	shoes = /obj/item/clothing/shoes/laceup
	head = null
	id = /obj/item/card/id/reno/vangraffs/business/management
	glasses = null
	neck = /obj/item/storage/belt/holster/legholster
	gloves = null
	belt = null
	suit = /obj/item/clothing/suit/armor/f13/reno/bulletproof
	suit_store = /obj/item/gun/energy/laser/plasma/pistol
	r_hand = null
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/storage/bag/money/small/huge = 1,
		)

/datum/outfit/job/vangraffs/f13branchmanager/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/suit/modeusformalwear

	if(H.gender == MALE)
		uniform = /obj/item/clothing/under/suit/lawyerblackalt

	if(H.skin_tone == "african1")
		return
	if(H.skin_tone == "african2")
		return
	else
		H.skin_tone = pick("african1", "african2")

/datum/outfit/job/vangraffs/f13branchmanager/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	var/list/family_name = splittext(H.real_name, " ")
	if(family_name[family_name.len - 1] == "Van" && family_name[family_name.len] == "Graff")
		return
	if(family_name[family_name.len - 1] == "Graff" && family_name[family_name.len] == "Van")
		family_name[family_name.len - 1] = "Van"
		family_name[family_name.len] = "Graff"	//If for some reason someone wants to be funny and switch up the two words to bypass the change
		var/new_name = jointext(family_name, " ")
		H.real_name = new_name
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()
		return							//Wouldn't write this proc over usually, but for some reason it just adds Van Graff over again if I don't do this
	if(family_name.len == 1)
		H.real_name += " Van Graff"
	else
		family_name[family_name.len] = "Van Graff"
		var/new_name = jointext(family_name, " ")
		H.real_name = new_name
	H.name = H.real_name
	if(H.wear_id)
		var/obj/item/card/id/dogtag/L = H.wear_id
		L.registered_name = H.name
		L.update_label()

	if(SSticker.mode.objs_generated && SSticker.mode.name == "mobsters")
		H.mind.special_role = ROLE_MOBSTER
		H.mind.add_antag_datum(/datum/antagonist/mobster, SSticker.mode.vgraffteam)

	ADD_TRAIT(H, TRAIT_LEADER, src)

/*--------------------------------------------------------------*/

/datum/job/vangraffs/f13vgenforcer
	title = "Van Graff Enforcer"
	flag = F13VGENFORCER
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Branch Manager"
	description = "By some means or another you were appointed as the head of security for the Reno Branch. You are to manage the team of guards, protect Van Graff property, and follow the Branch Manager's orders to the letter."
	selection_color = "5bd75b"

	outfit = /datum/outfit/job/vangraffs/f13vgenforcer
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
/datum/outfit/job/vangraffs/f13vgenforcer
	name = "Van Graff Enforcer"
	jobtype = /datum/job/vangraffs/f13vgenforcer

	uniform	= /obj/item/clothing/under/f13/vangraffs/tacticalfatigues
	accessory = null
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/helmet/f13/combat/vangraffs/enforcer
	id = /obj/item/card/id/reno/vangraffs/business/management
	glasses = null
	neck = /obj/item/storage/belt/holster/legholster
	gloves = /obj/item/clothing/gloves/f13/military
	belt = /obj/item/clothing/gloves/f13/military
	suit = /obj/item/clothing/suit/armor/f13/combat/vangraffs/enforcer
	suit_store = /obj/item/gun/energy/laser/plasma
	r_hand = null
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/storage/bag/money/small/big = 1)

/datum/outfit/job/vangraffs/f13vgenforcer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(SSticker.mode.objs_generated && SSticker.mode.name == "mobsters")
		H.mind.special_role = ROLE_MOBSTER
		H.mind.add_antag_datum(/datum/antagonist/mobster, SSticker.mode.vgraffteam)

	ADD_TRAIT(H, TRAIT_LEADER, src)

/*--------------------------------------------------------------*/

/datum/job/vangraffs/f13weaponsmith
	title = "Van Graff Weapon Smith"
	flag = F13WEAPONSMITH
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Branch Manager"
	description = "You're an employee of the Van Graffs, in charge of the manufacturing and sale of energy weapons. However, you are not allowed to use merchandise for yourself unless given permission."

	outfit = /datum/outfit/job/vangraffs/f13weaponsmith
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
/datum/outfit/job/vangraffs/f13weaponsmith
	name = "Van Graff Weapon Smith"
	jobtype = /datum/job/vangraffs/f13weaponsmith

	uniform = /obj/item/clothing/under/f13/merccharm
	accessory = null
	head = null
	glasses = /obj/item/clothing/glasses/welding
	neck = null
	gloves = null
	belt = /obj/item/storage/belt/utility/full
	suit = null
	suit_store = null
	backpack_contents = list(
		/obj/item/storage/bag/money/small/few = 1,
		/obj/item/gun/energy/laser/wattz = 1,
		/obj/item/stock_parts/cell/ammo/ec = 1
		)

/datum/outfit/job/vangraffs/f13weaponsmith/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/f13/female/merccharm
		shoes = /obj/item/clothing/shoes/f13/diesel/alt

	if(H.gender == MALE)
		uniform = /obj/item/clothing/under/f13/merccharm
		shoes = /obj/item/clothing/shoes/f13/diesel

/datum/outfit/job/vangraffs/f13weaponsmith/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(SSticker.mode.objs_generated && SSticker.mode.name == "mobsters")
		H.mind.special_role = ROLE_MOBSTER
		H.mind.add_antag_datum(/datum/antagonist/mobster, SSticker.mode.vgraffteam)

	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AEP7)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AER9)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lightplasmapistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/plasmarifle)

/*--------------------------------------------------------------*/

/datum/job/vangraffs/f13researchcontractor
	title = "Van Graff Research Contractor"
	flag = F13RESEARCHCONTRACTOR
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Branch Manager"
	description = "The egghead of the operation; your job is involved with the research and production of state-of-the-art robotics."

	outfit = /datum/outfit/job/vangraffs/f13researchcontractor

/datum/outfit/job/vangraffs/f13researchcontractor
	name = "Van Graff Researcher"
	jobtype = /datum/job/vangraffs/f13researchcontractor

	belt = /obj/item/storage/belt/utility/full
	id = /obj/item/card/id
	uniform = /obj/item/clothing/under/f13/vault/vcity
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/toggle/labcoat/f13
	glasses = /obj/item/clothing/glasses/hud/health
	backpack_contents = list(
		/obj/item/gun/energy/laser/wattz/magneto = 1,
		/obj/item/stock_parts/cell/ammo/ec = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/medium = 1)

/datum/outfit/job/vangraffs/f13researchcontractor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(SSticker.mode.objs_generated && SSticker.mode.name == "mobsters")
		H.mind.special_role = ROLE_MOBSTER
		H.mind.add_antag_datum(/datum/antagonist/mobster, SSticker.mode.vgraffteam)

	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)

/*--------------------------------------------------------------*/

/datum/job/vangraffs/f13guard
	title = "Van Graff Guard"
	flag = F13GUARD
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Enforcer"
	description = "You're a member of the Van Graff's private army. Protect the interests and property of the local branch, but don't scare off potential customers."

	outfit = /datum/outfit/job/vangraffs/f13guard
/*
	loadout_options = list(
	/datum/outfit/loadout/chef,
	/datum/outfit/loadout/bartender,
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
/datum/outfit/job/vangraffs/f13guard
	name = "Van Graff Guard"
	jobtype = /datum/job/vangraffs/f13guard

	uniform	= /obj/item/clothing/under/f13/vangraffs/tacticalfatigues
	accessory = null
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/helmet/f13/combat/vangraffs
	glasses = null
	neck = /obj/item/storage/belt/holster/legholster
	gloves = /obj/item/clothing/gloves/f13/military
	belt = /obj/item/storage/belt/military/assault
	suit = /obj/item/clothing/suit/armor/f13/combat/vangraffs
	suit_store = /obj/item/gun/energy/laser/aer9
	r_hand = null
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/storage/bag/money/small/few = 1)

/datum/outfit/job/vangraffs/f13guard/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(SSticker.mode.objs_generated && SSticker.mode.name == "mobsters")
		H.mind.special_role = ROLE_MOBSTER
		H.mind.add_antag_datum(/datum/antagonist/mobster, SSticker.mode.vgraffteam)

