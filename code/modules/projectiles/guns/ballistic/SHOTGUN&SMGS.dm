





	///////////////////
//SUBMACHINE GUNS//
///////////////////




//American 180				Keywords: .22 LR, Automatic, 180 rounds
/obj/item/gun/ballistic/automatic/smg/american180
	name = "American 180"
	desc = "An integrally suppressed submachinegun chambered in the common .22 long rifle. Top loaded drum magazine."
	icon_state = "smg22"
	item_state = "shotgun"
	slowdown = 0.1
	recoil = 0.05
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/m22smg
	can_unsuppress = FALSE
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 1.75
	spread = 14
	extra_damage = 0
	suppressed = 1
	actions_types = null
	fire_sound = 'sound/f13weapons/american180.ogg'


//14mm SMG Keywords: 14mm, Automatic, 21 rounds
/obj/item/gun/ballistic/automatic/smg/smg14
	name = "14mm SMG"
	desc = "A heavy-duty SMG designed to tear through most forms of armor."
	icon_state = "14smg"
	item_state = "14toploader"
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/smg14
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 3
	spread = 7
	extra_damage = 0
	slowdown = 0.22
	recoil = 0.33
	can_attachments = TRUE
	can_suppress = FALSE
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'

//Greasegun				Keywords: 9mm, Automatic, 30 rounds
/obj/item/gun/ballistic/automatic/smg/greasegun
	name = "9mm submachine gun"
	desc = "An inexpensive submachine gun, chambered in 9mm. Very high rate of fire in bursts."
	icon_state = "grease_gun"
	item_state = "smg9mm"
	mag_type = /obj/item/ammo_box/magazine/greasegun
	spread = 13
	extra_damage = 0
	slowdown = 0.15
	recoil = 0.15
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.5
	spread = 14
	can_attachments = TRUE
	suppressor_state = "uzi_suppressor"
	suppressor_x_offset = 26
	suppressor_y_offset = 19
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/greasegun.ogg'

/obj/item/gun/ballistic/automatic/smg/greasegun/auto_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			automatic = 1
			spread = 14
			fire_delay = 3.25
			recoil = 0.15
			weapon_weight = WEAPON_HEAVY
			to_chat(user, "<span class='notice'>You switch to automatic fire.</span>")
			enable_burst()
		if(1)
			select = 0
			automatic = 0
			fire_delay = 3.25
			spread = 2
			weapon_weight = WEAPON_MEDIUM
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/smg/greasegun/worn
	name = "beat up 9mm submachine gun"
	desc = "What was once an inexpensive, but reliable submachine gun is now an inexpensive piece of poop. It's impressive this thing still fires at all."
	can_attachments = FALSE
	spread = 17
	recoil = 0.3
	extra_damage = 0

/obj/item/gun/ballistic/automatic/smg/greasegun/worn/auto_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			automatic = 1
			spread = 16.5
			fire_delay = 3.75
			recoil = 0.3
			weapon_weight = WEAPON_HEAVY
			to_chat(user, "<span class='notice'>You switch to automatic fire.</span>")
			enable_burst()
		if(1)
			select = 0
			automatic = 0
			fire_delay = 3.75
			spread = 2
			weapon_weight = WEAPON_HEAVY
			recoil = 0.2
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

//10mm SMG			Keywords: 10mm, Automatic, 12/24 rounds
/obj/item/gun/ballistic/automatic/smg/smg10mm
	name = "10mm submachine gun"
	desc = "One of the most common personal-defense weapons of the Great War, a sturdy and reliable open-bolt 10mm submachine gun."
	icon_state = "smg10mm"
	item_state = "smg10mm"
	icon_prefix = "smg10mm"
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv
	init_mag_type = /obj/item/ammo_box/magazine/m10mm_adv/ext
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.2
	spread = 8
	slowdown = 0.2
	extra_damage = 0
	recoil = 0.1
	fire_delay = 2
	can_attachments = TRUE
	suppressor_state = "10mm_suppressor" //activate if sprited
	suppressor_x_offset = 30
	suppressor_y_offset = 16
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/10mm_fire_03.ogg'

/obj/item/gun/ballistic/automatic/smg/smg10mm/worn
	name = "worn-out 10mm submachine gun"
	desc = "Mass-produced weapon from the Great War, this one has seen use ever since. Grip is wrapped in tape to keep the plastic from crumbling, the metals are oxidizing, but the gun still works."
	init_mag_type = /obj/item/ammo_box/magazine/m10mm_adv/ext
	worn_out = TRUE
	autofire_shot_delay = 2.7
	recoil = 0.25
	extra_damage = 0
	spread = 14

/obj/item/gun/ballistic/automatic/smg/smg10mm/auto_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			automatic = 1
			spread = 8
			fire_delay = 3.25
			recoil = 0.1
			weapon_weight = WEAPON_HEAVY
			to_chat(user, "<span class='notice'>You switch to automatic fire.</span>")
			enable_burst()
		if(1)
			select = 0
			automatic = 0
			fire_delay = 3.25
			spread = 2
			weapon_weight = WEAPON_MEDIUM
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return

//Uzi				Keywords: 9mm, Automatic, 32 rounds
/obj/item/gun/ballistic/automatic/smg/mini_uzi
	name = "Uzi"
	desc = "A lightweight, burst-fire submachine gun, for when you really want someone dead. Uses 9mm rounds."
	icon_state = "uzi"
	item_state = "uzi"
	mag_type = /obj/item/ammo_box/magazine/uzim9mm
	fire_delay = 3
	is_automatic = TRUE
	automatic = 1
	slowdown = 0.25
	autofire_shot_delay = 2
	spread = 18
	extra_damage = 0
	can_suppress = TRUE
	can_attachments = TRUE
	suppressor_state = "uzi_suppressor"
	suppressor_x_offset = 29
	suppressor_y_offset = 16
	actions_types = list(/datum/action/item_action/toggle_firemode)

/obj/item/gun/ballistic/automatic/smg/mini_uzi/auto_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			automatic = 1
			spread = 18
			fire_delay = 3
			recoil = 0.25
			weapon_weight = WEAPON_HEAVY
			to_chat(user, "<span class='notice'>You switch to automatic fire.</span>")
			enable_burst()
		if(1)
			select = 0
			automatic = 0
			fire_delay = 3
			spread = 3
			weapon_weight = WEAPON_MEDIUM
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return


//Carl Gustaf			Keywords: 10mm, Automatic, 36 rounds
/obj/item/gun/ballistic/automatic/smg/cg45
	name = "Carl Gustaf 10mm"
	desc = "Post-war submachine gun made in workshops in Phoenix, a copy of a simple old foreign design."
	icon_state = "cg45"
	item_state = "cg45"
	mag_type = /obj/item/ammo_box/magazine/cg45
	is_automatic = TRUE
	automatic = 1
	slowdown = 0.3
	autofire_shot_delay = 3
	spread = 14
	fire_delay = 4
	extra_damage = 0
	recoil = 0.1
	can_attachments = TRUE
	fire_sound = 'sound/f13weapons/10mm_fire_03.ogg'


//Tommygun			Keywords: .45 ACP, Automatic, 30/50 rounds.
/obj/item/gun/ballistic/automatic/smg/tommygun
	name = "Thompson SMG"
	desc = "A powerful submachinegun chambered in .45 ACP, this weapon fires at a blistering rate with a heavy pistol cartridge, and can accept very high capacity magazines, to boot."
	icon_state = "tommygun"
	item_state = "shotgun"
	slowdown = 0.2
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/tommygunm45
	init_mag_type = /obj/item/ammo_box/magazine/tommygunm45/stick
	fire_sound = 'sound/weapons/gunshot_smg.ogg'
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.25
	fire_delay = 3.75
	extra_damage = 0
	spread = 15
	recoil = 0.3

//White Legs Tommygun			Keywords: .45 ACP, Automatic, 30 rounds
/obj/item/gun/ballistic/automatic/smg/tommygun/whitelegs
	name = "Storm Drum"
	desc = "A recovered ancient Thompson from an armory far up North. Commonly used by raiders of the White Legs tribe."
	fire_delay = 3.75
	extra_damage = 0

//P90				Keywords: 10mm, Automatic, 50 rounds. Special modifiers: damage +1
/obj/item/gun/ballistic/automatic/smg/p90
	name = "FN P90c"
	desc = "The Fabrique Nationale P90c was just coming into use at the time of the war. The weapon's bullpup layout, and compact design, make it easy to control. The durable P90c is prized for its reliability, and high firepower in a ruggedly-compact package. Chambered in 10mm."
	icon_state = "p90"
	item_state = "m90"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/m10mm_p90
	extra_damage = 0
	slowdown = 0.1
	recoil = 0.2.5
	burst_size = 1
	fire_delay = 3
	spread = 12
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2
	can_suppress = TRUE
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 29
	suppressor_y_offset = 16
	fire_sound = 'sound/f13weapons/10mm_fire_03.ogg'

/obj/item/gun/ballistic/automatic/smg/p90/worn
	name = "Worn FN P90c"
	desc = "A FN P90 manufactured by Fabrique Nationale. This one is beat to hell but still works."
	autofire_shot_delay = 2.5
	spread = 16


//MP-5 SD				Keywords: 9mm, Automatic, 32 rounds, Suppressed
/obj/item/gun/ballistic/automatic/smg/mp5
	name = "MP-5 SD"
	desc = "An integrally suppressed submachinegun chambered in 9mm."
	icon_state = "mp5"
	item_state = "fnfal"
	mag_type = /obj/item/ammo_box/magazine/uzim9mm
	spread = 9
	fire_delay = 3
	slowdown = 0.25
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.3
	extra_damage = 0
	suppressed = 1
	recoil = 0
	can_attachments = TRUE
	can_suppress = FALSE
	can_unsuppress = FALSE
	fire_sound = 'sound/weapons/Gunshot_silenced.ogg'


//Ppsh-41				Keywords: 9mm, Automatic, 71 rounds.
/obj/item/gun/ballistic/automatic/smg/ppsh
	name = "Ppsh-41"
	desc = "An extremely fast firing, inaccurate submachine gun from World War 2. Low muzzle velocity. Uses 9mm rounds."
	icon_state = "pps"
	slowdown = 0.3
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/pps9mm
	spread = 20
	fire_delay = 4
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 1.9
	extra_damage = 0
	recoil = 0.4
	slowdown = 0.25
	can_attachments = TRUE
	can_scope = TRUE
	scope_state = "AEP7_scope"
	scope_x_offset = 9
	scope_y_offset = 21


``SHOTGUNS/PUMPSHOTGUNS/SPECIALSHOTGUNS``



//Shotgun bat											Keywords: Shotgun, 1 round internal, Extra damage +2, Melee damage
/obj/item/gun/ballistic/revolver/single_shotgun
	name = "shotgun bat"
	desc = "A baseball bat, a piece of pipe and a screwdriver is all you need to fire a shotgun shell apparantly. Good for whacking things once fired too."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "shotgunbat"
	item_state = "shotgunbat"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM
	mag_type = /obj/item/ammo_box/magazine/internal/shot/improvised
	force = 29
	recoil = 0.5
	fire_delay = 1
	extra_damage = 0
	fire_sound = 'sound/f13weapons/caravan_shotgun.ogg'

/obj/item/gun/ballistic/revolver/single_shotgun/update_icon_state()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"


//Caravan shotgun							Keywords: Shotgun, Double barrel, saw-off, extra damage +1
/obj/item/gun/ballistic/revolver/caravan_shotgun
	name = "caravan shotgun"
	desc = "An common over-under double barreled shotgun made in the post-war era."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "caravan"
	item_state = "shotgundouble"
	icon_prefix = "shotgundouble"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_delay = 0.5
	recoil = 0.2
	slowdown = 0.2
	force = 20
	mag_type = /obj/item/ammo_box/magazine/internal/shot/dual/simple
	sawn_desc = "Short and concealable, terribly uncomfortable to fire, but worse on the other end."
	fire_sound = 'sound/f13weapons/caravan_shotgun.ogg'

/obj/item/gun/ballistic/revolver/caravan_shotgun/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/circular_saw) || istype(A, /obj/item/gun/energy/plasmacutter) | istype(A, /obj/item/twohanded/chainsaw))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

/obj/item/gun/ballistic/revolver/caravan_shotgun/update_icon_state()
	if(sawn_off)
		icon_state = "[initial(icon_state)]-sawn"
	else if(!magazine || !magazine.ammo_count(0))
		icon_state = "[initial(icon_state)]-e"
	else
		icon_state = "[initial(icon_state)]"


//Widowmaker				Keywords: Shotgun, Double barrel, saw-off
/obj/item/gun/ballistic/revolver/widowmaker
	name = "Winchester Widowmaker"
	desc = "Old-world Winchester Widowmaker double-barreled 12 gauge shotgun, with mahogany furniture"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "widowmaker"
	item_state = "shotgundouble"
	icon_prefix = "shotgundouble"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/dual
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_delay = 0.5
	recoil = 0.3
	slowdown = 0.1
	force = 20
	sawn_desc = "Someone took the time to chop the last few inches off the barrel and stock of this shotgun. Now, the wide spread of this hand-cannon's short-barreled shots makes it perfect for short-range crowd control."
	fire_sound = 'sound/f13weapons/max_sawn_off.ogg'

/obj/item/gun/ballistic/revolver/widowmaker/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/circular_saw) || istype(A, /obj/item/gun/energy/plasmacutter) | istype(A, /obj/item/twohanded/chainsaw))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

/obj/item/gun/ballistic/revolver/widowmaker/update_icon_state()
	if(sawn_off)
		icon_state = "[initial(icon_state)]-sawn"
	else if(!magazine || !magazine.ammo_count(0))
		icon_state = "[initial(icon_state)]-e"
	else
		icon_state = "[initial(icon_state)]"


//Hunting shotgun				Keywords: Shotgun, Pump-action, 4 rounds
/obj/item/gun/ballistic/shotgun/hunting
	name = "hunting shotgun"
	desc = "A traditional hunting shotgun with wood furniture and a four-shell capacity underneath."
	icon_state = "pump"
	item_state = "shotgunpump"
	icon_prefix = "shotgunpump"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/lethal
	fire_delay = 2
	recoil = 0.3
	slowdown = 0.2

/obj/item/gun/ballistic/shotgun/hunting/update_icon_state()
	if(sawn_off)
		icon_state = "[initial(icon_state)]-sawn"
	else if(!magazine || !magazine.ammo_count(0))
		icon_state = "[initial(icon_state)]-e"
	else
		icon_state = "[initial(icon_state)]"


//Police Shotgun				Keywords: Shotgun, Pump-action, 6 rounds, Folding stock, Flashlight rail
/obj/item/gun/ballistic/shotgun/police
	name = "police shotgun"
	desc = "A pre-war shotgun with large magazine and folding stock, made from steel and polymers. Flashlight attachment rail."
	icon_state = "shotgunpolice"
	item_state = "shotgunpolice"
	icon_prefix = "shotgunpolice"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/police
	sawn_desc = "Portable but with a poor recoil managment."
	w_class = WEIGHT_CLASS_NORMAL
	recoil = 0.3
	slowdown = 0.2
	fire_delay = 2
	var/stock = FALSE
	can_flashlight = TRUE
	gunlight_state = "flightangle"
	flight_x_offset = 23
	flight_y_offset = 21

/obj/item/gun/ballistic/shotgun/police/AltClick(mob/living/user)
	. = ..()
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	toggle_stock(user)
	return TRUE

/obj/item/gun/ballistic/shotgun/police/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Alt-click to toggle the stock.</span>"

/obj/item/gun/ballistic/shotgun/police/proc/toggle_stock(mob/living/user)
	stock = !stock
	if(stock)
		w_class = WEIGHT_CLASS_BULKY
		to_chat(user, "You unfold the stock.")
		recoil = 0.1
		spread = 0
	else
		w_class = WEIGHT_CLASS_NORMAL
		to_chat(user, "You fold the stock.")
		recoil = 0.5
	update_icon()

/obj/item/gun/ballistic/shotgun/police/update_icon_state()
	icon_state = "[current_skin ? unique_reskin[current_skin] : "shotgunpolice"][stock ? "" : "fold"]"


//Trench shotgun					Keywords: Shotgun, Pump-action, 5 rounds, Bayonet
/obj/item/gun/ballistic/shotgun/trench
	name = "trench shotgun"
	desc = "A military shotgun designed for close-quarters fighting, equipped with a bayonet lug."
	icon_state = "trench"
	item_state = "shotguntrench"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/trench
	var/select = 0
	actions_types = list(/datum/action/item_action/toggle_firemode)
	can_bayonet = TRUE
	fire_delay = 2
	recoil = 0.3
	slowdown = 0.2
	bayonet_state = "bayonet"
	knife_x_offset = 24
	knife_y_offset = 22

/obj/item/gun/ballistic/shotgun/trench/update_icon_state()
	if(!magazine || !magazine.ammo_count(0))
		icon_state = "[initial(icon_state)]-e"
	else
		icon_state = "[initial(icon_state)]"


///////////////////////////
//SEMI-AUTOMATIC SHOTGUNS//
///////////////////////////

//Semi-auto shotgun template
/obj/item/gun/ballistic/shotgun/automatic/combat
	name = "semi-auto shotgun template"
	fire_delay = 6
	extra_damage = 0
	recoil = 0.1
	spread = 2

/obj/item/gun/ballistic/shotgun/automatic/shoot_live_shot(mob/living/user, pointblank = FALSE, mob/pbtarget, message = 1, stam_cost = 0)
	..()
	src.pump(user)

/obj/item/gun/ballistic/shotgun/automatic/combat/update_icon_state()
	if(!magazine || !magazine.ammo_count(0))
		icon_state = "[initial(icon_state)]-e"
	else
		icon_state = "[initial(icon_state)]"

//Browning Auto-5						Keywords: Shotgun, Semi-auto, 4 rounds internal
/obj/item/gun/ballistic/shotgun/automatic/combat/auto5
	name = "Browning Auto-5"
	desc = "A semi automatic shotgun with a four round tube."
	fire_delay = 3.5
	recoil = 0.3
	slowdown = 0.3
	icon_state = "auto5"
	item_state = "shotgunauto5"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/com/compact
	fire_sound = 'sound/f13weapons/auto5.ogg'


//Lever action shotgun					Keywords: LEGION, Shotgun, Lever-action, 5 round magazine, Pistol grip
/obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever
	name = "lever action shotgun"
	desc = "A pistol grip lever action shotgun with a five-shell capacity underneath plus one in chamber. Signature weapon of the Legion."
	icon_state = "shotgunlever"
	item_state = "shotgunlever"
	icon_prefix = "shotgunlever"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/trench
	fire_delay = 4.5
	recoil = 0.5
	slowdown = 0.1
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	fire_sound = 'sound/f13weapons/shotgun.ogg'
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 23
	knife_y_offset = 23


//Neostead 2000							Keywords: BOS, Shotgun, Semi-auto, 12 rounds internal
/obj/item/gun/ballistic/shotgun/automatic/combat/neostead
	name = "Neostead 2000"
	desc = "An advanced shotgun with two separate magazine tubes, allowing you to quickly toggle between ammo types."
	icon_state = "neostead"
	item_state = "shotguncity"
	recoil = 0.2
	slowdown = 0.3
	fire_delay = 3.5
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube
	force = 10
	var/toggled = FALSE
	var/obj/item/ammo_box/magazine/internal/shot/alternate_magazine

/obj/item/gun/ballistic/shotgun/automatic/combat/neostead/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Alt-click to switch tubes.</span>"

/obj/item/gun/ballistic/shotgun/automatic/combat/neostead/Initialize()
	. = ..()
	if (!alternate_magazine)
		alternate_magazine = new mag_type(src)

/obj/item/gun/ballistic/shotgun/automatic/combat/neostead/attack_self(mob/living/user)
	. = ..()
	if(!magazine.contents.len)
		toggle_tube(user)

/obj/item/gun/ballistic/shotgun/automatic/combat/neostead/proc/toggle_tube(mob/living/user)
	var/current_mag = magazine
	var/alt_mag = alternate_magazine
	magazine = alt_mag
	alternate_magazine = current_mag
	toggled = !toggled
	if(toggled)
		to_chat(user, "You switch to tube B.")
	else
		to_chat(user, "You switch to tube A.")

/obj/item/gun/ballistic/shotgun/automatic/combat/neostead/AltClick(mob/living/user)
	if(!user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	toggle_tube(user)


//Winchester City-Killer				Keywords: Shotgun, Semi-auto, 12 rounds internal
/obj/item/gun/ballistic/shotgun/automatic/combat/citykiller
	name = "Winchester City-Killer shotgun"
	desc = "A semi automatic shotgun with black tactical furniture made by Winchester Arms. This particular model uses a internal tube magazine."
	icon_state = "citykiller"
	item_state = "shotguncity"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/com/citykiller
	fire_delay = 3.5
	recoil = 0.25
	slowdown = 0.35
	var/semi_auto = TRUE
	fire_sound = 'sound/f13weapons/riot_shotgun.ogg'


//Riot shotgun							Keywords: Shotgun, Semi-auto, 12 round magazine, Pistol grip
/obj/item/gun/ballistic/automatic/shotgun/riot
	name = "Riot shotgun"
	desc = "A compact riot shotgun with a large ammo drum and semi-automatic fire, designed to fight in close quarters."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "shotgunriot"
	item_state = "shotgunriot"
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/d12g
	fire_delay = 2.7
	recoil = 0.5
	slowdown = 0.3
	automatic_burst_overlay = FALSE
	semi_auto = TRUE
	fire_sound = 'sound/f13weapons/riot_shotgun.ogg'

/obj/item/gun/ballistic/automatic/shotgun/pancor
	name = "Pancor Jackhammer"
	desc = "A drum-loaded, fully automatic shotgun. The pinnacle of turning things into swiss cheese."
	icon_state = "pancor"
	item_state = "cshotgun1"
	fire_sound = 'sound/f13weapons/repeater_fire.ogg'
	mag_type = /obj/item/ammo_box/magazine/d12g
	is_automatic = TRUE
	autofire_shot_delay = 2.5
	slowdown = 0.4
	recoil = 0.7
	automatic = 1
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
