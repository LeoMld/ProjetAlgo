/*Une case peut etre vide ou occupée par une piece*/
typealias Case = Piece?

/* POUR INFORMATION SI BESOIN :
	Code unicode: 
	cercle: 25CF 
	triangle : 25B2
	losange : 25C6
	carré : 25A0
	rouge : 31
	bleu : 34
	On pourrait afficher directement le code unicode ce qui sera très utile pour l'affichage du plateau par exemple  (voir main)
 */

enum Forme {
    case cercle
    case triangle
    case losange
    case carre
}

enum Couleur {
    case rouge
    case bleu
}

protocol TPiece{
	/*
	Création d'une piece:
	init : Forme x Couleur -> Piece
	Pre : forme et couleurs qui sont des cas des enum Forme Couleur*/
	init(forme : Forme, couleur : Couleur )
	
	/* couleur : Piece -> Couleur
	renvoi la couleur d'une piece
	Pre : string représente une couleur existante en unicode */
	func getCouleur() -> Couleur

	
	/* forme : Piece -> Forme
	renvoi la forme d'une piece 
	Post : renvoi une forme connue sous forme (rond, triangle, losange, carré) */
	func getForme() -> Forme
}

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

protocol TJeu{
	/* CreerJeu: Joueur x Joueur -> Jeu 
	Création d'un jeu 
	Post : créé le plateau contenant 4x4 cases qui seront donc toutes vides, indique que la partie n'est pas finie (var partieFinie)
			definit aleatoirement un joueur courant pour pouvoir commencer la partie (var joueurCourant) */
	init(j1 : Joueur, j2 : Joueur)


	/*
	Fonctions qui vont indiquer si il y a 4 formes différentes dans une ligne/colonne/zone donnée 
	Pre : donner une ligne et une colone connue (comprisent entre 1 et 	4)
	Post : Fonctions qui vont renvoyer true si il y a bien 4 formes 	différente dans une ligne/colonne/zone false sinon*/
	/* ligne_complete : Jeu x Int -> Bool 
	Pre : Int représente la ligne du plateau*/

	func ligne_complete(ligne : Int) -> Bool
	/* colonne_complete : Jeu x Int -> Bool 
	Pre : Int représente la colonne du plateau*/
	func colonne_complete(col : Int) -> Bool
	/* zone_complete : Jeu x Int x Int -> Bool 
	Pre : Int x Int reprérentent la ligne/colonne du plateau*/
	func zone_complete(ligne : Int, col : Int) -> Bool


	/* Fonctions qui vont envoyer false si la ligne/colonne/zone 		contient une pièce de même forme ET de couleur différente que la 	pièce courante 
	Pre : donner une ligne et une colone connue (comprisent entre 1 et 	4)
	Post : renvoi true si la piece passée en paramètre est contenue sur le plateau dans la 	ligne/colonne/zone indiquée, false sinon */
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

	// getCase : Jeu x Int x Int -> Case
	// retourne une case du plateau
	// Pre : Int x Int représente la ligne / colonne du plateau et Piece represente la piece que l'on souhaite poser
	func getCase(ligne : Int, col : Int) -> Case

	/* peutJouer : Jeu x Joueur -> Bool
	indique si le joueur peut jouer 
	Post : envoi true si un joueur peut jouer ou bien false si il ne peut plus poser de piece, en effet si le joueur est bloqué (aucune 	de ses pièces ne peut être poser sur le plateau et il n'a pas gagné )*/
	func peutJouer(j : Joueur) -> Bool

	/* posePiece : Jeu x Int x Int x Piece -> Jeu 
	Pose une piece sur le plateau du jeu
	Pre : Int x Int représente la position (ligne/colonne) du jeu, la case à cette position doit être vide.*/
	mutating func posePiece(ligne : Int, col : Int, piece : Piece)

	/* case_vide : Jeu x Int x Int -> Bool
	indique si la case du plateau est vide
	Pre : Int x Int représente la ligne et la colonne du jeu 
	Post : renvoi true si la du jeu est vide false sinon*/
	func case_vide(ligne : Int, col : Int) -> Bool

	/* changerJoueurCourant : Jeu x Joueur -> Joueur
	Change le joueur courant
	Pre : Le joueur courant est soit le joueur1 soit le joueur2 
	Post : Si le joueur courant est joueur1 on renvoie joueur2 et inversement*/
	mutating func changerJoueurCourant() -> Joueur

	/* changerJoueurCourant : Jeu x Joueur -> Joueur
	Change le joueur courant
	Pre : Le joueur courant est soit le joueur1 soit le joueur2 
	Post : Si le joueur courant est joueur1 on renvoie joueur2 et inversement*/
	func getJoueurCourant() -> Joueur

	/*partieFinie : Jeu -> Bool
	Indique si la partie est finie
	Pre : On verifie que le joueur peut poser une piece et qu'aucune ligne/colone/zone n'est complete
	Post : renvoi true si la partie est finie false sinon*/
	mutating func isPartieFinie() -> Bool
}