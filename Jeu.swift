protocol TJeu{
	init()
	func ligne_complete(ligne : Int) -> Bool
	func colonne_complete(col : Int) -> Bool
	func zone_complete(ligne : Int, col : Int) -> Bool
	func ligne_contient(ligne : Int, piece : Piece) -> Bool
	func colonne_contient(col : Int, piece : Piece) -> Bool
	func zone_contient(ligne : Int, col : Int, piece : Piece) -> Bool
	func peut_poser(ligne : Int, col : Int, piece : Piece) -> Bool
	func peut_jouer(j : Joueur) -> Bool
	func pose_piece(ligne : Int, col : Int, piece : Piece)
	func case_vide(ligne : Int, col : Int) -> Bool
	func afficher_jeu()
	var partieFinie : Bool {get}
	var plateau : [[Case]] {get}
}

/* CreerJeu: -> Jeu 
Création d'un jeu */
init(){}

/* Fonctions qui vont renvoyer true si il y a bien 4 formes différente dans une ligne/colonne/zone
Pre : donner une ligne et une colone connue */
/* ligne_complete : Jeu x Int -> Bool */
func ligne_complete(ligne : Int) -> Bool{}

/* colonne_complete : Jeu x Int -> Bool */
func colonne_complete(col : Int) -> Bool{}

/* zone_complete : Jeu x Int x Int -> Bool */
func zone_complete(ligne : Int, col : Int) -> Bool{}

/* Fonctions qui vont envoyer false si la ligne/colonne/zone contient une pièce de même forme et de couleur différente que la pièce courante 
Pre : donner une ligne et une colone connue*/
/* ligne_contient : Jeu x Int x Piece -> Bool */
func ligne_contient(ligne : Int, piece : Piece) -> Bool{}

/* colonne_contient : Jeu x Int x Piece -> Bool */
func colonne_contient(col : Int, piece : Piece) -> Bool{}

/* zone_contient : Jeu x Int x Piece -> Bool */
func zone_contient(ligne : Int, col : Int, piece : Piece) -> Bool{}

/* peut_poser : Jeu x Int x Int x Piece -> Bool
envoi true si le joueur peut poser une pièce a une position */
func peut_poser(ligne : Int, col : Int, piece : Piece) -> Bool{}

/* peut_jouer : Jeu x Joueur -> Bool 
envoi true si un joueur peut jouer ou bien false si il ne peut plus poser de piece*/
func peut_jouer(j : Joueur) -> Bool{}

/* pose_piece : Jeu x Int x Int x Piece -> Jeu 
Pose une piece sur le jeu
Pre : La case à cette position doit être vide
Post : on vérifie si le joueur a gagné*/
func pose_piece(ligne : Int, col : Int, piece : Piece){}

/* case_vide : Jeu x Int x Int -> Bool
renvoi true si une case du jeu est vide*/
func case_vide(ligne : Int, col : Int) -> Bool{}

/* afficher_jeu : Jeu 
affiche le jeu */
func afficher_jeu(){}

/*partieFinie : Jeu -> Bool
renvoi true si la partie est finie  */
var partieFinie : Bool{return self.partieFinie}

/* plateau : Jeu -> [[Case]] 
renvoi le plateau du jeu*/
var plateau : [[Case]]{return self.plateau}


