/obj/structure/sign/barsign // All Signs are 64 by 64 pixels, though most of them are made to fit 64 x 32 and only take the two lowermost tiles.
	name = "Bar Sign"
	desc = "A bar sign with no writing on it."
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "empty"
	req_access = list(ACCESS_BAR)
	max_integrity = 500
	integrity_failure = 0.5
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 100, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	buildable_sign = FALSE
	light_system = MOVABLE_LIGHT
	light_range = 20
	light_color = "#a8a582"
	light_on = FALSE
	var/list/barsigns=list()
	var/panel_open = FALSE

/obj/structure/sign/barsign/Initialize()
	. = ..()
	GLOB.barsigns += src

//filling the barsigns list
	for(var/bartype in subtypesof(/datum/barsign))
		var/datum/barsign/signinfo = new bartype
		if(!signinfo.hidden)
			barsigns += signinfo

//randomly assigning a sign
	set_sign(pick(barsigns))

/obj/structure/sign/barsign/proc/set_sign(datum/barsign/sign)
	if(!istype(sign))
		return
	icon_state = sign.icon
	name = sign.name
	if(sign.desc)
		desc = sign.desc
	else
		desc = "It displays \"[name]\"."

/obj/structure/sign/barsign/obj_break(damage_flag)
	if(!broken && !(flags_1 & NODECONSTRUCT_1))
		broken = TRUE

/obj/structure/sign/barsign/deconstruct(disassembled = TRUE)
	new /obj/item/stack/sheet/metal (loc, 2)
	new /obj/item/stack/cable_coil (loc, 2)
	qdel(src)

/obj/structure/sign/barsign/play_attack_sound(damage_amount, damage_type = BRUTE, damage_flag = 0)
	switch(damage_type)
		if(BRUTE)
			playsound(src.loc, 'sound/effects/glasshit.ogg', 75, 1)
		if(BURN)
			playsound(src.loc, 'sound/items/welder.ogg', 100, 1)

/obj/structure/sign/barsign/attack_ai(mob/user)
	return attack_hand(user)

/obj/structure/sign/barsign/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(!allowed(user))
		to_chat(user, "<span class='info'>Access denied.</span>")
		return
	if (broken)
		to_chat(user, "<span class ='danger'>The controls seem unresponsive.</span>")
		return
	pick_sign(user)

/obj/structure/sign/barsign/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/screwdriver))
		if(!allowed(user))
			to_chat(user, "<span class='info'>Access denied.</span>")
			return
		if(!panel_open)
			to_chat(user, "<span class='notice'>You open the maintenance panel.</span>")
			set_sign(new /datum/barsign/hiddensigns/signoff)
			panel_open = TRUE
		else
			to_chat(user, "<span class='notice'>You close the maintenance panel.</span>")
			if(!broken && !(obj_flags & EMAGGED))
				set_sign(pick(barsigns))
			else if(obj_flags & EMAGGED)
				set_sign(new /datum/barsign/hiddensigns/syndibarsign)
			else
				set_sign(new /datum/barsign/hiddensigns/empbarsign)
			panel_open = FALSE

	else if(istype(I, /obj/item/stack/cable_coil) && panel_open)
		if(obj_flags & EMAGGED) //Emagged, not broken by EMP
			to_chat(user, "<span class='warning'>Sign has been damaged beyond repair!</span>")
			return
		else if(!broken)
			to_chat(user, "<span class='warning'>This sign is functioning properly!</span>")
			return

		if(I.use_tool(src, user, 0, 2))
			to_chat(user, "<span class='notice'>You replace the burnt wiring.</span>")
			broken = FALSE
		else
			to_chat(user, "<span class='warning'>You need at least two lengths of cable!</span>")
	else
		return ..()


/obj/structure/sign/barsign/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	set_sign(new /datum/barsign/hiddensigns/empbarsign)
	broken = TRUE

/obj/structure/sign/barsign/emag_act(mob/user)
	. = ..()
	if(broken || (obj_flags & EMAGGED))
		to_chat(user, "<span class='warning'>Nothing interesting happens!</span>")
		return
	obj_flags |= EMAGGED
	to_chat(user, "<span class='notice'>You emag the barsign. Takeover in progress...</span>")
	addtimer(CALLBACK(src, PROC_REF(syndie_bar_good)), 10 SECONDS)
	return TRUE

/obj/structure/sign/barsign/proc/syndie_bar_good()
	set_sign(new /datum/barsign/hiddensigns/syndibarsign)
	req_access = list(ACCESS_SYNDICATE)


/obj/structure/sign/barsign/proc/pick_sign(mob/user)
	var/picked_name = input(user, "Available Signage", "Bar Sign", name) as null|anything in barsigns
	if(!picked_name)
		return
	set_sign(picked_name)

/obj/structure/sign/reno/barsign/sharkclub
	name = "Shark Club"
	desc = "The Shark Club is a casino located in New Reno on Second Street, owned by the Bishop family. It is the largest casino in New Reno."
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "sharkclub"

/obj/structure/sign/reno/barsign/divorce
	name = "24/7 Divorce"
	desc = "Modern divorce, for the modern couple."
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "divorce"

/obj/structure/sign/reno/barsign/catspaw
	name = "Cat's Paw"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "catspaw"
	desc = "Once a good place to catch a venereal disease. Now, under NCR law, just a cheap hotel."

/obj/structure/sign/reno/barsign/newrenoarms
	name = "New Reno Arms"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "newrenoarms"
	desc = "The infamous previously independent firearms vendor of Reno. In recent times it came under the racket of the Wright Family."

/obj/structure/sign/reno/barsign/rpd
	name = "Reno Police Department"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "rpd"
	desc = "The old corpse of the Desperado turned into a court and police department."

/obj/structure/sign/reno/barsign/goldenglobes
	name = "Golden Globes"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "goldenglobes"
	desc = "Once New Reno's main cultural export, now forced to find new programming in accordance with NCR law."

/obj/structure/sign/reno/barsign/motel
	name = "motel"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "motel"
	desc = "This seems to be some sort of hotel for motor vehicles...."

/obj/structure/sign/reno/barsign/cafe
	name = "cafe"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "cafe"
	desc = "An elegant man sipping on a cup of....something"

/obj/structure/sign/reno/barsign/junglegym
	name = "jungle gym"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "junglegym"
	desc = "A large glowing weight, this place has been known for its game show fights."

/obj/structure/sign/reno/barsign/liquor
	name = "liquor store sign"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "liquor"
	desc = "The most convenient way of stocking up on booze, or it was at least."

/obj/structure/sign/reno/barsign/train
	name = "Train station"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "train"
	desc = "Don't want to be late..."

/obj/structure/sign/reno/barsign/renowok
	name = "Reno Wok"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "renowok"
	desc = "A place of noodles clearly..."

/obj/structure/sign/reno/barsign/renovangraffs
	name = "Atomic Blast"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "atomicblast"
	desc = "The home of the Van Graffs. It smells faintly of smoke."

/obj/structure/sign/reno/barsign/renobank
	name = "Commonwealth Savings & Loans"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "bank"
	desc = "The Southwest Commonwealth's most trusted bank. With its redundant security systems, maybe the vault is still intact?"

/obj/structure/sign/reno/barsign/renocrop
	name = "Mizpah Cropshare"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "mizpah"
	desc = "New Reno's most idealistic community."

/obj/structure/sign/reno/barsign/renoshare
	name = "Mizpah Cropshare"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "cropshare"
	desc = "New Reno's most idealistic community."

/obj/structure/sign/reno/barsign/girlsgirlsgirls
	name = "Girls Girls Girls"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "girlsgirlsgirls"
	desc = "A very warm welcome to town."
	light_system = MOVABLE_LIGHT
	light_range = 30
	light_color = "#a8a582"
	light_on = FALSE

/obj/structure/sign/reno/barsign/booze
	name = "Booze sign"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "booze"
	desc = "The city known for its excess has all the booze you could ever need, steadfastly provided by the Wright family for generations."

/obj/structure/sign/reno/barsign/slots
	name = "Slots sign"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "slots"
	desc = "New Reno, the original New Vegas. Enjoy gambling at the Shark Club 24/7."

/obj/structure/sign/reno/barsign/subway
	name = "Subway Map"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "subwayred"
	desc = "A guide to the subway stations and routes in this part of Reno."

/obj/structure/sign/reno/barsign/interstate80
	name = "Interstate 80 roadsign"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "Interstate80"
	desc = "An old Interstate 80 sign, marking the city's placement on the famous road."

/obj/structure/sign/reno/barsign/dames
	name = "Dames sign"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "dames"
	desc = "There's probably women somewhere here..."

/obj/structure/sign/reno/barsign/beer
	name = "Beer sign"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "beer"
	desc = "Drink up!"

/obj/structure/sign/reno/barsign/desperado
	name = "desperado"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "desperado"
	desc = "The Desperado was one of the major points of power in New Reno and stayed as such under new management."

/obj/structure/sign/reno/barsign/varos
	name = "varo's sign"
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "varos"
	desc = "A postwar sign made, however it's not so shabby."

/obj/structure/sign/reno/barsign/sharkclub2
	name = "Shark Club sign"
	icon = 'icons/obj/renosigns.dmi'
	icon_state = "sharkclub"
	desc = "The Shark Club is a casino located in New Reno on Second Street, owned by the Bishop family. It is the largest casino in New Reno."

/obj/structure/sign/reno/barsign/oh
	name = "O.H."
	icon = 'icons/obj/renosigns.dmi'
	icon_state = "oh"
	desc = "A tropical themed sort of sign."

/obj/structure/sign/reno/barsign/oh/New()
	..()
	icon_state = pick("oh","oh2")

/obj/structure/sign/reno/barsign/xxx
	name = "XXX sign"
	icon = 'icons/obj/renosigns.dmi'
	icon_state = "xxx"
	desc = "A sign advertising things of a dubious, illict nature."

/obj/structure/sign/reno/barsign/heart
	name = "Crude Lady sign"
	icon = 'icons/obj/renosigns.dmi'
	icon_state = "heart1"
	desc = "An indecent sign."

/obj/structure/sign/reno/barsign/heart/New()
	..()
	icon_state = pick("heart1","heart2")

/obj/structure/sign/reno/barsign/pointed1
	name = "worn out poster"
	icon = 'icons/obj/renosigns.dmi'
	icon_state = "pointed1"
	desc = "Looks like the ink has been coming off."

//Code below is to define useless variables for datums. It errors without these



/datum/barsign
	var/name = "Name"
	var/icon = "Icon"
	var/desc = "desc"
	var/hidden = FALSE

//Anything below this is where all the specific signs are. If people want to add more signs, add them below.
/datum/barsign/maltesefalcon
	name = "Maltese Falcon"
	icon = "maltesefalcon"
	desc = "The Maltese Falcon, Space Bar and Grill."

/datum/barsign/thebark
	name = "The Bark"
	icon = "thebark"
	desc = "Ian's bar of choice."

/datum/barsign/harmbaton
	name = "The Harmbaton"
	icon = "theharmbaton"
	desc = "A great dining experience for both security members and assistants."

/datum/barsign/thesingulo
	name = "The Singulo"
	icon = "thesingulo"
	desc = "Where people go that'd rather not be called by their name."

/datum/barsign/thedrunkcarp
	name = "The Drunk Carp"
	icon = "thedrunkcarp"
	desc = "Don't drink and swim."

/datum/barsign/scotchservinwill
	name = "Scotch Servin Willy's"
	icon = "scotchservinwill"
	desc = "Willy sure moved up in the world from clown to bartender."

/datum/barsign/officerbeersky
	name = "Officer Beersky's"
	icon = "officerbeersky"
	desc = "Man eat a dong, these drinks are great."

/datum/barsign/thecavern
	name = "The Cavern"
	icon = "thecavern"
	desc = "Fine drinks while listening to some fine tunes."

/datum/barsign/theouterspess
	name = "The Outer Spess"
	icon = "theouterspess"
	desc = "This bar isn't actually located in outer space."

/datum/barsign/slipperyshots
	name = "Slippery Shots"
	icon = "slipperyshots"
	desc = "Slippery slope to drunkeness with our shots!"

/datum/barsign/thegreytide
	name = "The Grey Tide"
	icon = "thegreytide"
	desc = "Abandon your toolboxing ways and enjoy a lazy beer!"

/datum/barsign/honkednloaded
	name = "Honked 'n' Loaded"
	icon = "honkednloaded"
	desc = "Honk."

/datum/barsign/thenest
	name = "The Nest"
	icon = "thenest"
	desc = "A good place to retire for a drink after a long night of crime fighting."

/datum/barsign/littleredrock
	name = "Little Red Rock"
	icon = "littleredrock"
	desc = "In loving memory of those who died at Bitterpsrings. May we never forget."

/datum/barsign/thecoderbus
	name = "The Coderbus"
	icon = "thecoderbus"
	desc = "A very controversial bar known for its wide variety of constantly-changing drinks."

/datum/barsign/theadminbus
	name = "The Adminbus"
	icon = "theadminbus"
	desc = "An establishment visited mainly by space-judges. It isn't bombed nearly as much as court hearings."

/datum/barsign/oldcockinn
	name = "The Old Cock Inn"
	icon = "oldcockinn"
	desc = "Something about this sign fills you with despair."

/datum/barsign/thewretchedhive
	name = "The Wretched Hive"
	icon = "thewretchedhive"
	desc = "Legally obligated to instruct you to check your drinks for acid before consumption."

/datum/barsign/robustacafe
	name = "The Robusta Cafe"
	icon = "robustacafe"
	desc = "Holder of the 'Most Lethal Barfights' record 5 years uncontested."

/datum/barsign/emergencyrumparty
	name = "The Emergency Rum Party"
	icon = "emergencyrumparty"
	desc = "Recently relicensed after a long closure."

/datum/barsign/combocafe
	name = "The Combo Cafe"
	icon = "combocafe"
	desc = "Renowned system-wide for their utterly uncreative drink combinations."

/datum/barsign/vladssaladbar
	name = "Vlad's Salad Bar"
	icon = "vladssaladbar"
	desc = "Under new management. Vlad was always a bit too trigger happy with that shotgun."

/datum/barsign/theshaken
	name = "The Shaken"
	icon = "theshaken"
	desc = "This establishment does not serve stirred drinks."

/datum/barsign/thealenath
	name = "The Ale' Nath"
	icon = "thealenath"
	desc = "All right, buddy. I think you've had EI NATH. Time to get a cab."

/datum/barsign/thealohasnackbar
	name = "The Aloha Snackbar"
	icon = "alohasnackbar"
	desc = "A tasteful, inoffensive tiki bar sign."

/datum/barsign/thenet
	name = "The Net"
	icon = "thenet"
	desc = "You just seem to get caught up in it for hours."

/datum/barsign/maidcafe
	name = "Maid Cafe"
	icon = "maidcafe"
	desc = "Welcome back, master!"

/datum/barsign/the_lightbulb
	name = "The Lightbulb"
	icon = "the_lightbulb"
	desc = "A cafe popular among moths and moffs. Once shut down for a week after the bartender used mothballs to protect her spare uniforms."

/datum/barsign/cybersylph
	name = "Cyber Sylph's"
	icon = "cybersylph"
	desc = "A cafe renowed for its out-of-boundaries futuristic insignia."

/datum/barsign/meow_mix
	name = "Meow Mix"
	icon = "Meow Mix"
	desc = "No, we don't serve catnip, officer!"

/datum/barsign/the_hive
	name = "The Hive"
	icon = "thehive"
	desc = "Comb in for some sweet drinks! Not known for serving any sappy drink."

/datum/barsign/hiddensigns
	hidden = TRUE

//Hidden signs list below this point
/datum/barsign/hiddensigns/empbarsign
	name = "Haywire Barsign"
	icon = "empbarsign"
	desc = "Something has gone very wrong."

/datum/barsign/hiddensigns/syndibarsign
	name = "Syndi Cat Takeover"
	icon = "syndibarsign"
	desc = "Syndicate or die."

/datum/barsign/hiddensigns/signoff
	name = "Bar Sign"
	icon = "empty"
	desc = "This sign doesn't seem to be on."

/datum/barsign/sharkclub
	name = "Shark Club"
	icon = "sharkclub"
	desc = "The Shark Club is a casino located in New Reno on Second Street, owned by the Bishop family. It is the largest casino in New Reno."

/datum/barsign/divorce
	name = "24/7 Divorce"
	icon = "divorce"
	desc = "State of the art divorces around the clock. Modern divorce, for the modern couple."
