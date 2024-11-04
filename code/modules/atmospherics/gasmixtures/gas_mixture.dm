/*
What are the archived variables for?
	Calculations are done using the archived variables with the results merged into the regular variables.
	This prevents race conditions that arise based on the order of tile processing.
*/
#define MINIMUM_HEAT_CAPACITY	0.0003
#define MINIMUM_MOLE_COUNT		0.01

/datum/gas_mixture
	/// Never ever set this variable, hooked into vv_get_var for view variables viewing.
	var/gas_list_view_only
	var/initial_volume = CELL_VOLUME //liters
	var/list/reaction_results
	var/list/analyzer_results //used for analyzer feedback - not initialized until its used

	/// Whether to call garbage_collect() on the sharer during shares, used for immutable mixtures
	var/gc_share = FALSE
	var/list/gases = list()
	var/temperature = 0 //kelvins
	var/tmp/temperature_archived = 0
	var/volume = CELL_VOLUME //liters
	var/last_share = 0

GLOBAL_LIST_INIT(auxtools_atmos_initialized,FALSE)

/proc/auxtools_atmos_init()

/datum/gas_mixture/New(volume)
	if (!isnull(volume))
		initial_volume = volume
	if(!GLOB.auxtools_atmos_initialized && auxtools_atmos_init())
		GLOB.auxtools_atmos_initialized = TRUE
	__gasmixture_register()
	reaction_results = new

/datum/gas_mixture/vv_edit_var(var_name, var_value)
	if(var_name == NAMEOF(src, gas_list_view_only))
		return FALSE
	return ..()

/datum/gas_mixture/vv_get_var(var_name)
	. = ..()
	if(var_name == NAMEOF(src, gas_list_view_only))
		var/list/dummy = get_gases()
		for(var/gas in dummy)
			dummy[gas] = get_moles(gas)
			dummy["CAP [gas]"] = partial_heat_capacity(gas)
		dummy["TEMP"] = return_temperature()
		dummy["PRESSURE"] = return_pressure()
		dummy["HEAT CAPACITY"] = heat_capacity()
		dummy["TOTAL MOLES"] = total_moles()
		dummy["VOLUME"] = return_volume()
		dummy["THERMAL ENERGY"] = thermal_energy()
		return debug_variable("gases (READ ONLY)", dummy, 0, src)

/datum/gas_mixture/vv_get_dropdown()
	. = ..()
	VV_DROPDOWN_OPTION("", "---")
	VV_DROPDOWN_OPTION(VV_HK_PARSE_GASSTRING, "Parse Gas String")
	VV_DROPDOWN_OPTION(VV_HK_EMPTY, "Empty")
	VV_DROPDOWN_OPTION(VV_HK_SET_MOLES, "Set Moles")
	VV_DROPDOWN_OPTION(VV_HK_SET_TEMPERATURE, "Set Temperature")
	VV_DROPDOWN_OPTION(VV_HK_SET_VOLUME, "Set Volume")

/datum/gas_mixture/vv_do_topic(list/href_list)
	. = ..()
	if(!.)
		return
	if(href_list[VV_HK_PARSE_GASSTRING])
		var/gasstring = input(usr, "Input Gas String (WARNING: Advanced. Don't use this unless you know how these work.", "Gas String Parse") as text|null
		if(!istext(gasstring))
			return
		log_admin("[key_name(usr)] modified gas mixture [REF(src)]: Set to gas string [gasstring].")
		message_admins("[key_name(usr)] modified gas mixture [REF(src)]: Set to gas string [gasstring].")
		parse_gas_string(gasstring)
	if(href_list[VV_HK_EMPTY])
		log_admin("[key_name(usr)] emptied gas mixture [REF(src)].")
		message_admins("[key_name(usr)] emptied gas mixture [REF(src)].")
		clear()
	if(href_list[VV_HK_SET_MOLES])
		var/list/vv_gasses = get_gases()
		for(var/gas in vv_gasses)
			vv_gasses[gas] = get_moles(gas)
		var/gasid = input(usr, "What kind of gas?", "Set Gas") as null|anything in GLOB.gas_data.ids
		if(!gasid)
			return
		var/amount = input(usr, "Input amount", "Set Gas", vv_gasses[gasid] || 0) as num|null
		if(!isnum(amount))
			return
		amount = max(0, amount)
		log_admin("[key_name(usr)] modified gas mixture [REF(src)]: Set gas [gasid] to [amount] moles.")
		message_admins("[key_name(usr)] modified gas mixture [REF(src)]: Set gas [gasid] to [amount] moles.")
		set_moles(gasid, amount)
	if(href_list[VV_HK_SET_TEMPERATURE])
		var/temp = input(usr, "Set the temperature of this mixture to?", "Set Temperature", return_temperature()) as num|null
		if(!isnum(temp))
			return
		temp = max(2.7, temp)
		log_admin("[key_name(usr)] modified gas mixture [REF(src)]: Changed temperature to [temp].")
		message_admins("[key_name(usr)] modified gas mixture [REF(src)]: Changed temperature to [temp].")
		set_temperature(temp)
	if(href_list[VV_HK_SET_VOLUME])
		var/vv_volume = input(usr, "Set the volume of this mixture to?", "Set Volume", return_volume()) as num|null
		if(!isnum(vv_volume))
			return
		vv_volume = max(0, vv_volume)
		log_admin("[key_name(usr)] modified gas mixture [REF(src)]: Changed volume to [vv_volume].")
		message_admins("[key_name(usr)] modified gas mixture [REF(src)]: Changed volume to [vv_volume].")
		set_volume(vv_volume)

/*
we use a hook instead
/datum/gas_mixture/Del()
	__gasmixture_unregister()
	. = ..()
	*/

/datum/gas_mixture/proc/__gasmixture_unregister()
/datum/gas_mixture/proc/__gasmixture_register()

/proc/gas_types()
	var/list/L = subtypesof(/datum/gas)
	for(var/gt in L)
		var/datum/gas/G = gt
		L[gt] = initial(G.specific_heat)
	return L

/datum/gas_mixture/proc/heat_capacity() //joules per kelvin
	var/list/cached_gases = gases
	var/list/cached_gasheats = GLOB.gas_data.specific_heats
	. = 0
	for(var/id in cached_gases)
		. += cached_gases[id] * cached_gasheats[id]

/datum/gas_mixture/proc/partial_heat_capacity(gas_type)

/datum/gas_mixture/proc/total_moles()
	var/cached_gases = gases
	TOTAL_MOLES(cached_gases, .)

/datum/gas_mixture/proc/return_pressure() //kilopascals
	if(volume > 0) // to prevent division by zero
		var/cached_gases = gases
		TOTAL_MOLES(cached_gases, .)
		. *= R_IDEAL_GAS_EQUATION * temperature / volume
		return
	return 0

/datum/gas_mixture/proc/return_temperature() //kelvins
	return temperature

/datum/gas_mixture/proc/set_min_heat_capacity(n)
	return

/datum/gas_mixture/proc/set_temperature(new_temp)
	temperature = new_temp

/datum/gas_mixture/proc/set_volume(new_volume)
	volume = new_volume

/datum/gas_mixture/proc/get_moles(gas_type)
	return gases[gas_type]

/datum/gas_mixture/proc/set_moles(gas_type, moles)
	gases[gas_type] = moles

// VV WRAPPERS - EXTOOLS HOOKED PROCS DO NOT TAKE ARGUMENTS FROM CALL() FOR SOME REASON.
/datum/gas_mixture/proc/vv_set_moles(gas_type, moles)
	return set_moles(gas_type, moles)
/datum/gas_mixture/proc/vv_get_moles(gas_type)
	return get_moles(gas_type)
/datum/gas_mixture/proc/vv_set_temperature(new_temp)
	return set_temperature(new_temp)
/datum/gas_mixture/proc/vv_set_volume(new_volume)
	return set_volume(new_volume)
/datum/gas_mixture/proc/vv_react(datum/holder)
	return react(holder)

/datum/gas_mixture/proc/scrub_into(datum/gas_mixture/target, ratio, list/gases)
	return

/datum/gas_mixture/proc/get_gases()
	return gases

/datum/gas_mixture/proc/multiply(factor)
	for(var/id in gases)
		gases[id] *= factor

/datum/gas_mixture/proc/get_last_share()
	return last_share

/datum/gas_mixture/proc/clear()
	gases.Cut()

/datum/gas_mixture/proc/adjust_moles(gas_type, amt = 0)
	set_moles(gas_type, clamp(get_moles(gas_type) + amt,0,INFINITY))

/datum/gas_mixture/proc/return_volume() //liters
	return volume // wow!

/datum/gas_mixture/proc/thermal_energy() //joules
	return (temperature * heat_capacity())

/datum/gas_mixture/proc/archive()
	//Update archived versions of variables
	//Returns: 1 in all cases
	temperature_archived = temperature
	return TRUE

/datum/gas_mixture/proc/merge(datum/gas_mixture/giver)
	//Merges all air from giver into self. giver is untouched.
	//Returns: 1 if we are mutable, 0 otherwise
	if(!giver)
		return 0

	//heat transfer
	if(abs(temperature - giver.temperature) > MINIMUM_TEMPERATURE_DELTA_TO_CONSIDER)
		var/self_heat_capacity = heat_capacity()
		var/giver_heat_capacity = giver.heat_capacity()
		var/combined_heat_capacity = giver_heat_capacity + self_heat_capacity
		if(combined_heat_capacity)
			temperature = (giver.temperature * giver_heat_capacity + temperature * self_heat_capacity) / combined_heat_capacity

	var/list/cached_gases = gases //accessing datum vars is slower than proc vars
	var/list/giver_gases = giver.gases
	//gas transfer
	for(var/giver_id in giver_gases)
		cached_gases[giver_id] += giver_gases[giver_id]

	return 1

/datum/gas_mixture/proc/remove(amount)
	//Removes amount of gas from the gas_mixture
	//Returns: gas_mixture with the gases removed
	var/sum
	var/list/cached_gases = gases
	TOTAL_MOLES(cached_gases, sum)
	amount = min(amount, sum) //Can not take more air than tile has!
	if(amount <= 0)
		return null
	var/datum/gas_mixture/removed = new type
	var/list/removed_gases = removed.gases //accessing datum vars is slower than proc vars

	removed.temperature = temperature
	for(var/id in cached_gases)
		removed_gases[id] = QUANTIZE((cached_gases[id] / sum) * amount)
		cached_gases[id] -= removed_gases[id]
	GAS_GARBAGE_COLLECT(gases)

	return removed

/datum/gas_mixture/proc/transfer_to(datum/gas_mixture/target, amount)
	//Transfers amount of gas to target. Equivalent to target.merge(remove(amount)) but faster.
	return merge(target.remove(amount))

/datum/gas_mixture/proc/transfer_ratio_to(datum/gas_mixture/target, ratio)
	//Transfers ratio of gas to target. Equivalent to target.merge(remove_ratio(amount)) but faster.

/datum/gas_mixture/proc/remove_ratio(ratio)
	//Proportionally removes amount of gas from the gas_mixture
	//Returns: gas_mixture with the gases removed
	if(ratio <= 0)
		return null
	ratio = min(ratio, 1)

	var/list/cached_gases = gases
	var/datum/gas_mixture/removed = new type
	var/list/removed_gases = removed.gases //accessing datum vars is slower than proc vars

	removed.temperature = temperature
	for(var/id in cached_gases)
		removed_gases[id] = QUANTIZE(cached_gases[id] * ratio)
		cached_gases[id] -= removed_gases[id]

	GAS_GARBAGE_COLLECT(gases)

	return removed

/datum/gas_mixture/proc/copy()
	//Creates new, identical gas mixture
	//Returns: duplicate gas mixture
	var/list/cached_gases = gases
	var/datum/gas_mixture/copy = new type
	var/list/copy_gases = copy.gases

	copy.temperature = temperature
	for(var/id in cached_gases)
		copy_gases[id] = cached_gases[id]

	return copy

/datum/gas_mixture/proc/copy_from(datum/gas_mixture/sample)
	//Copies variables from sample
	var/list/cached_gases = gases //accessing datum vars is slower than proc vars
	var/list/sample_gases = sample.gases

	temperature = sample.temperature
	for(var/id in sample_gases)
		cached_gases[id] = sample_gases[id]

	//remove all gases not in the sample
	cached_gases &= sample_gases

	return 1

/datum/gas_mixture/proc/copy_from_turf(turf/model)
	return

/datum/gas_mixture/proc/parse_gas_string(gas_string)
	//Copies variables from a particularly formatted string.
	//Returns: 1 if we are mutable, 0 otherwise

/datum/gas_mixture/proc/share(datum/gas_mixture/sharer)
	//Performs air sharing calculations between two gas_mixtures assuming only 1 boundary length
	//Returns: amount of gas exchanged (+ if sharer received)
	var/list/cached_gases = gases
	var/list/sharer_gases = sharer.gases

	var/temperature_delta = temperature_archived - sharer.temperature_archived
	var/abs_temperature_delta = abs(temperature_delta)

	var/old_self_heat_capacity = 0
	var/old_sharer_heat_capacity = 0
	if(abs_temperature_delta > MINIMUM_TEMPERATURE_DELTA_TO_CONSIDER)
		old_self_heat_capacity = heat_capacity()
		old_sharer_heat_capacity = sharer.heat_capacity()

	var/heat_capacity_self_to_sharer = 0 //heat capacity of the moles transferred from us to the sharer
	var/heat_capacity_sharer_to_self = 0 //heat capacity of the moles transferred from the sharer to us

	var/moved_moles = 0
	var/abs_moved_moles = 0

	//we're gonna define these vars outside of this for loop because as it turns out, var declaration is pricy
	var/delta
	var/gas_heat_capacity
	//and also cache this shit rq because that results in sanic speed for reasons byond explanation
	var/list/cached_gasheats = GLOB.gas_data.specific_heats
	//GAS TRANSFER
	for(var/id in cached_gases | sharer_gases) // transfer gases
		var/gas_archive = cached_gases[id]
		var/sharergas = sharer_gases[id]
		delta = QUANTIZE(gas_archive[id] - sharergas[id]) //the amount of gas that gets moved between the mixtures

		if(delta && abs_temperature_delta > MINIMUM_TEMPERATURE_DELTA_TO_CONSIDER)
			gas_heat_capacity = delta * cached_gasheats[id]
			if(delta > 0)
				heat_capacity_self_to_sharer += gas_heat_capacity
			else
				heat_capacity_sharer_to_self -= gas_heat_capacity //subtract here instead of adding the absolute value because we know that delta is negative.

		cached_gases[id] -= delta
		sharer_gases[id] += delta
		moved_moles += delta
		abs_moved_moles += abs(delta)

	last_share = abs_moved_moles

	//THERMAL ENERGY TRANSFER
	if(abs_temperature_delta > MINIMUM_TEMPERATURE_DELTA_TO_CONSIDER)
		var/new_self_heat_capacity = old_self_heat_capacity + heat_capacity_sharer_to_self - heat_capacity_self_to_sharer
		var/new_sharer_heat_capacity = old_sharer_heat_capacity + heat_capacity_self_to_sharer - heat_capacity_sharer_to_self

		//transfer of thermal energy (via changed heat capacity) between self and sharer
		if(new_self_heat_capacity > MINIMUM_HEAT_CAPACITY)
			temperature = (old_self_heat_capacity*temperature - heat_capacity_self_to_sharer*temperature_archived + heat_capacity_sharer_to_self*sharer.temperature_archived)/new_self_heat_capacity

		if(new_sharer_heat_capacity > MINIMUM_HEAT_CAPACITY)
			sharer.temperature = (old_sharer_heat_capacity*sharer.temperature-heat_capacity_sharer_to_self*sharer.temperature_archived + heat_capacity_self_to_sharer*temperature_archived)/new_sharer_heat_capacity
		//thermal energy of the system (self and sharer) is unchanged

			if(abs(old_sharer_heat_capacity) > MINIMUM_HEAT_CAPACITY)
				if(abs(new_sharer_heat_capacity/old_sharer_heat_capacity - 1) < 0.1) // <10% change in sharer heat capacity
					temperature_share(sharer, OPEN_HEAT_TRANSFER_COEFFICIENT)

	if (initial(sharer.gc_share))
		GAS_GARBAGE_COLLECT(sharer.gases)
	if(temperature_delta > MINIMUM_TEMPERATURE_TO_MOVE || abs(moved_moles) > MINIMUM_MOLES_DELTA_TO_MOVE)
		var/our_moles
		TOTAL_MOLES(cached_gases,our_moles)
		var/their_moles
		TOTAL_MOLES(sharer_gases,their_moles)
		return (temperature_archived*(our_moles + moved_moles) - sharer.temperature_archived*(their_moles - moved_moles)) * R_IDEAL_GAS_EQUATION / volume


/datum/gas_mixture/proc/temperature_share(datum/gas_mixture/sharer, conduction_coefficient, sharer_temperature, sharer_heat_capacity)
	//thermal energy of the system (self and sharer) is unchanged
	//Performs temperature sharing calculations (via conduction) between two gas_mixtures assuming only 1 boundary length
	//Returns: new temperature of the sharer
	if(sharer)
		sharer_temperature = sharer.temperature_archived
	var/temperature_delta = temperature_archived - sharer_temperature
	if(abs(temperature_delta) > MINIMUM_TEMPERATURE_DELTA_TO_CONSIDER)
		var/self_heat_capacity = heat_capacity()
		sharer_heat_capacity = sharer_heat_capacity || sharer.heat_capacity()

		if((sharer_heat_capacity > MINIMUM_HEAT_CAPACITY) && (self_heat_capacity > MINIMUM_HEAT_CAPACITY))
			var/heat = conduction_coefficient*temperature_delta* \
				(self_heat_capacity*sharer_heat_capacity/(self_heat_capacity+sharer_heat_capacity))

			temperature = max(temperature - heat/self_heat_capacity, TCMB)
			sharer_temperature = max(sharer_temperature + heat/sharer_heat_capacity, TCMB)
			if(sharer)
				sharer.temperature = sharer_temperature
	return sharer_temperature

/datum/gas_mixture/proc/compare(datum/gas_mixture/sample)
	var/list/sample_gases = sample.gases //accessing datum vars is slower than proc vars
	var/list/cached_gases = gases

	for(var/id in cached_gases | sample_gases) // compare gases from either mixture
		var/gas_moles = cached_gases[id]
		var/sample_moles = sample_gases[id]
		var/delta = abs(gas_moles - sample_moles)
		if(delta > MINIMUM_MOLES_DELTA_TO_MOVE && \
			delta > gas_moles * MINIMUM_AIR_RATIO_TO_MOVE)
			return id

	var/our_moles
	TOTAL_MOLES(cached_gases, our_moles)
	if(our_moles > MINIMUM_MOLES_DELTA_TO_MOVE)
		var/temp = temperature
		var/sample_temp = sample.temperature

		var/temperature_delta = abs(temp - sample_temp)
		if(temperature_delta > MINIMUM_TEMPERATURE_DELTA_TO_SUSPEND)
			return "temp"

	return ""

/datum/gas_mixture/proc/react(datum/holder)
	//Performs various reactions such as combustion or fusion (LOL)
	//Returns: 1 if any reaction took place; 0 otherwise

/datum/gas_mixture/proc/adjust_heat(amt)
	//Adjusts the thermal energy of the gas mixture, rather than having to do the full calculation.
	//Returns: null

/datum/gas_mixture/proc/equalize_with(datum/gas_mixture/giver)
	//Makes this mix have the same temperature and gas ratios as the giver, but with the same pressure, accounting for volume.
	//Returns: null

/datum/gas_mixture/proc/get_oxidation_power(temp)
	//Gets how much oxidation this gas can do, optionally at a given temperature.

/datum/gas_mixture/proc/get_fuel_amount(temp)
	//Gets how much fuel for fires (not counting trit/plasma!) this gas has, optionally at a given temperature.

/proc/equalize_all_gases_in_list(list/L)
	//Makes every gas in the given list have the same pressure, temperature and gas proportions.
	//Returns: null

/datum/gas_mixture/copy()
	var/datum/gas_mixture/copy = new type
	copy.copy_from(src)

	return copy

/datum/gas_mixture/parse_gas_string(gas_string)
	gas_string = SSair.preprocess_gas_string(gas_string)

	var/list/gas = params2list(gas_string)
	if(gas["TEMP"])
		var/temp = text2num(gas["TEMP"])
		gas -= "TEMP"
		if(!isnum(temp) || temp < 2.7)
			temp = 2.7
		set_temperature(temp)
	clear()
	for(var/id in gas)
		set_moles(id, text2num(gas[id]))
	archive()
	return 1

/datum/gas_mixture/proc/set_analyzer_results(instability)
	if(!analyzer_results)
		analyzer_results = new
	analyzer_results["fusion"] = instability

//Mathematical proofs:
/*
get_breath_partial_pressure(gas_pp) --> gas_pp/total_moles()*breath_pp = pp
get_true_breath_pressure(pp) --> gas_pp = pp/breath_pp*total_moles()
10/20*5 = 2.5
10 = 2.5/5*20
*/

/datum/gas_mixture/turf

/datum/gas_mixture/turf/heat_capacity() // Same as above except vacuums return HEAT_CAPACITY_VACUUM
	var/list/cached_gases = gases
	var/list/cached_gasheats = GLOB.gas_data.specific_heats
	for(var/id in cached_gases)
		. += cached_gases[id] * cached_gasheats[id]
	if(!.)
		. += HEAT_CAPACITY_VACUUM //we want vacuums in turfs to have the same heat capacity as space

/// Releases gas from src to output air. This means that it can not transfer air to gas mixture with higher pressure.
/// a global proc due to rustmos
/proc/release_gas_to(datum/gas_mixture/input_air, datum/gas_mixture/output_air, target_pressure)
	var/output_starting_pressure = output_air.return_pressure()
	var/input_starting_pressure = input_air.return_pressure()

	if(output_starting_pressure >= min(target_pressure,input_starting_pressure-10))
		//No need to pump gas if target is already reached or input pressure is too low
		//Need at least 10 KPa difference to overcome friction in the mechanism
		return FALSE

	//Calculate necessary moles to transfer using PV = nRT
	if((input_air.total_moles() > 0) && (input_air.return_temperature()>0))
		var/pressure_delta = min(target_pressure - output_starting_pressure, (input_starting_pressure - output_starting_pressure)/2)
		//Can not have a pressure delta that would cause output_pressure > input_pressure

		var/transfer_moles = pressure_delta*output_air.return_volume()/(input_air.return_temperature() * R_IDEAL_GAS_EQUATION)

		//Actually transfer the gas
		input_air.transfer_to(output_air, transfer_moles)

		return TRUE
	return FALSE
