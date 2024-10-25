//add or remove a targets crafting knowledge
/client/proc/modify_recipes(mob/living/target)
	set category = null
	set name = "Modify Recipes"

	if(!check_rights(R_SPAWN))
		message_admins("[ADMIN_TPMONTY(usr)] tried to use modify_recipes() without perms!")
		log_admin("INVALID ADMIN PROC ACCESS: [key_name(usr)] tried to use modify_recipes() without perms!")
		return
	if(!target || !target.mind)
		return

	var/add_or_remove = input("Add or Remove recipe?", "Modify target's knowledge") as null|anything in list("Add","Remove")
	if(!add_or_remove)
		return

	var/list/our_known_recipes = target.mind.learned_recipes
	var/datum/crafting_recipe/chosen_recipe = new
	switch(add_or_remove)
		if("Add")
			chosen_recipe = input(src, "Enter the recipe name to add to [target.name].", "Search recipes") as null|text
			if(isnull(chosen_recipe))
				return
			var/valid_recipe
			if(!ispath(text2path(chosen_recipe)))
				chosen_recipe = pick_closest_path(chosen_recipe, make_types_fancy(subtypesof(/datum/crafting_recipe)))
				if(ispath(chosen_recipe))
					valid_recipe = TRUE
			else
				valid_recipe = TRUE
			var/add_name = initial(chosen_recipe.name)
			if(!valid_recipe)
				to_chat(src, "<span class='notice'>No crafting recipe by that name found. Maybe you made a typo?</span>")
				return
			if(chosen_recipe in our_known_recipes)
				to_chat(src, "<span class='notice'>Target already knows the [add_name] recipe! Maybe you made a typo?</span>")
				return
			target?.mind.teach_crafting_recipe(chosen_recipe)
			to_chat(src, "<span class='notice'>Target now knows the [add_name] recipe! They may need to reenter any open crafting menus.</span>")
			to_chat(target, "<span class='warning'>You begin to remember how to make '[add_name]...'</span>")
			log_admin("[key_name(usr)] added [chosen_recipe] recipe to [key_name(target)].")
			message_admins("[key_name(usr)] added [chosen_recipe] recipe to [key_name(target)].")

		if("Remove")
			if(!length(our_known_recipes))
				to_chat(src, "<span class='warning'>Target does not know any recipes!</span>")
				return
			chosen_recipe = input("Pick a recipe to remove", "Modify target's knowledge") as null|anything in our_known_recipes
			var/remove_name = initial(chosen_recipe.name)
			if(!(chosen_recipe in our_known_recipes))
				to_chat(src, "<span class='notice'>Target did not know [chosen_recipe]. Maybe you made a typo?</span>")
				return
			target?.mind.learned_recipes -= chosen_recipe
			to_chat(src, "<span class='notice'>Target now no longer knows [remove_name].</span>")
			to_chat(target, "<span class='warning'>You feel the knowledge of '[remove_name]' slipping from your mind...</span>")
			log_admin("[key_name(usr)] removed [remove_name] from [key_name(target)].")
			message_admins("[key_name(usr)] removed [remove_name] from [key_name(target)].")
