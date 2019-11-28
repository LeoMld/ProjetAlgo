/* Le but du jeu est d’être le premier joueur à poser la quatrième forme différente d’une ligne, d’une colonne ou d’une zone carrée.
Chacun leur tour les joueurs vont poser une de leurs pièces sur le plateau. Il est interdit de poser une forme dans une ligne, 
une colonne ou une zone sur laquelle cette même forme a déjà été posée par l’adversaire. 
On ne peut doubler une forme que si l’on a joué la précédente soi-même.
Le premier joueur qui pose la quatrième forme différente dans une ligne, 
une colonne ou une zone remporte immédiatement la partie, qu’importe à qui appartiennent les autres pièces de ce coup gagnant. */

/*-------------------------------Fonctions pour augmenter la lisibilité du code-----------------------------------*/
func demandeNom(num : String)->String {
	print("Joueur " + num + " veuillez taper votre nom : ")
	let input = readLine()
	if let nom : String = input {
		return nom
	}
	else{
		print("Oops je ne peux pas accepter ce nom !")
		return demande_nom(num : num)
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

func choisirEntier(type : String, inf : Int, sup : Int) -> Int{
	print("Veuillez choisir une " + type + " : ")
	let input = readLine()
	if let result : Int = input {
		//On verifie que l'entier est compris entre 1 et 4 car il n'y a que 4 lignes et 4 colones
		if (result >= inf) && (result <= sup){
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

func affichePlateau(jeu : Jeu){
	//Fonction qui affiche le plateau
}

func afficheDeck(deck : [Piece]){
	//Fonction qui affiche les pieces dispo
	var numbers : String = ""
	var pieces : String = ""
	var i : Int
	for i in 0..< deck.count{
		numbers = numbers + String(i+1) + "\t"
		pieces = pieces + "\u{1B}[" + deck[i].couleur +"m\u{" + deck[i].forme +"}\u{1B}[0m\t"
	}
	print(numbers)
	print(pieces)
}
/*---------------------------------------------------------------------------------------------------------------*/

print("Vous venez de lancer le Quantik !\nPressez [ENTER] pour continuer")
let pass = readLine()//Pour n'afficher le reste que si le joueur reagit

//Definition et affectation des joueurs et du jeu
var nom1 : String = demandeNom(num : "1")
var nom2 : String = demandeNom(num : "2")

var joueur1 : Joueur = Joueur(nom : nom1, couleur : "31")//31 est le code unicode pour rouge
var joueur2 : Joueur = Joueur(nom : nom2, couleur : "34")//34 est le code unicode pour bleu

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
		print(actif.nom + " c'est à toi de jouer !")
		//On affiche le plateau et le deck du joueur actif
		affichePlateau()
		actif.afficheDeck(actif.piecesDispo())
		//Le joueur actif doit choisir son emplacement et sa piece
		var pos : Int = choisirEntier(type : "position de choix de piece dans le deck ", inf : 1, sup : actif.nbrePieceDispo())
		var piece = actif.choisirPiece(pos : pos)
		var x : Int = choisirEntier(type : "ligne", inf : 1, sup : 4)
		var y : Int = choisirEntier(type : "colone", inf : 1, sup : 4,)
		//Si ce n'est pas possible de poser la piece sur l'emplacement alors le joueur doit recommencer la saisie
		while(!jeu.peutPoser(ligne : x, col : y, p : piece)){
			//On affiche le plateau et le deck du joueur actif
			affichePlateau(jeu : jeu)
			actif.afficheDeck(actif.piecesDispo())
			pos = choisirEntier(type : "position de choix de piece dans le deck ", inf : 1, sup : actif.nbrePieceDispo())
			piece = actif.choisirPiece(pos : pos)
			x = choisirEntier(type : "ligne", inf : 1, sup : 4)
			y = choisirEntier(type : "colone", inf : 1, sup : 4)
		}
		//Le joueur actif pose sa piece, il faut donc la mettre sur le plateau et l'enlever de son deck
		jeu.posePiece(ligne : x, col : y, piece : piece)
		actif.supprimePiece(piece : piece)
		affichePlateau()
	}
	//Le joueur ne peut pas jouer donc la partie est finie
	else{
		jeu.partieFinie = true
		actif = changerActif(actif : actif, j1 : joueur1, j2 : joueur2)
	}
}
//La partie est finie, on affiche le vainqueur
print("Bravo " + actif.nom + ", tu as gagné la partie !")