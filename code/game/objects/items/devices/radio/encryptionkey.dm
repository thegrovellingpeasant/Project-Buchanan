/obj/item/encryptionkey
	name = "standard encryption key"
	desc = "An encryption key for a radio headset."
	icon = 'icons/obj/radio.dmi'
	icon_state = "cypherkey"
	w_class = WEIGHT_CLASS_TINY
	var/translate_binary = FALSE
	var/syndie = FALSE
	var/independent = FALSE
	var/list/channels = list()

/obj/item/encryptionkey/Initialize()
	. = ..()
	if(!channels.len)
		desc = "An encryption key for a radio headset.  Has no special codes in it. You should probably tell a coder!"

/obj/item/encryptionkey/examine(mob/user)
	. = ..()
	if(LAZYLEN(channels))
		var/list/examine_text_list = list()
		for(var/i in channels)
			examine_text_list += "[GLOB.channel_tokens[i]] - [lowertext(i)]"

		. += span_notice("It can access the following channels; [jointext(examine_text_list, ", ")].")

/obj/item/encryptionkey/syndicate
	name = "syndicate encryption key"
	icon_state = "syn_cypherkey"
	channels = list(RADIO_CHANNEL_SYNDICATE = 1)
	syndie = TRUE //Signifies that it de-crypts Syndicate transmissions

/obj/item/encryptionkey/binary
	name = "binary translator key"
	icon_state = "bin_cypherkey"
	translate_binary = TRUE

/obj/item/encryptionkey/headset_sec
	name = "security radio encryption key"
	icon_state = "sec_cypherkey"
	channels = list(RADIO_CHANNEL_SECURITY = 1)

/obj/item/encryptionkey/headset_eng
	name = "engineering radio encryption key"
	icon_state = "eng_cypherkey"
	channels = list(RADIO_CHANNEL_ENGINEERING = 1)

/obj/item/encryptionkey/headset_med
	name = "followers radio encryption key"
	icon_state = "med_cypherkey"
	channels = list(RADIO_CHANNEL_MEDICAL = 1, RADIO_CHANNEL_TOWN = 1)

/obj/item/encryptionkey/headset_wright_clinic
	name = "clinic radio encryption key"
	icon_state = "med_cypherkey"
	channels = list(RADIO_CHANNEL_MEDICAL = 1)

/obj/item/encryptionkey/headset_sci
	name = "science radio encryption key"
	icon_state = "sci_cypherkey"
	channels = list(RADIO_CHANNEL_SCIENCE = 1)

/obj/item/encryptionkey/headset_medsci
	name = "medical research radio encryption key"
	icon_state = "medsci_cypherkey"
	channels = list(RADIO_CHANNEL_SCIENCE = 1, RADIO_CHANNEL_MEDICAL = 1)

/obj/item/encryptionkey/headset_com
	name = "command radio encryption key"
	icon_state = "com_cypherkey"
	channels = list(RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/heads/captain
	name = "\proper the captain's encryption key"
	icon_state = "cap_cypherkey"
	channels = list(RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_ENGINEERING = 0, RADIO_CHANNEL_SCIENCE = 0, RADIO_CHANNEL_MEDICAL = 0, RADIO_CHANNEL_SUPPLY = 0, RADIO_CHANNEL_SERVICE = 0)

/obj/item/encryptionkey/heads/rd
	name = "\proper the research director's encryption key"
	icon_state = "rd_cypherkey"
	channels = list(RADIO_CHANNEL_SCIENCE = 1, RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/heads/hos
	name = "\proper the head of security's encryption key"
	icon_state = "hos_cypherkey"
	channels = list(RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/heads/ce
	name = "\proper the chief engineer's encryption key"
	icon_state = "ce_cypherkey"
	channels = list(RADIO_CHANNEL_ENGINEERING = 1, RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/heads/cmo
	name = "\proper the chief medical officer's encryption key"
	icon_state = "cmo_cypherkey"
	channels = list(RADIO_CHANNEL_MEDICAL = 1, RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/heads/hop
	name = "\proper the head of personnel's encryption key"
	icon_state = "hop_cypherkey"
	channels = list(RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/heads/qm
	name = "\proper the quartermaster's encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :u - supply, :c - command."
	icon_state = "hop_cypherkey"
	channels = list(RADIO_CHANNEL_SUPPLY = 1, RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/headset_cargo
	name = "supply radio encryption key"
	icon_state = "cargo_cypherkey"
	channels = list(RADIO_CHANNEL_SUPPLY = 1)

/obj/item/encryptionkey/headset_mining
	name = "mining radio encryption key"
	icon_state = "cargo_cypherkey"
	channels = list(RADIO_CHANNEL_SUPPLY = 1)

/obj/item/encryptionkey/headset_service
	name = "service radio encryption key"
	icon_state = "srv_cypherkey"
	channels = list(RADIO_CHANNEL_SERVICE = 1)

/obj/item/encryptionkey/headset_cent
	name = "\improper CentCom radio encryption key"
	icon_state = "cent_cypherkey"
	independent = TRUE
	channels = list(RADIO_CHANNEL_CENTCOM = 1)

/obj/item/encryptionkey/ai //ported from NT, this goes 'inside' the AI.
	channels = list(RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_ENGINEERING = 1, RADIO_CHANNEL_SCIENCE = 1, RADIO_CHANNEL_MEDICAL = 1, RADIO_CHANNEL_SUPPLY = 1, RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_AI_PRIVATE = 1)

/obj/item/encryptionkey/secbot
	channels = list(RADIO_CHANNEL_AI_PRIVATE = 1, RADIO_CHANNEL_SECURITY = 1)

//FALLOUT

/obj/item/encryptionkey/headset_vault
	name = "vault radio encryption key"
	desc = "An encryption key for a radio headset.  To access the vault channel, use :b."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_VAULT = 1)

/obj/item/encryptionkey/headset_vault_security
	name = "\proper the Security encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :b - vault, :s - security"
	icon_state = "sec_cypherkey"
	channels = list(RADIO_CHANNEL_VAULT = 1, RADIO_CHANNEL_SECURITY = 1)

/obj/item/encryptionkey/headset_overseer
	name = "\proper the Overseer's encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :b - vault, :c - command, :s - security, :e - engineering, :m - medical, :n - science."
	icon_state = "cap_cypherkey"
	channels = list(RADIO_CHANNEL_VAULT = 1, RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1)

/obj/item/encryptionkey/headset_vault_hos
	name = "\proper the Head of Security's encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :b - vault, :c - command, :s - security"
	icon_state = "hos_cypherkey"
	channels = list(RADIO_CHANNEL_VAULT = 1, RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1)

/obj/item/encryptionkey/headset_ncr
	name = "NCR radio encryption key"
	desc = "An encryption key for a radio headset.  To access the NCR channel, use :w."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_NCR = 1)

/obj/item/encryptionkey/headset_ranger
	name = "Ranger radio encryption key"
	desc = "An encryption key for a radio headset. To access the NCR channel, use :w. To access the Ranger channel, use :r."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_NCR = 1, RADIO_CHANNEL_RANGER = 1)

/obj/item/encryptionkey/headset_bos
	name = "Brotherhood radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Brotherhood channel, use :q."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_BOS = 1)

/obj/item/encryptionkey/headset_enclave
	name = "Enclave radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Enclave channel, use :z."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_ENCLAVE = 1)

/obj/item/encryptionkey/headset_town
	name = "Town radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Town channel, use :f."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_TOWN = 1)

/obj/item/encryptionkey/headset_den
	name = "Den radio encryption key"
	desc = "An encryption key for a radio headset. To access the Den channel, use :j."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_DEN = 1)

/obj/item/encryptionkey/headset_legion
	name = "Legion radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Legion channel, use :l."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_LEGION = 1)

/obj/item/encryptionkey/headset_cent
	name = "\improper CentCom radio encryption key"
	desc = "An encryption key for a radio headset.  To access the CentCom channel, use :y."
	icon_state = "cent_cypherkey"
	independent = TRUE
	channels = list(RADIO_CHANNEL_CENTCOM = 1)

/obj/item/encryptionkey/headset_khans
	name = "Khan radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Khan channel, use :a."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_KHANS = 1)

/obj/item/encryptionkey/headset_lds
	name = "Church radio encryption key"
	desc = "An encryption key for a radio headset.  To access the church channel, use :c."
	icon_state = "cmo_cypherkey"
	channels = list(RADIO_CHANNEL_LDS = 1, RADIO_CHANNEL_TOWN = 1)

/obj/item/encryptionkey/headset_usps
	name = "Post Office radio encryption key"
	desc = "An encryption key for a radio headset.  To access the postal channel, use :s."
	icon_state = "hop_cypherkey"
	channels = list(RADIO_CHANNEL_USPS= 1, RADIO_CHANNEL_TOWN = 1)

/obj/item/encryptionkey/headset_80s
	name = "80s radio encryption key"
	desc = "An encryption key for a radio headset.  To access the 80s channel, use :g."
	icon_state = "com_cypherkey"
	channels = list(RADIO_CHANNEL_EIGHTIES = 1)

/obj/item/encryptionkey/headset_80sb
	name = "blue team radio encryption key"
	desc = "An encryption key for a radio headset.  To access the blue team channel, use :b."
	icon_state = "hop_cypherkey"
	channels = list(RADIO_CHANNEL_EIGHTIES = 1, RADIO_CHANNEL_EIGHTIESB = 1)

/obj/item/encryptionkey/headset_80sr
	name = "80s radio encryption key"
	desc = "An encryption key for a radio headset.  To access the red team channel, use :r."
	icon_state = "hos_cypherkey"
	channels = list(RADIO_CHANNEL_EIGHTIES = 1, RADIO_CHANNEL_EIGHTIESR = 1)

/obj/item/encryptionkey/headset_80sc
	name = "80s command radio encryption key"
	desc = "An encryption key for a radio headset.  To access the 80s channel, use :g."
	icon_state = "rd_cypherkey"
	channels = list(RADIO_CHANNEL_EIGHTIES = 1, RADIO_CHANNEL_EIGHTIESR = 1, RADIO_CHANNEL_EIGHTIESB = 1)

/obj/item/encryptionkey/headset_wnd
	name = "Broadcasting radio encryption key"
	desc = "An encryption key for a radio headset.  To access the radio channel, use :t."
	icon_state = "rd_cypherkey"
	channels = list(RADIO_CHANNEL_WND = 1)

/obj/item/encryptionkey/headset_montegobay
	name = "Monteog Bay radio encryption key"
	desc = "An encryption key for a radio headset.  To access the staff channel, use :i."
	icon_state = "cargo_cypherkey"
	channels = list(RADIO_CHANNEL_MONTEGOBAY= 1, RADIO_CHANNEL_TOWN = 1)

/obj/item/encryptionkey/headset_wndranger
	name = "Police radio encryption key"
	desc = "An encryption key for a radio headset. To access the town channel, use :f. To access the Police channel, use :j."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_TOWN = 1, RADIO_CHANNEL_RANGER = 1)


/obj/item/encryptionkey/headset_salvatores
	name = "Salvatores radio encryption key"
	desc = "An encryption key for a radio headset. To access the Salvatore channel, use :s."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_SALVATORES = 1)

/obj/item/encryptionkey/headset_mordinos
	name = "Mordinos radio encryption key"
	desc = "An encryption key for a radio headset. To access the Mordino channel, use :m."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_MORDINOS = 1)

/obj/item/encryptionkey/headset_hotel
	name = "Hotel radio encryption key"
	desc = "An encryption key for a radio headset. To access the Hotel channel, use :h."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_HOTEL = 1)

/obj/item/encryptionkey/headset_bishops
	name = "Bishops radio encryption key"
	desc = "An encryption key for a radio headset. To access the Bishop channel, use :b."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_BISHOPS = 1)

/obj/item/encryptionkey/headset_wrights
	name = "Wrights radio encryption key"
	desc = "An encryption key for a radio headset. To access the Wright channel, use :w."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_WRIGHTS = 1)

/obj/item/encryptionkey/headset_wrights_elder
	name = "Wrights radio encryption key"
	desc = "An encryption key for a radio headset. To access the Wright channel, use :w."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_WRIGHTS = 1, RADIO_CHANNEL_SUPPLY = 1, RADIO_CHANNEL_MEDICAL = 1)

/obj/item/encryptionkey/headset_vangraffs
	name = "Van Graffs radio encryption key"
	desc = "An encryption key for a radio headset. To access the Van Graff channel, use :w."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_VANGRAFFS = 1)

/obj/item/encryptionkey/headset_nrpd
	name = "NRPD radio encryption key"
	desc = "An encryption key for a radio headset. To access the NRPD channel, use :w."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_NRPD = 1)

/obj/item/encryptionkey/headset_ncrcf
	name = "NCRCF radio encryption key"
	desc = "An encryption key for a radio headset. To access the NCR channel, use :n. To access the NCRCF channel, use :w."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_NCR = 1, RADIO_CHANNEL_NCRCF = 1)

/obj/item/encryptionkey/headset_government
	name = "Government radio encryption key"
	desc = "An encryption key for a radio headset. To access the Government channel, use :w."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_GOVERNMENT = 1)


/obj/item/encryptionkey/ai //ported from NT, this goes 'inside' the AI.
	channels = list(RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_ENGINEERING = 1, RADIO_CHANNEL_SCIENCE = 1, RADIO_CHANNEL_MEDICAL = 1, RADIO_CHANNEL_SUPPLY = 1, RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_AI_PRIVATE = 1)

/obj/item/encryptionkey/secbot
	channels = list(RADIO_CHANNEL_AI_PRIVATE = 1, RADIO_CHANNEL_SECURITY = 1)
