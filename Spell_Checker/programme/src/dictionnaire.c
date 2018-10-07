#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "arbreN.h"
#include "mot.h"
#include "dictionnaire.h"
#include "existeFichier.h"

#define NDEBUG

#define CaratereMotValide '*'
#define CaratereMotNonValide ','
#define CaratereFilsNonVide '/'
#define CaratereFilsVide '.'
#define CaratereFrereNonVide ':'
#define CaratereFrereVide ';'

#define TRUE 1
#define FALSE 0
#define charnul '\0'

/* Partie privee */
void serialiserParcoursRGDdico (D_Dictionnaire dico, FILE *fichierSDDDico) {

  if (!(D_estVide(dico))) {
    fputc((int)AbN_obtenirChar(dico), fichierSDDDico);

    if (AbN_obtenirBool(dico)==TRUE) {
      fputc((int)CaratereMotValide, fichierSDDDico);
    }
    else {
      fputc((int)CaratereMotNonValide, fichierSDDDico);
    }

    if (AbN_estVide(AbN_obtenirFils(dico))) {
      fputc((int)CaratereFilsVide, fichierSDDDico);
    }
    else {
      fputc((int)CaratereFilsNonVide, fichierSDDDico);
      serialiserParcoursRGDdico(AbN_obtenirFils(dico), fichierSDDDico);
    }

    if (AbN_estVide(AbN_obtenirFrere(dico))) {
      fputc((int)CaratereFrereVide, fichierSDDDico);
    }
    else {
      fputc((int)CaratereFrereNonVide, fichierSDDDico);
      serialiserParcoursRGDdico(AbN_obtenirFrere(dico), fichierSDDDico);
    }
  }
}

void deserialiser (D_Dictionnaire *dico, FILE *fichierSDDDico) {
  int c;
  D_Dictionnaire temp;

  // Je lis une lettre ou fin de fichier
  if ((c=fgetc(fichierSDDDico)) != EOF) {
    AbN_fixerChar(dico, (char)c);

    // Je lis CaratereMotValide ou CaratereMotNonValide
    c=fgetc(fichierSDDDico);

    if (c==CaratereMotValide) {
      AbN_fixerBool(dico, TRUE);
    }
    else {
      AbN_fixerBool(dico, FALSE);
    }

    // Je lis CaratereFilsNonVide ou CaratereFilsVide
    c=fgetc(fichierSDDDico);

    if (c==CaratereFilsNonVide) {
      temp = D_creerDico();
      deserialiser(&temp, fichierSDDDico);
      AbN_fixerFils(dico, temp);
    }

    // Je lis CaratereFrereNonVide ou CaratereFrereVide
    c=fgetc(fichierSDDDico);

    if (c==CaratereFrereNonVide) {
      temp = D_creerDico();
      deserialiser(&temp, fichierSDDDico);
      AbN_fixerFrere(dico, temp);
    }
  }
}

/* Partie publique */
D_Dictionnaire D_creerDico (){
  D_Dictionnaire dico;
  dico=AbN_creerArbreNonInit();
  return dico;
}

int D_estVide (D_Dictionnaire dico){
  return AbN_estVide(dico);
}

int D_estPresent (D_Dictionnaire dico, M_Mot mot) {
  M_Mot temp=mot;
  if (D_estVide(dico)) {
    return FALSE;
  }
  else {
    if ((M_obtenirLongueur(temp)==1) && (AbN_obtenirChar(dico) ==
					 M_obtenirIemeCaractere(temp,0)) &&
	(AbN_obtenirBool(dico)==TRUE)) {
      return TRUE;
    }
    else {
      if ((AbN_obtenirChar(dico) == M_obtenirIemeCaractere(temp,0) &&
	   (M_obtenirLongueur(temp)>1))) {
	return D_estPresent(AbN_obtenirFils(dico),M_supprimerLettre(temp,0));
      }
      else {
	if (AbN_obtenirChar(dico) < M_obtenirIemeCaractere(temp,0)) {
	  return D_estPresent(AbN_obtenirFrere(dico),temp);
	}
	else {
	  return FALSE;
	}
      }
    }
  }
}

void D_insererMot (D_Dictionnaire *dico, M_Mot mot) {
  D_Dictionnaire temp, newNoeud, newNoeudTemp;
  M_Mot tempMot=mot;

  if (D_estVide(*dico)) {
    *dico = D_creerDico();
    AbN_fixerChar (dico, M_obtenirIemeCaractere(tempMot,0));
    AbN_fixerBool (dico, M_obtenirLongueur(tempMot)==1);

    if (M_obtenirLongueur(tempMot)>1) {
      temp = AbN_obtenirFils(*dico);
      D_insererMot(&temp,M_supprimerLettre(tempMot,0));
      AbN_fixerFils(dico, temp);
    }
  }
  else {
    if (AbN_obtenirChar(*dico) == M_obtenirIemeCaractere(tempMot,0)) {
      if (M_obtenirLongueur(tempMot) == 1) {
	AbN_fixerBool (dico, TRUE);
      }
      else {
	temp = AbN_obtenirFils(*dico);
	D_insererMot(&temp,M_supprimerLettre(tempMot,0));
	AbN_fixerFils(dico, temp);
      }
    }
    else {
      if (AbN_obtenirChar(*dico) < M_obtenirIemeCaractere(tempMot,0)) {
	temp = AbN_obtenirFrere(*dico);
	D_insererMot(&temp,tempMot);
	AbN_fixerFrere(dico, temp);
      }
      else {
	temp = *dico;
	newNoeud = D_creerDico();
	AbN_fixerChar (&newNoeud, M_obtenirIemeCaractere(tempMot,0));
	AbN_fixerBool (&newNoeud, M_obtenirLongueur(tempMot)==1);

	if (M_obtenirLongueur(tempMot)==1) {
	  AbN_fixerFrere(&newNoeud, temp);
	  AbN_fixerFils(&newNoeud, newNoeudTemp);
	  *dico=newNoeud;
	}
	else {
	  newNoeudTemp = AbN_obtenirFils(newNoeud);
	  D_insererMot(&newNoeudTemp,M_supprimerLettre(tempMot,0));
	  AbN_fixerFrere(&newNoeud, temp);
	  AbN_fixerFils(&newNoeud, newNoeudTemp);
	  *dico=newNoeud;
	}
      }
    }
  }
}

void D_sauvegarderDico (char nomFichier[], D_Dictionnaire dico) {
  FILE *fichierSDDDico;

  fichierSDDDico=fopen(nomFichier, "w");
  serialiserParcoursRGDdico(dico, fichierSDDDico);
  fclose(fichierSDDDico);
}

D_Dictionnaire D_chargerDico (char nomFichier[]) {
  assert(F_fichierExiste(nomFichier)==TRUE);

  FILE *fichierSDDDico;
  D_Dictionnaire dico;

  fichierSDDDico=fopen(nomFichier, "r");
  dico=D_creerDico();
  deserialiser(&dico, fichierSDDDico);
  fclose(fichierSDDDico);

  return dico;
}
