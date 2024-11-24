
//////////////////////
///// Sentry Bot /////
//////////////////////

/datum/component/construction/unordered/mecha_chassis/sentry
	result = /datum/component/construction/mecha/sentry
	steps = list(
		/obj/item/mecha_parts/part/f13/sentry_head,
		/obj/item/mecha_parts/part/f13/sentry_torso,
		/obj/item/mecha_parts/part/f13/sentry_left_arm,
		/obj/item/mecha_parts/part/f13/sentry_right_arm,
		/obj/item/mecha_parts/part/f13/sentry_left_leg,
		/obj/item/mecha_parts/part/f13/sentry_right_leg
	)

/datum/component/construction/mecha/sentry
	result = /obj/mecha/f13/sentrybot
	base_icon = "sentry"
	steps = list(
		//1
		list(
			"key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are disconnected."
		),

		//2
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are connected."
		),

		//3
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The hydraulic systems are active."
		),

		//4
		list(
			"key" = TOOL_WIRECUTTER,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is added."
		),

		//5
		list(
			"key" = /obj/item/circuitboard/mecha/sentry/main,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is adjusted."
		),

		//6
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Central control module is installed."
		),

		//7
		list(
			"key" = /obj/item/circuitboard/mecha/sentry/peripherals,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Central control module is secured."
		),

		//8
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Peripherals control module is installed."
		),

		//9
		list(
			"key" = /obj/item/circuitboard/mecha/sentry/targeting,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Peripherals control module is secured."
		),

		//10
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Weapon control module is installed."
		),

		//11
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Weapon control module is secured."
		),

		//12
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Scanner module is installed."
		),

		//13
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Scanner module is secured."
		),

		//14
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Capacitor is installed."
		),

		//15
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Capacitor is secured."
		),

		//16
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The power cell is installed."
		),

		//17
		list(
			"key" = /obj/item/stack/sheet/metal,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured."
		),

		//18
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Internal armor is installed."
		),

		//19
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "Internal armor is wrenched."
		),

		//20
		list(
			"key" = /obj/item/mecha_parts/part/f13/sentry_armor,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_WELDER,
			"desc" = "Internal armor is welded."
		),

		//21
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is installed."
		),

		//22
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "External armor is wrenched."
		),
	)


/datum/component/construction/mecha/sentry/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	switch(index)
		if(1)
			user.visible_message("[user] connects [parent] hydraulic systems", span_notice("You connect [parent] hydraulic systems."))
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] activates [parent] hydraulic systems.", span_notice("You activate [parent] hydraulic systems."))
			else
				user.visible_message("[user] disconnects [parent] hydraulic systems", span_notice("You disconnect [parent] hydraulic systems."))
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [parent].", span_notice("You add the wiring to [parent]."))
			else
				user.visible_message("[user] deactivates [parent] hydraulic systems.", span_notice("You deactivate [parent] hydraulic systems."))
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [parent].", span_notice("You adjust the wiring of [parent]."))
			else
				user.visible_message("[user] removes the wiring from [parent].", span_notice("You remove the wiring from [parent]."))
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] disconnects the wiring of [parent].", span_notice("You disconnect the wiring of [parent]."))
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", span_notice("You secure the mainboard."))
			else
				user.visible_message("[user] removes the central control module from [parent].", span_notice("You remove the central computer mainboard from [parent]."))
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the mainboard.", span_notice("You unfasten the mainboard."))
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", span_notice("You secure the peripherals control module."))
			else
				user.visible_message("[user] removes the peripherals control module from [parent].", span_notice("You remove the peripherals control module from [parent]."))
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the peripherals control module.", span_notice("You unfasten the peripherals control module."))
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] secures the weapon control module.", span_notice("You secure the weapon control module."))
			else
				user.visible_message("[user] removes the weapon control module from [parent].", span_notice("You remove the weapon control module from [parent]."))
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", span_notice("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the weapon control module.", span_notice("You unfasten the weapon control module."))
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] secures the scanner module.", span_notice("You secure the scanner module."))
			else
				user.visible_message("[user] removes the scanner module from [parent].", span_notice("You remove the scanner module from [parent]."))
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", span_notice("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the scanner module.", span_notice("You unfasten the scanner module."))
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] secures the capacitor.", span_notice("You secure the capacitor."))
			else
				user.visible_message("[user] removes the capacitor from [parent].", span_notice("You remove the capacitor from [parent]."))
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the capacitor.", span_notice("You unfasten the capacitor."))
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] secures the power cell.", span_notice("You secure the power cell."))
			else
				user.visible_message("[user] pries the power cell from [parent].", span_notice("You pry the power cell from [parent]."))
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] installs the internal armor layer to [parent].", span_notice("You install the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the power cell.", span_notice("You unfasten the power cell."))
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] secures the internal armor layer.", span_notice("You secure the internal armor layer."))
			else
				user.visible_message("[user] pries internal armor layer from [parent].", span_notice("You pry internal armor layer from [parent]."))
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] welds the internal armor layer to [parent].", span_notice("You weld the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the internal armor layer.", span_notice("You unfasten the internal armor layer."))
		if(20)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", span_notice("You install [I] to [parent]."))
			else
				user.visible_message("[user] cuts the internal armor layer from [parent].", span_notice("You cut the internal armor layer from [parent]."))
		if(21)
			if(diff==FORWARD)
				user.visible_message("[user] secures Sentry Bot Armor Plates.", span_notice("You secure Sentry Bot Armor Plates."))
			else
				user.visible_message("[user] pries Sentry Bot Armor Plates from [parent].", span_notice("You pry Sentry Bot Armor Plates from [parent]."))
		if(22)
			if(diff==FORWARD)
				user.visible_message("[user] welds Sentry Bot Armor Plates to [parent].", span_notice("You weld Sentry Bot Armor Plates to [parent]."))
			else
				user.visible_message("[user] unfastens Sentry Bot Armor Plates.", span_notice("You unfasten Sentry Bot Armor Plates."))
	return TRUE

//////////////////////
///// Assaultron /////
//////////////////////

/datum/component/construction/unordered/mecha_chassis/assaultron
	result = /datum/component/construction/mecha/assaultron
	steps = list(
		/obj/item/mecha_parts/part/f13/assaultron_head,
		/obj/item/mecha_parts/part/f13/assaultron_torso,
		/obj/item/mecha_parts/part/f13/assaultron_left_arm,
		/obj/item/mecha_parts/part/f13/assaultron_right_arm,
		/obj/item/mecha_parts/part/f13/assaultron_left_leg,
		/obj/item/mecha_parts/part/f13/assaultron_right_leg
	)

/datum/component/construction/mecha/assaultron
	result = /obj/mecha/f13/assaultron
	base_icon = "assaultron"
	steps = list(
		//1
		list(
			"key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are disconnected."
		),

		//2
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are connected."
		),

		//3
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The hydraulic systems are active."
		),

		//4
		list(
			"key" = TOOL_WIRECUTTER,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is added."
		),

		//5
		list(
			"key" = /obj/item/circuitboard/mecha/assaultron/main,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is adjusted."
		),

		//6
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Central control module is installed."
		),

		//7
		list(
			"key" = /obj/item/circuitboard/mecha/assaultron/peripherals,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Central control module is secured."
		),

		//8
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Peripherals control module is installed."
		),

		//9
		list(
			"key" = /obj/item/circuitboard/mecha/assaultron/targeting,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Peripherals control module is secured."
		),

		//10
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Weapon control module is installed."
		),

		//11
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Weapon control module is secured."
		),

		//12
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Scanner module is installed."
		),

		//13
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Scanner module is secured."
		),

		//14
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Capacitor is installed."
		),

		//15
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Capacitor is secured."
		),

		//16
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The power cell is installed."
		),

		//17
		list(
			"key" = /obj/item/stack/sheet/metal,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured."
		),

		//18
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Internal armor is installed."
		),

		//19
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "Internal armor is wrenched."
		),

		//20
		list(
			"key" = /obj/item/mecha_parts/part/f13/assaultron_armor,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_WELDER,
			"desc" = "Internal armor is welded."
		),

		//21
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is installed."
		),

		//22
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "External armor is wrenched."
		),
	)


/datum/component/construction/mecha/assaultron/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	switch(index)
		if(1)
			user.visible_message("[user] connects [parent] hydraulic systems", span_notice("You connect [parent] hydraulic systems."))
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] activates [parent] hydraulic systems.", span_notice("You activate [parent] hydraulic systems."))
			else
				user.visible_message("[user] disconnects [parent] hydraulic systems", span_notice("You disconnect [parent] hydraulic systems."))
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [parent].", span_notice("You add the wiring to [parent]."))
			else
				user.visible_message("[user] deactivates [parent] hydraulic systems.", span_notice("You deactivate [parent] hydraulic systems."))
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [parent].", span_notice("You adjust the wiring of [parent]."))
			else
				user.visible_message("[user] removes the wiring from [parent].", span_notice("You remove the wiring from [parent]."))
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] disconnects the wiring of [parent].", span_notice("You disconnect the wiring of [parent]."))
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", span_notice("You secure the mainboard."))
			else
				user.visible_message("[user] removes the central control module from [parent].", span_notice("You remove the central computer mainboard from [parent]."))
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the mainboard.", span_notice("You unfasten the mainboard."))
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", span_notice("You secure the peripherals control module."))
			else
				user.visible_message("[user] removes the peripherals control module from [parent].", span_notice("You remove the peripherals control module from [parent]."))
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the peripherals control module.", span_notice("You unfasten the peripherals control module."))
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] secures the weapon control module.", span_notice("You secure the weapon control module."))
			else
				user.visible_message("[user] removes the weapon control module from [parent].", span_notice("You remove the weapon control module from [parent]."))
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", span_notice("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the weapon control module.", span_notice("You unfasten the weapon control module."))
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] secures the scanner module.", span_notice("You secure the scanner module."))
			else
				user.visible_message("[user] removes the scanner module from [parent].", span_notice("You remove the scanner module from [parent]."))
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", span_notice("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the scanner module.", span_notice("You unfasten the scanner module."))
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] secures the capacitor.", span_notice("You secure the capacitor."))
			else
				user.visible_message("[user] removes the capacitor from [parent].", span_notice("You remove the capacitor from [parent]."))
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the capacitor.", span_notice("You unfasten the capacitor."))
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] secures the power cell.", span_notice("You secure the power cell."))
			else
				user.visible_message("[user] pries the power cell from [parent].", span_notice("You pry the power cell from [parent]."))
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] installs the internal armor layer to [parent].", span_notice("You install the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the power cell.", span_notice("You unfasten the power cell."))
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] secures the internal armor layer.", span_notice("You secure the internal armor layer."))
			else
				user.visible_message("[user] pries internal armor layer from [parent].", span_notice("You pry internal armor layer from [parent]."))
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] welds the internal armor layer to [parent].", span_notice("You weld the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the internal armor layer.", span_notice("You unfasten the internal armor layer."))
		if(20)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", span_notice("You install [I] to [parent]."))
			else
				user.visible_message("[user] cuts the internal armor layer from [parent].", span_notice("You cut the internal armor layer from [parent]."))
		if(21)
			if(diff==FORWARD)
				user.visible_message("[user] secures Assaultron Armor Plates.", span_notice("You secure Assaultron Armor Plates."))
			else
				user.visible_message("[user] pries Assaultron Armor Plates from [parent].", span_notice("You pry Assaultron Armor Plates from [parent]."))
		if(22)
			if(diff==FORWARD)
				user.visible_message("[user] welds Assaultron Armor Plates to [parent].", span_notice("You weld Assaultron Armor Plates to [parent]."))
			else
				user.visible_message("[user] unfastens Assaultron Armor Plates.", span_notice("You unfasten Assaultron Armor Plates."))
	return TRUE

///////////////////////
///// Gutsy Mk II /////
///////////////////////

/datum/component/construction/unordered/mecha_chassis/gutsy
	result = /datum/component/construction/mecha/gutsy
	steps = list(
		/obj/item/mecha_parts/part/f13/gutsy_head,
		/obj/item/mecha_parts/part/f13/gutsy_torso,
		/obj/item/mecha_parts/part/f13/gutsy_left_arm,
		/obj/item/mecha_parts/part/f13/gutsy_right_arm,
		/obj/item/mecha_parts/part/f13/gutsy_left_leg,
		/obj/item/mecha_parts/part/f13/gutsy_right_leg
	)

/datum/component/construction/mecha/gutsy
	result = /obj/mecha/f13/gutsy
	base_icon = "gutsy"
	steps = list(
		//1
		list(
			"key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are disconnected."
		),

		//2
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are connected."
		),

		//3
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The hydraulic systems are active."
		),

		//4
		list(
			"key" = TOOL_WIRECUTTER,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is added."
		),

		//5
		list(
			"key" = /obj/item/circuitboard/mecha/gutsy/main,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is adjusted."
		),

		//6
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Central control module is installed."
		),

		//7
		list(
			"key" = /obj/item/circuitboard/mecha/gutsy/peripherals,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Central control module is secured."
		),

		//8
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Peripherals control module is installed."
		),

		//9
		list(
			"key" = /obj/item/circuitboard/mecha/gutsy/targeting,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Peripherals control module is secured."
		),

		//10
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Weapon control module is installed."
		),

		//11
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Weapon control module is secured."
		),

		//12
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Scanner module is installed."
		),

		//13
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Scanner module is secured."
		),

		//14
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Capacitor is installed."
		),

		//15
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Capacitor is secured."
		),

		//16
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The power cell is installed."
		),

		//17
		list(
			"key" = /obj/item/stack/sheet/metal,
			"amount" = 10,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured."
		),

		//18
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is installed."
		),

		//19
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "External armor is wrenched."
		),
	)

/datum/component/construction/mecha/gutsy/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	switch(index)
		if(1)
			user.visible_message("[user] connects [parent] hydraulic systems", span_notice("You connect [parent] hydraulic systems."))
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] activates [parent] hydraulic systems.", span_notice("You activate [parent] hydraulic systems."))
			else
				user.visible_message("[user] disconnects [parent] hydraulic systems", span_notice("You disconnect [parent] hydraulic systems."))
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [parent].", span_notice("You add the wiring to [parent]."))
			else
				user.visible_message("[user] deactivates [parent] hydraulic systems.", span_notice("You deactivate [parent] hydraulic systems."))
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [parent].", span_notice("You adjust the wiring of [parent]."))
			else
				user.visible_message("[user] removes the wiring from [parent].", span_notice("You remove the wiring from [parent]."))
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] disconnects the wiring of [parent].", span_notice("You disconnect the wiring of [parent]."))
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", span_notice("You secure the mainboard."))
			else
				user.visible_message("[user] removes the central control module from [parent].", span_notice("You remove the central computer mainboard from [parent]."))
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the mainboard.", span_notice("You unfasten the mainboard."))
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", span_notice("You secure the peripherals control module."))
			else
				user.visible_message("[user] removes the peripherals control module from [parent].", span_notice("You remove the peripherals control module from [parent]."))
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the peripherals control module.", span_notice("You unfasten the peripherals control module."))
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] secures the weapon control module.", span_notice("You secure the weapon control module."))
			else
				user.visible_message("[user] removes the weapon control module from [parent].", span_notice("You remove the weapon control module from [parent]."))
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", span_notice("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the weapon control module.", span_notice("You unfasten the weapon control module."))
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] secures the scanner module.", span_notice("You secure the scanner module."))
			else
				user.visible_message("[user] removes the scanner module from [parent].", span_notice("You remove the scanner module from [parent]."))
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", span_notice("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the scanner module.", span_notice("You unfasten the scanner module."))
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] secures the capacitor.", span_notice("You secure the capacitor."))
			else
				user.visible_message("[user] removes the capacitor from [parent].", span_notice("You remove the capacitor from [parent]."))
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the capacitor.", span_notice("You unfasten the capacitor."))
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] secures the power cell.", span_notice("You secure the power cell."))
			else
				user.visible_message("[user] pries the power cell from [parent].", span_notice("You pry the power cell from [parent]."))
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] installs the external armor layer to [parent].", span_notice("You install the external armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the power cell.", span_notice("You unfasten the power cell."))
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] secures the external armor layer.", span_notice("You secure the external armor layer."))
			else
				user.visible_message("[user] pries external armor layer from [parent].", span_notice("You pry external armor layer from [parent]."))
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] welds the external armor layer to [parent].", span_notice("You weld the external armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the external armor layer.", span_notice("You unfasten the external armor layer."))
	return TRUE

//////////////////////
///// Protectron /////
//////////////////////

/datum/component/construction/unordered/mecha_chassis/protectron
	result = /datum/component/construction/mecha/protectron
	steps = list(
		/obj/item/mecha_parts/part/f13/protectron_head,
		/obj/item/mecha_parts/part/f13/protectron_torso,
		/obj/item/mecha_parts/part/f13/protectron_left_arm,
		/obj/item/mecha_parts/part/f13/protectron_right_arm,
		/obj/item/mecha_parts/part/f13/protectron_left_leg,
		/obj/item/mecha_parts/part/f13/protectron_right_leg
	)

/datum/component/construction/mecha/protectron
	result = /obj/mecha/f13/protectron
	base_icon = "protectron"
	steps = list(
		//1
		list(
			"key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are disconnected."
		),

		//2
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are connected."
		),

		//3
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The hydraulic systems are active."
		),

		//4
		list(
			"key" = TOOL_WIRECUTTER,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is added."
		),

		//5
		list(
			"key" = /obj/item/circuitboard/mecha/protectron/main,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is adjusted."
		),

		//6
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Central control module is installed."
		),

		//7
		list(
			"key" = /obj/item/circuitboard/mecha/protectron/peripherals,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Central control module is secured."
		),

		//8
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Peripherals control module is installed."
		),

		//9
		list(
			"key" = /obj/item/circuitboard/mecha/protectron/targeting,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Peripherals control module is secured."
		),

		//10
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Weapon control module is installed."
		),

		//11
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Weapon control module is secured."
		),

		//12
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Scanner module is installed."
		),

		//13
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Scanner module is secured."
		),

		//14
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Capacitor is installed."
		),

		//15
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Capacitor is secured."
		),

		//16
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The power cell is installed."
		),

		//17
		list(
			"key" = /obj/item/stack/sheet/metal,
			"amount" = 10,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured."
		),

		//18
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is installed."
		),

		//19
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "External armor is wrenched."
		),
	)

/datum/component/construction/mecha/protectron/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	switch(index)
		if(1)
			user.visible_message("[user] connects [parent] hydraulic systems", span_notice("You connect [parent] hydraulic systems."))
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] activates [parent] hydraulic systems.", span_notice("You activate [parent] hydraulic systems."))
			else
				user.visible_message("[user] disconnects [parent] hydraulic systems", span_notice("You disconnect [parent] hydraulic systems."))
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [parent].", span_notice("You add the wiring to [parent]."))
			else
				user.visible_message("[user] deactivates [parent] hydraulic systems.", span_notice("You deactivate [parent] hydraulic systems."))
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [parent].", span_notice("You adjust the wiring of [parent]."))
			else
				user.visible_message("[user] removes the wiring from [parent].", span_notice("You remove the wiring from [parent]."))
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] disconnects the wiring of [parent].", span_notice("You disconnect the wiring of [parent]."))
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", span_notice("You secure the mainboard."))
			else
				user.visible_message("[user] removes the central control module from [parent].", span_notice("You remove the central computer mainboard from [parent]."))
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the mainboard.", span_notice("You unfasten the mainboard."))
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", span_notice("You secure the peripherals control module."))
			else
				user.visible_message("[user] removes the peripherals control module from [parent].", span_notice("You remove the peripherals control module from [parent]."))
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the peripherals control module.", span_notice("You unfasten the peripherals control module."))
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] secures the weapon control module.", span_notice("You secure the weapon control module."))
			else
				user.visible_message("[user] removes the weapon control module from [parent].", span_notice("You remove the weapon control module from [parent]."))
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", span_notice("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the weapon control module.", span_notice("You unfasten the weapon control module."))
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] secures the scanner module.", span_notice("You secure the scanner module."))
			else
				user.visible_message("[user] removes the scanner module from [parent].", span_notice("You remove the scanner module from [parent]."))
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", span_notice("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the scanner module.", span_notice("You unfasten the scanner module."))
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] secures the capacitor.", span_notice("You secure the capacitor."))
			else
				user.visible_message("[user] removes the capacitor from [parent].", span_notice("You remove the capacitor from [parent]."))
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", span_notice("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the capacitor.", span_notice("You unfasten the capacitor."))
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] secures the power cell.", span_notice("You secure the power cell."))
			else
				user.visible_message("[user] pries the power cell from [parent].", span_notice("You pry the power cell from [parent]."))
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] installs the external armor layer to [parent].", span_notice("You install the external armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the power cell.", span_notice("You unfasten the power cell."))
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] secures the external armor layer.", span_notice("You secure the external armor layer."))
			else
				user.visible_message("[user] pries external armor layer from [parent].", span_notice("You pry external armor layer from [parent]."))
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] welds the external armor layer to [parent].", span_notice("You weld the external armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the external armor layer.", span_notice("You unfasten the external armor layer."))
	return TRUE
