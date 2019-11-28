protocol TPiece{
	/*
	Création d'une piece:
	init : String x String -> Piece
	Pre : String représente une forme existante (rond, triangle, 		cylindre, carré) sinon la creation échoue et String une couleur 	existante en unicode */
	init(forme : String, couleur : String )
	
	/* couleur : Piece -> String
	renvoi la couleur d'une piece
	Pre : string représente une couleur existante en unicode */
	var couleur : String {get}

	
	/* forme : Piece -> String
	renvoi la forme d'une piece 
	Post : renvoi une forme connue sous forme (rond, triangle, 			cylindre, carré) d'un string */
	var forme : String {get}
}



 
