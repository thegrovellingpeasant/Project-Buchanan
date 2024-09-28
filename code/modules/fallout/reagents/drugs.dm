/datum/reagent/drug/jet
	name = "Jet Inhalant"
	description = "A chemical used to induce a euphoric high derived from brahmin dung. Fast-acting, powerful, and highly addictive."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 20
	addiction_threshold = 1
	ghoulfriendly = TRUE

/datum/reagent/drug/jet/on_mob_add(mob/living/carbon/human/M)
	..()
	ADD_TRAIT(M, TRAIT_AUTO_CATCH_ITEM, "jet")
	ADD_TRAIT(M, TRAIT_HARD_YARDS, "jet")
	ADD_TRAIT(M, TRAIT_FREERUNNING, "jet")
	ADD_TRAIT(M, TRAIT_NOHUNGER, "jet")
	ADD_TRAIT(M, TRAIT_JOLLY, "jet")
	ADD_TRAIT(M, TRAIT_TECHNOPHREAK, "jet")
	ADD_TRAIT(M, TRAIT_QUICK_BUILD, "jet")
	REMOVE_TRAIT(M, TRAIT_DEPRESSION, "jet")
	REMOVE_TRAIT(M, TRAIT_HEAVY_SLEEPER, "jet")
	M.playsound_local(M, 'sound/f13ambience/music/jet.ogg', 50)
	if(isliving(M))
		to_chat(M, "<span class='notice'>You feel an incredible high! You just absolutely love life in this moment!</span>")

/datum/reagent/drug/jet/on_mob_delete(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		to_chat(M, "<span class='notice'>You come down from your high. The wild ride is unfortunately over...</span>")
		M.confused += 2

/datum/reagent/drug/jet/on_mob_life(mob/living/carbon/M)
	M.adjustStaminaLoss(-30, 0)
	M.set_drugginess(20)
	M.hallucination += 50
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !isspaceturf(M.loc) && prob(10))
		step(M, pick(GLOB.cardinals))
	if(prob(12))
		M.emote(pick("twitch","drool","moan","giggle"))
	if(M.mind)
		var/datum/job/job = SSjob.GetJob(M.mind.assigned_role)
		if(istype(job))
			switch(job.faction)
				if(FACTION_NCR, FACTION_ENCLAVE, FACTION_BROTHERHOOD, FACTION_WRIGHTS)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "used drugs", /datum/mood_event/used_drugs, name)
				if(FACTION_LEGION)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "betrayed caesar", /datum/mood_event/betrayed_caesar, name)
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "jet euphoria", /datum/mood_event/jet_euphoria, name)
	..()
	. = TRUE

/datum/reagent/drug/jet/overdose_start(mob/living/M)
	to_chat(M, "<span class='userdanger'>You start tripping hard!</span>")
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)

/datum/reagent/drug/jet/overdose_process(mob/living/M)
	if(M.hallucination < volume && prob(20))
		M.hallucination += 10
		M.adjustToxLoss(10, 0)
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 60)
	..()

/datum/reagent/drug/jet/addiction_act_stage1(mob/living/M)
	M.hallucination += 50
	if(prob(20))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/jet/addiction_act_stage2(mob/living/M)
	M.Dizzy(5)
	M.Jitter(5)
	M.adjustToxLoss(1, 0)
	M.hallucination += 25
	M.playsound_local(M, 'sound/health/fastbeat.ogg', 50)
	if(prob(30))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/jet/addiction_act_stage3(mob/living/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 4, i++)
			step(M, pick(GLOB.cardinals))
	M.adjustToxLoss(3, 0)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5)
	M.set_disgust(10)
	M.Dizzy(10)
	M.Jitter(25)
	REMOVE_TRAIT(M, TRAIT_AUTO_CATCH_ITEM, "jet")
	REMOVE_TRAIT(M, TRAIT_HARD_YARDS, "jet")
	REMOVE_TRAIT(M, TRAIT_FREERUNNING, "jet")
	REMOVE_TRAIT(M, TRAIT_JOLLY, "jet")
	REMOVE_TRAIT(M, TRAIT_TECHNOPHREAK, "jet")
	if(prob(40))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/jet/addiction_act_stage4(mob/living/carbon/human/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 8, i++)
			step(M, pick(GLOB.cardinals))
	M.adjustToxLoss(5, 0)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 15)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER, 15)
	M.set_disgust(100)
	M.Dizzy(15)
	M.Jitter(200)
	ADD_TRAIT(M, TRAIT_DEPRESSION, "jet")
	ADD_TRAIT(M, TRAIT_HEAVY_SLEEPER, "jet")
	M.playsound_local(M, 'sound/health/slowbeat.ogg', 50)
	if(prob(50))
		M.emote(pick("twitch","drool","moan"))
	..()
	. = TRUE

/datum/reagent/drug/turbo
	name = "Turbo Inhalant"
	description = "A chemical compound that, when inhaled, vastly increases the user's reflexes and slows their perception of time. Carries a risk of addiction and extreme nausea and toxin damage if overdosed."
	reagent_state = LIQUID
	color = "#FAFAFA"
	overdose_threshold = 14
	addiction_threshold = 1
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	ghoulfriendly = TRUE

/datum/reagent/drug/turbo/on_mob_add(mob/M)
	..()
	ADD_TRAIT(M, TRAIT_IGNOREDAMAGESLOWDOWN, "turbo")
	ADD_TRAIT(M, TRAIT_POOR_AIM, "turbo")
	ADD_TRAIT(M, TRAIT_FREERUNNING, "turbo")
	ADD_TRAIT(M, TRAIT_SPEEDY_STEP, "turbo")
	ADD_TRAIT(M, TRAIT_SKITTISH, "turbo")
	ADD_TRAIT(M, TRAIT_HARD_YARDS, "turbo")
	REMOVE_TRAIT(M, TRAIT_DEPRESSION, "turbo")
	REMOVE_TRAIT(M, TRAIT_HEAVY_SLEEPER, "turbo")
	REMOVE_TRAIT(M, TRAIT_CLUMSY, "turbo")
	M.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants/withdrawal)
	M.add_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants)

/datum/reagent/drug/turbo/on_mob_delete(mob/M)
	REMOVE_TRAIT(M, TRAIT_IGNOREDAMAGESLOWDOWN, "turbo")
	REMOVE_TRAIT(M, TRAIT_POOR_AIM, "turbo")
	M.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants)
	M.add_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants/two)
	..()

/datum/reagent/drug/turbo/on_mob_life(mob/living/carbon/M)
	var/high_message = pick("You feel hyper.", "You feel like you need to go faster.", "You feel like you can run the world.")
	M.adjustStaminaLoss(-25, 0)
	if(prob(5))
		to_chat(M, "<span class='notice'>[high_message]</span>")
	M.Jitter(2)
	if(prob(5))
		M.emote(pick("twitch", "shiver"))
	if(M.mind)
		var/datum/job/job = SSjob.GetJob(M.mind.assigned_role)
		if(istype(job))
			switch(job.faction)
				if(FACTION_NCR, FACTION_ENCLAVE, FACTION_BROTHERHOOD, FACTION_WRIGHTS)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "used drugs", /datum/mood_event/used_drugs, name)
				if(FACTION_LEGION)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "betrayed caesar", /datum/mood_event/betrayed_caesar, name)
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "jet euphoria", /datum/mood_event/jet_euphoria, name)
	..()
	. = TRUE

/datum/reagent/drug/turbo/overdose_process(mob/living/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i in 1 to 4)
			step(M, pick(GLOB.cardinals))
	if(prob(20))
		M.emote("laugh")
	if(prob(33))
		M.visible_message("<span class='danger'>[M]'s hands flip out and flail everywhere!</span>")
		M.drop_all_held_items()
	..()
	M.adjustToxLoss(2, 0)
	. = TRUE

/datum/reagent/drug/turbo/addiction_act_stage1(mob/living/M)
	M.Jitter(5)

	if(prob(20))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/turbo/addiction_act_stage2(mob/living/M)
	M.Jitter(10)
	M.Dizzy(10)
	M.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants/two)
	M.add_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants/three)
	REMOVE_TRAIT(M, TRAIT_FREERUNNING, "turbo")
	M.playsound_local(M, 'sound/health/slowbeat.ogg', 50)
	if(prob(30))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/turbo/addiction_act_stage3(mob/living/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 4, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(15)
	M.Dizzy(15)
	REMOVE_TRAIT(M, TRAIT_HARD_YARDS, "turbo")
	M.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants/three)
	if(prob(40))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/turbo/addiction_act_stage4(mob/living/carbon/human/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 8, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(200)
	M.Dizzy(20)
	M.adjustToxLoss(6, 0)
	M.add_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants/withdrawal)
	REMOVE_TRAIT(M, TRAIT_SPEEDY_STEP, "turbo")
	REMOVE_TRAIT(M, TRAIT_SKITTISH, "turbo")
	ADD_TRAIT(M, TRAIT_DEPRESSION, "turbo")
	ADD_TRAIT(M, TRAIT_HEAVY_SLEEPER, "turbo")
	ADD_TRAIT(M, TRAIT_CLUMSY, "turbo")
	M.playsound_local(M, 'sound/health/fastbeat.ogg', 50)
	if(prob(50))
		M.emote(pick("twitch","drool","moan"))
	..()
	. = TRUE

/datum/reagent/drug/psycho
	name = "Psycho Fluid"
	description = "Makes the user hit harder and shrug off slight stuns, but causes slight brain damage and carries a risk of addiction."
	reagent_state = LIQUID
	color = "#FF0000"
	overdose_threshold = 15
	addiction_threshold = 1
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage
	ghoulfriendly = TRUE


/datum/reagent/drug/psycho/on_mob_life(mob/living/carbon/M)
	var/high_message = pick("<br><font color='#FF0000'><b>FUCKING KILL!</b></font>", "<br><font color='#FF0000'><b>RAAAAR!</b></font>", "<br><font color='#FF0000'><b>BRING IT!</b></font>")
	if(prob(20))
		to_chat(M, "<span class='notice'>[high_message]</span>")
	M.AdjustStun(-25, 0)
	M.AdjustKnockdown(-25, 0)
	M.AdjustUnconscious(-25, 0)
	M.adjustStaminaLoss(-15, 0)
	M.Jitter(2)
	M.playsound_local(M, 'sound/health/fastbeat.ogg', 50)
	if(M.mind)
		var/datum/job/job = SSjob.GetJob(M.mind.assigned_role)
		if(istype(job))
			switch(job.faction)
				if(FACTION_NCR, FACTION_ENCLAVE, FACTION_BROTHERHOOD, FACTION_WRIGHTS)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "used drugs", /datum/mood_event/used_drugs, name)
				if(FACTION_LEGION)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "betrayed caesar", /datum/mood_event/betrayed_caesar, name)
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "jet euphoria", /datum/mood_event/jet_euphoria, name)
	..()
	. = TRUE

/datum/reagent/drug/psycho/on_mob_add(mob/living/L)
	..()
	ADD_TRAIT(L, TRAIT_SLEEPIMMUNE, "psycho")
	ADD_TRAIT(L, TRAIT_PUSHIMMUNE, "psycho")
	ADD_TRAIT(L, TRAIT_IGNOREDAMAGESLOWDOWN, "psycho")
	ADD_TRAIT(L, TRAIT_BIG_LEAGUES, "psycho")
	ADD_TRAIT(L, TRAIT_FEARLESS, "psycho")
	ADD_TRAIT(L, TRAIT_UNSTABLE, "psycho")
	ADD_TRAIT(L, TRAIT_MASO, "psycho")
	REMOVE_TRAIT(L, TRAIT_DEPRESSION, "psycho")
	REMOVE_TRAIT(L, TRAIT_HEAVY_SLEEPER, "psycho")
	if(iscarbon(L))
		var/mob/living/carbon/C = L
		rage = new()
		C.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/reagent/drug/psycho/on_mob_delete(mob/living/L)
	REMOVE_TRAIT(L, TRAIT_SLEEPIMMUNE, "psycho")
	REMOVE_TRAIT(L, TRAIT_IGNOREDAMAGESLOWDOWN, "psycho")
	REMOVE_TRAIT(L, TRAIT_BIG_LEAGUES, "psycho")
	if(rage)
		QDEL_NULL(rage)
	..()

/datum/reagent/drug/psycho/overdose_process(mob/living/carbon/human/M)
	M.hallucination += 20
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 8, i++)
			step(M, pick(GLOB.cardinals))
	if(prob(20))
		M.emote(pick("twitch","scream","laugh"))
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
	M.set_heartattack(TRUE)
	M.visible_message("<span class='userdanger'>[M] clutches at their chest as if their heart stopped!</span>")
	to_chat(M, "<span class='danger'>Your vision goes black and your heart stops beating as the amount of drugs in your system shut down your organs one by one. Say hello to Elvis in the afterlife. </span>")
	..()
	return TRUE

/datum/reagent/drug/psycho/addiction_act_stage1(mob/living/M)
	M.hallucination += 10
	M.Jitter(5)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1)
	REMOVE_TRAIT(M, TRAIT_PUSHIMMUNE, "psycho")
	M.playsound_local(M, 'sound/health/fastbeat.ogg', 50)
	if(prob(20))
		M.emote(pick("twitch","scream","laugh"))
	..()
	return
/datum/reagent/drug/psycho/addiction_act_stage2(mob/living/M)
	M.hallucination += 20
	M.Jitter(10)
	M.Dizzy(10)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1)
	if(prob(30))
		M.emote(pick("twitch","scream","laugh"))
	..()
	return
/datum/reagent/drug/psycho/addiction_act_stage3(mob/living/M)
	M.hallucination += 30
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 2, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(15)
	M.Dizzy(15)
	M.losebreath += 10
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	REMOVE_TRAIT(M, TRAIT_MASO, "psycho")
	if(prob(40))
		M.emote(pick("twitch","scream","laugh"))
	..()
	return
/datum/reagent/drug/psycho/addiction_act_stage4(mob/living/carbon/human/M)
	M.hallucination += 40
	M.playsound_local(M, 'sound/health/slowbeat.ogg', 50)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 4, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(50)
	M.Dizzy(50)
	M.Unconscious(25)
	M.losebreath += 10
	M.adjustToxLoss(5)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 15)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 15)
	REMOVE_TRAIT(M, TRAIT_FEARLESS, "psycho")
	REMOVE_TRAIT(M, TRAIT_UNSTABLE, "psycho")
	ADD_TRAIT(M, TRAIT_DEPRESSION, "psycho")
	ADD_TRAIT(M, TRAIT_HEAVY_SLEEPER, "psycho")
	if(prob(50))
		M.emote(pick("twitch","scream","laugh"))
	..()
	return

/datum/reagent/drug/buffout
	name = "Buffout Powder"
	description = "A powerful steroid which increases the user's strength and endurance."
	color = "#FF9900"
	reagent_state = SOLID
	overdose_threshold = 20
	addiction_threshold = 1
	metabolization_rate = 1.25 * REAGENTS_METABOLISM
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage
	ghoulfriendly = TRUE

/datum/reagent/drug/buffout/on_mob_add(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		to_chat(M, "<span class='notice'>You feel stronger, and like you're able to endure more.</span>")
		ADD_TRAIT(M, TRAIT_BUFFOUT_BUFF, "buffout")
		ADD_TRAIT(M, TRAIT_PERFECT_ATTACKER, "buffout")
		ADD_TRAIT(M, TRAIT_QUICKER_CARRY, "buffout")
		ADD_TRAIT(M, TRAIT_NOSOFTCRIT, "buffout")
		ADD_TRAIT(M, TRAIT_PUSHIMMUNE, "buffout")
		ADD_TRAIT(M, TRAIT_CALCIUM_HEALER, "buffout")
		REMOVE_TRAIT(M, TRAIT_UNSTABLE, "buffout")
		M.maxHealth += 30
		M.health += 30

/datum/reagent/drug/buffout/on_mob_delete(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		to_chat(M, "<span class='notice'>You feel weaker.</span>")
		REMOVE_TRAIT(M, TRAIT_PERFECT_ATTACKER, "buffout")
		REMOVE_TRAIT(M, TRAIT_NOSOFTCRIT, "buffout")
		REMOVE_TRAIT(M, TRAIT_QUICKER_CARRY, "buffout")
		ADD_TRAIT(M, TRAIT_QUICK_CARRY, "buffout")
		M.maxHealth -= 10
		M.health -= 10

/datum/reagent/drug/buffout/on_mob_life(mob/living/carbon/M)
	M.adjustStaminaLoss(-15, 0)
	M.AdjustStun(-10*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.AdjustKnockdown(-10*REAGENTS_EFFECT_MULTIPLIER, 0)
	if(M.mind)
		var/datum/job/job = SSjob.GetJob(M.mind.assigned_role)
		if(istype(job))
			switch(job.faction)
				if(FACTION_NCR, FACTION_ENCLAVE, FACTION_BROTHERHOOD, FACTION_WRIGHTS)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "used drugs", /datum/mood_event/used_drugs, name)
				if(FACTION_LEGION)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "betrayed caesar", /datum/mood_event/betrayed_caesar, name)
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "jet euphoria", /datum/mood_event/jet_euphoria, name)
	..()
	. = TRUE

/datum/reagent/drug/buffout/overdose_process(mob/living/carbon/human/M)
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		rage = new()
		C.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	var/datum/disease/D = new /datum/disease/heart_failure
	M.ForceContractDisease(D)
	if(prob(33))
		M.visible_message("<span class='danger'>[M]'s muscles spasm, making them drop what they were holding!</span>")
		M.drop_all_held_items()
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
	..()

/datum/reagent/drug/buffout/addiction_act_stage1(mob/living/M)
	to_chat(M, "<span class='notice'>Your muscles ache slightly.</span>")
	M.adjustBruteLoss(1.5)
	if(prob(15))
		M.emote(pick("twitch"))
	..()
	return

/datum/reagent/drug/buffout/addiction_act_stage2(mob/living/M)
	to_chat(M, "<span class='notice'>Your muscles feel incredibly sore.</span>")
	M.adjustBruteLoss(4)
	M.maxHealth -= 10
	M.health -= 10
	M.playsound_local(M, 'sound/health/slowbeat.ogg', 50)
	if(prob(10))
		to_chat(M, "<span class='notice'>Your muscles spasm, making you drop what you were holding.</span>")
		M.drop_all_held_items()
		M.emote(pick("twitch"))
	..()
	return

/datum/reagent/drug/buffout/addiction_act_stage3(mob/living/M)
	to_chat(M, "<span class='notice'>Your muscles start to hurt badly, and everything feels like it hurts more.</span>")
	M.adjustBruteLoss(7.5)
	M.maxHealth -= 10
	M.health -= 10
	REMOVE_TRAIT(M, TRAIT_BUFFOUT_BUFF, "buffout")
	REMOVE_TRAIT(M, TRAIT_QUICK_CARRY, "buffout")
	REMOVE_TRAIT(M, TRAIT_PUSHIMMUNE, "buffout")
	if(prob(20))
		to_chat(M, "<span class='notice'>Your muscles spasm, making you drop what you were holding. You're not even sure if you can control your arms!</span>")
		M.drop_all_held_items()
		M.emote(pick("twitch"))
	..()
	return

/datum/reagent/drug/buffout/addiction_act_stage4(mob/living/M)
	to_chat(M, "<span class='danger'>Your muscles are in incredible pain! When will it stop!?</span>")
	M.adjustBruteLoss(10)
	M.maxHealth -= 10
	M.health -= 10
	ADD_TRAIT(M, TRAIT_UNSTABLE, "buffout")
	M.playsound_local(M, 'sound/health/fastbeat.ogg', 50)
	if(prob(20))
		to_chat(M, "<span class='danger'>You can't even keep control of your muscles anymore!</span>")
		M.drop_all_held_items()
		M.emote(pick("twitch"))
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !isspaceturf(M.loc) && prob(25))
		step(M, pick(GLOB.cardinals))
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 20)
	..()
	return
