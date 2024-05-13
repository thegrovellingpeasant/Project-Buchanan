/obj/item/projectile/bullet/reusable/arrow
	name = "metal arrow"
	desc = "a simple arrow with a metal head."
	damage = 30
	wound_bonus = 30
	icon_state = "arrow"
	ammo_type = /obj/item/ammo_casing/caseless/arrow
	embedding = list(embed_chance=15, fall_chance=60, jostle_chance=3, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.2, pain_mult=2, jostle_pain_mult=1, rip_time=25, projectile_payload = /obj/item/ammo_casing/caseless/arrow)

//CIT ARROWS
/obj/item/projectile/bullet/reusable/arrow/ash
	name = "ashen arrow"
	desc = "Fire harderned arrow."
	damage = 0.5
	ammo_type = /obj/item/ammo_casing/caseless/arrow/ash

/obj/item/projectile/bullet/reusable/arrow/bone //extra mob damage
	name = "bone arrow"
	desc = "Arrow made of bone and sinew."
	damage = 20
	wound_bonus = 25
	ammo_type = /obj/item/ammo_casing/caseless/arrow/bone
	embedding = list(embed_chance=8, fall_chance=60, jostle_chance=3, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.2, pain_mult=2, jostle_pain_mult=1, rip_time=25, projectile_payload = /obj/item/ammo_casing/caseless/arrow/bone)

/obj/item/projectile/bullet/reusable/arrow/bronze //Just some AP shots
	name = "bronze arrow"
	desc = "Bronze tipped arrow."
	damage = 25
	wound_bonus = 25
	armour_penetration = 0.35
	ammo_type = /obj/item/ammo_casing/caseless/arrow/bronze
	embedding = list(embed_chance=15, fall_chance=60, jostle_chance=3, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.2, pain_mult=2, jostle_pain_mult=1, rip_time=25, projectile_payload = /obj/item/ammo_casing/caseless/arrow/bronze)

//FO13 ARROWS
/obj/item/projectile/bullet/reusable/arrow/cheap
	name = "lightweight arrow"
	desc = "A cheap, lightweight wooden arrow. Not as effective against armor."
	damage = 30
	wound_bonus = 25
	icon_state = "arrow"
	ammo_type = /obj/item/ammo_casing/caseless/arrow/cheap
	embedding = list(embed_chance=5, fall_chance=60, jostle_chance=3, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.2, pain_mult=2, jostle_pain_mult=1, rip_time=25, projectile_payload = /obj/item/ammo_casing/caseless/arrow/cheap)

/obj/item/projectile/bullet/reusable/arrow/ap
	name = "sturdy arrow"
	desc = "A reinforced arrow with a metal shaft and heavy duty head."
	damage = 30
	wound_bonus = 25
	armour_penetration = 0.1
	icon_state = "arrow"
	ammo_type = /obj/item/ammo_casing/caseless/arrow/ap
	embedding = list(embed_chance=10, fall_chance=60, jostle_chance=3, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.2, pain_mult=2, jostle_pain_mult=1, rip_time=25, projectile_payload = /obj/item/ammo_casing/caseless/arrow/ap)

/obj/item/projectile/bullet/reusable/arrow/poison
	name = "poison arrow"
	desc = "A simple arrow, tipped in a poisonous paste."
	damage = 10
	wound_bonus = 25
	armour_penetration = 0.1
	icon_state = "arrow"
	ammo_type = /obj/item/ammo_casing/caseless/arrow/poison

/obj/item/projectile/bullet/reusable/arrow/poison/on_hit(atom/target, blocked)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/targetHuman = target
		targetHuman.reagents.add_reagent(/datum/reagent/toxin, 5) //so you get some toxin damage!

/obj/item/projectile/bullet/reusable/arrow/burning
	name = "burn arrow"
	desc = "A sumple arrow slathered in a paste that burns skin on contact."
	damage = 20 
	wound_bonus = 25
	armour_penetration = 0.1
	icon_state = "arrow"
	ammo_type = /obj/item/ammo_casing/caseless/arrow/burning

/obj/item/projectile/bullet/reusable/arrow/burning/on_hit(atom/target, blocked)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/targetHuman = target
		targetHuman.adjust_fire_stacks(3)
		targetHuman.IgniteMob() //you just got burned!


/obj/item/projectile/bullet/reusable/arrow/broadhead
	name = "broadhead arrow"
	desc = "An arrow that sticks in wounds. Badly."
	damage = 30
	wound_bonus = 25
	sharpness = SHARP_EDGED
	ammo_type = /obj/item/ammo_casing/caseless/arrow/broadhead
	embedding = list(embed_chance=20, fall_chance=60, jostle_chance=3, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.2, pain_mult=2, jostle_pain_mult=1, rip_time=25, projectile_payload = /obj/item/ammo_casing/caseless/arrow/broadhead)

/obj/item/projectile/bullet/reusable/arrow/broadhead/on_hit(atom/target, blocked)
	if(iscarbon(target))
		dropped = TRUE
	..()

/obj/item/projectile/bullet/reusable/arrow/serrated
	name = "serrated arrow"
	desc = "An arrow that can sever arteries!"
	wound_bonus = 25
	wound_falloff_tile = -3
	bare_wound_bonus = 20
	sharpness = SHARP_EDGED
	armour_penetration = 0.05
	damage = 30
	embedding = list(embed_chance=25, fall_chance=60, jostle_chance=3, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.2, pain_mult=2, jostle_pain_mult=1, rip_time=25, projectile_payload = /obj/item/ammo_casing/caseless/arrow/serrated)
	ammo_type = /obj/item/ammo_casing/caseless/arrow/serrated
