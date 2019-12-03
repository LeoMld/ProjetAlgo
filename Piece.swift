protocol TPiece{
	/*
	Création d'une piece:
	init : String x String -> Piece
	Pre : String représente une forme existante (rond, triangle, losange, carré) écrite en unicode sinon la creation échoue et String une couleur existante en unicode (voir code unicoode en dessous)
 :*/
	init(forme : String, couleur : String )
	
	/* couleur : Piece -> String
	renvoi la couleur d'une piece
	Pre : string représente une couleur existante en unicode */
	var couleur : String {get}

	
	/* forme : Piece -> String
	renvoi la forme d'une piece 
	Post : renvoi une forme connue sous forme (rond, triangle, losange, carré) d'un string */
	var forme : String {get}
}

/*
	Code unicode: 
	cercle: 25CF 
	triangle : 25B2
	losange : 25C6
	carré : 25A0
	rouge : 31
	bleu : 34
	On affichera donc directement le code unicode ce qui sera très utile pour l'affichage du plateau par exemple  (voir main)
 */
