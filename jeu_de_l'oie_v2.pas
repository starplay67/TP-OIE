PROGRAM Jeu_de_l_oie_v2;
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
		randomize;
		writeln('Appuyez sur Entree pour lancer votre premier de');
		readkey;
		De1:=random(6)+1;
		writeln('Premier de : ',De1);
		writeln('Appuyez sur Entree pour lancer votre deuxieme de');
		readkey;
		De2:=random(6)+1;
		writeln('Premier de : ',De2);
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
		writeln('Vous etes actuellement a la case ',(place));
	END;
	
			
	writeln('Vous avez gagne !');
	readln;

END.