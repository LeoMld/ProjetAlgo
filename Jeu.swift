protocol TJeu{
	/* CreerJeu: -> Jeu 
	Création d'un jeu 
	Post : créé le plateau contenant des case qui seroont donc toutes 	vides*/
	init()

	/*
	Fonctions qui vont indiuer si il y a 4 formes différentes dans une 	ligne/colonne/zone donnée 
	Pre : donner une ligne et une colone connue (compisent entre 1 et 	4)
	Post : Fonctions qui vont renvoyer true si il y a bien 4 formes 	différente dans une ligne/colonne/zone*/
	/* ligne_complete : Jeu x Int -> Bool */
	func ligne_complete(ligne : Int) -> Bool
	/* colonne_complete : Jeu x Int -> Bool */
	func colonne_complete(col : Int) -> Bool
	/* zone_complete : Jeu x Int x Int -> Bool */
	func zone_complete(ligne : Int, col : Int) -> Bool


	/* Fonctions qui vont envoyer false si la ligne/colonne/zone 		contient une pièce de même forme et de couleur différente que la 	pièce courante 
	Pre : donner une ligne et une colone connue (comprisent entre 1 et 	4)
	Post : renvoi true si la piece est contenu sur le plateau dans la 	ligne/colonne/zone indiquée, false sinon */
	/* ligne_contient : Jeu x Int x Piece -> Bool 
	Pre : Int représente la ligne du plateau où l'on veut chercher */
	func ligne_contient(ligne : Int, piece : Piece) -> Bool
	/* colonne_contient : Jeu x Int x Piece -> Bool 
	Pre : Int représente la colonne du plateau où l'on veut chercher*/
	func colonne_contient(col : Int, piece : Piece) -> Bool
	/* zone_contient : Jeu x Int x Int x Piece -> Bool 
	Pre : Int x Int représente la ligne x colonne du plateau où l'on 	veut chercher*/
	func zone_contient(ligne : Int, col : Int, piece : Piece) -> Bool

	/* peutPoser : Jeu x Int x Int x Piece -> Bool
	indique si un joueur peut poser une piece a une position
	Pre : Int x Int représente la ligne / colonne du plateau et Piece 	une case du deck contenant une pièce donc une case différente de 	nil
	Post : envoi true si le joueur peut poser une pièce a une position 
	 */
	func peutPoser(ligne : Int, col : Int, piece : Piece) -> Bool

	/* peutJouer : Jeu x Joueur -> Bool
	indique si le joueur peut jouer 
	Post : envoi true si un joueur peut jouer ou bien false si il ne 	peut plus poser de piece, en effet si le joueur est bloqué (aucune 	de ses pièces ne peut être poser sur le plateau et il n'a pas 		gagné */
	func peutJouer(j : Joueur) -> Bool

	/* pose_piece : Jeu x Int x Int x Piece -> Jeu 
	Pose une piece sur le plateau du jeu
	Pre : Int x Int représente la position (ligne/colonne) du jeu, la 	case à cette position doit être vide. actif représente le joueur 	actif à ce tour de jeu. Piece représente une case du deck 			contenant une pièce donc une case différente de nil
	Post : on vérifie si le joueur a gagné (ligne/colonne/zone est 		complète) et on retire la pièce du deck du joueur actif*/
	mutating func posePiece(ligne : Int, col : Int, piece : Piece, actif : Joueur)

	/* case_vide : Jeu x Int x Int -> Bool
	indique si la case du plateau est vide
	Pre : Int x Int représente la ligne et la colonne du jeu 
	Post : renvoi true si la du jeu est vide false sinon*/
	func case_vide(ligne : Int, col : Int) -> Bool

	/*partieFinie : Jeu -> Bool
	Indique si la partie est finie
	Post : renvoi true si la partie est finie false sinon*/
	var partieFinie : Bool {get set}

	/* plateau : Jeu -> [[Case]] 
	renvoi le plateau du jeu*/ 
	var plateau : [[Case]] {get}
}



