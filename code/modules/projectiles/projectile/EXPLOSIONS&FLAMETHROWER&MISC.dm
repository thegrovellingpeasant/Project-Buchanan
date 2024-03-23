/obj/item/projectile/incendiary/flamethrower
	name = "FIREEEEEEEEEE!!!!!"
	icon = 'icons/effects/fire.dmi'
	icon_state = "3"
	light_range = LIGHT_RANGE_FIRE
	light_color = LIGHT_COLOR_FIRE
	damage_type = BURN
	wound_bonus = 20
	damage = 8
	range = 10

/obj/item/projectile/incendiary/flamethrower/on_hit(atom/target)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(4)
		M.IgniteMob()



/obj/item/projectile/bullet/a40mm
	name ="40mm grenade"
	desc = "Oh no."
	icon_state= "bolter"
	damage = 5
	armour_penetration = 0.01
	pixels_per_second = TILES_TO_PIXELS(10) //slower than bullets

/obj/item/projectile/bullet/a40mm/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, -1, -1, 3, 3, 0, flame_range = 3)
	new /obj/effect/temp_visual/explosion(get_turf(target))
	return BULLET_ACT_HIT
