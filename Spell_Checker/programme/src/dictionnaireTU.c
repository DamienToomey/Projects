#include <stdlib.h>
#include <CUnit/Basic.h>
#include <string.h>
#include "mot.h"
#include "dictionnaire.h"
#include "existeFichier.h"
#include "arbreN.h"

#define TRUE 1
#define FALSE 0

int init_suite_success(void) {
  return 0;
}

int clean_suite_success(void) {
  return 0;
}

void test_D_estVide(void) {
  D_Dictionnaire dico;

  dico = D_creerDico();
  CU_ASSERT_TRUE(D_estVide(dico)==FALSE);
}

void test_D_estPresent(void) {
  D_Dictionnaire dico, fils;
  M_Mot mot1, mot2, mot3, mot4, mot5;

  dico=D_creerDico();

  strcpy(mot1.laChaine, "bonjour");
  mot1.longueur = 7;
  strcpy(mot2.laChaine, "bonsoir");
  mot2.longueur = 7;
  strcpy(mot3.laChaine, "yoyo");
  mot3.longueur = 4;
  strcpy(mot4.laChaine, "test");
  mot4.longueur = 4;
  strcpy(mot5.laChaine, "écrire");
  mot5.longueur = 6;

  fils = D_chargerDico("dicoTest.txt");
  AbN_fixerFils(&dico, fils);

  CU_ASSERT_TRUE(D_estPresent(fils, mot1));
  CU_ASSERT_TRUE(D_estPresent(fils, mot2));
  CU_ASSERT_TRUE(D_estPresent(fils, mot3));
  CU_ASSERT_TRUE(D_estPresent(fils, mot4));
  CU_ASSERT_TRUE(D_estPresent(fils, mot5));

  free(fils);
  free(dico);
}

void test_D_insererMot(void) {
  D_Dictionnaire dico, fils;
  M_Mot mot1, mot2, mot3, mot4, mot5, mot6, mot7, mot8, mot9, mot10, mot11,
    mot12, mot13, mot14, mot15, mot16;

  dico=D_creerDico();
  fils=AbN_obtenirFils(dico);

  strcpy(mot1.laChaine, "bonjour");
  mot1.longueur = 7;
  strcpy(mot2.laChaine, "bonsoir");
  mot2.longueur = 7;
  strcpy(mot3.laChaine, "yoyo");
  mot3.longueur = 4;
  strcpy(mot4.laChaine, "test");
  mot4.longueur = 4;
  strcpy(mot5.laChaine, "petit");
  mot5.longueur = 5;
  strcpy(mot6.laChaine, "correction");
  mot6.longueur = 10;
  strcpy(mot7.laChaine, "orthographique");
  mot7.longueur = 14;
  strcpy(mot8.laChaine, "un");
  mot8.longueur = 2;
  strcpy(mot9.laChaine, "de");
  mot9.longueur = 2;
  strcpy(mot10.laChaine, "avec");
  mot10.longueur = 4;
  strcpy(mot11.laChaine, "quelques");
  mot11.longueur = 8;
  strcpy(mot13.laChaine, "quelque");
  mot13.longueur = 7;
  strcpy(mot12.laChaine, "fautes");
  mot12.longueur = 6;
  strcpy(mot13.laChaine, "d");
  mot13.longueur = 1;
  strcpy(mot14.laChaine, "orthographe");
  mot14.longueur = 11;
  strcpy(mot15.laChaine, "écrire");
  mot15.longueur = 6;
  strcpy(mot16.laChaine, "petit-beure");
  mot16.longueur = 11;

  D_insererMot(&fils, mot1);
  D_insererMot(&fils, mot2);
  D_insererMot(&fils, mot3);
  D_insererMot(&fils, mot4);
  D_insererMot(&fils, mot5);
  D_insererMot(&fils, mot6);
  D_insererMot(&fils, mot7);
  D_insererMot(&fils, mot8);
  D_insererMot(&fils, mot9);
  D_insererMot(&fils, mot10);
  D_insererMot(&fils, mot11);
  D_insererMot(&fils, mot12);
  D_insererMot(&fils, mot15);
  D_insererMot(&fils, mot13);
  D_insererMot(&fils, mot14);

  AbN_fixerFils(&dico, fils);

  CU_ASSERT_TRUE(D_estPresent(fils, mot1)==TRUE);
  CU_ASSERT_TRUE(D_estPresent(fils, mot2)==TRUE);
  CU_ASSERT_TRUE(D_estPresent(fils, mot3)==TRUE);
  CU_ASSERT_TRUE(D_estPresent(fils, mot4)==TRUE);
  CU_ASSERT_TRUE(D_estPresent(fils, mot5)==TRUE);
  CU_ASSERT_TRUE(D_estPresent(fils, mot6)==TRUE);
  CU_ASSERT_TRUE(D_estPresent(fils, mot7)==TRUE);
  CU_ASSERT_TRUE(D_estPresent(fils, mot8)==TRUE);
  CU_ASSERT_TRUE(D_estPresent(fils, mot9)==TRUE);
  CU_ASSERT_TRUE(D_estPresent(fils, mot10)==TRUE);
  CU_ASSERT_TRUE(D_estPresent(fils, mot11)==TRUE);
  CU_ASSERT_TRUE(D_estPresent(fils, mot12)==TRUE);
  CU_ASSERT_TRUE(D_estPresent(fils, mot13)==TRUE);
  CU_ASSERT_TRUE(D_estPresent(fils, mot14)==TRUE);
  CU_ASSERT_TRUE(D_estPresent(fils, mot15)==TRUE);

  free(fils);
  free(dico);
}

void test_D_chargerDico(void) {
  D_Dictionnaire dico, fils;
  M_Mot mot1, mot2, mot3, mot4, mot5;

  dico=D_creerDico();

  strcpy(mot1.laChaine, "bonjour");
  mot1.longueur = 7;
  strcpy(mot2.laChaine, "bonsoir");
  mot2.longueur = 7;
  strcpy(mot3.laChaine, "yoyo");
  mot3.longueur = 4;
  strcpy(mot4.laChaine, "test");
  mot4.longueur = 4;
  strcpy(mot5.laChaine, "écrire");
  mot5.longueur = 6;

  fils = D_chargerDico("dicoTest.txt");
  AbN_fixerFils(&dico, fils);

  CU_ASSERT_TRUE(D_estPresent(fils, mot1));
  CU_ASSERT_TRUE(D_estPresent(fils, mot2));
  CU_ASSERT_TRUE(D_estPresent(fils, mot3));
  CU_ASSERT_TRUE(D_estPresent(fils, mot4));
  CU_ASSERT_TRUE(D_estPresent(fils, mot5));

  free(fils);
  free(dico);
}

void test_D_sauvegarderDico(void) {
  D_Dictionnaire dico, fils;
  M_Mot mot1, mot2, mot3, mot4, mot5, mot6, mot7;

  dico = D_creerDico();
  fils = AbN_obtenirFils(dico);
  strcpy(mot1.laChaine, "bonjour");
  mot1.longueur = 7;
  strcpy(mot2.laChaine, "bonsoir");
  mot2.longueur = 7;
  strcpy(mot3.laChaine, "yoyo");
  mot3.longueur = 4;
  strcpy(mot4.laChaine, "test");
  mot4.longueur = 4;
  strcpy(mot5.laChaine, "rejouer");
  mot5.longueur = 7;
  strcpy(mot6.laChaine, "bon");
  mot6.longueur = 3;
  strcpy(mot7.laChaine, "écrire");
  mot7.longueur = 6;

  D_insererMot(&fils, mot1);
  D_insererMot(&fils, mot3);
  D_insererMot(&fils, mot2);
  D_insererMot(&fils, mot6);
  D_insererMot(&fils, mot5);
  D_insererMot(&fils, mot7);
  D_insererMot(&fils, mot4);

  AbN_fixerFils(&dico, fils);

  D_sauvegarderDico("dicoTest.txt", fils);

  free(fils);
  free(dico);

  dico = D_creerDico();
  fils = D_chargerDico("dicoTest.txt");
  AbN_fixerFils(&dico, fils);

  CU_ASSERT_TRUE(D_estPresent(fils, mot1));
  CU_ASSERT_TRUE(D_estPresent(fils, mot2));
  CU_ASSERT_TRUE(D_estPresent(fils, mot3));
  CU_ASSERT_TRUE(D_estPresent(fils, mot6));
  CU_ASSERT_TRUE(D_estPresent(fils, mot4));
  CU_ASSERT_TRUE(D_estPresent(fils, mot7));

  free(fils);
  free(dico);
}

int main(int argc, char** argv){
  CU_pSuite pSuite = NULL;

  /* initialisation du registre de tests */
  if (CUE_SUCCESS != CU_initialize_registry())
    return CU_get_error();

  /* ajout d'une suite de test */
  pSuite = CU_add_suite("Tests boite noire : dictionnaireTU.c",
			init_suite_success, clean_suite_success);
  if (NULL == pSuite) {
    CU_cleanup_registry();
    return CU_get_error();
  }

  /* Ajout des tests a la suite de tests boite noire */
  if ((NULL == CU_add_test(pSuite, "D_estVide", test_D_estVide))
      || (NULL == CU_add_test(pSuite, "D_sauvegarderDico",
			      test_D_sauvegarderDico))
      || (NULL == CU_add_test(pSuite, "D_insererMot", test_D_insererMot))
      || (NULL == CU_add_test(pSuite, "D_chargerDico", test_D_chargerDico))
      || (NULL == CU_add_test(pSuite, "D_estPresent", test_D_estPresent))
      )
    {
      CU_cleanup_registry();
      return CU_get_error();
    }

  /* Lancement des tests */
  CU_basic_set_mode(CU_BRM_VERBOSE);
  CU_basic_run_tests();
  printf("\n");
  CU_basic_show_failures(CU_get_failure_list());
  printf("\n\n");

  /* Nettoyage du registre */
  CU_cleanup_registry();
  return CU_get_error();
}
