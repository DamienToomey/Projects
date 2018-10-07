#include <stdio.h>
#include "ensemble.h"

#define TAILLE_MAX_MOT_FICHIER_AIDE 150
#define NOM_FICHIER_AIDE "./fichierAide.txt"

void A_afficherCorrectionEtPosMot(E_Ensemble lesCorrections, M_Mot leMot,
				  unsigned int pos) {
  unsigned int i, nbCorrections;
  M_Mot mot;
  LCM_ListeChaineeMot lesMotsCorrects;

  lesMotsCorrects = E_obtenirLesElements(lesCorrections);
  nbCorrections=E_cardinalite(lesCorrections);

  printf("& %s %d %d: ", M_obtenirLaChaine(leMot), nbCorrections, pos);

  for (i=0; i<nbCorrections; i++) {
    mot= LCM_obtenirElement(lesMotsCorrects);
    printf("%s ", M_obtenirLaChaine(mot));
    lesMotsCorrects = LCM_obtenirListeSuivante(lesMotsCorrects);
  }

  printf("\n");
}

void A_affichageMotBienEcrit() {
  printf("*\n");
}

void A_afficherAide() {
  FILE* fichierAide=NULL;
  char chaine[TAILLE_MAX_MOT_FICHIER_AIDE];

  fichierAide=fopen(NOM_FICHIER_AIDE, "r");

  if (fichierAide != NULL) {
    while (fgets(chaine, TAILLE_MAX_MOT_FICHIER_AIDE, fichierAide) != NULL) {
      printf("%s", chaine);
    }

    fclose(fichierAide);
  }
  else {
    printf("Le fichier d'aide est introuvable\n");
  }
}
