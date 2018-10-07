#include <stdlib.h>
#include <assert.h>
#include "arbreN.h"
#define NDEBUG

#define TRUE 1
#define FALSE 0
#define charnul '\0'

AbN_ArbreN AbN_creerArbreNonInit (){
  AbN_ArbreN temp= (AbN_ArbreN)malloc(sizeof(AbN_Noeud));
  AbN_fixerFils(&temp, NULL);
  AbN_fixerFrere(&temp, NULL);
  AbN_fixerChar (&temp, charnul);
  AbN_fixerBool (&temp, 0);

  return temp;
}

int AbN_estVide(AbN_ArbreN arbre){
  return (arbre==NULL);
}

int AbN_obtenirBool (AbN_ArbreN arbre){
  assert(!AbN_estVide(arbre));
  return (*arbre).motValide;
}

char AbN_obtenirChar (AbN_ArbreN arbre){
  assert(!AbN_estVide(arbre));
  return (*arbre).lettre;
}

void AbN_fixerBool (AbN_ArbreN* arbre, int valide){
  assert(!AbN_estVide(*arbre));
  (*arbre)->motValide=valide;
}

void AbN_fixerChar (AbN_ArbreN* arbre, char lalettre){
  assert(!AbN_estVide(*arbre));
  (*arbre)->lettre=lalettre;
}

AbN_ArbreN AbN_obtenirFils (AbN_ArbreN arbre){
  assert(!AbN_estVide(arbre));
  return (*arbre).Fils;
}

AbN_ArbreN AbN_obtenirFrere (AbN_ArbreN arbre){
  assert(!AbN_estVide(arbre));
  return (*arbre).Frere;
}

void AbN_fixerFils (AbN_ArbreN* arbre, AbN_ArbreN fils) {
  assert(!AbN_estVide(*arbre));
  (*arbre)->Fils=fils;
}

void AbN_fixerFrere (AbN_ArbreN* arbre, AbN_ArbreN frere) {
  assert(!AbN_estVide(*arbre));
  (*arbre)->Frere=frere;
}
