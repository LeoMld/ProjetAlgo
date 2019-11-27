/* Le but du jeu est d’être le premier joueur à poser la quatrième forme différente d’une ligne, d’une colonne ou d’une zone carrée.
Chacun leur tour les joueurs vont poser une de leurs pièces sur le plateau. Il est interdit de poser une forme dans une ligne, 
une colonne ou une zone sur laquelle cette même forme a déjà été posée par l’adversaire. 
On ne peut doubler une forme que si l’on a joué la précédente soi-même.
Le premier joueur qui pose la quatrième forme différente dans une ligne, 
une colonne ou une zone remporte immédiatement la partie, qu’importe à qui appartiennent les autres pièces de ce coup gagnant. */

/*-------------------------------Fonctions pour augmenter la lisibilité du code-----------------------------------*/
func demande_nom(num : String)->String {
	print("Joueur " + num + " veuillez taper votre nom : ")
	let input = readLine()
	guard var nom : String = input {
		return nom
	}
	else{
		print("Oops je ne peux pas accepter ce nom !")
		return demande_nom(x : x)
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

func choisirEntier(type : String) -> Int{
	print("Veuillez choisir une " + type + " : ")
	let input = readLine()
	guard var result : Int = input {
		//On verifie que l'entier est compris entre 1 et 4 car il n'y a que 4 lignes et 4 colones
		if (result >= 1) && (result <= 4){
			return result
		}
		else{
			print("Oops cet indice n'est pas valide...")
			return choisirEntier(type : type)
		}
	}
	else{
		print("Oops je ne peux pas accepter cela !")
		return choisirEntier(type : type)
	}
}
/*---------------------------------------------------------------------------------------------------------------*/

print("Vous venez de lancer le Quantik !\nPressez [ENTER] pour continuer")
let pass = readLine()//Pour n'afficher le reste que si le joueur reagit

//Definition et affectation des joueurs et du jeu
var nom1 : String = demande_nom(num : "1")
var nom2 : String = demande_nom(num : "2")

var joueur1 : Joueur = Joueur(nom : nom1, couleur : 31)
var joueur2 : Joueur = Joueur(nom : nom2, couleur : 34)

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

while (!jeu.partieFinie){
	//On passe au joueur suivant
	actif = changerActif(actif : actif, j1 : joueur1, j2 : joueur2)
	//Le joueur peut jouer
	if (jeu.peutJouer(actif)){
		//On affiche le plateau et le deck du joueur actif
		jeu.affichePlateau()
		actif.afficheDeck()
		//Le joueur actif doit choisir son emplacement et sa piece
		var piece = actif.choisirPiece()
		var x : Int = choisirEntier(type : "ligne")
		var y : Int = choisirEntier(type : "colone")
		//Si ce n'est pas possible de poser la piece sur l'emplacement alors le joueur doit recommencer la saisie
		while(!jeu.peutPoser(x : x, y : y, p : piece)){
			//On affiche le plateau et le deck du joueur actif
			jeu.affichePlateau()
			actif.afficheDeck()
			piece = actif.choisirPiece()
			x : Int = choisirEntier(type : "ligne")
			y : Int = choisirEntier(type : "colone")
		}
		//Le joueur actif pose sa piece, il faut donc la mettre sur le plateau et l'enlever de son deck
		jeu.posePiece(x : x, y : y, p : piece)
		jeu.affichePlateau()
	}
	//Le joueur ne peut pas jouer donc la partie est finie
	else{
		jeu.partieFinie = True
		actif = changerActif(actif : actif, j1 : joueur1, j2 : joueur2)
	}
}
//La partie est finie, on affiche le vainqueur
print("Bravo " + actif.nom + ", tu as gagné la partie !")