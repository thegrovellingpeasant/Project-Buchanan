//******Decoration objects
//***Bone statues and giant skeleton parts.
/obj/structure/statue/bone
	anchored = TRUE
	max_integrity = 120
	material_drop_type = /obj/item/stack/sheet/bone
	impressiveness = 18 // Carved from the bones of a massive creature, it's going to be a specticle to say the least
	layer = ABOVE_ALL_MOB_LAYER

/obj/structure/statue/bone/rib
	name = "collosal rib"
	desc = "It's staggering to think that something this big could have lived, let alone died."
	oreAmount = 4
	icon = 'icons/obj/statuelarge.dmi'
	icon_state = "rib"
	layer = VISIBLE_FROM_ABOVE_LAYER
	var/mutable_appearance/riboverlay

/obj/structure/statue/bone/rib/Initialize()
	. = ..()
	riboverlay = mutable_appearance(icon, "[icon_state]overlay", ABOVE_ALL_MOB_LAYER)
	add_overlay(riboverlay)

/obj/structure/statue/bone/megalith
	name = "megalith"
	desc = "You see nothing out of the ordinary."
	oreAmount = 4
	icon = 'icons/obj/statuelarge.dmi'
	icon_state = "rib"
	color = "#00ffee"
	layer = VISIBLE_FROM_ABOVE_LAYER
	var/mutable_appearance/megalithoverlay

/obj/structure/statue/bone/megalith/Initialize()
	. = ..()
	megalithoverlay = mutable_appearance(icon, "[icon_state]overlay", ABOVE_ALL_MOB_LAYER)
	add_overlay(megalithoverlay)

/obj/structure/statue/bone/skull
	name = "collosal skull"
	desc = "The gaping maw of a dead, titanic monster."
	oreAmount = 12
	icon = 'icons/obj/statuelarge.dmi'
	icon_state = "skull"
	var/mutable_appearance/mastodonoverlay

/obj/structure/statue/bone/skull/Initialize()
	. = ..()
	mastodonoverlay = mutable_appearance(icon, "[icon_state]overlay", ABOVE_ALL_MOB_LAYER)
	add_overlay(mastodonoverlay)


/obj/structure/statue/bone/skull/half
	desc = "The gaping maw of a dead, titanic monster. This one is cracked in half."
	oreAmount = 6
	icon = 'icons/obj/statuelarge.dmi'
	icon_state = "skull-half"

//***Wasteland floor and rock turfs here.
/turf/open/floor/plating/asteroid/basalt/wasteland //Like a more fun version of living in Arizona.
	name = "cracked earth"
	icon = 'icons/turf/floors.dmi'
	icon_state = "wasteland"
	environment_type = "wasteland"
	baseturfs = /turf/open/floor/plating/asteroid/basalt/wasteland
	digResult = /obj/item/stack/ore/glass/basalt
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	slowdown = 0.5
	floor_variance = 30

/turf/open/floor/plating/asteroid/basalt/wasteland/Initialize()
	.=..()
	if(prob(floor_variance))
		icon_state = "[environment_type][rand(0,6)]"

/turf/closed/mineral/strong/wasteland
	name = "ancient dry rock"
	color = "#B5651D"
	environment_type = "wasteland"
	turf_type = /turf/open/floor/plating/asteroid/basalt/wasteland
	baseturfs = /turf/open/floor/plating/asteroid/basalt/wasteland
	smooth_icon = 'icons/turf/walls/rock_wall.dmi'

/turf/closed/mineral/strong/wasteland/drop_ores()
	if(prob(10))
		new /obj/item/stack/ore/iron(src, 1)
		new /obj/item/stack/ore/glass(src, 1)
		new /obj/effect/decal/remains/human/grave(src, 1)
	else
		new /obj/item/stack/sheet/bone(src, 1)

//***Oil well puddles.
/obj/structure/sink/oil_well	//You're not going to enjoy bathing in this...
	name = "oil well"
	desc = "A bubbling pool of oil.This would probably be valuable, had bluespace technology not destroyed the need for fossil fuels 200 years ago."
	icon = 'icons/obj/watercloset.dmi'
	icon_state = "puddle-oil"
	dispensedreagent = /datum/reagent/oil

/obj/structure/sink/oil_well/Initialize()
	.=..()
	create_reagents(20)
	reagents.add_reagent(dispensedreagent, 20)

/obj/structure/sink/oil_well/on_attack_hand(mob/M)
	flick("puddle-oil-splash",src)
	reagents.reaction(M, TOUCH, 20) //Covers target in 20u of oil.
	to_chat(M, "<span class='notice'>You touch the pool of oil, only to get oil all over yourself. It would be wise to wash this off with water.</span>")

/obj/structure/sink/oil_well/attackby(obj/item/O, mob/user, params)
	flick("puddle-oil-splash",src)
	if(O.tool_behaviour == TOOL_SHOVEL && !(flags_1&NODECONSTRUCT_1)) //attempt to deconstruct the puddle with a shovel
		to_chat(user, "You fill in the oil well with soil.")
		O.play_tool_sound(src)
		deconstruct()
		return 1
	if(istype(O, /obj/item/reagent_containers)) //Refilling bottles with oil
		var/obj/item/reagent_containers/RG = O
		if(RG.is_refillable())
			if(!RG.reagents.holder_full())
				RG.reagents.add_reagent(dispensedreagent, min(RG.volume - RG.reagents.total_volume, RG.amount_per_transfer_from_this))
				to_chat(user, "<span class='notice'>You fill [RG] from [src].</span>")
				return TRUE
			to_chat(user, "<span class='notice'>\The [RG] is full.</span>")
			return FALSE
	if(user.a_intent != INTENT_HARM)
		to_chat(user, "<span class='notice'>You won't have any luck getting \the [O] out if you drop it in the oil.</span>")
		return 1
	else
		return ..()

/obj/structure/sink/oil_well/drop_materials()
	new /obj/effect/decal/cleanable/oil(loc)

//***Grave mounds.
/obj/structure/closet/crate/grave
	name = "burial mound"
	desc = "An marked patch of soil, showing signs of a burial long ago. You wouldn't disturb a grave... right?"
	icon = 'icons/obj/crates.dmi'
	icon_state = "grave"
	dense_when_open = TRUE
	material_drop = /obj/item/stack/ore/glass/basalt
	material_drop_amount = 5
	anchorable = FALSE
	anchored = TRUE
	locked = TRUE
	breakout_time = 900
	cutting_tool = /obj/item/shovel
	var/lead_tomb = FALSE
	var/first_open = FALSE

/obj/structure/closet/crate/grave/PopulateContents()  //GRAVEROBBING IS NOW A FEATURE
	..()
	new /obj/effect/decal/remains/human/grave(src)
	switch(rand(1,8))
		if(1)
			new /obj/item/coin/gold(src)
			new /obj/item/storage/wallet(src)
		if(2)
			new /obj/item/clothing/glasses/meson(src)
		if(3)
			new /obj/item/coin/silver(src)
			new /obj/item/shovel/spade(src)
		if(4)
			new /obj/item/storage/book/bible/booze(src)
		if(5)
			new /obj/item/clothing/neck/stethoscope(src)
			new	/obj/item/scalpel(src)
			new /obj/item/hemostat(src)

		if(6)
			new /obj/item/reagent_containers/glass/beaker(src)
			new /obj/item/clothing/glasses/science(src)
		if(7)
			new /obj/item/clothing/glasses/sunglasses(src)
			new /obj/item/clothing/mask/cigarette/rollie(src)
		else
			return

/obj/structure/closet/crate/grave/open(mob/living/user, obj/item/S)
	if(!opened)
		to_chat(user, "<span class='notice'>The ground here is too hard to dig up with your bare hands. You'll need a shovel.</span>")
	else
		to_chat(user, "<span class='notice'>The grave has already been dug up.</span>")

/obj/structure/closet/crate/grave/tool_interact(obj/item/S, mob/living/carbon/user)
	if(user.a_intent == INTENT_HELP) //checks to attempt to dig the grave, must be done on help intent only.
		if(!opened)
			if(istype(S,cutting_tool) && S.tool_behaviour == TOOL_SHOVEL)
				to_chat(user, "<span class='notice'>You start start to dig open \the [src]  with \the [S]...</span>")
				if (do_after(user,20, target = src))
					opened = TRUE
					locked = TRUE
					dump_contents()
					update_icon()
					SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "graverobbing", /datum/mood_event/graverobbing)
					if(lead_tomb == TRUE && first_open == TRUE)
						user.gain_trauma(/datum/brain_trauma/magic/stalker)
						to_chat(user, "<span class='boldwarning'>Oh no, no no no, THEY'RE EVERYWHERE! EVERY ONE OF THEM IS EVERYWHERE!</span>")
						first_open = FALSE
					return 1
				return 1
			else
				to_chat(user, "<span class='notice'>You can't dig up a grave with \the [S.name].</span>")
				return 1
		else
			to_chat(user, "<span class='notice'>The grave has already been dug up.</span>")
			return 1

	else if((user.a_intent != INTENT_HELP) && opened) //checks to attempt to remove the grave entirely.
		if(istype(S,cutting_tool) && S.tool_behaviour == TOOL_SHOVEL)
			to_chat(user, "<span class='notice'>You start to remove \the [src]  with \the [S].</span>")
			if (do_after(user,15, target = src))
				to_chat(user, "<span class='notice'>You remove \the [src]  completely.</span>")
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "graverobbing", /datum/mood_event/graverobbing)
				deconstruct(TRUE)
				return 1
	return

/obj/structure/closet/crate/grave/bust_open()
	..()
	opened = TRUE
	update_icon()
	dump_contents()
	return

/obj/structure/closet/crate/grave/lead_researcher
	name = "ominous burial mound"
	desc = "Even in a place filled to the brim with graves, this one shows a level of preperation and planning that fills you with dread."
	icon = 'icons/obj/crates.dmi'
	icon_state = "grave_lead"
	lead_tomb = TRUE
	first_open = TRUE

/obj/structure/closet/crate/grave/lead_researcher/PopulateContents()  //ADVANCED GRAVEROBBING
	..()
	new /obj/effect/decal/cleanable/blood/gibs/old(src)
	new /obj/item/book/granter/crafting_recipe/boneyard_notes(src)

/obj/effect/decal/remains/human/grave
	turf_loc_check = FALSE

/obj/item/book/granter/crafting_recipe/boneyard_notes
	name = "The Complete Works of Lavaland Bone Architecture"
	desc = "Pried from the lead  Archaeologist's cold, dead hands, this seems to explain how ancient bone architecture was erected long ago."
//	crafting_recipe_types = list(/datum/crafting_recipe/rib, /datum/crafting_recipe/boneshovel, /datum/crafting_recipe/halfskull, /datum/crafting_recipe/skull)
	icon = 'icons/obj/library.dmi'
	icon_state = "boneworking_learing"
	oneuse = FALSE
	remarks = list("Who knew you could bend bones that far back?", "I guess that was much easier before the planet heated up...", "So that's how they made those ruins survive the ashstorms. Neat!", "The page is just filled with insane ramblings about some 'legion' thing.", "But why would they need vinegar to polish the bones? And rags too?", "You spend a few moments cleaning dirt and blood off of the page, yeesh.")


//***Fluff items for lore/intrigue
/obj/item/paper/crumpled/muddy/fluff/elephant_graveyard
	name = "posted warning"
	desc = "It seems to be smudged with mud and... oil?"
	info = "<B>TO WHOM IT MAY CONCERN</B><BR><BR>This area is property of the Nanotrasen Mining Division.<BR><BR>Trespassing in this area is illegal, highly dangerous, and subject to several NDAs.<br><br>Please turn back now, under intergalactic law section 48-R."

/obj/item/paper/crumpled/muddy/fluff/elephant_graveyard/rnd_notes
	name = "Research Findings: Day 26"
	desc = "Huh, this one page looks like it was torn out of a full book. How odd."
	icon_state = "docs_part"
	info = "<b>Researcher name:</b> B--*--* J--*s.<BR><BR>Detailed findings:<i>Today the camp site's cond-tion has wor--ene*. The ashst--ms keep blocking us off from le-ving the sit* for m-re supplies, and it's lo-king like we're out of pl*sma to p-wer the ge-erat*r. Can't rea-*y study c-*bon *ating with no li--ts, ya know? Da-*y's been going -*f again and ag-*n a-*ut h*w the company's left us to *ie here, but I j-s* keep tell-ng him to stop che*-in* out these damn graves. We m-y b*  archaeologists, but -e sho*ld have t-e dec-**cy to know these grav-s are *-l NEW.</i><BR><BR><b>The rest of the page is just semantics about carbon dating methods.</b>"

/obj/item/paper/crumpled/muddy/fluff/elephant_graveyard/mutiny
	name = "hastily scribbled note"
	desc = "Seems like someone was in a hurry."
	info = "Alright, we all know that stuck up son a bitch is just doing this to keep us satisifed. Who the hell does he think he is, taking extra rations? We're OUT OF FOOD, CARL. Tomorrow at noon, we're going to try and take the ship by force. He HAS to be lying about the engine cooling down. He HAS TO BE. I'm tellin ya, with this implant I lifted off that last supply ship, I got the smarts to get us offa this shithole. Keep your knife handy carl."

/obj/item/paper/fluff/ruins/elephant_graveyard/hypothesis
	name = "research document"
	desc = "Standard Nanotrasen typeface for important research documents."
	info = "<b>Day 9: Tenative Conclusions</b><BR><BR>While the area appears to be of significant cultural importance to the lizard race, outside of some sparce contact with native wildlife, we're yet to find any exact reasoning for the nature of this phenomenon. It seems that organic life is communally drawn to this planet as though it functions as a final resting place for intelligent life. As per company guidelines, this site shall be given the following classification: 'LZ-0271 - Elephant Graveyard' <BR><BR><u>Compiled list of Artifact findings (Currently Sent Offsite)</u><BR>Cultist Blade Fragments: x8<BR>Brass Multiplicative Ore Sample: x105<BR>Syndicate Revolutionary Leader Implant (Broken) x1<BR>Extinct Cortical Borer Tissue Sample x1<BR>Space Carp Fossil x3"

/obj/item/paper/fluff/ruins/elephant_graveyard/final_message
	name = "important looking Note"
	desc = "This note is well written, and seems to have been put here so you'd find it."
	info = "If you find this... you don't need to know who I am.<BR><BR>You need to leave this place. I dunno what shit they did to me out here, but I don't think I'm going to be making it out of here.<BR><BR>This place... it wears down your psyche. The other researchers out here laughed it off but... They were the first to go.<BR><BR>One by one they started turning on each other. The more they found out, the more they started fighting and arguing...<BR>As I speak now, I had to... I wound up having to put most of my men down. I know what I had to do, and I know there's no way left for me to live with myself.<BR> If anyone ever finds this, just don't touch the graves.<BR><BR>DO NOT. TOUCH. THE GRAVES. Don't be a dumbass, like we all were."


/obj/structure/closet/crate/grave/ark
	name = "The Ark"
	desc = "It looks like it could be opened with the right crowbar..."
	icon = 'icons/obj/crates.dmi'
	icon_state = "ark"
	dense_when_open = TRUE
	material_drop = /obj/item/stack/ore/glass/basalt
	material_drop_amount = 5
	anchored = FALSE
	anchorable = FALSE
	drag_delay = 0.2 SECONDS
	locked = TRUE
	breakout_time = 900
	cutting_tool = /obj/item/crowbar/abductor/heist
	resistance_flags = FIRE_PROOF | ACID_PROOF | UNACIDABLE | FREEZE_PROOF | INDESTRUCTIBLE
	var/shock_per_touch = 0
	var/shock_type = /datum/chemical_reaction/reagent_explosion/teslium_lightning

/obj/structure/closet/crate/grave/ark/tool_interact(obj/item/I, mob/living/carbon/user)
	. = ..()

	if(prob(50))
		tesla_zap(user, 4, 8000, ZAP_MOB_DAMAGE | ZAP_OBJ_DAMAGE | ZAP_MOB_STUN)
		playsound(user, 'sound/machines/defib_zap.ogg', 50, TRUE)

	switch(rand(1,2))
		if(1)
			//Instrinct Resistance
			to_chat(user, "<span class='notice'>You feel robust.</span>")
			var/datum/species/S// = user.dna.species
			S.brutemod *= 0.5
			S.burnmod *= 0.5
			S.coldmod *= 0.5
		if(2)
		//	new /mob/living/simple_animal/hostile/megafauna/watcher(get_turf(src))
		else
			return


/obj/structure/closet/crate/grave/strangebird
	name = "The Bird"
	desc = "It looks like it could be opened with the right crowbar..."
	icon = 'icons/obj/crates.dmi'
	icon_state = "bird"
	dense_when_open = TRUE
	material_drop = /obj/item/stack/ore/glass/basalt
	material_drop_amount = 5
	anchored = FALSE
	anchorable = FALSE
	drag_delay = 0.2 SECONDS
	locked = TRUE
	breakout_time = 900
	cutting_tool = /obj/item/crowbar/abductor/heist
	resistance_flags = FIRE_PROOF | ACID_PROOF | UNACIDABLE | FREEZE_PROOF | INDESTRUCTIBLE

/obj/structure/closet/crate/grave/strangebird/tool_interact(obj/item/S, mob/living/carbon/user)
	. = ..()
	if(prob(50))
		do_sparks(3, TRUE, src)
		for(var/i in 1 to 3)
		addtimer(CALLBACK(src, PROC_REF(self_destruct)), 2 SECONDS)
		return ..()

	switch(rand(1,3))
		if(1)
			new /obj/item/gun/ballistic/automatic/smg/tommygun(src)
			new /obj/item/ammo_box/magazine/tommygunm45(src)
			new /obj/item/ammo_box/magazine/tommygunm45(src)
		if(2)
			new /obj/item/stack/f13Cash/ncr/fivezerozero(src)
			new /obj/item/stack/f13Cash/ncr/fivezerozero(src)
			new /obj/item/stack/f13Cash/ncr/fivezerozero(src)
		if(3)
			new /obj/item/gun/ballistic/shotgun/automatic/combat/neostead(src)
			new /obj/item/ammo_box/shotgun/incendiary(src)
			new /obj/item/ammo_box/shotgun/trainshot(src)
		else
			return

/obj/structure/closet/crate/grave/strangebird/proc/self_destruct()
    explosion(src,5,5,6,6)

/obj/structure/closet/crate/grave/experimental_crate
	name = "The Prototype"
	desc = "It looks like it could be opened with the right crowbar..."
	icon = 'icons/obj/crates.dmi'
	icon_state = "prototype"
	dense_when_open = TRUE
	material_drop = /obj/item/stack/ore/glass/basalt
	material_drop_amount = 5
	anchored = FALSE
	anchorable = FALSE
	drag_delay = 0.2 SECONDS
	locked = TRUE
	breakout_time = 900
	cutting_tool = /obj/item/crowbar/abductor/heist
	resistance_flags = FIRE_PROOF | ACID_PROOF | UNACIDABLE | FREEZE_PROOF | INDESTRUCTIBLE

/obj/structure/closet/crate/grave/experimental_crate/tool_interact(obj/item/S, mob/living/carbon/user)
	. = ..()
	if(prob(50))
		do_sparks(3, TRUE, src)
		for(var/i in 1 to 3)
		addtimer(CALLBACK(src, PROC_REF(self_destruct)), 2 SECONDS)
		return ..()

	switch(rand(1,3))
		if(1)
			new /obj/item/clothing/suit/armor/f13/power_armor/advanced(src)
			new /obj/item/clothing/head/helmet/f13/power_armor/advanced(src)
			new /obj/item/book/granter/trait/pa_wear(src)
		if(2)
			new /obj/item/reagent_containers/glass/bottle/FEV_solution(src)
			new /obj/item/reagent_containers/glass/bottle/FEV_solution/two(src)

		if(3)
			new /obj/item/gun/energy/laser/aer14(src)
			new /obj/item/stock_parts/cell/ammo/mfc(src)
			new /obj/item/stock_parts/cell/ammo/mfc(src)
		else
			return

/obj/structure/closet/crate/grave/experimental_crate/proc/self_destruct()
    explosion(src,5,5,6,6)
