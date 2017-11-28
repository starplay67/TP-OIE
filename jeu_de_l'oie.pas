// Algorithme : Jeu_de_l'oie 

//But : Faire un jeu de l'oie fonctionnel en demandant à l'utilisateur le chiffre qu'il tire au dé

//Entrées : Tirage du dé
//Sortie : Place voire résultat de la partie.

//CONST :

	//Tetedemort <- 58 : entier
	//Casedépart <- 0 : entier
	//Fin <- 66 : entier

//VAR : 

	//Dé1, Dé2, sommedés, place : entier

//DEBUT : 

	//Initialisation de variables :
	//Dé1 <- 1
	//Dé2 <- 1
	//sommedés <- 2
	//place <- 0

	//TANT QUE (place<>fin) FAIRE 
		//ECRIRE "Choisissez votre premier lancé de dé"
		//LIRE Dé1
		//SI ((Dé1>=1)ET(Dé1<=6)) ALORS
			//ECRIRE "Choisissez votre deuxième lancé de dé"
			//LIRE Dé2
			//SI ((Dé2>=1)ET(Dé2<=6)) ALORS
				//sommedés <- Dé1+Dé2
				//place <- place+sommedés
				//SI (place=Tetedemort) ALORS
					//place <- 0
					//SINON
					//SI ((place MODULO 9 = 0)ET(place<>63)) ALORS
						//place <- place+9
						//SINON
						//SI (sommedés>(fin-place)) ALORS
							//place <- (fin-(place+sommedés-fin))
					//FINSI
				//FINSI
			//FINSI
		//FINSI
	//FINTANTQUE 

	//ECRIRE "Vous avez gagné !"

	//FIN


PROGRAM Jeu_de_l_oie;
USES crt;

//But : Faire un jeu de l'oie fonctionnel en demandant à l'utilisateur le chiffre qu'il tire au dé

//Entrées : Tirage du dé
//Sortie : Place voire résultat de la partie.

CONST

	Tetedemort=58;
	Casedepart=0;
	fin=66;

VAR 

	De1, De2, sommedes, place : integer;

BEGIN

	//Initialisation de variables :
	De1:=1;
	De2:=1;
	sommedes:=2;

	WHILE (place<>fin) DO
	BEGIN
		writeln('Choisissez votre premier lancer de de');
		readln(De1);
		IF ((De1>=1)AND(De1<=6)) THEN
		BEGIN
			writeln('Choisissez votre deuxieme lancer de de');
			readln(De2);
			IF ((De2>=1)AND(De2<=6)) THEN
			BEGIN
				sommedes:=(De1+De2);
				place:=(place+sommedes);

				IF (place=Tetedemort) THEN
				BEGIN
					place:=Casedepart;
					writeln('Pas de chance ! Vous etes tombe sur la case tete de mort ! Retour a la case depart !');
				END
				ELSE IF ((place MOD 9=0)AND(place<>63)) THEN
				BEGIN
					place:=place+9;
					writeln('Case oie ! Vous doublez votre lancer !');
				END
				ELSE IF (place>fin) THEN
							place:=(fin-(place+sommedes-fin));
			END;
		END;
	writeln('Vous etes actuellement a la case ',(place))
	END;
	
			
	writeln('Vous avez gagne !');
	readln;

END.
