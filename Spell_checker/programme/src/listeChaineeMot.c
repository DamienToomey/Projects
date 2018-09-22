#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <assert.h>
#include <stdbool.h>
#include "listeChaineeMot.h"

#define NDEBUG

#define TRUE 1
#define FALSE 0

LCM_ListeChaineeMot LCM_listeChaineeMot() {
	errno=0;
	return NULL;
}

int LCM_estVide(LCM_ListeChaineeMot l) {
	errno=0;
	return (l==NULL);
}

void LCM_ajouter(LCM_ListeChaineeMot *pl, M_Mot mot) {
	LCM_ListeChaineeMot pNoeud=(LCM_ListeChaineeMot)malloc(sizeof(
								  LCM_Noeud));
	if (pNoeud!=NULL) {
		errno=0;
		pNoeud->element=mot;
		pNoeud->listeSuivante=*pl;
		*pl=pNoeud;
	}
	else {
		errno=LCM_ERREUR_MEMOIRE;
	}
}

M_Mot LCM_obtenirElement(LCM_ListeChaineeMot l) {
	assert(!LCM_estVide(l));
	errno=0;
	return l->element;
}

LCM_ListeChaineeMot LCM_obtenirListeSuivante(LCM_ListeChaineeMot l) {
	assert (!LCM_estVide(l));
	errno=0;
	return l->listeSuivante;
}

void LCM_fixerListeSuivante(LCM_ListeChaineeMot pl,
			    LCM_ListeChaineeMot suivant) {
	assert (!LCM_estVide(pl));
	errno=0;
	pl->listeSuivante=suivant;
}

void LCM_fixerElement(LCM_ListeChaineeMot pl, M_Mot mot) {
	assert (!LCM_estVide(pl));
	errno=0;
	pl->element=mot;
}

void LCM_supprimerTete(LCM_ListeChaineeMot *pl) {
	assert (!LCM_estVide(*pl));

	LCM_ListeChaineeMot temp;

	errno=0;
	temp=*pl;
	*pl=LCM_obtenirListeSuivante(*pl);
	free(temp);
}

void LCM_supprimer(LCM_ListeChaineeMot *pl) {
	errno=0;
	if (!LCM_estVide(*pl)) {
		LCM_supprimerTete(pl);
		LCM_supprimer(pl);
	}
}
