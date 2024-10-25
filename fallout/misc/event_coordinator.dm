/client/proc/open_event_panel()
	set name = "Event Coordinator Panel"
	set category = "Admin.Fun"

	if(!check_rights(R_SPAWN))
		message_admins("[ADMIN_TPMONTY(usr)] tried to use open_event_panel() without perms!")
		log_admin("INVALID ADMIN PROC ACCESS: [key_name(usr)] tried to use open_event_panel() without perms!")
		return

	src.holder.event_panel()

//event coordinator stuff
/datum/admins/proc/event_panel()
	if(!check_rights(R_SPAWN))
		message_admins("[ADMIN_TPMONTY(usr)] tried to use open_event_panel() without perms!")
		log_admin("INVALID ADMIN PROC ACCESS: [key_name(usr)] tried to use open_event_panel() without perms!")
		return

	var/dat = ""

	dat += "<head><style>body {padding: 0; margin: 15px; background-color: #062113; color: #4aed92; line-height: 170%;} a, button, a:link, a:visited, a:active, .linkOn, .linkOff {color: #4aed92; text-decoration: none; background: #062113; border: none; padding: 1px 4px 1px 4px; margin: 0 2px 0 0; cursor:default;} a:hover {color: #062113; background: #4aed92; border: 1px solid #4aed92} a.white, a.white:link, a.white:visited, a.white:active {color: #4aed92; text-decoration: none; background: #4aed92; border: 1px solid #161616; padding: 1px 4px 1px 4px; margin: 0 2px 0 0; cursor:default;} a.white:hover {color: #062113; background: #4aed92;} .linkOn, a.linkOn:link, a.linkOn:visited, a.linkOn:active, a.linkOn:hover {color: #4aed92; background: #062113; border-color: #062113;} .linkOff, a.linkOff:link, a.linkOff:visited, a.linkOff:active, a.linkOff:hover{color: #4aed92; background: #062113; border-color: #062113;}</style></head><font face='courier'>"
	dat += "<center><b>ROBCO INDUSTRIES UNIFIED OPERATING SYSTEM v.85</b><br>"
	dat += "<b>COPYRIGHT 2075-2077 ROBCO INDUSTRIES</b><br><br><br></center>"
	dat += "<br><br><font size=2><b>Event Coordinator's Terminal</b></font><br>"
	dat += "<b>_______________________________</b><br><br>"

	dat += "<br><font size=2>Be sure to be as specific as you can be with these commands!</font><br>"
	dat += "<br><font size=1>Never spawn obvious parent types. Example: obj/item/gun is NOT something you should spawn! You need a specific subtype.</font><br>"
	dat += "<br><font size=1>You can locate a subtype by simply searching for the weapon's name. You may need to enlarge the window by dragging at the corner to view the full results to verify which is which.</font><br>"
	dat += "<br><font size=1>Being lazy with this command directly lags the server and Buffy will know! So try to be efficient. <3</font><br><br>"
	dat += "<b>_______________________________</b><br><br>"

	dat += "<font size=3><A href='?src=[REF(src)];[HrefToken()];create_object=1'>Create Object</A><br><br></font>"
	dat += "<br><font size=1>Spawn an object (type of /obj).</font><br><br>"
	dat += "<b>_______________________________</b><br><br>"
	dat += "<font size=3><A href='?src=[REF(src)];[HrefToken()];quick_create_object=1'>Quick Create Object</A><br><br></font>"
	dat += "<br><font size=1>DO IT QUICKLY MY CHILDS</font><br><br>"
	dat += "<b>_______________________________</b><br><br>"
	dat += "<font size=3><A href='?src=[REF(src)];[HrefToken()];create_turf=1'><b>Create Turf</b></A><br><br></font>"
	dat += "<br><font size=1>Spawn a floor (type of /turf).</font><br><br>"
	dat += "<b>_______________________________</b><br><br>"
	dat += "<font size=3><A href='?src=[REF(src)];[HrefToken()];create_mob=1'><b>Create Mob</b></A><br><br></font>"
	dat += "<br><font size=1>Spawn a mob (type of /mob).</font><br><br>"
	dat += "<b>_______________________________</b><br><br>"
	dat += "<font size=3><A href='?src=[REF(src)];[HrefToken()];toggle_build=1'><b>Toggle Build Mode</b></font></a>"
	dat += "<br><br><font size=2>Enables build mode. Use this instead of spawning 500 things by hand please.</font><br><br>"
	dat += "<b>_______________________________</b><br><br>"
	dat += "<font size=3><A href='?src=[REF(src)];[HrefToken()];toggle_invis=1'>Toggle Own Invisibility</a></font>"
	dat += "<br><br><font size=1>Makes you invisible if you are alive.<br><br></font>"

	var/datum/browser/popup = new(usr, "eventcoordpanel", "Event Coordinator Panel", 500, 750)
	popup.set_content(dat)
	popup.open()
