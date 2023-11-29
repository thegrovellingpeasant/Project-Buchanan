/datum/job/wrights //do NOT use this for anything, it's just to store faction datums
	department_flag = WRIGHTS
	selection_color = "#B3875E"
	faction = FACTION_WRIGHTS
	exp_type = EXP_TYPE_WRIGHTS
	maptype = "reno"

	access = list(ACCESS_WRIGHTS)
	minimal_access = list(ACCESS_WRIGHTS)
	forbids = "Due to the Wrights moralistic outlook prostitution and chems are forbidden. Also, due to the close blood ties among the members of the families, ghouls are not allowed."
	enforces = "The Wrights are the only Reno family that are a literal family, so it is expected of all of its members to have blood ties to the family. Due to this, extreme loyalty and obedience to a strong chain of command are also expected of its members. Wearing the family suit is required, unless acting as an infiltrator."
	objectivesList = list ("Focus on the mass production of cheap guns.", "Focus on the mass production of alcohol to provide to the other families and the people of New Reno.", "Extort the small businesses of New Reno to get a cut from their profits, but be weary, the other families may want a cut from them too.")



/datum/outfit/job/wrights
	name = "wrightsdatums"
	jobtype = /datum/job/wrights
	ears = /obj/item/radio/headset/headset_wrights
/*--------------------------------------------------------------*/

/datum/job/wrights/f13wrightelder
	title = "Wrights Elder"
	flag = F13WRIGHTSELDER
	department_flag = WRIGHTS
	total_positions = 1
	spawn_positions = 1
	supervisors = "Mr Wright"
	description = "You are the head of the Wright family. Although small, the Wrights are a proud and prosperous family, and it falls onto you to ensure that all the members keep the core tenets of your organization by avoiding both the consumption and distribution of chems and prostitution. To compensate, you have in your power the monopoly to the local production of alcohol and access to most of the cheap guns in the area. Assign soldiers to your capos. Allow capos to have some level of autonomy regarding their soldiers, as long as it doesn't hinder the flow of business. Talk to your underboss to help you coordinate the affairs of the gang. You are the most proper and correct family in New Reno: Be polite, don't act like a thug, and keep bums and vagrants away from your territory."
	selection_color = "#A27954"
	exp_requirements = EXP_TYPE_WRIGHTS

	outfit = /datum/outfit/job/wrights/f13elder

	loadout_options = list(
		/datum/outfit/loadout/feelluckypunk,		// .44 magnum
		/datum/outfit/loadout/householddefense,	// lever action
		)

/datum/outfit/job/wrights/f13elder
	name = "Wright Elder"
	jobtype = /datum/job/wrights/f13wrightelder

	uniform	= /obj/item/clothing/under/f13/wrights/elder
	id = /obj/item/card/id/reno/wrights/ring/boss
	accessory = null
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/helmet/f13/wrights/tophat
	neck = /obj/item/storage/belt/holster/legholster
	gloves = /obj/item/clothing/gloves/f13/crudemedical/formal
	suit = /obj/item/clothing/suit/armor/f13/wrights/elder
	suit_store = null
	r_hand = null
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/clothing/mask/cigarette/pipe = 1,
		/obj/item/storage/bag/money/small/ncrenlisted = 1,
		)

/datum/outfit/loadout/feelluckypunk
	name = "Feel lucky punk?"
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/revolver44 = 1,
		/obj/item/ammo_box/magazine/m44 = 2,
		)

/datum/outfit/loadout/householddefense
	name = "Household Defense"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/smg/american180 = 1,
		/obj/item/ammo_box/magazine/m22smg = 1,
		)

/datum/outfit/job/wrights/f13elder/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/list/family_name = splittext(H.real_name, " ")
	if(family_name[family_name.len] == "Wright")
		return
	if(family_name.len == 1)
		H.real_name += " Wright"
	else
		family_name[family_name.len] = "Wright"
		var/new_name = jointext(family_name, " ")
		H.real_name = new_name
	H.name = H.real_name
	if(H.wear_id)
		var/obj/item/card/id/dogtag/L = H.wear_id
		L.registered_name = H.name
		L.update_label()

	if(SSticker.mode.objs_generated && SSticker.mode.name == "mobsters")
		H.mind.special_role = ROLE_MOBSTER
		H.mind.add_antag_datum(/datum/antagonist/mobster, SSticker.mode.wrightteam)
	if(H.gender == FEMALE)
		H.gender = MALE
		H.real_name = random_unique_name(MALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/reno/wrights/ring/boss/L = H.wear_id
			L.registered_name = H.name
			L.update_label()

	ADD_TRAIT(H, TRAIT_LEADER, src)

/*--------------------------------------------------------------*/

/datum/job/wrights/f13enforcer
	title = "Wright Enforcer"
	flag = F13WRIGHTSENFORCER
	department_flag = WRIGHTS
	total_positions = 2
	spawn_positions = 2
	supervisors = "Wright Elder"
	description = "You have proven your worth as an earner for the Wright Family and, as such, it has been trusted to you to lead a small band of soldiers for the boss. You are the mediator between the head of the family and said soldiers, so expect to be given some level of autonomy to use your subordinates in the most efficient way possible to meet the needs of the boss and the family. Should the soldiers not be assigned to you by the Boss or the Underboss, the decision will fall unto you and the other capos. Assert the core tenets of the Wright family to your subordinates by making them avoid drugs and prostitution, and enforce loyalty as well among the ranks. Remember that you are also bound by these tenets; treason against your superiors is out of the question. Follow the orders of your superiors, protect the family premises and its rackets on the streets of New Reno."
	exp_requirements = EXP_TYPE_WRIGHTS

	outfit = /datum/outfit/job/wrights/f13enforcer

/datum/outfit/job/wrights/f13enforcer
	name = "Wright Enforcer"
	jobtype = /datum/job/wrights/f13enforcer

	uniform	= /obj/item/clothing/under/f13/wrights/officer
	id = /obj/item/card/id/reno/wrights/ring/officer
	accessory = null
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/helmet/f13/wrights/boater
	neck = null
	gloves = null
	suit = /obj/item/clothing/suit/armor/f13/wrights/formalcoat
	suit_store = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/lighter/greyscale = 1,
		/obj/item/clothing/mask/cigarette/cigar = 1,
		)

/datum/outfit/job/wrights/f13enforcer/pre_equip(mob/living/carbon/human/H)
	. = ..()
	r_hand = pick(
		/obj/item/storage/backpack/duffelbag/equipment/wrights/enforcer/set1,
		/obj/item/storage/backpack/duffelbag/equipment/wrights/enforcer/set2)

/datum/outfit/job/wrights/f13enforcer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/list/family_name = splittext(H.real_name, " ")
	if(family_name[family_name.len] == "Wright")
		return
	if(family_name.len == 1)
		H.real_name += " Wright"
	else
		family_name[family_name.len] = "Wright"
		var/new_name = jointext(family_name, " ")
		H.real_name = new_name
	H.name = H.real_name
	if(H.wear_id)
		var/obj/item/card/id/dogtag/L = H.wear_id
		L.registered_name = H.name
		L.update_label()

	if(SSticker.mode.objs_generated && SSticker.mode.name == "mobsters")
		H.mind.special_role = ROLE_MOBSTER
		H.mind.add_antag_datum(/datum/antagonist/mobster, SSticker.mode.wrightteam)

	ADD_TRAIT(H, TRAIT_LEADER, src)

/*--------------------------------------------------------------*/

/datum/job/wrights/f13hooligan
	title = "Wright Hooligan"
	flag = F13WRIGHTHOOLIGAN
	department_flag = WRIGHTS
	total_positions = 6
	spawn_positions = 6
	supervisors = "Wright Capos, the Underboss, and the Wright Boss"
	description = "You have been made a soldier of the Wright Family. Expect to be assigned to follow the orders of one of the Capos. Do not disturb the boss or the underboss with unnecessary affairs. Remember to follow the core tenets of the Wright family by avoiding drugs and prostitution, and keeping yourself loyal to your superiors whatever the cost."
	exp_requirements = EXP_TYPE_WRIGHTS

	outfit = /datum/outfit/job/wrights/f13hooligan


/datum/outfit/job/wrights/f13hooligan
	name = "Wright Soldier"
	jobtype = /datum/job/wrights/f13hooligan

	id = /obj/item/card/id/reno/wrights/ring/soldier
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/lighter/greyscale = 1,
		/obj/item/clothing/mask/cigarette/cigar = 1,
		)


/datum/outfit/job/wrights/f13hooligan/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/f13/wrights/woman
		shoes = /obj/item/clothing/shoes/laceup

	if(H.gender == MALE)
		uniform = /obj/item/clothing/under/f13/wrights/man
		shoes = /obj/item/clothing/shoes/f13/explorer

/datum/outfit/job/wrights/f13hooligan/pre_equip(mob/living/carbon/human/H)
	. = ..()
	suit = pick(
		/obj/item/clothing/suit/armor/f13/wrights/jacket,
		/obj/item/clothing/suit/armor/f13/wrights/jacket/tan,
		/obj/item/clothing/suit/armor/f13/wrights/jacket/black,
		/obj/item/clothing/suit/armor/f13/wrights/jacket/brown,
		/obj/item/clothing/suit/armor/f13/wrights/armored_vest)

	head = pick(
		/obj/item/clothing/head/helmet/f13/wrights,
		/obj/item/clothing/head/helmet/f13/wrights/flatcap)

	r_hand = pick(
		/obj/item/storage/backpack/duffelbag/equipment/wrights/hooligan/set1,
		/obj/item/storage/backpack/duffelbag/equipment/wrights/hooligan/set2,
		/obj/item/storage/backpack/duffelbag/equipment/wrights/hooligan/set3,
		/obj/item/storage/backpack/duffelbag/equipment/wrights/hooligan/set4,
		/obj/item/storage/backpack/duffelbag/equipment/wrights/hooligan/set5)

/datum/outfit/job/wrights/f13hooligan/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/list/family_name = splittext(H.real_name, " ")
	if(family_name[family_name.len] == "Wright")
		return
	if(family_name.len == 1)
		H.real_name += " Wright"
	else
		family_name[family_name.len] = "Wright"
		var/new_name = jointext(family_name, " ")
		H.real_name = new_name
	H.name = H.real_name
	if(H.wear_id)
		var/obj/item/card/id/dogtag/L = H.wear_id
		L.registered_name = H.name
		L.update_label()

	if(SSticker.mode.objs_generated && SSticker.mode.name == "mobsters")
		H.mind.special_role = ROLE_MOBSTER
		H.mind.add_antag_datum(/datum/antagonist/mobster, SSticker.mode.wrightteam)

/*--------------------------------------------------------------*/

/////////
///WIP///
/////////

/datum/job/wrights/f13manager
	title = "Shop Manager"
	flag = F13WRIGHTSMANAGER
	department_flag = WRIGHTS
	total_positions = 1
	spawn_positions = 1
	supervisors = "Wright Elder"
	description = "You are a trusted member of the family that has been placed in charge of the Wright family's trade racket. Manage your workers, pull in profits, and keep the family well funded."
	exp_requirements = EXP_TYPE_WRIGHTS

	outfit = /datum/outfit/job/wrights/f13manager

/datum/outfit/job/wrights/f13manager
	name = "Wright Shop Manager"
	jobtype = /datum/job/wrights/f13manager

	uniform	= /obj/item/clothing/under/f13/wrights/officer
	id = /obj/item/card/id/reno/wrights/ring/officer
	accessory = null
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/helmet/f13/wrights/conductor
	neck = null
	gloves = null
	suit = /obj/item/clothing/suit/armor/f13/wrights/jacket/brown
	suit_store = /obj/item/gun/ballistic/shotgun/hunting
	r_hand = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/clipboard = 1,
		/obj/item/pen = 1,
		)

/datum/outfit/job/wrights/f13manager/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/list/family_name = splittext(H.real_name, " ")
	if(family_name[family_name.len] == "Wright")
		return
	if(family_name.len == 1)
		H.real_name += " Wright"
	else
		family_name[family_name.len] = "Wright"
		var/new_name = jointext(family_name, " ")
		H.real_name = new_name
	H.name = H.real_name
	if(H.wear_id)
		var/obj/item/card/id/dogtag/L = H.wear_id
		L.registered_name = H.name
		L.update_label()

/*--------------------------------------------------------------*/

/datum/job/wrights/f13employee
	title = "Shop Employee"
	flag = F13WRIGHTSEMPLOYEE
	department_flag = WRIGHTS
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Store Manager"
	description = "You are an employee of New Reno Arms, which is under the wing of the Wright Family. Your job consists of manning the storefront, ordering shipments, and unloading cargo.  Remember that you don't personally own the store's goods."
	exp_requirements = EXP_TYPE_WRIGHTS

	outfit = /datum/outfit/job/wrights/f13employee

/datum/outfit/job/wrights/f13employee
	name = "Wright Employee"
	jobtype = /datum/job/wrights/f13employee

	id = /obj/item/card/id/reno/papers/worker
	accessory = null
	shoes = /obj/item/clothing/shoes/f13/explorer
	head = null
	neck = null
	gloves = null
	suit = null
	suit_store = null
	r_hand = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/lighter/greyscale = 1,
		/obj/item/clothing/mask/cigarette/cigar = 1,
		)

/datum/outfit/job/wrights/f13employee/pre_equip(mob/living/carbon/human/H)
	. = ..()
	uniform = pick(
		/obj/item/clothing/under/overalls,
		/obj/item/clothing/under/f13/shiny,
		/obj/item/clothing/under/f13/caravaneer,
		/obj/item/clothing/under/f13/machinist,
		/obj/item/clothing/under/f13/lumberjack)


/*--------------------------------------------------------------*/

/datum/job/wrights/f13clinicsupervisor
	title = "Clinic Supervisor"
	flag = F13WRIGHTSCLINICSUPERVISOR
	department_flag = WRIGHTS
	total_positions = 1
	spawn_positions = 1
	supervisors = "Wright Enforcers"
	description = "You are the clinic supervisor, although you may not be a member of the family you report to them and they are entitled to a share of the clinic's earnings. Your duties are to manage the staff of the clinic, charge as necessary, and help the people of New Reno. Though be weary of the fact that the Wrights would not take kindly to you aiding their enemies."
	exp_requirements = EXP_TYPE_WRIGHTS

	outfit = /datum/outfit/job/wrights/f13clinicsupervisor

/datum/outfit/job/wrights/f13clinicsupervisor
	name = "Wright Clinic Supervisor"
	jobtype = /datum/job/wrights/f13clinicsupervisor

	uniform	= /obj/item/clothing/under/suit/charcoal
	id = /obj/item/card/id/reno/clinic/papers
	accessory = null
	shoes = /obj/item/clothing/shoes/laceup
	head = null
	mask =  /obj/item/clothing/mask/surgical
	neck = null
	gloves = null
	suit = /obj/item/clothing/suit/toggle/labcoat/cmo
	suit_store = null
	r_hand = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/healthanalyzer = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,)

/datum/outfit/job/followers/f13leadpractitioner/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)

/*--------------------------------------------------------------*/

/datum/job/wrights/f13practitioner
	title = "Practitioner"
	flag = F13WRIGHTSPRACTITIONER
	faction = FACTION_CITIZENS
	total_positions = 2
	spawn_positions = 2
	description = "You are a doctor for the small local clinic, the only entity providing healthcare to the people of New Reno. Since this is one of the few charities present in town, don't expect things to go smoothly. For one, you are under the thumb of the Wright family and may end up in the crossfire of any of their conflicts. Manage the resources that you have, heal the sick, and help addicts. "

	outfit = /datum/outfit/job/wrights/f13practitioner

	access = list(ACCESS_RENO_CLINIC)

/datum/outfit/job/wrights/f13practitioner
	name = "Wright Practitioner"
	jobtype = /datum/job/wrights/f13practitioner

	uniform	= /obj/item/clothing/under/f13/doctor
	id = /obj/item/card/id/reno/clinic/papers
	accessory = null
	shoes = /obj/item/clothing/shoes/f13/brownie
	head = null
	mask =  /obj/item/clothing/mask/surgical
	neck = /obj/item/clothing/neck/stethoscope
	gloves =  /obj/item/clothing/gloves/color/white
	suit = /obj/item/clothing/suit/toggle/labcoat/f13
	suit_store = null
	r_hand = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/healthanalyzer = 1,
		/obj/item/storage/bag/money/small/wastelander = 1)

/datum/outfit/job/wrights/f13practitioner/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)

/////////////
//loadouts///
/////////////

//hooligan

/obj/item/storage/backpack/duffelbag/equipment/wrights/hooligan/set1/PopulateContents() //pipe rifle, butcher knife
    new /obj/item/gun/ballistic/revolver/hobo/piperifle(src)
    new /obj/item/ammo_box/a556/sport/improvised(src)
    new /obj/item/kitchen/knife/butcher(src)

/obj/item/storage/backpack/duffelbag/equipment/wrights/hooligan/set2/PopulateContents() //357 revolver
    new /obj/item/gun/ballistic/revolver/colt357(src)
    new /obj/item/ammo_box/a357(src)
    new /obj/item/ammo_box/a357(src)

/obj/item/storage/backpack/duffelbag/equipment/wrights/hooligan/set3/PopulateContents() //shotgun bat
    new /obj/item/gun/ballistic/revolver/single_shotgun(src)
    new /obj/item/ammo_box/shotgun/improvised(src)

/obj/item/storage/backpack/duffelbag/equipment/wrights/hooligan/set4/PopulateContents() //556 pistol
    new /obj/item/gun/ballistic/revolver/thatgun(src)
    new /obj/item/ammo_box/a556/sport/improvised(src)

/obj/item/storage/backpack/duffelbag/equipment/wrights/hooligan/set5/PopulateContents() //spiked baseball bat, throwing knives
    new /obj/item/twohanded/baseball/spiked(src)
    new /obj/item/melee/onehanded/knife/throwing(src)
    new /obj/item/melee/onehanded/knife/throwing(src)
    new /obj/item/melee/onehanded/knife/throwing(src)

//enforcer

/obj/item/storage/backpack/duffelbag/equipment/wrights/enforcer/set1/PopulateContents() //autopipe
    new /obj/item/gun/ballistic/automatic/autopipe(src)
    new /obj/item/ammo_box/magazine/autopipe(src)
    new /obj/item/ammo_box/magazine/autopipe(src)
    new /obj/item/twohanded/baseball(src)

/obj/item/storage/backpack/duffelbag/equipment/wrights/enforcer/set2/PopulateContents() //hunting shotgun
    new /obj/item/gun/ballistic/shotgun/hunting(src)
    new /obj/item/ammo_box/shotgun/buck(src)
    new /obj/item/ammo_box/shotgun/buck(src)
    new /obj/item/twohanded/baseball(src)
