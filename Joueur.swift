protocol TJoueur{
	/*CreerJoueur String x Couleur -> Joueur
	Pre : la couleur représente une couleur
	Post : ne pas oublier d'initialiser le deck du joueur qui possèdera donc 8 Pieces placée dans des cases en début de partie,
	ATTENTION, la couleur n'est pas un paramètre de Joueur il servira juste a créer le deck de ce joueur avec la bonne couleur de piece  */
	init(nom : String, couleur : Couleur)

	/* piecesDispo : Joueur -> [Piece]
	Renvoi les pieces disponibles dans le deck du joueur
	Post : renvoi un tableau contenant uniquement les pieces qu'il lui reste*/
	func piecesDispo() -> [Piece]

	// nbrePieceDispo : Joueur -> Int
	// Renvoi le nombre de piece dispo du joueur
	// Post :  renvoi le nombre de pieces qu'il lui reste
	func nbrePieceDispo() -> Int

	/* supprimePiece : Joueur x Piece -> Joueur
	Pre : Choisir une pièce existante dans le deck du joueur
	Post : la piece sera supprimée du deck du joueur donc cette piece sera remplacée par vide dans le deck */
	mutating func supprimePiece(piece : Piece)

	/* nom : Joueur -> String
	renvoi le nom du joueur*/
	func getNom() -> String

}

 

