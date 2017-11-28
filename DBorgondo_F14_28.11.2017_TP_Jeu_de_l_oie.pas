{ALGORITHME Jeu de l oie

CONST
	case_retour<-58:entier;
	oie_inactive<-63: entier;
	case_max<-66 : entier;
	mind<-1 : entier;
	maxd<-6 : entier;



VAR
	De1,De2,position,somme: entier;
	lancer,stop: caractere;


DEBUT
	de1<-0;
	de2<-0;
	position<-0;
	somme<-0;
	lancer<-'';
	somme<-'';
	ECRIRE("Bienvenue dans le jeu de l oie");
	REPETER
		REPETER
			ECRIRE("Appuyez sur entrer pour lancer le premier de");
			REPETER 
				LIRE(lancer);
			JUSQU'A lancer=(ENTRER);
			REPETER
				de1:=ALEATOIRE(maxd)+1 
			JUSQU'A (de1<=maxd) ET (de1>=mind);
			ECRIRE("Vous avez fait :",de1,"!");
			ECRIRE("Appuyez sur entrer pour lancer le deuxieme de");
			REPETER 
				LIRE(lancer);
			JUSQU'A lancer=(ENTRER);
			REPETER 
				de2<-ALEATOIRE(maxd)+1 
			JUSQU'A ((de2<=maxd) ET (de2>=mind)); //On utilise un TANT QUE pour verifier que le de2 est bien entre 1 et 6
			ECRIRE("Vous avez fait :",de2,"!");
			somme<-de1+de2;
		JUSQU'A ((somme>=mind*2) ET (somme<=maxd*2));
		ECRIRE("Vous avancez donc de ",somme," cases.");	
		SI ((position+somme)>case_max) ALORS //On test si le joueur à dépassé l"arrivée
			write("Vous avez avance de ",(position+somme-case_max));
			position<-(2*case_max)-(position+somme);
			ECRIRE(" de trop, vous reculez donc sur la ",position,"eme case.");
		SINON
			position<-position+somme;
			ECRIRE("Cela vous amene sur la ",position,"eme case.");
		FINSI
		TANTQUE (((position MOD 9)=0) ET (position<>oie_inactive)) FAIRE //On test si le joueur est sur une case oie.
			position<-position+somme;
			ECRIRE("Vous ête tomber sur une case oie, vous avancez donc à nouveau de ",somme," cases, cela vous amene sur la ",position,"eme case.");
		FINTANTQUE;
		SI position=case_retour ALORS //On test si le joueur est sur la case de retour
			ECRIRE("Vous êtes tomber sur la case de retour, vous retournez donc à la case départ");
			position<-0;
		FINSI;
	JUSQU'A (position=case_max);
	ECRIRE("Vous êtes arrive sur la case case_max vous avez gagne, bravo !")
FIN}

PROGRAM jeu_de_l_oie;

USES crt;

CONST
	case_retour=58;
	oie_inactive=63;
	case_max=66;
	mind=1;
	maxd=6;
VAR
	De1,De2,position,somme: integer;
	lancer: char;


BEGIN
	de1:=0;
	de2:=0;
	position:=0;
	somme:=0;
	lancer:=' ';
	clrscr;
	randomize;
	writeln('Bienvenue dans le jeu de l oie');
	repeat
		BEGIN
			repeat
				BEGIN
					writeln('Appuyez sur entrer pour lancer le premier de');
					repeat lancer:=readkey until lancer=#13;//On attend que l'utilisateur appuie sur entrée
					repeat de1:=random(maxd)+1 until (de1<=maxd) and (de1>=mind); //On utilise un repeat pour verifier que le de1 est bien entre 1 et 6
					writeln('Vous avez fait :',de1,'!');
					writeln('Appuyez sur entrer pour lancer le deuxieme de');
					repeat lancer:=readkey until lancer=#13;
					repeat de2:=random(maxd)+1 until (de2<=maxd) and (de2>=mind); //On utilise un repeat pour verifier que le de2 est bien entre 1 et 6
					writeln('Vous avez fait :',de2,'!');
					somme:=de1+de2;
				END;
			until ((somme>=mind*2) and (somme<=maxd*2));//On vérifie la somme
			writeln('Vous avancez donc de ',somme,' cases.');	
			IF ((position+somme)>case_max) then //On test si le joueur à dépassé l'arrivée
			BEGIN
				write('Vous avez avance de ',(position+somme-case_max));
				position:=(2*case_max)-(position+somme);
				writeln(' de trop, vous reculez donc sur la ',position,'eme case.');
			END
			else
				BEGIN
					position:=position+somme;
					writeln('Cela vous amene sur la ',position,'eme case.');
				END;
			while (((position MOD 9)=0) and (position<>oie_inactive)) do //On test si le joueur est sur une case oie.
				BEGIN
					position:=position+somme;
					writeln('Vous ête tombe sur une case oie, vous avancez donc à nouveau de ',somme,' cases, cela vous amene sur la ',position,'eme case.');
				END;
			IF position=case_retour then //On test si le joueur est sur la case de retour
				BEGIN
					writeln('Vous êtes tombe sur la case de retour, vous retournez donc à la case départ');
					position:=0;
				END;
		END;
	until (position=case_max);//On s'arrete quand l'utilisateur atteint la derniére case
	writeln('Vous êtes arrive sur la case case_max vous avez gagne, bravo !');
	readln();


END.
