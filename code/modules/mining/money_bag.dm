/*****************************Money bag********************************/

/obj/item/storage/bag/money
	name = "money bag"
	icon_state = "moneybag"
	force = 10
	throwforce = 0
	resistance_flags = FLAMMABLE
	max_integrity = 100
	w_class = WEIGHT_CLASS_BULKY

/obj/item/storage/bag/money/Initialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 40
	STR.max_combined_w_class = 40
	STR.can_hold = typecacheof(list(/obj/item/coin, /obj/item/stack/spacecash, /obj/item/holochip))

/obj/item/storage/bag/money/vault/PopulateContents()
	new /obj/item/coin/silver(src)
	new /obj/item/coin/silver(src)
	new /obj/item/coin/silver(src)
	new /obj/item/coin/silver(src)
	new /obj/item/coin/gold(src)
	new /obj/item/coin/gold(src)
	new /obj/item/coin/adamantine(src)

/obj/item/storage/bag/money/c5000/PopulateContents()
	for(var/i = 0, i < 5, i++)
		new /obj/item/stack/spacecash/c1000(src)

/obj/item/storage/bag/money/small
	name = "money stash"
	icon_state = "moneypouch"
	force = 10
	throwforce = 0
	resistance_flags = FLAMMABLE
	max_integrity = 100
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_ID

/obj/item/storage/bag/money/small/Initialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 20
	STR.can_hold = typecacheof(list(/obj/item/coin, /obj/item/stack/spacecash, /obj/item/stack/f13Cash))

// Legion reserves. Spawns with the Centurion.
/obj/item/storage/bag/money/small/legion/PopulateContents()
	// ~450ish worth of legion money
	new /obj/item/stack/f13Cash/random/denarius/high(src)
	new /obj/item/stack/f13Cash/random/denarius/med(src)
	new /obj/item/stack/f13Cash/random/aureus/high(src)

// Legion enlisted. Spawns with the Legionnaires. Average 12 caps.
/obj/item/storage/bag/money/small/legenlisted/PopulateContents()
	new /obj/item/stack/f13Cash/random/denarius/low(src)

// Legion officers. Spawns with the Decanii. Average 175 caps.
/obj/item/storage/bag/money/small/legofficers/PopulateContents()
	new /obj/item/stack/f13Cash/random/denarius/med(src)
	new /obj/item/stack/f13Cash/random/aureus/low(src)

// NCR reserves. Spawns with the Captain.
/obj/item/storage/bag/money/small/ncr/PopulateContents()
	// ~450 worth of ncr money
	new /obj/item/stack/f13Cash/random/ncr/high(src)
	new /obj/item/stack/f13Cash/random/ncr/med(src)
	new /obj/item/stack/f13Cash/random/ncr/med(src)

// NCR enlisted. Spawns with the non officers.
/obj/item/storage/bag/money/small/ncrenlisted/PopulateContents()
	// ~12 worth of ncr money
	new /obj/item/stack/f13Cash/random/ncr/low(src)

// NCR officers. Spawns with the officers and Rangers.
/obj/item/storage/bag/money/small/ncrofficers/PopulateContents()
	// ~75 worth of ncr money
	new /obj/item/stack/f13Cash/random/ncr/med(src)

// Den reserves. Spawns with the Sheriff.
/obj/item/storage/bag/money/small/den/PopulateContents()
	// ~225 worth of assorted money
	new /obj/item/stack/f13Cash/random/med(src)
	new /obj/item/stack/f13Cash/random/denarius/med(src)
	new /obj/item/stack/f13Cash/random/ncr/med(src)

// Oasis reserves. Spawns with the Mayor.
/obj/item/storage/bag/money/small/oasis/PopulateContents()
	// exactly 1000 caps, and about 200 in foreign reserves
	new /obj/item/stack/f13Cash/caps/onezerozerozero(src)
	new /obj/item/stack/f13Cash/random/denarius/med(src)
	new /obj/item/stack/f13Cash/random/ncr/med(src)

// Standard Wastelander money bag. They have more but are liable to get robbed for it.
/obj/item/storage/bag/money/small/wastelander/PopulateContents()
	// ~48 worth of assorted money
	new /obj/item/stack/f13Cash/random/low(src)
	new /obj/item/stack/f13Cash/random/low(src)
	new /obj/item/stack/f13Cash/random/denarius/low(src)
	new /obj/item/stack/f13Cash/random/ncr/low(src)

// Standard Great Khan money bag. They have a little more caps than common raiders. Average 75.
/obj/item/storage/bag/money/small/khan/PopulateContents()
	new /obj/item/stack/f13Cash/random/high(src)

// Standard Settler money bag. They are pretty wealthy, with NCR bucks and caps, no Legion money.
/obj/item/storage/bag/money/small/settler/PopulateContents()
	// ~162 worth of non legion money
	new /obj/item/stack/f13Cash/random/med(src)
	new /obj/item/stack/f13Cash/random/med(src)
	new /obj/item/stack/f13Cash/random/ncr/low(src)

// Standard Banker money bag. They are insanely wealthy, Caps only and only for RP purposes.
/obj/item/storage/bag/money/small/banker/PopulateContents()
	// ~162 worth of non legion money
	new /obj/item/stack/f13Cash/random/banker(src)

// Standard Raider money bag. They blew it all on chems and armor mods.
/obj/item/storage/bag/money/small/raider/PopulateContents()
	// ~12 worth of caps
	new /obj/item/stack/f13Cash/random/low(src)

/obj/item/storage/bag/money/small/raider/mobboss/PopulateContents()
	new /obj/item/stack/f13Cash/random/high(src)
	//mob boss, reasonably wealthy

////////
//Reno//
////////

/obj/item/storage/bag/money/small/reno/threezerozero/PopulateContents()
	// ~300 worth of assorted money
	new /obj/item/stack/f13Cash/ncr/onefivezero(src)
	new /obj/item/stack/f13Cash/ncr/onefivezero(src)

/obj/item/storage/bag/money/small/reno/onefivezero/PopulateContents()
	// ~150 worth of assorted money
	new /obj/item/stack/f13Cash/ncr/onefivezero(src)

/obj/item/storage/bag/money/small/reno/onezerozero/PopulateContents()
	// ~100 worth of assorted money
	new /obj/item/stack/f13Cash/ncr/onezerozero(src)

/obj/item/storage/bag/money/small/reno/sevenzero/PopulateContents()
	// ~70 worth of assorted money
	new /obj/item/stack/f13Cash/ncr/sevenzero(src)

/obj/item/storage/bag/money/small/reno/fivezero/PopulateContents()
	// ~50 worth of assorted money
	new /obj/item/stack/f13Cash/ncr/fivezero(src)

/obj/item/storage/bag/money/small/reno/fourzero/PopulateContents()
	// ~40 worth of assorted money
	new /obj/item/stack/f13Cash/ncr/fourzero(src)

/obj/item/storage/bag/money/small/reno/threezero/PopulateContents()
	// ~30 worth of assorted money
	new /obj/item/stack/f13Cash/ncr/threezero(src)

/obj/item/storage/bag/money/small/reno/onezero/PopulateContents()
	// ~10 worth of assorted money
	new /obj/item/stack/f13Cash/ncr/onezero(src)

//Reno Cap Placeholders

/obj/item/storage/bag/money/small/reno/cap/sixzerozero/PopulateContents()
	// ~600 worth of assorted money
	new /obj/item/stack/f13Cash/caps/onefivezero(src)
	new /obj/item/stack/f13Cash/caps/onefivezero(src)
	new /obj/item/stack/f13Cash/caps/onefivezero(src)
	new /obj/item/stack/f13Cash/caps/onefivezero(src)

/obj/item/storage/bag/money/small/reno/cap/threezerozero/PopulateContents()
	// ~300 worth of assorted money
	new /obj/item/stack/f13Cash/caps/onefivezero(src)
	new /obj/item/stack/f13Cash/caps/onefivezero(src)

/obj/item/storage/bag/money/small/reno/cap/onefivezero/PopulateContents()
	// ~150 worth of assorted money
	new /obj/item/stack/f13Cash/caps/onefivezero(src)

/obj/item/storage/bag/money/small/reno/cap/onezerozero/PopulateContents()
	// ~100 worth of assorted money
	new /obj/item/stack/f13Cash/caps/onezerozero(src)

/obj/item/storage/bag/money/small/reno/cap/sevenzero/PopulateContents()
	// ~70 worth of assorted money
	new /obj/item/stack/f13Cash/caps/sevenzero(src)

/obj/item/storage/bag/money/small/reno/cap/fivezero/PopulateContents()
	// ~50 worth of assorted money
	new /obj/item/stack/f13Cash/caps/fivezero(src)

/obj/item/storage/bag/money/small/reno/cap/fourzero/PopulateContents()
	// ~40 worth of assorted money
	new /obj/item/stack/f13Cash/caps/fourzero(src)

/obj/item/storage/bag/money/small/reno/cap/threezero/PopulateContents()
	// ~30 worth of assorted money
	new /obj/item/stack/f13Cash/caps/threezero(src)

/obj/item/storage/bag/money/small/reno/cap/onezero/PopulateContents()
	// ~10 worth of assorted money
	new /obj/item/stack/f13Cash/caps/onezero(src)
