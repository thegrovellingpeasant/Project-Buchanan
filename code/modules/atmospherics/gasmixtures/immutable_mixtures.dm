//"immutable" gas mixture used for immutable calculations
//it can be changed, but any changes will ultimately be undone before they can have any effect

/datum/gas_mixture/immutable
	gc_share = TRUE
	var/initial_temperature = 0

/datum/gas_mixture/immutable/New()
	..()
	set_temperature(initial_temperature)
	populate()

/datum/gas_mixture/immutable/proc/populate()
	return


//used by space tiles
/datum/gas_mixture/immutable/space
	initial_temperature = TCMB

/datum/gas_mixture/immutable/space/populate()
	set_min_heat_capacity(HEAT_CAPACITY_VACUUM)

//used by cloners
/datum/gas_mixture/immutable/cloner
	initial_temperature = T20C

/datum/gas_mixture/immutable/cloner/populate()
	..()
	set_moles(GAS_N2, MOLES_O2STANDARD + MOLES_N2STANDARD)

//the default air in the atmosphere
/datum/gas_mixture/immutable/atmosphere
	initial_temperature = T20C

/datum/gas_mixture/immutable/atmosphere/populate()
	..()
	gases[GAS_O2] = MOLES_O2STANDARD
	gases[GAS_N2] = MOLES_N2STANDARD

/datum/gas_mixture/immutable/atmosphere/set_moles(gas_type, moles)
	//We do nothing, gasses don't actually change as we don't use Atmos.
	//This is why we don't use `set_moles` in the populate proc above us.
	return
