/datum/component/slippery
	var/intensity
	var/lube_flags
	var/datum/callback/callback

	///what we give to connect_loc by default, makes slippable mobs moving over us slip
	var/static/list/default_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(Slip),
	)

/datum/component/slippery/Initialize(_intensity, _lube_flags = NONE, datum/callback/_callback)
	intensity = max(_intensity, 0)
	lube_flags = _lube_flags
	callback = _callback

	add_connect_loc_behalf_to_parent()

/datum/component/slippery/proc/add_connect_loc_behalf_to_parent()
	if(ismovable(parent))
		AddComponent(/datum/component/connect_loc_behalf, parent, default_connections)

/datum/component/slippery/proc/Slip(datum/source, mob/arrived, atom/old_loc, list/atom/old_locs)
	SIGNAL_HANDLER
	if(istype(arrived) && arrived.slip(intensity, parent, lube_flags) && callback)
		callback.Invoke(arrived)
