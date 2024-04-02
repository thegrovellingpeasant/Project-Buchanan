MINIGUN FIRST/BOW LAST



/obj/item/minigunpackbal5mm
	name = "CZ53 personal minigun ammo belt"
	desc = "The massive ammo belt for the CZ53 personal minigun."
	icon = 'icons/obj/guns/minigun.dmi'
	icon_state = "balholstered"
	item_state = "backpack"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	var/obj/item/gun/ballistic/minigunbal5mm/gun
	var/armed = 0 //whether the gun is attached, 0 is attached, 1 is the gun is wielded.

/obj/item/minigunpackbal5mm/Initialize()
	. = ..()
	gun = new(src)
	START_PROCESSING(SSobj, src)

/obj/item/minigunpackbal5mm/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

//ATTACK HAND IGNORING PARENT RETURN VALUE
/obj/item/minigunpackbal5mm/attack_hand(mob/living/carbon/user)
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

/obj/item/minigunpackbal5mm/attackby(obj/item/W, mob/user, params)
	if(W == gun) //Don't need armed check, because if you have the gun assume its armed.
		user.dropItemToGround(gun, TRUE)
	else
		..()

/obj/item/minigunpackbal5mm/dropped(mob/user)
	. = ..()
	if(armed)
		user.dropItemToGround(gun, TRUE)

/obj/item/minigunpackbal5mm/MouseDrop(atom/over_object)
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


/obj/item/minigunpackbal5mm/update_icon()
	if(armed)
		icon_state = "balnotholstered"
	else
		icon_state = "balholstered"

/obj/item/minigunpackbal5mm/proc/attach_gun(mob/user)
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


/obj/item/gun/ballistic/minigunbal5mm
	name = "CZ53 personal minigun"
	desc = "Boasting an extreme rate of fire, the Rockwell CZ53 personal minigun is the perfect weapon for suppressing fire."
	icon = 'icons/obj/guns/minigun.dmi'
	icon_state = "minigunbal_spin"
	item_state = "minigun"
	flags_1 = CONDUCT_1
	slowdown = 0.7
	slot_flags = null
	w_class = WEIGHT_CLASS_HUGE
	burst_size = 1
	automatic = 1
	autofire_shot_delay = 1
	burst_shot_delay = 1
	fire_delay = 1
	ranged_attack_speed = CLICK_CD_RAPID
	spread = 1
	weapon_weight = WEAPON_HEAVY
	extra_penetration = 0
	extra_damage = 0
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/minigunbal5mm
	casing_ejector = TRUE
	var/obj/item/minigunpackbal5mm/ammo_pack

/obj/item/gun/ballistic/minigunbal5mm/Initialize()
	if(istype(loc, /obj/item/minigunpackbal5mm)) //We should spawn inside an ammo pack so let's use that one.
		ammo_pack = loc
	else
		return INITIALIZE_HINT_QDEL //No pack, no gun

	return ..()

/obj/item/gun/ballistic/minigunbal5mm/attack_self(mob/living/user)
	return

/obj/item/gun/ballistic/minigunbal5mm/dropped(mob/user)
	. = ..()
	if(ammo_pack)
		ammo_pack.attach_gun(user)
	else
		qdel(src)

/obj/item/gun/ballistic/minigunbal5mm/afterattack(atom/target, mob/living/user, flag, params)
	if(!ammo_pack || ammo_pack.loc != user)
		to_chat(user, "You need the backpack ammo belt to fire the gun!")
	. = ..()

/obj/item/gun/ballistic/minigunbal5mm/dropped(mob/living/user)
	. = ..()
	ammo_pack.attach_gun(user)





/obj/item/gun/ballistic/bow
	name = "base bow"
	desc = "base type of bow used to define features for multiple-loading bows"
	icon_state = "bow"
	item_state = "bow"
	icon_prefix = "bow"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_HEAVY //need both hands to fire
	force = 5
	mag_type = /obj/item/ammo_box/magazine/internal/bow
	fire_sound = 'sound/weapons/bowfire.wav'
	slot_flags = ITEM_SLOT_BACK
	item_flags = NONE
	inaccuracy_modifier = 0 //to counteract the innaccuracy from WEAPON_HEAVY, bows are supposed to be accurate but only able to be fired with both hands
	pin = null
	no_pin_required = TRUE
	trigger_guard = TRIGGER_GUARD_NONE //so ashwalkers can use it
	spawnwithmagazine = TRUE
	var/recentdraw
	var/draw_sound = 'sound/weapons/bowdraw.wav'
	dryfire_text = "*no arrows*"
	dryfire_sound = ""

/obj/item/gun/ballistic/bow/process_chamber(mob/living/user, empty_chamber = 0)
	var/obj/item/ammo_casing/AC = chambered //Find chambered round
	if(istype(AC)) //there's a chambered round
		if(casing_ejector)
			AC.forceMove(drop_location()) //Eject casing onto ground.
			AC.bounce_away(TRUE)
			chambered = null
		else if(empty_chamber)
			chambered = null

/obj/item/gun/ballistic/bow/can_shoot()
	return chambered

/obj/item/gun/ballistic/bow/attack_self(mob/living/user)
	if(chambered)
		user.put_in_hands(chambered)
		chambered = null
		update_icon()
		to_chat(user, "<span class='notice'>You gently release the bowstring, removing the arrow.</span>")
		return
	if(recentdraw > world.time || !get_ammo(FALSE))
		return
	draw(user, TRUE)
	recentdraw = world.time + 2
	return

/obj/item/gun/ballistic/bow/proc/draw(mob/M, visible = TRUE)
	if(visible)
		M.visible_message("<span class='warning'>[M] draws the string on [src]!</span>", "<span class='warning'>You draw the string on [src]!</span>")
	playsound(M, draw_sound, 60, 1)
	draw_load(M)
	update_icon()
	return 1

/obj/item/gun/ballistic/bow/proc/draw_load(mob/M)
	if(!magazine.ammo_count())
		return 0
	var/obj/item/ammo_casing/AC = magazine.get_round() //load next casing.
	chambered = AC

/obj/item/gun/ballistic/bow/attackby(obj/item/A, mob/user, params)
	if(magazine.attackby(A, user, params, 1))
		to_chat(user, "<span class='notice'>You load [A] into \the [src].</span>")
		update_icon()

/obj/item/gun/ballistic/bow/update_icon()
	icon_state = "[initial(icon_state)]_[get_ammo() ? (chambered ? "firing" : "loaded") : "unloaded"]"


/obj/item/gun/ballistic/bow/do_fire(atom/target, mob/living/user, message = TRUE, params, zone_override = "", bonus_spread = 0, stam_cost = 0)
	..()
	if(HAS_TRAIT(user, TRAIT_AUTO_DRAW) && !chambered && get_ammo(FALSE))
		user.visible_message("<span class='warning'>[user] instinctively draws the string on [src]!</span>", "<span class='warning'>You instinctively draw the string on [src]!</span>")
		draw(user, FALSE)
		recentdraw = world.time + 2

/obj/item/gun/ballistic/bow/xbow
	name = "magazine-fed crossbow"
	desc = "A somewhat primitive projectile weapon. Has a spring-loaded magazine, but still requires drawing back before firing. Fires arrows slightly faster than regular bows, improving damage"
	icon_state = "xbow"
	item_state = "xbow"
	icon_prefix = "xbow"
	mag_type = /obj/item/ammo_box/magazine/internal/bow/xbow
	extra_speed = 400
	extra_damage = 13


//Regular Bow
/obj/item/gun/ballistic/bow/tribal
	name = "short bow"
	desc = "A simple wooden bow with small pieces of turquiose, cheaply made and small enough to fit most bags, better then nothing I guess."
	icon_state = "tribalbow"
	item_state = "tribalbow"
	icon_prefix = "tribalbow"
	force = 10
	extra_damage = 10


//Bone Bow
/obj/item/gun/ballistic/bow/claw
	name = "deathclaw bow"
	desc = "A bone bow, made of pieces of sinew and deathclaw skin for extra structure, it is a fierce weapon that all expert hunters and bowmen carry."
	icon_state = "ashenbow"
	item_state = "ashenbow"
	icon_prefix = "ashenbow"
	force = 18
	extra_damage = 20
	
	mag_type = /obj/item/ammo_box/magazine/internal/bow/claw
	fire_delay = 3
	extra_speed = 100

//Sturdy Bow
/obj/item/gun/ballistic/bow/sturdy
	name = "sturdy bow"
	desc = "A firm sturdy wooden bow with leather handles and sinew wrapping, for extra stopping power in the shot speed of the arrows."
	icon_state = "bow"
	item_state = "bow"
	icon_prefix = "bow"
	force = 15
	extra_damage = 16
	fire_delay = 3
	mag_type = /obj/item/ammo_box/magazine/internal/bow/sturdy
	extra_speed = 500

//Silver Bow
/obj/item/gun/ballistic/bow/silver
	name = "silver bow"
	desc = "A firm sturdy silver bow created by the earth, its durability and rather strong material allow it to be an excellent option."
	icon_state = "pipebow"
	item_state = "pipebow"
	icon_prefix = "pipebow"
	force = 15
	extra_damage = 13
	mag_type = /obj/item/ammo_box/magazine/internal/bow/silver
	fire_delay = 1.5

//Crossbow
/obj/item/gun/ballistic/bow/crossbow
	name = "crossbow"
	desc = "A crossbow."
	icon_state = "crossbow"
	item_state = "crossbow"
	icon_prefix = "crossbow"
	force = 10
	extra_damage = 13
	mag_type = /obj/item/ammo_box/magazine/internal/bow/cross
	fire_delay = 1.5
	extra_speed = 400
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	can_scope = FALSE



