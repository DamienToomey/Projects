#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <assert.h>
#include "mot.h"

#define NDEBUG

#define TRUE 1
#define FALSE 0
#define LETTRES_SPECIALES_AUTORISEES "ÀÂÄÆÇÈÉÊËÌÎÏÒÓÔÖÙÚÛÜàâäæçèéêëìîïòôöùûü"
#define LONGUEUR_LETTRES_SPECIALES_AUTORISEES 38

int M_estUneLettre (char c) {
  unsigned int i;
  int estPresent;

  i=0;
  estPresent=FALSE;

  while ((i<=LONGUEUR_LETTRES_SPECIALES_AUTORISEES-1) &&
	 (estPresent==FALSE)){
    if (LETTRES_SPECIALES_AUTORISEES[i]==c) {
      estPresent=TRUE;
    }
    i=i+1;
  }
  return (estPresent || ((c>='a') && (c<='z')) || ((c>='A') && (c<='Z'))
	  || (c=='-'));
}


void M_obtenirMotEntreeStandard (int *posDepuisDebutFlux, M_Mot *mot,
				 int *arret) {
  int c;
  char str[2];
  char temp[TAILLE_MAX_MOT]="";
  unsigned int i=0;

  str[1]='\0';
  *posDepuisDebutFlux=*posDepuisDebutFlux+(int)M_obtenirLongueur(*mot)+1;
  c=getchar();

  while ((!(M_estUneLettre((char)c))) && (c != EOF)) {
    c=getchar();
    *posDepuisDebutFlux=*posDepuisDebutFlux+1;
  }

  while (M_estUneLettre((char)c) && (c != EOF) && i<TAILLE_MAX_MOT-1) {
    str[0]=(char)(tolower(c));
    strcat(temp, str);
    c=getchar();
    i=i+1;
  }

  M_fixerLaChaine(mot, temp);
  M_fixerLongueur(mot, M_longueur(*mot));

  if (c == EOF) {
    *arret=TRUE;
  }
}

void M_fixerLongueur(M_Mot *mot, unsigned int length) {
  mot->longueur=length;
}

unsigned int M_obtenirLongueur(M_Mot mot) {
  return mot.longueur;
}

char* M_obtenirLaChaine(M_Mot mot) {
  assert(M_obtenirLongueur(mot)>=0);

  char *temp=(char*)malloc((M_obtenirLongueur(mot)+1)*sizeof(char));
  strcpy(temp, mot.laChaine);
  return temp;
}

void M_fixerLaChaine (M_Mot *mot, char *chaine) {
  strcpy(mot->laChaine, chaine);
}

unsigned int M_longueur(M_Mot mot) {

  return strlen(mot.laChaine);
}

char M_obtenirIemeCaractere (M_Mot mot, unsigned int pos) {
  assert((0 <= pos) && (pos <= M_obtenirLongueur(mot)-1));

  return mot.laChaine[pos];
}

void M_fixerIemeCaractere (M_Mot *mot, unsigned int pos, char lettre) {
  assert((0 <= pos) && (pos <= M_obtenirLongueur(*mot)));

  mot->laChaine[pos]=lettre;
}

M_Mot M_remplacerLettre (M_Mot mot, unsigned int pos, char lettre) {
  assert((0 <= pos) && (pos <= M_obtenirLongueur(mot)-1));

  M_Mot temp=mot;

  M_fixerIemeCaractere (&temp, pos, lettre);
  return temp;
}

M_Mot M_inverserDeuxLettresConsecutives (M_Mot mot, unsigned int pos) {
  assert((0 <= pos) && (pos <= M_obtenirLongueur(mot)-2));

  char tempCar;
  M_Mot temp=mot;
  tempCar=M_obtenirIemeCaractere (temp,pos);

  M_fixerIemeCaractere (&temp, pos, M_obtenirIemeCaractere (temp, pos+1));
  M_fixerIemeCaractere (&temp, pos+1, tempCar);

  return temp;
}

M_Mot M_supprimerLettre (M_Mot mot, unsigned int pos){
  assert(((0 <= pos) && (pos <= M_obtenirLongueur(mot)-1)) &&
	 (M_obtenirLongueur(mot)>=2));

  int i;
  M_Mot temp=mot;

  for (i=pos; i<=M_obtenirLongueur(temp)-2; i++) {
    M_fixerIemeCaractere (&temp, i, M_obtenirIemeCaractere(temp, i+1));
  }

  M_fixerLongueur(&temp, M_obtenirLongueur(temp)-1);
  M_fixerIemeCaractere (&temp, M_obtenirLongueur(temp), '\0');
  return temp;
}

M_Mot M_insererLettre (M_Mot mot, char lettre, unsigned int pos){
  assert((0 <= pos) && (pos <= M_obtenirLongueur(mot)));

  int i;
  M_Mot temp=mot;

  for (i=(int)M_obtenirLongueur(temp)-1; i>=(int)pos; i--) {
    // Je fais un transtypage car sinon le i-- pose probleme
    M_fixerIemeCaractere (&temp, i+1, M_obtenirIemeCaractere(temp, i));
  }

  M_fixerIemeCaractere (&temp, pos, lettre);
  M_fixerLongueur(&temp, M_obtenirLongueur(temp)+1);
  M_fixerIemeCaractere (&temp, M_obtenirLongueur(temp), '\0');
  return temp;
}

int M_sontEgaux (M_Mot mot1, M_Mot mot2) {
  return ((strcmp(M_obtenirLaChaine(mot1), M_obtenirLaChaine(mot2))==0) &&
	  (M_obtenirLongueur(mot1)==M_obtenirLongueur(mot2)));
}
