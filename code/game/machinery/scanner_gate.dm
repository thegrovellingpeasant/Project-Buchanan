/obj/machinery/scanner_gate
	name = "scanner gate"
	desc = "A gate able to perform mid-depth scans on any organisms who pass under it."
	icon = 'icons/obj/machines/scangate.dmi'
	icon_state = "scangate"
	layer = ABOVE_MOB_LAYER
	circuit = /obj/item/circuitboard/machine/scanner_gate
	COOLDOWN_DECLARE(next_beep)

	var/obj/item/radio/radio
	var/scanline_timer
	/// Overlay object we're using for scanlines
	var/obj/effect/overlay/scanline = null

/obj/machinery/scanner_gate/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.listening = FALSE
	radio.set_frequency(FREQ_NCR)
	set_scanline("passive")
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
	)
	AddElement(/datum/element/connect_loc, loc_connections)

/obj/machinery/scanner_gate/Destroy(force)
	QDEL_NULL(scanline)
	return ..()

/obj/machinery/scanner_gate/proc/on_entered(datum/source, atom/movable/thing)
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, PROC_REF(auto_scan), thing)

/obj/machinery/scanner_gate/proc/auto_scan(atom/movable/thing)
	if(!(stat & (BROKEN|NOPOWER)) && anchored)
		perform_scan(thing)

/obj/machinery/scanner_gate/proc/set_scanline(scanline_type, duration)
	if (!isnull(scanline))
		vis_contents -= scanline
	else
		scanline = new(src)
		scanline.icon = icon
		scanline.mouse_opacity = MOUSE_OPACITY_TRANSPARENT
		scanline.layer = layer
	deltimer(scanline_timer)
	if (isnull(scanline_type))
		if(duration)
			scanline_timer = addtimer(CALLBACK(src, PROC_REF(set_scanline), "passive"), duration, TIMER_STOPPABLE)
		return
	scanline.icon_state = scanline_type
	vis_contents += scanline
	if(duration)
		scanline_timer = addtimer(CALLBACK(src, PROC_REF(set_scanline), "passive"), duration, TIMER_STOPPABLE)

/obj/machinery/scanner_gate/power_change()
	. = ..()
	if (stat & (NOPOWER | BROKEN))
		set_scanline(null)
		return
	set_scanline("passive")

/obj/machinery/scanner_gate/proc/perform_scan(atom/movable/thing)
	var/beep = FALSE
	playsound(src, SFX_INDUSTRIAL_SCAN, 20, TRUE, -2, TRUE, FALSE)
	if(isgun(thing))
		beep = TRUE
	else if(isliving(thing))
		var/mob/living/scanned_living = thing
		var/obj/item/card/id/idcard = scanned_living.get_idcard()
		if(!isnull(idcard))
			if(ACCESS_NCR in idcard.access)
				return
		for(var/obj/item/scanned_item in scanned_living.GetAllContents())
			if(isgun(scanned_item))
				beep = TRUE
				break
	else
		for(var/obj/item/content in thing.GetAllContents())
			if(isgun(content))
				beep = TRUE

	if(beep)
		alarm_beep()

/obj/machinery/scanner_gate/proc/alarm_beep()
	if(!COOLDOWN_FINISHED(src, next_beep))
		return

	radio.talk_into(src, "Unauthorizezd weapon detected!!", FREQ_NCR)
	say("Weapons detected!!")
	COOLDOWN_START(src, next_beep, 2 SECONDS)
	playsound(source = src, soundin = 'sound/machines/scanner/scanbuzz.ogg', vol = 30, vary = FALSE, extrarange = -5)
	set_scanline("alarm", 2 SECONDS)
