protocol TJoueur{
	/*CreerJoueur(String x Bool) -> Joueur
	Post : ne pas oublier d'initialiser le deck du joueur qui possèdera 		donc 8 Pieces en début de partie,
	Pre : la couleur représente une couleur existante en unicode */
	init(nom : String, couleur: String)

	/* pieces_dispo : Joueur -> [Piece]
	Renvoi les pieces disponibles dans le deck du joueur
	Post : renvoi un tableau contenant uniquement les cases non vide*/
	func pieces_dispo() -> [Piece]

	/* supprimer_piece : Joueur x Piece -> Joueur
	Pre : Choisir une pièce existante dans le deck du joueur  
	Post : la piece sera supprimée du deck du joueur donc cette piece sera 	remplacée par nil dans le deck */
	mutating func supprimer_piece(piece : Piece)

	/* afficher_deck : Joueur -> Joueur 
	Affiche le deck d'un joueur*/
	func afficher_deck()

	/* choisir_piece : Joueur -> Piece 
	choisi une piece dans le deck du joueur
	Pre : donner un entier qui représente une case où une pièce est 	dispo 	dans le deck (1≤Int≤8*/
	func choisir_piece(pos : Int) -> Piece
}

 

