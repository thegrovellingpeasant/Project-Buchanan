/datum/job/citizens
	department_flag = CITIZENS
	exp_type = EXP_TYPE_CITIZENS
	maptype = "reno"

/datum/job/citizens/f13hotelowner
	title = "Hotel Owner"
	flag = F13HOTELOWNER
	faction = FACTION_CITIZENS
	total_positions = 1
	spawn_positions = 1
	description = "You are the owner of the only proper hotel in town. Yours is a simple, though demanding job: check the 'ins' and 'outs' of the tourists that pay for a room, charge extra for the good rooms, make sure their belongings are not stolen, give directions to the important landmarks in Reno, and keep the bums and vagrants out of the installations. the Hotel could be considered the only 'safe haven' for outsiders, with the only alternative being risking their lives by staying on the abandoned houses, so ensuring it remains safe for them should be a priority. For all of these endeavors, you will count with the hotel staff to use at your discretion. Yours is also a profitable business, so expect the other families to be aware of this and ask you for a cut."
	supervisors = "Money"
	selection_color = "#F7EFCF"
	exp_requirements = EXP_TYPE_CITIZENS

	outfit = /datum/outfit/job/citizens/f13hotelowner

	access = list(ACCESS_HOTEL)

/datum/outfit/job/citizens/f13hotelowner
	name = "Boss"
	jobtype = /datum/job/citizens/f13hotelowner

	ears = /obj/item/radio/headset
	id = /obj/item/card/id/reno/hotel/papers/owner
	glasses = /obj/item/clothing/glasses/monocle
	gloves = /obj/item/clothing/gloves/color/white
	backpack = /obj/item/storage/backpack/satchel/leather
	suit = /obj/item/clothing/suit/armor/f13/reno/bulletproof
	satchel = /obj/item/storage/backpack/satchel/leather
	r_hand = /obj/item/cane
	//l_hand =
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/onezerozero //placeholder
//	r_pocket =
	mask = /obj/item/clothing/mask/cigarette/cigar/ncr
	head = /obj/item/clothing/head/bowler
//	neck =
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/rank/civilian/victorian_redsleeves
	belt = /obj/item/gun/ballistic/revolver/caravan_shotgun
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/melee/onehanded/knife/switchblade = 1,
		/obj/item/clipboard = 1,
		/obj/item/paper = 1,
		)

/*--------------------------------------------------------------*/
/datum/job/citizens/f13hotelconcierge
	title = "Hotel Concierges"
	flag = F13HOTELCONCIERGE
	faction = FACTION_CITIZENS
	total_positions = 3
	spawn_positions = 3
	description = "You have been employed by the local Hotel to work as a member of the staff. Though you may not be making as much money as other people in town, you still have a well paid job and don't need to risk your life to make ends meet. Talk to the owner to know what he (or the costumers) need, accommodate the guests to their rooms, make sure their belongings are not stolen, help the owner to kick out bums and vagrants. Always ask for tips."
	supervisors = "Hotel Owner"
	selection_color = "#F7EFCF"
	exp_requirements = EXP_TYPE_CITIZENS

	outfit = /datum/outfit/job/citizens/f13hotelconcierge

	access = list(ACCESS_HOTEL)

	loadout_options = list(
	/datum/outfit/loadout/male_staff,
	/datum/outfit/loadout/female_staff,
	)


/datum/outfit/job/citizens/f13hotelconcierge
	name = "Hotel Concierge"
	jobtype = /datum/job/citizens/f13hotelconcierge
	id = /obj/item/card/id/reno/hotel/papers/worker
	ears = /obj/item/radio/headset
	gloves = /obj/item/clothing/gloves/color/white
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/fivezero //placeholder
//	r_pocket =
	head = /obj/item/clothing/head/helmet/f13/hotel/concierge/cap
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/f13/hotel/concierge/uniform
	backpack_contents = list(
		/obj/item/kitchen/knife/butcher = 1,
		/obj/item/clipboard = 1,
		/obj/item/paper = 1,
		)

/datum/outfit/loadout/male_staff
	name = "butler"
	suit = /obj/item/clothing/suit/armor/f13/hotel/concierge/coat
	glasses = /obj/item/clothing/glasses/concierge_m
	backpack_contents = list(
		/obj/item/mop = 1,
		/obj/item/storage/fancy/cigarettes/cigpack_cannabis=1,
		/obj/item/reagent_containers/glass/bucket =1)

/datum/outfit/loadout/female_staff
	name = "maid"
	suit = /obj/item/clothing/suit/armor/f13/hotel/concierge/vest
	glasses = /obj/item/clothing/glasses/concierge_f
	backpack_contents = list(
		/obj/item/mop = 1,
		/obj/item/storage/fancy/cigarettes/cigpack_cannabis=1,
		/obj/item/reagent_containers/glass/bucket =1)

/*--------------------------------------------------------------*/

/datum/job/citizens/f13pharmacist
	title = "Pharmacist"
	flag = F13PHARMACIST
	faction = FACTION_CITIZENS
	total_positions = 1
	spawn_positions = 1
	description = "You are the independent owner of the town's Pharmacy, tasked to provide to tourists and citizens alike with the famous 'New Reno experience'. Tough you don't have a chemistry setup to manufacture any chems and medicine you intend to sell, there's a chance that the Mordinos (or any family controlling the chem business) will be willing and able to sell you mass produced goods for a cheap price. Since there are never enough chems in Reno, yours is also a profitable business, so expect the other families to be aware of this and ask you for a cut."
	supervisors = "Money"
	selection_color = "#F7EFCF"
	exp_requirements = EXP_TYPE_CITIZENS

	outfit = /datum/outfit/job/citizens/f13pharmacist

	access = list(ACCESS_PHAR)

/datum/outfit/job/citizens/f13pharmacist
	name = "Pharmacist"
	jobtype = /datum/job/citizens/f13pharmacist

	ears = /obj/item/pen
	id = /obj/item/card/id/reno/pharmacy/owner
	glasses = /obj/item/clothing/glasses/f13/biker
	gloves = /obj/item/clothing/gloves/f13/leather
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	r_hand = /obj/item/gun/ballistic/automatic/autopipe
	//l_hand =
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/sevenzero //placeholder
	//r_pocket =
	mask = /obj/item/clothing/mask/ncr_facewrap
	//head =
//	neck =
	shoes = /obj/item/clothing/shoes/jackboots
	uniform = /obj/item/clothing/under/f13/mechanic
	belt = /obj/item/storage/belt/military/assault
	backpack_contents = list(
		/obj/item/ammo_box/magazine/autopipe = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		)

/*--------------------------------------------------------------*/

/datum/job/citizens/f13armsdealer
	title = "Arms Dealer"
	flag = F13ARMSDEALER
	faction = FACTION_CITIZENS
	total_positions = 1
	spawn_positions = 1
	description = "You are the independent owner of the town's arms store, tasked to provide to tourists and citizens alike with the means to defend themselves. Though you have a console to order most of the guns you will be selling, there's a chance that the Salvatores and the Wrights would be able to provide you a with better (and maybe even cheaper) arsenal. Since there are never enough guns in Reno, yours is also a profitable business, so expect the other families to be aware of this and ask you for a cut."
	supervisors = "Money"
	selection_color = "#F7EFCF"
	exp_requirements = EXP_TYPE_CITIZENS

	outfit = /datum/outfit/job/citizens/f13armsdealer

	access = list(ACCESS_NRA)

/datum/outfit/job/citizens/f13armsdealer
	name = "Arms Dealer"
	jobtype = /datum/job/citizens/f13armsdealer

	ears = /obj/item/pen
	id = /obj/item/card/id/reno/nra/papers/owner
	//glasses = /obj/item/clothing/glasses/monocle
	gloves = /obj/item/clothing/gloves/color/black
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	//r_hand = /obj/item/gun/ballistic/revolver/caravan_shotgun
	//l_hand =
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/sevenzero //placeholder
//	r_pocket =
	//mask = /obj/item/clothing/mask/cigarette/cigar/ncr
	//head = /obj/item/clothing/head/bowler
//	neck =
	shoes = /obj/item/clothing/shoes/jackboots
	uniform = /obj/item/clothing/under/syndicate/camo
	suit= /obj/item/clothing/suit/jacket/miljacket
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	belt = /obj/item/storage/belt/military/assault
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/paper = 1,
		)

/*--------------------------------------------------------------*/

/datum/job/citizens/f13junglegymowner
	title = "Jungle Gym Owner"
	flag = F13JUNGLEGYMOWNER
	faction = FACTION_CITIZENS
	total_positions = 1
	spawn_positions = 1
	description = "You're sort of a jack of all trades in town. On one hand, you manage the local pawn shop, taking gamblers goods for money that they will lose in the casinos, and reselling said goods for double the price you paid it in the first place. On the other hand, next to the pawn shop, you're also the owner of the Jungle Gym, both coaching athletes who wants to put the installations to use and arranging box fights in the Gym's Ring and getting the visitors to place bets on the fighters. You will probably be making a fair amount of money in the process too, so expect the other families to be aware of this and ask you for a cut."
	supervisors = "Money"
	selection_color = "#F7EFCF"
	exp_requirements = EXP_TYPE_CITIZENS

	outfit = /datum/outfit/job/citizens/f13junglegymowner

	access = list(ACCESS_GYM)

/datum/outfit/job/citizens/f13junglegymowner
	name = "Host"
	jobtype = /datum/job/citizens/f13junglegymowner

	ears = /obj/item/pen
	id = /obj/item/card/id/reno/junglegym/papers/owner
	//glasses = /obj/item/clothing/glasses/monocle
	//gloves = /obj/item/clothing/gloves/color/black
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	//r_hand = /obj/item/gun/ballistic/revolver/caravan_shotgun
	//l_hand =
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/sevenzero //placeholder
//	r_pocket =
	//mask = /obj/item/clothing/mask/cigarette/cigar/ncr
	//head = /obj/item/clothing/head/bowler
//	neck =
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/f13/bennys
	//suit= /obj/item/clothing/suit/jacket/miljacket
	//suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	belt = /obj/item/gun/ballistic/revolver/caravan_shotgun
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/melee/unarmed/brass = 1,
		/obj/item/paper = 1,
		)

/*--------------------------------------------------------------*/

/datum/job/citizens/f13renodoctor
	title = "Reno Doctor"
	flag = F13RENODOCTOR
	faction = FACTION_CITIZENS
	total_positions = 2
	spawn_positions = 2
	description = "You are a doctor for the small local clinic, the only entity providing healthcare to the people of New Reno. Since this is one of the few charities present in town, don't expect things to go smoothly. For one, you have no relation to the Followers of the Apocalypse, and although this allows you to not be bound by their rules, this also means that you are scrapping by with the few scarce resources you have at your disposition. Secondly, the families may not take kindly that you aid their hooked addicts, or heal their deceased rivals, so always be weary of what the gangs interests. Work discretely, heal your patients, aid the addicts, see if the priest may be able to lend a hand, and, if necessary, look for protection among the gangs, the Wrights probably being the most willing among them all."
	selection_color = "#F7EFCF"

	outfit = /datum/outfit/job/citizens/f13renodoctor

	access = list(ACCESS_RENO_CLINIC)

/datum/outfit/job/citizens/f13renodoctor
	name = "Doctor"
	jobtype = /datum/job/citizens/f13renodoctor

	id = /obj/item/card/id/reno/clinic/papers
	belt = /obj/item/storage/belt/medical
	shoes = /obj/item/clothing/shoes/laceup
	ears = null
	r_pocket = /obj/item/flashlight/seclite
	l_pocket = /obj/item/stack/f13Cash/ncr/fourzero
	uniform = /obj/item/clothing/under/f13/doctor
	suit = /obj/item/clothing/suit/toggle/labcoat/f13
	backpack =	/obj/item/storage/backpack/medic
	gloves =  /obj/item/clothing/gloves/color/white
	//head = /obj/item/clothing/head/beret/durathread
	mask =  /obj/item/clothing/mask/surgical
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2, \
		/obj/item/healthanalyzer=1, \
		/obj/item/storage/bag/money/small/wastelander)

/datum/outfit/job/citizens/f13renodoctor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
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

/*--------------------------------------------------------------*/

/datum/job/citizens/f13bum
	title = "Bum"
	flag = F13BUM
	faction = FACTION_CITIZENS
	total_positions = -1
	spawn_positions = -1
	description = "You are a Bum. For one reason or another you have hit rock bottom, with no money, no job, and no house. Nevertheless, this lack of prospects in your life have placed you in sort of an advantageous position: you are not bound to anything. Beg for money on the street, mug people when they refuse to spare some coins, try to find something valuable among the ruins of the town, work with other hobos to get an edge, occupy the empty residences of the town, bug some gangster to give you a job. Remember, you have nothing left to lose."
	supervisors = "anyone with a bed"
	selection_color = "#F7EFCF"
	exp_requirements = EXP_TYPE_CITIZENS

	outfit = /datum/outfit/job/citizens/f13bum

/datum/outfit/job/citizens/f13bum
	name = "Bum"
	jobtype = /datum/job/citizens/f13bum

	id = null
	ears = null
	belt = null
	backpack = null
	satchel = null
	shoes = null
	satchel = /obj/item/storage/backpack/satchel/explorer
	gloves = /obj/item/clothing/gloves/f13/handwraps
	r_pocket = /obj/item/reagent_containers/pill/patch/jet
	l_pocket = /obj/item/reagent_containers/hypospray/medipen/medx


/datum/outfit/job/citizens/f13bum/pre_equip(mob/living/carbon/human/H)
	. = ..()
	uniform = pick(
		/obj/item/clothing/under/f13/brahmin, \
		/obj/item/clothing/under/f13/rag, \
		/obj/item/clothing/under/f13/raider_leather, \
		/obj/item/clothing/under/f13/raiderrags, \
		/obj/item/clothing/under/pants/f13/ghoul, \
		/obj/item/clothing/under/jabroni)

	r_hand = pick(
		/obj/item/melee/onehanded/club, \
		/obj/item/kitchen/knife, \
		/obj/item/melee/onehanded/club/tireiron, \
		/obj/item/gun/ballistic/revolver/hobo/pepperbox, \
		/obj/item/melee/onehanded/knife/cosmicdirty, \
		/obj/item/reagent_containers/food/drinks/beer)

	var/datum/reagent/jet = new /datum/reagent/drug/jet
	H.reagents.addiction_list.Add(jet)

/*--------------------------------------------------------------*/
/datum/job/citizens/f13mercenary
	title = "Mercenary"
	flag = F13MERCENARY
	faction = FACTION_CITIZENS
	total_positions = 3
	spawn_positions = 3
	description = "You have decided to try your luck as a gun for sale on the streets of New Reno. Though maybe not as profitable as joining one of the families, you're still your own boss, and you will not lack neither work or action, since tourists and gangsters alike may require of your assistance. Offer your services on the street to let people know that you're a merc, if possible use your money to buy better guns from the arms shop, and never work for free."
	supervisors = "the highest bidder"
	selection_color = "#F7EFCF"
	exp_requirements = EXP_TYPE_CITIZENS

	outfit = /datum/outfit/job/citizens/f13mercenary


	loadout_options = list(
	/datum/outfit/loadout/iceman,
	/datum/outfit/loadout/hiredguard,
	)


/datum/outfit/job/citizens/f13mercenary
	name = "Mercenary"
	jobtype = /datum/job/citizens/f13mercenary

	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/fivezero
	id = null
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/melee/onehanded/knife/trench = 1,
		)
/datum/outfit/job/citizens/f13mercenary/pre_equip(mob/living/carbon/human/H)
	. = ..()
	uniform = pick(
		/obj/item/clothing/under/f13/merca, \
		/obj/item/clothing/under/syndicate/camo, \
		/obj/item/clothing/under/f13/mercc)

/datum/outfit/loadout/iceman
	name = "Iceman"
	suit = /obj/item/clothing/suit/armored/light/vest/kevlar
	belt = /obj/item/storage/belt/military/assault
	mask = /obj/item/clothing/mask/russian_balaclava
	backpack_contents = list(
		/obj/item/suppressor = 1,
		/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2)

/datum/outfit/loadout/hiredguard
	name = "Hired Guard"
	suit = /obj/item/clothing/suit/armor/f13/metalarmor/steelbib
	belt = /obj/item/storage/belt/military/assault
	head = /obj/item/clothing/head/helmet/armyhelmet/heavy
	mask = /obj/item/clothing/mask/russian_balaclava
	uniform = /obj/item/clothing/under/syndicate/camo
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/autopipe = 1,
		/obj/item/ammo_box/magazine/autopipe = 1)

/*--------------------------------------------------------------*/
/datum/job/citizens/f13priest
	title = "Priest"
	flag = F13PRIEST
	faction = FACTION_CITIZENS
	total_positions = 1
	spawn_positions = 1
	description = "You are the lone priest of the small local chapel, either as the leader of the local Temperance Faction, a New Canaanite Pastor, a Children of the Atom Cultist, or something entirely different. You have taken the bow to lead your flock, even here in the sinful city of New Reno, be it by feeding the poor, cooperating with the clinic, giving mass, and so on. Bug the gang members to make them reconsider their sinful ways, and also try to get the tourists and the citizens to stay away from chems and the casinos. If you push your proselytism too far, you may have to look for protection from the gangs... though consider that the Wrights will probably be the only ones willing to help."
	supervisors = "the highest bidder"
	selection_color = "#F7EFCF"
	exp_requirements = EXP_TYPE_CITIZENS

	outfit = /datum/outfit/job/citizens/f13priest


/datum/outfit/job/citizens/f13priest
	name = "Priest"
	jobtype = /datum/job/citizens/f13priest

	//ears = /obj/item/pen
	//gloves = /obj/item/clothing/gloves/color/white
	backpack = /obj/item/storage/backpack/satchel/explorer
	id = null
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/stack/f13Cash/ncr/fourzero
//	r_pocket =
	//head = /obj/item/clothing/head/helmet/f13/hotel/concierge/cap
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/f13/religion/priest
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		)

/*--------------------------------------------------------------*/

/datum/job/citizens/f13yakuza
	title = "Yakuza"
	flag = F13YAKUZA
	faction = FACTION_CITIZENS
	total_positions = 3
	spawn_positions = 3
	description = "You are part of an small band of Yakuzas settled in New Reno, advocated to perpetuate the traditions of the old Japanese Mafia with your expertise in swordplay and customary attires. Unlike the big gangs of the city, there is no concrete hierarchy among your ranks, nor is there any type of manufacturing of chems, alcohol or guns, having only the old abandoned Dojo of the town to serve you as headquarters. Work as mercenaries for the big gangs, assault lone tourists on the streets, act as vigilantes for the town; whatever you decide to do with your small band of brothers is up to you, but remember: you're no simple raiders, fight with honor."
	supervisors = "yourselves"
	selection_color = "#F7EFCF"
	exp_requirements = EXP_TYPE_CITIZENS

	outfit = /datum/outfit/job/citizens/f13yakuza

	access = list(ACCESS_YAKUZA)

/datum/outfit/job/citizens/f13yakuza
	name = "Yakuza"
	jobtype = /datum/job/citizens/f13yakuza

	ears = /obj/item/pen
	id = /obj/item/card/id/reno/yakuza/ring
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/fourzero
//	r_pocket =
	head = /obj/item/clothing/head/rice_hat
	shoes = /obj/item/clothing/shoes/f13/raidertreads
	uniform = /obj/item/clothing/under/f13/raider_leather
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/throwing = 3,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		)

/*--------------------------------------------------------------*/

/datum/job/citizens/f13peasant
	title = "Peasant"
	flag = F13PEASANT
	faction = FACTION_CITIZENS
	total_positions = 2
	spawn_positions = 2
	description = "You are part of a group of farmers who have settled outside the relatively safe walls of Reno. You make your living off of raising cattle and growing crops, selling the fruits of your labor to the various businesses within the city. Though you'll most likely prove to be of vital use for the businesses of New Reno, you may be forced to seek protection from those who would wish to destroy what is yours."
	supervisors = "yourselves"
	selection_color = "#F7EFCF"
	exp_requirements = EXP_TYPE_CITIZENS

	outfit = /datum/outfit/job/citizens/f13peasant

/datum/outfit/job/citizens/f13peasant
	name = "Farmer"
	jobtype = /datum/job/citizens/f13peasant

	//ears = /obj/item/pen
	gloves = /obj/item/clothing/gloves/color/brown
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	r_hand = /obj/item/gun/ballistic/rifle/hunting
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/fourzero
//	r_pocket =
	head = /obj/item/clothing/head/scarecrow_hat
	mask = /obj/item/clothing/mask/facewrap
	shoes = /obj/item/clothing/shoes/f13/rag
	uniform = /obj/item/clothing/under/f13/settler
	id = null
//	belt = obj/item/katana
	backpack_contents = list(
		/obj/item/ammo_box/a308 = 2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/reagent_containers/glass/beaker/waterbottle = 3,
		/obj/item/reagent_containers/glass/bucket/wood = 1,
		/obj/item/shovel/spade = 1,
		/obj/item/cultivator/rake = 1,
		)

/*--------------------------------------------------------------*/
/datum/job/citizens/f13renoraider
	title = "Raider"
	flag = F13RENORAIDER
	faction = FACTION_CITIZENS
	total_positions = -1
	spawn_positions = -1
	description = "You are a member of one of the infamous raider gangs of the wastes. Pillaging, robbing, murdering wasters are a recurrent chore for your people. Depending on their affiliation, though, raiders may vary from an illiterate chemhead, to a straight edge tribal, or even a member of a group with strong connections and an unique culture based on raiding, and all of this should be considered when defining your character. Form loose associations with other raiders to get an edge. Betray said raiders because of a dumb argument. Be wary of the inside of the city or destroying family businesses, since the gangs may not take kindly to your presence in town."
	supervisors = "the man with the biggest stick"
	selection_color = "#F7EFCF"
	exp_requirements = EXP_TYPE_CITIZENS

	outfit = /datum/outfit/job/citizens/f13renoraider

	loadout_options = list(
	/datum/outfit/loadout/raider_fugitive,
	/datum/outfit/loadout/raider_bandido,
	/datum/outfit/loadout/raider_ncradeserter,
	/datum/outfit/loadout/raider_denslaver,
	/datum/outfit/loadout/raider_whiteleg,
	/datum/outfit/loadout/raider_khans,
	/datum/outfit/loadout/raider_vipers,
	/datum/outfit/loadout/raider_jackals,
	/datum/outfit/loadout/raider_80s,
	/datum/outfit/loadout/raider_manhunter,
	/datum/outfit/loadout/raider_psychotic,
	/datum/outfit/loadout/raider_eyebot
	)

/datum/outfit/job/citizens/f13renoraider
	name = "Reno Raider"
	jobtype = /datum/job/citizens/f13renoraider
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	ears = null
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/onezero //placeholder
	id = null
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/melee/onehanded/knife/trench = 1,
		/obj/item/restraints/handcuffs = 2,
		)
/datum/outfit/job/citizens/f13renoraider/pre_equip(mob/living/carbon/human/H)
	. = ..()
	uniform = pick(
		/obj/item/clothing/under/f13/merca, \
		/obj/item/clothing/under/syndicate/camo, \
		/obj/item/clothing/under/f13/mercc, \
		/obj/item/clothing/under/f13/raider_leather, \
		/obj/item/clothing/under/f13/raiderrags, \
		/obj/item/clothing/under/pants/f13/ghoul, \
		/obj/item/clothing/under/jabroni)

/datum/outfit/loadout/raider_fugitive
	name = "Fugitive"
	suit = /obj/item/clothing/suit/armor/f13/ncrcfjacket
	uniform = /obj/item/clothing/under/f13/ncrcf
	mask = /obj/item/clothing/mask/russian_balaclava
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/caravan_shotgun = 1,
		/obj/item/ammo_box/shotgun/improvised = 2,
		/obj/item/melee/classic_baton = 1)

/datum/outfit/loadout/raider_bandido
	name = "Bandido"
	belt = /obj/item/gun/ballistic/revolver/colt357
	neck = /obj/item/storage/belt/holster
	mask = /obj/item/clothing/mask/ncr_facewrap
	uniform = /obj/item/clothing/under/f13/jamrock
	head = /obj/item/clothing/head/helmet/f13/vaquerohat
	glasses = /obj/item/clothing/glasses/f13/biker
	shoes = /obj/item/clothing/shoes/workboots/mining
	backpack_contents = list(
		/obj/item/ammo_box/a357 = 2,
		/obj/item/kitchen/knife = 1)

/datum/outfit/loadout/raider_ncradeserter
	name = "NCRA Deserter"
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor
	suit_store = /obj/item/gun/ballistic/rifle/hunting
	belt = /obj/item/storage/belt/military/assault/ncr
	mask = /obj/item/clothing/mask/ncr_facewrap
	uniform = /obj/item/clothing/under/f13/ncr
	head = /obj/item/clothing/head/f13/ncr/goggles
	shoes = /obj/item/clothing/shoes/f13/military/ncr
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/ammo_box/a308 = 2)

/datum/outfit/loadout/raider_denslaver
	name = "Den Slaver"
	suit = /obj/item/clothing/suit/armored/light/leather_jacketmk2
	suit_store = /obj/item/gun/ballistic/automatic/autopipe
	mask = /obj/item/clothing/mask/bandana/durathread
	uniform = /obj/item/clothing/under/f13/navy
	head = /obj/item/clothing/head/helmet/riot
	glasses = /obj/item/clothing/glasses/f13/biker
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/melee/classic_baton = 1,
		/obj/item/restraints/legcuffs/bola/tactical = 3,
		/obj/item/ammo_box/magazine/autopipe = 1)

/datum/outfit/loadout/raider_whiteleg
	name = "White Leg"
	suit = /obj/item/clothing/suit/armor/f13/raider/badlands
	suit_store = /obj/item/melee/onehanded/club/warclub
	belt = /obj/item/storage/backpack/spearquiver
	uniform = /obj/item/clothing/under/f13/whitelegs
	backpack_contents = list(
		/obj/item/clothing/under/f13/female/whitelegs = 1,
		/obj/item/book/granter/trait/trekking = 1,
		/obj/item/book/granter/trait/iron_fist = 1,
		/obj/item/warpaint_bowl = 1,
		/obj/item/book/granter/crafting_recipe/tribal/whitelegs = 1)

/datum/outfit/loadout/raider_khans
	name = "Khan"
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/khan_jacket
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	uniform = /obj/item/clothing/under/f13/khan
	gloves = /obj/item/melee/unarmed/brass/spiked
	head = /obj/item/clothing/head/helmet/f13/khan/pelt
	shoes = /obj/item/clothing/shoes/f13/military/khan_pelt
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/improvised = 2)

/datum/outfit/loadout/raider_vipers
	name = "Viper"
	suit = /obj/item/clothing/suit/armored/light/duster/vet
	suit_store = /obj/item/gun/ballistic/automatic/pistol/n99
	uniform = /obj/item/clothing/under/jabroni
	glasses = /obj/item/clothing/glasses/f13/biker
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/toy/plush/snakeplushie = 1,
		/obj/item/viper_venom = 2,
		/obj/item/ammo_box/magazine/m10mm_adv = 2)

/datum/outfit/loadout/raider_jackals
	name = "Jackal"
	uniform = /obj/item/clothing/under/f13/raider_leather
	shoes = /obj/item/clothing/shoes/f13/raidertreads
	backpack_contents = list(
		/obj/item/twohanded/fireaxe/bmprsword = 1,
		/obj/item/reagent_containers/hypospray/medipen/medx = 1,
		/obj/item/reagent_containers/food/snacks/meat/cutlet/plain/human = 2,
		/obj/item/kitchen/knife/butcher = 1)

/datum/outfit/loadout/raider_80s
	name = "80s"
	suit = /obj/item/clothing/suit/armor/f13/raiders/roadwarriors
	belt = /obj/item/storage/backpack/spearquiver
	uniform = /obj/item/clothing/under/pants/f13/warboy
	head = /obj/item/clothing/head/helmet/f13/raider/arclight
	glasses = /obj/item/clothing/glasses/f13/biker
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/scrapsabre = 1)

/datum/outfit/loadout/raider_manhunter
	name = "Manhunter"
	suit = /obj/item/clothing/suit/armored/light/tribalraider
	belt = /obj/item/storage/backpack/spearquiver
	uniform = /obj/item/clothing/under/f13/exile/tribal
	head = /obj/item/clothing/head/helmet/f13/deathskull
	backpack_contents = list(
		/obj/item/restraints/legcuffs/beartrap = 5,
		/obj/item/nullrod/tribal_knife = 1)

/datum/outfit/loadout/raider_psychotic
	name = "Painspike"
	suit = /obj/item/clothing/suit/armor/f13/raider/painspike
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	head = /obj/item/clothing/head/helmet/f13/raider/psychotic
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/improvised = 1,
		/obj/item/melee/onehanded/club/fryingpan = 1)

/datum/outfit/loadout/raider_eyebot
	name = "Eyebot"
	suit = /obj/item/clothing/suit/armor/f13/raider/badlands
	head = /obj/item/clothing/head/helmet/f13/raider/eyebot
	backpack_contents = list(
		/obj/item/pizzabox/bomb = 1,
		/obj/item/restraints/legcuffs/beartrap = 3)

/*--------------------------------------------------------------*/

/datum/job/citizens/f13tourist
	title = "Tourist"
	flag = F13TOURIST
	faction = FACTION_CITIZENS
	total_positions = -1
	spawn_positions = -1
	description = "You have found you way to New Reno, The Biggest Little City in the World. Though the city itself is usually in a perpetual state of tension between the clashes among the families, the poor state of the charities, or the rampant hobo criminality, you don't need to think too much about it. You've come here to visit the landmarks, stay at the hotel, play some cards in the casinos, or enjoy the so called 'New Reno experience', and you have enough caps to make that happen."
	supervisors = "hedonism"
	selection_color = "#F7EFCF"
	exp_requirements = EXP_TYPE_CITIZENS

	outfit = /datum/outfit/job/citizens/f13tourist

	loadout_options = list(
	/datum/outfit/loadout/tourist,
	/datum/outfit/loadout/ncroffduty,
	/datum/outfit/loadout/vaultcityscientist,
	/datum/outfit/loadout/vaultcitytourist,
	/datum/outfit/loadout/vaultcitydiplomat,
	/datum/outfit/loadout/vaquero,
	/datum/outfit/loadout/reporter,
	/datum/outfit/loadout/detective,
	/datum/outfit/loadout/ncrpolice,
	/datum/outfit/loadout/gambler,
	)

/datum/outfit/job/citizens/f13tourist/pre_equip(mob/living/carbon/human/H)
	. = ..()
	uniform = pick(
		/obj/item/clothing/under/f13/hawaiian/red, \
		/obj/item/clothing/under/f13/hawaiian/blue, \
		/obj/item/clothing/under/f13/hawaiian/orange, \
		/obj/item/clothing/under/f13/hawaiian/pink)

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
		/obj/item/melee/onehanded/club = 1,
		/obj/item/storage/bag/money/small/reno/cap/onezerozero = 2)

/datum/outfit/loadout/ncroffduty
	name = "NCRA Off-Duty"
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/ncr_dressjack
	suit_store = /obj/item/gun/ballistic/rifle/hunting
	belt = /obj/item/storage/belt/military/assault/ncr
	mask = /obj/item/clothing/mask/ncr_facewrap
	uniform = /obj/item/clothing/under/f13/ncr
	head = /obj/item/clothing/head/beret/ncr_dresscap
	shoes = /obj/item/clothing/shoes/f13/military/ncr
	backpack_contents = list(
		/obj/item/clothing/under/f13/ncr/ncr_officer = 1,
		/obj/item/clothing/under/f13/ncr/ncr_shorts = 1,
		/obj/item/clothing/shoes/f13/military/ncr_officer_boots = 1,
		/obj/item/card/id/dogtag/town/ncr = 1,
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/clothing/under/f13/ncr/ncr_shorts = 1,
		/obj/item/ammo_box/a308 = 2,
		/obj/item/storage/bag/money/small/reno/cap/threezero = 2)

/datum/outfit/loadout/vaultcityscientist
	name = "Vault City Scientist"
	belt = /obj/item/storage/belt/medical
	uniform = /obj/item/clothing/under/f13/vault/vcity
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/toggle/labcoat/f13
	glasses = /obj/item/clothing/glasses/hud/health/f13
	backpack_contents = list(
		/obj/item/book/granter/trait/chemistry = 1,
		/obj/item/book/granter/trait/midsurgery = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/pda = 1,
		/obj/item/card/id/selfassign = 1,
		/obj/item/storage/backpack/duffelbag/med/surgery = 1,
		/obj/item/storage/bag/money/small/reno/cap/fivezero = 1)

/datum/outfit/loadout/vaultcitytourist
	name = "Vault City Tourist"
	uniform = /obj/item/clothing/under/f13/vault/vcity
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/melee/classic_baton/telescopic = 1,
		/obj/item/card/id/selfassign = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/reno/cap/onezerozero = 2)

/datum/outfit/loadout/vaultcitydiplomat
	name = "Vault City Diplomat"
	uniform = /obj/item/clothing/under/f13/vault/vcity
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/card/id/selfassign = 1,
		/obj/item/gun/ballistic/automatic/hobo/zipgun = 1,
		/obj/item/pda = 1,
		/obj/item/pen = 1,
		/obj/item/storage/secure/briefcase = 1,
		/obj/item/storage/bag/money/small/reno/cap/fivezero = 1)

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
		/obj/item/storage/bag/money/small/reno/cap/sevenzero = 1)

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
		/obj/item/storage/bag/money/small/reno/cap/sevenzero = 1)

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
		/obj/item/storage/bag/money/small/reno/cap/threezero =1)

/datum/outfit/loadout/ncrpolice
	name = "NCR Police"
	suit = /obj/item/clothing/suit/armor/f13/civilians/ncr_police_coat
	uniform = /obj/item/clothing/under/f13/ncr/police
	head = /obj/item/clothing/head/helmet/f13/civilians/ncr_police_helmet
	shoes =  /obj/item/clothing/shoes/jackboots
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/storage/backpack/satchel/explorer
	suit_store = /obj/item/gun/ballistic/revolver/police
	backpack_contents = list(
		/obj/item/pda = 1,
		/obj/item/card/id/selfassign = 1,
		/obj/item/card/id/dogtag/town/ncr = 1,
		/obj/item/ammo_box/a357 = 1,
		/obj/item/storage/bag/money/small/reno/cap/threezero = 1)

/datum/outfit/loadout/gambler
	name = "Gambler"
	uniform = /obj/item/clothing/under/suit/checkered
	head = /obj/item/clothing/head/fedora
	shoes =  /obj/item/clothing/shoes/laceup
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/storage/backpack/satchel/leather/withwallet
	backpack_contents = list(
		/obj/item/card/id/dogtag/town/ncr = 1,
		/obj/item/ammo_box/a357 = 1,
		/obj/item/storage/bag/money/small/reno/cap/onefivezero = 2)

/*--------------------------------------------------------------*/

/datum/job/citizens/f13brahminbaron
	title = "Brahmin Baron"
	flag = F13BRAHMINBARON
	faction = FACTION_CITIZENS
	total_positions = 1
	spawn_positions = 1
	description = "You have found you way to New Reno, The Biggest Little City in the World. Unlike the common tourists, you are a well known landowner with a significant political influence inside the New California Republic and more than enough money to spend. You may have just come to visit the city, stay in the hotel, and gamble in the casinos... or maybe you actually intend to invest your money in some of the families businesses to leave New Reno with more money than you had when you arrived. Whatever it is the case, yours is a prominent arrival in the city, and people will notice. Hire a mercenary to escort you if possible, and if you plan to invest, try to arrange a meeting with the big shots of the families and be ready to concern yourself with the political intricacies of New Reno."
	supervisors = "money"
	selection_color = "#F7EFCF"
	exp_requirements = EXP_TYPE_CITIZENS

	outfit = /datum/outfit/job/citizens/f13brahminbaron

/datum/outfit/job/citizens/f13brahminbaron
	name = "Brahmin Baron"
	jobtype = /datum/job/citizens/f13brahminbaron

	ears = /obj/item/pen
	backpack = /obj/item/storage/backpack/satchel/leather/withwallet
	satchel = /obj/item/storage/backpack/satchel/leather/withwallet
	l_pocket = /obj/item/storage/bag/money/small/reno/cap/sixzerozero
	r_pocket = /obj/item/gun/ballistic/revolver/m29/snub
	head = /obj/item/clothing/head/helmet/f13/marlowhat
	id = null
	shoes = /obj/item/clothing/shoes/f13/brownie
	uniform = /obj/item/clothing/under/f13/brahminbaron/foreign_suit
	suit = /obj/item/clothing/suit/armor/f13/civilians/schlimmcoat
	backpack_contents = list(
		/obj/item/clothing/head/helmet/f13/foreign_hat = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/storage/bag/money/small/reno/cap/onefivezero = 1)

/*--------------------------------------------------------------*/

/datum/job/citizens/f13ambassador
	title = "NCR Ambassador"
	flag = F13AMBASSADOR
	faction = FACTION_CITIZENS
	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCRREP)
	total_positions = 1
	spawn_positions = 1
	description = "You are an influential representative for the NCR and experienced bureaucrat. You are here to further the objective and ensure the interests of the NCR. Attempt to establish relations with the gangs of Reno, and keep close ties with the Bishops, your only real 'allies' in the city. Manage recruitment and make deals with the gangs. YOU represent the NCR in New Reno."
	supervisors = "the Republic"
	selection_color = "#c7b775"
	outfit = /datum/outfit/job/citizens/f13ambassador

/datum/outfit/job/citizens/f13ambassador
	name = "NCR Ambassador"
	uniform = /obj/item/clothing/under/suit/burgundy
	shoes = /obj/item/clothing/shoes/laceup
	jobtype	= /datum/job/ncr/f13representative
	id = /obj/item/card/id/dogtag/ncrrep
	ears = /obj/item/radio/headset/headset_ncr
	neck = /obj/item/storage/belt/holster/legholster
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/m29 = 1,
		/obj/item/ammo_box/m44 = 1,
		/obj/item/storage/bag/money/small/reno/cap/onefivezero = 1
		)
/*--------------------------------------------------------------*/

/datum/job/citizens/f13provostmarshal
	title = "NCRA Provost Marshal"
	flag = F13HEADMP
	faction = FACTION_CITIZENS
	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_CHANGE_IDS, ACCESS_NCRREP, ACCESS_NCR_COMMAND)
	total_positions = 1
	spawn_positions = 1
	description = "You are the Provost Marshal, you are in charge of the embassy's and ambassador's security. You'll need to manage your MPs, attempt to prevent gang wars, and ensure the safety and security of NCR citizens. If able, you may want to provide humanitarian support to NCR citizens."
	supervisors = "NCR Ambassador"
	selection_color = "#c7b775"
	outfit = /datum/outfit/job/citizens/f13provostmarshal

/datum/outfit/job/citizens/f13provostmarshal
	name = "NCR Provost Marshal"
	jobtype	= /datum/job/citizens/f13provostmarshal
	id = /obj/item/card/id/dogtag/ncrlieutenant
	neck = /obj/item/storage/belt/holster/legholster
	accessory = /obj/item/clothing/accessory/ncr/LT2
	glasses	= /obj/item/clothing/glasses/sunglasses/big
	head = /obj/item/clothing/head/beret/ncr/reno
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	belt = /obj/item/storage/belt/military/assault/ncr
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/dresscoat/reno
	uniform	= /obj/item/clothing/under/f13/ncr/ncr_officer
	gloves = /obj/item/clothing/gloves/f13/leather
	shoes = /obj/item/clothing/shoes/f13/military/ncr_officer_boots
	ears = /obj/item/radio/headset/headset_ncr
	backpack = /obj/item/storage/backpack/satchel/trekker
	suit_store = null
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/m29 = 1,
		/obj/item/ammo_box/m44 = 1,
		/obj/item/storage/bag/money/small/reno/cap/onezerozero = 1,
		/obj/item/melee/classic_baton/militarypolice = 1,
		/obj/item/clothing/head/f13/ncr/steelpot_mp
		)

/datum/outfit/job/citizens/f13provostmarshal/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/*--------------------------------------------------------------*/

/datum/job/citizens/f13militarypolice
	title = "NCRA Military Police"
	flag = F13MILITARYPOLICE
	faction = FACTION_CITIZENS
	total_positions = 3
	spawn_positions = 3
	description = "You are an MP of the Reno Embassy, either a wonderful or horrible assignment based on your disposition. You are to protect the embassy, ensure the security of the NCR citizens, and protect the ambassador at all costs. Preform humanitarian efforts and prevent any fights from happening between the gangs to prevent things from getting too heated."
	supervisors = "Provost Marshall"
	selection_color = "#c7b775"
	outfit = /datum/outfit/job/citizens/f13militarypolice
	access = list(ACCESS_NCR)

/datum/outfit/job/citizens/f13militarypolice
	name = "NCRA Military Police"
	jobtype	= /datum/job/citizens/f13militarypolice
	id = /obj/item/card/id/dogtag/ncrsergeant
	ears = /obj/item/radio/headset/headset_ncr
	neck = null
	accessory = /obj/item/clothing/accessory/armband/black
	glasses	= /obj/item/clothing/glasses/sunglasses/big
	head = /obj/item/clothing/head/f13/ncr/steelpot_mp
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/reno
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	backpack = /obj/item/storage/backpack/satchel/trekker
	suit_store = /obj/item/gun/ballistic/revolver/police
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	uniform	= /obj/item/clothing/under/f13/ncr
	belt = /obj/item/storage/belt/military/assault/ncr
	shoes = /obj/item/clothing/shoes/f13/military/ncr
	backpack_contents = list(
		/obj/item/ammo_box/a357 = 1,
		/obj/item/storage/bag/money/small/reno/cap/threezero =1,
		/obj/item/melee/classic_baton/militarypolice = 1,
		/obj/item/storage/survivalkit_aid = 1
		)

/datum/outfit/job/citizens/f13militarypolice/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/*--------------------------------------------------------------*/
//////////////////////TEMPORARY HOLDING//////////////////////////
/*--------------------------------------------------------------*/

/*
/datum/job/reno/rpdpolicechief
	title = "RPD Chief"
	flag = F13RPDPOLICECHIEF
	total_positions = 1
	spawn_positions = 1
	description = "Reno is a borderline lawless city, 'human sewage', as it's often said, washes into Reno on a near daily basis; it's not rare to see the results of dealings gone wrong, chem fueled violent bums, and the escalated situations with the gangs. And you're the one who's supposed to deal with this, the Chief of the Reno Police Department. Corruption isn't out of the window, especially considering it was the Bishops who funded the department. Your duties are to organize your men to keep the peace, prevent gang wars from breaking out, and enforcing NCR common law."
	supervisors = "NCR common law and the mayor"
	display_order = JOB_DISPLAY_ORDER_F13RPDPOLICECHIEF
	selection_color = "#ffdddd"
	outfit = /datum/outfit/job/reno/rpdpolicechief


/datum/outfit/job/reno/rpdpolicechief/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)

/datum/outfit/job/reno/rpdpolicechief
	name = "Police Chief"
	jobtype = /datum/job/reno/rpdpolicechief
	id = /obj/item/card/id/dogtag/sheriff
	uniform	= /obj/item/clothing/under/f13/ncr/police
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/helmet/f13/civilians/ncr_police_chief
	glasses = /obj/item/clothing/glasses/sunglasses/big
	neck = /obj/item/storage/belt/holster/legholster
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/f13/civilians/ncr_police_coat
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/neostead
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/rubber = 2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/melee/classic_baton/police = 1,
		/obj/item/reagent_containers/spray/pepper = 1,
		/obj/item/gun/energy/laser/complianceregulator = 1,
		)

/datum/job/reno/rpdofficer
	title = "RPD Officer"
	flag = F13RPDOFFICER
	total_positions = 1
	spawn_positions = 1
	description = "You are an officer of the Reno Police Department. Uphold NCR common law, follow the orders of the Chief of Police, and keep the situation in the streets from getting too bloody."
	supervisors = "NCR common law and the mayor"
	display_order = JOB_DISPLAY_ORDER_F13RPDPOLICECHIEF
	selection_color = "#ffdddd"
	outfit = /datum/outfit/job/reno/policechief


/datum/outfit/job/reno/rpdofficer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/datum/outfit/job/reno/rpdofficer
	name = "Police Chief"
	jobtype = /datum/job/reno/rpdofficer
	id = /obj/item/card/id/dogtag/deputy
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
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/melee/classic_baton/police = 1,
		/obj/item/reagent_containers/spray/pepper = 1,
		/obj/item/gun/energy/laser/complianceregulator = 1,
		)
*/