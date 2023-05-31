#define GOOSE_SATIATED 50

/mob/living/simple_animal/hostile/retaliate/goose
	name = "goose"
	desc = "It's loose"
	icon_state = "goose" // sprites by cogwerks from goonstation, used with permission
	icon_living = "goose"
	icon_dead = "goose_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 2)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	emote_taunt = list("hisses")
	taunt_chance = 30
	speed = 0
	maxHealth = 25
	health = 25
	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 5
	attack_verb_continuous = "pecks"
	guaranteed_butcher_results = list(/obj/item/stack/sheet/animalhide/feather = 3)
	attack_verb_simple = "peck"
	attack_sound = "goose"
	speak_emote = list("honks")
	faction = list("neutral")
	attack_same = TRUE
	gold_core_spawnable = HOSTILE_SPAWN
	var/random_retaliate = TRUE

/mob/living/simple_animal/hostile/retaliate/goose/handle_automated_movement()
	. = ..()
	if(prob(5) && random_retaliate == TRUE)
		Retaliate()

/mob/living/simple_animal/hostile/retaliate/goose/vrquest
	random_retaliate = FALSE
	faction = list("china","enclave","neutral")
	wander = FALSE

/mob/living/simple_animal/hostile/retaliate/mangydog
	name = "mangy dog"
	desc = "The dogs that survived the Great War are a larger, and tougher breed, size of a wolf.<br>This one seems to be severely malnourished and its eyes are bloody red."
	icon = 'icons/fallout/mobs/animals/dogs.dmi'
	icon_state = "dog_feral" // sprites by cogwerks from goonstation, used with permission
	icon_living = "dog_feral"
	icon_dead = "dog_feral_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/wolf=1,/obj/item/stack/sheet/sinew=1,/obj/item/stack/sheet/bone=1)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	emote_taunt = list("growls","barks","snarls")
	taunt_chance = 30
	speed = 0
	maxHealth = 120
	health = 120
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 20
	attack_verb_continuous = "attacks"
	attack_verb_simple = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_emote = list("barks")
	faction = list("hostile","wolf")
	attack_same = TRUE
	gold_core_spawnable = HOSTILE_SPAWN
	var/random_retaliate = TRUE

/mob/living/simple_animal/hostile/retaliate/mangydog/handle_automated_movement()
	. = ..()
	if(prob(5) && random_retaliate == TRUE)
		Retaliate()
