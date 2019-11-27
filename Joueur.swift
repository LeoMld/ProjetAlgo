protocol TJoueur{
	/*CreerJoueur(String x Bool) -> Joueur
	Post : ne pas oublier d'initialiser le deck du joueur qui possèdera donc 8 Pieces en début de partie */
	init(nom : String, couleur: Bool)

	/* pieces_dispo : Joueur -> [Case]
	Renvoi les pieces disponibles dans le deck du joueur
	Post : renvoi un tableau contenant uniquement les cases non vide*/
	func pieces_dispo() -> [Piece]

	/* supprimer_piece : Joueur x Piece -> Joueur
	Post : Choisir une pièce existante dans le deck du joueur  */
	func supprimer_piece(piece : Piece)

	/* afficher_deck : Joueur -> Joueur 
	Affiche le deck d'un joueur*/
	func afficher_deck()

	/* choisir_piece : Joueur -> Piece 
	choisi une pice dans le deck du joueur*/
	func choisir_piece() -> Piece
}

 

