/obj/machinery/computer/prisoner
	name = "prisoner management console"
	desc = "Used to manage tracking implants placed inside criminals."
	icon_screen = "explosive"
	icon_keyboard = "security_key"
	req_access = list(ACCESS_BRIG)
	circuit = /obj/item/circuitboard/computer/prisoner
	light_color = LIGHT_COLOR_RED
	var/id = 0
	var/temp = null
	var/status = 0
	var/timeleft = 60
	var/stop = 0
	var/screen = 0 // 0 - No Access Denied, 1 - Access allowed
	var/obj/item/card/id/prisoner/inserted_id

/obj/machinery/computer/prisoner/Destroy()
	if(inserted_id)
		inserted_id.forceMove(get_turf(src))
	return ..()


/obj/machinery/computer/prisoner/examine(mob/user)
	. = ..()
	if(inserted_id)
		. += span_notice("<b>Alt-click</b> to eject the ID card.")

/obj/machinery/computer/prisoner/AltClick(mob/user)
	..()
	id_eject(user)
	return TRUE

/obj/machinery/computer/prisoner/proc/id_insert(mob/user, obj/item/card/id/prisoner/P)
	if(istype(P))
		if(inserted_id)
			to_chat(user, span_warning("There's already an ID card in the console!"))
			return
		if(!user.transferItemToLoc(P, src))
			return
		inserted_id = P
		user.visible_message(span_notice("[user] inserts an ID card into the console."), \
							span_notice("You insert the ID card into the console."))
		playsound(src, 'sound/machines/terminal_insert_disc.ogg', 50, FALSE)
		updateUsrDialog()

/obj/machinery/computer/prisoner/proc/id_eject(mob/user)
	if(!inserted_id)
		to_chat(user, span_warning("There's no ID card in the console!"))
		return
	else
		inserted_id.forceMove(drop_location())
		if(!issilicon(user) && Adjacent(user))
			user.put_in_hands(inserted_id)
		inserted_id = null
		user.visible_message(span_notice("[user] gets an ID card from the console."), \
							span_notice("You get the ID card from the console."))
		playsound(src, 'sound/machines/terminal_insert_disc.ogg', 50, FALSE)
		updateUsrDialog()

/obj/machinery/computer/prisoner/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/card/id))
		return id_insert(user, I)
	return ..()

/obj/machinery/computer/prisoner/Topic(href, href_list)
	. = ..()
	if(.)
		return
	if(href_list["id"])
		if(href_list["id"] =="insert" && !inserted_id)
			var/obj/item/card/id/prisoner/I = usr.is_holding_item_of_type(/obj/item/card/id/prisoner)
			if(I)
				if(!usr.transferItemToLoc(I, src))
					return
				inserted_id = I
			else
				to_chat(usr, span_danger("No valid ID."))
		else if(inserted_id)
			switch(href_list["id"])
				if("eject")
					inserted_id.forceMove(drop_location())
					inserted_id.verb_pickup()
					inserted_id = null
				if("reset")
					inserted_id.points = 0
				if("setgoal")
					var/num = round(input(usr, "Choose prisoner's goal:", "Input an Integer", null) as num|null)
					if(num >= 0)
						num = min(num,1000) //Cap the quota to the equivilent of 10 minutes.
						inserted_id.goal = num
	else if(href_list["inject1"])
		var/obj/item/implant/I = locate(href_list["inject1"]) in GLOB.tracked_chem_implants
		if(I && istype(I))
			I.activate(1)
	else if(href_list["inject5"])
		var/obj/item/implant/I = locate(href_list["inject5"]) in GLOB.tracked_chem_implants
		if(I && istype(I))
			I.activate(5)

	else if(href_list["inject10"])
		var/obj/item/implant/I = locate(href_list["inject10"]) in GLOB.tracked_chem_implants
		if(I && istype(I))
			I.activate(10)

	else if(href_list["lock"])
		if(allowed(usr))
			screen = !screen
		else
			to_chat(usr, "Unauthorized Access.")

	else if(href_list["warn"])
		var/warning = copytext(sanitize(input(usr,"Message:","Enter your message here!","")),1,MAX_MESSAGE_LEN)
		if(!warning)
			return
		var/obj/item/implant/I = locate(href_list["warn"]) in GLOB.tracked_implants
		if(I && istype(I) && I.imp_in)
			var/mob/living/R = I.imp_in
			to_chat(R, span_italics("You hear a voice in your head saying: '[warning]'"))
			usr.log_talk("[key_name(usr)] sent an implant message to [R]/[R.ckey]: '[warning]'", LOG_SAY)

	src.updateUsrDialog()
