protocol TPiece{
	/* Type Piece est une juxtaposition de 2 propriétés: Couleur (Bool) et une forme(String)
	Création d'une piece:
	init : String x Bool -> Piece
	Pre : String représente une forme existante (rond, triangle, cylindre, 	carré) sinon la creation échoue */
	init(forme : String, couleur : Bool )
	
	/* couleur : Piece -> Bool
	renvoi la couleur d'une piece */
	var couleur : Bool {get}

	
	/* forme : Piece -> String
	renvoi la forme d'une piece 
	Post : renvoi une forme connue sous forme d'un string */
	var forme : String {get}
}



 
