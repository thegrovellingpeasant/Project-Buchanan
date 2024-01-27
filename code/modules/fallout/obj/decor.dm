//Fallout 13 structural decorations directory

/obj/structure/decoration
	anchored = 1
	level = ABOVE_NORMAL_TURF_LAYER

/obj/structure/decoration/rag //Generic decoration. See decals.dmi - there are more things to choose the proper icon_state in map editor.
	name = "rag"
	desc = "A torn and dirty rag.<br>It could have been a curtain, or a bedsheet ages ago..."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "rag" //skulls, skin
	layer = 3.2

/obj/structure/decoration/sign //Signs.
	name = "sign"
	desc = "A standard sign, created to provide some important (or not so) information about the current location."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "vault_blank" //See decals.dmi for different icon states for different signs.

/obj/structure/decoration/clock //Wall clocks.
	name = "clock"
	desc = "An ancient instrument to indicate, keep, and co-ordinate time.<br>This particular clock has stopped at 06:45 / 18:45<br>Why did it stop? The clock itself appears to be intact."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "clock"

/obj/structure/decoration/clock/active
	name = "clock"
	desc = "An ancient instrument to indicate, keep, and co-ordinate time.<br>You can hear a quiet ticking coming from the clock."
	icon_state = "clock_act"

/obj/structure/decoration/clock/old
	name = "\improper old clock"
	desc = "An ancient instrument to indicate, keep, and co-ordinate time.<br>The clock was stopped by a distant nuclear blast on October 23, 2077 at 09:49 a.m."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "old_clock"

/obj/structure/decoration/clock/old/active
	name = "\improper old clock"
	desc = "An ancient instrument to indicate, keep, and co-ordinate time.<br>Despite the age, this particular clock is still functional and you can hear a quiet ticking coming from it."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "old_clock_act"

/obj/structure/decoration/vent //Decorative vents for vaults and bunkers.
	name = "vent"
	desc = "An exhaust ventilation system designed to keep the air safe via several stages of filtering."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "ventblue" //ventred, ventorange

/obj/structure/decoration/vent/rusty
	name = "rusty vent"
	desc = "It's very old and rusty.<br>You can hear some wierd sounds coming from the insides of the vent."
	icon_state = "ventrusty" //ventrustyalt

/obj/structure/decoration/ruins //Ruin decorations - they overlap the player most of time, thus they provide a nearly perfect hiding spot.
	name = "\improper ruins"
	desc = "Either the blast nearby was hard enough, or the decades of fallout and absence of maintenance did their part.<br>Be careful so that one of these don't fall on you from above."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "overlap" //See decals.dmi for different icon states of ruins overlays.
	layer = 4.2

/obj/structure/decoration/hatch //Road decorations
	name = "street water drain"
	desc = "An ancient drainage system to protect the roads from flooding."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "hatch" // hatchbroken
	layer = VISIBLE_FROM_ABOVE_LAYER

/obj/structure/decoration/reflector
	name = "road reflector"
	desc = "An ancient road safety device.<br>Here's how it works:<br>A reflective plate is reflecting the street and car lights ensuring the visibility of the road median separating the lanes.<br>The steel part makes a small regular bump along the median to wake the driver if he/she drifts across."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "reflectorvertical"

/obj/structure/decoration/smokeold
	name = "old no-smoking sign"
	desc = "A old pre-war sign indicating for the user not to smoke in the area."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "smokeold"

/obj/structure/decoration/fire
	name = "fire hazard sign"
	desc = "A sign indicating for the user to be wary of flammable material in the area."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "fire"

/obj/structure/decoration/warning
	name = "warning sign"
	desc = "A sign indicating for the user to be wary of something dangerous in the area."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "warn"

/obj/structure/decoration/hazard
	name = "bio-hazard sign"
	desc = "A sign indicating for the user to be wary of something organically dangerous in the area."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "hazard"

/obj/structure/decoration/rads
	name = "radiation sign"
	desc = "A sign indicating for the user to be wary of something radiation and uranium fever in the area."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "radiation"

/obj/structure/decoration/cctv
	name = "cctv sign"
	desc = "An old pre-war sign indicating the use of Security Cameras. Doubt they work now though."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "cctv"

/obj/structure/decoration/train
	name = "train sign"
	desc = "An old pre-war sign indicating trains in the area. Definitely doubt they still work these days."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "train"

/obj/structure/decoration/shock
	name = "shock sign"
	desc = "A sign indicating high current in objects in the area."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "shock"

/obj/structure/decoration/cells
	name = "cell block sign"
	desc = "A sign indicating which cell block you are in prisoner."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "cells"

//////////////////
//new reno stuff//

/obj/structure/decoration/framed
	name = "DO NOT USE"
	desc = "If you are seeing this text, somebody fucked up."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "no name"

/obj/structure/decoration/framed/family_photos
	name = "framed photos"
	desc = "Framed photos of various people."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "wright_photos"

/obj/structure/decoration/framed/diploma
	name = "medical diploma"
	desc = "A diploma from a Californian university."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "diploma"

/obj/structure/decoration/framed/president_tandi
	name = "portrait of a young woman"
	desc = "A framed portrait of younger looking woman in a suit. The plaque reads 'Tandi N.M.; President of the New California Republic, 2196-2248'."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "portrait_kimball"

/obj/structure/decoration/framed/president_kimball
	name = "portrait of a middle aged man"
	desc = "A framed portrait of a middle aged man in a suit with a military haircut. The plaque reads 'Aaron Kimball; President of the New California Republic'."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "portrait_kimball"

/obj/structure/decoration/framed/mr_bishop
	name = "portrait of a young man"
	desc = "A framed portrait of a younger looking man in a suit with an eyepatch. The plaque reads 'John H. Bishop II; Mayor of the City-County of New Reno'."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "portrait_bishop"

/obj/structure/decoration/framed/mr_wright
	name = "portrait of an elderly man"
	desc = "A framed portrait of an elderly man wearing a suit. The plaque reads 'Christopher Wright'."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "portrait_bishop"

/obj/structure/decoration/framed/wright_photos
	name = "framed photos"
	desc = "Framed photos of various members of the Wright family."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "wright_photos"

//flags

/obj/structure/decoration/flag
	name = "DO NOT USE"
	desc = "If you are seeing this text, somebody fucked up."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "no name"

/obj/structure/decoration/flag/ncr
	name = "flag of the New California Republic"
	desc = "The flag of the NCR. It's a bit faded, but still recognizable."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_ncr"

/obj/structure/decoration/flag/ncr/pristine
	name = "flag of the New California Republic"
	desc = "The flag of the NCR. It is in perfect condition."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_ncr_pristine"

/obj/structure/decoration/flag/cascadia
	name = "flag of the Cascadia Republic"
	desc = "The flag of the CR. It's a bit faded, but still recognizable."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_cascadia"

/obj/structure/decoration/flag/cascadia/pristine
	name = "flag of the Cascadia Republic"
	desc = "The flag of the CR. It is in perfect condition."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_cascadia_pristine"

/obj/structure/decoration/flag/legion
	name = "flag of Caesar's legion"
	desc = "The flag of that tribal horde in the east."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_legion"

/obj/structure/decoration/flag/texas
	name = "flag of Texas"
	desc = "The flag of the Lone Star State. It's a bit faded, but still recognizable."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_texas"

/obj/structure/decoration/flag/texas/pristine
	name = "flag of Texas"
	desc = "The flag of the Lone Star State. It is in perfect condition."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_texas"

/obj/structure/decoration/flag/mexico
	name = "flag of Mexico"
	desc = "The flag of the United Mexican States. It's a bit faded and has a few holes, but still recognizable."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_texas"

/obj/structure/decoration/flag/mexico/undamaged
	name = "flag of Mexico"
	desc = "The flag of the United Mexican States. It's a bit faded, but still recognizable."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_texas_undamaged"

/obj/structure/decoration/flag/mexico/pristine
	name = "flag of Mexico"
	desc = "The flag of the United Mexican States. It is in perfect condition."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_texas_pristine"

/obj/structure/decoration/flag/usa
	name = "flag of America"
	desc = "The flag of the United States of America. Although the government it once represented is long gone, these stars and stripes still mean a lot to some."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_usa"

/obj/structure/decoration/flag/usa/tattered
	name = "flag of America"
	desc = "The flag of the United States of America. Although the government it once represented is long gone, these stars and stripes still mean a lot to some."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_usa_tattered"

/obj/structure/decoration/flag/usa/undamaged
	name = "flag of America"
	desc = "The flag of the United States of America. Although the government it once represented is long gone, these stars and stripes still mean a lot to some."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_usa_undamaged"

/obj/structure/decoration/flag/usa/pristine
	name = "flag of America"
	desc = "The flag of the United States of America. Although the government it once represented is long gone, these stars and stripes still mean a lot to some."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_usa_pristine"

/obj/structure/decoration/flag/china
	name = "flag of China"
	desc = "The flag of the People's Republic of China. It's a bit faded, but still recognizable."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_china"

/obj/structure/decoration/flag/china/pristine
	name = "flag of China"
	desc = "The flag of the People's Republic of China. It is in perfect condition."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_china_pristine"

/obj/structure/decoration/flag/christian
	name = "Christian flag"
	desc = "A flag that represents Christianity and Christendom. It's a bit faded, but still recognizable."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_christian"

/obj/structure/decoration/flag/christian/pristine
	name = "Christian flag"
	desc = "A flag that represents Christianity and Christendom. It is in perfect condition."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_christian_pristine"

/obj/structure/decoration/flag/redcross
	name = "Red Cross flag"
	desc = "A flag generally used to identify medical instutions, but is by law reserved for the Californian Red Cross Society, the NCR's attempt at establishing a 'non-political' alternative to the Followers of the Apocalypse."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_redcross"

/obj/structure/decoration/flag/redcross/pristine
	name = "Red Cross flag"
	desc = "A flag generally used to identify medical instutions, but is by law reserved for the Californian Red Cross Society, the NCR's attempt at establishing a 'non-political' alternative to the Followers of the Apocalypse."
	icon = 'icons/fallout/objects/newreno.dmi'
	icon_state = "flag_redcross_pristine"