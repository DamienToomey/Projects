#include <stdlib.h>
#include <string.h>
#include "ensemble.h"
#include "listeChaineeMot.h"
#include "mot.h"

#define TRUE 1
#define FALSE 0

/* Partie privee */
int estPresentDansLesElements(LCM_ListeChaineeMot l, M_Mot mot) {
  if (LCM_estVide(l)) {
    return FALSE;
  }
  else {
    if (M_sontEgaux(LCM_obtenirElement(l), mot)) {
      return TRUE;
    }
    else {
      return estPresentDansLesElements(LCM_obtenirListeSuivante(l), mot);
    }
  }
}

void retirerSiPresent(LCM_ListeChaineeMot l, M_Mot mot, int *etaitPresent){
  LCM_ListeChaineeMot temp;

  if (LCM_estVide(l)) {
    *etaitPresent=FALSE;
  }
  else {
    if (M_sontEgaux(LCM_obtenirElement(l), mot)) {
      LCM_supprimerTete(&l);
      *etaitPresent=TRUE;
    }
    else {
      temp=LCM_obtenirListeSuivante(l);
      retirerSiPresent(temp, mot, etaitPresent);
      LCM_fixerListeSuivante(l, temp);
    }
  }
}

/* Partie publique */
LCM_ListeChaineeMot E_obtenirLesElements (E_Ensemble e) {
  return e.lesElements;
}

unsigned int E_obtenirNbElement (E_Ensemble e) {
  return e.nbElement;
}

void E_fixerLesElements (E_Ensemble *e, LCM_ListeChaineeMot listeElements) {
  LCM_fixerListeSuivante(e->lesElements, listeElements);
}

E_Ensemble E_ensemble(){
  E_Ensemble resultat;

  resultat.lesElements = LCM_listeChaineeMot();
  resultat.nbElement = 0;

  return resultat;
}

void E_ajouter(E_Ensemble* e, E_Element el){
  if (!(E_estPresent(*e, el))) {
    LCM_ajouter(&e->lesElements,el);
    e->nbElement++;
  }
}

unsigned int E_cardinalite(E_Ensemble e){
  return E_obtenirNbElement(e);
}

int E_estPresent(E_Ensemble e, E_Element el) {
  return estPresentDansLesElements(E_obtenirLesElements(e), el);
}

void E_retirer(E_Ensemble *e, E_Element el){
  int etaitPresent;

  retirerSiPresent(E_obtenirLesElements(*e), el, &etaitPresent);

  if (etaitPresent) {
    e->nbElement--;
  }
}
