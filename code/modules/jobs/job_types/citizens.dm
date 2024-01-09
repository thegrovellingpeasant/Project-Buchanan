/datum/job/citizens
	department_flag = CITIZENS
	exp_type = EXP_TYPE_CITIZENS
	faction = FACTION_CITIZENS
	maptype = "reno"
	selection_color = "#ffeeaa"

/datum/job/citizens/f13judge
	title = "Judge"
	flag = F13JUDGE
	total_positions = 1
	spawn_positions = 1
	description = "You are a great arbiter, and the only one in this shithole! Your word is law, and you give definitive unquestionable conclusions to matters that are too complex for your average NCR citizen. In your stead the NRPD Chief and officers of the army may extraordinarily hold your position."
	supervisors = "NCR law"
	selection_color = "#dece90"
	outfit = /datum/outfit/job/citizens/f13judge
	access = list(ACCESS_NRPD)
	minimal_access = list(ACCESS_NRPD)


/datum/outfit/job/citizens/f13judge/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_LEADER, src)

/datum/outfit/job/citizens/f13judge
	name = "Judge"
	jobtype = /datum/job/citizens/f13judge
	id = /obj/item/card/id/dogtag/sheriff
	ears = /obj/item/radio/headset/headset_government_nrpd
	uniform	= /obj/item/clothing/under/suit/lawyerblackalt
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/judgerobe
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/megaphone = 1,
		/obj/item/pen/fountain = 1,
		/obj/item/pen/fourcolor = 1,
		/obj/item/storage/bag/money/small/big = 1,
		/obj/item/gun/ballistic/automatic/pistol/deagle = 1,
		/obj/item/ammo_box/magazine/m44 = 2
		)

/datum/job/citizens/f13rpdpolicechief
	title = "NRPD Chief"
	flag = F13RPDPOLICECHIEF
	total_positions = 1
	spawn_positions = 1
	description = "Reno is a borderline lawless city, 'human sewage', as it's often said, washes into Reno on a near daily basis; it's not rare to see the results of dealings gone wrong, chem fueled violent bums, and the escalated situations with the gangs. And you're the one who's supposed to deal with this, the Chief of the Reno Police Department. Corruption isn't out of the window, especially considering it was the Bishops who funded the department. Your duties are to organize your men to keep the peace, prevent gang wars from breaking out, and enforcing NCR common law."
	supervisors = "NCR common law and the mayor"
	outfit = /datum/outfit/job/citizens/f13rpdpolicechief
	access = list(ACCESS_NRPD)
	minimal_access = list(ACCESS_NRPD)


/datum/outfit/job/citizens/f13rpdpolicechief/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)

/datum/outfit/job/citizens/f13rpdpolicechief
	name = "Police Chief"
	jobtype = /datum/job/citizens/f13rpdpolicechief
	id = /obj/item/card/id/dogtag/sheriff
	ears = /obj/item/radio/headset/headset_government_nrpd
	uniform	= /obj/item/clothing/under/f13/ncr/police
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/helmet/f13/civilians/ncr_police_chief
	glasses = /obj/item/clothing/glasses/sunglasses/big
	neck = /obj/item/storage/belt/holster/legholster
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/f13/civilians/ncr_police_coat
	suit_store = /obj/item/gun/ballistic/automatic/shotgun/riot
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/rubber = 2,
		/obj/item/ammo_box/magazine/d12g/empty = 2,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/melee/classic_baton/police = 1,
		/obj/item/reagent_containers/spray/pepper = 1,
		/obj/item/gun/energy/laser/complianceregulator = 1,
		/obj/item/storage/bag/money/small/medium = 1
		)

/datum/job/citizens/f13rpdofficer
	title = "NRPD Officer"
	flag = F13RPDOFFICER
	total_positions = 5
	spawn_positions = 5
	description = "You are an officer of the Reno Police Department. Uphold NCR common law, follow the orders of the Chief of Police, and keep the situation in the streets from getting too bloody."
	supervisors = "NCR common law and the mayor"
	outfit = /datum/outfit/job/citizens/f13rpdofficer
	access = list(ACCESS_NRPD)
	minimal_access = list(ACCESS_NRPD)


/datum/outfit/job/citizens/f13rpdofficer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/datum/outfit/job/citizens/f13rpdofficer
	name = "Police Officer"
	jobtype = /datum/job/citizens/f13rpdofficer
	id = /obj/item/card/id/dogtag/deputy
	ears = /obj/item/radio/headset/headset_nrpd
	uniform	= /obj/item/clothing/under/f13/ncr/police
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/helmet/f13/civilians/ncr_police_helmet
	glasses = /obj/item/clothing/glasses/sunglasses/big
	neck = /obj/item/storage/belt/holster/legholster
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/f13/civilians/ncr_police_coat
	suit_store = /obj/item/gun/ballistic/shotgun/police
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/rubber = 2,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/melee/classic_baton/police = 1,
		/obj/item/reagent_containers/spray/pepper = 1,
		/obj/item/gun/energy/laser/complianceregulator = 1,
		/obj/item/storage/bag/money/small/meager = 1
		)

/datum/job/citizens/f13ncrcfwarden
	title = "NCRCF Warden"
	flag = F13NCRCFWARDEN
	total_positions = 1
	spawn_positions = 1
	description = "You are the Lieutenant in charge of the correctional facility. The convicts will abide by NCR regulation, your guards will obey your every order, and you'll get to have a little fun while the magnifying glass isn't on you. Historically, NCR prisoners have not had the best quality of life!"
	supervisors = "the captain"
	selection_color = "#dece90"
	outfit = /datum/outfit/job/citizens/f13ncrcfwarden
	access = list(ACCESS_NCR)
	minimal_access = list(ACCESS_NCR)


/datum/outfit/job/citizens/f13ncrcfwarden/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LEADER, src)

/datum/outfit/job/citizens/f13ncrcfwarden
	name = "Warden"
	jobtype = /datum/job/citizens/f13ncrcfwarden
	id = /obj/item/card/id/dogtag/ncrlieutenant
	uniform	= /obj/item/clothing/under/f13/ncr/ncr_officer
	belt = /obj/item/storage/belt/military/assault/ncr
	shoes = /obj/item/clothing/shoes/f13/military/ncr
	ears = /obj/item/radio/headset/headset_government_ncrcf
	head = /obj/item/clothing/head/beret/ncr/military_police
	glasses = /obj/item/clothing/glasses/sunglasses/big
	neck = /obj/item/storage/belt/holster/legholster
	gloves = /obj/item/clothing/gloves/f13/leather
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/lieutenant
	suit_store = /obj/item/gun/ballistic/automatic/service
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/empty = 2,
		/obj/item/ammo_box/a556/rubber = 2,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/melee/classic_baton/police = 1,
		/obj/item/reagent_containers/spray/pepper = 1,
		/obj/item/gun/energy/laser/complianceregulator = 1,
		/obj/item/storage/bag/money/small/medium = 1
		)

/datum/job/citizens/f13ncrcfguard
	title = "NCRCF Guard"
	flag = F13NCRCFGUARD
	total_positions = 6
	spawn_positions = 6
	description = "Obey and protect. The Warden has swathes of orders ready for you, and the prisoners must be stopped from harming others - even themselves. Put them to work and make this facility profitable, soldier!"
	supervisors = "the Warden"
	outfit = /datum/outfit/job/citizens/f13ncrcfguard
	access = list(ACCESS_NCR)
	minimal_access = list(ACCESS_NCR)


/datum/outfit/job/citizens/f13ncrcfguard/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/datum/outfit/job/citizens/f13ncrcfguard
	name = "Guard"
	jobtype = /datum/job/citizens/f13ncrcfguard
	id = /obj/item/card/id/dogtag/ncrtrooper
	uniform	= /obj/item/clothing/under/f13/ncr
	belt = /obj/item/storage/belt/military/assault/ncr
	shoes = /obj/item/clothing/shoes/f13/military/ncr
	ears = /obj/item/radio/headset/headset_ncrcf
	head = /obj/item/clothing/head/f13/ncr/steelpot_mp
	glasses = /obj/item/clothing/glasses/sunglasses/big
	neck = /obj/item/storage/belt/holster/legholster
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor
	suit_store = /obj/item/gun/ballistic/shotgun/police
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/empty = 2,
		/obj/item/ammo_box/a556/rubber = 2,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/melee/classic_baton/police = 1,
		/obj/item/reagent_containers/spray/pepper = 1,
		/obj/item/gun/energy/laser/complianceregulator = 1,
		/obj/item/storage/bag/money/small/meager = 1
		)

/datum/job/citizens/f13ncrcfphysician
	title = "NCRCF Physician"
	flag = F13NCRCFPHYSICIAN
	total_positions = 1
	spawn_positions = 1
	description = "You lucked out and managed a somewhat well-paying occupation. Learned physicians are hard to come by, so your New Californian citizenship only sweetened the deal as you were whisked away by the government into working on a backwater correctional facility."
	outfit = /datum/outfit/job/citizens/f13ncrcfphysician
	access = list(ACCESS_NCR)
	minimal_access = list(ACCESS_NCR)

/datum/outfit/job/citizens/f13ncrcfphysician
	name = "NCRCF Physician"
	jobtype = /datum/job/citizens/f13ncrcfphysician

	uniform	= /obj/item/clothing/under/rank/medical/doctor/purple
	id = /obj/item/card/id/reno/clinic/papers
	accessory = null
	shoes = /obj/item/clothing/shoes/laceup
	head = null
	mask =  /obj/item/clothing/mask/surgical
	neck = /obj/item/clothing/neck/stethoscope
	gloves =  /obj/item/clothing/gloves/color/latex
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/labgoat
	suit_store = null
	r_hand = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/healthanalyzer = 1,
		/obj/item/storage/bag/money/small/medium = 1)

/datum/outfit/job/citizens/f13ncrcfphysician/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)

/datum/job/citizens/f13convict
	title = "Convict"
	flag = F13CONVICT
	total_positions = -1
	spawn_positions = -1
	description = "You fucked up. Not in what you did, because of course - you had a reason to - but in getting caught. Now you're here, in an NCR prison, doomed to slave away much like your counterparts underneath the Legion's rule. Serve your time quietly and peacefully, and maybe you won't have the boot forced down your throat. Of course, there's always the option of severing the leg..."
	supervisors = "the guards"
	exp_requirements = EXP_TYPE_CITIZENS

	outfit = /datum/outfit/job/citizens/f13convict

	loadout_options = list(
	/datum/outfit/loadout/inmate,
	/datum/outfit/loadout/inmate_khan,
	/datum/outfit/loadout/inmate_chef,
	/datum/outfit/loadout/inmate_tribal,
	/datum/outfit/loadout/inmate_raider,
	/datum/outfit/loadout/inmate_viper,
	)

/datum/outfit/job/citizens/f13convict/pre_equip(mob/living/carbon/human/H)
	. = ..()
	shoes = pick(
		/obj/item/clothing/shoes/sneakers/red,
		/obj/item/clothing/shoes/sneakers/blue,
		/obj/item/clothing/shoes/f13/brownie)

	r_hand = pick(
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set1,
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set2,
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set3,
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set4,
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set5
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set6,
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set7,
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set8,
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set9,
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set10,
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set11,
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set12,
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set13,
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set14,
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set15,
		/obj/item/storage/backpack/duffelbag/equipment/contraband/set16)

/datum/outfit/job/citizens/f13convict
	name = "Convict"
	jobtype = /datum/job/citizens/f13convict

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	ears = null
	id = /obj/item/card/id/prisoner
	uniform = /obj/item/clothing/under/f13/ncrcf
	suit = /obj/item/clothing/suit/armor/f13/ncrcfjacket

/datum/outfit/loadout/inmate
	name = "Inmate"
	head = /obj/item/clothing/head/soft/grey

/datum/outfit/loadout/inmate_khan
	name = "Khan"
	head = /obj/item/clothing/head/helmet/f13/khan/bandana

/datum/outfit/loadout/inmate_chef
	name = "Chef"
	head = /obj/item/clothing/head/chefhat
	suit = /obj/item/clothing/neck/apron/chef
	backpack_contents = list(
		/obj/item/book/manual/chef_recipes = 1
		)

/datum/outfit/loadout/inmate_tribal
	name = "Tribal"
	backpack_contents = list(
		/obj/item/warpaint_bowl = 1,
		/obj/item/clothing/accessory/talisman = 1
		)

/datum/outfit/loadout/inmate_viper
	name = "Viper"
	mask = /obj/item/clothing/mask/bandana/green
	backpack_contents = list(
		/obj/item/toy/plush/snakeplushie = 1
		)

/datum/outfit/loadout/inmate_raider
	name = "Raider"
	mask = /obj/item/clothing/mask/bandana/skull
	glasses = /obj/item/clothing/glasses/legiongoggles

/datum/job/citizens/f13tourist
	title = "Tourist"
	flag = F13TOURIST
	total_positions = -1
	spawn_positions = -1
	description = "You have found you way to New Reno, The Biggest Little City in the World. Though the city itself is usually in a perpetual state of tension between the clashes among the families, the poor state of the charities, or the rampant hobo criminality, you don't need to think too much about it. You've come here to visit the landmarks, stay at a hotel, play some cards in the casino, or enjoy the so called 'New Reno experience', and you have enough caps to make that happen."
	supervisors = "hedonism"
	exp_requirements = EXP_TYPE_CITIZENS

	outfit = /datum/outfit/job/citizens/f13tourist

	loadout_options = list(
	/datum/outfit/loadout/tourist,
	/datum/outfit/loadout/gambler,
	/datum/outfit/loadout/vaultcitytourist,
	/datum/outfit/loadout/vaquero,
	/datum/outfit/loadout/reporter,
	/datum/outfit/loadout/lawyer,
	/datum/outfit/loadout/detective,
	/datum/outfit/loadout/hubologist,
	/datum/outfit/loadout/mercenary,
	)

/datum/outfit/job/citizens/f13tourist/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		uniform = pick(
			/obj/item/clothing/under/suit/modeusformalwear,
			/obj/item/clothing/under/f13/bluedress,
			/obj/item/clothing/under/f13/greendress,
			/obj/item/clothing/under/f13/housewifedress50s,
			/obj/item/clothing/under/f13/picnicdress50s,
			/obj/item/clothing/under/f13/pinkdress,
			/obj/item/clothing/under/f13/sequin_dress,
			/obj/item/clothing/under/f13/collar_dress,
			/obj/item/clothing/under/stripeddress,
			/obj/item/clothing/under/sundress,
			/obj/item/clothing/under/dress/blacktango)

		shoes = pick(
			/obj/item/clothing/shoes/f13/highheels,
			/obj/item/clothing/shoes/f13/brownie,
			/obj/item/clothing/shoes/sandal,
			/obj/item/clothing/shoes/laceup)

	if(H.gender == MALE)
		uniform = pick(
			/obj/item/clothing/under/f13/caravan,
			/obj/item/clothing/under/f13/caravaneer,
			/obj/item/clothing/under/f13/brahmin,
			/obj/item/clothing/under/f13/merchant,
			/obj/item/clothing/under/f13/spring,
			/obj/item/clothing/under/f13/relaxedwear,
			/obj/item/clothing/under/f13/rustic,
			/obj/item/clothing/under/f13/sleazeball,
			/obj/item/clothing/under/f13/shiny,
			/obj/item/clothing/under/f13/hawaiian/red)

		shoes = pick(
			/obj/item/clothing/shoes/f13/explorer,
			/obj/item/clothing/shoes/f13/brownie,
			/obj/item/clothing/shoes/sandal)

/datum/outfit/job/citizens/f13tourist
	name = "Tourist"
	jobtype = /datum/job/citizens/f13tourist

	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	ears = /obj/item/pen
	id = null
	///l_pocket =
	shoes = /obj/item/clothing/shoes/f13/brownie
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		)

/datum/outfit/loadout/tourist
	name = "Tourist"
	backpack_contents = list(
		/obj/item/card/id/dogtag/town/ncr = 1,
		/obj/item/storage/bag/money/small/large = 1)

/datum/outfit/loadout/gambler
	name = "Gambler"
	uniform = /obj/item/clothing/under/suit/checkered
	head = /obj/item/clothing/head/fedora
	shoes =  /obj/item/clothing/shoes/laceup
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/storage/backpack/satchel/leather/withwallet
	backpack_contents = list(
		/obj/item/card/id/dogtag/town/ncr = 1,
		/obj/item/storage/bag/money/small/large = 1)

/datum/outfit/loadout/vaultcitytourist
	name = "Vault City Tourist"
	uniform = /obj/item/clothing/under/f13/vault/vcity
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/melee/classic_baton/telescopic = 1,
		/obj/item/card/id/selfassign = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/big = 1)

/datum/outfit/loadout/vaquero
	name = "Vaquero"
	belt = /obj/item/gun/ballistic/revolver/colt357
	neck = /obj/item/storage/belt/holster
	mask = /obj/item/clothing/mask/ncr_facewrap
	uniform = /obj/item/clothing/under/f13/jamrock
	head = /obj/item/clothing/head/helmet/f13/vaquerohat
	glasses = /obj/item/clothing/glasses/f13/biker
	shoes = /obj/item/clothing/shoes/workboots/mining
	backpack_contents = list(
		/obj/item/ammo_box/a357 = 1,
		/obj/item/card/id/dogtag/town/ncr = 1,
		/obj/item/storage/bag/money/small/meager = 1)

/datum/outfit/loadout/reporter
	name = "Reporter"
	uniform = /obj/item/clothing/under/lawyer/blacksuit
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/card/id/selfassign = 1,
		/obj/item/card/id/dogtag/town/ncr = 1,
		/obj/item/taperecorder = 1,
		/obj/item/pda = 1,
		/obj/item/pen = 1,
		/obj/item/paper = 1,
		/obj/item/camera = 1,
		/obj/item/gun/energy/disabler = 1,
		/obj/item/reagent_containers/spray/pepper = 1,
		/obj/item/wallframe/newscaster = 1,
		/obj/item/storage/bag/money/small/few = 1)

/datum/outfit/loadout/lawyer
	name = "Lawyer"
	suit = /obj/item/clothing/suit/toggle/lawyer
	uniform = /obj/item/clothing/under/lawyer/bluesuit
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/clothing/accessory/lawyers_badge = 1,
		/obj/item/storage/briefcase/lawyer = 1,
		/obj/item/storage/bag/money/small/medium = 1)

/datum/outfit/loadout/detective
	name = "Detective"
	suit = /obj/item/clothing/suit/det_suit/grey
	uniform = /obj/item/clothing/under/f13/detectivealt
	head = /obj/item/clothing/head/f13/det_hat_alt
	shoes =  /obj/item/clothing/shoes/laceup
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/storage/backpack/satchel/explorer
	suit_store = /obj/item/gun/ballistic/revolver/police
	backpack_contents = list(
		/obj/item/pda/detective = 1,
		/obj/item/card/id/dogtag/town/ncr = 1,
		/obj/item/card/id/syndicate = 1,
		/obj/item/camera/detective = 1,
		/obj/item/toy/crayon/white = 1,
		/obj/item/detective_scanner = 1,
		/obj/item/storage/box/gloves = 1,
		/obj/item/storage/box/evidence = 1,
		/obj/item/ammo_box/a357 = 1,
		/obj/item/storage/bag/money/small/meager =1)

/datum/outfit/loadout/hubologist
	name = "Hubologist"
	belt = /obj/item/storage/belt/medical
	suit = /obj/item/clothing/suit/hooded/robes/hubology
	glasses = /obj/item/clothing/glasses/hud/health/f13
	backpack_contents = list(
		/obj/item/book/granter/trait/chemistry = 1,
		/obj/item/storage/bag/money/small/few = 1)

/datum/outfit/loadout/mercenary
	name = "mercenary"
	suit = /obj/item/clothing/suit/armor/f13/metalarmor
	head = /obj/item/clothing/head/helmet/blueshirt
	backpack_contents = list(
		/obj/item/gun/ballistic/shotgun/hunting = 1,
		/obj/item/ammo_box/shotgun/buck = 2)


//------- EXTRA -------//


/obj/item/storage/backpack/duffelbag/equipment/contraband/set1/PopulateContents()
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/patch/jet = 1
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/backpack/duffelbag/equipment/contraband/set2/PopulateContents()
	var/static/items_inside = list(
		/obj/item/toy/cards/deck = 1,
		/obj/item/storage/box/dice = 1,
		/obj/item/toy/eightball = 1
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/backpack/duffelbag/equipment/contraband/set3/PopulateContents()
	var/static/items_inside = list(
		/obj/item/lighter/greyscale = 1,
		/obj/item/storage/fancy/cigarettes/cigpack_bigboss = 1
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/backpack/duffelbag/equipment/contraband/set4/PopulateContents()
	var/static/items_inside = list(
		/obj/item/gun/ballistic/revolver/hobo/knifegun = 1
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/backpack/duffelbag/equipment/contraband/set5/PopulateContents()
	var/static/items_inside = list(
		/obj/item/melee/onehanded/knife/hunting = 1
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/backpack/duffelbag/equipment/contraband/set6/PopulateContents()
	var/static/items_inside = list(
		/obj/item/gun/ballistic/automatic/hobo/zipgun = 1,
		/obj/item/ammo_box/magazine/zipgun = 2
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/backpack/duffelbag/equipment/contraband/set7/PopulateContents()
	var/static/items_inside = list(
		/obj/item/reagent_containers/hypospray/medipen/psycho = 2
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/backpack/duffelbag/equipment/contraband/set8/PopulateContents()
	var/static/items_inside = list(
		/obj/item/reagent_containers/hypospray/medipen/medx = 2
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/backpack/duffelbag/equipment/contraband/set9/PopulateContents()
	var/static/items_inside = list(
		/obj/item/toy/crayon/spraycan = 1
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/backpack/duffelbag/equipment/contraband/set10/PopulateContents()
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/patch/turbo = 2
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/backpack/duffelbag/equipment/contraband/set11/PopulateContents()
	var/static/items_inside = list(
		/obj/item/storage/pill_bottle/chem_tin/mentats = 1,
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/backpack/duffelbag/equipment/contraband/set12/PopulateContents()
	var/static/items_inside = list(
		/obj/item/storage/box/matches = 1,
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/backpack/duffelbag/equipment/contraband/set13/PopulateContents()
	var/static/items_inside = list(
		/obj/item/book/granter/trait/chemistry = 1,
		/obj/item/circuitboard/machine/chem_dispenser = 1,
		/obj/item/stock_parts/cell/high = 1,
		/obj/item/stock_parts/matter_bin = 2,
		/obj/item/stock_parts/capacitor = 1,
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stack/sheet/glass = 1,
		/obj/item/stock_parts/cell = 1,
		/obj/item/stack/sheet/metal/twenty = 1,
		/obj/item/stack/cable_coil = 1,
		/obj/item/screwdriver = 1,
		/obj/item/wrench = 1
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/backpack/duffelbag/equipment/contraband/set14/PopulateContents()
	var/static/items_inside = list(
		/obj/item/storage/bag/money/small/meager = 1
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/backpack/duffelbag/equipment/contraband/set15/PopulateContents()
	var/static/items_inside = list(
		/obj/item/storage/bag/money/small/few = 1
		)
	generate_items_inside(items_inside, src)

/obj/item/storage/backpack/duffelbag/equipment/contraband/set16/PopulateContents()
	var/static/items_inside = list(
		/obj/item/storage/bag/money/small/big = 1
		)
	generate_items_inside(items_inside, src)




