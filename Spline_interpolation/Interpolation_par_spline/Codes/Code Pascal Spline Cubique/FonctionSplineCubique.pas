program projetMaths;		// Modifié en Decembre 2016

uses crt, dos, sysutils {New}, math {New};

CONST 
    NBRVALEURMAX= 50; Enter=#13; Del=8; Divi=47; Soustra=45; Dot=46;
    PRECISION = 6;

type
	tableauDeQuatreColonnes= array[1..NBRVALEURMAX,1..4]  of Real;
	tableauDeTroisColonnes = array[1..NBRVALEURMAX-1,1..3] of extended ;
	tableauNN= array[1..NBRVALEURMAX,1..NBRVALEURMAX] of extended ;
	tableauUneColonne=array[1..NBRVALEURMAX] of extended;
var 
	donneesAuPoint : tableauDeQuatreColonnes ; 
	donneesEntreDeuxPoints : tableauDeTroisColonnes ; 
	nombrePoint : integer ; 
	matriceA,matriceAR: tableauNN; 
	matriceG,matriceGR : tableauUneColonne; 
	choix : string;
	
	
procedure sauvegarde(donneesAuPoint : tableauDeQuatreColonnes; nombrePoint : integer; donneesEntreDeuxPoints : tableauDeTroisColonnes); { permet de sauvegarder une partie dans un fichier .txt qui sera situer dans le même répertoire que le fichier executable}
	var fichierText : text; nomDuFichier, choix: string; i : integer ;
begin
	repeat
		writeln('Sous quel nom voulez vous enregistrer votre partie?');
		readln(nomDuFichier);
		nomDuFichier:='./Résultats/'+nomDuFichier+ '.txt';
		if fileExists(nomDuFichier) then
			begin
			writeln('Le nom est deja pris. Que voulez vous faire? ');
			writeln(' 1 : Remplacer le fichier deja existant.');
			writeln(' 2 : Choisir un autre nom.');
			writeln(' 3 : Quitter le menu de sauvegarde.');
			readln(choix);
			if choix='1' then
				begin
				assign(fichierText,nomDuFichier);
				erase(fichierText);
				end;
			if choix='3' then
				exit;
			end;
	until not(fileExists(nomDuFichier));
	assign(fichierText, nomDuFichier);
	rewrite(fichierText);
	
	writeln(fichierText, 'Les points que vous avez entrez sont :'); {New}
		for i:=1 to (nombrePoint) do {New}
			writeln(fichierText, 'P_', i-1, '= (', donneesAuPoint[i,1], ', ', donneesAuPoint[i,2], ')'); {New}
			
		writeln(fichierText); {New}
	for i:=1 to (nombrePoint-1) do
		begin
		writeln(fichierText, 'La fonction spline cubique reliant le point ',i,' au point ',i+1,' est : ');
		write(fichierText,'S',i,'(X)= ',donneesAuPoint[i,4]/(6*donneesEntreDeuxPoints[i,1]),'*(',donneesAuPoint[i+1,1],'-X)^3 + ',donneesAuPoint[i+1,4]/(6*donneesEntreDeuxPoints[i,1]),'*(X-',donneesAuPoint[i,1],')^3 + ',donneesEntreDeuxPoints[i,2],'*(',donneesAuPoint[i+1,1],'-X) + ',donneesEntreDeuxPoints[i,3],'*(X-',donneesAuPoint[i,1],')');
		writeln(fichierText,' ');	
		end;
		writeln(fichierText); {New}
		writeln(fichierText, 'Pour afficher ces fonctions splines sur un intervalle plus approprié dans Geogebra :'); {New}
		for i:=1 to (nombrePoint-1) do {New}
		writeln(fichierText, 'fonction[S', i, '(x),', donneesAuPoint[i,1], ',', donneesAuPoint[i+1,1], ']'); {New}
		
	close(fichierText);
	writeln('Informations sauvegardees');
end;





procedure initialisation(var donneesAuPoint: tableauDeQuatreColonnes ; var matriceA:tableauNN);
	var i,j : integer; 
begin
	for j:=1 to 4 do 
		for i :=1 to NBRVALEURMAX do
			donneesAuPoint[i,j]:=0;

	for i:=1 to NBRVALEURMAX do
		for j:=1 to NBRVALEURMAX do
			matriceA[i,j]:=0;
end;


Procedure entrerLesValeurs(Var donneesAuPoint : tableauDeQuatreColonnes; Var nombrePoint : integer);
Var i : Integer ; Coord, Coord2, DecimInt : Integer; ch : Char; CoordDivi, Decim : Real; Sous : Boolean;
	count, j, nbZero : integer; valeur : array [1..200] of char; zero : boolean; {New}

Begin
zero:=true; {New}
count:=0; {New}
nbZero:=0; {New}
	repeat
		writeln('Combien de point voulez vous entrer ? (2<x<',NBRVALEURMAX+1, ')');
        readln(nombrePoint);
	Until (IoResult=0) and (nombrePoint>2) and (nombrePoint<NBRVALEURMAX) ;

	repeat 
        Write('Entrez les coordonnees du point 1 : (');
		
		Sous:=False;
        Coord:=0;
        Decim:=0;
        DecimInt:=0;
        Repeat
            Coord2:=0;
            Repeat
            Until Keypressed;
            ch:=readkey;
            If not ((ch=char(Enter)) or (ch=char(Del)) or (ch=char(Divi)) or (ch=char(Soustra)) Or (ch=Char(Dot))) then
                Coord:=Coord*10+ord(ch)-48;
            If ch=char(Del) then
                Coord:=Coord div 10;
            If ch=char(Divi) then
                Repeat
                    Repeat
                    Until Keypressed;
                    ch:=readkey;
                    If not ((ch=char(Enter)) or (ch=char(Del)) or (ch=char(Divi))) then
                        Coord2:=Coord2*10+ord(ch)-48;
                    If ch=char(Del) then
                        Coord2:=Coord2 div 10;
                Until ch=char(Enter);
             If ch=char(Soustra) then
				Sous:=True;
			 If ch=Char(Dot) then
				Repeat
					Repeat
					Until Keypressed;
					ch:=readkey;
					If not ((ch=char(Enter)) or (ch=char(Del)) or (ch=char(Divi))) then
						Begin
						count:=count+1; {New}
						valeur[count]:=ch; {New}
							for j:=1 to count do {New}
								begin {New}
									if  valeur[j] <> '0' then {New}
										zero:=false; {New}
								end; {New}
							if (zero = true) then {New}
								nbZero:=nbZero+1; {New}
									
							Decim:=Decim+(ord(ch)-48) / power(10, count); {New}
							DecimInt:=DecimInt*10 + ord(ch)-48;
						End;						
				Until ch=char(Enter);
        Until ch=char(Enter);
        If Sous then Coord:=-Coord;
			Write(Coord);
		If ((Decim>0) and (nbZero = 0))  then	{New}
			write('.',DecimInt); {New}
		If ((Decim>0) and (nbZero <> 0))  then {New}
			begin	{New}
				write('.');	{New}
					for j:=1 to nbZero do	{New}
						write('0');	{New}
			
				write(DecimInt);	{New}
			end;	{New}
        If Coord2<>0 then
            Begin
                Write('/',Coord2);
                donneesAuPoint[1,1]:=Coord / Coord2;
            End;
        if Sous then {New}
				donneesAuPoint[1,1]:=Coord-Decim {New}
			else {New}
				donneesAuPoint[1,1]:=Coord+Decim; {New}
       
        Write(';');
        Sous:=False;
        Coord:=0;
        Decim:=0;
        DecimInt:=0;
        zero:=true; {New}
		count:=0; {New}
		nbZero:=0; {New}
        Repeat
            Coord2:=0;
            Repeat
            Until Keypressed;
            ch:=readkey;
            If not ((ch=char(Enter)) or (ch=char(Del)) or (ch=char(Divi)) or (ch=char(Soustra)) or (ch=char(Dot)))then
                Coord:=Coord*10+ord(ch)-48;
            If ch=char(Del) then
                Coord:=Coord div 10;
            If ch=char(Divi) then
                Repeat
                    Repeat
                    Until Keypressed;
                    ch:=readkey;
                    If not ((ch=char(Enter)) or (ch=char(Del)) or (ch=char(Divi))) then
                        Coord2:=Coord2*10+ord(ch)-48;
                    If ch=char(Del) then
                        Coord2:=Coord2 div 10;
                Until ch=char(Enter);
            If ch=char(Soustra) then
				Sous:=True;
			If ch=Char(Dot) then
				Repeat
					Repeat
					Until Keypressed;
					ch:=readkey;
					If not ((ch=char(Enter)) or (ch=char(Del)) or (ch=char(Divi))) then
						Begin
							count:=count+1; {New}
							valeur[count]:=ch; {New}
								for j:=1 to count do {New}
									begin {New}
										if  valeur[j] <> '0' then {New}
											zero:=false; {test}
									end; {New}
								if (zero = true) then {New}
									nbZero:=nbZero+1; {New}
							
							Decim:=Decim+(ord(ch)-48) / power(10, count); {New}
							DecimInt:=DecimInt*10 + ord(ch)-48;
						End;
				Until ch=char(Enter);
        Until ch=char(Enter);
        If Sous then Coord:=-Coord;
			Write(Coord);
		If ((Decim>0) and (nbZero = 0))  then	{New}
			write('.',DecimInt); {New}
		If ((Decim>0) and (nbZero <> 0))  then {New}
			begin	{New}
				write('.');	{New}
					for j:=1 to nbZero do	{New}
						write('0');	{New}
			
				write(DecimInt);	{New}
			end;	{New}
        If Coord2<>0 then
            Begin
                Write('/',Coord2);
                donneesAuPoint[1,2]:=Coord / Coord2;
            End;
        if Sous then {New}
				donneesAuPoint[1,2]:=Coord-Decim {New}
			else {New}
				donneesAuPoint[1,2]:=Coord+Decim; {New}

        Writeln(')');
        
	Until (IoResult=0);

	For i:=2 To nombrePoint Do
		Repeat
			Repeat
                write('Entrez les coordonnees du point ',i,' : (');
                Sous:=False;
                Coord:=0;
                Decim:=0;
				DecimInt:=0;
				zero:=true; {New}
				count:=0; {New}
				nbZero:=0; {New}
                Repeat
                    Coord2:=0;
                    Repeat
                    Until Keypressed;
                    ch:=readkey;
                    If not ((ch=char(Enter)) or (ch=char(Del)) or (ch=char(Divi)) or (ch=char(Soustra)) or (ch=char(Dot))) then
                        Coord:=Coord*10+ord(ch)-48;
                    If ch=char(Del) then
                        Coord:=Coord div 10;
                    If ch=char(Divi) then
                        Repeat
                            Repeat
                            Until Keypressed;
                            ch:=readkey;
                            If not ((ch=char(Enter)) or (ch=char(Del)) or (ch=char(Divi))) then
                                Coord2:=Coord2*10+ord(ch)-48;
                            If ch=char(Del) then
                                Coord2:=Coord2 div 10;
                        Until ch=char(Enter);
                     If ch=char(Soustra) then
						Sous:= True;
					 If ch=Char(Dot) then
						Repeat
							Repeat
							Until Keypressed;
							ch:=readkey;
							If not ((ch=char(Enter)) or (ch=char(Del)) or (ch=char(Divi))) then
								Begin
									count:=count+1; {New}
									valeur[count]:=ch; {New}
										for j:=1 to count do {New}
											begin {New}
												if  valeur[j] <> '0' then {New}
													zero:=false; {New}
											end; {New}
										if (zero = true) then {New}
											nbZero:=nbZero+1; {New}	
									
									Decim:=Decim+(ord(ch)-48) / power(10, count); {New}
									DecimInt:=DecimInt*10 + ord(ch)-48;
								End;
						Until ch=char(Enter);
                Until ch=char(Enter);
                If Sous then Coord:=-Coord;
                If Coord2<>0 then CoordDivi:=Coord / Coord2
                Else CoordDivi:=Coord+Decim;

                If (CoordDivi < donneesAuPoint[i-1,1]) and (i>1) then writeln('     -->  L''abscisse doit être supérieure à ',donneesAuPoint[i-1,1]:3:0,'.');
            Until (CoordDivi>donneesAuPoint[i-1,1]) and (i>1);
			Write(Coord);
			If ((Decim>0) and (nbZero = 0))  then	{New}
			write('.',DecimInt); {New}
			If ((Decim>0) and (nbZero <> 0))  then {New}
				begin	{New}
					write('.');	{New}
						for j:=1 to nbZero do	{New}
							write('0');	{New}
			
					write(DecimInt);	{New}
				end;	{New}
            If Coord2<>0 then
                Begin
                    Write('/',Coord2);
                    donneesAuPoint[i,1]:=CoordDivi;
                End;
            if Sous then {New}
				donneesAuPoint[i,1]:=Coord-Decim {New}
			else {New}
				donneesAuPoint[i,1]:=Coord+Decim; {New}
                        
            Write(';');
            Coord:=0;
            Decim:=0;
			DecimInt:=0;
            Sous:=False;
            zero:=true; {New}
			count:=0; {New}
			nbZero:=0; {New}
            Repeat
                Coord2:=0;
                Repeat
                Until Keypressed;
                ch:=readkey;
                If not ((ch=char(Enter)) or (ch=char(Del)) or (ch=char(Divi)) or (ch=char(Soustra)) or (ch=char(Dot))) then
                    Coord:=Coord*10+ord(ch)-48;
                If ch=char(Del) then
                    Coord:=Coord div 10;
                If ch=char(Divi) then
                    Repeat
                        Repeat
                        Until Keypressed;
                        ch:=readkey;
                        If not ((ch=char(Enter)) or (ch=char(Del)) or (ch=char(Divi))) then
                            Coord2:=Coord2*10+ord(ch)-48;
                        If ch=char(Del) then
                            Coord2:=Coord2 div 10;
                    Until ch=char(Enter);
                 If ch=char(Soustra) then
					Sous:=True;
				 If ch=Char(Dot) then
					Repeat
						Repeat
						Until Keypressed;
						ch:=readkey;
						If not ((ch=char(Enter)) or (ch=char(Del)) or (ch=char(Divi))) then
							Begin
								count:=count+1; {New}
								valeur[count]:=ch; {New}
									for j:=1 to count do {New}
										begin {New}
											if  valeur[j] <> '0' then {New}
												zero:=false; {New}
										end; {New}
										if (zero = true) then {New}
											nbZero:=nbZero+1; {New}
							
								Decim:=Decim+(ord(ch)-48) / power(10, count); {New}
								DecimInt:=DecimInt*10 + ord(ch)-48;
							End;
					Until ch=char(Enter);
            Until ch=char(Enter);
            If Sous then Coord:=-Coord;
			Write(Coord);
			If ((Decim>0) and (nbZero = 0))  then	{New}
				write('.',DecimInt); {New}
			If ((Decim>0) and (nbZero <> 0))  then {New}
				begin	{New}
					write('.');	{New}
						for j:=1 to nbZero do	{New}
							write('0');	{New}
			
					write(DecimInt);	{New}
				end;	{New}
            If Coord2<>0 then
                Begin
                    Write('/',Coord2);
                    donneesAuPoint[i,2]:=Coord / Coord2;
                End;
            if Sous then {New}
				donneesAuPoint[i,2]:=Coord-Decim {New}
			else {New}
				donneesAuPoint[i,2]:=Coord+Decim; {New}

            Writeln(')');
            
		Until (IoResult=0);
end;

procedure affichageResultatFinal(donneesAuPoint : tableauDeQuatreColonnes; nombrePoint : integer; donneesEntreDeuxPoints : tableauDeTroisColonnes);
	var i : integer; 
begin
for i:=1 to (nombrePoint-1) do
begin
writeln('La fonction spline cubique reliant le point ',i,' au point ',i+1,' est : ');
write('S',i,'(X)= ',donneesAuPoint[i,4]/(6*donneesEntreDeuxPoints[i,1]),'*(',donneesAuPoint[i+1,1],'-X)^3 ] + ',donneesAuPoint[i+1,4]/(6*donneesEntreDeuxPoints[i,1]),'*(X-',donneesAuPoint[i,1],')^3 + ',donneesEntreDeuxPoints[i,2],'*(',donneesAuPoint[i+1,1],'-X) + ',donneesEntreDeuxPoints[i,3],'*(X-',donneesAuPoint[i,1],')');
writeln(' ');
end;
writeln(' ');
end;





procedure calculPasAbscisse(var donneesEntreDeuxPoints : tableauDeTroisColonnes; donneesAuPoint : tableauDeQuatreColonnes ; nombrePoint : integer); 
	var i : integer ; 
begin
	for i:=1 to nombrePoint-1 do
		donneesEntreDeuxPoints[i,1]:=donneesAuPoint[i+1,1]-donneesAuPoint[i,1]; 
end;

procedure calculTauxAccroissement(var donneesAuPoint : tableauDeQuatreColonnes; donnesEntreDeuxPoints : tableauDeTroisColonnes ; nombrePoint : integer);
	var i : integer; 
	
begin
	for i:= 1 to nombrePoint-1 do
		donneesAuPoint[i,3]:= (donneesAuPoint[i+1,2]-donneesAuPoint[i,2])/donnesEntreDeuxPoints[i,1];
end;

procedure remplissageMatriceA(var matriceA : tableauNN; donneesAuPoint : tableauDeQuatreColonnes; donnesEntreDeuxPoints : tableauDeTroisColonnes; nombrePoint : integer); 
	var i: integer ;
begin
	matriceA[1,1]:=1;
	matriceA[nombrePoint,nombrePoint]:=1;
	for i:=2 to nombrePoint-1 do
		begin
		matriceA[i,i]:= 2*(donnesEntreDeuxPoints[i-1,1]+donnesEntreDeuxPoints[i,1]);
		matriceA[i,i-1]:= donnesEntreDeuxPoints[i-1,1];
		matriceA[i,i+1]:=donnesEntreDeuxPoints[i,1];
		end;
end;

procedure remplissageMatriceAReduite(var matriceA,matriceAR : tableauNN; nombrePoint : Integer);

var i, j :Integer;

begin
for i:=1 to nombrePoint-2 do
	for j:=1 to nombrePoint-2 do
matriceAR[i,j]:=matriceA[i+1,j+1];
end;

procedure remplissageMatriceG( var matriceG : tableauUneColonne; donneesAuPoint : tableauDeQuatreColonnes; donneesEntreLesPoints : tableauDeTroisColonnes ; nombrePoint : integer);
	var i : integer ; 
begin
	matriceG[1]:=0;
	matriceG[nombrePoint]:=0; 
	
	for i:=2 to nombrePoint-1 do 
		matriceG[i]:=6*( donneesAuPoint[i,3] - donneesAuPoint[i-1,3]);
end;

procedure remplissageMatriceGReduite(var matriceG,matriceGR : tableauUneColonne; nombrePoint : Integer);

var i :Integer;

begin
for i:=1 to nombrePoint-2 do
matriceGR[i]:=matriceG[i+1];
end;

procedure remplissageEtCalculSimple(var donneesEntreDeuxPoints: tableauDetroisColonnes; var donneesAuPoint: tableauDeQuatreColonnes; nombrePoint: integer; var matriceAR : tableauNN; var matriceGR : tableauUneColonne); 
begin
	calculPasAbscisse(donneesEntreDeuxPoints,  donneesAuPoint, nombrePoint);
	calculTauxAccroissement(donneesAuPoint, donneesEntreDeuxPoints, nombrePoint);
	remplissageMatriceA(matriceA, donneesAuPoint, donneesEntreDeuxPoints, nombrePoint);
	remplissageMatriceAReduite(matriceA,matriceAR,nombrePoint);
	remplissageMatriceG( matriceG, donneesAuPoint, donneesEntreDeuxPoints, nombrePoint);
	remplissageMatriceGReduite(matriceG,matriceGR,nombrePoint)
end;

procedure calculDeAi(donneesAuPoint:tableauDeQuatreColonnes; nombrePoint:integer; var donneesEntreDeuxPoints : tableauDeTroisColonnes);
	var i : integer; 
begin
	for i:=1 to nombrePoint-1 do
		donneesEntreDeuxPoints[i,2]:= (donneesAuPoint[i,2]/donneesEntreDeuxPoints[i,1])-donneesAuPoint[i,4]*donneesEntreDeuxPoints[i,1]/6;
end;

procedure calculDeBi(donneesAuPoint: tableauDeQuatreColonnes; nombrePoint:integer; var donneesEntreDeuxPoints : tableauDeTroisColonnes);
	var i : integer;
begin
	for i:=1 to nombrePoint-1 do
		donneesEntreDeuxPoints[i,3]:= (donneesAuPoint[i+1,2]/donneesEntreDeuxPoints[i,1])-donneesAuPoint[i+1,4]*donneesEntreDeuxPoints[i,1]/6;
end;

procedure calculDesConstantes(donneesAuPoint: tableauDeQuatreColonnes;nombrePoint: integer; var donneesEntreDeuxPoints : tableauDeTroisColonnes);
begin
	calculDeBi(donneesAuPoint, nombrePoint, donneesEntreDeuxPoints);
	calculDeAi(donneesAuPoint, nombrePoint, donneesEntreDeuxPoints);
end;

procedure remplissageMatriceUetL(var matriceL : tableauNN; var matriceU : tableauNN; matriceAR : tableauNN; nombrePoint : integer);
	var i : integer;
begin
	matriceU[1,1]:= matriceAR[1,1];
	for i:=1 to nombrePoint-2 do
		matriceL[i,i]:=1;         
	for i:=1 to nombrePoint-2 do
		matriceU[i,i+1]:=matriceAR[i,i+1];


	for i:=2 to nombrePoint-2 do
		begin
		matriceL[i,i-1]:=matriceAR[i,i-1]/matriceU[i-1,i-1]; 
		matriceU[i,i]:= matriceAR[i,i]-matriceL[i,i-1]*matriceU[i-1,i]; 
		end;
end;

procedure calculDeMatriceY(var matriceY,matriceGR : tableauUneColonne ; matriceL : tableauNN ; donneesAuPoint : tableauDeQuatreColonnes ; nombrePoint : integer);
	var i : integer ;  
begin
	matriceY[1]:=matriceGR[1];
	for i:=2 to nombrePoint-2 do
		matriceY[i]:=matriceGR[i]-matriceL[i,i-1]*matriceY[i-1];
end;

	
procedure calculDesDeriveesSecondes(var donneesAuPoint: tableauDeQuatreColonnes ; matriceU : tableauNN ; matriceY: tableauUneColonne ; nombrePoint : integer);
	var i : integer ;
begin
	donneesAuPoint[1,4]:=0;
	donneesAuPoint[nombrePoint,4]:=0;
	donneesAuPoint[nombrePoint-1,4]:=(matriceY[nombrePoint-2])/matriceU[nombrePoint-2,nombrePoint-2];
	For i:=nombrePoint-2 downto 2 do
		Begin
			donneesAuPoint[i,4]:= (matriceY[i-1]-matriceU[i-1,i]*donneesAuPoint[i+1,4])/matriceU[i-1,i-1];
		End;
end;

procedure resolutionSysteme(matriceG :  tableauUneColonne; matriceA : tableauNN; nombrePoint : integer; var donneesAuPoint: tableauDeQuatreColonnes); 
var matriceY: tableauUneColonne; matriceL, matriceU : tableauNN;
begin
	remplissageMatriceUetL(matriceL, matriceU, matriceAR, nombrePoint);
	calculDeMatriceY(matriceY,matriceGR, matriceL, donneesAuPoint, nombrePoint);
	calculDesDeriveesSecondes(donneesAuPoint, matriceU, matriceY, nombrePoint);
end;


begin
	if (not (FileExists('./Résultats'))) then {Si les répertoires FichesGDDA et FichesPPA n'existent pas dans le répertoire dans lequel je me trouve alors on les créer}
	MkDir('./Résultats'); {New}
	
	choix:='star';
	repeat
		clrscr;
		initialisation(donneesAuPoint,matriceA);
		entrerLesValeurs(donneesAuPoint, nombrePoint);

		remplissageEtCalculSimple(donneesEntreDeuxPoints, donneesAuPoint, nombrePoint, matriceAR, matriceGR);

		resolutionSysteme(matriceG, matriceA, nombrePoint, donneesAuPoint); 

		calculDesConstantes(donneesAuPoint, nombrePoint, donneesEntreDeuxPoints);

		affichageResultatFinal(donneesAuPoint, nombrePoint, donneesEntreDeuxPoints);

	sauvegarde(donneesAuPoint,nombrePoint, donneesEntreDeuxPoints);
		repeat
			writeln('Que voulez vous faire?');
			writeln(' 1 : Quitter');
			writeln(' 2 : Recommencer avec de nouvelles valeurs');
			readln(choix);
		until (choix='1') or (choix ='2');
	until choix='1' ;

	clrscr; ;
	writeln('Au revoir, et a bientot !');
	writeln(' ');
	writeln('       _   __   _   _____       __       ___     ___   _   _   ____   __   _   ');
	writeln('      | | |  \ | | /  ___/     /   |    |  _ \  | _ | | | | | | ___| |  \ | |   ');
	writeln('      | | |   \| | | |___     / /| |    | |_| | || || | | | | | |__  |   \| |   ');
	writeln('      | | | |\   | \___  \   / /_| |    |  _ /  || || | | | | | __|  | |\   |   ');
	writeln('      | | | | \  |  ___| |  / /  | |    | | \\  ||_|| | |_| | | |__  | | \  |   ');
	writeln('      |_| |_|  \_| /_____/ /_/   |_|    |_|  \\ |___| |_____| |____| |_|  \_|   ');
	writeln(' ');
	writeln('Appuyez sur une touche pour quitter.');
	readln(choix);
end.
