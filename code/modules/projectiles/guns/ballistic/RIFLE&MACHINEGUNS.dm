////////////
//CARBINES//
////////////

//M1 Carbine				Keywords: 10mm, Semi-auto, 12/24 rounds, Long barrel
/obj/item/gun/ballistic/automatic/m1carbine
	name = "M1 carbine"
	desc = "The M1 Carbine was mass produced during some old war, and at some point NCR found stockpiles and rechambered them to 10mm to make up for the fact their service rifle production can't keep up with demand."
	icon_state = "m1carbine"
	item_state = "rifle"
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv
	burst_size = 1
	fire_delay = 2
	spread = 2
	extra_damage = 0
	extra_penetration = 0.1
	slowdown = 0.15
	automatic_burst_overlay = FALSE
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 22
	knife_y_offset = 21
	can_scope = TRUE
	scope_state = "scope_medium"
	scope_x_offset = 5
	scope_y_offset = 14
	can_attachments = TRUE
	can_automatic = TRUE
	semi_auto = TRUE
	can_suppress = TRUE
	suppressor_state = "rifle_suppressor"
	suppressor_x_offset = 26
	suppressor_y_offset = 31
	fire_sound = 'sound/f13weapons/varmint_rifle.ogg'


//M1/n Carbine				Keywords: NCR, 10mm, Semi-auto, 12/24 rounds, Long barrel, Damage +1
/obj/item/gun/ballistic/automatic/m1carbine/m1n
	name = "M1/N carbine"
	desc = "An M1 Carbine with markings identifying it as issued to the NCR Mojave Expedtionary Force. Looks beat up but functional."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "ncr-m1carbine"
	item_state = "rifle"
	extra_damage = 0


//M1A1 Carbine				Keywords: 10mm, Semi-auto, 12/24 rounds, Long barrel, Folding stock.
/obj/item/gun/ballistic/automatic/m1carbine/compact
	name = "M1A1 carbine"
	desc = "The M1A1 carbine is an improvement of the original, with this particular model having a folding stock allowing for greater mobility. Chambered in 10mm."
	icon_state = "m1a1carbine"
	var/stock = FALSE
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/gun/ballistic/automatic/m1carbine/compact/AltClick(mob/user)
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	toggle_stock(user)

/obj/item/gun/ballistic/automatic/m1carbine/compact/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Alt-click to toggle the stock.</span>"

/obj/item/gun/ballistic/automatic/m1carbine/compact/proc/toggle_stock(mob/living/user)
	stock = !stock
	if(stock)
		w_class = WEIGHT_CLASS_BULKY
		to_chat(user, "You unfold the stock.")
		spread = 2
	else
		w_class = WEIGHT_CLASS_NORMAL
		to_chat(user, "You fold the stock.")
		recoil = 0.2
		slowdown = 0.1
		spread = 5
	update_icon()

/obj/item/gun/ballistic/automatic/m1carbine/compact/update_icon_state()
	icon_state = "[initial(icon_state)][magazine ? "-[magazine.max_ammo]" : ""][chambered ? "" : "-e"][stock ? "" : "-f"]"


//WT-550								4.7mm, 20 round magazine
/obj/item/gun/ballistic/automatic/wt550
	name = "4.73mm carbine"
	desc = "A WT-550 Personal Defense Weapon, manufactured by West Tek. It fires 4.73mm caseless rounds."
	item_state = "m90"
	icon_state = "WT550"
	mag_type = /obj/item/ammo_box/magazine/m473/small
	burst_size = 1
	slowdown = 0.2
	is_automatic = TRUE
	automatic = TRUE
	extra_damage = 0
	autofire_shot_delay = 2.5
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	spread = 3 //foregrip
	fire_delay = 2.5
	can_bayonet = TRUE
	knife_x_offset = 25
	knife_y_offset = 12


////////////////////
//SEMI-AUTO RIFLES//
////////////////////


//Varmint rifle								Keywords: 5.56, 10/20/30 round magazine, 30dmg
/obj/item/gun/ballistic/automatic/varmint
	name = "varmint rifle"
	desc = "A simple bolt action rifle in 5.56mm calibre. Easy to use and maintain."
	icon_state = "varmint"
	item_state = "varmintrifle"
	force = 23
	slowdown = 0.15
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	init_mag_type = /obj/item/ammo_box/magazine/m556/rifle/small
	fire_delay = 1.5
	burst_size = 1
	recoil = 0.05
	spread = 0
	extra_damage = 0
	can_bayonet = FALSE
	semi_auto = TRUE
	automatic_burst_overlay = FALSE
	scope_state = "scope_short"
	scope_x_offset = 4
	scope_y_offset = 12
	can_suppress = TRUE
	suppressor_state = "rifle_suppressor"
	suppressor_x_offset = 27
	suppressor_y_offset = 31
	fire_sound = 'sound/f13weapons/varmint_rifle.ogg'
	can_scope = TRUE

//De Lisle carbine							Keywords: Pre-war, 9mm, Long barrel, Suppressed
/obj/item/gun/ballistic/automatic/delisle
	name = "De Lisle carbine"
	desc = "A integrally suppressed carbine, known for being one of the quietest firearms ever made. Chambered in 9mm."
	icon_state = "delisle"
	item_state = "varmintrifle"
	mag_type = /obj/item/ammo_box/magazine/m9mmds
	slowdown = 0.15
	recoil = 0.05
	extra_damage = 0
	fire_delay = 1.5
	burst_size = 1
	spread = 0
	can_scope = FALSE
	can_unsuppress = FALSE
	suppressed = 1
	fire_sound = 'sound/weapons/Gunshot_large_silenced.ogg'

//Commando carbine (BoS De Lisle variant)							Keywords: BoS, .45 ACP, 12 round magazine, Long barrel, Suppressed
/obj/item/gun/ballistic/automatic/delisle/commando
	name = "commando carbine"
	desc = "An integrally suppressed carbine, known for being one of the quietest firearms ever made. This modified version is often used by the Brotherhood of Steel. Its stock has been replaced by post-war polymer furniture, with space to mount a scope. Chambered in .45 ACP."
	icon_state = "commando"
	item_state = "commando"
	mag_type = /obj/item/ammo_box/magazine/m45exp
	can_scope = TRUE
	semi_auto = TRUE
	automatic_burst_overlay = FALSE
	scope_state = "scope_medium"
	scope_x_offset = 6
	scope_y_offset = 14

//'Verminkiller'									Keywords: 5.56, 10/20/30 round magazine, Suppressed, Scoped, 25 damage
//Basically an obtainable ratslayer
/obj/item/gun/ballistic/automatic/varmint/verminkiller
	name = "verminkiller rifle"
	desc = "Legends are told of the \"Ratslayer\", a custom-made souped-up varmint rifle with a sick paintjob. This is a pale imitation, made of chopped-up bits of other guns."
	icon_state = "verminrifle"
	item_state = "ratslayer"
	extra_damage = 0
	recoil = 0.05
	slowdown = 0.1
	suppressed = 1
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	can_unsuppress = FALSE
	suppressor_state = "none"
	fire_sound = 'sound/weapons/Gunshot_large_silenced.ogg'



//Combat Rifle		Keywords: .45 Caliber Rifle, No Attachments (!)
/obj/item/gun/ballistic/automatic/combat
	name = "Combat Rifle"
	desc = "A .45 semi-automatic combat rifle, produced pre-war for National Guard forces."
	icon_state = "combat_rifle"
	item_state = "combatrifle"
	icon_prefix = "combatrifle"
	mag_type = /obj/item/ammo_box/magazine/tommygunm45/stick
	fire_delay = 2.5
	recoil = 0.2
	burst_size = 1
	spread = 1
	extra_damage = 7
	slowdown = 0.1
	can_attachments = FALSE
	automatic_burst_overlay = FALSE
	semi_auto = TRUE
	fire_sound = 'sound/f13weapons/combatrifle.ogg'

//Service rifle			Keywords: NCR, 5.56mm, Semi-auto, 20 (10-50) round magazine, 25dmg
/obj/item/gun/ballistic/automatic/service
	name = "service rifle"
	desc = "A 5.56x45 semi-automatic service rifle manufactured by the NCR and issued to all combat personnel."
	icon_state = "service_rifle"
	item_state = "servicerifle"
	icon_prefix = "servicerifle"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	slowdown = 0.3
	recoil = 0.2
	fire_delay = 2.5
	burst_size = 1
	spread = 1
	extra_damage = 0
	can_attachments = TRUE
	automatic_burst_overlay = FALSE
	semi_auto = TRUE
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 22
	knife_y_offset = 21
	fire_sound = 'sound/f13weapons/varmint_rifle.ogg'

//ALR15			Keywords: Donor, 5.56mm, Semi-auto
/obj/item/gun/ballistic/automatic/service/alr
	name = "ALR15"
	desc = "A 5.56x45mm rifle custom built off of a reproduction model AR15-style weapon. Sports a fancy holographic sight picture, forward grip, and a comfortable synthetic thumbhole stock. Bang bang."
	icon_state = "alr15"
	item_state = "alr15"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	slowdown = 0.3
	recoil = 0.2
	fire_delay = 2.5
	burst_size = 2
	spread = 1
	extra_damage = 0
	can_attachments = FALSE
	automatic_burst_overlay = FALSE
	semi_auto = TRUE
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 22
	knife_y_offset = 21
	fire_sound = 'sound/f13weapons/varmint_rifle.ogg'


//Scout carbine			Keywords: NCR, 5.56mm, Semi-auto, 20 (10-50) round magazine. Special modifiers: spread -1
/obj/item/gun/ballistic/automatic/service/carbine
	name = "scout carbine"
	desc = "A cut down version of the standard-issue service rifle tapped with mounting holes for a scope. Shorter barrel, lower muzzle velocity."
	icon_state = "scout_carbine"
	spread = 4
	fire_delay = 2
	recoil = 0.3
	slowdown = 0.1
	extra_damage = 25
	can_scope = TRUE
	scope_state = "scope_short"
	scope_x_offset = 4
	scope_y_offset = 15
	suppressor_x_offset = 26
	suppressor_y_offset = 28

//Marksman carbine			Keywords: 5.56mm, Semi-auto, 20 (10-50) round magazine, Small scope
/obj/item/gun/ballistic/automatic/marksman
	name = "marksman carbine"
	desc = "A marksman carbine built off the AR platform chambered in 5.56x45. Seen heavy usage in pre-war conflicts. This particular model is a civilian version and is semi-auto only."
	icon_state = "marksman_rifle"
	item_state = "marksman"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	fire_delay = 3
	recoil = 0.1
	extra_damage = 0
	slowdown = 0.3
	burst_size = 1
	spread = 1
	can_attachments = TRUE
	semi_auto = TRUE
	automatic_burst_overlay = FALSE
	can_scope = FALSE
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	can_bayonet = FALSE
	bayonet_state = "rifles"
	knife_x_offset = 22
	knife_y_offset = 12
	can_suppress = TRUE
	suppressor_state = "suppressor"
	suppressor_x_offset = 31
	suppressor_y_offset = 15
	fire_sound = 'sound/f13weapons/marksman_rifle.ogg'

/obj/item/gun/ballistic/automatic/marksman/policerifle
	name = "Police Rifle"
	desc = "A pre-war Rifle that has been constantly repaired and rebuilt by the Oasis Police Department. Held together by duct tape and prayers, it somehow still shoots. This one has been re-chambered to 5.56"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_prefix = "assault_carbine"
	icon_state = "rifle-police"
	item_state = "assault_carbine"
	init_mag_type = /obj/item/ammo_box/magazine/m556/rifle
	extra_damage = 0
	recoil = 0.3
	slowdown = 0.3
	spread = 5
	fire_delay = 4
	can_suppress = FALSE
	can_scope = FALSE
	zoomable = FALSE

//Colt Rangemaster				Keywords: 7.62mm, Semi-auto, 10/20 round magazine, 35dmg
/obj/item/gun/ballistic/automatic/rangemaster
	name = "Colt Rangemaster"
	desc = "A Colt Rangemaster semi-automatic rifle, chambered for 7.62x51. Single-shot only."
	icon_state = "rangemaster"
	item_state = "308"
	icon_prefix = "308"
	force = 20
	mag_type = /obj/item/ammo_box/magazine/m762
	extra_damage = 0
	burst_size = 1
	fire_delay = 4
	recoil = 0.3
	slowdown = 0.4
	spread = 1
	automatic_burst_overlay = FALSE
	semi_auto = TRUE
	can_attachments = TRUE
	can_scope = TRUE
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 24
	knife_y_offset = 21
	scope_state = "scope_long"
	scope_x_offset = 4
	scope_y_offset = 11
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'


// Enfield SLR				Keywords: 7.62mm, Semi-auto, 10/20 round magazine
/obj/item/gun/ballistic/automatic/slr
	name = "Enfield SLR"
	desc = "A self-loading rifle in 7.62mm NATO. Semi-auto only."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "slr"
	item_state = "slr"
	force = 20
	mag_type = /obj/item/ammo_box/magazine/m762
	burst_size = 1
	fire_delay = 4
	slowdown = 0.3
	recoil = 0.3
	spread = 1
	automatic_burst_overlay = FALSE
	semi_auto = TRUE
	can_attachments = TRUE
	can_scope = TRUE
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 24
	knife_y_offset = 21
	scope_state = "scope_long"
	scope_x_offset = 4
	scope_y_offset = 11
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'


//M1 Garand					Keywords: .308, Semi-auto, 8 rounds internal
/obj/item/gun/ballistic/automatic/m1garand
	name = "M1 Garand"
	desc = "The WWII American Classic. Still has that satisfiying ping."
	icon_state = "m1garand"
	item_state = "rifle"
	icon_prefix = "308"
	force = 20
	slowdown = 0.2
	recoil = 0.3
	mag_type = /obj/item/ammo_box/magazine/garand308
	extra_damage = 0
	fire_delay = 4
	burst_size = 1
	spread = 1
	en_bloc = 1
	auto_eject = 1
	semi_auto = TRUE
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 22
	knife_y_offset = 21
	can_scope = TRUE
	scope_state = "scope_long"
	scope_x_offset = 5
	scope_y_offset = 14
	auto_eject_sound = 'sound/f13weapons/garand_ping.ogg'
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'

/obj/item/gun/ballistic/automatic/m1garand/update_icon()
	..()
	icon_state = "[initial(icon_state)]"

/obj/item/gun/ballistic/automatic/m1garand/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return




//SKS				Keywords: LEGION, .308, Semi-auto, 10 rounds internal, Penetration +0.1
/obj/item/gun/ballistic/automatic/m1garand/sks
	name = "SKS"
	desc = "Old hunting rifle taken from disovered stockpiles and refurbished in Phoenix workshops. The standard heavy rifle of the Legion, still rare. .308, semi-auto only, internal magazine."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "sks"
	item_state = "sks"
	mag_type = /obj/item/ammo_box/magazine/sks
	fire_delay = 4
	slowdown = 0.3
	recoil = 0.2
	extra_damage = 0
	bayonet_state = "bayonet"
	knife_x_offset = 24
	knife_y_offset = 23
	scope_state = "scope_mosin"
	scope_x_offset = 4
	scope_y_offset = 12
	auto_eject_sound = 'sound/weapons/magout.ogg'
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'


//DKS 501 sniper rifle				Keywords: .308, Semi-auto, 7 round magazine, Scoped, Extra speed +500, Fire delay +1, 45dmg
/obj/item/gun/ballistic/automatic/marksman/sniper
	name = "sniper rifle"
	desc = "A DKS 501, chambered in .308 Winchester.  With a light polymer body, it's suited for long treks through the desert."
	icon_prefix = "sniperrifle"
	icon_state = "sniper_rifle"
	item_state = "sniper_rifle"
	mag_type = /obj/item/ammo_box/magazine/w308
	fire_delay = 3
	burst_size = 1
	extra_damage = 0
	slowdown = 0.4
	recoil = 0.3
	zoom_amt = 10
	zoom_out_amt = 13
	semi_auto = TRUE
	can_automatic = FALSE
	can_bayonet = FALSE
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'

/obj/item/gun/ballistic/automatic/marksman/sniper/gold
	name = "golden sniper rifle"
	desc = "A DKS 501, chambered in .308 Winchester. This one has a gold trim and the words 'Old Cassius' engraved into the stock."
	icon_state = "gold_sniper"
	item_state = "gold_sniper"
	slowdown = 0

/obj/item/gun/ballistic/automatic/marksman/sniper/snipervenator
	name = "Explorer sniper rifle"
	desc = "The customized sniper rifle is decorated with the flag of the bull and tokens of a hunt."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/backslot_weapon.dmi'
	icon_state = "venator_sniper"
	item_state = "venator_sniper"
	fire_delay = 3
	slowdown = 0.4
	recoil = 0.3
	zoom_amt = 15
	zoom_out_amt = 17
	extra_damage = 0

/obj/item/gun/ballistic/automatic/marksman/sniper/sniperranger
	name = "compact sniper rifle"
	desc = "A DKS 501, chambered in .308 Winchester.  With a light polymer body, it's suited for long treks through the desert. This particular model is lighter and faster."
	slowdown = 0.25
	fire_delay = 6


	//Destroyer carbine										Keywords: 9mm, Automatic, 30 rounds, Long barrel, Suppressor
/obj/item/gun/ballistic/automatic/hobo/destroyer
	name = "destroyer carbine"
	desc = "There are many ways to describe this, very few of them nice. This is a 9mm silenced bolt action rifle - that via the expertise of a gun runner mainlining 50 liters of psycho, mentats, and turbo - has been converted into a semi auto."
	icon_state = "destroyer-carbine"
	item_state = "varmintrifle"
	mag_type = /obj/item/ammo_box/magazine/greasegun
	extra_damage = 0
	slowdown = 0.1
	recoil = 0.3
	fire_delay = 5
	burst_size = 1
	can_attachments = FALSE
	can_automatic = TRUE
	automatic_burst_overlay = TRUE
	can_scope = FALSE
	scope_state = "scope_medium"
	scope_x_offset = 6
	scope_y_offset = 14
	semi_auto = FALSE


//Obrez, sawn off bolt action rifle						Keywords: .308, 5 round internal
/obj/item/gun/ballistic/rifle/hunting/obrez
	name = "Obrez"
	desc = "A cut down bolt action rifle. Uses .308."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "308-sawn"
	item_state = "308-sawn"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slowdown = 0.1
	recoil = 0.4
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/hunting
	extra_speed = 0
	spread = 6
	force = 16
	can_scope = FALSE


//////////////////
//ASSAULT RIFLES//
//////////////////


//Auto-pipe rifle										Keywords: .357, 18 round belt, Extra damage -8, no AP (bullet hose style)
/obj/item/gun/ballistic/automatic/autopipe
	name = "Auto-pipe rifle (.357)"
	desc = "A belt fed pipe rifle held together with duct tape. Highly inaccurate. What could go wrong."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "autopipe"
	item_state = "autopipe"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/autopipe
	force = 20
	slowdown = 0.1
	recoil = 0.3
	extra_damage = 0
	burst_size = 4
	fire_delay = 4
	burst_shot_delay = 6
	spread = 15
	fire_sound = 'sound/weapons/Gunshot.ogg'

/obj/item/gun/ballistic/automatic/autopipe/update_icon_state()
	icon_state = "autopipe[magazine ? "-[CEILING(get_ammo(0)/1, 6)*1]" : ""][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"



//M16A2 assault rifle				Keywords: 5.56mm, Automatic, 30 (10-50) round magazine, 25dmg
/obj/item/gun/ballistic/automatic/assault_rifle
	name = "assault rifle"
	desc = "An 5.56mm assault rifle, designated M16A2. Although somewhat antiquated by the time of the Great War, this model of rifle was widely used by state-side military units, making it relatively common today."
	icon_state = "m16a2"
	item_state = "assault_rifle"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle/assault
	fire_delay = 3
	slowdown = 0.3
	spread = 8
	extra_damage = 0
	recoil = 0.2
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.7
	can_attachments = TRUE
	can_bayonet = TRUE
	bayonet_state = "rifles"
	knife_x_offset = 23
	knife_y_offset = 11
	can_suppress = TRUE
	suppressor_x_offset = 32
	suppressor_y_offset = 15
	suppressor_state = "ar_suppressor"
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/assault_carbine.ogg'


//Infiltrator			Keywords: 5.56mm, Automatic, 20 (10-50) round magazine, Suppressed, Small scope, Pistol grip
/obj/item/gun/ballistic/automatic/assault_rifle/infiltrator
	name = "infiltrator"
	desc = "A customized assault rifle, with an integrated suppressor, small scope, cut down stock and polymer furniture."
	icon_state = "infiltrator"
	item_state = "fnfal"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	spread = 12
	fire_delay = 3
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.7
	slowdown = 0.15
	recoil = 0.5
	can_suppress = FALSE
	can_unsuppress = FALSE
	suppressed = 1
	can_bayonet = FALSE
	can_scope = FALSE
	zoomable = TRUE
	zoom_amt = 6
	zoom_out_amt = 9
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/weapons/Gunshot_large_silenced.ogg'


//R93 PDW		Keywords: 5.56mm, Semi-Automatic, 20 (10-50) round magazine, Pistol grip
/obj/item/gun/ballistic/automatic/r93
	name = "R93 PDW"
	desc = "A lightweight assault rifle manufactured by the Brotherhood of Steel with a folding stock, based on weapons from the R-series platforms. It is generally issued to Brotherhood Knights for scouting missions."
	icon_state = "r93"
	item_state = "r93"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	fire_delay = 3
	spread = 1
	extra_damage = 0
	burst_size = 1
	can_attachments = FALSE
	semi_auto = TRUE
	automatic_burst_overlay = FALSE
	can_scope = FALSE
	zoomable = TRUE
	zoom_amt = 6
	zoom_out_amt = 9
	can_bayonet = FALSE
	fire_sound = 'sound/weapons/Gunshot_large_silenced.ogg'

//Type 93 Chinese rifle				Keywords: 5.56mm, Automatic, 20 (10-50) round magazine, 26dmg
/obj/item/gun/ballistic/automatic/type93
	name = "type 93 assault rifle"
	desc = "The Type 93 Chinese assault rifle was designed and manufactured by a Chinese industrial conglomerate for the People's Liberation Army during the Resource Wars, for the purpose of equipping the Chinese infiltrators and American fifth-columnists. Chambered in 5.56x45."
	icon_state = "type93"
	item_state = "handmade_rifle"
	icon_prefix = "handmade_rifle"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	fire_delay = 3
	spread = 12
	extra_damage = 2
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.7
	slowdown = 0.3
	recoil = 0.3
	can_suppress = TRUE
	suppressor_state = "rifle_suppressor"
	suppressor_x_offset = 27
	suppressor_y_offset = 27
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'

/obj/item/gun/ballistic/automatic/type93/worn //24dmg
	name = "\improper Worn Type 93"
	desc = "This Type 93 Chinese assault rifle looks like it has been made in a garage. The bore is shot to hell, the threading is destroyed, but atleast it works."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "type93"
	item_state = "handmade_rifle"
	fire_delay = 6
	spread = 16
	extra_damage = -4
	can_suppress = FALSE





//Assault Carbine				Keywords: 5mm, Automatic, 30 round magazine, Flashlight, 20dmg/0.25AP
/obj/item/gun/ballistic/automatic/assault_carbine
	name = "assault carbine"
	desc = "The U.S. army carbine version of the R91, made by Colt and issued to special forces."
	icon_state = "assault_carbine"
	item_state = "assault_carbine"
	icon_prefix = "assault_carbine"
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	fire_delay = 3
	spread = 10
	is_automatic = TRUE
	slowdown = 0.3
	recoil = 0.2
	automatic = 1
	autofire_shot_delay = 2.7
	extra_damage = 0
	can_attachments = TRUE
	can_scope = TRUE
	scope_state = "scope_short"
	scope_x_offset = 4
	scope_y_offset = 15
	can_suppress = TRUE
	suppressor_state = "rifle_suppressor"
	suppressor_x_offset = 26
	suppressor_y_offset = 28
	can_flashlight = TRUE
	gunlight_state = "flightangle"
	flight_x_offset = 21
	flight_y_offset = 21
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/assault_carbine.ogg'

	//Police rifle			Keywords: OASIS, 5mm, Semi-auto, 30 round magazine
/obj/item/gun/ballistic/automatic/assault_carbine/policerifle
	name = "Police Rifle"
	desc = "A pre-war Rifle that has been constantly repaired and rebuilt by the Oasis Police Department. Held together by duct tape and prayers, it somehow still shoots."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "rifle-police"
	fire_delay = 4
	extra_damage = 0
	autofire_shot_delay = 3.1
	spread = 12
	can_scope = TRUE

/obj/item/gun/ballistic/automatic/assault_carbine/worn
	name = "worn assault carbine"
	desc = "The U.S. army carbine version of the R91, made by Colt and issued to special forces. This one is beat-up and falling apart."
	icon_state = "assault_carbine"
	fire_delay = 4
	spread = 14
	autofire_shot_delay = 3
	extra_damage = 0

//FN-FAL				Keywords: 7.62mm, Automatic, 10/20 round magazine
/obj/item/gun/ballistic/automatic/fnfal
	name = "FN FAL"
	desc = "This rifle has been more widely used by armed forces than any other rifle in history. It's a reliable assault weapon for any terrain or tactical situation."
	icon_state = "fnfal"
	item_state = "fnfal"
	force = 20
	slowdown = 0.4
	recoil = 0.3
	extra_damage = 0
	fire_delay = 4
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.7
	mag_type = /obj/item/ammo_box/magazine/m762/ext
	spread = 15
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'

obj/item/gun/ballistic/automatic/bar
	name = "automatic rifle (.308)"
	desc = "An ancient machine gun that looks like outdated even by pre-war standards. It has Colt etched on one-side and Sierra Madre on the other. It is alarmingly heavy for a rifle."
	icon = 'icons/fallout/objects/guns/bar.dmi'
	slot_flags = ITEM_SLOT_BACK
	icon_state = "BAR"
	item_state = "BAR"
	icon_prefix = "rifle"
	automatic = 1
	mag_type = /obj/item/ammo_box/magazine/m762/ext
	force = 24 //club
	slowdown = 0.5
	autofire_shot_delay = 4.5
	extra_damage = 0
	extra_penetration = 0
	spread = 8
	recoil = 0.3
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/automaticrifle_BAR.ogg'

//H&K G3				Keywords: 7.62mm, Automatic, 10/20 round magazine
//Needs work -Oddherring
/obj/item/gun/ballistic/automatic/g3
	name = "G3"
	desc = "A 7.62mm German battle rifle."
	icon_state = "g3"
	item_state = "fnfal"
	force = 20
	extra_damage = 28
	extra_penetration = 0.1
	extra_speed = 400
	fire_delay = 3.5
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 1.9
	mag_type = /obj/item/ammo_box/magazine/m762/ext
	spread = 12
	recoil = 0.25
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/ServiceRifle.ogg'

//H&K G11				Keywords: 4.73mm, Automatic, 50 round magazine
/obj/item/gun/ballistic/automatic/g11
	name = "G11"
	desc = "This experimental gun fires a caseless cartridge consisting of a block of propellant with a bullet buried inside. The weight and space savings allows for a very high magazine capacity. Chambered in 4.73mm."
	icon_state = "g11"
	item_state = "arg"
	mag_type = /obj/item/ammo_box/magazine/m473
	burst_size = 1
	extra_damage = 0
	fire_delay = 4
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.7
	burst_shot_delay = 3
	spread = 6
	slowdown = 0.3
	recoil = 0.2
	can_attachments = TRUE
	semi_auto = TRUE
	can_scope = FALSE
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	actions_types = list(/datum/action/item_action/toggle_firemode)
	select = 0

////////////////
//MACHINE-GUNS//
////////////////


//R84 Light machinegun				Keywords: NCR, 5.56mm, Automatic, 60 rounds, Damage decrease (bullethose)
/obj/item/gun/ballistic/automatic/r84
	name = "R84 LMG"
	desc = "A light machinegun using 60 round belts fed from an ammobox, its one of the few heavy weapons designs NCR has produced."
	icon_state = "R84"
	item_state = "R84"
	slowdown = 1
	mag_type = /obj/item/ammo_box/magazine/lmg
	extra_damage = 0
	fire_delay = 4
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.3
	spread = 8
	can_attachments = FALSE
	actions_types = null
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'

//LSW Squad Support Weapon				Keywords: 5.56mm, Automatic, 20 (10-50) round magazine, Scoped, Damage decrease (bullethose)
/obj/item/gun/ballistic/automatic/lsw
	name = "Light Support Weapon"
	desc = "This squad-level support weapon has a bullpup design. The bullpup design makes it difficult to use while lying down. Because of this it was remanded to National Guard units. It, however, earned a reputation as a reliable weapon that packs a lot of punch for its size."
	icon = 'icons/obj/guns/projectile.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "lsw"
	item_state = "lsw"
	slowdown = 1
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	fire_delay = 4
	autofire_shot_delay = 2.3
	is_automatic = TRUE
	automatic = 1
	extra_damage = 23
	spread = 12
	spawnwithmagazine = TRUE
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	can_attachments = TRUE
	can_scope = FALSE
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'


//M1919 Machinegun				Keywords: LEGION, .308, Automatic, 80 round belt. Special modifiers: damage decrease bullethose
/obj/item/gun/ballistic/automatic/m1919
	name = "Browning M1919"
	desc = "This ancient machine gun has been dug up and put into working order by the Legion Forgemasters. It's loud, heavy and terrifying."
	icon_state = "M38"
	item_state = "M38"
	slot_flags = 0
	slowdown = 1
	mag_type = /obj/item/ammo_box/magazine/mm762
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.3
	fire_delay = 4
	extra_damage = 0
	spread = 12
	can_attachments = FALSE
	var/cover_open = FALSE
	var/require_twohands = FALSE
	actions_types = null
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'

/obj/item/gun/ballistic/automatic/m1919/update_icon()
	icon_state = "M38[cover_open ? "open" : "closed"][magazine ? CEILING(get_ammo(0)/20, 1)*20 : "-empty"]"
	item_state = "M38[cover_open ? "open" : "closed"][magazine ? "mag" : "nomag"]"

/obj/item/gun/ballistic/automatic/m1919/examine(mob/user)
	. = ..()
	if(cover_open && magazine)
		. += "<span class='notice'>It seems like you could use an <b>empty hand</b> to remove the magazine.</span>"

/obj/item/gun/ballistic/automatic/m1919/attack_self(mob/user)
	cover_open = !cover_open
	to_chat(user, "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>")
	if(cover_open)
		playsound(user, 'sound/weapons/sawopen.ogg', 60, 1)
	else
		playsound(user, 'sound/weapons/sawclose.ogg', 60, 1)
	update_icon()

/obj/item/gun/ballistic/automatic/m1919/afterattack(atom/target as mob|obj|turf, mob/living/user as mob|obj, flag, params) //what I tried to do here is just add a check to see if the cover is open or not and add an icon_state change because I can't figure out how c-20rs do it with overlays
	if(cover_open)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
	else
		. = ..()
		update_icon()

/obj/item/gun/ballistic/automatic/m1919/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(loc != user)
		..()
		return	//let them pick it up
	if(!cover_open || (cover_open && !magazine))
		..()
	else if(cover_open && magazine)
		//drop the mag
		magazine.update_icon()
		magazine.forceMove(drop_location())
		user.put_in_hands(magazine)
		magazine = null
		update_icon()
		to_chat(user, "<span class='notice'>You remove the magazine from [src].</span>")
		playsound(user, 'sound/weapons/magout.ogg', 60, 1)

/obj/item/gun/ballistic/automatic/m1919/attackby(obj/item/A, mob/user, params)
	if(!cover_open && istype(A, mag_type))
		to_chat(user, "<span class='warning'>[src]'s cover is closed! You can't insert a new mag.</span>")
		return
	..()




	//Pipe rifle (add multi calibre options)				Keywords: .223, 1 round internal
/obj/item/gun/ballistic/revolver/hobo/piperifle
	name = "pipe rifle (.223)"
	desc = "A rusty piece of pipe used to fire .223 and 5,56mm ammo."
	icon_state = "piperifle"
	item_state = "pepperbox"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/improvisedpipe
	force = 16
	fire_delay = 5
	extra_damage = 0
	spread = 8
	fire_sound = 'sound/weapons/Gunshot.ogg'

/obj/item/gun/ballistic/revolver/hobo/piperifle/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0, stam_cost = 0)
	if(prob(1))
		playsound(user, fire_sound, 50, 1)
		to_chat(user, "<span class='userdanger'>[src] misfires, detonating the round in the barrel prematurely!</span>")
		user.take_bodypart_damage(0,20)
		user.dropItemToGround(src)
		return FALSE
	..()

	

	``REPEATERS``


	/obj/item/gun/ballistic/rifle/repeater
	name = "repeater template"
	desc = "should not exist"
	can_scope = TRUE
	scope_state = "scope_long"
	fire_delay = 4
	slowdown = 0.2
	scope_x_offset = 5
	scope_y_offset = 13
	pump_sound = 'sound/f13weapons/cowboyrepeaterreload.ogg'

/obj/item/gun/ballistic/rifle/repeater/shoot_live_shot(mob/living/user, pointblank = FALSE, mob/pbtarget, message = 1, stam_cost = 0)
	..()
	src.pump(user)


//Cowboy Repeater						Keywords: .357, Lever action, 12 round internal, Long barrel
/obj/item/gun/ballistic/rifle/repeater/cowboy
	name = "cowboy repeater"
	desc = "A lever action rifle chambered in .357 Magnum. Smells vaguely of whiskey and cigarettes."
	icon_state = "cowboyrepeater"
	item_state = "cowboyrepeater"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube357
	extra_damage = 10
	slowdown = 0.2
	recoil = 0.3
	fire_sound = 'sound/f13weapons/cowboyrepeaterfire.ogg'


//Trail carbine							Keywords: .44, Lever action, 12 round internal, Long barrel
/obj/item/gun/ballistic/rifle/repeater/trail
	name = "trail carbine"
	desc = "A lever action rifle chambered in .44 Magnum."
	icon_state = "trailcarbine"
	item_state = "trailcarbine"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube44
	extra_damage = 7
	fire_sound = 'sound/f13weapons/44mag.ogg'


//Brush gun								Keywords: .45-70, Lever action, 10 round internal, Long barrel
/obj/item/gun/ballistic/rifle/repeater/brush
	name = "brush gun"
	desc = "A short lever action rifle chambered in the heavy 45-70 round. Issued to NCR Veteran Rangers in the absence of heavier weaponry."
	icon_state = "brushgun"
	item_state = "brushgun"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube4570
	extra_damage = 0
	extra_penetration = 0
	fire_delay = 4
	slowdown = 0.3
	recoil = 0.2
	fire_sound = 'sound/f13weapons/brushgunfire.ogg'



``BOLT ACTION``



//Hunting Rifle							Keywords: .308, Bolt-action, 5 rounds internal
/obj/item/gun/ballistic/rifle/hunting
	name = "hunting rifle"
	desc = "A sturdy hunting rifle, chambered in .308. and in use before the war."
	icon_state = "308"
	item_state = "308"
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/hunting
	sawn_desc = "A hunting rifle, crudely shortened with a saw. It's far from accurate, but the short barrel makes it quite portable."
	fire_delay = 5
	slowdown = 0.3
	recoil = 0.2
	extra_damage = 0
	extra_penetration = 0
	extra_speed = 0
	spread = 0
	force = 18
	can_scope = TRUE
	scope_state = "scope_long"
	scope_x_offset = 4
	scope_y_offset = 12
	pump_sound = 'sound/weapons/boltpump.ogg'
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'

/obj/item/gun/ballistic/rifle/hunting/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/circular_saw) || istype(A, /obj/item/gun/energy/plasmacutter))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

//Remington rifle						Keywords: 7.62, Bolt-action, 5 rounds internal
/obj/item/gun/ballistic/rifle/hunting/remington
	name = "Remington rifle"
	desc = "A militarized hunting rifle rechambered to 7.62. This one has had the barrel floated with shims to increase accuracy."
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/hunting/remington
	fire_delay = 5
	extra_damage = 0
	force = 18

/obj/item/gun/ballistic/rifle/hunting/remington/attackby(obj/item/A, mob/user, params) //DO NOT BUBBA YOUR STANDARD ISSUE RIFLE SOLDIER!
	if(istype(A, /obj/item/circular_saw) || istype(A, /obj/item/gun/energy/plasmacutter))
		return
	else if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			return
	else
		..()







//Mosin-Nagant							Keywords: 7.62, Bolt-action, 5 rounds internal
/obj/item/gun/ballistic/rifle/mosin
	name = "Mosin-Nagant m38"
	desc = "A rusty old Russian bolt action chambered in 7.62."
	icon_state = "mosin"
	item_state = "308"
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction
	extra_damage = 0
	slowdown = 0.4
	recoil = 0.2
	fire_delay = 5
	force = 18
	can_scope = TRUE
	scope_state = "scope_mosin"
	scope_x_offset = 3
	scope_y_offset = 13
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 22
	knife_y_offset = 21
	pump_sound = 'sound/weapons/boltpump.ogg'
	fire_sound = 'sound/f13weapons/boltfire.ogg'

//Lee-Enfield,SMLE 						Keywords: 7.62, Bolt-action, 5 rounds internal, very fast firing rate, high stamina cost on working bolt
/obj/item/gun/ballistic/rifle/enfield
	name = "Lee-Enfield rifle"
	desc = "A british rifle sometimes known as the SMLE. It seems to have been re-chambered in .308."
	icon_state = "enfield2"
	item_state = "308"
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction
	extra_damage = 0
	fire_delay = 5
	recoil = 0.2
	slowdown = 0.4
	force = 16
	can_scope = TRUE
	scope_state = "scope_mosin"
	scope_x_offset = 3
	scope_y_offset = 13
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 22
	knife_y_offset = 21
	pump_sound = 'sound/weapons/boltpump.ogg'
	fire_sound = 'sound/f13weapons/boltfire.ogg'



	

	``````````````````
	``pump_stam_cost = 0 //bobnote, keep this in mind bob...``
