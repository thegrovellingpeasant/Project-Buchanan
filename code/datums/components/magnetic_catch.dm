/datum/component/magnetic_catch

/datum/component/magnetic_catch/Initialize()
	if(!isatom(parent))
		return COMPONENT_INCOMPATIBLE
	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, PROC_REF(examine))

	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(entered_react),
		COMSIG_ATOM_EXITED = PROC_REF(exited_react),
	)
	AddComponent(/datum/component/connect_loc_behalf, parent, loc_connections)

	if(ismovable(parent))
		for(var/i in get_turf(parent))
			if(i == parent)
				continue
			RegisterSignal(i, COMSIG_MOVABLE_PRE_THROW, PROC_REF(throw_react))
	else
		for(var/i in parent)
			RegisterSignal(i, COMSIG_MOVABLE_PRE_THROW, PROC_REF(throw_react))

/datum/component/magnetic_catch/proc/examine(datum/source, mob/user, list/examine_list)
	SIGNAL_HANDLER
	examine_list += "It has been installed with inertia dampening to prevent coffee spills."

/datum/component/magnetic_catch/proc/entered_react(datum/source, atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	SIGNAL_HANDLER
	RegisterSignal(arrived, COMSIG_MOVABLE_PRE_THROW, PROC_REF(throw_react), TRUE)

/datum/component/magnetic_catch/proc/exited_react(datum/source, atom/movable/gone, direction)
	SIGNAL_HANDLER
	UnregisterSignal(gone, COMSIG_MOVABLE_PRE_THROW)

/datum/component/magnetic_catch/proc/throw_react(datum/source, list/arguments)
	SIGNAL_HANDLER
	return COMPONENT_CANCEL_THROW
