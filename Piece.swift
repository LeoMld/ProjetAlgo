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
