/datum/export/f13Cash
	k_elasticity = 0

/datum/export/f13Cash
	cost = 1
	k_elasticity = 0
	unit_name = "cap"
	export_types = list(/obj/item/stack/f13Cash)

/datum/export/large/f13Cash/total_printout(datum/export_report/ex, notes = TRUE)
	. = ..()
	if(. && notes)
		. += " Your deposit is completed."

/datum/export/f13Cash/caps
	cost = 1
	unit_name = "cap"
	export_types = list(/obj/item/stack/f13Cash/caps)
	exclude_types = list()

/datum/export/f13Cash/ncr
	cost = 0.4
	unit_name = "dollar"
	export_types = list(/obj/item/stack/f13Cash/ncr)
	exclude_types = list()

/datum/export/f13Cash/denarius
	cost = 4
	unit_name = "denarius"
	export_types = list(/obj/item/stack/f13Cash/denarius)
	exclude_types = list()

/datum/export/f13Cash/aureus
	cost = 100
	unit_name = "aureus"
	export_types = list(/obj/item/stack/f13Cash/aureus)
	exclude_types = list()

