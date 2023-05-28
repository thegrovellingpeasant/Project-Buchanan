/*
Legion Design notes:
"Standard issue", AVOID identical kits and guns. Legion got spotty logistics and the hodgepodge aesthetic suits them, don't ruin it.
Sunglasses	For vets mainly, most lower ranks should have sandstorm goggles.
Money		Cent & Treasurer - "small" money bag (the biggest)
			Decanus - Officer money bag
			Rest - Enlisted money bag
Sidearm		None.
Melee		Officers only - Spatha
			Vets/Officers - Gladius
			Rest - Lawnmower machete the most common
Weapons		Lever shotgun, Grease gun, Repeater carbines, Revolvers, simple guns all good, very restrictive on long barrel automatics, generally limited ammo, always good melee option.
			Avoid Police shotguns, 5,56 semis, Desert Eagle, Survival knives etc, be creative and work within the limitations to avoid powercreep and things getting bland and same.
*/

/datum/job/CaesarsLegion
	department_flag = LEGION
	selection_color = "#ffeeee"
	faction = FACTION_LEGION

	forbids = "The Legion forbids: Using drugs such as stimpacks and alcohol. Ghouls joining. Women fighting (self defense and suicide allowed). Slaves carrying weapons. Using robots and advanced machines. Killing Legion members in secret, only if according to law and in public is it acceptable."
	enforces = "The Legion demands: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a NON-COMBAT infiltrator. Expect death as punishment for failing to obey."
	objectivesList = list("Focus on the tribals, win them over or intimidate them.", "Focus on Oasis, display dominance.", "Send out patrols and establish checkpoints to curb use of digusting drugs and degenerate behaviour.", "Flagstaff requests more worker: acquire slaves, train them if possible, send them east for breaking if not.", "Make sure no other faction gains dominance over Oasis, if they remain neutral it can be used to the Legions advantage.")
	exp_type = EXP_TYPE_FALLOUT

	access = list(ACCESS_LEGION)
	minimal_access = list(ACCESS_LEGION)

/datum/outfit/job/CaesarsLegion
	ears = null
	box = null

/datum/outfit/job/CaesarsLegion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legiongate)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/berserker_powder)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/rip/crossexecution)

/datum/outfit/job/CaesarsLegion/Legionnaire
	belt = /obj/item/storage/belt/military/assault/legion
	ears = /obj/item/radio/headset/headset_legion
	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	uniform = /obj/item/clothing/under/f13/legskirt
	shoes = /obj/item/clothing/shoes/f13/military/legion
	gloves = /obj/item/clothing/gloves/legion
	box = /obj/item/storage/survivalkit_tribal

/datum/outfit/job/CaesarsLegion/Legionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		H.gender = MALE
		H.real_name = random_unique_name(MALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()

/datum/outfit/job/CaesarsLegion/Legionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_FEARLESS, src) //no phobias for legion!
	ADD_TRAIT(H, TRAIT_BERSERKER, src)

/obj/item/storage/box/legate
	name = "legate belongings"
	icon_state = "secbox"
	illustration = "flashbang"

/obj/item/storage/box/legate/PopulateContents()
	. = ..()
	new /obj/item/reagent_containers/pill/patch/healpoultice(src)
	new /obj/item/reagent_containers/pill/patch/healpoultice(src)
	new /obj/item/ammo_box/magazine/m14mm(src)
	new /obj/item/ammo_box/magazine/m14mm(src)
	new /obj/item/ammo_box/magazine/m14mm(src)


///////////////////
/// Admin Roles ///
///////////////////

// LEGATE

/datum/job/CaesarsLegion/Legionnaire/f13legate
	title = "Legion Legate"
	flag = F13LEGATE
	head_announce = list("Security")
	supervisors = "Caesar"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	total_positions = 0
	spawn_positions = 0
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legate
	access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS)
	minimal_access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legate/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legate	// 14mm Pistol, Goliath
	name = "Legate"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13legate
	shoes =	/obj/item/clothing/shoes/f13/military/legate
	suit = /obj/item/clothing/suit/armor/f13/legion/legate
	head = /obj/item/clothing/head/helmet/f13/legion/legate
	gloves = /obj/item/clothing/gloves/legion/legate
	glasses = /obj/item/clothing/glasses/sunglasses/big
	suit_store = /obj/item/gun/ballistic/automatic/pistol/pistol14
	r_pocket = /obj/item/storage/bag/money/small/legion
	l_pocket = /obj/item/flashlight/lantern
	r_hand = /obj/item/melee/powerfist/f13/goliath
	l_hand = /obj/item/tank/internals/oxygen
	backpack = null
	satchel = null
	ears = /obj/item/radio/headset/headset_legion/cent
	box = /obj/item/storage/box/legate


// ORATOR

/datum/job/CaesarsLegion/Legionnaire/f13orator
	title = "Legion Orator"
	flag = F13ORATOR
	supervisors = "Centurion"
	selection_color = "#ffdddd"
	total_positions = 1
	spawn_positions = 1
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13orator
	display_order = JOB_DISPLAY_ORDER_ORATOR
	access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND)
	minimal_access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND)
	exp_type = EXP_TYPE_LEGION
	exp_requirements = 1500
	mapexclude = list("standard")

/datum/outfit/job/CaesarsLegion/Legionnaire/f13orator	// .357 Revolver, Spatha
	name = "Orator"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13orator
	neck = /obj/item/storage/belt/holster
	shoes = /obj/item/clothing/shoes/f13/military/plated
	suit = /obj/item/clothing/suit/armor/f13/legion/orator
	head = /obj/item/clothing/head/helmet/f13/legion/orator
	id = /obj/item/card/id/dogtag/legorator
	gloves = null
	backpack = /obj/item/storage/backpack/legionr
	shoes = /obj/item/clothing/shoes/roman
	suit_store = /obj/item/gun/ballistic/revolver/colt357
	r_pocket = /obj/item/storage/bag/money/small/legofficers
	l_pocket = /obj/item/flashlight/lantern
	l_hand = /obj/item/melee/onehanded/machete/spatha
	backpack_contents = list(
		/obj/item/binoculars = 1,
		/obj/item/ammo_box/a357 = 2,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2,
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13orator/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)

/////////////////
//// Officers ///
/////////////////

// CENTURION

/datum/job/CaesarsLegion/Legionnaire/f13centurion
	title = "Legion Centurion"
	flag = F13CENTURION
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the camp commander and strongest soldier. Use your officers, the Decani, to delegate tasks, make sure you lead and give orders. Take no disrespect, you are the dominus. If you prove a fool or weak, expect to be dispatched by a stronger subordinate."
	supervisors = "the Legate"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	display_order = JOB_DISPLAY_ORDER_CENTURION
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion
	exp_type = EXP_TYPE_LEGION
	exp_requirements = 1500
	mapexclude = list("standard")

	access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND)
	minimal_access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND)

	loadout_options = list(
		/datum/outfit/loadout/palacent,		// 10mm SMG, Goliath, CQC
		/datum/outfit/loadout/rangerhunter,	// Hunting Revolver, AMR, Spatha
		/datum/outfit/loadout/centurion,	// M1919, Hunting Revolver
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion
	name = "Legion Centurion"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13centurion
	id = /obj/item/card/id/dogtag/legcenturion
	mask = /obj/item/clothing/mask/bandana/legion/legcenturion
	ears = /obj/item/radio/headset/headset_legion/cent
	neck = /obj/item/clothing/neck/mantle/legion
	gloves = /obj/item/clothing/gloves/legion/plated
	glasses = /obj/item/clothing/glasses/night/polarizing
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/restraints/handcuffs
	l_pocket = /obj/item/flashlight/lantern
	box = /obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/storage/bag/money/small/legion = 1,
		/obj/item/warpaint_bowl = 1,
		/obj/item/ammo_box/a357 = 1,
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/binoculars = 1,
		)

/datum/outfit/loadout/palacent
	name = "Paladin-Slayer Centurion"
	suit = /obj/item/clothing/suit/armor/f13/legion/palacent
	head = /obj/item/clothing/head/helmet/f13/legion/palacent
	suit_store = /obj/item/gun/ballistic/automatic/m1919
	backpack_contents = list(
		/obj/item/ammo_box/magazine/mm762 = 1,
		/obj/item/book/granter/martial/cqc = 1,
		)

/datum/outfit/loadout/rangerhunter
	name = "Ranger-Hunter Centurion"
	suit = /obj/item/clothing/suit/armor/f13/legion/rangercent
	head = /obj/item/clothing/head/helmet/f13/legion/rangercent
	suit_store = /obj/item/gun/ballistic/rifle/mag/antimateriel
	backpack_contents = list(
		/obj/item/ammo_box/magazine/amr = 2,
		/obj/item/ammo_box/c4570 = 3,
		/obj/item/gun/ballistic/revolver/hunting = 1,
		/obj/item/melee/onehanded/machete/spatha = 1,
		)

/datum/outfit/loadout/centurion
	name = "Warlord Centurion"
	suit = /obj/item/clothing/suit/armor/f13/legion/centurion
	head = /obj/item/clothing/head/helmet/f13/legion/centurion
	suit_store = /obj/item/gun/ballistic/automatic/pistol/pistol14
	backpack_contents = list(
		/obj/item/melee/powerfist/f13/goliath = 1,
		/obj/item/ammo_box/magazine/m14mm = 3,
		)

/* /datum/outfit/loadout/berserkercenturion
	name = 			"Praetorian Candidate"
	suit = 			/obj/item/clothing/suit/armor/f13/legion/centurion
	head = 			/obj/item/clothing/head/helmet/f13/legion/centurion
	backpack_contents = list(
					/obj/item/melee/unarmed/sappers = 1,
					/obj/item/book/granter/martial/berserker = 1,
					/obj/item/reagent_containers/pill/patch/healingpowder/berserker = 2
					)
commented out pending rework*/


// VETERAN DECANUS

/datum/job/CaesarsLegion/Legionnaire/f13decanvet
	title = "Veteran Decanus"
	flag = F13DECANVET
	total_positions = 1
	spawn_positions = 1
	description = "You are the leader of an expedition to the I-80 in Utah, the northern artery of the NCR. The White Legs performed adequately against the meek townspeople of New Canaan, but they require more training and wise leadership to pose a threat to the NCR. This task has been entrusted to you, do not invoke the wrath of Caesar. IN HOC SIGNO TAVRVS VINCES."
	supervisors = "Mars"
	display_order = JOB_DISPLAY_ORDER_DECANVET
	selection_color = "#ffdddd"
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet
	exp_type = EXP_TYPE_LEGION
	exp_requirements = 900

	access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND)
	minimal_access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND)

	loadout_options = list(
		/datum/outfit/loadout/decvetbull,	// Supersledge, 10mm SMG, Smokebomb
		/datum/outfit/loadout/decvetwolf,	// Thermic lance, Carl Gustaf, Extra Bitter
		/datum/outfit/loadout/decvetsnake, // Brush gun, Ripper, Extra Bitters
		)


/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet
	name = "Veteran Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decanvet
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/heavy
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	gloves = /obj/item/clothing/gloves/legion/plated
	ears = /obj/item/radio/headset/headset_legion/cent
	glasses = /obj/item/clothing/glasses/sunglasses/big
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	box = /obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/storage/bag/money/small/legofficers = 1,
		/obj/item/binoculars = 1,
		)

/datum/outfit/loadout/decvetbull
	name = "Hastatus"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/decan
	suit_store = /obj/item/gun/ballistic/shotgun/hunting
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/ammo_box/shotgun/slug = 1,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 3,
		/obj/item/restraints/legcuffs/bola/tactical = 1,
		)
		
/datum/outfit/loadout/decvetwolf
	name = "Princeps"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/decan
	suit_store = /obj/item/gun/ballistic/automatic/pistol/pistol14
	backpack_contents = list(
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/ammo_box/magazine/m14mm = 4,
		/obj/item/restraints/legcuffs/bola/tactical = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2,
		)

/datum/outfit/loadout/decvetsnake
	name = "Triarius"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/decan
	suit_store = /obj/item/gun/ballistic/automatic/smg/smg14
	backpack_contents = list(
		/obj/item/ammo_box/magazine/smg14 = 2,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/restraints/legcuffs/bola/tactical = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 1,
		)


// PRIME DECANUS

/datum/job/CaesarsLegion/Legionnaire/f13decan
	title = "Prime Decanus"
	flag = F13DECAN
	total_positions = 0
	spawn_positions = 0
	description = "A experienced officer, often commanding the camp. Give orders, lead patrols."
	supervisors = "the Veteran Decanus"
	display_order = JOB_DISPLAY_ORDER_DECAN
	selection_color = "#ffdddd"
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decan
	access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND)
	minimal_access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND)

	loadout_options = list(	//ALL: Gladius, Smokebomb
		/datum/outfit/loadout/decprimfront,	// Lever action, .357 Revolver, Legion lance, Throwing knives
		/datum/outfit/loadout/decprimrear,	// Legion shield, Ballistic fist
		/datum/outfit/loadout/decprimboom, // Grenade rifle, .44 Revolver, Frag grenades, Coffepot bomb
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decan/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decan
	name = "Prime Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decan
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/prime/decan
	head = /obj/item/clothing/head/helmet/f13/legion/prime/decan
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/legiongoggles
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	l_pocket = /obj/item/restraints/handcuffs
	box = /obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/storage/bag/money/small/legofficers = 1,
		/obj/item/binoculars = 1,
		)

/datum/outfit/loadout/decprimfront
	name = "Hastatus"
	suit_store = /obj/item/gun/ballistic/automatic/pistol/n99
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 5,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/restraints/legcuffs/bola/tactical = 1,
		/obj/item/storage/backpack/spearquiver = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 3,
		)

/datum/outfit/loadout/decprimboom
	name = "Princeps"
	suit_store = /obj/item/gun/ballistic/automatic/smg/greasegun
	backpack_contents = list(
		/obj/item/ammo_box/magazine/greasegun = 2,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		)

/datum/outfit/loadout/decprimrear
	name = "Triarius"
	suit_store = /obj/item/gun/ballistic/rifle/repeater/cowboy
	backpack_contents = list(
		/obj/item/ammo_box/tube/a357 = 2,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/restraints/legcuffs/bola/tactical = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		)




// RECRUIT DECANUS

/datum/job/CaesarsLegion/Legionnaire/f13decanrec
	title = "Recruit Decanus"
	flag = F13DECANREC
	total_positions = 0
	spawn_positions = 0
	description = "The junior officer, you must train the recruits and test them, and if a suicide charge is needed, lead them to a glorious death."
	supervisors = "the Prime/Veteran Decanus"
	display_order = JOB_DISPLAY_ORDER_DECANREC
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec
	access = list(ACCESS_LEGION, ACCESS_LEGION_COMMAND)
	minimal_access = list(ACCESS_LEGION,  ACCESS_LEGION_COMMAND)

	loadout_options = list(
		/datum/outfit/loadout/recdeclegion,	// Uzi, Bumper sword, Smokebomb
		/datum/outfit/loadout/recdectribal,	// M1 Garand, Throwing spears, Reinforced machete, Bottlecap mine
		/datum/outfit/loadout/recdecredemption,	// i have a plan, john
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec
	name = "Recruit Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decanrec
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/recruit/decan
	head = /obj/item/clothing/head/helmet/f13/legion/recruit/decan
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/legiongoggles
	r_pocket = /obj/item/flashlight/lantern
	box = /obj/item/storage/survivalkit_tribal
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/storage/bag/money/small/legofficers = 1,
		)

/datum/outfit/loadout/recdeclegion
	name = "Hastatus"
	suit_store = /obj/item/gun/ballistic/automatic/smg/greasegun/worn
	backpack_contents = list(
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/ammo_box/magazine/greasegun = 2,
		)

/datum/outfit/loadout/recdectribal
	name = "Princeps"
	suit_store = /obj/item/gun/ballistic/automatic/smg/smg10mm/worn
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv/ext = 2,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/storage/backpack/spearquiver = 1,
		/obj/item/melee/onehanded/machete = 1,
		)
		
/datum/outfit/loadout/recdecredemption
	name = "Triarius"
	suit_store = /obj/item/gun/ballistic/rifle/repeater/cowboy
	backpack_contents = list(
		/obj/item/ammo_box/tube/a357 = 2,
		/obj/item/melee/onehanded/machete/forgedmachete = 1,
		/obj/item/storage/backpack/spearquiver = 1,
		)



////////////////////
///Specialist///////
////////////////////

// VEXILLARIUS

/datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	title = "Vexillarius"
	flag = F13VEXILLARIUS
	total_positions = 1
	spawn_positions = 1
	description = "You are a Veteran of proven bravery. When not fighting, relay orders from the commander and act as a bodyguard."
	supervisors = "the Veteran Decanus"
	display_order = JOB_DISPLAY_ORDER_VEXILLARIUS
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius
	access = list(ACCESS_LEGION, ACCESS_LEGION_COMMAND)
	minimal_access = list(ACCESS_LEGION,  ACCESS_LEGION_COMMAND)
	exp_type = EXP_TYPE_LEGION

	loadout_options = list(
		/datum/outfit/loadout/vexbear,	//	Classic FO13 Vex with his ripper: .223 pistol, Ripper
		/datum/outfit/loadout/vexfox,	//	Classic New Vegas Vex with his 10mm SMG: 14mm SMG, Spartha
		/datum/outfit/loadout/vexnight, //  Classic and Iconic long range vex with a trail carbine
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius
	name = "Vexillarius"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/vet/vexil
	mask = /obj/item/clothing/mask/bandana/legion/legvet
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/legion/plated
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/megaphone/cornu = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		)

/datum/outfit/loadout/vexbear
	name = "Mountain Bear"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/combvexil
	suit_store = /obj/item/gun/ballistic/automatic/smg/smg10mm/worn
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv/ext = 2,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		)

/datum/outfit/loadout/vexfox
	name = "Desert Fox"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/vexil
	suit_store = /obj/item/gun/ballistic/automatic/smg/greasegun/worn
	backpack_contents = list(
		/obj/item/ammo_box/magazine/greasegun = 2,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		)

/datum/outfit/loadout/vexnight
	name = "Night Stalker"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/nightvexil
	suit_store = /obj/item/gun/ballistic/automatic/marksman/sniper
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308 = 2,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/book/granter/trait/rifleman = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		)

//EXPLORER

/datum/job/CaesarsLegion/Legionnaire/f13explorer
	title = "Explorer"
	flag = F13EXPLORER
	total_positions = 1
	spawn_positions = 1
	description = "Scout the area, secure key points, but do not ignore orders or wordlessly die some place. A good explorer helps his unit by taking initiative and helping the commander without needing micro-managment."
	supervisors = "the Veteran Decanus must be obeyed, and as always, respect must be given to other Decanus. You are not a officer, but you are a specialist."
	display_order = JOB_DISPLAY_ORDER_EXPLORER
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer

	loadout_options = list(	// ALL: .45 Revolver, Machete
		/datum/outfit/loadout/expambusher,	// lever-action shotgun, Bottlecap mine, MP5
		/datum/outfit/loadout/expsniper,	// SKS, Smokebomb
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
			),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
			),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_SILENT_STEP, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer
	name = "Explorer"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13explorer
	id = /obj/item/card/id/dogtag/legprime
	suit = /obj/item/clothing/suit/armor/f13/legion/vet/explorer
	head = /obj/item/clothing/head/helmet/f13/legion/vet/explorer
	glasses = /obj/item/clothing/glasses/sunglasses/big
	neck = /obj/item/storage/belt/holster
	r_pocket = /obj/item/flashlight
	l_pocket = /obj/item/binoculars
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/restraints/handcuffs = 1,
		)

/datum/outfit/loadout/expambusher
	name = "Ambusher"
	back = /obj/item/storage/backpack/spearquiver
	backpack_contents = list(
		/obj/item/melee/onehanded/machete = 1,
		)

/datum/outfit/loadout/expsniper
	name = "Sniper"
	suit_store = /obj/item/gun/ballistic/rifle/hunting
	backpack_contents = list(
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/ammo_box/a308 = 5,
		/obj/item/attachments/scope = 1,
		)


/datum/job/CaesarsLegion/Legionnaire/f13frumentarius
	title = "Frumentarius"
	flag = F13FRUMENTARIUS
	total_positions = 1
	spawn_positions = 1
	description = "You are a Frumentarius, one of Vulpes Inculta's agents, handpicked by Caesar himself. You are charged with lulling the White Leg tribe into the arms of the Legion, to fulfill the bidding of Caesar. Ensure that relations remain smooth between the Legion forces and the tribals. Act as an infiltrator against the locals. Lie, manipulate, and entice the White Legs into acting as a tool. Remember, the eyes of Caesar are upon you"
	supervisors = "the Decani"
	display_order = JOB_DISPLAY_ORDER_F13FRUMENTARIUS
	selection_color = "#ffdddd"
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13frumentarius

	loadout_options = list(
		/datum/outfit/loadout/perfidy,
		/datum/outfit/loadout/mendacity,
		/datum/outfit/loadout/duplicity,
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
			),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
			),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13frumentarius/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.grant_language(/datum/language/tribal)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_SILENT_STEP, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13frumentarius
	name = "Frumentarius"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13frumentarius
	id = /obj/item/card/id/dogtag/legprime
	glasses = /obj/item/clothing/glasses/sunglasses/big
	neck = /obj/item/storage/belt/holster
	r_pocket = /obj/item/flashlight
	l_pocket = /obj/item/binoculars
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/armor/f13/reno/bulletproof
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/gun/ballistic/automatic/pistol/pistol22 = 1,
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13frumentarius/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/bennys, \
		/obj/item/clothing/under/rank/civilian/lawyer/bluesuit, \
		/obj/item/clothing/under/suit_jacket/navy, \
		/obj/item/clothing/under/suit_jacket/tan, \
		/obj/item/clothing/under/suit_jacket/charcoal, \
		/obj/item/clothing/under/suit_jacket/checkered, \
		/obj/item/clothing/under/suit_jacket/burgundy, \
		/obj/item/clothing/under/rank/civilian/lawyer/bluesuit, \
		/obj/item/clothing/under/f13/merccharm)

/datum/outfit/loadout/perfidy
	name = "Center of Attention"
	backpack_contents = list(
		/obj/item/clothing/suit/brtrenchcoat = 1,
		/obj/item/clothing/head/fedora = 1,
		/obj/item/clothing/gloves/color/black = 1,
		/obj/item/gun/ballistic/revolver/m29/snub = 1,
		/obj/item/ammo_box/m44 = 2,
		)

/datum/outfit/loadout/mendacity
	name = "Salt of the Earth"
	backpack_contents = list(
		/obj/item/clothing/under/f13/brahmin = 1,
		/obj/item/clothing/head/f13/stormchaser = 1,
		/obj/item/clothing/shoes/workboots/mining = 1,
		/obj/item/clothing/gloves/fingerless = 1,
		/obj/item/gun/ballistic/revolver/revolver44 = 1,
		/obj/item/ammo_box/m44 = 2,
		)

/datum/outfit/loadout/duplicity
	name = "Friend of the Tribes"
	backpack_contents = list(
		/obj/item/clothing/under/f13/exile/legion = 1,
		/obj/item/clothing/suit/hooded/tribaloutcast = 1,
		/obj/item/clothing/shoes/roman = 1,
		/obj/item/clothing/gloves/bracer = 1,
		/obj/item/melee/onehanded/club/warclub = 1,
		/obj/item/throwing_star/tomahawk = 2,
		)


///////////////////
////Legionnaires///
///////////////////

// VETERAN

/datum/job/CaesarsLegion/Legionnaire/vetlegionnaire
	title = "Veteran Legionary"
	flag = F13VETLEGIONARY
	total_positions = 1
	spawn_positions = 1
	description = "A hardened warrior, obeying the orders from the Decanus and Centurion is second nature, as is fighting the profligates. If no officers are present, make sure the younger warriors act like proper Legionaires."
	supervisors = "the Decani and Centurion"
	display_order = JOB_DISPLAY_ORDER_VETLEGIONARY
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/vetlegionnaire
	mapexclude = list("standard")

	loadout_options = list(	//ALL: Gladius
		/datum/outfit/loadout/vetaxe,	// AXE AND FISTS AND NOTHING FUCKING ELSE
		/datum/outfit/loadout/vetsmg, 		// Carl Gustaf, .357 Revolver
		/datum/outfit/loadout/vetberserker,	// Lever shotgun, Bola, Legion Lance
		)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/vetlegionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/vetlegionnaire
	name = "Veteran Legionnaire"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/vetlegionnaire
	id = /obj/item/card/id/dogtag/legveteran
	mask = /obj/item/clothing/mask/bandana/legion/legvet
	head = /obj/item/clothing/head/helmet/f13/legion/vet
	neck = /obj/item/storage/belt/holster
	suit = /obj/item/clothing/suit/armor/f13/legion/vet
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/melee/onehanded/machete = 1,
		)


/datum/outfit/loadout/vetaxe
	name = "Enforcer"
	suit_store = /obj/item/twohanded/legionaxe
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 2,
		)

/datum/outfit/loadout/vetberserker
	name = "Berserker"
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/slug = 1,
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/restraints/legcuffs/bola = 1,
		)

/datum/outfit/loadout/vetsmg
	name = "Flanker"
	suit_store = /obj/item/gun/ballistic/rifle/repeater/cowboy
	backpack_contents = list(
		/obj/item/ammo_box/tube/a357 = 2,
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		)


// PRIME

/datum/job/CaesarsLegion/Legionnaire/f13legionary
	title = "Prime Legionary"
	flag = F13LEGIONARY
	total_positions = 1
	spawn_positions = 1
	description = "A front line soldier who has shown ability to obey and fought in some battles. The Legions muscle, the young men who will build the future with their own blood and sacrifice, for Caesar."
	supervisors = "the Decani and Centurion"
	display_order = JOB_DISPLAY_ORDER_LEGIONARY
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary
	mapexclude = list("standard")

	loadout_options = list(	//ALL: Forged Machete
		/datum/outfit/loadout/primelancer,	// .357 Revolver, Buckler, Bola.
		/datum/outfit/loadout/primerifle,	// Cowboy Repeater, Firebomb
		/datum/outfit/loadout/primebrave,	// Hunting shotgun, Throwing spears
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary
	name = "Prime Legionnaire"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13legionary
	id = /obj/item/card/id/dogtag/legprime
	mask = /obj/item/clothing/mask/bandana/legion/legprime
	head = /obj/item/clothing/head/helmet/f13/legion/prime
	neck = /obj/item/storage/belt/holster
	suit = /obj/item/clothing/suit/armor/f13/legion/prime
	glasses = /obj/item/clothing/glasses/legiongoggles
	r_pocket = /obj/item/flashlight/lantern
	l_pocket = /obj/item/restraints/handcuffs
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/melee/onehanded/machete = 1,
		)

/datum/outfit/loadout/primelancer
	name = "Hastatus"
	suit_store = /obj/item/twohanded/fireaxe
	backpack_contents = list(
		/obj/item/ammo_box/m44 = 1,
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		)

/datum/outfit/loadout/primerifle
	name = "Princeps"
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever
	backpack_contents = list(
		/obj/item/ammo_box/a357 = 3,
		/obj/item/grenade/homemade/firebomb = 2,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		)

/datum/outfit/loadout/primebrave
	name = "Triarius"
	suit_store = /obj/item/gun/ballistic/rifle/hunting
	backpack_contents = list(
		/obj/item/ammo_box/a308 = 5,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		)

// RECRUIT

/datum/job/CaesarsLegion/Legionnaire/f13recleg
	title = "Recruit Legionary"
	flag = F13RECRUITLEG
	total_positions = 5
	spawn_positions = 5
	description = "You have recently come of age or been inducted into Caesar's Legion. You have absolutely no training, and are expected to follow every whim of the Decani. Respect the soldiers of higher rank."
	supervisors = "the Decani."
	display_order = JOB_DISPLAY_ORDER_RECRUITLEG
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg
	mapexclude = list("standard")
	
	loadout_options = list(	//ALL: Machete
		/datum/outfit/loadout/recruittribal,	// Fire Axe, Bola, Trekking
		/datum/outfit/loadout/recruitlegion,	// .357 Revolver, 2 x prefilled Molotovs
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg
	name = "Recruit Legionnaire"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13recleg
	id = /obj/item/card/id/dogtag/legrecruit
	shoes = /obj/item/clothing/shoes/f13/military/leather
	suit = /obj/item/clothing/suit/armor/f13/legion/recruit
	head = /obj/item/clothing/head/helmet/f13/legion/recruit
	mask = /obj/item/clothing/mask/bandana/legion/legrecruit
	glasses = /obj/item/clothing/glasses/legiongoggles
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		/obj/item/melee/onehanded/machete = 1,
		)

/datum/outfit/loadout/recruittribal
	name = "Tribal Recruit"
	suit_store = /obj/item/gun/ballistic/automatic/varmint
	back = /obj/item/storage/backpack/spearquiver
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/book/granter/trait/trekking = 1,
		)

/datum/outfit/loadout/recruitlegion
	name = "Born in the East"
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	back = /obj/item/storage/backpack/spearquiver
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 1,
		)


//////////////////////
////Support Roles ////
//////////////////////

// Immunes are mostly an off-duty role meant to attend to the camp itself and the slaves or prisoners within.

/*datum/job/CaesarsLegion/Legionnaire/f13immune
	title = "Legion Immune"
	flag = F13IMMUNE
	total_positions = 4
	spawn_positions = 1
	description = "An Immune is a legionnaire temporarily assigned to keeping the camp in order, according to their tasking on any given week."
	supervisors = "the Centurion."
	display_order = JOB_DISPLAY_ORDER_IMMUNE
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13immune
	exp_requirements = 300

/datum/outfit/job/CaesarsLegion/Legionnaire/f13immune
	name = "Immune"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13immune
	id = /obj/item/card/id/dogtag/legimmune
	mask = /obj/item/clothing/mask/bandana/legion/camp
	uniform = /obj/item/clothing/under/f13/legskirt
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/f13/military/leather
	l_pocket = /obj/item/flashlight/lantern
	suit_store = /obj/item/melee/onehanded/machete/forgedmachete
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13immune/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)*/

// FORGE MASTER

/datum/job/CaesarsLegion/Legionnaire/f13campfollower	// Extra materials, Blueprints
	title = "Forgemaster"
	flag = F13CAMPFOLLOWER
	total_positions = 1
	spawn_positions = 1
	description = "The Forgemaster makes weapons of all sorts and upgrades them, keeping order in the Forge and makes sure the camp is defended."
	supervisors = "the Decani."
	display_order = JOB_DISPLAY_ORDER_CAMPFOLLOWER
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13campfollower

/datum/outfit/job/CaesarsLegion/Legionnaire/f13campfollower
	name = "Forgemaster"
	id = /obj/item/card/id/dogtag/legforgemaster
	glasses = /obj/item/clothing/glasses/welding
	belt = /obj/item/storage/belt/utility/waster/forgemaster
	neck = /obj/item/clothing/neck/apron/labor/forge
	gloves = /obj/item/clothing/gloves/legion/forgemaster
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/stack/sheet/metal/twenty = 2,
		/obj/item/stack/sheet/mineral/wood/twenty = 1,
		/obj/item/stack/sheet/leather/twenty = 1,
		/obj/item/stack/sheet/cloth/thirty = 1,
		/obj/item/stack/sheet/prewar/twenty = 1,
		/obj/item/weldingtool = 1,
		/obj/item/book/granter/trait/explosives = 1,
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13campfollower/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/dks)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gladius)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/spatha)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lance)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionshield)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lever_action)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/grease_gun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/brush)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingshotgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionlance)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/concussion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/strongrocket)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/empgrenade)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalwar/xbow)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalwar/cheaparrow)



// AUXILIA - Civilians with special training. Can sow new uniforms for soldiers who lost theirs, and are loyal so they would never abuse this.

/datum/job/CaesarsLegion/auxilia
	title = "Auxilia"
	flag = F13AUXILIA
	total_positions = 3
	spawn_positions = 3
	description = "A non-combat position in the Legion for slaves who perform tasks that need special training, such as surgery. They are loyal to the Legion and are expected to provide guidance to lesser slaves and fresh captures."
	supervisors = "the Decani"
	display_order = JOB_DISPLAY_ORDER_AUXILIA
	outfit = /datum/outfit/job/CaesarsLegion/auxilia

	loadout_options = list(
		/datum/outfit/loadout/auxassist, // Keep track of the money, handle trading beneath the warriors
		/datum/outfit/loadout/auxmedicus, // Do surgery, medical tasks.
		/datum/outfit/loadout/auxopifex, // Build defenses, craft necessary items
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)


/datum/outfit/job/CaesarsLegion/auxilia
	name = "Auxilia"
	jobtype = /datum/job/CaesarsLegion/auxilia
	id = /obj/item/card/id/dogtag/legauxilia
	head = /obj/item/clothing/head/f13/auxilia
	shoes = /obj/item/clothing/shoes/roman
	ears = /obj/item/radio/headset/headset_legion
	gloves = null
	belt = null
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/warpaint_bowl
		)

/datum/outfit/job/CaesarsLegion/auxilia/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/f13/legauxiliaf
	if(H.gender == MALE)
		uniform = /obj/item/clothing/under/f13/legauxilia

/datum/outfit/job/CaesarsLegion/auxilia/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_LOW, src)
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tailor/legionuniform)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/warpaint)


/datum/outfit/loadout/auxassist
	name = "Treasurer"
	neck = /obj/item/clothing/neck/mantle/treasurer
	backpack_contents = list(
		/obj/item/folder/red = 1,
		/obj/item/paper/natural = 2,
		/obj/item/pen/fountain = 1,
		/obj/item/storage/bag/money/small/legion = 1,
		/obj/item/taperecorder = 1,
		)

/datum/outfit/loadout/auxmedicus
	name = "Medicus (Surgeon)"
	neck = /obj/item/clothing/neck/apron/medicus
	gloves = /obj/item/clothing/gloves/f13/crudemedical
	belt = /obj/item/storage/belt/medical/primitive
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/stack/sticky_tape/surgical = 1,
		/obj/item/stack/medical/bone_gel = 1,
		/obj/item/book/granter/trait/midsurgery = 1,
		)
/datum/outfit/loadout/auxopifex
	name = "Opifex (Artisan)"
	neck = /obj/item/clothing/neck/apron/labor/forge
	gloves = /obj/item/clothing/gloves/legion/forgemaster
	belt = /obj/item/storage/belt
	glasses = /obj/item/clothing/glasses/welding
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/stack/sheet/metal/twenty = 2,
		/obj/item/stack/sheet/mineral/wood/twenty = 1,
		/obj/item/stack/sheet/leather/twenty = 1,
		/obj/item/stack/sheet/cloth/thirty = 1,
		/obj/item/stack/sheet/prewar/twenty = 1,
		/obj/item/weldingtool = 1,
		/obj/item/book/granter/trait/explosives = 1
		)

// LEGION SLAVES - Servant cook, and assist with medical, low surgery. Worker farm and mine.
// Both get Mars teachings to help out when normal work is done.

/datum/job/CaesarsLegion/slave
	title = "Slave"
	flag = F13LEGIONSLAVE
	total_positions = 3
	spawn_positions = 3
	description = "A slave that survives the breaking camps is given a Legion appropriate name (latin-tribal inspired) and bull tattoo. Be obedient, respectful, stay inside the camp. Work the farm, mine, make food, clean and help injured men. Do NOT escape on your own, up to you how to handle it if forcibly freed by outside forces."
	supervisors = "Officers and Slavemaster first, then Auxilia, then warriors."
	display_order = JOB_DISPLAY_ORDER_LEGIONSLAVE

	outfit = /datum/outfit/job/CaesarsLegion/slave

	loadout_options = list(
		/datum/outfit/loadout/slaveservant,
		/datum/outfit/loadout/slaveworker,
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion/slave,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion/slave,
		),
	)

/datum/outfit/job/CaesarsLegion/slave/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)

/datum/outfit/job/CaesarsLegion/slave
	name = "Slave"
	jobtype = /datum/outfit/job/CaesarsLegion/slave
	id = /obj/item/card/id/legionbrand
	neck = /obj/item/electropack/shockcollar
	shoes =	null
	l_pocket = /obj/item/radio


/datum/outfit/job/CaesarsLegion/slave/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/f13/legslavef
	if(H.gender == MALE)
		uniform = /obj/item/clothing/under/f13/legslave


//Servants cook, clean, help with medical tasks.
/datum/outfit/loadout/slaveservant
	name = "Servant"
	head = /obj/item/clothing/head/f13/servant
	gloves = /obj/item/clothing/gloves/f13/crudemedical
	shoes =	/obj/item/clothing/shoes/roman
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/reagent_containers/pill/patch/healpoultice = 2,
		/obj/item/smelling_salts = 1,
		/obj/item/book/granter/trait/lowsurgery = 1,
		/obj/item/reagent_containers/food/condiment/flour = 2,
		/obj/item/storage/box/bowls = 1,
		/obj/item/reagent_containers/glass/beaker/large = 1,
		/obj/item/soap/homemade = 1,
		/obj/item/lighter = 1,
		)

/datum/outfit/loadout/slaveservant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == MALE)
		H.gender = FEMALE
		H.real_name = random_unique_name(FEMALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()

//Laborers farm and mine.
/datum/outfit/loadout/slaveworker
	name = "Worker"
	suit = /obj/item/clothing/suit/armor/f13/slavelabor
	shoes =	/obj/item/clothing/shoes/f13/rag
	r_hand = /obj/item/flashlight/flare/torch
	backpack_contents = list(
		/obj/item/storage/bag/plants = 1,
		/obj/item/reagent_containers/food/snacks/grown/ambrosia/deus = 1,
		/obj/item/cultivator = 1,
		/obj/item/soap/homemade = 1,
		/obj/item/shovel/spade = 1,
		)

/*
Post Scriptum
Plans: Add recipes/traits to keep refining support roles, Forgemaster done, others will need some minor tweaking. Planned is making the medicus more of a improvised surgery master, using primitive tools to good effect, because its interesting and unique.
Venator  - Zero slots, role built on cloning vet ranger, linear just vastly better than all but the Cent, snowflakey in command when it suits them, messes up the chain of command thats already messy for Legion. FUCK IT ENABLE IT
*/
/*datum/job/CaesarsLegion/Legionnaire/f13venator
	title = "Legion Explorer"
	flag = F13VENATOR
	total_positions = 1
	spawn_positions = 1
	description = "You are the Explorer -- the Hunter. With your powerful rifle and your many years of experience, you are a formidable killing machine, capable of taking down even the most formidable targets. Note that you are not a rank-and-file legionary, and you should not be operating as such -- your job is special operations, not fighting alongside the hordes of the Legion."
	supervisors = "the Centurion"
	selection_color = "#ffdddd"
	display_order = JOB_DISPLAY_ORDER_VENATOR
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13venator
	exp_type = EXP_TYPE_LEGION
	exp_requirements = 1500

/datum/outfit/job/CaesarsLegion/Legionnaire/f13venator/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_SILENT_STEP, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13venator
	name = "Legion Explorer"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13explorer
	id = /obj/item/card/id/dogtag/legvenator
	suit = /obj/item/clothing/suit/armor/f13/legion/venator
	head = /obj/item/clothing/head/helmet/f13/legion/venator
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/night/polarizing
	ears = /obj/item/radio/headset/headset_legion
	r_pocket = /obj/item/binoculars
	suit_store = /obj/item/gun/ballistic/automatic/marksman/sniper/snipervenator
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308 = 3,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 3,
		/obj/item/gun/ballistic/revolver/revolver45 = 1,
		/obj/item/ammo_box/c45rev = 3,
		)

// Slavemaster

datum/job/CaesarsLegion/Legionnaire/f13slavemaster
	title = "Legion Slavemaster"
	flag = F13SLAVEMASTER
	total_positions = 1
	spawn_positions = 1
	description = "You are the feared and respected disciplinary corps of the Legion. Acting as both master of the Slaves and de-facto executioner of the Centurion's will within his ranks, you are a faceless and undoubtedly cruel torturer... but be careful to not let your hubris and malice lead to a strikeback from those you thought broken."
	supervisors = "the Decani and Centurion"
	exp_requirements = 300

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13slavemaster

/datum/outfit/job/CaesarsLegion/Legionnaire/f13slavemaster
	name = "Legion Slavemaster"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13legionary
	id =			/obj/item/card/id/dogtag/legslavemaster
	uniform =		/obj/item/clothing/under/gladiator
	suit = 			/obj/item/clothing/suit/armor/f13/legion/prime/slavemaster
	belt = 			/obj/item/melee/onehanded/slavewhip
	head = 			/obj/item/clothing/head/helmet/f13/legion/prime/slavemaster
	shoes =			/obj/item/clothing/shoes/roman
	suit_store = 	/obj/item/melee/onehanded/machete/forgedmachete
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/flashlight/lantern = 1,
		/obj/item/electropack/shockcollar = 3,
		/obj/item/assembly/signaler/advanced = 3,
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13slavemaster/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)


*/// Legion CitizenReally only used for ID console
/datum/job/ncr/f13legioncitizen
	title = "Legion Citizen"
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legioncitizen

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legioncitizen
	name = "Legion Citizen (Role)"
	uniform = /obj/item/clothing/under/f13/doctor
	shoes = /obj/item/clothing/shoes/f13/fancy
	suit = /obj/item/clothing/suit/curator
	head = /obj/item/clothing/head/scarecrow_hat
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/welding
	id = /obj/item/card/id/dogtag/town/legion
	l_hand = /obj/item/shield/riot/buckler
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/spatha = 1,
		)

