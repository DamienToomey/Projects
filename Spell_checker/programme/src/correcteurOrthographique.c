#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>
#include "correcteurOrthographique.h"
#include "listeChaineeMot.h"
#include "mot.h"
#include "ensemble.h"
#include "dictionnaire.h"

#define NDEBUG

#define LETTRES_SPECIALES_AUTORISEES "ÀÂÄÆÇÈÉÊËÌÎÏÒÓÔÖÙÚÛÜàâäæçèéêëìîïòôöùûü"
#define LONGUEUR_LETTRES_SPECIALES_AUTORISEES 38


/* Partie privee */
void ajouterSiCorrecte(E_Ensemble* corrections, CO_CorrecteurOrthographique co)
{
  if (CO_estBienOrthographie(co)) {
    E_ajouter(corrections, CO_obtenirMot(co));
  }
}

/* Partie publique */
CO_CorrecteurOrthographique CO_correcteurOrthographique(){
  CO_CorrecteurOrthographique co;
  M_Mot mot;
  D_Dictionnaire dico;

  M_fixerLaChaine(&mot, "");
  M_fixerLongueur(&mot, 0);
  CO_fixerMot(&co, mot);

  dico = NULL;
  CO_fixerDictionnaire(&co, dico);

  return co;
}

M_Mot CO_obtenirMot(CO_CorrecteurOrthographique co){
  return co.mot;
}

D_Dictionnaire CO_obtenirDictionnaire(CO_CorrecteurOrthographique co){
  return co.dico;
}

void CO_fixerDictionnaire(CO_CorrecteurOrthographique* co, D_Dictionnaire dico)
{
  co->dico = dico;
}

void CO_fixerMot(CO_CorrecteurOrthographique* co, M_Mot mot){
  co->mot = mot;
}

E_Ensemble CO_proposerCorrections(CO_CorrecteurOrthographique co) {
  assert(!(CO_estBienOrthographie(co)));

  E_Ensemble corrections;
  M_Mot temp, mot;
  D_Dictionnaire dico;
  CO_CorrecteurOrthographique coTest;
  unsigned int i, k;
  char j;

  coTest = CO_correcteurOrthographique();

  mot = CO_obtenirMot(co);
  dico = CO_obtenirDictionnaire(co);

  CO_fixerDictionnaire(&coTest, dico);

  corrections = E_ensemble();

  if (M_obtenirLongueur(mot)>=2) {
    for (i=0;i<M_obtenirLongueur(mot)-1;i++) {
      temp = M_inverserDeuxLettresConsecutives(mot, i);
      CO_fixerMot(&coTest, temp);
      ajouterSiCorrecte(&corrections, coTest);
    }

    for (i=0;i<M_obtenirLongueur(mot);i++) {
      temp = M_supprimerLettre(mot, i);
      CO_fixerMot(&coTest, temp);
      ajouterSiCorrecte(&corrections, coTest);
    }
  }

  for (j='a';j<='z';j++) {
    for (i=0;i<M_obtenirLongueur(mot);i++) {
      temp = M_remplacerLettre(mot, i, j);
      CO_fixerMot(&coTest, temp);
      ajouterSiCorrecte(&corrections, coTest);
    }
  }

  while (k<=LONGUEUR_LETTRES_SPECIALES_AUTORISEES-1){
    for (i=0;i<M_obtenirLongueur(mot);i++) {
      temp = M_remplacerLettre(mot, i, LETTRES_SPECIALES_AUTORISEES[k]);
      CO_fixerMot(&coTest, temp);
      ajouterSiCorrecte(&corrections, coTest);
    }
    k=k+1;
  }

  for (j='a';j<='z';j++) {
    for (i=0;i<=M_obtenirLongueur(mot);i++) {
      temp = M_insererLettre(mot, j, i);
      CO_fixerMot(&coTest, temp);
      ajouterSiCorrecte(&corrections, coTest);
    }
  }

  while (k<=LONGUEUR_LETTRES_SPECIALES_AUTORISEES-1){
    for (i=0;i<=M_obtenirLongueur(mot);i++) {
      temp = M_insererLettre(mot,  LETTRES_SPECIALES_AUTORISEES[k], i);
      CO_fixerMot(&coTest, temp);
      ajouterSiCorrecte(&corrections, coTest);
    }
    k=k+1;
  }

  return corrections;
}

int CO_estBienOrthographie(CO_CorrecteurOrthographique co) {
  return D_estPresent(CO_obtenirDictionnaire(co), CO_obtenirMot(co));
}
