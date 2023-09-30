/datum/objective/f13
	name = "generic f13 objective"
	is_f13 = TRUE

/datum/objective/f13/mob_assassinate
	name = "Assassinate rival"
	var/target_role_type = 0
	martyr_compatible = 1

/datum/objective/f13/proc/find_rival_target(dupe_search_range, blacklist)
	var/list/datum/mind/owners = get_owners()
	var/list/datum/mind/mobsters = SSticker.mode.mobsters
	if(!dupe_search_range)
		dupe_search_range = get_owners()
	var/list/possible_targets = mobsters
	for(var/datum/mind/possible_target in possible_targets)
		if(!(possible_target in owners) && ishuman(possible_target.current) && (possible_target.current.stat != DEAD) && is_unique_objective(possible_target))
			if(!(possible_target in blacklist))
				possible_targets += possible_target
	if(possible_targets.len > 0)
		target = pick(possible_targets)
	else
		target = null
	update_explanation_text()
	return target

/datum/objective/f13/proc/find_coup_target(dupe_search_range, blacklist)
	var/list/datum/mind/owners = get_owners()
	var/list/possible_targets
	for(var/datum/mind/possible_target in owners)
		if((possible_target.assigned_role == "Bishop Boss" || possible_target.assigned_role == "Bishop Capo") && ishuman(possible_target.current) && (possible_target.current.stat != DEAD) && is_unique_objective(possible_target))
			possible_targets += possible_target
	if(possible_targets.len > 0)
		target = pick(possible_targets)
	else
		target = null
	update_explanation_text()
	return target

/datum/objective/f13/mob_assassinate/check_completion()
	return !considered_alive(target) || considered_afk(target)

/datum/objective/f13/mob_assassinate/update_explanation_text()
	..()
	if(target && target.current)
		var/datum/antagonist/mobster/G = target.antag_datums[1]
		explanation_text = "Someone's been making moves and saying things they shouldn't. The boss wants [target.name], from [G.team.name] dead. Time to get your hands dirty.."
	else
		explanation_text = "Free Objective"

/datum/objective/f13/mob_assassinate/admin_edit(mob/admin)
	admin_simple_target_pick(admin)

//GLOBAL_LIST_EMPTY(possible_items)
/datum/objective/f13/mob_steal
	name = "Steal"
	var/datum/objective_item/targetinfo = null
	var/obj/item/steal_target = null
	martyr_compatible = 0

/datum/objective/f13/mob_steal/get_target()
	return steal_target

/datum/objective/f13/mob_steal/New()
	..()
	if(!GLOB.possible_items.len)
		for(var/I in subtypesof(/datum/objective_item/steal))
			new I

/datum/objective/f13/mob_steal/find_target()
	var/list/datum/mind/owners = get_owners()
	var/approved_targets = list()
	check_items:
		for(var/datum/objective_item/possible_item in GLOB.possible_items)
			if(!is_unique_objective(possible_item.targetitem))
				continue
			for(var/datum/mind/M in owners)
				if(M.current.mind.assigned_role in possible_item.excludefromjob)
					continue check_items
			approved_targets += possible_item
	return set_target(safepick(approved_targets))

/datum/objective/f13/mob_steal/proc/set_target(datum/objective_item/item)
	if(item)
		targetinfo = item
		steal_target = targetinfo.targetitem
		explanation_text = "One of our informants determined the NameHere family's has a valuable [targetinfo.name]. It'd be good for us if we took it from their possession."
		return steal_target
	else
		explanation_text = "Free objective"
		return

/datum/objective/f13/mob_steal/admin_edit(mob/admin)
	var/list/possible_items_all = GLOB.possible_items+"custom"
	var/new_target = input(admin,"Select target:", "Objective target", steal_target) as null|anything in possible_items_all
	if (!new_target)
		return

	if (new_target == "custom") //Can set custom items.
		var/custom_path = input(admin,"Search for target item type:","Type") as null|text
		if (!custom_path)
			return
		var/obj/item/custom_target = pick_closest_path(custom_path, make_types_fancy(subtypesof(/obj/item)))
		var/custom_name = initial(custom_target.name)
		custom_name = stripped_input(admin,"Enter target name:", "Objective target", custom_name)
		if (!custom_name)
			return
		steal_target = custom_target
		explanation_text = "Steal [custom_name]."

	else
		set_target(new_target)

/datum/objective/f13/mob_steal/check_completion()
	var/list/datum/mind/owners = get_owners()
	if(!steal_target)
		return TRUE
	for(var/datum/mind/M in owners)
		if(!isliving(M.current))
			continue

		var/list/all_items = M.current.GetAllContents()

		for(var/obj/I in all_items)
			if(istype(I, steal_target))
				if(!targetinfo)
					return TRUE
				else if(targetinfo.check_special_completion(I))
					return TRUE

			if(targetinfo && (I.type in targetinfo.altitems))
				if(targetinfo.check_special_completion(I))
					return TRUE
	return FALSE

/datum/objective/f13/mob_frame
	name = "Frame rival"
	var/target_role_type = 0
	martyr_compatible = 1

/datum/objective/f13/mob_frame/check_completion()
	var/turf/location = get_turf(target.current)
	if(!location || istype(location, /turf/open/floor/plasteel/shuttle/red) || istype(location, /turf/open/floor/mineral/plastitanium/red/brig)) // Passes if they are in NCR territory
		return TRUE
	return FALSE

/datum/objective/f13/mob_frame/update_explanation_text()
	..()
	if(target && target.current)
		explanation_text = "Too many eyes are on [target.name], and they're on the verge of putting a very big magnifying glass on all of us. We need them locked up for a crime -- legitimate or otherwise. We're hoping the rumours about NCR torture camps are right."
	else
		explanation_text = "Free Objective"

/datum/objective/f13/mob_frame/admin_edit(mob/admin)
	admin_simple_target_pick(admin)

/datum/objective/f13/mob_coup
	name = "Coup"
	var/target_real_name
	var/target_missing_id

/datum/objective/f13/mob_coup/check_completion()
	if(!target || !target_real_name)
		return TRUE
	var/list/datum/mind/owners = get_owners()
	for(var/datum/mind/M in owners)
		if(!considered_alive(target))
			continue
		var/mob/living/carbon/human/H = M.current
		if(H.dna.real_name == target_real_name && (H.get_id_name() == target_real_name || target_missing_id))
			return TRUE
	return FALSE

/datum/objective/f13/mob_coup/update_explanation_text()
	..()
	if(target && target.current)
		explanation_text = "A few people have been coming together, and after years of erroneous and questionable acts by [target.name], it's been decided they have to go."
	else
		explanation_text = "Free Objective"

/datum/objective/f13/mob_coup/admin_edit(mob/admin)
	admin_simple_target_pick(admin)

/datum/objective/f13/mob_recruit
	name = "Recruit"

/datum/objective/f13/mob_recruit/check_completion()
	if(!target)
		return TRUE
	if(considered_alive(target))
		var/list/all_items = target.current.GetAllContents()
		for(var/obj/I in all_items) //Check for items
			if(istype(I, /obj/item/card/id/reno/bishops/ring))
				return TRUE
	return FALSE

/datum/objective/f13/mob_recruit/update_explanation_text()
	..()
	if(target && target.current)
		explanation_text = "The holy grail! A fully blooded Sicilian! Their name is [target.name], and we need to get our hands on them before ANYONE ELSE DOES. This takes absolute priority."
	else
		explanation_text = "Free Objective"

/datum/objective/f13/mob_recruit/admin_edit(mob/admin)
	admin_simple_target_pick(admin)

/datum/objective/f13/mob_wealth
	name = "Get rich"
	target_amount = TRUE

/datum/objective/f13/mob_wealth/check_completion()
	var/bishop_money
	var/wright_money
	var/vgraff_money
	var/area/f13/building/bishop
	var/area/f13/building/wright
	var/area/f13/building/vgraff

	for(var/obj/item/stack/f13Cash/caps/M in bishop.contents) //Placeholder areas
		bishop_money += M.amount
	for(var/obj/item/stack/f13Cash/caps/M in wright.contents)
		wright_money += M.amount
	for(var/obj/item/stack/f13Cash/caps/M in vgraff.contents)
		vgraff_money += M.amount
	
	var/richest = max(bishop_money, wright_money, vgraff_money)
	if(src.team.name == "The Bishops")
		if(bishop_money == richest)
			return TRUE
	if(src.team.name == "The Wrights")
		if(wright_money == richest)
			return TRUE
	if(src.team.name == "The Van Graffs")
		if(vgraff_money == richest)
			return TRUE

	return FALSE

/datum/objective/f13/mob_wealth/update_explanation_text()
	..()
	if(target_amount)
		explanation_text = "Everyone wants to be someone, but you ARE someone. Make sure your pockets are full -- heavy is the head that wears the crown."

/datum/objective/f13/mob_wealth/admin_edit(mob/admin)
	admin_simple_target_pick(admin)


