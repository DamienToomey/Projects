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

%% Valeur aberrante Chicken McNuggets (20 morceaux)
% On remarque sur la boîte à moustache que les 895 kcal des Chicken McNuggets
% (20 morceaux) sont considérés comme une valeur aberrante.
% Puisqu'on considère les apports journalier d'un individu,
% on peut retirer l'option Chicken McNuggets (20 morceaux) car en générale,
% une personne ne mange pas 20 morceaux mais plutôt 9 ou moins.

% On retire la valeur aberrante
Indice_Ligne_20_morceaux_chicken=12;
X(Indice_Ligne_20_morceaux_chicken,:)=[];

%% On déplace "eau evian (33 cl)" des moyennes boissoins à la fin des petites boissons
% On fait cela pour ne pas avoir à décaler tous les indices.

X=[X(1:36,:) ; X(38:46,:) ; X(37,:) ; X(47:end,:)];

%% Tests Combinaisons menus
%% Nombre d'éléments par catégorie (sandwichs, accompagnements, moyennes boissons, petites boissons, saldes, petits-déjeuner)
nb_SANDWICHS = 22; %on a retiré Chicken nuggets (20 morceaux)
nb_ACCOMPAGNEMENTS = 7;
nb_moyennes_BOISSONS = 8;
% On ne considère pas l'eau évian dans la catégorie des moyennes
% boissons car 330ml d'évian a déjà été considéré pour les petites boissons

nb_petites_BOISSONS = 9;

% boissons.
nb_SALADES = 3;
nb_DESSERTS = 27;
nb_PETIT_DEJEUNER = 19;

%% Menu 1 : Sandwich/Accompagnement/Boisson (petit format)
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
ligne_petite_BOISSON_Dep=38;
ligne_petite_BOISSON=38;
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

colonne_feuille_ANC = colonne_Enfant; % Pour changer le sexe

%% Nombre de menus différents que l'on peut composer.

nb_menus=23*7*9; %1449 menus différents possibles en considérant les Chicken nuggets (20 morceaux)

nb_menus=nb_SANDWICHS*nb_ACCOMPAGNEMENTS*nb_petites_BOISSONS; %1386 menus différents possibles sans les Chicken nuggets (20 morceaux)


%% Le test de combinaisons
[n p]=size(X);
boolean=true; % boolean qui permet de ne pas réafficher les éléments qui composent un menu si plusieurs éléments dépassent les ANC
nb_condition_utilisee=0; % permet de voir si on est déjà entré dans une condition

Matrice_Exces_AN= [0 0 0 0 0 0 0 0];
Vecteur_exces=[0 0 0 0 0 0 0 0]; % vecteurs de huit zéros car car 8 variables (Energie, Matière grasse...)

disp(['Pour un(e) ', Genre(colonne_feuille_ANC).name])
while ((ligne_SANDWICH <= ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT <= ligne_ACCOMPAGNEMENT_Fin) && (ligne_petite_BOISSON <= ligne_petite_BOISSON_Fin))
            %nb_combinaisons_menus <= nb_menus  %PROBLEME 5555555555555555555555555555555555555555
        for count = 1:p;
            Vecteurs_AN(count) = X(ligne_SANDWICH, count)+X(ligne_ACCOMPAGNEMENT, count)+X(ligne_petite_BOISSON, count);
        end
        
        for count = 1:p;
         
            if Vecteurs_AN(count) > ANC(count, colonne_feuille_ANC)
                if boolean == true
                    disp([Menu_legende(ligne_SANDWICH).name, '/', Menu_legende(ligne_ACCOMPAGNEMENT).name, '/', Menu_legende(ligne_petite_BOISSON).name]);
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
        
        if ((ligne_SANDWICH == ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_petite_BOISSON == ligne_petite_BOISSON_Fin))
            ligne_SANDWICH=ligne_SANDWICH+1; % pour sortir de la boucle
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_petite_BOISSON == ligne_petite_BOISSON_Fin) && (nb_condition_utilisee==0))
            ligne_petite_BOISSON=ligne_petite_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT_Dep;
            ligne_SANDWICH=ligne_SANDWICH+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_petite_BOISSON == ligne_petite_BOISSON_Fin) && (nb_condition_utilisee==0))
            ligne_petite_BOISSON=ligne_petite_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_petite_BOISSON < ligne_petite_BOISSON_Fin) && (nb_condition_utilisee==0))
            ligne_petite_BOISSON=ligne_petite_BOISSON+1;
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

%% Menu 2 : Sandwich/Accompagnement/Boisson (petit format)/Salade
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
ligne_petite_BOISSON_Dep=38;
ligne_petite_BOISSON=38;
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

nb_menus=nb_SANDWICHS*nb_ACCOMPAGNEMENTS*nb_petites_BOISSONS*nb_SALADES; %4158 menus différents possibles sans les Chicken nuggets (20 morceaux)

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
while ((ligne_SANDWICH <= ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT <= ligne_ACCOMPAGNEMENT_Fin) && (ligne_petite_BOISSON <= ligne_petite_BOISSON_Fin) && (ligne_SALADE <= ligne_SALADE_Fin))

        for count = 1:p;
            Vecteurs_AN(count) = X(ligne_SANDWICH, count)+X(ligne_ACCOMPAGNEMENT, count)+X(ligne_petite_BOISSON, count)+X(ligne_SALADE, count);
        end
        
        for count = 1:p;
         
            if Vecteurs_AN(count) > ANC(count, colonne_feuille_ANC)
                if boolean == true
                    disp([Menu_legende(ligne_SANDWICH).name, '/', Menu_legende(ligne_ACCOMPAGNEMENT).name, '/', Menu_legende(ligne_petite_BOISSON).name, '/', Menu_legende(ligne_SALADE).name]);
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
           Vecteur_Indice_Ligne_Respect_AN=[ligne_SANDWICH, ligne_ACCOMPAGNEMENT, ligne_petite_BOISSON, ligne_SALADE];
           Matrice_Indice_Ligne_Respect_AN=[Matrice_Indice_Ligne_Respect_AN ; Vecteur_Indice_Ligne_Respect_AN];
               
           Vecteur_respect=ANC(:, colonne_feuille_ANC)'-Vecteurs_AN;
           Matrice_Respect_AN=[Matrice_Respect_AN ; Vecteur_respect];
        end            
                
                    
        nb_combinaisons_menus=nb_combinaisons_menus+1;
        Vecteur_exces=[0 0 0 0 0 0 0 0];
        
        if ((ligne_SANDWICH == ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_petite_BOISSON == ligne_petite_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin))
            ligne_SANDWICH=ligne_SANDWICH+1; % pour sortir de la boucle
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_petite_BOISSON == ligne_petite_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (nb_condition_utilisee==0))
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_petite_BOISSON=ligne_petite_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT_Dep;
            ligne_SANDWICH=ligne_SANDWICH+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_petite_BOISSON == ligne_petite_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (nb_condition_utilisee==0))
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_petite_BOISSON=ligne_petite_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_SALADE == ligne_SALADE_Fin) && (nb_condition_utilisee==0))
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_petite_BOISSON=ligne_petite_BOISSON+1;
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

%% Menu 3 : SANDWICH/ACCOMPAGNEMENT/Boisson (petit format)/DESSERT
%% Initilisation

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
ligne_petite_BOISSON_Dep=38;
ligne_petite_BOISSON=38;
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

colonne_feuille_ANC = colonne_Enfant; % Pour changer le sexe

%% Nombre de menus différents que l'on peut composer.

nb_menus=23*7*9*27; %39123 menus différents possibles en considérant les Chicken nuggets (20 morceaux)

nb_menus=nb_SANDWICHS*nb_ACCOMPAGNEMENTS*nb_petites_BOISSONS*nb_DESSERTS; %37422 menus différents possibles sans les Chicken nuggets (20 morceaux)

%% Le test des combinaisons

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
while ((ligne_SANDWICH <= ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT <= ligne_ACCOMPAGNEMENT_Fin) && (ligne_petite_BOISSON <= ligne_petite_BOISSON_Fin) && (ligne_DESSERT <= ligne_DESSERT_Fin))

        for count = 1:p;
            Vecteurs_AN(count) = X(ligne_SANDWICH, count)+X(ligne_ACCOMPAGNEMENT, count)+X(ligne_petite_BOISSON, count)+X(ligne_DESSERT, count);
        end
        
        for count = 1:p;
         
            if Vecteurs_AN(count) > ANC(count, colonne_feuille_ANC)
                if boolean == true
                    %disp([Menu_legende(ligne_SANDWICH).name, '/', Menu_legende(ligne_ACCOMPAGNEMENT).name, '/', Menu_legende(ligne_petite_BOISSON).name, '/', Menu_legende(ligne_DESSERT).name]);
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
           Vecteur_Indice_Ligne_Respect_AN=[ligne_SANDWICH, ligne_ACCOMPAGNEMENT, ligne_petite_BOISSON, ligne_DESSERT];
           Matrice_Indice_Ligne_Respect_AN=[Matrice_Indice_Ligne_Respect_AN ; Vecteur_Indice_Ligne_Respect_AN];
               
           Vecteur_respect=ANC(:, colonne_feuille_ANC)'-Vecteurs_AN;
           Matrice_Respect_AN=[Matrice_Respect_AN ; Vecteur_respect];
        end            
                
                    
        nb_combinaisons_menus=nb_combinaisons_menus+1;
        Vecteur_exces=[0 0 0 0 0 0 0 0];
        
        if ((ligne_SANDWICH == ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_petite_BOISSON == ligne_petite_BOISSON_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin))
            ligne_SANDWICH=ligne_SANDWICH+1; % pour sortir de la boucle
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_petite_BOISSON == ligne_petite_BOISSON_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin) && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_petite_BOISSON=ligne_petite_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT_Dep;
            ligne_SANDWICH=ligne_SANDWICH+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_petite_BOISSON == ligne_petite_BOISSON_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin) && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_petite_BOISSON=ligne_petite_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_DESSERT == ligne_DESSERT_Fin) && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_petite_BOISSON=ligne_petite_BOISSON+1;
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
     %   disp([Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,1)).name, '/', Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,2)).name, '/', Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,3)).name, '/', Menu_legende(Matrice_Indice_Ligne_Respect_AN(ligne_MILRAN,4)).name]);
      %  disp(Matrice_Respect_AN(ligne_MILRAN,:)')
    %end
end

%% Menu 4 : SANDWICH/ACCOMPAGNEMENT/Boisson (petit format)/SALADE/DESSERT Version Courte
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
ligne_petite_BOISSON_Dep=38;
ligne_petite_BOISSON=38;
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

nb_menus=nb_SANDWICHS*nb_ACCOMPAGNEMENTS*nb_petites_BOISSONS*nb_SALADES*nb_DESSERTS; %112266 menus différents possibles sans les Chicken nuggets (20 morceaux)

%% Le test de combinaisons Version Courte
[n p]=size(X);

bool=true;
nb_condition_utilisee=0; % permet de voir si on est déjà entré dans une condition

count_Exces_AN=0;
count_Respect_AN=0;

disp(['Pour un(e) ', Genre(colonne_feuille_ANC).name])
while ((ligne_SANDWICH <= ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT <= ligne_ACCOMPAGNEMENT_Fin) && (ligne_petite_BOISSON <= ligne_petite_BOISSON_Fin) && (ligne_SALADE <= ligne_SALADE_Fin) && (ligne_DESSERT <= ligne_DESSERT_Fin))

        for count = 1:p;
            Vecteurs_AN(count) = X(ligne_SANDWICH, count)+X(ligne_ACCOMPAGNEMENT, count)+X(ligne_petite_BOISSON, count)+X(ligne_SALADE, count)+X(ligne_DESSERT, count);
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
        
        if ((ligne_SANDWICH == ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_petite_BOISSON == ligne_petite_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin))
            ligne_SANDWICH=ligne_SANDWICH+1; % pour sortir de la boucle
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_petite_BOISSON == ligne_petite_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (nb_condition_utilisee==0) && (ligne_DESSERT == ligne_DESSERT_Fin))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_petite_BOISSON=ligne_petite_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT_Dep;
            ligne_SANDWICH=ligne_SANDWICH+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_petite_BOISSON == ligne_petite_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin) && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_petite_BOISSON=ligne_petite_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_SALADE == ligne_SALADE_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin) && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_petite_BOISSON=ligne_petite_BOISSON+1;
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

%% Menu 4 : SANDWICH/ACCOMPAGNEMENT/Boisson (petit format)/SALADE/DESSERT Version Longue (4 minutes)
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
ligne_petite_BOISSON_Dep=38;
ligne_petite_BOISSON=38;
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

nb_menus=nb_SANDWICHS*nb_ACCOMPAGNEMENTS*nb_petites_BOISSONS*nb_SALADES*nb_DESSERTS; %112266 menus différents possibles sans les Chicken nuggets (20 morceaux)

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
while ((ligne_SANDWICH <= ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT <= ligne_ACCOMPAGNEMENT_Fin) && (ligne_petite_BOISSON <= ligne_petite_BOISSON_Fin) && (ligne_SALADE <= ligne_SALADE_Fin) && (ligne_DESSERT <= ligne_DESSERT_Fin))

        for count = 1:p;
            Vecteurs_AN(count) = X(ligne_SANDWICH, count)+X(ligne_ACCOMPAGNEMENT, count)+X(ligne_petite_BOISSON, count)+X(ligne_SALADE, count)+X(ligne_DESSERT, count);
        end
        
        for count = 1:p;
         
            if Vecteurs_AN(count) > ANC(count, colonne_feuille_ANC)
                if boolean == true
                    %disp([Menu_legende(ligne_SANDWICH).name, '/', Menu_legende(ligne_ACCOMPAGNEMENT).name, '/', Menu_legende(ligne_petite_BOISSON).name, '/', Menu_legende(ligne_SALADE).name, '/', Menu_legende(ligne_DESSERT).name]);
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
           Vecteur_Indice_Ligne_Respect_AN=[ligne_SANDWICH, ligne_ACCOMPAGNEMENT, ligne_petite_BOISSON, ligne_SALADE, ligne_DESSERT];
           Matrice_Indice_Ligne_Respect_AN=[Matrice_Indice_Ligne_Respect_AN ; Vecteur_Indice_Ligne_Respect_AN];
               
           Vecteur_respect=ANC(:, colonne_feuille_ANC)'-Vecteurs_AN;
           Matrice_Respect_AN=[Matrice_Respect_AN ; Vecteur_respect];
        end            
                
                    
        nb_combinaisons_menus=nb_combinaisons_menus+1;
        Vecteur_exces=[0 0 0 0 0 0 0 0];
        
        if ((ligne_SANDWICH == ligne_SANDWICH_Fin) && (ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_petite_BOISSON == ligne_petite_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin))
            ligne_SANDWICH=ligne_SANDWICH+1; % pour sortir de la boucle
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_ACCOMPAGNEMENT == ligne_ACCOMPAGNEMENT_Fin) && (ligne_petite_BOISSON == ligne_petite_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (nb_condition_utilisee==0) && (ligne_DESSERT == ligne_DESSERT_Fin))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_petite_BOISSON=ligne_petite_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT_Dep;
            ligne_SANDWICH=ligne_SANDWICH+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_petite_BOISSON == ligne_petite_BOISSON_Fin) && (ligne_SALADE == ligne_SALADE_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin) && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_petite_BOISSON=ligne_petite_BOISSON_Dep;
            ligne_ACCOMPAGNEMENT=ligne_ACCOMPAGNEMENT+1;
            nb_condition_utilisee=nb_condition_utilisee+1;
        end
        
        if ((ligne_SALADE == ligne_SALADE_Fin) && (ligne_DESSERT == ligne_DESSERT_Fin) && (nb_condition_utilisee==0))
            ligne_DESSERT=ligne_DESSERT_Dep;
            ligne_SALADE=ligne_SALADE_Dep;
            ligne_petite_BOISSON=ligne_petite_BOISSON+1;
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