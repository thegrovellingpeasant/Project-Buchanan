/// Which crime is the prisoner permabrigged for. For fluff!
/datum/preference/choiced/prisoner_crime
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "prisoner_crime"

/datum/preference/choiced/prisoner_crime/init_possible_values()
	return assoc_to_keys(GLOB.prisoner_crimes) + "Random"

/datum/preference/choiced/prisoner_crime/apply_to_human(mob/living/carbon/human/target, value)
	return

/datum/preference/choiced/prisoner_crime/create_default_value()
	return "Random"

/datum/preference/choiced/prisoner_crime/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return istype(preferences.get_highest_priority_job(), /datum/job/prisoner)

/// Types of Crimes Prisoners will have on their record roundstart.
/// (They also can choose Random, which picks from these options... randomly!)
GLOBAL_LIST_INIT(prisoner_crimes, init_prisoner_crimes())

/proc/init_prisoner_crimes()
	var/list/instances = list()
	for(var/datum/prisoner_crime/crime as anything in subtypesof(/datum/prisoner_crime))
		crime = new crime()
		instances[crime.name] = crime
	return instances

/datum/prisoner_crime
	/// crime name
	var/name = "Bugged the Game"
	/// what the record will say about the crime
	var/desc = "Engaged in widespread gamebreaking, didn't report on Github. By the way, report this on Github!"

/datum/prisoner_crime/negligence
	name = "Abhorrent Criminal Negligence"
	desc = "Incompetently risked numerous lives."

/datum/prisoner_crime/attempted_murder
	name = "Attempted Murder"
	desc = "Attempted to maliciously kill someone."

/datum/prisoner_crime/classified
	name = "Classified"
	desc = "Consult Legal."

/datum/prisoner_crime/counterfeiting
	name = "Counterfeiting"
	desc = "Engaged in widespread fraud."

/datum/prisoner_crime/enemy_of_state
	name = "Enemy of New California"
	desc = "Acted as, or knowingly aided, an enemy of New California."

/datum/prisoner_crime/grand_sabo
	name = "Grand Sabotage"
	desc = "Engaged in malicious destructive actions, seriously threatening New Reno citizens and or infrastructure."

/datum/prisoner_crime/grand_theft
	name = "Grand Theft"
	desc = "Stole items of high value or sensitive nature."

/datum/prisoner_crime/identity_theft
	name = "Identity Theft of High-Ranking Government Official"
	desc = "Impersonated a high-ranking official of New Reno."
	
/datum/prisoner_crime/jaywalker
	name = "Jaywalker"
	desc = "Jaywalked across non-green street crossings or vertibird landing zones."

/datum/prisoner_crime/kidnapping
	name = "Kidnapping"
	desc = "Planned and executed a kidnapping."

/datum/prisoner_crime/mass_murder
	name = "Mass Murder"
	desc = "Maliciously planned and executed the slaughter of many people."

/datum/prisoner_crime/malpractice
	name = "Medical Malpractice"
	desc = "Engaged in organ harvesting, limb theft, or other malicious medical procedures."

/datum/prisoner_crime/murder
	name = "Murder"
	desc = "Maliciously killed someone."

/datum/prisoner_crime/raiding
	name = "Raiding"
	desc = "Engaged in violent activities as a raider."

/datum/prisoner_crime/other
	name = "Other"
	desc = "Consult Legal."

/datum/prisoner_crime/brahmin_tampering
	name = "Brahmin Rustler"
	desc = "Maliciously, negligently, or otherwise willfully rustled-up privately owned brahmin."

/datum/prisoner_crime/tax_evasion
	name = "Tax Evasion"
	desc = "Outstanding amount of tax evasion."

/datum/prisoner_crime/cannibal
	name = "Cannibal"
	desc = "Engaged in the consumption of human flesh or organs."

/datum/prisoner_crime/chem_dealer
	name = "Chem Dealing"
	desc = "Peddled illegal narcotics knowingly."
