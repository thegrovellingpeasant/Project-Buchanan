``LASERS FIRST``
``PLASMA LAST``



``PISTOLS GO FIRST``



/obj/item/gun/energy/laser
	name = "energy weapon template"
	desc = "Should not exists. Bugreport."
	icon_state = "laser"
	item_state = "laser"
	slowdown = 0.3
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	custom_materials = list(/datum/material/iron=2000)
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun)
	ammo_x_offset = 1
	shaded_charge = 1
	var/select = 1

/obj/item/gun/energy/laser/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return
	if(istype(A, /obj/item/stock_parts/cell/ammo))
		var/obj/item/stock_parts/cell/ammo/AM = A
		if(istype(AM, cell_type))
			var/obj/item/stock_parts/cell/ammo/oldcell = cell
			if(user.transferItemToLoc(AM, src))
				cell = AM
				if(oldcell)
					to_chat(user, "<span class='notice'>You perform a tactical reload on \the [src], replacing the cell.</span>")
					oldcell.dropped()
					oldcell.forceMove(get_turf(src.loc))
					oldcell.update_icon()
				//else
				//	to_chat(user, "<span class='notice'>You insert the cell into \the [src].</span>")

				//playsound(src, 'sound/weapons/autoguninsert.ogg', 60, TRUE)
				//chamber_round()
				A.update_icon()
				update_icon()
				return 1
			else
				to_chat(user, "<span class='warning'>You cannot seem to get \the [src] out of your hands!</span>")

/obj/item/gun/energy/laser/proc/burst_select()
	var/mob/living/carbon/human/user = usr
	select = !select
	if(!select)
		disable_burst()
		to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	else
		enable_burst()
		to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")

/obj/item/gun/energy/laser/proc/enable_burst()
	burst_size = initial(burst_size)

/obj/item/gun/energy/laser/proc/disable_burst()
	burst_size = 1









``PISTOLS``


//Wattz 1000 Laser pistol
/obj/item/gun/energy/laser/pistol/wattz
	name = "Wattz 1000 laser pistol"
	desc = "A Wattz 1000 Laser Pistol. Civilian model, so the wattage is lower than military or police versions. Uses small energy cells."
	icon = 'icons/fallout/objects/guns/energy.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "wattz1000"
	item_state = "laser-pistol"
	fire_delay = 1
	slowdown = 0.1
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/wattz)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

//Watss 1000 Magneto-laser pistol
/obj/item/gun/energy/laser/pistol/wattz/magneto
	name = "Wattz 1000 magneto-laser pistol"
	desc = "This Wattz 1000 laser pistol has been upgraded with a magnetic field targeting system that tightens the laser emission, giving this pistol extra penetrating power."
	icon_state = "magnetowattz"
	fire_delay = 0
	item_state = "laser-pistol"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/wattz/magneto)

/obj/item/gun/energy/laser/pistol/recharger
	name = "Recharger Pistol"
	desc = "A recharger pistol manufactured by the Followers of the Apocalpyse. As the name implied, it charges its capacitor banks over time using radioactive decay."
	can_remove = 0
	can_charge = 0
	slowdown = 0.1
	fire_delay = 1
	selfcharge = 1
	icon_state = "rechargerpistol"
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/recharger)
	cell_type = /obj/item/stock_parts/cell/ammo/breeder
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'
'


``BORGS`



`
/obj/item/gun/energy/laser/pistol/cyborg
	name = "\improper assaultron AEP7 laser eye"
	desc = "A basic energy-based laser projector that fires concentrated beams of light from your eye! It draws power from your cell so try not to go crazy."
	can_scope = FALSE
	can_charge = FALSE
	selfcharge = EGUN_SELFCHARGE_BORG
	cell_type = /obj/item/stock_parts/cell/secborg
	charge_delay = 3

/obj/item/gun/energy/laser/pistol/cyborg/gutsy
	name = "\improper integrated laser pistol"
	desc = "An integrated laser pistol that draws power directly from your cell."


/AEP 7 Laser pistol
/obj/item/gun/energy/laser/pistol/aer7
	name = "\improper AEP7 laser pistol"
	desc = "A basic energy-based laser gun that fires concentrated beams of light."
	slowdown = 0.15
	icon_state = "AEP7"
	item_state = "laser-pistol"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/aer7)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	fire_delay = 1
	can_scope = FALSE
	scope_state = "AEP7_scope"
	scope_x_offset = 7
	scope_y_offset = 22
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

/obj/item/gun/energy/laser/pistol/compbeam
	name = "AEP5-CR Disabling Beam Pistol"
	desc = "A laser pistol that has been modified for less-than-lethal work."
	slowdown = 0.25
	icon = 'icons/fallout/objects/guns/energy.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "AEP5CR"
	item_state = "AEP5CR"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/compbeam)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	fire_delay = 1
	can_scope = FALSE
	scope_state = "AEP7_scope"
	scope_x_offset = 7
	scope_y_offset = 22
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'



////////////////
//LASER RIFLES//
////////////////

//Laser musket
/obj/item/gun/ballistic/rifle/hobo/lasmusket
	name = "Laser Musket"
	desc = "In the wasteland, one must make do. And making do is what the creator of this weapon does. Made from metal scraps, electronic parts. an old rifle stock and a bottle full of dreams, the Laser Musket is sure to stop anything in their tracks and make those raiders think twice."
	icon_state = "lasmusket"
	item_state = "lasmusket"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/lasmusket
	fire_delay = 10
	slowdown = 0.25
	dryfire_sound = 'sound/f13weapons/noammoenergy.ogg'
	dryfire_text = "*power failure*"
	var/bolt_open = FALSE
	can_bayonet = TRUE
	knife_x_offset = 22
	knife_y_offset = 20
	bayonet_state = "bayonet"
	scope_state = "scope_long"
	scope_x_offset = 11
	scope_y_offset = 14
	fire_sound = 'sound/f13weapons/lasmusket_fire.ogg'
	pump_sound = 'sound/f13weapons/lasmusket_crank.ogg'
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

	//Solar Scorcher
/obj/item/gun/energy/laser/rifle/solar
	name = "\improper Solar Scorcher"
	fire_delay = 1
	slowdown = 0.3
	desc = "This modified AEP7 laser pistol takes its power from the sun, recharging slowly using stored solar energy. However, it cannot be recharged manually as a result."
	icon_state = "solarscorcher"
	item_state = "solarscorcher"
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/rifle/solar) //27 dmg, .15 AP
	cell_type = /obj/item/stock_parts/cell/ammo/ec //16 shots, self-charges
	can_charge = 0
	selfcharge = 1 //selfcharAL
	slot_flags = ITEM_SLOT_Bging adds 100 a shot
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

//Wattz 2000 Laser rifle
/obj/item/gun/energy/laser/rifle/wattz2k
	name = "wattz 2000"
	desc = "Wattz 2000 Laser Rifle. Uses micro fusion cells for more powerful lasers, and an extended barrel for additional range."
	slowdown = 0.33
	icon = 'icons/fallout/objects/guns/energy.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "wattz2k"
	item_state = "sniper_rifle"
	fire_delay = 1
	ammo_type = list(/obj/item/ammo_casing/energy/rifle/wattz2k)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	equipsound = 'sound/f13weapons/equipsounds/aer14equip.ogg'


//AER9 Laser rifle
/obj/item/gun/energy/laser/rifle/aer9
	name = "\improper AER9 laser rifle"
	desc = "A sturdy pre-war laser rifle. Emits beams of concentrated light to kill targets. Fast firing, but not very powerful."
	icon_state = "laser"
	slowdown = 0.3
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/rifle/aer9)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	fire_delay = 1
	scope_state = "AEP7_scope"
	scope_x_offset = 12
	scope_y_offset = 20
	equipsound = 'sound/f13weapons/equipsounds/aer9equip.ogg'


//Tribeam Laser rifle
/obj/item/gun/energy/laser/rifle/tribeam
	name = "tribeam laser rifle"
	desc = "A modified AER9 equipped with a refraction kit that divides the laser shot into three separate beams. While powerful, it has a reputation for friendly fire."
	icon_state = "tribeam"
	item_state = "laser-rifle9"
	fire_delay = 2
	slowdown = 0.3
	ammo_type = list(/obj/item/ammo_casing/energy/laser/rifle/tribeam)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	equipsound = 'sound/f13weapons/equipsounds/tribeamequip.ogg'


//AER12 Laser rifle
/obj/item/gun/energy/laser/rifle/aer12
	name = "\improper AER12 laser rifle"
	desc = "A cutting-edge, pre-war laser rifle. Its focusing crystal array is housed in gold alloy, making it difficult to maintain."
	icon_state = "aer12"
	slowdown = 0.3
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/rifle/aer12)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	fire_delay = 1.5
	scope_state = "AEP7_scope"
	scope_x_offset = 12
	scope_y_offset = 20
	equipsound = 'sound/f13weapons/equipsounds/tribeamequip.ogg'


//AER14 Laser rifle
/obj/item/gun/energy/laser/rifle/aer14
	name = "\improper AER14 laser rifle"
	desc = "A bleeding-edge, pre-war laser rifle. Extremely powerful, but eats MFCs like nothing else."
	icon_state = "aer14"
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/rifle/aer14)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	fire_delay = 1.5
	slowdown = 0.3
	scope_state = "AEP7_scope"
	scope_x_offset = 12
	scope_y_offset = 20
	equipsound = 'sound/f13weapons/equipsounds/aer14equip.ogg'


//LAER Energy rifle
/obj/item/gun/energy/laser/rifle/laer
	name = "\improper LAER"
	desc = "The Laser Assister Energy Rifle is a powerful pre-war weapon developed just before the turn of the Great War. Due to its incredible rarity and unprecedented firepower, the weapon is coveted and nearly solely possesed by the Brotherhood of Steel; typically held by an Elder as a status symbol."
	icon_state = "laer"
	item_state = "laer"
	slowdown = 0.3
	fire_delay = 2
	burst_size = 1
	ammo_type = list(/obj/item/ammo_casing/energy/laser/rifle/laer)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	equipsound = 'sound/f13weapons/equipsounds/laerequip.ogg'


//Fallout 4 laser tommy gun.
/obj/item/gun/energy/laser/rifle/rcw
	name = "laser RCW"
	desc = "A rapid-fire laser rifle modeled after the familiar \"Thompson\" SMG. It features high-accuracy burst fire that will whittle down targets in a matter of seconds."
	icon_state = "lasercw"
	item_state = "rcw"
	slowdown = 0.35
	fire_delay = 2
	burst_size = 1
	automatic = 1
	autofire_shot_delay = 2
	spread = 10
	ammo_type = list(/obj/item/ammo_casing/energy/laser/rifle/rcw)
	cell_type = /obj/item/stock_parts/cell/ammo/ecp
	equipsound = 'sound/f13weapons/equipsounds/RCWequip.ogg'

/obj/item/gun/energy/laser/rcw/burst_select()
	var/mob/living/carbon/human/user = usr
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
//	for(var/X in actions)
//		var/datum/action/A = X

/obj/item/gun/energy/laser/rcw/afterattack()
	. = ..()
//	empty_alarm()
	return

//Gamma gun
/obj/item/gun/energy/gammagun
	name = "Gamma gun"
	slowdown = 0.2
	fire_delay = 2
	desc = "An advanced radiation weapon commonly utilized by people who have passionate hatred for their fellow man. Fires slow velocity, low damage radiation beams."
	icon_state = "ultra_pistol"
	item_state = "laser-pistol"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/gammagun)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	ammo_x_offset = 3


//Gatling Laser


//The ammo/gun is stored in a back slot item
/obj/item/minigunpack
	name = "backpack power source"
	desc = "The massive external power source for the laser gatling gun."
	icon = 'icons/obj/guns/minigun.dmi'
	icon_state = "holstered"
	item_state = "backpack"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	var/obj/item/gun/energy/minigun/gun
	var/armed = 0 //whether the gun is attached, 0 is attached, 1 is the gun is wielded.

/obj/item/minigunpack/Initialize()
	. = ..()
	gun = new(src)
	START_PROCESSING(SSobj, src)

/obj/item/minigunpack/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/minigunpack/on_attack_hand(mob/living/carbon/user)
	if(src.loc == user)
		if(!armed)
			if(user.get_item_by_slot(SLOT_BACK) == src)
				armed = 1
				if(!user.put_in_hands(gun))
					armed = 0
					to_chat(user, "<span class='warning'>You need a free hand to hold the gun!</span>")
					return
				update_icon()
				user.update_inv_back()
		else
			to_chat(user, "<span class='warning'>You are already holding the gun!</span>")
	else
		..()

/obj/item/minigunpack/attackby(obj/item/W, mob/user, params)
	if(W == gun) //Don't need armed check, because if you have the gun assume its armed.
		user.dropItemToGround(gun, TRUE)
	else
		..()

/obj/item/minigunpack/dropped(mob/user)
	. = ..()
	if(armed)
		user.dropItemToGround(gun, TRUE)

/obj/item/minigunpack/MouseDrop(atom/over_object)
	. = ..()
	if(armed)
		return
	if(iscarbon(usr))
		var/mob/M = usr

		if(!over_object)
			return

		if(!M.incapacitated())

			if(istype(over_object, /obj/screen/inventory/hand))
				var/obj/screen/inventory/hand/H = over_object
				M.putItemFromInventoryInHandIfPossible(src, H.held_index)


/obj/item/minigunpack/update_icon_state()
	if(armed)
		icon_state = "notholstered"
	else
		icon_state = "holstered"

/obj/item/minigunpack/proc/attach_gun(mob/user)
	if(!gun)
		gun = new(src)
	gun.forceMove(src)
	armed = 0
	if(user)
		to_chat(user, "<span class='notice'>You attach the [gun.name] to the [name].</span>")
	else
		src.visible_message("<span class='warning'>The [gun.name] snaps back onto the [name]!</span>")
	update_icon()
	user.update_inv_back()

/obj/item/gun/energy/minigun
	name = "laser gatling gun"
	desc = "An advanced laser cannon with an incredible rate of fire. Requires a bulky backpack power source to use."
	icon = 'icons/obj/guns/minigun.dmi'
	icon_state = "minigun_spin"
	item_state = "minigun"
	flags_1 = CONDUCT_1
	slowdown = 0.7
	slot_flags = null
	w_class = WEIGHT_CLASS_HUGE
	custom_materials = null
	burst_size = 1
	burst_shot_delay = 1
	automatic = 1
	autofire_shot_delay = 1.5
	spread = 11
	fire_delay = 1
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'sound/weapons/laser.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/laser/gatling/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/ecp
	item_flags = NEEDS_PERMIT | SLOWS_WHILE_IN_HAND
	var/obj/item/minigunpack/ammo_pack

/obj/item/gun/energy/minigun/Initialize()
	if(istype(loc, /obj/item/minigunpack)) //We should spawn inside an ammo pack so let's use that one.
		ammo_pack = loc
	else
		return INITIALIZE_HINT_QDEL //No pack, no gun

	return ..()

/obj/item/gun/energy/minigun/attack_self(mob/living/user)
	return

/obj/item/gun/energy/minigun/dropped(mob/user)
	. = ..()
	if(ammo_pack)
		ammo_pack.attach_gun(user)
	else
		qdel(src)

/obj/item/gun/energy/minigun/afterattack(atom/target, mob/living/user, flag, params)
	if(!ammo_pack || ammo_pack.loc != user)
		to_chat(user, "You need the backpack power source to fire the gun!")
	. = ..()

/obj/item/gun/energy/minigun/dropped(mob/living/user)
	. = ..()
	ammo_pack.attach_gun(user)


	
//Plasma pistol
/obj/item/gun/energy/laser/plasma/pistol
	name ="plasma pistol"
	slowdown = 0.15
	fire_delay = 6
	item_state = "plasma-pistol"
	icon_state = "plasma-pistol"
	desc = "A pistol-sized miniaturized plasma caster built by REPCONN. It fires a bolt of superhot ionized gas."
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	equipsound = 'sound/f13weapons/equipsounds/pistolplasequip.ogg'

//BoS knight craftable plasma pistol
/obj/item/gun/energy/laser/plasma/pistol/light
	name = "lightweight plasma pistol"
	slowdown = 0.1
	icon_state = "light-plasma-pistol"
	desc = "A lightweight modification of the common REPCONN-built plasma pistol. Fires heavy low penetration plasma clots at a slower rate than the regular design due to reduced cooling."
	fire_delay = 8

/obj/item/gun/energy/laser/plasma/pistol/worn
	name ="shoddy plasma pistol"
	desc = "A pistol-sized miniaturized plasma caster built by REPCONN. It fires a bolt of superhot ionized gas. This one's internal parts have loose seals and corroded electronics."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol/worn)
	fire_delay = 10
	slowdown = 0.1

//Glock 86 Plasma pistol
/obj/item/gun/energy/laser/plasma/glock
	name = "glock 86"
	desc = "Glock 86 Plasma Pistol. Designed by the Gaston Glock artificial intelligence. Shoots a small bolt of superheated plasma. Powered by a small energy cell."
	item_state = "plasma-pistol"
	icon_state = "glock86"
	slowdown = 0.25
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol/glock)
	equipsound = 'sound/f13weapons/equipsounds/pistolplasequip.ogg'
	cell_type = /obj/item/stock_parts/cell/ammo/ec

//Glock 86 A Plasma pistol
/obj/item/gun/energy/laser/plasma/glock/extended
	name ="glock 86a"
	item_state = "plasma-pistol"
	icon_state = "glock86a"
	desc = "This Glock 86 plasma pistol has had its magnetic housing chamber realigned to reduce the drain on its energy cell. Its efficiency has doubled, allowing it to fire more shots before the battery is expended."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol/glock/extended)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	slowdown = 0.35


	//Alien Blaster
/obj/item/gun/energy/laser/plasma/pistol/alien
	name = "alien blaster"
	slowdown = 0.3
	item_state = "alienblaster"
	icon_state = "alienblaster"
	desc = "This weapon is unlike any other you've ever seen before, and appears to be made out of metals not usually found on Earth. It certainly packs a punch, though."
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	can_charge = FALSE
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol/alien)
	cell_type = /obj/item/stock_parts/cell/ammo/alien //unchargeable, but removable
	trigger_guard = TRIGGER_GUARD_ALLOW_ALL // Aliens couldn't shoot this gun until now. Lmao whoops!

//Plasma Rifle
/obj/item/gun/energy/laser/plasma
	name ="plasma rifle"
	item_state = "plasma"
	icon_state = "plasma"
	slowdown = 0.6 
	fire_delay = 5
	desc = "A miniaturized plasma caster that fires bolts of magnetically accelerated toroidal plasma towards an unlucky target."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	equipsound = 'sound/f13weapons/equipsounds/plasequip.ogg'

	//Plasma musket.
/obj/item/gun/ballistic/rifle/hobo/plasmamusket
	name = "Plasma Musket"
	desc = "The cooling looks dubious and is that a empty can of beans used as a safety valve? Pray the plasma goes towards the enemy and not your face when you pull the trigger."
	icon_state = "plasmamusket"
	item_state = "plasmamusket"
	mag_type = /obj/item/ammo_box/magazine/internal/plasmamusket
	fire_delay = 15
	slowdown = 0.3
	var/bolt_open = FALSE
	dryfire_sound = 'sound/f13weapons/noammoenergy.ogg'
	dryfire_text = "*power failure*"
	scope_state = "scope_medium"
	scope_x_offset = 9
	scope_y_offset = 20
	fire_sound = 'sound/f13weapons/lasmusket_fire.ogg'
	pump_sound = 'sound/f13weapons/lasmusket_crank.ogg'
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

/obj/item/gun/energy/laser/plasma/carbine/enable_burst()
	. = ..()
	spread = 15

/obj/item/gun/energy/laser/plasma/carbine/disable_burst()
	. = ..()
	spread = 0


//Multiplas rifle
/obj/item/gun/energy/laser/plasma/scatter
	name = "multiplas rifle"
	item_state = "multiplas"
	icon_state = "multiplas"
	fire_delay = 5.5
	extra_damage = 0
	desc = "A modified A3-20 plasma caster built by REPCONN equipped with a multicasting kit that creates multiple weaker clots."
	equipsound = 'sound/f13weapons/equipsounds/plasequip.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/scatter)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc


/obj/item/gun/energy/laser/plasma/spear
	name = "ergonomic plasmacaster"
	icon = 'icons/fallout/objects/melee/twohanded.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/melee2h_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/melee2h_righthand.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/backslot_weapon.dmi'
	item_state = "plasma"
	icon_state = "plasma"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_LIGHT //you need to wield it to fire it
	slot_flags = ITEM_SLOT_BACK
	desc = "An ergonomic pre-war plasmacaster designed for precision mining work. This one appears to be built into a single thick staff, with a bulbous hilt and sharp saturnite alloy blades ringing the caster assembly- strongly resembling sort of spear."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/miner)
	cell_type = /obj/item/stock_parts/cell/ammo/ecp
	sharpness = SHARP_EDGED
	max_reach = 2
	force = 38
	burst_size = 5
	burst_shot_delay = 0.5
	fire_delay = 10
	scope_y_offset = 16
	equipsound = 'sound/f13weapons/equipsounds/plasequip.ogg'
	var/twohands = FALSE

/obj/item/gun/energy/laser/plasma/spear/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=20, force_wielded=40, icon_wielded="[item_state]2")
	AddElement(/datum/element/update_icon_updates_onmob)
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, .proc/allow_fire)
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, .proc/deny_fire)

/obj/item/gun/energy/laser/plasma/spear/proc/allow_fire()
	twohands = TRUE
/obj/item/gun/energy/laser/plasma/spear/proc/deny_fire()
	twohands = FALSE

/obj/item/gun/energy/laser/plasma/spear/Destroy()
	..()
	UnregisterSignal(src, list(COMSIG_TWOHANDED_WIELD,
								COMSIG_TWOHANDED_UNWIELD))

/obj/item/gun/energy/laser/plasma/spear/can_shoot()
	. = ..()
	if(!twohands)
		return FALSE



//// BETA /// Obsolete
/obj/item/gun/energy/laser/lasertesting
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/lasertest)



	``UNUSED`


//Ultracite Laser pistol
/obj/item/gun/energy/laser/ultra_pistol
	name = "\improper Ultracite laser pistol"
	desc = "An ultracite enhanced energy-based laser gun that fires concentrated beams of light."
	slowdown = 0.2
	icon_state = "ultra_pistol"
	item_state = "laser-pistol"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	fire_delay = 2
	scope_x_offset = 7
	scope_y_offset = 22
	ammo_type = list(/obj/item/ammo_casing/energy/laser/ultra_pistol)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'`



/obj/item/gun/energy/laser/plasma/carbine/enable_burst()



/obj/item/gun/energy/laser/auto
	name = "compact autolaser"
	desc = "A beefed-up laser pistol manufactured by West Tek, reinforced to allow it to withstand the thermal load of sustained fire."
	icon = 'icons/fallout/objects/guns/energy.dmi'
	icon_state = "protolaser"
	item_state = "laser"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_LIGHT //dual wielding
	slowdown = 0.3
	cell_type = /obj/item/stock_parts/cell/ammo/ecp
	ammo_type =  list(/obj/item/ammo_casing/energy/laser/autolaser) //7dmg, 0 AP, but essentially fires a pinpoint beam
	automatic = 1
	autofire_shot_delay = 0.75 //pew pew pew
	spread = 2
	can_scope = FALSE

// OASIS autolaser
/obj/item/gun/energy/laser/auto/oasis
	name = "autoshock tesla pistol"
	desc = "This pistol has been unwisely modified by the OPD to fire bolts of electricty. And they beheld Satan as he fell from heaven like lightning."
	ammo_type =  list(/obj/item/ammo_casing/energy/laser/autolaser/shock) //8dmg + 10 Stamina, flagged as "energy" so very few armors can reduce it below 5-6 dmg, has a very high bare wound bonus, so anyone with no armor on will be crippled
	slowdown = 0.35
	weapon_weight = WEAPON_MEDIUM //DO NOT DUAL WIELD

	/obj/item/gun/energy/laser/aer9/focused
	name = "\improper Hot-wired AER9 laser rifle"
	desc = "A sturdy pre-war laser rifle. Emits beams of concentrated light to kill targets. This one has been jury-rigged against common sense to dump more power into its shots."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun/hitscan/focused)
	fire_delay = 5

//Ultracite Laser rifle
/obj/item/gun/energy/laser/ultra_rifle
	name = "\improper Ultracite laser rifle"
	desc = "A sturdy and advanced military grade pre-war service laser rifle, now enhanced with ultracite"
	icon_state = "ultra_rifle"
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun)
	cell_type = /obj/item/stock_parts/cell/ammo/ultracite
	fire_delay = 3
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	equipsound = 'sound/f13weapons/equipsounds/aer9equip.ogg'
