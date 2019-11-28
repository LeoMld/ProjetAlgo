protocol TJoueur{
	/*CreerJoueur(String x Bool) -> Joueur
	Post : ne pas oublier d'initialiser le deck du joueur qui 			possèdera donc 8 Pieces placée dans des cases en début de partie,
	Pre : la couleur représente une couleur existante en unicode */
	init(nom : String, couleur: String)

	/* piecesDispo : Joueur -> [Piece]
	Renvoi les pieces disponibles dans le deck du joueur
	Post : renvoi un tableau contenant uniquement les cases non vide*/
	func piecesDispo() -> [Piece]

	// nbrePieceDispo : Joueur -> Int
	// Renvoi le nombre de piece dispo du joueur
	// Post :  renvoi le nbre de cases non vide du deck
	func nbrePieceDispo() -> Int

	/* supprimePiece : Joueur x Piece -> Joueur
	Pre : Choisir une pièce existante dans le deck du joueur  
	Post : la piece sera supprimée du deck du joueur donc cette piece 	sera remplacée par nil dans le deck */
	mutating func supprimePiece(piece : Piece)

	/* deck : Jeu -> [Case]]
	renvoi le deck du joueur
	Post : Le deck contiendra 8 cases*/
	var deck : [Case] {get set}

	/* choisirPiece : Joueur x Int -> Piece 
	choisi une piece dans le deck du joueur
	Pre : Int représente un entier qui l'indice de la piece dans le deck la case choisi ne devra PAS etre vide (1≤Int≤8)*/
	func choisirPiece(pos : Int) -> Piece
}

 

