/datum/emote
	var/key = "" //What calls the emote
	var/key_third_person = "" //This will also call the emote
	var/message = "" //Message displayed when emote is used
	var/message_alien = "" //Message displayed if the user is a grown alien
	var/message_larva = "" //Message displayed if the user is an alien larva
	var/message_robot = "" //Message displayed if the user is a robot
	var/message_AI = "" //Message displayed if the user is an AI
	var/message_monkey = "" //Message displayed if the user is a monkey
	var/message_simple = "" //Message to display if the user is a simple_animal
	var/message_param = "" //Message to display if a param was given
	var/emote_type = EMOTE_VISIBLE //Whether the emote is visible or audible
	var/restraint_check = FALSE //Checks if the mob is restrained before performing the emote
	var/muzzle_ignore = FALSE //Will only work if the emote is EMOTE_AUDIBLE
	var/list/mob_type_allowed_typecache = /mob //Types that are allowed to use that emote
	var/list/mob_type_blacklist_typecache //Types that are NOT allowed to use that emote
	var/list/mob_type_ignore_stat_typecache
	var/stat_allowed = CONSCIOUS
	var/static/list/emote_list = list()
	var/static/regex/stop_bad_mime = regex(@"says|exclaims|yells|asks")
	/// Sound to play when emote is called.
	var/sound
	/// Volume of the sound we play
	var/sound_volume = 50
	/// If the sound varies in pitch, set to true
	var/sound_vary = FALSE
	/// Can only play sound when forced
	var/only_forced_audio = FALSE
	/// The cooldown between the uses of the emote.
	var/cooldown = 0.8 SECONDS
	/// Does this message have a message that can be modified by the user?
	var/can_message_change = FALSE
	/// How long is the cooldown on the audio of the emote, if it has one?
	var/audio_cooldown = 2 SECONDS

/datum/emote/New()
	if(key_third_person)
		emote_list[key_third_person] = src
	if (ispath(mob_type_allowed_typecache))
		switch (mob_type_allowed_typecache)
			if (/mob)
				mob_type_allowed_typecache = GLOB.typecache_mob
			if (/mob/living)
				mob_type_allowed_typecache = GLOB.typecache_living
			else
				mob_type_allowed_typecache = typecacheof(mob_type_allowed_typecache)
	else
		mob_type_allowed_typecache = typecacheof(mob_type_allowed_typecache)
	mob_type_blacklist_typecache = typecacheof(mob_type_blacklist_typecache)
	mob_type_ignore_stat_typecache = typecacheof(mob_type_ignore_stat_typecache)

/**
 * Handles the modifications and execution of emotes.
 *
 * Arguments:
 * * user - Person that is trying to send the emote.
 * * params - Parameters added after the emote.
 * * type_override - Override to the current emote_type.
 * * intentional - Bool that says whether the emote was forced (FALSE) or not (TRUE).
 *
 */
/datum/emote/proc/run_emote(mob/user, params, type_override, intentional = FALSE)
	var/msg = select_message_type(user, message, intentional)
	if(params && message_param)
		msg = select_param(user, params)

	msg = replace_pronoun(user, msg)
	if(!msg)
		return

	user.log_message(msg, LOG_EMOTE)

	var/tmp_sound = get_sound(user)
	if(tmp_sound && should_play_sound(user, intentional) && TIMER_COOLDOWN_FINISHED(user, type))
		TIMER_COOLDOWN_START(user, type, audio_cooldown)
		playsound(source = user,soundin = tmp_sound,vol = 50, vary = sound_vary)

	var/is_important = emote_type & EMOTE_IMPORTANT
	var/is_visual = emote_type & EMOTE_VISIBLE
	var/is_audible = emote_type & EMOTE_AUDIBLE

	// Emote doesn't get printed to chat, runechat only
	if(emote_type & EMOTE_RUNECHAT)
		for(var/mob/viewer as anything in viewers(user))
			if(isnull(viewer.client))
				continue
			if(!is_important && viewer != user && (!is_visual || !is_audible))
				if(is_audible && !viewer.can_hear())
					continue
				if(is_visual && viewer.is_blind())
					continue
			if(user.runechat_prefs_check(viewer, EMOTE_MESSAGE))
				viewer.create_chat_message(
					speaker = user,
					raw_message = msg,
					runechat_flags = EMOTE_MESSAGE,
				)
			else if(is_important)
				to_chat(viewer, span_emote("<b>[user]</b> [msg]"))
			else if(is_audible && is_visual)
				viewer.show_message(
					span_emote("<b>[user]</b> [msg]"), MSG_AUDIBLE,
					span_emote("You see how <b>[user]</b> [msg]"), MSG_VISUAL,
				)
			else if(is_audible)
				viewer.show_message(span_emote("<b>[user]</b> [msg]"), MSG_AUDIBLE)
			else if(is_visual)
				viewer.show_message(span_emote("<b>[user]</b> [msg]"), MSG_VISUAL)
		return // Early exit so no dchat message

	// The emote has some important information, and should always be shown to the user
	else if(is_important)
		for(var/mob/viewer as anything in viewers(user))
			to_chat(viewer, span_emote("<b>[user]</b> [msg]"))
			if(user.runechat_prefs_check(viewer, EMOTE_MESSAGE))
				viewer.create_chat_message(
					speaker = user,
					raw_message = msg,
					runechat_flags = EMOTE_MESSAGE,
				)
	// Emotes has both an audible and visible component
	// Prioritize audible, and provide a visible message if the user is deaf
	else if(is_visual && is_audible)
		user.audible_message(
			message = msg,
			deaf_message = span_emote("You see how <b>[user]</b> [msg]"),
			self_message = msg,
			audible_message_flags = EMOTE_MESSAGE|ALWAYS_SHOW_SELF_MESSAGE,
		)
	// Emote is entirely audible, no visible component
	else if(is_audible)
		user.audible_message(
			message = msg,
			self_message = msg,
			audible_message_flags = EMOTE_MESSAGE,
		)
	// Emote is entirely visible, no audible component
	else if(is_visual)
		user.visible_message(
			message = msg,
			self_message = msg,
			visible_message_flags = EMOTE_MESSAGE|ALWAYS_SHOW_SELF_MESSAGE,
		)
	else
		CRASH("Emote [type] has no valid emote type set!")

	if(!isnull(user.client))
		var/dchatmsg = "<b>[user]</b> [msg]"
		for(var/mob/ghost as anything in GLOB.dead_mob_list - viewers(get_turf(user)))
			if(isnull(ghost.client) || isnewplayer(ghost))
				continue
			if(!(ghost.client.prefs.chat_toggles & CHAT_GHOSTSIGHT))
				continue
			to_chat(ghost, span_emote("[FOLLOW_LINK(ghost, user)] [dchatmsg]"))

	return


/// Sends the given emote message for all ghosts with ghost sight enabled, excluding close enough to listen normally.
/mob/proc/emote_for_ghost_sight(message)
	for(var/mob/ghost as anything in GLOB.dead_mob_list)
		if(QDELETED(ghost))
			continue
		if(!ghost.client || isnewplayer(ghost))
			continue
		if(!(ghost.client.prefs.chat_toggles & CHAT_GHOSTSIGHT))
			continue
		var/ghost_view = ghost.client.view
		if(ghost.z == z)
			if(isnum(ghost_view))
				if(get_dist(src, ghost) < ghost_view)
					continue
			else
				var/list/view_range_list = splittext(ghost_view, "x")
				if(abs(x - ghost.x) < ((text2num(view_range_list[1]) - 1) / 2))
					if(abs(y - ghost.y) < ((text2num(view_range_list[2]) - 1) / 2))
						continue
		ghost.show_message(span_emote("[FOLLOW_LINK(ghost, src)] [message]"))


/datum/emote/proc/replace_pronoun(mob/user, message)
	if(findtext(message, "their"))
		message = replacetext(message, "their", user.p_their())
	if(findtext(message, "them"))
		message = replacetext(message, "them", user.p_them())
	if(findtext(message, "%s"))
		message = replacetext(message, "%s", user.p_s())
	return message

/datum/emote/proc/select_message_type(mob/user)
	. = message
	if(!muzzle_ignore && user.is_muzzled() && emote_type == EMOTE_AUDIBLE)
		return "makes a [pick("strong ", "weak ", "")]noise."
	if(isalienadult(user) && message_alien)
		. = message_alien
	else if(islarva(user) && message_larva)
		. = message_larva
	else if(iscyborg(user) && message_robot)
		. = message_robot
	else if(isAI(user) && message_AI)
		. = message_AI
	else if(ismonkey(user) && message_monkey)
		. = message_monkey
	else if(isanimal(user) && message_simple)
		. = message_simple

/datum/emote/proc/select_param(mob/user, params)
	return replacetext(message_param, "%t", params)

/datum/emote/proc/can_run_emote(mob/user, status_check = TRUE, intentional = FALSE)
	. = TRUE
	if(mob_type_allowed_typecache) //empty list = anyone can use it unless specifically blacklisted
		if(!is_type_in_typecache(user, mob_type_allowed_typecache))
			return FALSE
	if(is_type_in_typecache(user, mob_type_blacklist_typecache))
		return FALSE
	if(status_check && !is_type_in_typecache(user, mob_type_ignore_stat_typecache))
		if(user.stat > stat_allowed)
			if(!intentional)
				return FALSE
			switch(user.stat)
				if(SOFT_CRIT)
					to_chat(user, span_notice("You cannot [key] while in a critical condition."))
				if(UNCONSCIOUS)
					to_chat(user, span_notice("You cannot [key] while unconscious."))
				if(DEAD)
					to_chat(user, span_notice("You cannot [key] while dead."))
			return FALSE
		var/mob/living/L = user
		if(restraint_check && (istype(L) && !CHECK_MOBILITY(L, MOBILITY_USE)))
			if(!intentional)
				return FALSE
			to_chat(user, span_notice("You cannot [key] while stunned."))
			return FALSE
		if(restraint_check && user.restrained())
			if(!intentional)
				return FALSE
			to_chat(user, span_notice("You cannot [key] while restrained."))
			return FALSE

	if(isliving(user))
		var/mob/living/L = user
		if(HAS_TRAIT(L, TRAIT_EMOTEMUTE))
			return FALSE

/**
 * To get the sound that the emote plays, for special sound interactions depending on the mob.
 *
 * Arguments:
 * * user - Person that is trying to send the emote.
 *
 * Returns the sound that will be made while sending the emote.
 */
/datum/emote/proc/get_sound(mob/living/user)
	return pick(sound) //by default just return this var.

/**
 * Check to see if the user should play a sound when performing the emote.
 *
 * Arguments:
 * * user - Person that is doing the emote.
 * * intentional - Bool that says whether the emote was forced (FALSE) or not (TRUE).
 *
 * Returns a bool about whether or not the user should play a sound when performing the emote.
 */
/datum/emote/proc/should_play_sound(mob/user, intentional = FALSE)
	if(only_forced_audio && intentional)
		return FALSE
	return TRUE
