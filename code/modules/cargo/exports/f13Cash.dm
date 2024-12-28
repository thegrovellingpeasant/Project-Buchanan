/datum/export/f13Cash
	cost = 1
	k_elasticity = 0
	unit_name = "cap"
	export_types = list(/obj/item/stack/f13Cash)

/datum/export/f13Cash/get_amount(obj/O)
	var/obj/item/stack/f13Cash/caps_entered = O
	return ..() * caps_entered.get_item_credit_value()

/datum/export/f13Cash/total_printout(datum/export_report/ex, notes = TRUE)
	. = ..()
	if(. && notes)
		. += " Your deposit is completed."
