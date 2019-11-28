protocol TCase {
	/*creer_case : -> Case
	creer une case */
	init()
	
	/* contenu_case : Case -> Piece?
	renvoi le contenu d'une case 
	Post : La case ne peut contenir que soit une piece soit vide*/
	var contenu_case : Piece? {get set}
}

