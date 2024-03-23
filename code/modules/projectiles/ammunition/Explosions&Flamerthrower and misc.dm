``Rockets``



/obj/item/ammo_casing/caseless/rocket
	name = "\improper PM-9LHE"
	desc = "An 84mm low-yield High Explosive rocket. Fire at people and pray."
	caliber = "84mm"
	icon_state = "srm-8"
	projectile_type = /obj/item/projectile/bullet/a84mm_he
	is_pickable = FALSE


/obj/item/ammo_casing/caseless/rocket/hedp
	name = "\improper PM-9HEDP"
	desc = "An 84mm High Explosive Dual Purpose rocket. Pointy end toward mechs."
	caliber = "84mm"
	icon_state = "84mm-hedp"
	projectile_type = /obj/item/projectile/bullet/a84mm


/obj/item/ammo_casing/caseless/rocket/incendiary
	name = "\improper PM-9 I"
	desc = "An 84mm incendiary rocket. Fire with care."
	caliber = "84mm"
	icon_state = "84mm-incin"
	projectile_type = /obj/item/projectile/bullet/a84mm_incend


/obj/item/ammo_casing/caseless/rocket/chem
	name = "\improper PM-9C"
	desc = "An 84mm chemical dispersement rocket. Fire with great shame."
	caliber = "84mm"
	icon_state = "84mm-chem"
	projectile_type = /obj/item/projectile/bullet/a84mm_chem


/obj/item/ammo_casing/caseless/rocket/big
	name = "\improper PM-9 HHE"
	desc = "It's like the low-yield HE rocket, but bigger."
	caliber = "84mm"
	icon_state = "84mm-hedp"
	projectile_type = /obj/item/projectile/bullet/a84mm_he_big



	``Grenade Launcher``



/obj/item/ammo_casing/a40mm
	name = "40mm HE shell"
	desc = "A cased high explosive grenade that can only be activated once fired out of a grenade launcher."
	caliber = "40mm"
	icon_state = "40mmHE"
	projectile_type = /obj/item/projectile/bullet/a40mm



	``Flamethrower``



/obj/item/ammo_casing/caseless/flamethrower
	name = "napalm"
	desc = "a bunch of napalm fuel for a flamethrower. A bit useless now that it's been spilt on the ground."
	caliber = "fuel"
	icon = 'icons/mob/robots.dmi'
	icon_state = "floor1"
	projectile_type = /obj/item/projectile/incendiary/flamethrower
	pellets = 3
	variance = 20

	``MISC``


	/obj/item/ammo_casing/c2mm
	name = "2mm gauss projectile casing"
	desc = "A 2mm gauss projectile casing."
	caliber = "2mm"
	projectile_type = /obj/item/projectile/bullet/c2mm

/obj/item/ammo_casing/c2mm/blender
	name = "2mm gauss blender projectile casing"
	desc = "A 2mm gauss projectile casing, \"Blender\" variant. Bounces off walls at hypersonic speeds."
	caliber = "2mm"
	projectile_type = /obj/item/projectile/bullet/c2mm/blender
