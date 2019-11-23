protocol TCase {
	init()
	var contenu_case : Piece? {get}
}

/*creer_case : -> Case
creer une case */
init(){}

/* contenu_case : Case -> Piece?
renvoi le contenu d'une case */
var contenu_case : Piece?{return self.contenu_case}