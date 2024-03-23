/obj/item/gun/energy/ionrifle
	name = "YK-42b Pulse Rifle"
	desc = "The YK42B rifle is an electrical pulse weapon that was developed by the Yuma Flats Energy Consortium. It excels in damage against heavily armored opponents, especially power armor."
	icon_state = "ionrifle"
	item_state = "ionrifle"	//so the human update icon uses the icon_state instead.
	can_flashlight = 1
	w_class = WEIGHT_CLASS_BULKY
	flags_1 =  CONDUCT_1
	slot_flags = ITEM_SLOT_BACK
	ammo_type = list(/obj/item/ammo_casing/energy/ion)
	ammo_x_offset = 3
	flight_x_offset = 17
	flight_y_offset = 9

/obj/item/gun/energy/ionrifle/emp_act(severity)
	return

/obj/item/gun/energy/ionrifle/carbine
	name = "ion carbine"
	desc = "The MK.II Prototype Ion Projector is a lightweight carbine version of the larger ion rifle, built to be ergonomic and efficient."
	icon_state = "ioncarbine"
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	ammo_x_offset = 2
	flight_x_offset = 18
	flight_y_offset = 11
