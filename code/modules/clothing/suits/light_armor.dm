// In this document: Light armor


/////////////////////
// DUSTERS & COATS //
/////////////////////

/obj/item/clothing/suit/armored/light/duster
	name = "duster"
	desc = "A long brown leather overcoat with discrete protective reinforcements sewn into the lining."
	icon_state = "duster"
	item_state = "duster"
	permeability_coefficient = 0.9
	heat_protection = CHEST | GROIN
	cold_protection = CHEST | GROIN
	armor = list("melee" = 15, "bullet" = 20, "laser" = 10, "energy" = 10, "bomb" = 15, "bio" = 10, "rad" = 0, "fire" = 20, "acid" = 5, "wound" = 25)

/obj/item/clothing/suit/armored/light/duster/lonesome
	name = "lonesome duster"
	desc = "A blue leather coat with the number 21 on the back.<br><i>If war doesn't change, men must change, and so must their symbols.</i><br><i>Even if there is nothing at all, know what you follow.</i>"
	icon_state = "duster_courier"
	item_state = "duster_courier"
	armor = list("melee" = 15, "bullet" = 20, "laser" = 10, "energy" = 10, "bomb" = 15, "bio" = 10, "rad" = 0, "fire" = 20, "acid" = 5, "wound" = 25)

/obj/item/clothing/suit/armored/light/duster/autumn //Based of Colonel Autumn's uniform.
	name = "tan trenchcoat"
	desc = "A heavy-duty tan trenchcoat typically worn by pre-War generals."
	icon_state = "duster_autumn"
	item_state = "duster_autumn"
	armor = list("melee" = 15, "bullet" = 15, "laser" = 20, "energy" = 20, "bomb" = 20, "bio" = 5, "rad" = 0, "fire" = 15, "acid" = 5, "wound" = 25)

/obj/item/clothing/suit/armored/light/duster/battlecoat
	name = "battlecoat"
	desc = "A heavy padded coat that distributes heat efficiently, designed to protect pre-War bomber pilots from anti-aircraft lasers."
	icon_state = "maxson_battlecoat"
	item_state = "maxson_battlecoat"
	armor = list("melee" = 10, "bullet" = 10, "laser" = 25, "energy" = 25, "bomb" = 10, "bio" = 5, "rad" = 10, "fire" = 25, "acid" = 5, "wound" = 25)

/obj/item/clothing/suit/armored/light/duster/vet
	name = "merc veteran coat"
	desc = "A blue leather coat with its sleeves cut off, adorned with war medals.<br>This type of outfit is common for professional mercenaries and bounty hunters."
	icon_state = "duster_vet"
	item_state = "duster_vet"
	armor = list("melee" = 20, "bullet" = 20, "laser" = 10, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 5, "fire" = 10, "acid" = 5, "wound" = 30)

/obj/item/clothing/suit/armored/light/duster/brahmin
	name = "brahmin leather duster"
	desc = "A duster made from tanned brahmin hide. It has a thick waxy surface from the processing, making it surprisingly laser resistant."
	icon_state = "duster_brahmin"
	item_state = "duster_brahmin"
	armor = list("melee" = 14, "bullet" = 14, "laser" = 25, "energy" = 20, "bomb" = 10, "bio" = 5, "rad" = 0, "fire" = 25, "acid" = 5, "wound" = 25)

/obj/item/clothing/suit/armored/light/duster/desperado
	name = "desperado's duster"
	desc = "A dyed brahmin hide duster, with a thick waxy surface, making it less vulnerable to lasers and energy based weapons."
	icon_state = "duster_lawman"
	item_state = "duster_lawman"
	armor = list("melee" = 10, "bullet" = 10, "laser" = 20, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0, "wound" = 25)



//////////////////
// KEVLAR VESTS //
//////////////////

/obj/item/clothing/suit/armored/light/vest/flak
	name = "ancient flak vest"
	desc = "Poorly maintained, this patched vest will still still stop some bullets, but don't expect any miracles. The ballistic nylon used in its construction is inferior to kevlar, and very weak to acid, but still quite tough."
	icon_state = "vest_flak"
	item_state = "vest_flak"
	armor = list("melee" = 0, "bullet" = 25, "laser" = 0, "energy" = 0, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = -50)

/obj/item/clothing/suit/armored/light/vest/kevlar
	name = "kevlar vest"
	desc = "Worn but serviceable, the vest is is effective against ballistic impacts."
	icon_state = "vest_kevlar"
	item_state = "vest_kevlar"
	armor = list("melee" = 5, "bullet" = 35, "laser" = 5, "energy" = 0, "bomb" = 5, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/light/vest/bulletproof
	name = "bulletproof vest"
	desc = "This vest is in good shape, the layered kevlar lightweight yet very good at stopping bullets."
	icon_state = "vest_bullet"
	item_state = "vest_bullet"
	armor = list("melee" = 10, "bullet" = 25, "laser" = 5, "energy" = 5, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 50)

/obj/item/clothing/suit/armored/light/vest/followers
	name = "followers armor vest"
	desc = "A coat in light colors with the markings of the Followers, concealing a bullet-proof vest."
	icon_state = "vest_follower"
	item_state = "vest_follower"
	armor = list("melee" = 10, "bullet" = 25, "laser" = 5, "energy" = 0, "bomb" = 5, "bio" = 10, "rad" = 0, "fire" = 5, "acid" = 0, "wound" = 50)


/////////////////
// MIXED ARMOR //
/////////////////

/obj/item/clothing/suit/armored/light/rustedcowboy
	name = "rusted cowboy outfit"
	desc = "A weather treated leather cowboy outfit. Yeehaw Pard'!"
	icon_state = "rusted_cowboy"
	item_state = "rusted_cowboy"
	flags_inv = HIDEJUMPSUIT
	heat_protection = CHEST | GROIN | LEGS | ARMS
	cold_protection = CHEST | GROIN | LEGS | ARMS
	permeability_coefficient = 0.5
	armor = list("melee" = 20, "bullet" = 15, "laser" = 10, "energy" = 15, "bomb" = 30, "bio" = 10, "rad" = 10, "fire" = 40, "acid" = 10, "wound" = 30)

/obj/item/clothing/suit/armored/light/chitinarmor
	name = "insect chitin armor"
	desc = "A suit made from gleaming insect chitin. The glittering black scales are remarkably resistant to hostile environments, except cold."
	icon_state = "insect"
	item_state = "insect"
	flags_inv = HIDEJUMPSUIT
	heat_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	resistance_flags = FIRE_PROOF | ACID_PROOF
	siemens_coefficient = 0.5
	permeability_coefficient = 0.5
	armor = list("melee" = 15, "bullet" = 15, "laser" = 20, "energy" = 20, "bomb" = 10, "bio" = 50, "rad" = 50, "fire" = 70, "acid" = 80)

/obj/item/clothing/suit/armored/light/wastetribe
	name = "wasteland tribe armor"
	desc = "Soft armor made from layered dog hide strips glued together, with some metal bits here and there."
	icon_state = "tribal"
	item_state = "tribal"
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 22, "bullet" = 5, "laser" = 10, "energy" = 10, "bomb" = 5, "bio" = 0, "rad" = 5, "fire" = 5, "acid" = 0)

/obj/item/clothing/suit/armored/light/vaquero
	name = "vaquero suit"
	desc = "An ornate suit popularized by traders from the south, using tiny metal studs and plenty of silver thread wich serves as decoration and also reflects energy very well, useful when facing the desert sun or a rogue Eyebot."
	icon_state = "vaquero"
	item_state = "vaquero"
	flags_inv = HIDEJUMPSUIT
	heat_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	siemens_coefficient = 1.1
	armor = list("melee" = 10, "bullet" = 10, "laser" = 30, "energy" = 25, "bomb" = 5, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0)

/obj/item/clothing/suit/armored/light/wastewar
	name = "wasteland warrior armor"
	desc = "a mad attempt to recreate armor based of images of japanese samurai, using a sawn up old car tire as shoulder pads, bits of chain to cover the hips and pieces of furniture for a breastplate. Might stop a blade but nothing else, burns easily too."
	icon_state = "wastewar"
	item_state = "wastewar"
	resistance_flags = FLAMMABLE
	armor = list("melee" = 25, "bullet" = 5, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = -10, "acid" = 0)

// Outlaw
/obj/item/clothing/suit/toggle/armored/khanlight
	name = "great khan jacket"
	desc = "With small lead plate inserts giving some defense, the jackets and vests popular with the Great Khans show off their emblem on the back."
	icon_state = "khanjacket"
	item_state = "khanjacket"
	armor = list("melee" = 30, "bullet" = 20, "laser" = 15, "energy" = 10, "bomb" = 5, "bio" = 0, "rad" = 30, "fire" = 0, "acid" = 5)

/obj/item/clothing/suit/armored/light/badlands
	name = "badlands raider armor"
	desc = "A leather top with a bandolier over it and a straps that cover the arms. Suited for warm climates, comes with storage space."
	icon_state = "badlands"
	item_state = "badlands"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets
	heat_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	armor = list("melee" = 25, "bullet" = 25, "laser" = 10, "energy" = 5, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 5, "acid" = 0)

/obj/item/clothing/suit/armored/light/tribalraider
	name = "tribal raider wear"
	desc = "Very worn bits of clothing and armor in a style favored by many tribes."
	icon_state = "tribal_outcast"
	item_state = "tribal_outcast"
	heat_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	armor = list("melee" = 25, "bullet" = 15, "laser" = 15, "energy" = 10, "bomb" = 5, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 0)
	allowed = list(/obj/item/gun, /obj/item/kitchen, /obj/item/twohanded, /obj/item/melee/onehanded, /obj/item/twohanded/spear, /obj/item/melee/smith, /obj/item/melee/smith/twohand
	)

/obj/item/clothing/suit/toggle/armor/f13viper_jacket
	name = "viper denim vest"
	desc = "Don't get too close or you might get bit, Vipers Rule!"
	icon_state = "viper_jacket"
	item_state = "viper_jacket"
	armor = list("melee" = 10, "bullet" = 15, "laser" = 10,  "energy" = 10, "bomb" = 30, "bio" = 40, "rad" = 40, "fire" = 50, "acid" = 10, "wound" = 37)
	slowdown = 0.05

/obj/item/clothing/suit/toggle/armor/f13patriot_jacket
	name = "denim vest"
	desc = "Faded blues and a flag that wont stop flying, this jacket is for a real patriot."
	icon_state = "rockflageagle_jacket"
	item_state = "rockflageagle_jacket"
	armor = list("melee" = 10, "bullet" = 15, "laser" = 10,  "energy" = 10, "bomb" = 30, "bio" = 40, "rad" = 40, "fire" = 50, "acid" = 10, "wound" = 37)
	slowdown = 0.05

/obj/item/clothing/suit/toggle/armor/f13sasquatch_jacket
	name = "bigfoot denim vest"
	desc = "Only mentioned in passing and unconfirmed sightings, this is truly a rare find."
	icon_state = "sasquatch_jacket"
	item_state = "sasquatch_jacket"
	armor = list("melee" = 10, "bullet" = 15, "laser" = 10,  "energy" = 10, "bomb" = 30, "bio" = 40, "rad" = 40, "fire" = 50, "acid" = 10, "wound" = 37)
	slowdown = 0.05

/obj/item/clothing/suit/hooded/outcast
	name = "patched heavy leather cloak"
	desc = "A robust cloak made from layered gecko skin patched with various bits of leather from dogs and other animals, able to absorb more force than one would expect from leather."
	icon = 'icons/fallout/clothing/armored_light.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_light.dmi'
	icon_state = "cloak_outcast"
	item_state = "cloak_outcast"
	armor = list("melee" = 35, "bullet" = 20, "laser" = 10, "energy" = 10, "bomb" = 25, "bio" = 20, "rad" = 30, "fire" = 30, "acid" = 20)
	hoodtype = /obj/item/clothing/head/hooded/cloakhood/tribaloutcast
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/head/hooded/cloakhood/outcast
	name = "patched leather hood"
	desc = "Thick layered leather, patched together."
	icon = 'icons/fallout/clothing/hats.dmi'
	icon_state = "hood_tribaloutcast"
	mob_overlay_icon = 'icons/fallout/onmob/clothes/head.dmi'
	item_state = "hood_tribaloutcast"
	armor = list("melee" = 35, "bullet" = 20, "laser" = 10, "energy" = 10, "bomb" = 25, "bio" = 20, "rad" = 30, "fire" = 30, "acid" = 20)
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR


////////////////
// ARMOR KITS //
////////////////

/obj/item/clothing/suit/armored/light/kit
	name = "armor kit"
	desc = "Separate armor parts you can wear over your clothing, giving basic protection against bullets entering some of your organs. Very well ventilated."
	icon_state = "armorkit"
	item_state = "armorkit"
	heat_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	siemens_coefficient = 1.1
	armor = list("melee" = 10, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/light/kit/punk
	name = "armor kit"
	desc = "A few pieces of metal strapped to protect choice parts against sudden lead poisoning. Excellent ventilation included."
	icon_state = "armorkit_punk"
	item_state = "armorkit_punk"

/obj/item/clothing/suit/armored/light/kit/shoulder
	name = "armor kit"
	desc = "A single big metal shoulderplate for the right side, keeping it turned towards the enemy is advisable."
	icon_state = "armorkit_shoulder"
	item_state = "armorkit_shoulder"

/obj/item/clothing/suit/armored/light/kit/plates
	name = "light armor plates"
	desc = "Well-made metal plates covering your vital organs."
	icon_state = "light_plates"


///////////////////
// LEATHER ARMOR //
///////////////////

/obj/item/clothing/suit/armored/light/leather
	name = "leather armor"
	desc = "Before the war motorcycle-football was one of the largest specator sports in America. This armor copies the style of armor used by the players,	using leather boiled in corn oil to make hard sheets to emulate the light weight and toughness of the original polymer armor."
	icon_state = "leather_armor"
	item_state = "leather_armor"
	armor = list("melee" = 15, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0, "wound" = 20)
	slowdown = 0.025 //token slowdown

// Recipe the above + 2 gecko hides
/obj/item/clothing/suit/armored/light/leathermk2
	name = "leather armor mk II"
	desc = "Armor in the motorcycle-football style, either with intact original polymer plating, or reinforced with gecko hide."
	icon_state = "leather_armor_mk2"
	item_state = "leather_armor_mk2"
	armor = list("melee" = 25, "bullet" = 30, "laser" = 15, "energy" = 5, "bomb" = 5, "bio" = 0, "rad" = 0, "fire" = 5, "acid" = 0)

/obj/item/clothing/suit/armored/light/leathersuit
	name = "leather suit"
	desc = "Comfortable suit of tanned leather leaving one arm mostly bare. Keeps you warm and cozy."
	icon_state = "leather_suit"
	item_state = "leather_suit"
	flags_inv = HIDEJUMPSUIT
	cold_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	siemens_coefficient = 0.9
	armor = list("melee" = 20, "bullet" = 25, "laser" = 15, "energy" = 5, "bomb" = 5, "bio" = 5, "rad" = 0, "fire" = 15, "acid" = 5)

/obj/item/clothing/suit/armored/light/leather_jacket
	name = "bouncer jacket"
	icon_state = "leather_jacket_fighter"
	item_state = "leather_jacket_fighter"
	desc = "A very stylish pre-War black, heavy leather jacket. Not always a good choice to wear this the scorching sun of the desert, and one of the arms has been torn off"
	armor = list("melee" = 15, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0, "wound" = 20)
	slowdown = 0.025 //token slowdown

/obj/item/clothing/suit/armored/light/leather_jacketmk2
	name = "thick leather jacket"
	desc = "This heavily padded leather jacket is unusual in that it has two sleeves. You'll definitely make a fashion statement whenever, and wherever, you rumble."
	icon_state = "leather_jacket_thick"
	item_state = "leather_jacket_thick"
	armor = list("melee" = 25, "bullet" = 30, "laser" = 15, "energy" = 5, "bomb" = 5, "bio" = 0, "rad" = 0, "fire" = 5, "acid" = 0)

// Recipe : one of the above + a suit_fashion leather coat
/obj/item/clothing/suit/armored/light/leathercoat
	name = "thick leather coat"
	desc = "Reinforced leather jacket with a overcoat. Well insulated, creaks a lot while moving."
	icon_state = "leather_coat_fighter"
	item_state = "leather_coat_fighter"
	siemens_coefficient = 0.8
	cold_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	armor = list("melee" = 25, "bullet" = 30, "laser" = 15, "energy" = 5, "bomb" = 5, "bio" = 0, "rad" = 0, "fire" = 5, "acid" = 0)

/obj/item/clothing/suit/armored/light/tanvest
	name = "tanned vest"
	icon_state = "tanleather"
	item_state = "tanleather"
	desc = "Layers of leather glued together to make a stiff vest, crude but gives some protection against wild beasts and knife stabs to the liver."
	armor = list("melee" = 18, "bullet" = 5, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/light/cowboyvest
	name = "cowboy vest"
	icon_state = "cowboybvest"
	item_state = "cowboybvest"
	desc = "Stylish and has discrete lead plates inserted, just in case someone brings a laser to a fistfight."
	armor = list("melee" = 15, "bullet" = 10, "laser" = 10, "energy" = 5, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 0, "acid" = 0)


