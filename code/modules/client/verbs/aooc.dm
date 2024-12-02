GLOBAL_VAR_INIT(AOOC_COLOR, null)//If this is null, use the CSS for OOC. Otherwise, use a custom colour.
GLOBAL_VAR_INIT(normal_aooc_colour, "#ce254f")

/client/verb/aooc(msg as text)
	set name = "FOOC"
	set desc = "An OOC channel exclusive to faction leaders."
	set category = "OOC"

	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, span_danger("Speech is currently admin-disabled."))
		return

	if(!mob)
		return

	if(!(prefs.chat_toggles & CHAT_OOC))
		to_chat(src, span_danger(" You have OOC muted."))
		return
	if(jobban_isbanned(mob, "OOC"))
		to_chat(src, span_danger("You have been banned from OOC."))
		return

	if(!holder)
		if(!GLOB.aooc_allowed)
			to_chat(src, span_danger("FOOC is currently muted."))
			return
		if(prefs.muted & MUTE_OOC)
			to_chat(src, span_danger("You cannot use FOOC (muted)."))
			return
		if(!HAS_TRAIT(mob, TRAIT_LEADER))
			to_chat(usr, span_danger("You aren't a faction leader!"))
			return
		if(handle_spam_prevention(msg,MUTE_OOC))
			return
		if(findtext(msg, "byond://"))
			to_chat(src, "<B>Advertising other servers is not allowed.</B>")
			log_admin("[key_name(src)] has attempted to advertise in LOOC: [msg]")
			return
		if(mob.stat)
			to_chat(usr, span_danger("You cannot use FOOC while unconscious or dead."))
			return
		if(isdead(mob))
			to_chat(src, span_danger("You cannot use FOOC while ghosting."))
			return
		if(HAS_TRAIT(mob, TRAIT_AOOC_MUTE))
			to_chat(src, span_danger("You cannot use FOOC right now."))
			return

	if(QDELETED(src))
		return

	msg = copytext_char(sanitize(msg), 1, MAX_MESSAGE_LEN)
	var/raw_msg = msg

	if(!msg)
		return

	msg = emoji_parse(msg)

	if(!holder)
		if(handle_spam_prevention(msg,MUTE_OOC))
			return
		if(findtext(msg, "byond://"))
			to_chat(src, "<B>Advertising other servers is not allowed.</B>")
			log_admin("[key_name(src)] has attempted to advertise in FOOC: [msg]")
			message_admins("[key_name_admin(src)] has attempted to advertise in FOOC: [msg]")
			return

	mob.log_talk(raw_msg,LOG_OOC, tag="(FOOC)")

	var/keyname = key
	if(prefs.unlock_content)
		if(prefs.toggles & MEMBER_PUBLIC)
			keyname = "<font color='[prefs.aooccolor ? prefs.aooccolor : GLOB.normal_aooc_colour]'>[icon2html('icons/member_content.dmi', world, "blag")][keyname]</font>"
	//The linkify span classes and linkify=TRUE below make ooc text get clickable chat href links if you pass in something resembling a url

	var/antaglisting = list()

	for(var/datum/mind/M in get_all_leaders())
		if(!M.current || !M.current.client || isnewplayer(M.current))
			continue
		antaglisting |= M.current.client

	for(var/mob/M in GLOB.player_list)
		if(M.client && (M.stat == DEAD || M.client.holder) && !istype(M, /mob/dead/new_player))
			antaglisting |= M.client

	for(var/client/C in antaglisting)
		if(!C || !istype(C))
			continue
		if(holder)
			if(!holder.fakekey || C.holder)
				if(check_rights_for(src, R_ADMIN))
					to_chat(C, "[span_adminooc("[CONFIG_GET(flag/allow_admin_ooccolor) && prefs.ooccolor ? "<font color=[prefs.ooccolor]>" :"" ]<span class='prefix'>Faction OOC:")] <EM>[keyname][holder.fakekey ? "/([holder.fakekey])" : ""]:</EM> <span class='message linkify'>[msg]</span></span></font>")
				else
					to_chat(C, span_adminobserverooc("[span_prefix("Faction OOC:")] <EM>[keyname][holder.fakekey ? "/([holder.fakekey])" : ""]:</EM> <span class='message linkify'>[msg]</span>"))
			else
				if(GLOB.AOOC_COLOR)
					to_chat(C, "<font color='[GLOB.AOOC_COLOR]'><b>[span_prefix("Faction OOC:")] <EM>[holder.fakekey ? holder.fakekey : key]:</EM> <span class='message linkify'>[msg]</span></b></font>")
				else
					to_chat(C, span_antagooc("[span_prefix("Faction OOC:")] <EM>[holder.fakekey ? holder.fakekey : key]:</EM> <span class='message linkify'>[msg]</span>"))
		else if(!(key in C.prefs.ignoring))
			if(GLOB.AOOC_COLOR)
				to_chat(C, "<font color='[GLOB.AOOC_COLOR]'><b>[span_prefix("Faction OOC:")] <EM>[keyname]:</EM> <span class='message linkify'>[msg]</span></b></font>")
			else
				to_chat(C, span_antagooc("[span_prefix("Faction OOC:")] <EM>[keyname]:</EM> <span class='message linkify'>[msg]</span>"))

/client/proc/set_aooc(newColor as color)
	set name = "Set Faction OOC Color"
	set desc = "Modifies faction OOC Color"
	set category = "Fun"
	GLOB.AOOC_COLOR = sanitize_ooccolor(newColor)

/client/proc/reset_aooc()
	set name = "Reset Faction OOC Color"
	set desc = "Returns faction OOC Color to default"
	set category = "Fun"
	GLOB.AOOC_COLOR = null

/proc/toggle_aooc(toggle = null)
	if(toggle != null) //if we're specifically en/disabling ooc
		if(toggle != GLOB.aooc_allowed)
			GLOB.aooc_allowed = toggle
		else
			return
	else //otherwise just toggle it
		GLOB.aooc_allowed = !GLOB.aooc_allowed

	var/antaglisting = list()	//Only those who have access to AOOC need to know if it's enabled or not.

	for(var/datum/mind/M in get_all_leaders())
		if(!M.current || !M.current.client || isnewplayer(M.current))
			continue
		antaglisting |= M.current.client

	for(var/mob/M in GLOB.player_list)
		if(M.client && (M.stat == DEAD || M.client.holder || is_special_character(M)))
			antaglisting |= M.client

	for(var/client/C in antaglisting)
		if(!C || !istype(C))
			continue
		to_chat(C, "<B>The Faction OOC channel has been [GLOB.aooc_allowed ? "enabled. If you're a faction leader, you can access it through the \"FOOC\" verb." : "disabled"].</B>")
