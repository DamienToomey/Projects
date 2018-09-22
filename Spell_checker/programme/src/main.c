#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "affichages.h"
#include "arbreN.h"
#include "correcteurOrthographique.h"
#include "dictionnaire.h"
#include "ensemble.h"
#include "existeFichier.h"
#include "listeChaineeMot.h"
#include "mot.h"

#define TRUE 1
#define FALSE 0

void mettreMotsDansSDDdico (char *nomFichierSDDDico,
			    char *nomFichierTexteMotsAInserer) {
  FILE* fichierTexteMotsAInserer = NULL;
  M_Mot mot;
  D_Dictionnaire SDDDico, fils;
  char temp[TAILLE_MAX_MOT];
  unsigned int longueurMot;

  SDDDico=D_creerDico();

  if (F_fichierExiste(nomFichierSDDDico)) {
    fils=D_chargerDico(nomFichierSDDDico);
    AbN_fixerFils(&SDDDico, fils);

  }
  else {
    fils=AbN_obtenirFils(SDDDico);
  }

  fichierTexteMotsAInserer=fopen(nomFichierTexteMotsAInserer, "r");

  while (fgets(temp, TAILLE_MAX_MOT, fichierTexteMotsAInserer) != NULL) {
    longueurMot=(unsigned int)strlen(temp)-1;
    temp[longueurMot]='\0';
    M_fixerLongueur(&mot, longueurMot);
    M_fixerLaChaine(&mot, temp);

    if (!(D_estPresent(fils, mot))) {
      D_insererMot(&fils, mot);
    }
  }
  fclose(fichierTexteMotsAInserer);

  AbN_fixerFils(&SDDDico, fils);
  D_sauvegarderDico(nomFichierSDDDico, fils);

  free(fils);
  free(SDDDico);
}

unsigned int  queFaireEnFonctionDeCommandeEntree (int argc, char **argv) {
  unsigned int nbArgument;
  unsigned int resultat;

  nbArgument=argc-1;
  resultat=1;

  if ((nbArgument==2) | (nbArgument==4)) {
    if (strcmp(argv[1], "-d")==0) {

      if (nbArgument==4) {
	if ((strcmp(argv[3], "-f")==0) & (F_fichierExiste(argv[4]))) {
	  resultat=3;
	}
      }
      else if (F_fichierExiste(argv[2])) {
	resultat=2;
      }
    }
  }
  return resultat;
}
/*
  Si resultat=1 : afficher aide
  Si resultat=2 : correction de l'entree standard
  Si résultat=3 : compléter SDD Dictionnaire
*/

void corrigerMot(CO_CorrecteurOrthographique co, unsigned int posMotFaux) {
  E_Ensemble correctionsPossibles;
  LCM_ListeChaineeMot temp;

  correctionsPossibles = E_ensemble();

  if (!(CO_estBienOrthographie(co))) {
    correctionsPossibles = CO_proposerCorrections(co);
    A_afficherCorrectionEtPosMot(correctionsPossibles, CO_obtenirMot(co),
				 posMotFaux);
  }
  else {
    A_affichageMotBienEcrit();
  }
  
  temp=E_obtenirLesElements(correctionsPossibles);
  free(temp);  
}

int main(int argc,char** argv) {
  unsigned int actionAFaire;
  int posDepuisDebutFlux;
  M_Mot mot;
  int arret=FALSE;
  D_Dictionnaire SDDDico, fils;
  CO_CorrecteurOrthographique co;

  actionAFaire=queFaireEnFonctionDeCommandeEntree(argc, argv);

  if (actionAFaire==1) {
    A_afficherAide();
  }

  if (actionAFaire==2) {
    SDDDico = D_creerDico();
    fils = D_chargerDico(argv[2]);
    AbN_fixerFils(&SDDDico, fils);
    co = CO_correcteurOrthographique();
    CO_fixerDictionnaire(&co, fils);
    M_fixerLongueur(&mot, 0);
    posDepuisDebutFlux=-1;

    while (arret==FALSE) {
      M_obtenirMotEntreeStandard(&posDepuisDebutFlux, &mot, &arret);

      if (arret==FALSE) {
	CO_fixerMot(&co, mot);
	corrigerMot(co, (unsigned int)posDepuisDebutFlux);
      }
    }
    free(fils);
    free(SDDDico);
  }

  if (actionAFaire==3) {
    mettreMotsDansSDDdico(argv[2], argv[4]);
  }
  return 0;
}
