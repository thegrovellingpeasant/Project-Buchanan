// In this document: Fermenting barrels, compost bin, loom, seed extractor

#define SPAN_WARNING
#define SPAN_NOTICE
#define FABRIC_PER_SHEET 4

///////////////////////
// FERMENTING BARREL //
///////////////////////


/obj/structure/fermenting_barrel
	name = "wooden barrel"
	desc = "A large wooden barrel. You can ferment fruits and such inside it, or just use it to hold liquid."
	icon = 'icons/fallout/farming/farming_structures.dmi'
	icon_state = "barrel"
	density = TRUE
	anchored = FALSE
	pressure_resistance = 2 * ONE_ATMOSPHERE
	max_integrity = 300
	proj_pass_rate = 70
	pass_flags = LETPASSTHROW
	pass_flags_self = PASSTABLE | LETPASSTHROW
	climbable = TRUE
	var/open = FALSE
	var/speed_multiplier = 4 //How fast it distills. Defaults to 100% (1.0). Lower is better.

/obj/structure/fermenting_barrel/Initialize()
	create_reagents(300, DRAINABLE | AMOUNT_VISIBLE) //Bluespace beakers, but without the portability or efficiency in circuits.
	. = ..()

/obj/structure/fermenting_barrel/examine(mob/user)
	. = ..()
	. += span_notice("It is currently [open?"open, letting you pour liquids in.":"closed, letting you draw liquids from the tap."]")

/obj/structure/fermenting_barrel/proc/makeWine(obj/item/reagent_containers/food/snacks/grown/fruit)
	var/amount = fruit.seed.potency / 4
	if(fruit.distill_reagent)
		reagents.add_reagent(fruit.distill_reagent, amount)
	else
		var/data = list()
		data["names"] = list("[initial(fruit.name)]" = 1)
		data["color"] = fruit.filling_color
		data["boozepwr"] = fruit.wine_power
		if(fruit.wine_flavor)
			data["tastes"] = list(fruit.wine_flavor = 1)
		else
			data["tastes"] = list(fruit.tastes[1] = 1)
		reagents.add_reagent(/datum/reagent/consumable/ethanol/fruit_wine, amount, data)
	qdel(fruit)
	playsound(src, 'sound/effects/bubbles.ogg', 50, TRUE)

/obj/structure/fermenting_barrel/attackby(obj/item/I, mob/user, params)
	var/obj/item/reagent_containers/food/snacks/grown/fruit = I
	if(istype(fruit))
		if(!fruit.can_distill)
			to_chat(user, span_warning("You can't distill this into anything..."))
			return TRUE
		else if(!user.transferItemToLoc(I,src))
			to_chat(user, span_warning("[I] is stuck to your hand!"))
			return TRUE
		to_chat(user, span_notice("You place [I] into [src] to start the fermentation process."))
		addtimer(CALLBACK(src, PROC_REF(makeWine), fruit), rand(80, 120) * speed_multiplier)
		return TRUE
	var/obj/item/W = I
	if(W)
		if(W.is_refillable())
			return FALSE //so we can refill them via their afterattack.
	else
		return ..()

/obj/structure/fermenting_barrel/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	open = !open
	if(open)
		DISABLE_BITFIELD(reagents.reagents_holder_flags, DRAINABLE)
		ENABLE_BITFIELD(reagents.reagents_holder_flags, REFILLABLE)
		to_chat(user, span_notice("You open [src], letting you fill it."))
	else
		DISABLE_BITFIELD(reagents.reagents_holder_flags, REFILLABLE)
		ENABLE_BITFIELD(reagents.reagents_holder_flags, DRAINABLE)
		to_chat(user, span_notice("You close [src], letting you draw from its tap."))
	update_icon()

/obj/structure/fermenting_barrel/update_icon_state()
	if(open)
		icon_state = "barrel_open"
	else
		icon_state = "barrel"

/obj/structure/fermenting_barrel/steeldrum
	name = "steel drum"
	desc = "A large steel drum. You can ferment fruits and such inside it, or just use it to hold liquid."
	icon = 'icons/fallout/farming/farming_structures.dmi'
	icon_state = "single"

/obj/structure/fermenting_barrel/steeldrum/update_icon_state()
	if(open)
		icon_state = "single_open"
	else
		icon_state = "single"

/obj/structure/fermenting_barrel/tank
	name = "Empty Tank"
	desc = "A large tank used in the brewing of alcohol."
	icon = 'icons/fallout/farming/farming_structures.dmi'
	icon_state = "rainwater_tank"

/obj/structure/fermenting_barrel/tank/update_icon_state()
	if(open)
		icon_state = "rainwater_tank"
	else
		icon_state = "rainwater_tank"

/obj/structure/fermenting_barrel/vat
	name = "Mixing Vat"
	desc = "A large tank used in the brewing of alcohol."
	icon = 'icons/obj/atmospherics/pipes/pressure_tank.dmi'
	icon_state = "grey_map"

/obj/structure/fermenting_barrel/vat/update_icon_state()
	if(open)
		icon_state = "grey_map"
	else
		icon_state = "grey_map"

/obj/structure/fermenting_barrel/drum
	name = "Empty Drum"
	desc = "A large tank used in the brewing of alcohol."
	icon = 'icons/obj/objects.dmi'
	icon_state = "vat"

/obj/structure/fermenting_barrel/drum/update_icon_state()
	if(open)
		icon_state = "vat"
	else
		icon_state = "vat"

/obj/structure/fermenting_barrel/prison
	name = "Wine Toilet"
	desc = "A broken toilet repurposed for sweet, sweet booze."
	icon = 'icons/obj/watercloset.dmi'
	icon_state = "toilet00"

/obj/structure/fermenting_barrel/prison/update_icon_state()
	if(open)
		icon_state = "toilet10"
	else
		icon_state = "toilet00"

//////////
// LOOM //
//////////

///This is a loom. It's usually made out of wood and used to weave fabric like durathread or cotton into their respective cloth types.
/obj/structure/loom
	name = "loom"
	desc = "A simple device used to weave cloth and other thread-based fabrics together into usable material."
	icon = 'icons/fallout/farming/farming_structures.dmi'
	icon_state = "loom"
	density = TRUE
	anchored = TRUE
	proj_pass_rate = 90
	pass_flags = LETPASSTHROW
	pass_flags_self = PASSTABLE | LETPASSTHROW

/obj/structure/loom/attackby(obj/item/I, mob/user)
	if(weave(I, user))
		return
	return ..()

/obj/structure/loom/wrench_act(mob/living/user, obj/item/I)
	..()
	default_unfasten_wrench(user, I, 5)
	return TRUE

///Handles the weaving.
/obj/structure/loom/proc/weave(obj/item/stack/sheet/cotton/W, mob/user)
	if(!istype(W))
		return FALSE
	if(!anchored)
		user.show_message(SPAN_NOTICE("The loom needs to be wrenched down."), MSG_VISUAL)
		return FALSE
	if(W.amount < FABRIC_PER_SHEET)
		user.show_message(SPAN_NOTICE("You need at least [FABRIC_PER_SHEET] units of fabric before using this."), MSG_VISUAL)
		return FALSE
	user.show_message(SPAN_NOTICE("You start weaving \the [W.name] through the loom.."), MSG_VISUAL)
	if(W.use_tool(src, user, W.pull_effort))
		if(W.amount >= FABRIC_PER_SHEET)
			new W.loom_result(drop_location())
			W.use(FABRIC_PER_SHEET)
			user.show_message(SPAN_NOTICE("You weave \the [W.name] into a workable fabric."), MSG_VISUAL)
	return TRUE



/////////////////
// COMPOST BIN //
/////////////////

// Sprite exists for empty state, just not coded.
/obj/structure/reagent_dispensers/compostbin
	name = "compost bin"
	desc = "A smelly structure made of wooden slats where refuse is thrown. Dump unwanted seeds and produce in, pull usable compost out."
	icon = 'icons/fallout/farming/farming_structures.dmi'
	icon_state = "compostbin"
	anchored = TRUE
	reagent_id = /datum/reagent/compost
	proj_pass_rate = 50
	obj_integrity = 150
	pass_flags = LETPASSTHROW
	pass_flags_self = PASSTABLE | LETPASSTHROW
	climbable = TRUE
	var/seed_default_value = 4
	var/seed_to_compost_scale = 0.08 // Meaning average (50 potency) foods will give 4 compost
	var/produce_default_value = 10
	var/food_to_compost_scale = 0.2 // Meaning average (50 potency) foods will give 10 compost

/obj/structure/reagent_dispensers/compostbin/Initialize()
	. = ..()
	reagents.clear_reagents()
	reagents.add_reagent(reagent_id, 100)

/obj/structure/reagent_dispensers/compostbin/attackby(obj/item/W, mob/user, params)
	if(W.is_refillable())
		return 0 //so we can refill them via their afterattack.
	if(reagents.total_volume == tank_volume)
		to_chat(user,span_warning("The [src] is filled to capacity!"))
		return
	if(istype(W, /obj/item/seeds) || istype(W, /obj/item/reagent_containers/food/snacks/grown))
		if(user.transferItemToLoc(W, src))
			to_chat(user, span_notice("You load the [W] into the [src]."))
			playsound(loc, 'sound/effects/blobattack.ogg', 25, 1, -1)
			process_compost()
		else
			to_chat(user, span_warning("That's not compostable! Try organic foods instead."))
	else if(istype(W, /obj/item/storage/bag/plants))
		var/obj/item/storage/bag/plants/PB = W
		for(var/obj/item/G in PB.contents)// This check can be less than thorough because the bag has already authenticated the contents, hopefully
			if(SEND_SIGNAL(PB, COMSIG_TRY_STORAGE_TAKE, G, src))
				to_chat(user, span_info("You empty the [PB] into the [src]."))
				playsound(loc, 'sound/effects/blobattack.ogg', 25, 1, -1)
				process_compost()
	else if(istype(W, /obj/item/reagent_containers/food))
		var/obj/item/reagent_containers/food/F = W
		// Check if the food is good for compost
		if(CHECK_BITFIELD(F.foodtype, (GRAIN | FRUIT | VEGETABLES | PINEAPPLE)) && !CHECK_BITFIELD(F.foodtype, (MEAT | DAIRY | TOXIC)))
			if(user.transferItemToLoc(W, src))
				to_chat(user, span_notice("You load the [W] into the [src]."))
				playsound(loc, 'sound/effects/blobattack.ogg', 25, 1, -1)
				process_compost()
			else
				to_chat(user, span_warning("That's not compostable! Try organic foods instead."))
		else
			to_chat(user, span_warning("That's not compostable! Try organic foods instead."))

/obj/structure/reagent_dispensers/compostbin/proc/process_compost()
	for(var/obj/item/C in contents)
		if(istype(C, /obj/item/seeds))
			var/obj/item/seeds/S = C
			reagents.add_reagent(/datum/reagent/compost, S.potency ? S.potency * seed_to_compost_scale : seed_default_value)
		else if(istype(C, /obj/item/reagent_containers/food/snacks/grown))
			var/obj/item/reagent_containers/food/snacks/grown/G = C
			reagents.add_reagent(/datum/reagent/compost, G.seed ? G.seed.potency * food_to_compost_scale : produce_default_value)
		else if(istype(C, /obj/item/reagent_containers/food))
			if(istype(C, /obj/item/reagent_containers/food/snacks))
				var/obj/item/reagent_containers/food/snacks/S = C
				if(S.trash)
					S.generate_trash(loc)
			var/obj/item/reagent_containers/food/F = C
			reagents.add_reagent(/datum/reagent/compost, F.food_quality * food_to_compost_scale)
		qdel(C)


////////////////////
// RAINWATER TANK //
////////////////////  - Just an alternative for mapping without reusing the well for the millionth time, or magical sinks. In magical fairy land it will be coded that it refills when rain weather occurs.

/obj/structure/reagent_dispensers/rainwater_tank
	name = "rainwater tank"
	desc = "A huge metal tank with a tap on the front. Rainwater is collected on larger surfaces then poured into a tank like this for storage."
	icon = 'icons/fallout/farming/farming_structures.dmi'
	icon_state = "rainwater_tank"
	anchored = TRUE


////////////////////
// SEED EXTRACTOR //
////////////////////

/obj/structure/legion_extractor
	name = "seed grinder"
	desc = "A crude grinding machine repurposed from kitchen appliances. Plants go in, seeds come out."
	icon = 'icons/fallout/farming/farming_structures.dmi'
	icon_state = "sextractor_manual"
	density = FALSE
	anchored = TRUE
	proj_pass_rate = 95
	pass_flags = LETPASSTHROW
	pass_flags_self = PASSTABLE | LETPASSTHROW

/obj/structure/legion_extractor/proc/seedify(obj/item/O, t_max, obj/structure/legion_extractor/extractor, mob/living/user)
	var/t_amount = 0
	var/list/seeds = list()
	if(t_max == -1)
		t_max = rand(1,2) //Slightly worse than the actual thing

	var/seedloc = O.loc
	if(extractor)
		seedloc = extractor.loc

	if(istype(O, /obj/item/reagent_containers/food/snacks/grown/))
		var/obj/item/reagent_containers/food/snacks/grown/F = O
		if(F.seed)
			if(user && !user.temporarilyRemoveItemFromInventory(O)) //couldn't drop the item
				return
			while(t_amount < t_max)
				var/obj/item/seeds/t_prod = F.seed.Copy()
				seeds.Add(t_prod)
				t_prod.forceMove(seedloc)
				t_amount++
			qdel(O)
			return seeds

	else if(istype(O, /obj/item/grown))
		var/obj/item/grown/F = O
		if(F.seed)
			if(user && !user.temporarilyRemoveItemFromInventory(O))
				return
			while(t_amount < t_max)
				var/obj/item/seeds/t_prod = F.seed.Copy()
				t_prod.forceMove(seedloc)
				t_amount++
			qdel(O)
		return 1

	return 0

/obj/structure/legion_extractor/attackby(obj/item/O, mob/user, params)

	if(default_unfasten_wrench(user, O)) //So we can move them around
		return

	else if(seedify(O,-1, src, user))
		to_chat(user, SPAN_NOTICE("You extract some seeds."))
		return
	else if(user.a_intent != INTENT_HARM)
		to_chat(user, SPAN_WARNING("You can't extract any seeds from \the [O.name]!"))
	else
		return ..()

#undef FABRIC_PER_SHEET
#undef SPAN_WARNING
#undef SPAN_NOTICE
