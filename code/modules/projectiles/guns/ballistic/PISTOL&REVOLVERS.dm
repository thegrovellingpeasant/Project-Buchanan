``PISTOLS ARE FIRST`` 
``REVOLVERS ARE LAST``


(HOBOGUNS ARE MIGRATED TO THEIR RESPECTABLE DMMs, LASER MUSKETS ARE IN ENERGY, AND VICE VERSA)



``PISTOL``

//Zip gun												Keywords: 9mm, 5 rounds internal
/obj/item/gun/ballistic/automatic/hobo/zipgun
	name = "Zip gun (9mm)"
	icon_state = "zipgun"
	desc = "A crudely handcrafted zip gun that uses 9mm ammo."
	item_state = "gun"
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_LIGHT
	slowdown = 0.1
	mag_type = /obj/item/ammo_box/magazine/zipgun
	force = 16
	extra_damage = 0
	slowdown = 0.1
	spread = 8
	fire_delay = 2
	burst_size = 1
	fire_sound = 'sound/weapons/Gunshot.ogg'

/obj/item/gun/ballistic/automatic/hobo/zipgun/update_icon_state()
	icon_state = "zipgun[magazine ? "-[CEILING(get_ammo(0)/1, 1)*1]" : ""][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"


	//Pepperbox gun											Keywords: 10mm, 4 rounds internal
/obj/item/gun/ballistic/revolver/hobo/pepperbox
	name = "pepperbox gun (10mm)"
	desc = "Take four pipes. Tie them together. Add planks, 10mm ammo and prayers."
	icon_state = "pepperbox"
	item_state = "pepperbox"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/improvised10mm
	slowdown = 0.1
	force = 16
	fire_delay = 1
	extra_damage = 0
	spread = 7
	fire_sound = 'sound/weapons/Gunshot.ogg'

/obj/item/gun/ballistic/revolver/hobo/pepperbox/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0, stam_cost = 0)
	if(prob(1))
		playsound(user, fire_sound, 50, 1)
		to_chat(user, "<span class='userdanger'>[src] misfires, detonating the round in the barrel prematurely!</span>")
		user.take_bodypart_damage(0,20)
		user.dropItemToGround(src)
		return FALSE
	..()


//.22 Sport								Keywords: .22, Semi-auto, 16 round magazine, Suppressed
/obj/item/gun/ballistic/automatic/pistol/pistol22
	name = ".22 pistol"
	desc = "The silenced .22 pistol is a sporting handgun with an integrated silencer."
	icon_state = "silenced22"
	mag_type = /obj/item/ammo_box/magazine/m22
	extra_damage = 0
	spread = 1
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_TINY
	can_attachments = TRUE
	can_suppress = FALSE
	can_unsuppress = FALSE
	suppressed = 1
	fire_sound = 'sound/f13weapons/22pistol.ogg'


//N99  10mm								Keywords: 10mm, Semi-auto, 12/24 round magazine
/obj/item/gun/ballistic/automatic/pistol/n99
	name = "10mm pistol"
	desc = "A pre-war large-framed, gas-operated advanced 10mm pistol."
	icon_state = "n99"
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv/simple
	extra_damage = 0
	slowdown = 0.1
	force = 16
	fire_delay = 1
	recoil = 0.1
	spread = 1
	can_attachments = TRUE
	can_automatic = TRUE
	suppressor_state = "n99_suppressor"
	suppressor_x_offset = 29
	suppressor_y_offset = 15
	fire_sound = 'sound/f13weapons/10mm_fire_02.ogg'



//Crusader pistol
/obj/item/gun/ballistic/automatic/pistol/n99/crusader
	name = "\improper Crusader pistol"
	desc = "A large-framed N99 pistol emblazoned with the colors and insignia of the Brotherhood of Steel. It feels heavy in your hand."
	extra_penetration = 0
	slowdown = 0.2
	extra_damage = 3
	spread = 1
	force = 18
	icon_state = "crusader"
	item_state = "crusader"
	can_attachments = FALSE
	can_automatic = FALSE


//Type 17								Keywords: 10mm, Semi-auto, 12/24 round magazine. Special modifiers: damage +1, spread +1
/obj/item/gun/ballistic/automatic/pistol/type17
	name = "Type 17"
	desc = "Chinese military sidearm at the time of the Great War. The ones around are old and worn, but somewhat popular due to the long barrel and rechambered in 10mm after the original ammo ran dry decades ago."
	icon_state = "chinapistol"
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv/simple
	fire_delay = 1
	slowdown = 0.1
	spread = 1
	extra_damage = 3
	recoil = 0.2
	spread = 7
	can_suppress = FALSE
	fire_sound = 'sound/f13weapons/10mm_fire_02.ogg'


//Browning Hi-power						Keywords: 9mm, Semi-auto
/obj/item/gun/ballistic/automatic/pistol/ninemil
	name = "Browning Hi-power"
	desc = "A mass produced pre-war Browning Hi-power 9mm pistol."
	icon_state = "ninemil"
	mag_type = /obj/item/ammo_box/magazine/m9mmds
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_SMALL
	extra_damage = 0
	fire_delay = 1
	spread = 1
	slowdown = 0.1
	can_attachments = TRUE
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 30
	suppressor_y_offset = 19
	fire_sound = 'sound/f13weapons/ninemil.ogg'




//Sig Sauer P220						Keywords: 9mm, Semi-auto, 10 round magazine
/obj/item/gun/ballistic/automatic/pistol/sig
	name = "Sig P220"
	desc = "The P220 Sig Sauer. A Swiss designed pistol that is compact and has an average rate of fire for a pistol."
	icon_state = "sig"
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_LIGHT
	mag_type = /obj/item/ammo_box/magazine/m9mm
	extra_damage = 0
	fire_delay = 1
	spread = 1
	slowdown = 0.1
	can_attachments = TRUE
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 30
	suppressor_y_offset = 20
	fire_sound = 'sound/f13weapons/9mm.ogg'


//Beretta M9FS							Keywords: 9mm, Semi-auto. Special modifiers: spread -1
/obj/item/gun/ballistic/automatic/pistol/beretta
	name = "Beretta M9FS"
	desc = "One of the more common 9mm pistols, the Beretta is popular due to its reliability, 15 round magazine and good looks."
	icon_state = "beretta"
	mag_type = /obj/item/ammo_box/magazine/m9mmds
	weapon_weight = WEAPON_LIGHT
	extra_damage = 0
	fire_delay = 1
	slowdown = 0.1
	spread = 1
	can_attachments = TRUE
	can_suppress = "pistol_suppressor"
	suppressor_x_offset = 30
	suppressor_y_offset = 20
	fire_sound = 'sound/f13weapons/9mm.ogg'

//Beretta M93R							Keywords: 9mm, Automatic, 15 round magazine
/obj/item/gun/ballistic/automatic/pistol/beretta/automatic
	name = "Beretta M93R"
	desc = "A rare select fire variant of the M93R."
	icon_state = "m93r"
	fire_delay = 2
	burst_size = 2
	slowdown = 0.1
	burst_shot_delay = 2.5
	spread = 9
	recoil = 0.2
	actions_types = list(/datum/action/item_action/toggle_firemode)
	automatic_burst_overlay = TRUE
	can_attachments = FALSE
	semi_auto = FALSE
	actions_types = list(/datum/action/item_action/toggle_firemode)

/obj/item/gun/ballistic/automatic/pistol/beretta/automatic/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 2
			spread = 9
			recoil = 0.1
			weapon_weight = WEAPON_HEAVY
			to_chat(user, "<span class='notice'>You switch to automatic fire.</span>")
		if(1)
			select = 0
			burst_size = 1
			spread = 1
			recoil = 0
			weapon_weight = WEAPON_MEDIUM
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return


//M1911									Keywords: .45 ACP, Semi-auto, 8 round magazine. Special modifiers: damage +1
/obj/item/gun/ballistic/automatic/pistol/m1911
	name = "M1911"
	desc = "A classic .45 handgun with a small magazine capacity."
	icon_state = "m1911"
	item_state = "pistolchrome"
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 2
	slowdown = 0.1
	mag_type = /obj/item/ammo_box/magazine/m45
	extra_damage = 0
	recoil = 4
	spread = 1
	can_attachments = TRUE
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 30
	suppressor_y_offset = 21
	fire_sound = 'sound/f13weapons/45revolver.ogg'

//M1911	Custom							Keywords: .45 ACP, Semi-auto, 8 round magazine. Special modifiers: damage +1
/obj/item/gun/ballistic/automatic/pistol/m1911/custom
	name = "M1911 Custom"
	desc = "A well-maintained stainless-steel frame 1911, with genuine wooden grips."
	icon_state = "m1911_custom"
	recoil = 0
	fire_delay = 1


//Mk. 23								Keywords: .45 ACP, Semi-auto, Long barrel (lasersight), 12 round magazine, Flashlight
/obj/item/gun/ballistic/automatic/pistol/mk23
	name = "Mk. 23"
	desc = "A very tactical pistol chambered in .45 ACP with a built in laser sight and attachment point for a seclite."
	icon_state = "mk23"
	mag_type = /obj/item/ammo_box/magazine/m45exp
	fire_delay = 1
	slowdown = 0.1
	extra_damage = 4
	spread = 1
	can_flashlight = TRUE
	gunlight_state = "flight"
	flight_x_offset = 16
	flight_y_offset = 13
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 28
	suppressor_y_offset = 20
	fire_sound = 'sound/f13weapons/45revolver.ogg'



/////////////////
//HEAVY PISTOLS//
/////////////////


//Desert Eagle							Keywords: .44 Magnum, Semi-auto, Long barrel, 8 round magazine, Heavy. Special modifiers: bullet speed +300, damage +1
/obj/item/gun/ballistic/automatic/pistol/deagle
	name = "Desert Eagle"
	desc = "A robust .44 magnum semi-automatic handgun."
	icon_state = "deagle"
	item_state = "deagle"
	mag_type = /obj/item/ammo_box/magazine/m44
	fire_delay = 3
	force = 15
	spread = 1
	extra_damage = 7
	recoil = 0.4
	slowdown = 0.2
	can_suppress = FALSE
	automatic_burst_overlay = FALSE
	fire_sound = 'sound/f13weapons/44mag.ogg'

//El Capitan			Keywords: 14mm, Semi-auto, 7 round magazine, Heavy. Special modifiers: damage -2
/obj/item/gun/ballistic/automatic/pistol/deagle/elcapitan
	name = "El Capitan"
	desc = "The Captain loves his gun, despite some silly gunsmith adding some gas venting to the barrel after his second visit to the surgeon for recoil-related wrist injuries."
	icon_state = "elcapitan"
	item_state = "deagle"
	mag_type = /obj/item/ammo_box/magazine/m14mm
	slowdown = 0.2
	extra_damage = 11
	recoil = 0.2
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'

//Automag			Keywords: .44 Magnum, Semi-auto, Long barrel, 7 rounds, Heavy. Special modifiers: bullet speed +300
/obj/item/gun/ballistic/automatic/pistol/automag
	name = "Automag"
	desc = "A long-barreled .44 magnum semi-automatic handgun."
	icon_state = "automag"
	item_state = "deagle"
	mag_type = /obj/item/ammo_box/magazine/automag
	fire_delay = 4
	spread = 1
	slowdown = 0.2
	extra_damage = 7
	recoil = 0.2
	can_suppress = FALSE
	automatic_burst_overlay = FALSE
	fire_sound = 'sound/f13weapons/44mag.ogg'


//14mm Pistol		Keywords: 14mm, Semi-auto, 7 rounds, Heavy
/obj/item/gun/ballistic/automatic/pistol/pistol14
	name = "14mm pistol"
	desc = "A Swiss SIG-Sauer 14mm handgun, powerful but a little inaccurate"
	icon_state = "pistol14"
	mag_type = /obj/item/ammo_box/magazine/m14mm
	force = 15
	extra_damage = 0
	spread = 4
	slowdown = 0.1
	extra_penetration = 0
	fire_delay = 3
	recoil = 0.4
	can_suppress = FALSE
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'

//14mm compact		Keywords: 14mm, Semi-auto, Short barrel, 7 rounds, Heavy
/obj/item/gun/ballistic/automatic/pistol/pistol14/compact
	name = "compact 14mm pistol"
	desc = "A Swiss SIG-Sauer 14mm handgun, this one is a compact model for concealed carry."
	icon_state = "pistol14_compact"
	w_class = WEIGHT_CLASS_SMALL
	extra_damage = 0
	spread = 7




	///////////////////
// .38 REVOLVERS //
///////////////////

// .38 Detective					Keywords: .38, Double action, 6 rounds cylinder, Short barrel, Bootgun
/obj/item/gun/ballistic/revolver/detective
	name = ".38 Detective Special"
	desc = "A small revolver thats easily concealable."
	icon_state = "detective"
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev38
	force = 10
	fire_delay = 2
	slowdown = 0.1
	extra_damage = 0
	spread = 2
	obj_flags = UNIQUE_RENAME
	var/list/safe_calibers

///////////////////
// .45 ACP REVOLVERS //
///////////////////


//S&W 45						Keywords: .45, Single action, 7 rounds cylinder, Long barrel
/obj/item/gun/ballistic/revolver/revolver45
	name = "S&W .45 ACP revolver"
	desc = "Smith and Wesson revolver firing .45 ACP from a seven round cylinder."
	item_state = "45revolver"
	icon_state = "45revolver"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev45
	extra_damage = 0
	slowdown = 0.15
	fire_delay = 3
	spread = 1
	fire_sound = 'sound/f13weapons/45revolver.ogg'



////////////////////
// .357 REVOLVERS //
////////////////////



//Winchester rebore. 									Keywords: .308, 2 round internal, saw-off
/obj/item/gun/ballistic/revolver/winchesterrebored
	name = "rebored Winchester"
	desc = "A Winchester double-barreled shotgun rebored to fire .308 ammunition."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "winchesterbore"
	item_state = "shotgundouble"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/improvised762
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	extra_damage = 0
	slowdown = 0.15
	fire_delay = 1
	force = 20
	spread = 8
	sawn_desc = "Someone took the time to chop the last few inches off the barrel and stock of this shotgun. Now, the wide spread of this hand-cannon's short-barreled shots makes it perfect for short-range crowd control."
	fire_sound = 'sound/f13weapons/max_sawn_off.ogg'

/obj/item/gun/ballistic/revolver/winchesterrebored/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/circular_saw) || istype(A, /obj/item/gun/energy/plasmacutter))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

/obj/item/gun/ballistic/revolver/winchesterrebored/update_icon_state()
	if(sawn_off)
		icon_state = "[initial(icon_state)]-sawn"
	else if(!magazine || !magazine.ammo_count(0))
		icon_state = "[initial(icon_state)]-e"
	else
		icon_state = "[initial(icon_state)]"



//357 Magnum					Keywords: .357, Single action, 6 rounds cylinder, long barrel
/obj/item/gun/ballistic/revolver/colt357
	name = "\improper .357 magnum revolver"
	desc = "A no-nonsense revolver, more than likely made in some crude workshop in one of the more prosperous frontier towns."
	icon_state = "357colt"
	item_state = "357colt"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev357
	extra_damage = 0
	slowdown = 0.2
	fire_delay = 3
	spread = 1
	fire_sound = 'sound/f13weapons/357magnum.ogg'

/obj/item/gun/ballistic/revolver/colt357/mateba //this is a skin that rigbe wanted//bobnote, I wonder how rigbe turned out...
	name = "\improper Unica 6 auto-revolver"
	desc = "A pre-war high-power autorevolver commonly used by people who think they look cool."
	icon_state = "mateba"
	item_state = "mateba"
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
	extra_damage = 0



//Brass Revolver							Keywords: DEN, .357, Double action, 6 rounds cylinder, Fire delay -1
/obj/item/gun/ballistic/revolver/colt357/brassgun
	name = "Brass Gun"
	desc = "The revolver here appears to be made out of number of Sequoia's once held by a Vet Ranger. It doesn't have the punch as it once did."
	icon_state = "lucky"
	item_state = "lucky"
	w_class = WEIGHT_CLASS_SMALL
	extra_damage = 0
	slowdown = 0.2
	spread = 1
	fire_delay = 2

//Police revolver					Keywords: .357, Double action, 6 rounds cylinder, Pocket Pistol
/obj/item/gun/ballistic/revolver/police
	name = "police revolver"
	desc = "Pre-war double action police revolver chambered in .357 magnum."
	icon_state = "police"
	extra_damage = 0
	slowdown = 0.2
	fire_delay = 2
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev357
	w_class = WEIGHT_CLASS_SMALL
	spread = 2
	fire_sound = 'sound/f13weapons/policepistol.ogg'



///////////////////
// .44 REVOLVERS //
///////////////////

//.44 Magnum revolver		 	Keywords: .44, Single action, 6 rounds cylinder
/obj/item/gun/ballistic/revolver/m29
	name = ".44 magnum revolver"
	desc = "Powerful handgun for those who want to travel the wasteland safely in style. Has a bit of a kick."
	item_state = "model29"
	icon_state = "m29"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev44
	extra_damage = 0
	slowdown = 0.2
	recoil = 0.3
	fire_delay = 3
	spread = 1
	can_scope = FALSE
	scope_state = "revolver_scope"
	scope_x_offset = 6
	scope_y_offset = 24
	fire_sound = 'sound/f13weapons/44mag.ogg'

/obj/item/gun/ballistic/revolver/m29/alt
	desc = "Powerful handgun with a bit of a kick. This one has nickled finish and pearly grip, and has been kept in good condition by its owner."
	item_state = "44magnum"
	icon_state = "mysterious_m29"
	can_scope = FALSE
	extra_damage = 0


//Peacekeeper					 Keywords: OASIS, .44, Double action, 6 rounds cylinder, Extra Firemode
/obj/item/gun/ballistic/revolver/m29/peacekeeper
	name = "Peacekeeper"
	desc = "When you don't just need excessive force, but crave it. This .44 has a special hammer mechanism, allowing for measured powerful shots.
	icon_state = "m29peace"
	extra_damage = 10
	recoil = 0.5
	fire_delay = 1
	can_scope = FALSE

//.44 Snubnose						Keywords: .44, Double action, 6 rounds cylinder, Short barrel
/obj/item/gun/ballistic/revolver/m29/snub
	name = "snubnose .44 magnum revolver"
	desc = "A snubnose variant of the commonplace .44 magnum. An excellent holdout weapon for self defense."
	icon_state = "m29_snub"
	w_class = WEIGHT_CLASS_SMALL
	extra_damage = 0
	spread = 6
	slowdown = 0.1
	recoil = 0.4


//.44 single action		 			Keywords: .44, Single action, 6 rounds cylinder, Long barrel
/obj/item/gun/ballistic/revolver/revolver44
	name = "\improper .44 magnum single-action revolver"
	desc = "I hadn't noticed, but there on his hip, was a moderately sized iron..."
	item_state = "44colt"
	icon_state = "44colt"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev44
	fire_delay = 3
	slowdown = 0.2
	extra_damage = 0
	spread = 1
	fire_sound = 'sound/f13weapons/44revolver.ogg'


//Desert Ranger revolver			Keywords: .44, Single action, 6 rounds cylinder,
/obj/item/gun/ballistic/revolver/revolver44/desert_ranger
	name = "desert ranger revolver"
	desc = "I hadn't noticed, but there on his hip, was a really spiffy looking iron..."
	fire_delay = 2
	slowdown = 0.2
	extra_damage = 0


//////////////////////
// .45-70 REVOLVERS //
//////////////////////

//Sequioa					Keywords: NCR, .45-70, 6 rounds cylinder, Double action, Heavy
/obj/item/gun/ballistic/revolver/sequoia
	name = "ranger sequoia"
	desc = "This large, double-action revolver is a trademark weapon of the New California Republic Rangers. It features a dark finish with intricate engravings etched all around the weapon. Engraved along the barrel are the words 'For Honorable Service,' and 'Against All Tyrants.' The hand grip bears the symbol of the NCR Rangers, a bear, and a brass plate attached to the bottom that reads '20 Years.' "
	icon_state = "sequoia"
	item_state = "sequoia"
	weapon_weight = WEAPON_MEDIUM
	recoil = 0.3
	slowdown = 0.3
	fire_delay = 3
	spread = 1
	extra_damage = -5
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev4570
	fire_sound = 'sound/f13weapons/sequoia.ogg'

/obj/item/gun/ballistic/revolver/sequoia/bayonet
	name = "bladed ranger sequoia"
	desc = "This heavy revolver is a trademark weapon of the New California Republic Rangers. This one has a blade attached to the handle for a painful pistolwhip."
	icon_state = "sequoia_b"
	item_state = "sequoia"
	force = 25
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev4570
	fire_sound = 'sound/f13weapons/sequoia.ogg'

/obj/item/gun/ballistic/revolver/sequoia/death
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev4570/death
	fire_sound = 'sound/f13weapons/sequoia.ogg'
	fire_delay = 0
	spread = 0


//Hunting revolver				Keywords: .45-70, Double action, 5 rounds cylinder, Heavy
/obj/item/gun/ballistic/revolver/hunting
	name = "hunting revolver"
	desc = "A scoped double action revolver chambered in 45-70."
	icon_state = "hunting_revolver"
	weapon_weight = WEAPON_MEDIUM
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev4570
	recoil = 0.3
	slowdown = 0.3
	spread = 1
	can_scope = TRUE
	scope_state = "revolver_scope"
	extra_damage = -5
	fire_delay = 3
	scope_x_offset = 9
	scope_y_offset = 20
	fire_sound = 'sound/f13weapons/sequoia.ogg'

/obj/item/gun/ballistic/revolver/hunting/klatue
	name = "degraded hunting revolver"
	desc = "A scoped double action revolver chambered in 45-70. This one is very worn."
	extra_damage = -9
	extra_penetration = 0

/////////////////////
// WEIRD REVOLVERS //
/////////////////////


//Colt Army						Keywords: .45 long colt (bouncing), Single action, 6 rounds cylinder.
/obj/item/gun/ballistic/revolver/revolver45/gunslinger
	name = "\improper Colt Single Action Army"
	desc = "A Colt Single Action Army, chambered in the archaic .45 long colt cartridge."
	item_state = "coltwalker"
	icon_state = "peacemaker"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev45/gunslinger
	extra_damage = 0
	slowdown = 0.2
	spread = 1
	recoil = 0.4
	fire_delay = 3
	fire_sound = 'sound/f13weapons/45revolver.ogg'
	spread = 0 //Your reward for the slower fire rate is less spread anddd


//.223 Pistol					Keywords: .223, Double action, 5 rounds internal, Short barrel
/obj/item/gun/ballistic/revolver/thatgun
	name = ".223 pistol"
	desc = "A strange pistol firing rifle ammunition, possibly damaging the users wrist and with poor accuracy."
	icon_state = "thatgun"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/thatgun
	weapon_weight = WEAPON_MEDIUM
	extra_damage = 0
	spread = 6
	fire_delay = 2
	slowdown = 0.2
	recoil = 0.4
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
