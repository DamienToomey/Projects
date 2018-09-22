cd C:\Users\marc\Desktop\ProjetM8Matlab\ProjetM8 %chemin

%%
clear
clc
format long g

%% Feuille "Apports Nutritionnels McDonalds"

numero_figure=1;
AN = struct('name',{'Energie','Matières grasses','Acides gras saturés','Glucides','Sucres','Fibres','Protéines','Sel'} );

% Menu_legende avec Chicken McNuggets (20 morceaux)
%Menu_legende = struct('name',{'Big Mac', 'Royal Deluxe','Royal Bacon','Royal Cheese','Double Cheeseburger','Hamburger','Cheeseburger','McChicken','Chicken McNuggets (4 morceaux)','Chicken McNuggets (6 morceaux)','Chicken McNuggets (9 morceaux)','Chicken McNuggets (20 morceaux)','McFish','Filet-O-Fish','Croque McDo','Cassecroute Bœuf Oignons','Cassecroute Poulet Crudités','Le M','Le M Bacon','McWrap Poulet Croustillant & Bacon','McWrap Poulet Croustillant Poivre','P’tit Wrap Ranch','P’tit Italien','','ACCOMPAGNEMENTS','Frite petite','Frite moyenne','Frite grande','Deluxe Potatoes moyenne','Deluxe Potatoes grande','P’tite salade (avec sauce vinaigrette allégée)','P’tites tomates','','BOISSON (format moyen)','Coca-Cola (40 cl)','Coca-Cola light (40 cl)','Coca-Cola zéro (40 cl)','Sprite (40 cl)','Fanta orange (40 cl)','Lipton Ice Tea saveur pêche (40 cl)','Minute Maid (30 cl)','evian (33 cl)','Badoit (33 cl)','','BOISSONS (petit format)','Coca-Cola (25 cl)','Coca-Cola light (25 cl)','Coca-Cola zéro (25 cl)','Sprite (25 cl)','Fanta orange (25 cl)','Lipton Ice Tea saveur pêche (25 cl)','Minute Maid (20 cl) ','Mon P’tit Jus Bio (20 cl)','evian (33 cl)','','SALADES','Salade Caesar (avec sauce caesar)','Salade Pâte Mozzarella (avec sauce vinaigrette)','Salade Pomme de terre Poulet Oignon (avec sauce goût fumé)','','DESSERTS','Sundae (1) nappage saveur caramel','Sundae (1) nappage saveur chocolat','Frappé Myrtille-Framboise','Frappé Mangue-Fraise','Frappé Pistache','Frappé Vanille Fraise','Very parfait coulis fraise','Very parfait nappage saveur caramel','Very parfait nappage saveur chocolat','McFlurry Oreo','McFlurry Daim','McFlurry Kit Kat Ball','McFlurry M&M’s','McFlurry Granola','Nappage saveur chocolat','Nappage saveur caramel','Muffin Chocolat','Mandise','Brownie stick caramel et biscuit','Cookie stick aux Noisettes','P’tite poire','P’tite pomme','Ananas à Croquer','Berlingo’ Fruits pomme banane','Berlingo’ Fruits pomme','Mon Bio à boire banane','Mon Bio à boire fraise mûre','','PETIT DEJEUNER','Bacon & Egg  McMuffin','Pancake nature (2 unités)','Trio mini viennoiseries','Muffin Chocolat','Beurre','Grand café Segafredo','Thé Lipton','Café expresso Segafredo','Ristretto','Noisette','Sirop aromatisé erable','Stick pâte à tartiner','Confiture extra de fraise ou d’abricot','Minute Maid (20 cl)','Cappuccino','Cappuccino Daim','Double Latte','Boisson chaude Banania','P’tite pomme'});

% Menu_legende sans Chicken McNuggets (20 morceaux)
Menu_legende = struct('name',{'Big Mac', 'Royal Deluxe','Royal Bacon','Royal Cheese','Double Cheeseburger','Hamburger','Cheeseburger','McChicken','Chicken McNuggets (4 morceaux)','Chicken McNuggets (6 morceaux)','Chicken McNuggets (9 morceaux)','McFish','Filet-O-Fish','Croque McDo','Cassecroute Bœuf Oignons','Cassecroute Poulet Crudités','Le M','Le M Bacon','McWrap Poulet Croustillant & Bacon','McWrap Poulet Croustillant Poivre','P’tit Wrap Ranch','P’tit Italien','Frite petite','Frite moyenne','Frite grande','Deluxe Potatoes moyenne','Deluxe Potatoes grande','P’tite salade (avec sauce vinaigrette allégée)','P’tites tomates','Coca-Cola (40 cl)','Coca-Cola light (40 cl)','Coca-Cola zéro (40 cl)','Sprite (40 cl)','Fanta orange (40 cl)','Lipton Ice Tea saveur pêche (40 cl)','Minute Maid (30 cl)','evian (33 cl)','Badoit (33 cl)','Coca-Cola (25 cl)','Coca-Cola light (25 cl)','Coca-Cola zéro (25 cl)','Sprite (25 cl)','Fanta orange (25 cl)','Lipton Ice Tea saveur pêche (25 cl)','Minute Maid (20 cl) ','Mon P’tit Jus Bio (20 cl)','Salade Caesar (avec sauce caesar)','Salade Pâte Mozzarella (avec sauce vinaigrette)','Salade Pomme de terre Poulet Oignon (avec sauce goût fumé)','Sundae (1) nappage saveur caramel','Sundae (1) nappage saveur chocolat','Frappé Myrtille-Framboise','Frappé Mangue-Fraise','Frappé Pistache','Frappé Vanille Fraise','Very parfait coulis fraise','Very parfait nappage saveur caramel','Very parfait nappage saveur chocolat','McFlurry Oreo','McFlurry Daim','McFlurry Kit Kat Ball','McFlurry M&M’s','McFlurry Granola','Nappage saveur chocolat','Nappage saveur caramel','Muffin Chocolat','Mandise','Brownie stick caramel et biscuit','Cookie stick aux Noisettes','P’tite poire','P’tite pomme','Ananas à Croquer','Berlingo’ Fruits pomme banane','Berlingo’ Fruits pomme','Mon Bio à boire banane','Mon Bio à boire fraise mûre','Bacon & Egg  McMuffin','Pancake nature (2 unités)','Trio mini viennoiseries','Muffin Chocolat','Beurre','Grand café Segafredo','Thé Lipton','Café expresso Segafredo','Ristretto','Noisette','Sirop aromatisé erable','Stick pâte à tartiner','Confiture extra de fraise ou d’abricot','Minute Maid (20 cl)','Cappuccino','Cappuccino Daim','Double Latte','Boisson chaude Banania','P’tite pomme'});

% Menu_legende_ACP avec Chicken McNuggets (20 morceaux)
Menu_legende_ACP = struct('name',{'Big Mac', 'Royal Deluxe','Royal Bacon','Royal Cheese','Double Cheeseburger','Hamburger','Cheeseburger','McChicken','Chicken McNuggets (4 morceaux)','Chicken McNuggets (6 morceaux)','Chicken McNuggets (9 morceaux)', 'Chicken McNuggets (20 morceaux)','McFish','Filet-O-Fish','Croque McDo','Cassecroute Bœuf Oignons','Cassecroute Poulet Crudités','Le M','Le M Bacon','McWrap Poulet Croustillant & Bacon','McWrap Poulet Croustillant Poivre','P’tit Wrap Ranch','P’tit Italien','Frite petite','Frite moyenne','Frite grande','Deluxe Potatoes moyenne','Deluxe Potatoes grande','P’tite salade (avec sauce vinaigrette allégée)','P’tites tomates','Coca-Cola (40 cl)','Coca-Cola light (40 cl)','Coca-Cola zéro (40 cl)','Sprite (40 cl)','Fanta orange (40 cl)','Lipton Ice Tea saveur pêche (40 cl)','Minute Maid (30 cl)','evian (33 cl)','Badoit (33 cl)','Coca-Cola (25 cl)','Coca-Cola light (25 cl)','Coca-Cola zéro (25 cl)','Sprite (25 cl)','Fanta orange (25 cl)','Lipton Ice Tea saveur pêche (25 cl)','Minute Maid (20 cl) ','Mon P’tit Jus Bio (20 cl)','Salade Caesar (avec sauce caesar)','Salade Pâte Mozzarella (avec sauce vinaigrette)','Salade Pomme de terre Poulet Oignon (avec sauce goût fumé)','Sundae (1) nappage saveur caramel','Sundae (1) nappage saveur chocolat','Frappé Myrtille-Framboise','Frappé Mangue-Fraise','Frappé Pistache','Frappé Vanille Fraise','Very parfait coulis fraise','Very parfait nappage saveur caramel','Very parfait nappage saveur chocolat','McFlurry Oreo','McFlurry Daim','McFlurry Kit Kat Ball','McFlurry M&M’s','McFlurry Granola','Nappage saveur chocolat','Nappage saveur caramel','Muffin Chocolat','Mandise','Brownie stick caramel et biscuit','Cookie stick aux Noisettes','P’tite poire','P’tite pomme','Ananas à Croquer','Berlingo’ Fruits pomme banane','Berlingo’ Fruits pomme','Mon Bio à boire banane','Mon Bio à boire fraise mûre','Bacon & Egg  McMuffin','Pancake nature (2 unités)','Trio mini viennoiseries','Muffin Chocolat','Beurre','Grand café Segafredo','Thé Lipton','Café expresso Segafredo','Ristretto','Noisette','Sirop aromatisé erable','Stick pâte à tartiner','Confiture extra de fraise ou d’abricot','Minute Maid (20 cl)','Cappuccino','Cappuccino Daim','Double Latte','Boisson chaude Banania','P’tite pomme'});

% Genre dans la feuille "ANC"
Genre = struct('name',{'Femme', 'Homme', 'Enfant (5-10 ans)'});

menu=xlsread('ProjetM8', 'Apports nutritionnels McDonalds');
ANC=xlsread('ProjetM8', 'ANC');


%%
% Dans la variable menu :
% Energie (kcal) par portion : colonne 5
% Matières grasses (g) par portion : colonne 8
% Acides gras saturés (g) par portion : colonne 11
% Glucides (g) par portion : colonne 14
% Sucres (g) par portion : colonne 17
% Fibres (g) par portion : colonne 20
% Protéines (g) par portion : colonne 22 
% Sel (g) par portion : colonne 25

X=[menu(:,5), menu(:,8), menu(:,11), menu(:,14), menu(:,17), menu(:,20), menu(:,22), menu(:,25)];

% Dans la variable X :
% Energie (kcal) par portion : colonne 1
% Matières grasses (g) par portion : colonne 2
% dont Acides gras saturés (g) par portion : colonne 3 
% Glucides (g) par portion : colonne 4
% dont Sucres (g) par portion : colonne 5
% Fibres (g) par portion : colonne 6
% Protéines (g) par portion : colonne 7
% Sel (g) par portion : colonne 8

IndiceColonne=1;
% Dans les deux lignes suivantes, je retire les NaN dans la matrice X
Vecteur_indice_supLigne=find(isnan(X(:,IndiceColonne)));
X(Vecteur_indice_supLigne,:)=[];

%%
% On retire la variabe eau evian (330ml) dans les petites boissons
% puisque cette variable est également dans les moyennes boissons.
Indice_evian_moyenne_boisson=48;
X(48,:)=[];

%%
% Pour la variable X, les lignes 1 à 22 concernent les sandwichs.
% Pour la variable X, les lignes 23 à 29 concernent les accompagnements.
% Pour la variable X, les lignes 30 à 38 concernent les moyennes boissons.

% Pour la variable X, les lignes 39 à 46 concernent les petites boissons.

% Pour la variable X, les lignes 47 à 49 concernent les salades.
% Pour la variable X, les lignes 50 à 76 concernent les desserts.
% Pour la variable X, les lignes 77 à 95 concernent le petit déjeuner.

% Dans la feuille "Apports nutritionnels McDonalds", on soustrait la
% colonne "dont Acides gras saturés (g)" à la colonne "Matières grasses (g)"
% puis on soustrait la colonne "dont sucres (g)" à la colonne "Glucides (g)"
% car dans cette feuille, la colonne "Matières grasses (g)" contient déjà la masse 
% d'Acides gras saturés (g) et la colonne "Glucides (g)" contient déjà la
% masse de sucre.

colonne_Matieres_grasses=2;
colonne_Acides_gras_satures=3;

colonne_Glucides=4;
colonne_Sucres=5;

X(:,colonne_Matieres_grasses)= X(:,colonne_Matieres_grasses)-X(:,colonne_Acides_gras_satures);
X(:,colonne_Glucides)= X(:,colonne_Glucides)-X(:,colonne_Sucres);

X_ACP=X; % on n'a pas encore retiré "Chicken McNuggets (20 morceaux)" dans X donc on garde X dans X_ACP pour l'ACP.

%% Variance, écart type, médiane Matlab

[n p]=size(X);
mean(X)'
% Matrice de variance covariance.
Matrice_covariance=cov(X)*(n-1)/n;
diag(Matrice_covariance)

% Réduisons les données.
s=sqrt(diag(Matrice_covariance))

median(X)


%% Fonction de répartition corrigée
IndiceColonne=1;
x=X(:,IndiceColonne);

n = length(x);
[mo Ni] = unique(sort(x), 'last');
 
F=Ni/n;
nu = length(mo);
% La masse est une variable quantitative continue. On utilise donc la fonction de répartition empirique corrigée.
Fc = F - 1/2*(F - [0 ; F(1:nu-1)]);
figure(numero_figure);
numero_figure=numero_figure+1;
plot(mo,Fc,'o-');
grid on

%% Boîte à moustache, quartiles, médianes, DIQ, épure

Q1Matlab=quantile(x, 0.25)
MedianeMatlab=median(x)
Q3Matlab=quantile(x, 0.75)
  
Minimum=min(x)
Q1=65.9
Mediane=207.5
% 50% des aliments présents dans le menu de McDonald's contiennent plus de
% 205 kcal.
% 50% des aliments présents dans le menu de McDonald's contiennent moins de
% 205 kcal.
Q3=335.5
DIQ=Q3-Q1
Maximum=max(x)
epureGauche=Q1-3/2*DIQ
epureDroite=Q3+3/2*DIQ

figure(numero_figure)
numero_figure=numero_figure+1;
boxplot(x)
grid on

moy=mean(x)
% En moyenne, un aliment chez McDonald's contient 233.70 kcal.

% On remarque sur la boîte à moustache que les 895 kcal des Chicken McNuggets
% (20 morceaux) sont considérés comme une valeur aberrante.
% Puisqu'on considère les apports journalier d'un individu,
% on peut retirer l'option Chicken McNuggets (20 morceaux) car en générale,
% une personne ne mange pas 20 morceaux mais plutôt 9 ou moins.

% On retire la valeur aberrante
Indice_Ligne_20_morceaux_chicken=12;
X(Indice_Ligne_20_morceaux_chicken,:)=[];

[n, p] = size(X);
moy = sum(x)/n
% En moyenne, un aliment chez McDonald's contient 236.16 kcal.

%% Matrice des corrélations

moyenne=sum(X)/n;
% Calculons la matrice de variance covariance des quantités
% d'ingrédients par portion de chaque aliment présent dans le menu.

% Centrons les données
Xc=X-ones(n,1)*moyenne;
mean(Xc);
% mean(Xc) est un vecteur de 0 donc a bien centré les données.

% Matrice de variance covariance.
Matrice_covariance=cov(X)*(n-1)/n;

% Réduisons les données.
s=sqrt(diag(Matrice_covariance))';
Xn=Xc./(ones(n,1)*s);

mean(Xn); %mean(Xn) est un vecteur de 0 donc a bien centré les données.
std(Xn); % on trouve bien un vecteur de 1 donc a bien réduit les données.

% Matrice de corrélation des données;
Cr = Xn'*Xn/n;

figure(numero_figure)
numero_figure=numero_figure+1;

imagesc(Cr);
colorbar;

set(gca, 'XTickLabel', {'Energie','Matières grasses','Acides gras saturés','Glucides','Sucres','Fibres','Protéines','Sel'});
set(gca, 'YTickLabel', {'Energie','Matières grasses','Acides gras saturés','Glucides','Sucres','Fibres','Protéines','Sel'});
set(gca, 'xaxislocation', 'top');

%% Tests Combinaisons menus
%% Nombre d'éléments par catégorie (sandwichs, accompagnements, moyennes boissons, petites boissons, saldes, petits-déjeuner)
nb_SANDWICHS = 22; %on a retiré Chicken nuggets (20 morceaux)
nb_ACCOMPAGNEMENTS = 7;
nb_moyennes_BOISSONS = 9; 
nb_petites_BOISSONS = 8;
% On ne considère pas l'eau évian dans la catégorie des petites
% boissons car 330ml d'évian a déjà été considéré pour les moyennes
% boissons.
nb_SALADES = 3;
nb_DESSERTS = 27;
nb_PETIT_DEJEUNER = 19;

%% Menu 1 : Sandwich/Accompagnement/Boisson(format moyen)
%% Initialisation
nb_combinaisons_menus=0;

% SANDWICHS
ligne_SANDWICH_Dep=1;
ligne_SANDWICH=1;
ligne_SANDWICH_Fin=ligne_SANDWICH_Dep+nb_SANDWICHS-1; %22

% ACCOMPAGNEMENTS
ligne_ACCOMPAGNEMENT_Dep=23;
ligne_ACCOMPAGNEMENT=23;
ligne_ACCOMPAGNEMENT_Fin=ligne_ACCOMPAGNEMENT_Dep+nb_ACCOMPAGNEMENTS-1; %29

% Moyennes BOISSONS
ligne_moyenne_BOISSON_Dep=30;
ligne_moyenne_BOISSON=30;
ligne_moyenne_BOISSON_Fin=ligne_moyenne_BOISSON_Dep+nb_moyennes_BOISSONS-1; %38

% Petites BOISSONS
ligne_petite_BOISSON_Dep=39;
ligne_petite_BOISSON=39;
ligne_petite_BOISSON_Fin=ligne_petite_BOISSON_Dep+nb_petites_BOISSONS-1; %46

% SALADES
ligne_SALADE_Dep=47;
ligne_SALADE=47;
ligne_SALADE_Fin=ligne_SALADE_Dep+nb_SALADES-1; %49

% DESSSERTS
ligne_DESSERT_Dep=50;
ligne_DESSERT=50;
ligne_DESSERT_Fin=ligne_DESSERT_Dep+nb_DESSERTS-1; %76

% PETIT DEJEUNER
ligne_PETIT_DEJEUNER_Dep=77;
ligne_PETIT_DEJEUNER=77;
ligne_PETIT_DEJEUNER_Fin=ligne_PETIT_DEJEUNER_Dep+nb_PETIT_DEJEUNER-1; %95


% Soit Vecteurs_AN un vecteur qui contient la somme des apports
% nutritionnels par constituant (Energie, Matières grasses, Glucides...)

% Soit colonne_Femme la colonne des ANC des femmes dans la variable ANC
colonne_Femme = 1;

% Soit colonne_Homme la colonne des ANC des hommes dans la variable ANC
colonne_Homme = 2;

% Soit colonne_Enfant la colonne des ANC des enfants dans la variable ANC
colonne_Enfant = 3;

colonne_feuille_ANC = colonne_Enfant; % Pour changer le sexe.

%% Nombre de menus différents que l'on peut composer.

nb_menus=23*7*9; %1449 menus différents possibles en considérant les Chicken nuggets (20 morceaux)

nb_menus=nb_SANDWICHS*nb_ACCOMPAGNEMENTS*nb_moyennes_BOISSONS; %1386 menus différents possibles sans les Chicken nuggets (20 morceaux)


%% Le test de combinaisons
[n p]=size(X);
boolean=true; % boolean qui permet de ne pas réafficher les éléments qui composent un menu si plusieurs éléments dépassent les ANC
nb_condition_utilisee=0; % permet de voir si on est déjà entré dans une condition

Matrice_Exces_AN= [0 0 0 0 0 0 0 0];
Vecteur_exces=[0 0 0 0 0 0 0 0]; % vecteurs de huit zéros car car 8 variables (Energie, Matière grasse...)

disp(['Pour un(e) ', Genre(colonne_feuille_ANC).name])
while ((ligne_SANDWICH <= ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT <= ligne_ACCOMPAGNEMENT_Fin) && (ligne_moyenne_BOISSON <= ligne_moyenne_BOISSON_Fin))
            %nb_combinaisons_menus <= nb_menus  %PROBLEME 5555555555555555555555555555555555555555
        for count = 1:p;
            Vecteurs_AN(count) = X(ligne_SANDWICH, count)+X(ligne_ACCOMPAGNEMENT, count)+X(ligne_moyenne_BOISSON, count);
        end
        
        for count = 1:p;
         
            if Vecteurs_AN(count) > ANC(count, colonne_feuille_ANC)
                if boolean == true
                    disp([Menu_legende(ligne_SANDWICH).name, '/', Menu_legende(ligne_ACCOMPAGNEMENT).name, '/', Menu_legende(ligne_moyenne_BOISSON).name]);
                    boolean=false;                                         
                end
                    
                    Vecteur_exces(count)=Vecteurs_AN(count)-ANC(count, colonne_feuille_ANC);
                    
                    if count == 1 % cette condtion permet juste de mettre la bonne unité kcal
                    disp(['Excédent de ', AN(count).name, ' de ', num2str(Vecteur_exces(count), 3), 'kcal'])
                    end
                    
                    if count > 1 % cette condtion permet juste de mettre la bonne unité g
                    disp(['Excédent de ', AN(count).name, ' de ', num2str(Vecteur_exces(count), 3), 'g'])
                    end
            end
            
        end        
           
        if boolean == false % si le menu respecte pas au moins un apport nutritionnel journalier
           disp(' ')
           Matrice_Exces_AN=[Matrice_Exces_AN ; Vecteur_exces];
           boolean=true;
        end
        
             
        nb_combinaisons_menus=nb_combinaisons_menus+1;
        Vecteur_exces=[0 0 0 0 0 0 0 0];
        
        if ((ligne_SANDWICH == ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_moyenne_BOISSON == ligne_moyenne_BOISSON_Fin))
            ligne_SANDWICH=ligne_SANDWICH+1; % pour sortir de la boucle
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_moyenne_BOISSON == ligne_moyenne_BOISSON_Fin) && (nb_condition_utilisee==0))
            ligne_moyenne_BOISSON=ligne_moyenne_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT_Dep;
            ligne_SANDWICH=ligne_SANDWICH+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_moyenne_BOISSON == ligne_moyenne_BOISSON_Fin) && (nb_condition_utilisee==0))
            ligne_moyenne_BOISSON=ligne_moyenne_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_moyenne_BOISSON < ligne_moyenne_BOISSON_Fin) && (nb_condition_utilisee==0))
            ligne_moyenne_BOISSON=ligne_moyenne_BOISSON+1;
        end
        nb_condition_utilisee=0;
end

Matrice_Exces_AN(1,:)=[];
[n, p] = size(Matrice_Exces_AN);

if n == 1
    disp([int2str(n), ' menu ne respecte pas les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
end

if n > 1
    disp([int2str(n), ' menus ne respectent pas les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
end

%% Menu 2 : Sandwich/Accompagnement/Boisson (format moyen)/Salade
%% Initialisation
nb_combinaisons_menus=0;

% SANDWICHS
ligne_SANDWICH_Dep=1;
ligne_SANDWICH=1;
ligne_SANDWICH_Fin=ligne_SANDWICH_Dep+nb_SANDWICHS-1; %22

% ACCOMPAGNEMENTS
ligne_ACCOMPAGNEMENT_Dep=23;
ligne_ACCOMPAGNEMENT=23;
ligne_ACCOMPAGNEMENT_Fin=ligne_ACCOMPAGNEMENT_Dep+nb_ACCOMPAGNEMENTS-1; %29

% Moyennes BOISSONS
ligne_moyenne_BOISSON_Dep=30;
ligne_moyenne_BOISSON=30;
ligne_moyenne_BOISSON_Fin=ligne_moyenne_BOISSON_Dep+nb_moyennes_BOISSONS-1; %38

% Petites BOISSONS
ligne_petite_BOISSON_Dep=39;
ligne_petite_BOISSON=39;
ligne_petite_BOISSON_Fin=ligne_petite_BOISSON_Dep+nb_petites_BOISSONS-1; %46

% SALADES
ligne_SALADE_Dep=47;
ligne_SALADE=47;
ligne_SALADE_Fin=ligne_SALADE_Dep+nb_SALADES-1; %49

% DESSSERTS
ligne_DESSERT_Dep=50;
ligne_DESSERT=50;
ligne_DESSERT_Fin=ligne_DESSERT_Dep+nb_DESSERTS-1; %76

% PETIT DEJEUNER
ligne_PETIT_DEJEUNER_Dep=77;
ligne_PETIT_DEJEUNER=77;
ligne_PETIT_DEJEUNER_Fin=ligne_PETIT_DEJEUNER_Dep+nb_PETIT_DEJEUNER-1; %95


% Soit Vecteurs_AN un vecteur qui contient la somme des apports
% nutritionnels par constituant (Energie, Matières grasses, Glucides...)

% Soit colonne_Femme la colonne des ANC des femmes dans la variable ANC
colonne_Femme = 1;

% Soit colonne_Homme la colonne des ANC des hommes dans la variable ANC
colonne_Homme = 2;

% Soit colonne_Enfant la colonne des ANC des enfants dans la variable ANC
colonne_Enfant = 3;

colonne_feuille_ANC = colonne_Enfant; % Pour changer le sexe.

%% Nombre de menus différents que l'on peut composer.

nb_menus=23*7*9*3; %4347 menus différents possibles en considérant les Chicken nuggets (20 morceaux)

nb_menus=nb_SANDWICHS*nb_ACCOMPAGNEMENTS*nb_moyennes_BOISSONS*nb_SALADES; %4158 menus différents possibles sans les Chicken nuggets (20 morceaux)

%% Le test de combinaisons

[n p]=size(X);
boolean=true; % boolean qui permet de ne pas réafficher les éléments qui composent un menu si plusieurs éléments dépassent les ANC
nb_condition_utilisee=0; % permet de voir si on est déjà entré dans une condition

Matrice_Exces_AN= [0 0 0 0 0 0 0 0];
Vecteur_exces=[0 0 0 0 0 0 0 0]; % vecteurs de huit zéros car 8 variables (Energie, Matière grasse...)

Matrice_Respect_AN= [0 0 0 0 0 0 0 0]; % Matrice qui donne de combien le menu respecte les AN
Vecteur_respect=[0 0 0 0 0 0 0 0];

Matrice_Indice_Ligne_Respect_AN= [0 0 0 0]; 
Vecteur_Indice_Ligne_Respect_AN= [0 0 0 0]; %vecteurs de quatre zéros car 4 aliments composent le menu (SANDWICH/ACCOMPAGNEMENT/Moyenne_BOISSON/SALAD)

disp(['Pour un(e) ', Genre(colonne_feuille_ANC).name])
while ((ligne_SANDWICH <= ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT <= ligne_ACCOMPAGNEMENT_Fin) && (ligne_moyenne_BOISSON <= ligne_moyenne_BOISSON_Fin) && (ligne_SALADE <= ligne_SALADE_Fin))

        for count = 1:p;
            Vecteurs_AN(count) = X(ligne_SANDWICH, count)+X(ligne_ACCOMPAGNEMENT, count)+X(ligne_moyenne_BOISSON, count)+X(ligne_SALADE, count);
        end
        
        for count = 1:p;
         
            if Vecteurs_AN(count) > ANC(count, colonne_feuille_ANC)
                if boolean == true
                    disp([Menu_legende(ligne_SANDWICH).name, '/', Menu_legende(ligne_ACCOMPAGNEMENT).name, '/', Menu_legende(ligne_moyenne_BOISSON).name, '/', Menu_legende(ligne_SALADE).name]);
                    boolean=false;                                         
                end
                    
                    Vecteur_exces(count)=Vecteurs_AN(count)-ANC(count, colonne_feuille_ANC);
                    
                    if count == 1 % cette condtion permet juste de mettre la bonne unité kcal
                    disp(['Excédent de ', AN(count).name, ' de ', num2str(Vecteur_exces(count), 3), 'kcal'])
                    end
                    
                    if count > 1 % cette condtion permet juste de mettre la bonne unité g
                    disp(['Excédent de ', AN(count).name, ' de ', num2str(Vecteur_exces(count), 3), 'g'])
                    end
            end
            
        end
        
        if boolean == false % si le menu respecte pas au moins un apport nutritionnel journalier
           disp(' ')
           Matrice_Exces_AN=[Matrice_Exces_AN ; Vecteur_exces];
           boolean=true;
        end
        
        
        if Vecteurs_AN' <= ANC(:, colonne_feuille_ANC)
           Vecteur_Indice_Ligne_Respect_AN=[ligne_SANDWICH, ligne_ACCOMPAGNEMENT, ligne_moyenne_BOISSON, ligne_SALADE];
           Matrice_Indice_Ligne_Respect_AN=[Matrice_Indice_Ligne_Respect_AN ; Vecteur_Indice_Ligne_Respect_AN];
               
           Vecteur_respect=ANC(:, colonne_feuille_ANC)'-Vecteurs_AN;
           Matrice_Respect_AN=[Matrice_Respect_AN ; Vecteur_respect];
        end            
                
                    
        nb_combinaisons_menus=nb_combinaisons_menus+1;
        Vecteur_exces=[0 0 0 0 0 0 0 0];
        
        if ((ligne_SANDWICH == ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_moyenne_BOISSON == ligne_moyenne_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin))
            ligne_SANDWICH=ligne_SANDWICH+1; % pour sortir de la boucle
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_moyenne_BOISSON == ligne_moyenne_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (nb_condition_utilisee==0))
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_moyenne_BOISSON=ligne_moyenne_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT_Dep;
            ligne_SANDWICH=ligne_SANDWICH+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_moyenne_BOISSON == ligne_moyenne_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (nb_condition_utilisee==0))
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_moyenne_BOISSON=ligne_moyenne_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_SALADE == ligne_SALADE_Fin) && (nb_condition_utilisee==0))
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_moyenne_BOISSON=ligne_moyenne_BOISSON+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_SALADE < ligne_SALADE_Fin)  && (nb_condition_utilisee==0))
            ligne_SALADE=ligne_SALADE+1;
        end
        nb_condition_utilisee=0;
end

Matrice_Exces_AN(1,:)=[];
[n, p] = size(Matrice_Exces_AN);

if n == 1
    disp([int2str(n), ' menu ne respecte pas les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
end

if n > 1
    disp([int2str(n), ' menus ne respectent pas les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
end


Matrice_Respect_AN(1,:)=[];
Matrice_Indice_Ligne_Respect_AN(1,:)=[];
[n, p] = size(Matrice_Indice_Ligne_Respect_AN);

if n <= 10
    disp(' ')
    if n == 1
        disp([int2str(n), ' menu respecte les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
    end

    if n > 1
        disp([int2str(n), ' menus respectent les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
    end

    for ligne_MILRAN = 1:n; % MILRAN = Matrice_Indice_Ligne_Respect_AN;
        disp([Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,1)).name, '/', Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,2)).name, '/', Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,3)).name, '/', Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,4)).name]);
        disp(Matrice_Respect_AN(ligne_MILRAN,:)')
    end
end

%% Menu 3 : SANDWICH/ACCOMPAGNEMENT/Moyenne_BOISSON/Dessert
%% Initialisation
nb_combinaisons_menus=0;

% SANDWICHS
ligne_SANDWICH_Dep=1;
ligne_SANDWICH=1;
ligne_SANDWICH_Fin=ligne_SANDWICH_Dep+nb_SANDWICHS-1; %22

% ACCOMPAGNEMENTS
ligne_ACCOMPAGNEMENT_Dep=23;
ligne_ACCOMPAGNEMENT=23;
ligne_ACCOMPAGNEMENT_Fin=ligne_ACCOMPAGNEMENT_Dep+nb_ACCOMPAGNEMENTS-1; %29

% Moyennes BOISSONS
ligne_moyenne_BOISSON_Dep=30;
ligne_moyenne_BOISSON=30;
ligne_moyenne_BOISSON_Fin=ligne_moyenne_BOISSON_Dep+nb_moyennes_BOISSONS-1; %38

% Petites BOISSONS
ligne_petite_BOISSON_Dep=39;
ligne_petite_BOISSON=39;
ligne_petite_BOISSON_Fin=ligne_petite_BOISSON_Dep+nb_petites_BOISSONS-1; %46

% SALADES
ligne_SALADE_Dep=47;
ligne_SALADE=47;
ligne_SALADE_Fin=ligne_SALADE_Dep+nb_SALADES-1; %49

% DESSSERTS
ligne_DESSERT_Dep=50;
ligne_DESSERT=50;
ligne_DESSERT_Fin=ligne_DESSERT_Dep+nb_DESSERTS-1; %76

% PETIT DEJEUNER
ligne_PETIT_DEJEUNER_Dep=77;
ligne_PETIT_DEJEUNER=77;
ligne_PETIT_DEJEUNER_Fin=ligne_PETIT_DEJEUNER_Dep+nb_PETIT_DEJEUNER-1; %95


% Soit Vecteurs_AN un vecteur qui contient la somme des apports
% nutritionnels par constituant (Energie, Matières grasses, Glucides...)

% Soit colonne_Femme la colonne des ANC des femmes dans la variable ANC
colonne_Femme = 1;

% Soit colonne_Homme la colonne des ANC des hommes dans la variable ANC
colonne_Homme = 2;

% Soit colonne_Enfant la colonne des ANC des enfants dans la variable ANC
colonne_Enfant = 3;

colonne_feuille_ANC = colonne_Enfant; % Pour changer le sexe.


%% Nombre de menus différents que l'on peut composer.

nb_menus=23*7*9*27; % 39123 menus différents possibles en considérant les Chicken nuggets (20 morceaux)

nb_menus=nb_SANDWICHS*nb_ACCOMPAGNEMENTS*nb_moyennes_BOISSONS*nb_DESSERTS; % 37422 menus différents possibles sans les Chicken nuggets (20 morceaux)

%% Le test de combinaisons

[n p]=size(X);
boolean=true; % boolean qui permet de ne pas réafficher les éléments qui composent un menu si plusieurs éléments dépassent les ANC
nb_condition_utilisee=0; % permet de voir si on est déjà entré dans une condition

Matrice_Exces_AN= [0 0 0 0 0 0 0 0];
Vecteur_exces=[0 0 0 0 0 0 0 0]; % vecteurs de huit zéros car 8 variables (Energie, Matière grasse...)

Matrice_Respect_AN= [0 0 0 0 0 0 0 0]; % Matrice qui donne de combien le menu respecte les AN
Vecteur_respect=[0 0 0 0 0 0 0 0];

Matrice_Indice_Ligne_Respect_AN= [0 0 0 0]; 
Vecteur_Indice_Ligne_Respect_AN= [0 0 0 0]; %vecteurs de quatre zéros car 4 aliments composent le menu (SANDWICH/ACCOMPAGNEMENT/Moyenne_BOISSON/SALAD)

disp(['Pour un(e) ', Genre(colonne_feuille_ANC).name])
while ((ligne_SANDWICH <= ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT <= ligne_ACCOMPAGNEMENT_Fin) && (ligne_moyenne_BOISSON <= ligne_moyenne_BOISSON_Fin) && (ligne_DESSERT <= ligne_DESSERT_Fin))

        for count = 1:p;
            Vecteurs_AN(count) = X(ligne_SANDWICH, count)+X(ligne_ACCOMPAGNEMENT, count)+X(ligne_moyenne_BOISSON, count)+X(ligne_DESSERT, count);
        end
        
        for count = 1:p;
         
            if Vecteurs_AN(count) > ANC(count, colonne_feuille_ANC)
                if boolean == true
                    %disp([Menu_legende(ligne_SANDWICH).name, '/', Menu_legende(ligne_ACCOMPAGNEMENT).name, '/', Menu_legende(ligne_moyenne_BOISSON).name, '/', Menu_legende(ligne_DESSERT).name]);
                    boolean=false;                                         
                end
                    
                    Vecteur_exces(count)=Vecteurs_AN(count)-ANC(count, colonne_feuille_ANC);
                    
                    %if count == 1 % cette condtion permet juste de mettre la bonne unité kcal
                    %disp(['Excédent de ', AN(count).name, ' de ', num2str(Vecteur_exces(count), 3), 'kcal'])
                    %end
                    
                    %if count > 1 % cette condtion permet juste de mettre la bonne unité g
                    %disp(['Excédent de ', AN(count).name, ' de ', num2str(Vecteur_exces(count), 3), 'g'])
                    %end
            end
            
        end
        
        if boolean == false % si le menu respecte pas au moins un apport nutritionnel journalier
           %disp(' ')
           Matrice_Exces_AN=[Matrice_Exces_AN ; Vecteur_exces];
           boolean=true;
        end
        
        
        if Vecteurs_AN' <= ANC(:, colonne_feuille_ANC)
           Vecteur_Indice_Ligne_Respect_AN=[ligne_SANDWICH, ligne_ACCOMPAGNEMENT, ligne_moyenne_BOISSON, ligne_DESSERT];
           Matrice_Indice_Ligne_Respect_AN=[Matrice_Indice_Ligne_Respect_AN ; Vecteur_Indice_Ligne_Respect_AN];
               
           Vecteur_respect=ANC(:, colonne_feuille_ANC)'-Vecteurs_AN;
           Matrice_Respect_AN=[Matrice_Respect_AN ; Vecteur_respect];
        end            
                
                    
        nb_combinaisons_menus=nb_combinaisons_menus+1;
        Vecteur_exces=[0 0 0 0 0 0 0 0];
        
        if ((ligne_SANDWICH == ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_moyenne_BOISSON == ligne_moyenne_BOISSON_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin))
            ligne_SANDWICH=ligne_SANDWICH+1; % pour sortir de la boucle
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_moyenne_BOISSON == ligne_moyenne_BOISSON_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin) && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_moyenne_BOISSON=ligne_moyenne_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT_Dep;
            ligne_SANDWICH=ligne_SANDWICH+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_moyenne_BOISSON == ligne_moyenne_BOISSON_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin) && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_moyenne_BOISSON=ligne_moyenne_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_DESSERT == ligne_DESSERT_Fin) && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_moyenne_BOISSON=ligne_moyenne_BOISSON+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_DESSERT < ligne_DESSERT_Fin)  && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT+1;
        end
        nb_condition_utilisee=0;
end

Matrice_Exces_AN(1,:)=[];
[n, p] = size(Matrice_Exces_AN);

if n == 1
    disp([int2str(n), ' menu ne respecte pas les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
end

if n > 1
    disp([int2str(n), ' menus ne respectent pas les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
end


Matrice_Respect_AN(1,:)=[];
Matrice_Indice_Ligne_Respect_AN(1,:)=[];
[n, p] = size(Matrice_Indice_Ligne_Respect_AN);

if n <= 10
    disp(' ')
    if n == 1
        disp([int2str(n), ' menu respecte les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
    end

    if n > 1
        disp([int2str(n), ' menus respectent les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
    end

    %for ligne_MILRAN = 1:n; % MILRAN = Matrice_Indice_Ligne_Respect_AN;
        %disp([Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,1)).name, '/', Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,2)).name, '/', Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,3)).name, '/', Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,4)).name]);
        %disp(Matrice_Respect_AN(ligne_MILRAN,:)')
    %end
end

%% Menu 4 : Sandwich/Accompagnement/Boisson (format moyen)/Salade/Dessert Version Courte
%% Initialisation

nb_combinaisons_menus=0;

% SANDWICHS
ligne_SANDWICH_Dep=1;
ligne_SANDWICH=1;
ligne_SANDWICH_Fin=ligne_SANDWICH_Dep+nb_SANDWICHS-1; %22

% ACCOMPAGNEMENTS
ligne_ACCOMPAGNEMENT_Dep=23;
ligne_ACCOMPAGNEMENT=23;
ligne_ACCOMPAGNEMENT_Fin=ligne_ACCOMPAGNEMENT_Dep+nb_ACCOMPAGNEMENTS-1; %29

% Moyennes BOISSONS
ligne_moyenne_BOISSON_Dep=30;
ligne_moyenne_BOISSON=30;
ligne_moyenne_BOISSON_Fin=ligne_moyenne_BOISSON_Dep+nb_moyennes_BOISSONS-1; %38

% Petites BOISSONS
ligne_petite_BOISSON_Dep=39;
ligne_petite_BOISSON=39;
ligne_petite_BOISSON_Fin=ligne_petite_BOISSON_Dep+nb_petites_BOISSONS-1; %46

% SALADES
ligne_SALADE_Dep=47;
ligne_SALADE=47;
ligne_SALADE_Fin=ligne_SALADE_Dep+nb_SALADES-1; %49

% DESSSERTS
ligne_DESSERT_Dep=50;
ligne_DESSERT=50;
ligne_DESSERT_Fin=ligne_DESSERT_Dep+nb_DESSERTS-1; %76

% PETIT DEJEUNER
ligne_PETIT_DEJEUNER_Dep=77;
ligne_PETIT_DEJEUNER=77;
ligne_PETIT_DEJEUNER_Fin=ligne_PETIT_DEJEUNER_Dep+nb_PETIT_DEJEUNER-1; %95


% Soit Vecteurs_AN un vecteur qui contient la somme des apports
% nutritionnels par constituant (Energie, Matières grasses, Glucides...)

% Soit colonne_Femme la colonne des ANC des femmes dans la variable ANC
colonne_Femme = 1;

% Soit colonne_Homme la colonne des ANC des hommes dans la variable ANC
colonne_Homme = 2;

% Soit colonne_Enfant la colonne des ANC des enfants dans la variable ANC
colonne_Enfant = 3;

colonne_feuille_ANC = colonne_Enfant; % Pour changer le sexe.

%% Nombre de menus différents que l'on peut composer.

nb_menus=23*7*9*3*27; %117369 menus différents possibles en considérant les Chicken nuggets (20 morceaux)

nb_menus=nb_SANDWICHS*nb_ACCOMPAGNEMENTS*nb_moyennes_BOISSONS*nb_SALADES*nb_DESSERTS; %112266 menus différents possibles sans les Chicken nuggets (20 morceaux)

%% Le test de combinaisons Version Courte

[n p]=size(X);

bool=true;
nb_condition_utilisee=0; % permet de voir si on est déjà entré dans une condition

count_Exces_AN=0;
count_Respect_AN=0;

disp(['Pour un(e) ', Genre(colonne_feuille_ANC).name])
while ((ligne_SANDWICH <= ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT <= ligne_ACCOMPAGNEMENT_Fin) && (ligne_moyenne_BOISSON <= ligne_moyenne_BOISSON_Fin) && (ligne_SALADE <= ligne_SALADE_Fin) && (ligne_DESSERT <= ligne_DESSERT_Fin))

        for count = 1:p;
            Vecteurs_AN(count) = X(ligne_SANDWICH, count)+X(ligne_ACCOMPAGNEMENT, count)+X(ligne_moyenne_BOISSON, count)+X(ligne_SALADE, count)+X(ligne_DESSERT, count);
        end
        
        count = 1;
        while  ((bool == true) && (count<=p))
            if Vecteurs_AN(count) > ANC(count, colonne_feuille_ANC)
                    count_Exces_AN=count_Exces_AN+1;
                    bool=false;                                         
            
            end
            count=count+1;
        end
        bool=true;
        
        if Vecteurs_AN' > ANC(:, colonne_feuille_ANC)
           count_Exces_AN=count_Exces_AN+1;
        end
       
        if Vecteurs_AN' <= ANC(:, colonne_feuille_ANC)
           count_Respect_AN=count_Respect_AN+1;
        end            
                
                    
        nb_combinaisons_menus=nb_combinaisons_menus+1;
        
        if ((ligne_SANDWICH == ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_moyenne_BOISSON == ligne_moyenne_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin))
            ligne_SANDWICH=ligne_SANDWICH+1; % pour sortir de la boucle
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_moyenne_BOISSON == ligne_moyenne_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (nb_condition_utilisee==0) && (ligne_DESSERT == ligne_DESSERT_Fin))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_moyenne_BOISSON=ligne_moyenne_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT_Dep;
            ligne_SANDWICH=ligne_SANDWICH+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_moyenne_BOISSON == ligne_moyenne_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin) && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_moyenne_BOISSON=ligne_moyenne_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_SALADE == ligne_SALADE_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin) && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_moyenne_BOISSON=ligne_moyenne_BOISSON+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_DESSERT == ligne_DESSERT_Fin)  && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_SALADE=ligne_SALADE+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_DESSERT < ligne_DESSERT_Fin)  && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT+1;
        end
        nb_condition_utilisee=0;
end

n=count_Exces_AN;

if n == 1
    disp([int2str(n), ' menu ne respecte pas les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
end

if n > 1
    disp([int2str(n), ' menus ne respectent pas les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
end

n=count_Respect_AN;
disp(' ')
if n == 1
    disp([int2str(n), ' menu respecte les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
end

if n > 1
    disp([int2str(n), ' menus respectent les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
end


%% Menu 4 : Sandwich/Accompagnement/Boisson (format moyen)/Salade/Dessert Version Longue (4 minutes)
%% Initialisation

nb_combinaisons_menus=0;

% SANDWICHS
ligne_SANDWICH_Dep=1;
ligne_SANDWICH=1;
ligne_SANDWICH_Fin=ligne_SANDWICH_Dep+nb_SANDWICHS-1; %22

% ACCOMPAGNEMENTS
ligne_ACCOMPAGNEMENT_Dep=23;
ligne_ACCOMPAGNEMENT=23;
ligne_ACCOMPAGNEMENT_Fin=ligne_ACCOMPAGNEMENT_Dep+nb_ACCOMPAGNEMENTS-1; %29

% Moyennes BOISSONS
ligne_moyenne_BOISSON_Dep=30;
ligne_moyenne_BOISSON=30;
ligne_moyenne_BOISSON_Fin=ligne_moyenne_BOISSON_Dep+nb_moyennes_BOISSONS-1; %38

% Petites BOISSONS
ligne_petite_BOISSON_Dep=39;
ligne_petite_BOISSON=39;
ligne_petite_BOISSON_Fin=ligne_petite_BOISSON_Dep+nb_petites_BOISSONS-1; %46

% SALADES
ligne_SALADE_Dep=47;
ligne_SALADE=47;
ligne_SALADE_Fin=ligne_SALADE_Dep+nb_SALADES-1; %49

% DESSSERTS
ligne_DESSERT_Dep=50;
ligne_DESSERT=50;
ligne_DESSERT_Fin=ligne_DESSERT_Dep+nb_DESSERTS-1; %76

% PETIT DEJEUNER
ligne_PETIT_DEJEUNER_Dep=77;
ligne_PETIT_DEJEUNER=77;
ligne_PETIT_DEJEUNER_Fin=ligne_PETIT_DEJEUNER_Dep+nb_PETIT_DEJEUNER-1; %95


% Soit Vecteurs_AN un vecteur qui contient la somme des apports
% nutritionnels par constituant (Energie, Matières grasses, Glucides...)

% Soit colonne_Femme la colonne des ANC des femmes dans la variable ANC
colonne_Femme = 1;

% Soit colonne_Homme la colonne des ANC des hommes dans la variable ANC
colonne_Homme = 2;

% Soit colonne_Enfant la colonne des ANC des enfants dans la variable ANC
colonne_Enfant = 3;

colonne_feuille_ANC = colonne_Enfant; % Pour changer le sexe.

%% Nombre de menus différents que l'on peut composer.

nb_menus=23*7*9*3*27; %117369 menus différents possibles en considérant les Chicken nuggets (20 morceaux)

nb_menus=nb_SANDWICHS*nb_ACCOMPAGNEMENTS*nb_moyennes_BOISSONS*nb_SALADES*nb_DESSERTS; %112266 menus différents possibles sans les Chicken nuggets (20 morceaux)

%% Le test de combinaisons Version Longue (4 minutes)

[n p]=size(X);
boolean=true; % boolean qui permet de ne pas réafficher les éléments qui composent un menu si plusieurs éléments dépassent les ANC
nb_condition_utilisee=0; % permet de voir si on est déjà entré dans une condition

Matrice_Exces_AN= [0 0 0 0 0 0 0 0];
Vecteur_exces=[0 0 0 0 0 0 0 0]; % vecteurs de huit zéros car 8 variables (Energie, Matière grasse...)

Matrice_Respect_AN= [0 0 0 0 0 0 0 0]; % Matrice qui donne de combien le menu respecte les AN
Vecteur_respect=[0 0 0 0 0 0 0 0];

Matrice_Indice_Ligne_Respect_AN= [0 0 0 0 0]; 
Vecteur_Indice_Ligne_Respect_AN= [0 0 0 0 0]; %vecteurs de cinq zéros car 5 aliments composent le menu (SANDWICH/ACCOMPAGNEMENT/Moyenne_BOISSON/SALADE/DESSERT)

disp(['Pour un(e) ', Genre(colonne_feuille_ANC).name])
while ((ligne_SANDWICH <= ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT <= ligne_ACCOMPAGNEMENT_Fin) && (ligne_moyenne_BOISSON <= ligne_moyenne_BOISSON_Fin) && (ligne_SALADE <= ligne_SALADE_Fin) && (ligne_DESSERT <= ligne_DESSERT_Fin))

        for count = 1:p;
            Vecteurs_AN(count) = X(ligne_SANDWICH, count)+X(ligne_ACCOMPAGNEMENT, count)+X(ligne_moyenne_BOISSON, count)+X(ligne_SALADE, count)+X(ligne_DESSERT, count);
        end
        
        for count = 1:p;
         
            if Vecteurs_AN(count) > ANC(count, colonne_feuille_ANC)
                if boolean == true
                    %disp([Menu_legende(ligne_SANDWICH).name, '/', Menu_legende(ligne_ACCOMPAGNEMENT).name, '/', Menu_legende(ligne_moyenne_BOISSON).name, '/', Menu_legende(ligne_SALADE).name, '/', Menu_legende(ligne_DESSERT).name]);
                    boolean=false;                                         
                end
                    
                    Vecteur_exces(count)=Vecteurs_AN(count)-ANC(count, colonne_feuille_ANC);
                    
                    if count == 1 % cette condtion permet juste de mettre la bonne unité kcal
                    %disp(['Excédent de ', AN(count).name, ' de ', num2str(Vecteur_exces(count), 3), 'kcal'])
                    end
                    
                    if count > 1 % cette condtion permet juste de mettre la bonne unité g
                    %disp(['Excédent de ', AN(count).name, ' de ', num2str(Vecteur_exces(count), 3), 'g'])
                    end
            end
            
        end
        
        if boolean == false % si le menu respecte pas au moins un apport nutritionnel journalier
           %disp(' ')
           Matrice_Exces_AN=[Matrice_Exces_AN ; Vecteur_exces];
           boolean=true;
        end
        
        
        if Vecteurs_AN' <= ANC(:, colonne_feuille_ANC)
           Vecteur_Indice_Ligne_Respect_AN=[ligne_SANDWICH, ligne_ACCOMPAGNEMENT, ligne_moyenne_BOISSON, ligne_SALADE, ligne_DESSERT];
           Matrice_Indice_Ligne_Respect_AN=[Matrice_Indice_Ligne_Respect_AN ; Vecteur_Indice_Ligne_Respect_AN];
               
           Vecteur_respect=ANC(:, colonne_feuille_ANC)'-Vecteurs_AN;
           Matrice_Respect_AN=[Matrice_Respect_AN ; Vecteur_respect];
        end            
                
                    
        nb_combinaisons_menus=nb_combinaisons_menus+1;
        Vecteur_exces=[0 0 0 0 0 0 0 0];
        
        if ((ligne_SANDWICH == ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_moyenne_BOISSON == ligne_moyenne_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin))
            ligne_SANDWICH=ligne_SANDWICH+1; % pour sortir de la boucle
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_moyenne_BOISSON == ligne_moyenne_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (nb_condition_utilisee==0) && (ligne_DESSERT == ligne_DESSERT_Fin))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_moyenne_BOISSON=ligne_moyenne_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT_Dep;
            ligne_SANDWICH=ligne_SANDWICH+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_moyenne_BOISSON == ligne_moyenne_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin) && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_moyenne_BOISSON=ligne_moyenne_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_SALADE == ligne_SALADE_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin) && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_moyenne_BOISSON=ligne_moyenne_BOISSON+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_DESSERT == ligne_DESSERT_Fin)  && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_SALADE=ligne_SALADE+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_DESSERT < ligne_DESSERT_Fin)  && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT+1;
        end
        nb_condition_utilisee=0;
end

Matrice_Exces_AN(1,:)=[];
[n, p] = size(Matrice_Exces_AN);

if n == 1
    disp([int2str(n), ' menu ne respecte pas les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
end

if n > 1
    disp([int2str(n), ' menus ne respectent pas les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
end


Matrice_Respect_AN(1,:)=[];
Matrice_Indice_Ligne_Respect_AN(1,:)=[];
[n, p] = size(Matrice_Indice_Ligne_Respect_AN);

disp(' ')
if n == 1
    disp([int2str(n), ' menu respecte les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
end

if n > 1
    disp([int2str(n), ' menus respectent les Apports Nutritionnels Conseillés (ANC) d''un(e) ', Genre(colonne_feuille_ANC).name])
end

for ligne_MILRAN = 1:n; % MILRAN = Matrice_Indice_Ligne_Respect_AN;
	%disp([Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,1)).name, '/', Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,2)).name, '/', Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,3)).name, '/', Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,4)).name]);
    %disp(Matrice_Respect_AN(ligne_MILRAN,:)')
end

%% ACP feuille "Apports nutritionnels McDonalds"

%% Initialisation
keepvars = {'numero_figure', 'X_ACP', 'Menu_legende_ACP', 'AN'};

clearvars('-except', keepvars{:});

% Première étape de l'ACP : on centre et on réduit les données du tableau X.
X=X_ACP; % il y a Chicken McNuggets (20 morceaux)

% SANDWICHS
ligne_SANDWICH_Dep=1;
ligne_SANDWICH_Fin=23;

% ACCOMPAGNEMENTS
ligne_ACCOMPAGNEMENT_Dep=24;
ligne_ACCOMPAGNEMENT_Fin=30;

% Moyennes BOISSONS
ligne_moyenne_BOISSON_Dep=31;
ligne_moyenne_BOISSON_Fin=39;

% Petites BOISSONS
ligne_petite_BOISSON_Dep=40;
ligne_petite_BOISSON_Fin=47;

% SALADES
ligne_SALADE_Dep=48;
ligne_SALADE_Fin=50;

% DESSSERTS
ligne_DESSERT_Dep=51;
ligne_DESSERT_Fin=77;

% PETIT DEJEUNER
ligne_PETIT_DEJEUNER_Dep=78;
ligne_PETIT_DEJEUNER_Fin=96;

X=X(1:22,:); % Choix des lignes pour l'ACP

%% Matrice des corrélations

[n p]=size(X);
moyenne=sum(X)/n;
Xc=X-ones(n,1)*moyenne;

mean(Xc);
% mean(Xc) est un vecteur de 0 donc a bien centré les données.

covariance=cov(X)*(n-1)/n;
s=sqrt(diag(covariance))';
 
Xn=Xc./(ones(n,1)*s);

mean(Xn); %mean(Xn) est un vecteur de 0 donc a bien centré les données.
std(Xn); % on trouve bien un vecteur de 1 donc a bien réduit les données.

% La matrice des corrélations est :
Cr=Xn'*Xn/n;

% on vérifie le calcul en faisant :
Cr-corrcoef(Xn);
% on trouve bien une matrice de 0;

%% Deuxième étape de l'ACP : on détermine les valeurs et vecteurs propres :

[V L]=eig(Xn'*Xn)
% V et L sont bien des matrices carrées et L est une matrice diagonale.

%% Troisième étape de l'ACP : on projette les observations

% Les axes principaux (composantes principales) sont :
U=Xn*V;

%% On réarrange les colonnes
V = V(:,end:-1:1);
L = L(end:-1:1,end:-1:1);
U = U(:,end:-1:1);

%% Représentons les individus dans le plan des deux premiers facteurs principaux.

figure(numero_figure)
numero_figure=numero_figure+1;

plot(U(:,1),U(:,2),'o');

for i=1:n
text(U(i, 1),U(i, 2),[Menu_legende_ACP(i).name]); % il faut penser à ajouter un décalage dans Menu_legende_ACP selon l'ACP qu'on veut faire.
end

xlabel('axe 1');
ylabel('axe 2');
title('Représentation du nuage avec deux axes de l''ACP')

%% Représentons les variables dans le plan des deux premiers facteurs principaux.

Vn = V*sqrt(L)/sqrt(n);

figure(numero_figure)
numero_figure=numero_figure+1;

plot(Vn(:,1),Vn(:,2),'*');hold on
for i=1:p
text(Vn(i,1),Vn(i,2),['v' AN(i).name]);
end

a = 0:0.01:2*pi;
plot(cos(a),sin(a),':');hold off;
xlabel('axe 1');
ylabel('axe 2');
title('Représentation des variables avec deux axes de l''ACP')

%% Visualisons les autres axes
figure(numero_figure)
numero_figure=numero_figure+1;

subplot(2,2,1)
plot(U(:,1),U(:,2),'o');
xlabel('axe 1');
ylabel('axe 2');
title('Representation du nuage avec deux axes de l''ACP')
subplot(2,2,2)
plot(U(:,1),U(:,3),'o');
xlabel('axe 1');
ylabel('axe 3');
title('Representation du nuage avec deux axes de l''ACP')
subplot(2,2,3)
plot(U(:,2),U(:,3),'o');
xlabel('axe 2');
ylabel('axe 3');
title('Representation du nuage avec deux axes de l''ACP')
subplot(2,2,4)
plot(U(:,2),U(:,4),'o');
xlabel('axe 2');
ylabel('axe 4');
title('Representation du nuage avec deux axes de l''ACP')

%%
figure(numero_figure)
numero_figure=numero_figure+1;

subplot(2,2,1)
plot(Vn(:,1),Vn(:,2),'*');hold on
for i=1:p
text(Vn(i,1),Vn(i,2),['v' AN(i).name]);
end
a = 0:0.01:2*pi;
plot(cos(a),sin(a),':');hold off;
xlabel('axe 1');
ylabel('axe 2');
title('Représentation des variables avec deux axes de l''ACP')

subplot(2,2,2)
plot(Vn(:,1),Vn(:,3),'*');hold on
for i=1:p
text(Vn(i,1),Vn(i,3),['v' AN(i).name]);
end
plot(cos(a),sin(a),':');
xlabel('axe 1');
ylabel('axe 3');
title('Représentation des variables avec deux axes de l''ACP')
hold off;

subplot(2,2,3)
plot(Vn(:,2),Vn(:,3),'*');hold on
for i=1:p
text(Vn(i,2),Vn(i,3),['v' AN(i).name]);
end
plot(cos(a),sin(a),':');
xlabel('axe 2');
ylabel('axe 3');
title('Représentation des variables avec deux axes de l''ACP')
hold off;

subplot(2,2,4)
plot(Vn(:,2),Vn(:,4),'*');hold on
for i=1:p
text(Vn(i,2),Vn(i,4),['v' AN(i).name]);
end
plot(cos(a),sin(a),':');
xlabel('axe 2');
ylabel('axe 4');
title('Représentation des variables avec deux axes de l''ACP')
hold off;









%% Feuille "Etats US"
keepvars = {'numero_figure'};
clearvars('-except', keepvars{:});
clc

Etats = struct('name', {'Alabama', 'Alaska','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','Florida','Georgia','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Ohio','Oklahoma','Oregon','Pennsylvania','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virginia','Washington','West Virginia','Wisconsin','Wyoming','District of Columbia'});
Legende = struct('name', {'State','Total Population (2015)','Adult Population (2015)','Number of McDonald''s','Adult Obesitiy Rate','Adult Diabetes Rate','Adult Physical Inactivity Rate','Adult Hypertension Rate','Per Capita Personal Income (in $)'});
Etats_Abreviation = struct('name', {'AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY', 'DC'});
Etats_ET_Abreviation = struct('name', {'Alabama (AL)', 'Alaska (AK)', 'Arizona (AZ)', 'Arkansas (AR)', 'California (CA)', 'Colorado (CO)', 'Connecticut (CT)', 'Delaware (DE)', 'Florida (FL)', 'Georgia (GA)', 'Hawaii (HI)', 'Idaho (ID)', 'Illinois (IL)', 'Indiana (IN)', 'Iowa (IA)', 'Kansas (KS)', 'Kentucky (KY)', 'Louisiana (LA)', 'Maine (ME)', 'Maryland (MD)', 'Massachusetts (MA)', 'Michigan (MI)', 'Minnesota (MN)', 'Mississippi (MS)', 'Missouri (MO)', 'Montana (MT)', 'Nebraska (NE)', 'Nevada (NV)', 'New Hampshire (NH)', 'New Jersey (NJ)', 'New Mexico (NM)', 'New York (NY)', 'North Carolina (NC)', 'North Dakota (ND)', 'Ohio (OH)', 'Oklahoma (OK)', 'Oregon (OR)', 'Pennsylvania (PA)', 'Rhode Island (RI)', 'South Carolina (SC)', 'South Dakota (SD)', 'Tennessee (TN)', 'Texas (TX)', 'Utah (UT)', 'Vermont (VT)', 'Virginia (VA)', 'Washington (WA)', 'West Virginia (WV)', 'Wisconsin (WI)', 'Wyoming (WY)', 'District of Columbia (DC)'});

feuille_Etats=xlsread('ProjetM8', 'Etats US');

Popolation_US=sum(feuille_Etats(:,1));
% Il y avait 321418820 habitants aux Etats_Unis en 2015.

Etats_ACP_Etats_Aberrante_En_Moins = struct('name', {'Alabama', 'Alaska','Arizona','Arkansas','Colorado','Connecticut','Delaware','Georgia','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','North Carolina','North Dakota','Ohio','Oklahoma','Oregon','Pennsylvania','Rhode Island','South Carolina','South Dakota','Tennessee','Utah','Vermont','Virginia','Washington','West Virginia','Wisconsin','Wyoming','District of Columbia'});
Legende_ACP = struct('name', {'Number of McDonald''s','Adult Obesitiy','Adult Diabetes','Adult Physical Inactivity','Adult Hypertension'});

% Comme les colonnes "Adult Obesitiy Rate", "Adult Diabetes Rate", "Adult
% Physical Inactivity Rate" et "Adult Hypertension Rate" sont des taux
% par Etat, on multiplie donc ces colonnes par le nombre
% d'adultes par Etat avant de faire l'ACP.

colonne_Adult_Obesitiy_Rate = 4;
colonne_Adult_Diabetes_Rate = 5;
colonne_Adult_Physical_Inactivity_Rate = 6;
colonne_Adult_Hypertension_Rate = 7;

X=[feuille_Etats(:,2).*feuille_Etats(:,colonne_Adult_Obesitiy_Rate), feuille_Etats(:,2).*feuille_Etats(:,colonne_Adult_Diabetes_Rate), feuille_Etats(:,2).*feuille_Etats(:,colonne_Adult_Physical_Inactivity_Rate), feuille_Etats(:,2).*feuille_Etats(:,colonne_Adult_Hypertension_Rate)];



%% Boîte à moustache
x=feuille_Etats(:,2); % feuille_Etats(:,2) correspond à la population adulte par Etat
figure(numero_figure)
numero_figure=numero_figure+1;
boxplot(x)
grid on
% On observe 4 valeurs aberrantes.
moy=mean(x)

%% On créer une nouvelle matrice
X_imagesc=[feuille_Etats(:,3), X]; % feuille_Etats(:,3) correspond au nombre de McDonalds par Etat
X_carte=X_imagesc;

%% On retire les valeurs aberrantes
I=find(x==max(x))
x(I)=[];
X_imagesc(I,:)=[];

I=find(x==max(x))
x(I)=[];
X_imagesc(I,:)=[];

I=find(x==max(x))
x(I)=[];
X_imagesc(I,:)=[];

I=find(x==max(x))
x(I)=[];
X_imagesc(I,:)=[];

%% On vérifie que les valeur aberrantes on bien été retirée.
boxplot(x)
grid on

%% Matrice des corrélation

[n p]=size(X_imagesc);

moyenne=sum(X_imagesc)/n;
% Calculons la matrice de variance covariance

% Centrons les données
Xc=X_imagesc-ones(n,1)*moyenne;
mean(Xc);
% mean(Xc) est un vecteur de 0 donc a bien centré les données.

% Matrice de variance covariance.
Matrice_covariance=cov(X_imagesc)*(n-1)/n;

% Réduisons les données.
s=sqrt(diag(Matrice_covariance))';
Xn=Xc./(ones(n,1)*s);

mean(Xn); %mean(Xn) est un vecteur de 0 donc a bien centré les données.
std(Xn); % on trouve bien un vecteur de 1 donc a bien réduit les données.

% Matrice de corrélation des données;
Cr = Xn'*Xn/n;

figure(numero_figure)
numero_figure=numero_figure+1;

imagesc(Cr);
colorbar;

set(gca, 'XTickLabel', {'', 'Nombre de McDonalds', '', 'Adultes obèses', '', 'Adultes diabétiques', '', 'Inactivité physique adulte', '', 'Hypertension adulte'});
set(gca, 'YTickLabel', {'', 'Nombre de McDonalds', '', 'Adultes obèses', '', 'Adultes diabétiques', '', 'Inactivité physique adulte', '', 'Hypertension adulte'});
set(gca, 'xaxislocation', 'top');

%figure(numero_figure)
numero_figure=numero_figure+1;
% my_multiplot(Xn); NE FONCTIONNE PAS

%% Régression linéaire

% Modèle de régression :
% y i = ax i + b + e_i     i = 1, n

for i= 1:size(X_imagesc, 2)
    y=X_imagesc(:,i);
    
    for j= 1:size(X_imagesc, 2)
        x=X_imagesc(:,j);


        X = [x ones(n,1)];
        a = (X'*X)\(X'*y);
        e = y - X*a;
        s2 = e'*e/(n-2);
        
        % Visualiser les résidus
        if ((i==2) && (j==4))
        figure(numero_figure)
        plot(x,e,'o');
        %title('Résidus de la régression Adultes obèses_i = a*Inactivité physique chez les adultes_i  + b + e_i')
        
        numero_figure=numero_figure+1;
        end

        
        %Diagnostiques de la régression :
        % Somme des carrés totaux
            SCT = sum((y-mean(y)).^2);
            % Somme des carrés des résidus
            SCR = e'*e;
            % Somme des carrés de la partie expliquée du modèle
            SCM = sum((X*a-mean(y)).^2);

            % Qualité de la régression :
            R2 = 1 - SCR/SCT;
            
            Vecteur_R2(i, j)=R2;

        % Test de Student
        % Test d'indépendance :
        % H0 : les variables sont indépendantes
        % H1 : les variables ne sont pas indépendantes

        mx = mean(x);
        s2x = (x-mx)'*(x-mx);
        T = a(1)/sqrt(s2/s2x);
        ddl = n-2;
        pval = 2*(1-cdf('t',abs(T),ddl))
    end

end
% pval = 0 < alpha donc on rejette H0

%% Carte US
%% Initialisation
% Je travaille avec la matrice Xn (matrice centrée réduite) avec tous les
% pays (y compris les valeurs aberrantes)

[n p]=size(X_carte);
moyenne=sum(X_carte)/n;
% Calculons la matrice de variance covariance

% Centrons les données
Xc=X_carte-ones(n,1)*moyenne;
mean(Xc);
% mean(Xc) est un vecteur de 0 donc a bien centré les données.

% Matrice de variance covariance.
Matrice_covariance=cov(X_carte)*(n-1)/n;

% Réduisons les données.
s=sqrt(diag(Matrice_covariance))';
Xn=Xc./(ones(n,1)*s);

mean(Xn); %mean(Xn) est un vecteur de 0 donc a bien centré les données.
std(Xn); % on trouve bien un vecteur de 1 donc a bien réduit les données.

%%
McDonalds_1=-0.911; % troncature du min
McDonalds_4=3.828; % arrondi au supérieur du max
ecart_McDonalds = (McDonalds_4-McDonalds_1)/3;
McDonalds_2=McDonalds_1+ecart_McDonalds;
McDonalds_3=McDonalds_2+ecart_McDonalds;

Obese_1=-0.864; % troncature du min
Obese_4=3.965; % arrondi au supérieur du max
ecart_Obese=(Obese_4-Obese_1)/3;
Obese_2=Obese_1+ecart_Obese;
Obese_3=Obese_2+ecart_Obese;


Diabete_1=-0.813; % troncature du min
Diabete_4=4.329;  % arrondi au supérieur du max
ecart_Diabete=(Diabete_4-Diabete_1)/3;
Diabete_2=Diabete_1+ecart_Diabete;
Diabete_3=Diabete_2+ecart_Diabete;

Inactivite_1=-0.847; % troncature du min
Inactivite_4=3.507; % arrondi au supérieur du max
ecart_Inactivite=(Inactivite_4-Inactivite_1)/3;
Inactivite_2=Inactivite_1+ecart_Inactivite;
Inactivite_3=Inactivite_2+ecart_Inactivite;

Hypertension_1=-0.865; % troncature du min
Hypertension_4=4.282; % arrondi au supérieur du max
ecart_Hypertension=(Hypertension_4-Hypertension_1)/3;
Hypertension_2=Hypertension_1+ecart_Hypertension;
Hypertension_3=Hypertension_2+ecart_Hypertension;

McDonalds=Xn(:,1);
Obese=Xn(:,2);
Diabete=Xn(:,3);
Inactivite=Xn(:,4);
Hypertension=Xn(:,5);


%% Associer une couleur à chaque Etat

Vecteur_couleur=['a'];
Vecteur_iterateur=[0 0 0 0 0 0 0 0 0]; % 9 zéros
nb_condition_utilisee=0; % permet de voir si on est déjà entré dans une condition

for i= 1:length(Etats)
    
    if ((McDonalds(i) >= McDonalds_3) && (Obese(i) >= Obese_3) && (Diabete(i) >= Diabete_3) && (Inactivite(i) >= Inactivite_3) && (Hypertension(i) >= Hypertension_3) && (nb_condition_utilisee==0))
        Vecteur_couleur= [Vecteur_couleur ;'r'];
        Vecteur_iterateur(1)=Vecteur_iterateur(1)+1; % pour avoir le nombre de pays ayant cette couleur
        Matrice_Indice_Etats(Vecteur_iterateur(1), 1)= i;
        nb_condition_utilisee=1;
    end
      
    if ((Inactivite(i) >= Inactivite_3) && (McDonalds(i)>=McDonalds_2 && McDonalds(i)<McDonalds_3) && (Obese(i)>=Obese_2 && Obese(i)<Obese_3) && (Diabete(i)>=Diabete_2 && Diabete(i)<Diabete_3) && (Hypertension(i)>=Hypertension_2 && Hypertension(i)<Hypertension_3) && (nb_condition_utilisee==0))
        Vecteur_couleur= [Vecteur_couleur ;'m'];
        Vecteur_iterateur(2)=Vecteur_iterateur(2)+1; % pour avoir le nombre de pays ayant cette couleur
        Matrice_Indice_Etats(Vecteur_iterateur(2), 2)= i;
        nb_condition_utilisee=1;
    end
    
    if ((McDonalds(i) < McDonalds_2) && (Obese(i) < Obese_2) && (Diabete(i) < Diabete_2) && (Inactivite(i) < Inactivite_2) && (Hypertension(i) < Hypertension_2) && (nb_condition_utilisee==0))
        Vecteur_couleur= [Vecteur_couleur ;'g'];
        Vecteur_iterateur(3)=Vecteur_iterateur(3)+1; % pour avoir le nombre de pays ayant cette couleur
        Matrice_Indice_Etats(Vecteur_iterateur(3), 3)= i;
        nb_condition_utilisee=1;
    end
    
    if ((McDonalds(i) < McDonalds_2) && (Obese(i) < Obese_2) && (Diabete(i) < Diabete_2) && (Hypertension(i) < Hypertension_2) && ((Inactivite(i) >= Inactivite_2) && (Inactivite(i) < Inactivite_3)) && (nb_condition_utilisee==0))
        Vecteur_couleur= [Vecteur_couleur ;'c'];
        Vecteur_iterateur(4)=Vecteur_iterateur(4)+1; % pour avoir le nombre de pays ayant cette couleur
        Matrice_Indice_Etats(Vecteur_iterateur(4), 4)= i;
        nb_condition_utilisee=1;
    end
    
    if (((McDonalds(i) >= McDonalds_2) && (McDonalds(i) < McDonalds_3)) && (Obese(i) < Obese_2) && (Diabete(i) < Diabete_2) && (Inactivite(i) < Inactivite_2) && (Hypertension(i) < Hypertension_2) && (nb_condition_utilisee==0))
        Vecteur_couleur= [Vecteur_couleur ;'o'];
        Vecteur_iterateur(5)=Vecteur_iterateur(5)+1; % pour avoir le nombre de pays ayant cette couleur
        Matrice_Indice_Etats(Vecteur_iterateur(5), 5)= i;
        nb_condition_utilisee=1;
    end
    
    if ((Diabete(i) < Diabete_2) && ((McDonalds(i) >= McDonalds_2) && (McDonalds(i) < McDonalds_3)) && ((Inactivite(i) >= Inactivite_2) && (Inactivite(i) < Inactivite_3)) && ((Obese(i) >= Obese_2) && (Obese(i) < Obese_3)) && ((Hypertension(i) >= Hypertension_2) && (Hypertension(i) < Hypertension_3)) && (nb_condition_utilisee==0))
        Vecteur_couleur= [Vecteur_couleur ;'b'];
        Vecteur_iterateur(6)=Vecteur_iterateur(6)+1; % pour avoir le nombre de pays ayant cette couleur
        Matrice_Indice_Etats(Vecteur_iterateur(6), 6)= i;
        nb_condition_utilisee=1;
    end
    
    if (nb_condition_utilisee==0)
        Vecteur_couleur= [Vecteur_couleur ;'y'];
        Vecteur_iterateur(7)=Vecteur_iterateur(7)+1; % pour avoir le nombre de pays ayant cette couleur
        Matrice_Indice_Etats(Vecteur_iterateur(7), 7)= i;
        nb_condition_utilisee=1;
     end
     
    nb_condition_utilisee=0;
    
end
Vecteur_couleur(1,:)=[]; % on retire la première ligne car Vecteur_couleur a été initialisé avec 'a'


%% On trace la carte avec la couleur de chaque Etat

states = shaperead('usastatehi', 'UseGeoCoords', true);
colourMap('aaa') = [0.4,0.5,0.5];
o=[1 0.5 0]; % orange
light_grey=[0.6 0.6 1];

figure(numero_figure)
numero_figure=numero_figure+1;

worldmap('north america')

for i=1:length(Etats)
    if Vecteur_couleur(i) ~= 'o'
        geoshow(states(i),  'FaceColor', Vecteur_couleur(i), 'DefaultEdgeColor', colourMap('aaa'))
        textm(states(i).LabelLat,...
            states(i).LabelLon, Etats_Abreviation(i).name,...
            'HorizontalAlignment','center',...
            'Color', 'k');
    else
        geoshow(states(i),  'FaceColor', o, 'DefaultEdgeColor', colourMap('aaa'))
        textm(states(i).LabelLat,...
            states(i).LabelLon, Etats_Abreviation(i).name,...
            'HorizontalAlignment','center',...
            'Color', 'k');        
    end
end

%% Le nom des Etats par couleur

Couleur = struct('name',{'rouge', 'magenta', 'vert', 'cyan', 'orange',  'bleu', 'jaune'});

for i=1:length(Vecteur_iterateur)-2
        disp(' ')
        display(['Les pays en ', Couleur(i).name, ' sont :'])
    for j= 1:Vecteur_iterateur(i) % chaque case contient le nombre de pays ayant la même couleur
        display(Etats_ET_Abreviation(Matrice_Indice_Etats(j,i)).name) 
    end
    
    if Vecteur_iterateur(i) == 0
        display('Aucun')
    end
end

%% ACP Feuille Etats
% Première étape de l'ACP : on centre et on réduit les données du tableau X.
% X_imagesc=[feuille_Etats(:,3), X];
X=X_imagesc; % sans les valeurs aberrantes

[n p]=size(X);
moyenne=sum(X)/n;
Xc=X-ones(n,1)*moyenne;

mean(Xc);
% mean(Xc) est un vecteur de 0 donc a bien centré les données.

covariance=cov(X)*(n-1)/n;
s=sqrt(diag(covariance))';
 
Xn=Xc./(ones(n,1)*s);

mean(Xn); %mean(Xn) est un vecteur de 0 donc a bien centré les données.
std(Xn); % on trouve bien un vecteur de 1 donc a bien réduit les données.

% La matrice des corrélations est :
Cr=Xn'*Xn/n;

% on vérifie le calcul en faisant :
Cr-corrcoef(Xn);
% on trouve bien une matrice de 0;

%% Deuxième étape de l'ACP : on détermine les valeurs et vecteurs propres :

[V L]=eig(Xn'*Xn)
% V et L sont bien des matrices carrées et L est une matrice diagonale.

%% Troisième étape de l'ACP : on projette les observations

% Les axes principaux (composantes principales) sont :
U=Xn*V;

%% On réarrange les colonnes
V = V(:,end:-1:1);
L = L(end:-1:1,end:-1:1);
U = U(:,end:-1:1);

%% Représentons les individus dans le plan des deux premiers facteurs principaux.

figure(numero_figure)
numero_figure=numero_figure+1;

plot(U(:,1),U(:,2),'o');

for i=1:n
text(U(i, 1),U(i, 2),[Etats_ACP_Etats_Aberrante_En_Moins(i).name]); % mettre Etats_ACP_Etats_Aberrante_En_Moins ou Etats selon si on a retiré ou non les valeurs aberrantes
end

xlabel('axe 1');
ylabel('axe 2');
title('Représentation du nuage avec deux axes de l''ACP')

%% Représentons les variables dans le plan des deux premiers facteurs principaux.

Vn = V*sqrt(L)/sqrt(n);

figure(numero_figure)
numero_figure=numero_figure+1;

plot(Vn(:,1),Vn(:,2),'*');hold on
for i=1:p
text(Vn(i,1),Vn(i,2),['v' Legende_ACP(i).name]);
end

a = 0:0.01:2*pi;
plot(cos(a),sin(a),':');hold off;
xlabel('axe 1');
ylabel('axe 2');
title('Représentation des variables avec deux axes de l''ACP')


%% Visualisons les autres axes
figure(numero_figure)
numero_figure=numero_figure+1;

subplot(2,2,1)
plot(U(:,1),U(:,2),'o');
xlabel('axe 1');
ylabel('axe 2');
title('Representation du nuage avec deux axes de l''ACP')
subplot(2,2,2)
plot(U(:,1),U(:,3),'o');
xlabel('axe 1');
ylabel('axe 3');
title('Representation du nuage avec deux axes de l''ACP')
subplot(2,2,3)
plot(U(:,2),U(:,3),'o');
xlabel('axe 2');
ylabel('axe 3');
title('Representation du nuage avec deux axes de l''ACP')
subplot(2,2,4)
plot(U(:,2),U(:,4),'o');
xlabel('axe 2');
ylabel('axe 4');
title('Representation du nuage avec deux axes de l''ACP')

%%
figure(numero_figure)
numero_figure=numero_figure+1;

subplot(2,2,1)
plot(Vn(:,1),Vn(:,2),'*');hold on
for i=1:p
text(Vn(i,1),Vn(i,2),['v' Legende_ACP(i).name]);
end
a = 0:0.01:2*pi;
plot(cos(a),sin(a),':');hold off;
xlabel('axe 1');
ylabel('axe 2');
title('Représentation des variables avec deux axes de l''ACP')

subplot(2,2,2)
plot(Vn(:,1),Vn(:,3),'*');hold on
for i=1:p
text(Vn(i,1),Vn(i,3),['v' Legende_ACP(i).name]);
end
plot(cos(a),sin(a),':');
xlabel('axe 1');
ylabel('axe 3');
title('Représentation des variables avec deux axes de l''ACP')
hold off;

subplot(2,2,3)
plot(Vn(:,2),Vn(:,3),'*');hold on
for i=1:p
text(Vn(i,2),Vn(i,3),['v' Legende_ACP(i).name]);
end
plot(cos(a),sin(a),':');
xlabel('axe 2');
ylabel('axe 3');
title('Représentation des variables avec deux axes de l''ACP')
hold off;

subplot(2,2,4)
plot(Vn(:,2),Vn(:,4),'*');hold on
for i=1:p
text(Vn(i,2),Vn(i,4),['v' Legende_ACP(i).name]);
end
plot(cos(a),sin(a),':');
xlabel('axe 2');
ylabel('axe 4');
title('Représentation des variables avec deux axes de l''ACP')
hold off;
