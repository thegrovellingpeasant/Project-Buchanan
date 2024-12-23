/// A deck of unum cards. Classic.
/obj/item/toy/cards/deck/unum
	name = "\improper UNUM deck"
	desc = "A deck of unum cards. House rules to argue over not included."
	icon = 'icons/obj/toy.dmi'
	icon_state = "deck_unum_full"
	deckstyle = "unum"
	original_size = 108

/obj/item/toy/cards/deck/unum/update_icon_state()
	switch(cards.len)
		if(54 to INFINITY)
			icon_state = "deck_[deckstyle]_full"
		if(27 to 54)
			icon_state = "deck_[deckstyle]_half"
		if(1 to 27)
			icon_state = "deck_[deckstyle]_low"
		else
			icon_state = "deck_[deckstyle]_empty"

//Populate the deck.
/obj/item/toy/cards/deck/unum/populate_deck()
	for(var/colour in list("Red","Yellow","Green","Blue"))
		cards += "[colour] 0" //Uno, i mean, cough cough, Unum decks have only one colour of each 0, weird huh?
		for(var/k in 0 to 1) //two of each colour of number
			cards += "[colour] skip"
			cards += "[colour] reverse"
			cards += "[colour] draw 2"
			for(var/i in 1 to 9)
				cards += "[colour] [i]"
	for(var/k in 0 to 3) //4 wilds and draw 4s
		cards += "Wildcard"
		cards += "Draw 4"
