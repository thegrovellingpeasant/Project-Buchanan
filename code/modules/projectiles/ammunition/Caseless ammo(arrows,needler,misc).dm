

/obj/item/ammo_casing/caseless
	desc = "A caseless bullet casing."
	firing_effect_type = null
	heavy_metal = FALSE

/obj/item/ammo_casing/caseless/fire_casing(atom/target, mob/living/user, params, distro, quiet, zone_override, spread, atom/fired_from)
	if (..()) //successfully firing
		moveToNullspace()
		QDEL_NULL(src)
		return TRUE
	else
		return FALSE

/obj/item/ammo_casing/caseless/update_icon_state()
	icon_state = "[initial(icon_state)]"



	``Bullets``



/obj/item/ammo_casing/caseless/a75
	desc = "A .75 bullet casing."
	caliber = "75"
	icon_state = "s-casing-live"
	projectile_type = /obj/item/projectile/bullet/gyro


/obj/item/ammo_casing/caseless/g11
	name = "4.73mm caseless cartridge"
	desc = "An 4.73 self-contained caseless rifle cartridge."
	caliber = "473mm"
	icon_state = "762-casing"
	projectile_type = /obj/item/projectile/bullet/a473

/obj/item/ammo_casing/caseless/g11/rubber
	name = "4.73mm polyurethane cartridge"
	projectile_type  = /obj/item/projectile/bullet/a473/rubber

/obj/item/ammo_casing/caseless/g11/incendiary
	name = "4.73mm tracer cartridge"
	projectile_type  = /obj/item/projectile/bullet/a473/incendiary

/*
/obj/item/ammo_casing/caseless/g11/uraniumtipped
	name = "4.73mm U-235 cartridge"
	projectile_type  = /obj/item/projectile/bullet/a473/uraniumtipped
*/

/obj/item/ammo_casing/caseless/g11/dumdum
	name = "4.73mm flat-nose cartridge"
	projectile_type  = /obj/item/projectile/bullet/a473/dumdum

/obj/item/ammo_casing/caseless/g11/explosive
	name = "4.73mm explosive caseless cartridge"
	desc = "An explosive 4.73 self-contained caseless rifle cartridge."
	caliber = "473mm"
	icon_state = "762-casing"
	projectile_type = /obj/item/projectile/bullet/a473/explosive

/obj/item/ammo_casing/caseless/g11/shock
	name = "4.73mm electro-static discharge cartridge"
	projectile_type  = /obj/item/projectile/bullet/a473/shock

/obj/item/ammo_casing/caseless/g11/hv
	name = "4.73mm highvelocity cartridge"
	projectile_type  = /obj/item/projectile/bullet/a473/hv



	``Arrows``
	


/obj/item/ammo_casing/caseless/arrow
	name = "metal arrow"
	desc = "A simple arrow with a metal head."
	projectile_type = /obj/item/projectile/bullet/reusable/arrow
	caliber = "arrow"
	icon_state = "arrow"
	custom_materials = list(/datum/material/iron = 500)
	throwforce = 8 //good luck hitting someone with the pointy end of the arrow
	throw_speed = 3
	w_class = WEIGHT_CLASS_NORMAL
	is_pickable = FALSE

/obj/item/ammo_casing/caseless/arrow/cheap
	name = "cheap arrow"
	desc = "A cheap, small, lightweight arrow made from wood. Not as effective against armor."
	projectile_type = /obj/item/projectile/bullet/reusable/arrow/cheap
	icon_state = "cheaparrow"
	throwforce = 6
	custom_materials = list(/datum/material/wood = 500)
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_casing/caseless/arrow/ap
	name = "sturdy arrow"
	desc = "A reinforced arrow with a metal shaft and heavy duty head."
	projectile_type = /obj/item/projectile/bullet/reusable/arrow/ap
	icon_state = "arrow_ap"


/obj/item/ammo_casing/caseless/arrow/poison
	name = "poison arrow"
	desc = "A simple arrow, tipped in a poisonous paste."
	projectile_type = /obj/item/projectile/bullet/reusable/arrow/poison
	icon_state = "arrow_poison"


/obj/item/ammo_casing/caseless/arrow/burning
	name = "burn arrow"
	desc = "A simple arrow slathered in a paste that burns skin on contact."
	projectile_type = /obj/item/projectile/bullet/reusable/arrow/burning
	icon_state = "arrow_burning"


/obj/item/ammo_casing/caseless/arrow/broadhead
	name = "broadhead arrow"
	desc = "A sharp metal arrow with a broad head. Likely to stick in a wound."
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "arrow_broadhead"
	projectile_type = /obj/item/projectile/bullet/reusable/arrow/broadhead


/obj/item/ammo_casing/caseless/arrow/serrated
	name = "serrated arrow"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	desc = "A sharp metal arrow with a wicked sharp serrated teeth. Likely to shred an artery."
	icon_state = "arrow_serrated"
	projectile_type = /obj/item/projectile/bullet/reusable/arrow/serrated



	``Muskets``



/obj/item/ammo_casing/caseless/musketball
	name = "Musketball"
	desc = "This is a lead ball for a musket."
	caliber = "musketball"
	projectile_type = /obj/item/projectile/bullet/F13/musketball


/obj/item/ammo_casing/caseless/lasermusket
	name = "Battery"
	desc = "A single use battery for the lasmusket."
	caliber = "lasmusket"
	icon_state = "lasmusketbat"
	projectile_type = /obj/item/projectile/beam/laser/musket
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/energy


/obj/item/ammo_casing/caseless/plasmamusket
	name = "Plasma can"
	desc = "A single use can of plasma for the plasma musket."
	caliber = "plasmacaster"
	icon_state = "plasmacan"
	projectile_type = /obj/item/projectile/f13plasma/plasmamusket
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/energy



	``Misc``



	/obj/item/ammo_casing/caseless/needle
	name = "A needler round."
	desc = "A dart for use in needler pistols."
	icon_state = "needler-casing"
	caliber = "needle"
	projectile_type = /obj/item/projectile/bullet/needle
	var/reagent_amount = 15
