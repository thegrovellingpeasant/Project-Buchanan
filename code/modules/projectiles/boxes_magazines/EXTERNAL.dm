//////////////////////
// PISTOL MAGAZINES //
//////////////////////

/obj/item/ammo_box
	var/special_ammo = FALSE

/obj/item/ammo_box/update_overlays()
	. = ..()
	if(special_ammo)
		. += ("[initial(icon_state)]_x")

//.22
/obj/item/ammo_box/magazine/m22
	name = "pistol magazine (.22lr)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "pistol22"
	ammo_type = /obj/item/ammo_casing/a22
	caliber = ".22lr"
	max_ammo = 16
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m22/empty
	start_empty = 1

//9mm
/obj/item/ammo_box/magazine/zipgun
	name = "Zip gun clip (9mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "zip"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 5
	multiple_sprites = 2

//9mm
/obj/item/ammo_box/magazine/m9mm
	name = "9mm pistol magazine (9mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "9mmp"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 10
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m9mm/empty
	start_empty = 1

//9mm doublestack
/obj/item/ammo_box/magazine/m9mmds
	name = "doublestack pistol magazine (9mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "m9mmds"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 15
	multiple_sprites = 2


/obj/item/ammo_box/magazine/m9mmds/empty
	start_empty = 1

//10mm template
/obj/item/ammo_box/magazine/m10mm
	name = "pistol magazine (10mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	desc = "A gun magazine."
	caliber = "10mm"

//10mm small
/obj/item/ammo_box/magazine/m10mm_adv
	name = "10mm pistol magazine (10mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "m10mm"
	ammo_type = /obj/item/ammo_casing/c10mm
	max_ammo = 12
	multiple_sprites = 2
	caliber = "10mm"

/obj/item/ammo_box/magazine/m10mm_adv/empty
	start_empty = 1

/obj/item/ammo_box/magazine/m10mm_adv/simple

/obj/item/ammo_box/magazine/m10mm_adv/simple/empty
	start_empty = 1

//10mm extended
/obj/item/ammo_box/magazine/m10mm_adv/ext
	name = "10mm extended magazine (10mm)"
	icon_state = "smg10mm"
	ammo_type = /obj/item/ammo_casing/c10mm
	max_ammo = 24
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m10mm_adv/ext/empty
	start_empty = 1

//.45
/obj/item/ammo_box/magazine/m45
	name = "handgun magazine (.45)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "45"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	max_ammo = 8
	multiple_sprites = 1


/obj/item/ammo_box/magazine/m45/empty
	start_empty = 1

/obj/item/ammo_box/magazine/m45/update_icon()
	..()
	icon_state = "[initial(icon_state)]-[round(ammo_count(),4)]"

//.45 socom
/obj/item/ammo_box/magazine/m45exp
	name = "socom magazine (.45)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "45socom"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	max_ammo = 12
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m45exp/empty
	start_empty = 1

//.44 Magnum
/obj/item/ammo_box/magazine/m44
	name = "handgun magazine (.44 magnum)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "50ae"
	ammo_type = /obj/item/ammo_casing/m44
	caliber = "44"
	max_ammo = 8
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m44/empty
	start_empty = 1

/obj/item/ammo_box/magazine/m44/update_icon()
	..()
	icon_state = "[initial(icon_state)]-[round(ammo_count(),4)]"

/obj/item/ammo_box/magazine/automag
	name = "automag magazine (.44 magnum)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "magnum"
	ammo_type = /obj/item/ammo_casing/m44
	max_ammo = 7
	multiple_sprites = 2

/obj/item/ammo_box/magazine/automag/empty
	start_empty = 1

//14mm
/obj/item/ammo_box/magazine/m14mm
	name = "handgun magazine (14mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "50ae"
	ammo_type = /obj/item/ammo_casing/p14mm
	caliber = "14"
	max_ammo = 7
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m14mm/empty
	start_empty = 1

/obj/item/ammo_box/magazine/m14mm/update_icon()
	..()
	icon_state = "[initial(icon_state)]-[round(ammo_count(),4)]"

	///////////////////
// SMG MAGAZINES //
///////////////////


/obj/item/ammo_box/magazine/cg45
	name = "Carl Gustaf magazine (10mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "cg45"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 36
	multiple_sprites = 2

/obj/item/ammo_box/magazine/cg45/empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/greasegun
	name = "Grease gun magazine (9mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "grease"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/greasegun/empty
	start_empty = 1

/obj/item/ammo_box/magazine/uzim9mm/rockwell
	name = "Rockwell magazine (9mm)"
	icon_state = "rock"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 20

/obj/item/ammo_box/magazine/uzim9mm/rockwell/empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/uzim9mm
	name = "Uzi magazine (9mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "uzi9mm"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 32

/obj/item/ammo_box/magazine/uzim9mm/update_icon()
	..()
	icon_state = "[initial(icon_state)]-[round(ammo_count(),4)]"

/obj/item/ammo_box/magazine/uzim9mm/empty
	start_empty = 1

/obj/item/ammo_box/magazine/pps9mm
	name = "PPSh magazine (9mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "ppshDrum"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 71
	multiple_sprites = 2

/obj/item/ammo_box/magazine/pps9mm/empty
	start_empty = 1

/obj/item/ammo_box/magazine/m22smg
	name = "toploader magazine (.22lr)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "smg22"
	ammo_type = /obj/item/ammo_casing/a22
	caliber = ".22lr"
	max_ammo = 180
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m22smg/empty
	start_empty = 1

/obj/item/ammo_box/magazine/tommygunm45
	name = "Thompson drum magazine (.45)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "tommydrum"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	max_ammo = 50

/obj/item/ammo_box/magazine/tommygunm45/stick
	name = "Thompson stick magazine (.45)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "tommystick"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/tommygunm45/empty
	start_empty = 1

/obj/item/ammo_box/magazine/tommygunm45/stick/empty
	start_empty = 1

/obj/item/ammo_box/magazine/smg14
	name = "14mm smg magazine"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "14smg"
	ammo_type = /obj/item/ammo_casing/p14mm
	caliber = "14"
	max_ammo = 21

/obj/item/ammo_box/magazine/smg14/empty
	start_empty = 1

/obj/item/ammo_box/magazine/smg14/stacked
	name = "14mm smg stacked magazine"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "14smge"
	ammo_type = /obj/item/ammo_casing/p14mm
	caliber = "14"
	max_ammo = 27
	multiple_sprites = 2

/obj/item/ammo_box/magazine/smg14/stacked/empty
	start_empty = 1

/obj/item/ammo_box/magazine/m10mm_p90
	name = "toploader magazine (10mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "5.56m"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 50
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m10mm_p90/empty
	start_empty = 1

	/obj/item/ammo_box/magazine/m10mm/rifle
	name = "rifle magazine (10mm)"
	desc = "A well-worn magazine fitted for the surplus rifle."
	icon_state = "75-8"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 10

/obj/item/ammo_box/magazine/m10mm/rifle/update_icon()
	if(ammo_count())
		icon_state = "75-8"
	else
		icon_state = "75-0"

/obj/item/ammo_box/magazine/m556
	name = "toploader magazine (5.56mm)"
	icon_state = "5.56m"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 30
	multiple_sprites = 2

/*
---Fallout 13---
*/

/obj/item/ammo_box/magazine/autopipe
	name = "pipe rifle ammo belt (.357)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "autopipe_belt"
	caliber = "357"
	ammo_type = /obj/item/ammo_casing/a357
	max_ammo = 18
	multiple_sprites = 2

/obj/item/ammo_box/magazine/autopipe/empty
	start_empty = 1

/obj/item/ammo_box/magazine/autopipe/update_icon()
	..()
	icon_state = "autopipe_belt-[round(ammo_count(),9)]"

/obj/item/ammo_box/magazine/m556/rifle
	name = "rifle magazine (5.56mm)"
	icon_state = "r20"
	caliber = "a556"
	max_ammo = 20
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m556/rifle/empty
	start_empty = 1

/obj/item/ammo_box/magazine/m556/rifle/small
	name = "small rifle magazine (5.56mm)"
	icon_state = "r10"
	max_ammo = 10

/obj/item/ammo_box/magazine/m556/rifle/small/empty
	start_empty = 1

/obj/item/ammo_box/magazine/m556/rifle/assault
	name = "rifle magazine (5.56mm)"
	icon_state = "r30"
	max_ammo = 30

/obj/item/ammo_box/magazine/m556/rifle/assault/empty
	start_empty = 1

/obj/item/ammo_box/magazine/m556/rifle/extended
	name = "extended rifle magazine (5.56mm)"
	icon_state = "r50"
	max_ammo = 50

/obj/item/ammo_box/magazine/m556/rifle/extended/empty
	start_empty = 1

/obj/item/ammo_box/magazine/m5mm
	name = "Assault Rifle Magazine (5mm)"
	icon_state = "r30"
	caliber = "m5mm"
	ammo_type = /obj/item/ammo_casing/m5mm
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m5mm/empty
	start_empty = 1

/obj/item/ammo_box/magazine/garand308
	name = "en-bloc clip (7.62x51mm)"
	icon_state = "enbloc-8"
	ammo_type = /obj/item/ammo_casing/a762
	caliber = "a762"
	max_ammo = 8


/obj/item/ammo_box/magazine/garand308/update_icon()
	..()
	if (ammo_count() >= 8)
		icon_state = "enbloc-8"
	else
		icon_state = "enbloc-[ammo_count()]"

/obj/item/ammo_box/magazine/garand308/empty
	start_empty = 1

/obj/item/ammo_box/magazine/sks
	name = "7.62mm clip (SKS)"
	icon_state = "enbloc-10"
	ammo_type = /obj/item/ammo_casing/a762
	caliber = "a762"
	max_ammo = 10

/obj/item/ammo_box/magazine/sks/update_icon()
	..()
	if (ammo_count() >= 10)
		icon_state = "enbloc-10"
	else
		icon_state = "enbloc-[ammo_count()]"

/obj/item/ammo_box/magazine/sks/empty
	start_empty = 1

/obj/item/ammo_box/magazine/m762
	name = "rifle magazine (7.62x51)"
	icon_state = "mag308"
	ammo_type = /obj/item/ammo_casing/a762
	caliber = "a762"
	max_ammo = 10
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m762/empty
	start_empty = 1

/obj/item/ammo_box/magazine/m762/ext
	name = "extended rifle magazine (7.62x51)"
	icon_state = "extmag308"
	max_ammo = 20
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m762/ext/empty
	start_empty = 1

/obj/item/ammo_box/magazine/m473
	name = "g11 magazine (4.73mm)"
	icon_state = "473mm"
	caliber = "473mm"
	ammo_type = /obj/item/ammo_casing/caseless/g11
	max_ammo = 50
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m473/explosive
	name = "g11 magazine (4.73mm explosive)"
	icon_state = "473mm"
	caliber = "473mm"
	ammo_type = /obj/item/ammo_casing/caseless/g11/explosive
	max_ammo = 50
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m473/empty
	start_empty = 1

/obj/item/ammo_box/magazine/m473/small
	name = "4.7mm carbine magazine"
	icon_state = "46x30mmt"
	max_ammo = 20

/obj/item/ammo_box/magazine/m473/small/empty
	start_empty = 1

/obj/item/ammo_box/magazine/m2mm
	name = "2mm electromagnetic magazine"
	icon_state = "2mm"
	ammo_type = /obj/item/ammo_casing/c2mm
	caliber = "2mm"
	max_ammo = 10
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m2mm/blender
	name = "2mm \"Blender\" electromagnetic magazine"
	ammo_type = /obj/item/ammo_casing/c2mm/blender
	max_ammo = 10
	multiple_sprites = 2

	/obj/item/ammo_box/magazine/mm195x129
	name = "box magazine (1.95x129mm)"
	icon_state = "a762-50"
	ammo_type = /obj/item/ammo_casing/mm195x129
	caliber = "mm195129"
	max_ammo = 50

/obj/item/ammo_box/magazine/mm195x129/hollow
	name = "box magazine (Hollow-Point 1.95x129mm)"
	ammo_type = /obj/item/ammo_casing/mm195x129/hollow

/obj/item/ammo_box/magazine/mm195x129/ap
	name = "box magazine (Armor Penetrating 1.95x129mm)"
	ammo_type = /obj/item/ammo_casing/mm195x129/ap

/obj/item/ammo_box/magazine/mm195x129/incen
	name = "box magazine (Incendiary 1.95x129mm)"
	ammo_type = /obj/item/ammo_casing/mm195x129/incen

/obj/item/ammo_box/magazine/mm195x129/update_icon()
	..()
	icon_state = "a762-[round(ammo_count(),10)]"

/obj/item/ammo_box/magazine/mm712x82/match
	name = "box magazine (Match 7.12x82mm)"
	ammo_type = /obj/item/ammo_casing/mm712x82/match

/obj/item/ammo_box/magazine/w308
	name = "sniper rifle magazine (7.62x51)"
	icon_state = "sniper_mag"
	ammo_type = /obj/item/ammo_casing/a762
	caliber = "a762"
	max_ammo = 7
	multiple_sprites = 2

/obj/item/ammo_box/magazine/w308/empty
	start_empty = 1


/obj/item/ammo_box/magazine/lmg
	name = "ammo box (5.56)"
	icon_state = "r80"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 60
	multiple_sprites = 2

/obj/item/ammo_box/magazine/lmg/empty
	start_empty = 1

/obj/item/ammo_box/magazine/cz53
	name = "ammo box (5mm)"
	icon_state = "cz53"
	ammo_type = /obj/item/ammo_casing/m5mm
	caliber = "m5mm"
	max_ammo = 240
	multiple_sprites = 2

/obj/item/ammo_box/magazine/cz53/empty
	start_empty = 1

/obj/item/ammo_box/magazine/mg34
	name = "ammo box (7.62)"
	icon_state = "r80"
	ammo_type = /obj/item/ammo_casing/a762
	caliber = "a762"
	max_ammo = 60
	multiple_sprites = 2

/obj/item/ammo_box/magazine/mg34/empty
	start_empty = 1

/obj/item/ammo_box/magazine/mm762
	name = "ammo belt (.308)"
	icon_state = "762belt"
	ammo_type = /obj/item/ammo_casing/a762/sport
	max_ammo = 80
	caliber = "a762"

/obj/item/ammo_box/magazine/mm762/empty
	start_empty = 1

/obj/item/ammo_box/magazine/mm762/can_load()
	return 0

/obj/item/ammo_box/magazine/mm762/update_icon()
	..()
	icon_state = "762belt-[round(ammo_count(),20)]"

	/obj/item/ammo_box/magazine/amr
	name = "Anti-materiel rifle magazine (.50)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "50mag"
	max_ammo = 8
	ammo_type = /obj/item/ammo_casing/a50MG
	caliber = "a50MG"
	multiple_sprites = 2

/obj/item/ammo_box/magazine/amr/empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/amr/incindiary
	name = "Anti-materiel magazine (Incindiary)"
	desc = "A .50 anti-materiel rifle magazine loaded with incindiary ammo."
	special_ammo = TRUE
	ammo_type = /obj/item/ammo_casing/a50MG/incendiary

/obj/item/ammo_box/magazine/amr/penetrator
	name = "Anti-materiel magazine (penetrator)"
	desc = "A .50 anti-materiel rifle magazine loaded with wall-penetrating ammo."
	special_ammo = TRUE
	ammo_type = /obj/item/ammo_casing/a50MG/penetrator

/*
/obj/item/ammo_box/magazine/amr/uranium
	name = "Anti-materiel magazine (uranium)"
	desc = "A .50 anti-materiel rifle magazine loaded with crimes against god."
	special_ammo = TRUE
	ammo_type = /obj/item/ammo_casing/a50MG/uraniumtipped

/obj/item/ammo_box/magazine/sniper_rounds/soporific
	name = "sniper rounds (Zzzzz)"
	desc = "Soporific sniper rounds, designed for happy days and dead quiet nights..."
	icon_state = "soporific"
	max_ammo = 3
	caliber = ".50"

/obj/item/ammo_box/magazine/sniper_rounds/penetrator
	name = "sniper rounds (penetrator)"
	desc = "An extremely powerful round capable of passing straight through cover and anyone unfortunate enough to be behind it."
	max_ammo = 5
*/

/obj/item/ammo_box/magazine/m12g
	name = "shotgun magazine (12g buckshot)"
	desc = "A drum magazine."
	icon_state = "m12gb"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = "shotgun"
	max_ammo = 8

/obj/item/ammo_box/magazine/m12g/update_icon()
	..()
	icon_state = "[initial(icon_state)]-[CEILING(ammo_count(0)/8, 1)*8]"

/obj/item/ammo_box/magazine/m12g/stun
	name = "shotgun magazine (12g taser slugs)"
	icon_state = "m12gs"
	ammo_type = /obj/item/ammo_casing/shotgun/stunslug

/obj/item/ammo_box/magazine/m12g/slug
	name = "shotgun magazine (12g slugs)"
	icon_state = "m12gsl"
	ammo_type = /obj/item/ammo_casing/shotgun

/obj/item/ammo_box/magazine/m12g/dragon
	name = "shotgun magazine (12g dragon's breath)"
	icon_state = "m12gf"
	ammo_type = /obj/item/ammo_casing/shotgun/dragonsbreath

/obj/item/ammo_box/magazine/m12g/bioterror
	name = "shotgun magazine (12g bioterror)"
	icon_state = "m12gt"
	ammo_type = /obj/item/ammo_casing/shotgun/dart/bioterror

/obj/item/ammo_box/magazine/m12g/meteor
	name = "shotgun magazine (12g meteor slugs)"
	icon_state = "m12gbc"
	ammo_type = /obj/item/ammo_casing/shotgun/meteorslug

/obj/item/ammo_box/magazine/m12g/scatter
	name = "shotgun magazine (12g scatter laser shot slugs)"
	icon_state = "m12gb"
	ammo_type = /obj/item/ammo_casing/shotgun/laserslug

/*
---Fallout 13---
*/

/obj/item/ammo_box/magazine/d12g
	name = "shotgun drum magazine (12g slugs)"
	desc = "A 12g drum magazine."
	icon_state = "riotmag"
	ammo_type = /obj/item/ammo_casing/shotgun
	caliber = "shotgun"
	max_ammo = 12
	multiple_sprites = 2

/obj/item/ammo_box/magazine/d12g/empty
	start_empty = 1

// BETA STUFF // Obsolete
/obj/item/ammo_box/magazine/testbullet
	name = "Bulletcrate"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "m9mmds"
	ammo_type = /obj/item/ammo_casing/testcasing
	caliber = "9mm"
	max_ammo = 100
