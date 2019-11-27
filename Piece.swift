protocol TPiece{
	/* Type Piece est une juxtaposition de 2 propriétés: Couleur (Bool) et une forme(String)
	Création d'une piece:
	init : String x Bool -> Piece
	Pre : String représente une forme existante sinon la creation échoue */
	init(forme : String, couleur : Bool )

	/* forme : Piece -> String
	renvoi la forme d'une piece */
	var couleur : Bool {get}

	/* couleur : Piece -> Bool
	renvoi la couleur d'une piece */
	var forme : String {get}
}



 
