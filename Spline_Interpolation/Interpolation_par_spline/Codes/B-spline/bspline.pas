program bspline; 
{2016-2017 Projet Mathématique Interpolation Par Spline}

uses crt, dos{, graph, modubase, entrees};

{____________________Les Types____________________}
CONST NBp=200;
	  Max=50;
	  
Type Tabulation=Array[0..NbP] of Real;

var T:Array[-Max..Max] of Real;
	Y:Array[1..32000] of Real;				{Vecteur avec des coordonées réels}
	A:Tabulation;							{on stoke les valeurs des points}
	NPoints, Choix:Integer;
	Debut,Fin:Real;							{X:Real}

{____________________Init____________________}
procedure Init(NP,C:Integer; XD,XF:Real);
{cette procedure a le but d'initialiser les conditions initiales et de préparer toutes les variables selon les hypotheses et contraintes faites afin de faire les calculs}	
var i:Integer;
	S:Real;
	
begin
	Randomize;
	S:=(XF-XD)/NP;							{S sera la longeur d'interval unitaire defini par à partir d'écart entre nos points de départ et d'arrivée (si on a des points très éloignées on se permet de faire des intervalles plus larges car l'erreure ne sera pas trop importante, mais si les points sont proches nous sommes obligées d'avoir des intervales petits, ce qui serait le cas si je prends la difference entre les 2 et je le divise) dans la variable de type tabulation on commence à enregistrer les abscises}
	T[-1]:=XD-10*S;							{nous initialisons l'abscise avant notre point de départ en utilisant la meme longeur de intervalle considéré comme pour tous les points}
	T[0]:=XD;								{XD represent l'abscise de début et XF répresent l'abscise de fin}
	for i:=1 to NP do 
		T[i]:=XD+(i-0.5)*S;
	T[NP+1]:=XF;
	T[NP+2]:=XF+10*S;						{on enregistre aussi le dernier cas pour ne pas arreter brusquement la courbe et pour savoir la direction de la continuité}
	if C=1 then								{en fonction de la valeur rentré par l'utilisateur notre vecteur est initialisé avec une valeur constante ou }
		for i:=1 to NP do
			Y[i]:=1
	else		
		for i:=1 to NP do
			Y[i]:=Random;					{comme l'argument n'est pas specifié ici on va avoir un constante decimale; cela est le cas corespondant au choix de plusieurs constantes par l'utilisateur, ce qui montre une precision plus grande mais avec des constantes aléatoires}
end;

{procedure AfficheCourbe(XDeb,Pas,Xorg,Yorg, XMin, XMax, Ymin, Ymax:Real; N:Integer; V1:Tabulation);
ce procedure a le but de dessiner la corbe Bspline en utilisant des interfaces SDL
var X:Real;
	i:Integer;
	
begin
	InitGraphique;
	Fenetre(XMin, XMax, Ymin, Ymax);
	X_axe(Xorg,Yorg,(XMax-XMin)/10);
	Y_axe(Xorg,Yorg,(Ymax-Ymin)/10);
	for i:=1 to NPoints do
		Rond(T[i],Y[i]);
	X:=XDeb;
	i:=0;
	while (X<XMax) and (i<N) do
		begin
		Deplace(X,V1[i]);
		X:=X+Pas;
		Trace(X, V1[i+1]);
		i:=i+1;
		end;
end;}

{____________________BI0_____________________}	
function BI0(I:Integer;X:Real):Real;
{la fonction renvoie le résultat de la premiere étape de calcul de la Bspline dont on va se servire pour calculer la valeur de la fonction Bspline en differents points, ce qui est equivalent à un dégré 0, à savoir les constantes}

begin
	if (x<T[i]) or (x>=T[i+1]) then			{la constante est initialisé en fonction des ponts entre lesquelles se trouve notre point pour lequel on est en cours de calculer la valeur de la fonction}
		BI0:=0
	else
		BI0:=1;
end;

{____________________BI1_____________________}	
function BI1(I:Integer; X:Real):Real;
{la fonction renvoie le résultat de la deuxième étape de calcul de la Bspline dont on va se servire pour calculer la valeur de la fonction Bspline en differents points, ce qui est equivalent à un dégré 1}

begin
	BI1:=(x-T[i])/(T[i+1]-T[i])*BI0(I,x)+(T[i+2]-x)/(T[i+2]-T[i+1])*BI0(I+1,x);
end;

{____________________BI2_____________________}	
function BI2(I:Integer; X:Real):Real;
{la fonction renvoie le résultat de la premiere étape de calcul de la Bspline dont on va se servire pour calculer la valeur de la fonction Bspline en differents points, ce qui est equivalent à un dégré 2; au début on allait jusqu'à BI2 car on calculé des splines quadratiques}

begin
	BI2:=(x-T[i])/(T[i+2]-T[i])*BI1(I,x)+(T[i+3]-x)/(T[i+3]-T[i+1])*BI1(I+1,x);
end;

{____________________BI3_____________________}	
function BI3(I:Integer; X:Real):Real;
{J'ai construit ce fonction pour modifier le degré 2 en degré 3; la fonction renvoire le résultat de la derniere étape de calcul de la Bspline, ce qui est equivalent à un dégré 3; dans notre cas, le resultat suffit pour construire notre Bspline comme on se retrouve dans le cas des Bsplines cubiques}

begin
	BI3:=(x-T[i])/(T[i+3]-T[i])*BI2(I,x)+(T[i+4]-x)/(T[i+4]-T[i+1])*BI2(I+1,x);
	{writeln((x-T[i])/(T[i+3]-T[i])*BI2(I,x), ' + ', (T[i+4]-x)/(T[i+4]-T[i+1])*BI2(I+1,x));}
end;

{_______________________CalculCoeff_________________________}
procedure CalculCoeff(N:Integer; var A:Tabulation);

var gamma,delta:Tabulation;
	i:Integer;
	q,u,v:Real;
	
begin
	gamma[0]:=0;
	delta[0]:=1;								{on initialise nos variables dont je me servira pour stcoker la formule fixe de chaque coefficient}
	u:=0;
	v:=1;
	TextColor(Blue);
	for i:=1 to N do
		begin
		q:=(T[i]-T[i+1])/(T[i]-T[i-1]);			{on utilise q pour garder la formule générale spécifique pour les Bsplines qui calcule le coefficient et on fait bouger i de telle facon qu'on peu avoir toutes les coefficients avec la meme formule récursive}
		writeln('q:', q:4:2);					{j'affcihe pour voir le calclu de chaque point, il y a autant que le nombre de points choisi par l'utilisateur}
		gamma[i]:=gamma[i-1]*q+y[i]*(1-q);
		writeln('gamma:', gamma[i]:4:2);
		delta[i]:=delta[i-1]*q;
		writeln('delta:', delta[i]:4:2);		{à l'aide de q et avec la valeur precedente et actuelle du point en cours de traitement je calcule les valeurs pour chaque cas de gamma et delta ce qui represent les coefficients finales pour chaque point; comme gamma, delta et A sont variables de type tabulation, quand je traite le cas i je vais utiliser gamma[i] et delta[i] pour avoir les valeurs intermediaires des coefficinets du point respectif}
		u:=u+delta[i]*gamma[i];					
		v:=v+sqr(delta[i]);						{u et v auront les valeurs finales de coefficients de la fonction Bspline}
		writeln;
		end;
	A[0]:=-u/v;
	for i:=1 to N do
		begin
		A[i]:=gamma[i]+delta[i]*A[0];			{la variable de type tabulation A garde les valeurs d'un nombre des points choisi par l'utilisateur, valeurs qui sont calculés à l'aide des formules spécifiques pour la fonction Bspline; J'utilise ici la forme générale des coefficinets et je fais des manipulations afin de me retrouver avec les bon coefficients; l'idée ici est d'avoir une formule fixé en accord avec la mathématique que j'utiliserai pour tous les points avec une simple changement d'indice; De plus comme j'ai gardé dans les tabulations gamma, delta et A les valeurs spécifiques pour chaque point, je peut utiliser facilement les valeurs que précedent le point en cours de traitement}
		TextColor(Yellow);
		writeln('La valeur specifique de Bspline poir le point ', i,':', A[i]);
		end;	
end;

{_______________________Bspline_________________________}
function Bspline(N:Integer; A:Tabulation; X:Real):Real;
{cette fonction est la plus importante du program; ici, grace aux BI3 calculé de manièere recursive à parir des BI0,1 et 2 selon les regles de calcul d'une Bspline et je peux ensuite l'utiliser dans mes manipulations pour avoir les valeurs dans les points de controle les plus importantes}
var Ind:Integer;
var S:Real;

begin
	s:=0;
	for Ind:=0 to N do
		s:=s+A[Ind]*BI3(Ind-1, X);				{j'ai modifie les manipulations afin d'avoir un résultat qui représent une Bspline cubique, tandis qu'avant nous avons eu une Bspline quadratique seulement; à l'aide de BI3 qu j'ai construit en réspectant les régles de bases de calcul je troeuve la Bspline cubique}
	Bspline:=S;	
end;

{_______________________TraceBspline_______________________}
procedure TraceBspline(A:Tabulation; N:Integer; X0,X1:Real);			
{Initialement ce produre avait le but de modéliser dans une fenetre SDL l'allure de la corbe Bspline en utilisant plusieurs morceaux et en calculant la valeur specifique dans ces points là. Comme j'ai modifié le fonctionement du programme maintenant comme je n'utilise pas les valeurs pour decrire la courde graphiquement, je les affiche dans le terminal pour avoir une idée precise des directions de la courbe}
var j:Integer;
var p:Tabulation;
var Pas:Real;

begin
	TextColor(Blue);
	writeln;
	writeln('Calcul en cours...');
	writeln;
	Pas:=(X1-X0)/NbP;							{on etabli le saut entre les points traités}
	TextColor(Red);
	for j:=0 to NbP do
		begin
		if (j mod 10)=0 then
			write('Point de controle.');
		p[j]:=Bspline(N,a,X0+j*pas);			{pour savoir le comportement de la Bsline on trouve la valeur de la fonction appliquée dans une grand nombre de point et en les reliant on pourrait observer la courbe}
		writeln('Valeurs prises par la Bspline:', p[j]:4:2);
		end;
	{affichecourbe(X0,Pas,0,0,X0-Pas, X1+Pas, -0.5, 2, NbP, p);		initialement utilisé pour dessiner l'allure en SDL, maintenant on utilise GeoGebra}		
end;

{_______________________Program Principal_______________________}
begin
	{Efface;}
	Debut:=0;
	Fin:=1;
	TextColor(LightBlue);
	writeln('==================== Approximation par B-splines ====================');
	writeln();
	TextColor(White);
	repeat
		write('Nombre de points (<', Max, '): ');			{on verifie bien que le numero ne depasse pas les bornes pour ne pas faire depassement de tableau}
		readln(NPoints);
	until (NPoints<50);	
	{Entre_Entier(NPoints);}
	repeat
		writeln('1: valeurs constantes');
		writeln('2: valeurs constantes');
		write('Choix: ');
		readln(Choix);
		{Entre_Entier(Choix);}								{l'alternative pour cette procédure est un simple readln aui me permet de collecter les informations fournis par l'utilisateur}
	until (Choix=1) or (Choix=2);
	writeln;
	Init(NPoints, Choix, Debut, Fin);
	CalculCoeff(NPoints, A);
	TraceBSpline(A, NPoints, Debut, Fin);				{je traite et je fais des calculs avec les inforlations de l'utilisateur afin de lui donner les résultats souhaités}
	TextColor(White);
	writeln();
	writeln('********** Voila vos résultats, merci pour utiliser Bspline ! **********');
end.


{créée et optimisé par Andrei-Silviu MILEA dans le but de Projet Mathématique 2016-2017 semestre 3}
{dernière modification Decembre 2016}


