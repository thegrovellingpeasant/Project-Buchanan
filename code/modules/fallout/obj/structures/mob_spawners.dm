//base nest and the procs
/obj/structure/nest
	name = "monster nest"
	desc = "A horrible nest full of monsters."
	icon = 'icons/mob/nest_new.dmi'
	icon_state = "hole"
	var/list/spawned_mobs = list()
	var/max_mobs = 3
	var/can_fire = TRUE
	var/mob_types = list(/mob/living/simple_animal/hostile/carp)
	//make spawn_time's multiples of 10. The SS runs on 10 seconds.
	var/spawn_time = 10 SECONDS
	var/coverable = TRUE
	var/covered = FALSE
	var/obj/covertype
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/spawn_text = "emerges from"
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	var/radius = 10
	var/spawnsound //specify an audio file to play when a mob emerges from the spawner
	var/spawn_once
	var/infinite = FALSE

/obj/structure/nest/Initialize()
	. = ..()
	GLOB.mob_nests += src

/obj/structure/nest/spawner/Destroy()
	GLOB.mob_nests -= src
	playsound(src, 'sound/effects/break_stone.ogg', 100, 1)
	visible_message("[src] collapses!")
	. = ..()

/obj/structure/nest/mob/Destroy()
	GLOB.mob_nests -= src
	. = ..()

/obj/structure/nest/proc/spawn_mob()
	if(!can_fire)
		return FALSE
	if(covered)
		can_fire = FALSE
		return FALSE
	CHECK_TICK
	if(spawned_mobs.len >= max_mobs)
		return FALSE
	var/mob/living/carbon/human/H = locate(/mob/living/carbon/human) in range(radius, get_turf(src))
	var/obj/mecha/M = locate(/obj/mecha) in range(radius, get_turf(src))
	if(!H?.client && !M?.occupant)
		return FALSE
	toggle_fire(FALSE)
	addtimer(CALLBACK(src, .proc/toggle_fire), spawn_time)
	var/chosen_mob_type = pickweight(mob_types)
	var/mob/living/simple_animal/L = new chosen_mob_type(src.loc)
	L.flags_1 |= (flags_1 & ADMIN_SPAWNED_1)	//If we were admin spawned, lets have our children count as that as well.
	spawned_mobs += L
	L.nest = src
	L.dir = src.dir //	visible_message("<span class='danger'>[L] [spawn_text] [src].</span>") removed for new mob spawners
	if(spawnsound)
		playsound(src, spawnsound, 30, 1)
	if(!infinite)
		if(spawned_mobs.len >= max_mobs)
			Destroy()
	if(spawn_once) //if the subtype has TRUE, call destroy() after we spawn our first mob
		qdel(src)
		return


/obj/structure/nest/proc/toggle_fire(fire = TRUE)
	can_fire = fire

/obj/structure/nest/attackby(obj/item/I, mob/living/user, params)
	if(user.a_intent == INTENT_HARM)
		to_chat(user, "<span class='warning'>You feel it is impossible to destroy this. Best to cover it up with something.</span>")
		return

	if(istype(I, /obj/item/stack/rods))
		if(!coverable)
			to_chat(user, "<span class='warning'>The hole is unable to be covered!</span>")
			return
		if(covered)
			to_chat(user, "<span class='warning'>The hole is already covered!</span>")
			return
		var/obj/item/stack/rods/R = I
		if(R.amount < 4)
			to_chat(user, "<span class='warning'>You need four rods in order to cover the hole!</span>")
			return
		if(!do_after(user, 5 SECONDS, FALSE, src))
			to_chat(user, "<span class='warning'>You must stand still to build the cover!</span>")
			return
		R.use(4)

		if(!covered)
			new /obj/effect/spawner/lootdrop/f13/weapon/gun/ballistic/low(src.loc)
			to_chat(user, "<span class='warning'>You find something while covering the hole!</span>")

		covered = TRUE
		covertype = /obj/item/stack/rods


		var/image/rod_image = image(icon, icon_state = "rods")
		add_overlay(rod_image)
		QDEL_IN(src, 2 MINUTES)
		return

	if(istype(I, /obj/item/stack/sheet/mineral/wood))
		if(!coverable)
			to_chat(user, "<span class='warning'>The hole is unable to be covered!</span>")
			return
		if(covered)
			to_chat(user, "<span class='warning'>The hole is already covered!</span>")
			return
		var/obj/item/stack/sheet/mineral/wood/W = I
		if(W.amount < 4)
			to_chat(user, "<span class='warning'>You need four planks of wood in order to cover the hole!</span>")
			return
		if(!do_after(user, 5 SECONDS, FALSE, src))
			to_chat(user, "<span class='warning'>You must stand still to build the cover!</span>")
			return
		W.use(4)

		if(!covered)
			new /obj/effect/spawner/lootdrop/f13/weapon/gun/ballistic/low(src.loc)
			to_chat(user, "<span class='warning'>You find something while covering the hole!</span>")

		covered = TRUE
		covertype = /obj/item/stack/sheet/mineral/wood
		var/image/plank_image = image(icon, icon_state = "planks")
		add_overlay(plank_image)
		QDEL_IN(src, 2 MINUTES)
		return

//the nests themselves
/*
	var/list/cazadors 	= list(/mob/living/simple_animal/hostile/cazador = 5,
					/mob/living/simple_animal/hostile/cazador/young = 3,)

	var/list/ghouls 	= list(/mob/living/simple_animal/hostile/ghoul = 5,
					/mob/living/simple_animal/hostile/ghoul/reaver = 3,
					/mob/living/simple_animal/hostile/ghoul/glowing = 1)

	var/list/deathclaw 	= list(/mob/living/simple_animal/hostile/deathclaw = 19,
					/mob/living/simple_animal/hostile/deathclaw/mother = 1)

	var/list/scorpion	= list(/mob/living/simple_animal/hostile/radscorpion = 1,
					/mob/living/simple_animal/hostile/radscorpion/black = 1)

	var/list/radroach	= list(/mob/living/simple_animal/hostile/radroach = 1)

	var/list/fireant	= list(/mob/living/simple_animal/hostile/fireant = 1,
					/mob/living/simple_animal/hostile/giantant = 1)

	var/list/wanamingo 	= list(/mob/living/simple_animal/hostile/alien = 1)

	var/list/molerat	= list(/mob/living/simple_animal/hostile/molerat = 1)

	var/list/mirelurk	= list(/mob/living/simple_animal/hostile/mirelurk = 2,
					/mob/living/simple_animal/hostile/mirelurk/hunter = 1,
					/mob/living/simple_animal/hostile/mirelurk/baby = 5)

	var/list/raider		= list(/mob/living/simple_animal/hostile/raider = 5,
					/mob/living/simple_animal/hostile/raider/firefighter = 2,
					/mob/living/simple_animal/hostile/raider/baseball = 2,
					/mob/living/simple_animal/hostile/raider/ranged = 2,
					/mob/living/simple_animal/hostile/raider/ranged/sulphiteranged = 1,
					/mob/living/simple_animal/hostile/raider/ranged/biker = 1,
					/mob/living/simple_animal/hostile/raider/ranged/boss = 1,
					/mob/living/simple_animal/hostile/raider/legendary = 1)

	var/list/protectron	= list(/mob/living/simple_animal/hostile/handy/protectron = 5,
					/mob/living/simple_animal/hostile/handy = 3)

	var/list/cazador	= list(/mob/living/simple_animal/hostile/cazador = 5,
					/mob/living/simple_animal/hostile/cazador/young = 3,)

*/
/obj/structure/nest/spawner/ghoul
	name = "ghoul nest"
	max_mobs = 5
	mob_types = list(/mob/living/simple_animal/hostile/ghoul = 5,
					/mob/living/simple_animal/hostile/ghoul/reaver = 3,
					/mob/living/simple_animal/hostile/ghoul/glowing = 1)

/obj/structure/nest/spawner/deathclaw
	name = "deathclaw nest"
	max_mobs = 1
	spawn_once = TRUE
	spawn_time = 60 SECONDS
	mob_types = list(/mob/living/simple_animal/hostile/deathclaw = 5)

/obj/structure/nest/spawner/deathclaw/mother
	name = "mother deathclaw nest"
	max_mobs = 1
	spawn_time = 120 SECONDS
	mob_types = list(/mob/living/simple_animal/hostile/deathclaw/mother = 5)

/obj/structure/nest/spawner/scorpion
	name = "radscorpion nest"
	spawn_time = 40 SECONDS
	max_mobs = 1
	mob_types = list(/mob/living/simple_animal/hostile/radscorpion = 1,
					/mob/living/simple_animal/hostile/radscorpion/black = 1)

/obj/structure/nest/spawner/radroach
	name = "radroach nest"
	max_mobs = 1
	mob_types = list(/mob/living/simple_animal/hostile/radroach = 1)

/obj/structure/nest/spawner/fireant
	name = "fireant nest"
	max_mobs = 1
	mob_types = list(/mob/living/simple_animal/hostile/fireant = 1,
					/mob/living/simple_animal/hostile/giantant = 1)

/obj/structure/nest/spawner/wanamingo
	name = "wanamingo nest"
	spawn_time = 40 SECONDS
	max_mobs = 2
	mob_types = list(/mob/living/simple_animal/hostile/alien = 1)

/obj/structure/nest/spawner/molerat
	name = "molerat nest"
	max_mobs = 1
	mob_types = list(/mob/living/simple_animal/hostile/molerat = 1)
	spawn_time = 10 SECONDS //They just love tunnelin'.. And are pretty soft

/obj/structure/nest/spawner/mirelurk
	name = "mirelurk nest"
	max_mobs = 1
	mob_types = list(/mob/living/simple_animal/hostile/mirelurk)

/obj/structure/nest/spawner/mirelurk/mirelurkmuck
	name = "muck"
	desc = "A mirelurk waiting in ambush."
	icon = 'icons/obj/objects.dmi'
	icon_state = "ash"
	color = "#778e9e"
	max_mobs = 1
	mob_types = list(/mob/living/simple_animal/hostile/mirelurk = 5)

/obj/structure/nest/spawner/mirelurk/huntermuck
	name = "muck"
	desc = "A mirelurk waiting in ambush."
	icon = 'icons/obj/objects.dmi'
	icon_state = "ash"
	color = "#547d62"
	max_mobs = 1
	mob_types = list(/mob/living/simple_animal/hostile/mirelurk/hunter = 5)

/obj/structure/nest/spawner/mirelurk/eggs
	name = "mirelurk eggs"
	desc = "A fresh clutch of mirelurk eggs."
	icon = 'icons/mob/wastemobsdrops.dmi'
	icon_state = "mirelurkeggs"
	max_mobs = 1
	mob_types = list(/mob/living/simple_animal/hostile/mirelurk/baby = 5)
	plane = FLOOR_PLANE

/obj/structure/nest/spawner/raider
	name = "narrow tunnel"
	desc = "A crude tunnel used by raiders to travel across the wasteland."
	max_mobs = 5
	icon_state = "ventblue"
	spawnsound = 'sound/effects/bin_close.ogg'
	mob_types = list(/mob/living/simple_animal/hostile/raider = 5,
					/mob/living/simple_animal/hostile/raider/firefighter = 2,
					/mob/living/simple_animal/hostile/raider/baseball = 5,
					/mob/living/simple_animal/hostile/raider/ranged = 2,
					/mob/living/simple_animal/hostile/raider/ranged/sulphiteranged = 1,
					/mob/living/simple_animal/hostile/raider/ranged/biker = 1,
					/mob/living/simple_animal/hostile/raider/tribal = 1)

/obj/structure/nest/raider/melee
	mob_types = list(/mob/living/simple_animal/hostile/raider = 5,
					/mob/living/simple_animal/hostile/raider/firefighter = 2,
					/mob/living/simple_animal/hostile/raider/baseball = 5,
					/mob/living/simple_animal/hostile/raider/tribal = 1)

/obj/structure/nest/raider/ranged
	max_mobs = 3
	mob_types = list(/mob/living/simple_animal/hostile/raider/ranged = 2,
					/mob/living/simple_animal/hostile/raider/ranged/sulphiteranged = 1,
					/mob/living/simple_animal/hostile/raider/ranged/biker = 1)

/obj/structure/nest/raider/boss
	max_mobs = 1
	spawn_once = TRUE
	mob_types = list(/mob/living/simple_animal/hostile/raider/ranged/boss = 5)

/obj/structure/nest/raider/legendary
	max_mobs = 1
	spawn_once = TRUE
	mob_types = list(/mob/living/simple_animal/hostile/raider/legendary = 1)

/obj/structure/nest/spawner/protectron
	name = "protectron pod"
	desc = "An old robot storage system. This one looks like it is connected to space underground."
	max_mobs = 1
	icon_state = "scanner_modified"
	spawnsound = 'sound/f13machines/generator_off.ogg'
	mob_types = list(/mob/living/simple_animal/hostile/handy/protectron = 5)

/obj/structure/nest/spawner/protectron/construction
	name = "protectron pod"
	spawnsound = 'sound/f13machines/generator_off.ogg'
	mob_types = list(/mob/living/simple_animal/hostile/handy/protectron/construction = 5)

/obj/structure/nest/spawner/mrhandy
	name = "handy pod"
	desc = "An old robot storage system."
	max_mobs = 1
	icon_state = "scanner_modified"
	spawnsound = 'sound/f13machines/generator_off.ogg'
	mob_types = list(/mob/living/simple_animal/hostile/handy = 5)

/obj/structure/nest/spawner/eyebot
	name = "eyebot pod"
	desc = "An old robot storage system."
	max_mobs = 1
	icon_state = "scanner_modified"
	spawnsound = 'sound/f13machines/generator_off.ogg'
	mob_types = list(/mob/living/simple_animal/hostile/eyebot = 5)

/obj/structure/nest/spawner/securitron
	name = "securitron pod"
	desc = "An old securitron containment pod system. This one looks like it is connected to a storage system underground."
	max_mobs = 1
	icon_state = "scanner_modified"
	spawnsound = 'sound/f13machines/generator_off.ogg'
	mob_types = list(/mob/living/simple_animal/hostile/securitron = 5)

/obj/structure/nest/spawner/assaultron
	name = "assaultron pod"
	desc = "An old assaultron containment pod system. This one looks like it is connected to a storage system underground."
	spawn_time = 40 SECONDS
	max_mobs = 1
	icon_state = "scanner_modified"
	spawnsound = 'sound/f13machines/generator_off.ogg'
	mob_types = list(/mob/living/simple_animal/hostile/handy/assaultron = 5)

/obj/structure/nest/spawner/cazador
	name = "cazador nest"
	max_mobs = 1
	spawnsound = 'sound/creatures/cazador_buzz.ogg'
	mob_types = list(/mob/living/simple_animal/hostile/cazador = 5,
					/mob/living/simple_animal/hostile/cazador/young = 3)

/obj/structure/nest/spawner/goose
	name = "canada goose nest"
	icon = 'icons/misc/Pit.dmi'
	icon_state = "pit"
	plane = FLOOR_PLANE
	max_mobs = 2
	spawnsound = 'sound/creatures/goose3.ogg'
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/goose = 5)

/obj/structure/nest/spawner/bloatfly
	name = "bloatfly nest"
	max_mobs = 1
	spawn_time = 10 SECONDS
	spawnsound = 'sound/creatures/cazador_buzz.ogg'
	mob_types = list(/mob/living/simple_animal/hostile/bloatfly = 5)

/obj/structure/nest/spawner/gecko
	name = "gecko nest"
	max_mobs = 2
	mob_types = list(/mob/living/simple_animal/hostile/gecko = 5,
					/mob/living/simple_animal/hostile/gecko/firegecko = 2)

/obj/structure/nest/spawner/wolf
	name = "wolf den"
	max_mobs = 1
	mob_types = list(/mob/living/simple_animal/hostile/wolf = 5)

/obj/structure/nest/spawner/mangy
	name = "mangy nest"
	max_mobs = 1
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/mangydog = 5, /mob/living/simple_animal/hostile/wolf/alpha = 5)

/obj/structure/nest/spawner/supermutant
	name = "supermutant den"
	spawn_time = 30 SECONDS
	max_mobs = 2
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/melee = 5,
					/mob/living/simple_animal/hostile/supermutant/ranged = 2)

/obj/structure/nest/spawner/supermutant/melee
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/melee = 5)

/obj/structure/nest/spawner/supermutant/ranged
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/ranged = 5)

/obj/structure/nest/spawner/supermutant/nightkin
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/nightkin = 5,
					/mob/living/simple_animal/hostile/supermutant/nightkin/ranged = 2,
					/mob/living/simple_animal/hostile/supermutant/nightkin/elite = 1)

/obj/structure/nest/spawner/nightstalker
	name = "nightstalker nest"
	max_mobs = 2
	mob_types = list(/mob/living/simple_animal/hostile/stalker = 5,
					/mob/living/simple_animal/hostile/stalkeryoung = 5)

//single mob spawners
/obj/structure/nest/mob
	desc = "You see nothing out of the ordinary."
	density = TRUE
	max_mobs = 1
	spawn_once = TRUE
	spawn_time = 0 SECONDS

/obj/structure/nest/mob/ghoul
	name = "feral ghoul"
	icon = 'icons/fallout/mobs/humans/ghouls.dmi'
	icon_state = "feralghoul"
	mob_types = list(/mob/living/simple_animal/hostile/ghoul = 5)

/obj/structure/nest/mob/ghoulcozy
	name = "feral ghoul"
	icon = 'icons/fallout/mobs/humans/ghouls.dmi'
	icon_state = "feralghoul_dead"
	mob_types = list(/mob/living/simple_animal/hostile/ghoul = 5)

/obj/structure/nest/mob/ghoulreaver
	name = "feral ghoul reaver"
	icon = 'icons/fallout/mobs/humans/ghouls.dmi'
	icon_state = "ghoulreaver"
	mob_types = list(/mob/living/simple_animal/hostile/ghoul/reaver = 5)

/obj/structure/nest/mob/ghoulglowing
	name = "glowing one"
	icon = 'icons/fallout/mobs/humans/ghouls.dmi'
	icon_state = "glowinghoul"
	mob_types = list(/mob/living/simple_animal/hostile/ghoul/glowing = 5)

/obj/structure/nest/mob/deathclaw
	name = "deathclaw"
	icon = 'icons/fallout/mobs/monsters/deathclaw.dmi'
	icon_state = "deathclaw"
	mob_types = list(/mob/living/simple_animal/hostile/deathclaw = 5)

/obj/structure/nest/mob/scorpion
	name = "radscorpion"
	icon = 'icons/fallout/mobs/animals/insects.dmi'
	icon_state = "radscorpion"
	mob_types = list(/mob/living/simple_animal/hostile/radscorpion = 5)

/obj/structure/nest/mob/scorpionblue
	name = "radscorpion"
	icon = 'icons/fallout/mobs/animals/insects.dmi'
	icon_state = "radscorpion_blue"
	mob_types = list(/mob/living/simple_animal/hostile/radscorpion/blue = 5)

/obj/structure/nest/mob/scorpionblack
	name = "radscorpion"
	icon = 'icons/fallout/mobs/animals/insects.dmi'
	icon_state = "radscorpion_black"
	mob_types = list(/mob/living/simple_animal/hostile/radscorpion/black = 5)

/obj/structure/nest/mob/radroach
	name = "radroach"
	icon = 'icons/fallout/mobs/animals/insects.dmi'
	icon_state = "radroach"
	mob_types = list(/mob/living/simple_animal/hostile/radroach = 5)

/obj/structure/nest/mob/giantant
	name = "giant ant"
	icon = 'icons/fallout/mobs/animals/insects.dmi'
	icon_state = "GiantAnt"
	mob_types = list(/mob/living/simple_animal/hostile/giantant = 5)

/obj/structure/nest/mob/fireant
	name = "fireant"
	icon = 'icons/fallout/mobs/animals/insects.dmi'
	icon_state = "FireAnt"
	mob_types = list(/mob/living/simple_animal/hostile/fireant = 5)

/obj/structure/nest/mob/wanamingo
	name = "wanamingo"
	icon = 'icons/fallout/mobs/monsters/wanamingo.dmi'
	icon_state = "wanamingo"
	mob_types = list(/mob/living/simple_animal/hostile/alien = 5)

/obj/structure/nest/mob/molerat
	name = "molerat"
	icon = 'icons/fallout/mobs/animals/wasteanimals.dmi'
	icon_state = "molerat"
	mob_types = list(/mob/living/simple_animal/hostile/molerat = 5)

/obj/structure/nest/mob/molerat/civilwar
	mob_types = list(/mob/living/simple_animal/hostile/molerat/civilwar = 5)

/obj/structure/nest/mob/cazador
	name = "cazador"
	icon = 'icons/fallout/mobs/animals/insects.dmi'
	icon_state = "cazador"
	mob_types = list(/mob/living/simple_animal/hostile/cazador = 5, /mob/living/simple_animal/hostile/cazador/young = 5)

/obj/structure/nest/mob/bloatfly
	name = "bloatfly"
	icon = 'icons/fallout/mobs/animals/insects.dmi'
	icon_state = "bloatfly"
	mob_types = list(/mob/living/simple_animal/hostile/bloatfly = 5)

/obj/structure/nest/mob/gecko
	name = "gecko"
	icon = 'icons/fallout/mobs/animals/wasteanimals.dmi'
	icon_state = "gekko"
	mob_types = list(/mob/living/simple_animal/hostile/gecko = 5)

/obj/structure/nest/mob/geckofire
	name = "fire gecko"
	icon = 'icons/fallout/mobs/animals/wasteanimals.dmi'
	icon_state = "firegekko"
	mob_types = list(/mob/living/simple_animal/hostile/gecko/firegecko = 5)

/obj/structure/nest/mob/wolf
	name = "wolf"
	icon = 'icons/fallout/mobs/animals/dogs.dmi'
	icon_state = "wolf"
	mob_types = list(/mob/living/simple_animal/hostile/wolf/cold = 5)

/obj/structure/nest/mob/brahmin
	name = "feral dog"
	icon = 'icons/fallout/mobs/animals/dogs.dmi'
	icon_state = "dog_feral"
	mob_types = list(/mob/living/simple_animal/hostile/wolf = 5)

/obj/structure/nest/mob/bighorner
	name = "feral dog"
	icon = 'icons/fallout/mobs/animals/dogs.dmi'
	icon_state = "dog_feral"
	mob_types = list(/mob/living/simple_animal/hostile/wolf = 5)

/obj/structure/nest/mob/radstag
	name = "radstag"
	icon = 'icons/fallout/mobs/animals/farmanimals.dmi'
	icon_state = "radstag"
	mob_types = list(/mob/living/simple_animal/radstag = 5)

/obj/structure/nest/mob/dog
	name = "mangy dog"
	icon = 'icons/fallout/mobs/animals/dogs.dmi'
	icon_state = "dog_feral"
	mob_types = list(/mob/living/simple_animal/hostile/wolf = 5)

/obj/structure/nest/mob/dogalpha
	name = "particularly mangy dog"
	icon = 'icons/fallout/mobs/animals/dogs.dmi'
	icon_state = "dog_alpha"
	mob_types = list(/mob/living/simple_animal/hostile/wolf/alpha = 5)

/obj/structure/nest/mob/dog/mutcastle
	mob_types = list(/mob/living/simple_animal/hostile/wolf/mutcastle = 5)

/obj/structure/nest/mob/dogalpha/mutcastle
	mob_types = list(/mob/living/simple_animal/hostile/wolf/alpha/mutcastle = 5)

/obj/structure/nest/mob/centaur
	name = "centaur"
	icon = 'icons/fallout/mobs/monsters/freaks.dmi'
	icon_state = "centaur"
	mob_types = list(/mob/living/simple_animal/hostile/centaur = 5)

/obj/structure/nest/mob/supermutant
	name = "supermutant"
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "hulk_113_s"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant = 5)

/obj/structure/nest/mob/supermutant/vault
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "hulk_suicider_s"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/vault = 5)

/obj/structure/nest/mob/supermutant/ncr
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "hulk_special_ncr"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/ncr = 5)

/obj/structure/nest/mob/supermutant/legion
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "hulk_special_armor"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/legion = 5)

/obj/structure/nest/mob/supermutant/enclavepvt
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "mutant_private"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/pvt = 5)

/obj/structure/nest/mob/supermutant/enclaveng
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "mutant_engineer"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/eng = 5)

/obj/structure/nest/mob/supermutant/enclavenco
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "mutant_NCO"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/nco = 5)

/obj/structure/nest/mob/supermutant/melee
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "hulk_melee_s"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/melee = 5)

/obj/structure/nest/mob/supermutant/ranged
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "hulk_ranged_s"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/ranged = 5)

/obj/structure/nest/mob/supermutant/nightkin
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "night_s"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/nightkin = 5)

/obj/structure/nest/mob/supermutant/nightkinranged
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "night_ranged_s"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/nightkin/ranged = 5)

/obj/structure/nest/mob/supermutant/nightkinelite
	icon = 'icons/fallout/mobs/supermutant.dmi'
	icon_state = "night_boss_s"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/nightkin/elite = 5)

/obj/structure/nest/mob/supermutant/vault/mutcastle
	name = "supermutant"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/vault/mutcastle = 5)

/obj/structure/nest/mob/supermutant/ncr/mutcastle
	name = "supermutant"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/ncr/mutcastle = 5)

/obj/structure/nest/mob/supermutant/legion/mutcastle
	name = "supermutant"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/legion/mutcastle = 5)

/obj/structure/nest/mob/supermutant/melee/mutcastle
	name = "supermutant"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/melee/mutcastle = 5)

/obj/structure/nest/mob/supermutant/ranged/mutcastle
	name = "supermutant"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/ranged/mutcastle = 5)

/obj/structure/nest/mob/supermutant/enclaveng/mutcastle
	name = "supermutant"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/eng/mutcastle = 5)

/obj/structure/nest/mob/supermutant/nightkin/mutcastle
	name = "supermutant"
	mob_types = list(/mob/living/simple_animal/hostile/supermutant/nightkin/mutcastle = 5)

/obj/structure/nest/mob/nightstalker
	name = "nightstalker"
	icon = 'icons/fallout/mobs/animals/nightstalker.dmi'
	icon_state = "nightstalker"
	mob_types = list(/mob/living/simple_animal/hostile/stalker = 5)

/obj/structure/nest/mob/nightstalkeryoung
	name = "young nightstalker"
	icon = 'icons/fallout/mobs/animals/wasteanimals.dmi'
	icon_state = "nightstalker_cub"
	mob_types = list(/mob/living/simple_animal/hostile/stalkeryoung = 5)

/obj/structure/nest/mob/venushumantrap
	name = "venus human trap"
	icon = 'icons/fallout/mobs/monsters/freaks.dmi'
	icon_state = "venus_human_trap"
	mob_types = list(/mob/living/simple_animal/hostile/venus_human_trap = 5)

/obj/structure/nest/mob/venushumantrap/weak
	mob_types = list(/mob/living/simple_animal/hostile/venus_human_trap/weak = 5)

/obj/structure/nest/mob/venushumantrap
	name = "venus human trap"
	icon = 'icons/fallout/mobs/monsters/freaks.dmi'
	icon_state = "venus_human_trap"
	mob_types = list(/mob/living/simple_animal/hostile/venus_human_trap = 5)

/obj/structure/nest/mob/traumaharness
	name = "Y-17 Trauma Override Harness"
	icon = 'icons/mob/simple_human.dmi'
	icon_state = "traumaharnessbutshitty"
	mob_types = list(/mob/living/simple_animal/hostile/skeleton/traumaharness = 5)

/obj/structure/nest/mob/robobrain
	name = "robobrain"
	icon = 'icons/fallout/mobs/robots/wasterobots.dmi'
	icon_state = "robobrain"
	mob_types = list(/mob/living/simple_animal/hostile/handy/robobrain = 5)

/obj/structure/nest/mob/misterhandy
	name = "mr. handy"
	icon = 'icons/fallout/mobs/robots/wasterobots.dmi'
	icon_state = "handy"
	mob_types = list(/mob/living/simple_animal/hostile/handy = 5)

/obj/structure/nest/mob/protectron
	name = "protectron"
	icon = 'icons/fallout/mobs/robots/protectrons.dmi'
	icon_state = "protectron"
	mob_types = list(/mob/living/simple_animal/hostile/handy/protectron = 5)

/obj/structure/nest/mob/protectron/construction
	name = "construction protectron"
	icon = 'icons/fallout/mobs/robots/protectrons.dmi'
	icon_state = "Patribot_Worker"
	mob_types = list(/mob/living/simple_animal/hostile/handy/protectron/construction = 5)

/obj/structure/nest/mob/protectron/damaged
	name = "damaged protectron"
	icon = 'icons/fallout/mobs/robots/protectrons.dmi'
	icon_state = "protectron_dead"
	mob_types = list(/mob/living/simple_animal/hostile/handy/protectron/damaged = 5)

/obj/structure/nest/mob/eyebot
	name = "eyebot"
	icon = 'icons/fallout/mobs/robots/eyebots.dmi'
	icon_state = "eyebot"
	mob_types = list(/mob/living/simple_animal/hostile/eyebot = 5)

//Event Nests
/obj/structure/nest/zombieghoul
	name = "ravenous ghoul nest"
	max_mobs = 5
	mob_types = list(/mob/living/simple_animal/hostile/ghoul/zombie = 5,
					/mob/living/simple_animal/hostile/ghoul/zombie/reaver = 3,
					/mob/living/simple_animal/hostile/ghoul/zombie/glowing = 1)

/obj/structure/nest/tunneler
	name = "tunneler tunnel"
	desc = "A tunnel which leads to an underground network of even more tunnels, made by the dangerous tunnelers."
	max_mobs = 5
	mob_types = list(/mob/living/simple_animal/hostile/trog/tunneler = 1)
	spawn_time = 20 SECONDS
