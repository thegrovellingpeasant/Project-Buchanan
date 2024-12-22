
/obj/machinery/computer/prisoner/management
	name = "prisoner management console"
	desc = "Used to manage a prisoner's quota for mining."
	icon_state = "computer"
	icon_keyboard = "generic_key"
	icon_screen = "generic"
	req_access = null
	req_one_access = list(ACCESS_BRIG, ACCESS_NCR)
	light_color = LIGHT_COLOR_GREEN

/obj/machinery/computer/prisoner/management/ui_interact(mob/user)
	. = ..()
	if(isliving(user))
		playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 50, FALSE)
	var/dat = ""
	if(screen == 0)
		dat += "<HR><A href='?src=[REF(src)];lock=1'>{Log In}</A>"
	else if(screen == 1)
		dat += "<H3>Prisoner ID Management</H3>"
		if(inserted_id)
			dat += text("<A href='?src=[REF(src)];id=eject'>[inserted_id]</A><br>")
			dat += text("Collected Points: [inserted_id.points]. <A href='?src=[REF(src)];id=reset'>Reset.</A><br>")
			dat += text("Card goal: [inserted_id.goal].  <A href='?src=[REF(src)];id=setgoal'>Set </A><br>")
			dat += text("NCR Law recommends quotas of 100 points per minute they would normally serve in a Correctional Facility.<BR>")
		else
			dat += text("<A href='?src=[REF(src)];id=insert'>Insert Prisoner ID.</A><br>")
		/*dat += "<H3>Prisoner Implant Management</H3>"
		dat += "<HR>Chemical Implants<BR>"
		var/turf/Tr = null
		for(var/obj/item/implant/chem/C in GLOB.tracked_chem_implants)
			if(!C.imp_in)
				continue
			Tr = get_turf(C.imp_in)
			if((Tr) && (Tr.z != src.z))
				continue//Out of range
			dat += "ID: [C.imp_in.name] | Remaining Units: [C.reagents.total_volume] <BR>"
			dat += "| Inject: "
			dat += "<A href='?src=[REF(src)];inject1=[REF(C)]'>(<font class='bad'>(1)</font>)</A>"
			dat += "<A href='?src=[REF(src)];inject5=[REF(C)]'>(<font class='bad'>(5)</font>)</A>"
			dat += "<A href='?src=[REF(src)];inject10=[REF(C)]'>(<font class='bad'>(10)</font>)</A><BR>"
			dat += "********************************<BR>"
		dat += "<HR>Tracking Implants<BR>"
		for(var/obj/item/implant/tracking/T in GLOB.tracked_implants)
			if(!T.imp_in || !isliving(T.imp_in))
				continue
			Tr = get_turf(T.imp_in)
			if((Tr) && (Tr.z != src.z))
				continue//Out of range

			var/loc_display = "Unknown"
			var/mob/living/M = T.imp_in
			if(is_station_level(Tr.z) && !isspaceturf(M.loc))
				var/turf/mob_loc = get_turf(M)
				loc_display = mob_loc.loc

			dat += "ID: [T.imp_in.name] | Location: [loc_display]<BR>"
			dat += "<A href='?src=[REF(src)];warn=[REF(T)]'>(<font class='bad'><i>Message Holder</i></font>)</A> |<BR>"
			dat += "********************************<BR>"
		*/
		dat += "<HR><A href='?src=[REF(src)];lock=1'>{Log Out}</A>"
	var/datum/browser/popup = new(user, "computer", "Prisoner Management Console", 400, 500)
	popup.set_content(dat)
	popup.open()
	return

/obj/machinery/computer/prisoner/management/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/card/id))
		if(screen)
			id_insert(user)
		else
			to_chat(user, span_danger("Unauthorized access."))
	else
		return ..()

/obj/machinery/computer/prisoner/management/process()
	if(!..())
		src.updateDialog()
	return

/obj/machinery/computer/prisoner/management/Topic(href, href_list)
	. = ..()
	if(.)
		return
	if(!(href_list["id"]))
		return

	if(href_list["id"] =="insert" && !inserted_id)
		id_insert(usr)
	else if(inserted_id)
		switch(href_list["id"])
			if("eject")
				id_eject(usr)
			if("reset")
				inserted_id.points = 0
			if("setgoal")
				var/num = round(input(usr, "Choose prisoner's goal:", "Input an Integer", null) as num|null)
				if(num >= 0)
					num = min(num,1000) //Cap the quota to the equivilent of 10 minutes.
					inserted_id.goal = num

	src.updateUsrDialog()
