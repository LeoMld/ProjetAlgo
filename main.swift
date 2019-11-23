/* Le but du jeu est d’être le premier joueur à poser la quatrième forme différente d’une ligne, d’une colonne ou d’une zone carrée.
Chacun leur tour les joueurs vont poser une de leurs pièces sur le plateau. Il est interdit de poser une forme dans une ligne, 
une colonne ou une zone sur laquelle cette même forme a déjà été posée par l’adversaire. 
On ne peut doubler une forme que si l’on a joué la précédente soi-même.
Le premier joueur qui pose la quatrième forme différente dans une ligne, 
une colonne ou une zone remporte immédiatement la partie, qu’importe à qui appartiennent les autres pièces de ce coup gagnant. */



//-------------------------------Fonctions pour augmenter la lisibilité du code-----------------------------------//
func demande_nom(x : Int)->String {
	print("Joueur " + String(x) +" veuillez taper votre nom : ")
	let input = readLine()
	guard var nom : String = input {
		return nom
	}
	else{
		print("Oops je ne peux pas accepter ce nom !")
		return demande_nom()
	}
}

func changerActif(actif : Joueur, j1 : Joueur, j2 : Joueur)->Joueur {
	if (actif == j1){
		return j2
	}
	else{
		return j1
	}
}
//---------------------------------------------------------------------------------------------------------------//

print("Vous venez de lancer le Quantik !\nPressez [ENTER] pour continuer")
let pass = readLine()//Pour n'afficher le reste que si le joueur reagit

//Definition et affectation des joueurs et du jeu
var nom1 : String = demande_nom(1)
var nom2 : String = demande_nom(2)

var joueur1 : Joueur = Joueur(nom:nom1, couleur:True)
var joueur2 : Joueur = Joueur(nom:nom2, couleur:False)

var jeu : Jeu = Jeu()

//On choisit un joueur au hasard
var actif : Joueur
if Bool.random(){
	actif = joueur1
}
else {
	actif = joueur2
}

//La partie commence
print("La partie peut commencer...")

while (!jeu.partieFinie{
	//On passe au joueur suivant
	actif = changerActif(actif : actif, j1 : joueur1, j2 : joueur2)
	//Le joueur peut jouer
	if (jeu.peutJouer(actif)){
		//On affiche le plateau et le deck du joueur actif
		jeu.afficheJeu()
		actif.afficheDeck()
		var piece : Piece
		var position : [Int](2)
		//Le joueur actif doit choisir son emplacement et sa piece
		piece = actif.choisirPiece()
		position = actif.choisirEmplacement()
		//Si ce n'est pas possible de poser la piece sur l'emplacement alors le joueur doit recommencer en choisissant un emplacement et une piece
		while(!jeu.peutPoser(pos : position, pie : piece)){
			//On affiche le plateau et le deck du joueur actif
			jeu.afficheJeu()
			actif.afficheDeck()
			piece = actif.choisirPiece()
			position = actif.choisirEmplacement()
		}
		//Le joueur actif pose sa piece, il faut donc la mettre sur le plateau et l'enlever de son deck
		jeu.posePiece(pos : position, pie: piece)
		jeu.afficheJeu()
	}
	//Le joueur ne peut pas jouer donc la partie est finie
	else{
		jeu.partieFinie = True
		actif = changerActif(actif : actif, j1 : joueur1, j2 : joueur2)
	}
}
//La partie est finie, on affiche le vainqueur
print("Bravo " + actif.nom + "tu as gagné la partie !")