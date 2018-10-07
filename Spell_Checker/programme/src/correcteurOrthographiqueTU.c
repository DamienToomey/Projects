#include <stdlib.h>
#include <CUnit/Basic.h>
#include <string.h>
#include "mot.h"
#include "ensemble.h"
#include "dictionnaire.h"
#include "correcteurOrthographique.h"

#define TRUE 1
#define FALSE 0

int init_suite_success(void) {
  return 0;
}

int clean_suite_success(void) {
  return 0;
}

void test_CO_obtenirMot(void){
  M_Mot lemot;
  CO_CorrecteurOrthographique corr;

  strcpy(lemot.laChaine, "bonjour");
  lemot.longueur = 7;
  corr=CO_correcteurOrthographique();
  corr.mot=lemot;

  CU_ASSERT_TRUE(M_sontEgaux(lemot,CO_obtenirMot(corr)));

  strcpy(lemot.laChaine, "écrire");
  lemot.longueur = 6;
  corr=CO_correcteurOrthographique();
  corr.mot=lemot;

  CU_ASSERT_TRUE(M_sontEgaux(lemot,CO_obtenirMot(corr)));
}

void test_CO_fixerMot(void){
  M_Mot lemot;
  CO_CorrecteurOrthographique corr;

  strcpy(lemot.laChaine, "bonjour");
  lemot.longueur = 7;
  corr=CO_correcteurOrthographique();
  CO_fixerMot(&corr,lemot);

  CU_ASSERT_TRUE(M_sontEgaux(lemot,corr.mot));

  strcpy(lemot.laChaine, "écrire");
  lemot.longueur = 7;
  corr=CO_correcteurOrthographique();
  CO_fixerMot(&corr,lemot);

  CU_ASSERT_TRUE(M_sontEgaux(lemot,corr.mot));
}

void test_CO_fixerDictionnaire(void){
  D_Dictionnaire ledico, fils;
  CO_CorrecteurOrthographique corr;
  M_Mot mot1, mot2, mot3, mot4, mot5;
  ledico=D_creerDico();
  fils=AbN_obtenirFils(ledico);
  corr=CO_correcteurOrthographique();

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

  D_insererMot(&fils, mot1);
  D_insererMot(&fils, mot2);
  D_insererMot(&fils, mot3);
  D_insererMot(&fils, mot4);
  D_insererMot(&fils, mot5);

  AbN_fixerFils(&ledico, fils);

  CO_fixerDictionnaire(&corr,ledico);

  CU_ASSERT_TRUE(ledico==corr.dico);

  free(fils);
  free(ledico);
}

void test_CO_obtenirDictionnaire(void){
  D_Dictionnaire ledico, fils;
  CO_CorrecteurOrthographique corr;
  M_Mot mot1, mot2, mot3, mot4, mot5;
  ledico=D_creerDico();
  fils=AbN_obtenirFils(ledico);
  corr=CO_correcteurOrthographique();

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

  D_insererMot(&fils, mot1);
  D_insererMot(&fils, mot2);
  D_insererMot(&fils, mot3);
  D_insererMot(&fils, mot4);
  D_insererMot(&fils, mot5);

  AbN_fixerFils(&ledico, fils);

  corr.dico=ledico;

  CU_ASSERT_TRUE(ledico==CO_obtenirDictionnaire(corr));

  free(fils);
  free(ledico);
}

void test_CO_estBienOrthographie(void){
  D_Dictionnaire ledico, fils;
  CO_CorrecteurOrthographique corr;
  M_Mot mot1, mot2, mot3, mot4, mot5, motf1, motf2;
  ledico=D_creerDico();
  fils=AbN_obtenirFils(ledico);
  corr=CO_correcteurOrthographique();

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

  D_insererMot(&fils, mot1);
  D_insererMot(&fils, mot2);
  D_insererMot(&fils, mot5);
  D_insererMot(&fils, mot3);
  D_insererMot(&fils, mot4);

  AbN_fixerFils(&ledico, fils);

  CO_fixerDictionnaire(&corr,fils);
  CO_fixerMot(&corr,mot1);
  CU_ASSERT_TRUE(CO_estBienOrthographie(corr));

  CO_fixerMot(&corr,mot5);
  CU_ASSERT_TRUE(CO_estBienOrthographie(corr));

  strcpy(motf1.laChaine, "bonjoir");
  motf1.longueur = 7;
  CO_fixerMot(&corr,motf1);
  CU_ASSERT_TRUE(CO_estBienOrthographie(corr)==FALSE);

  strcpy(motf2.laChaine, "écrir");
  motf2.longueur = 5;
  CO_fixerMot(&corr,motf2);
  CU_ASSERT_TRUE(CO_estBienOrthographie(corr)==FALSE);

  free(fils);
  free(ledico);
}

void test_CO_proposerCorrections (void) {
  D_Dictionnaire ledico, fils;
  E_Ensemble lensemble;
  CO_CorrecteurOrthographique corr;
  M_Mot mot1, mot2, mot3, mot4, mot5, mot6, mot7, mot8, mot9, mot10, mot11,
    mot12;
  M_Mot motf1, motf2, motf3, motf4, motf5, motf6;
  lensemble=E_ensemble();
  ledico=D_creerDico();
  fils=AbN_obtenirFils(ledico);
  corr=CO_correcteurOrthographique();

  strcpy(mot1.laChaine, "bonjour");
  mot1.longueur = 7;
  strcpy(mot2.laChaine, "bonsoir");
  mot2.longueur = 7;
  strcpy(mot3.laChaine, "yoyo");
  mot3.longueur = 4;
  strcpy(mot4.laChaine, "test");
  mot4.longueur = 4;
  strcpy(mot5.laChaine, "yin");
  mot5.longueur = 3;
  strcpy(mot6.laChaine, "yen");
  mot6.longueur = 3;
  strcpy(mot7.laChaine, "un");
  mot7.longueur = 2;
  strcpy(mot8.laChaine, "on");
  mot8.longueur = 2;
  strcpy(mot9.laChaine, "in");
  mot9.longueur = 2;
  // Je n'ajoute pas ces deux mots dans le dictionnaire
  strcpy(mot10.laChaine, "en");
  mot10.longueur = 2;
  strcpy(mot11.laChaine, "an");
  mot11.longueur = 2;
  strcpy(mot12.laChaine, "écrire");
  mot12.longueur = 6;

  D_insererMot(&fils, mot1);
  D_insererMot(&fils, mot2);
  D_insererMot(&fils, mot3);
  D_insererMot(&fils, mot4);
  D_insererMot(&fils, mot5);
  D_insererMot(&fils, mot6);
  D_insererMot(&fils, mot7);
  D_insererMot(&fils, mot12);
  D_insererMot(&fils, mot8);
  D_insererMot(&fils, mot9);

  AbN_fixerFils(&ledico, fils);

  CO_fixerDictionnaire(&corr,fils);

  strcpy(motf1.laChaine, "bonjoir");
  motf1.longueur = 7;
  strcpy(motf2.laChaine, "bonsoi");
  motf2.longueur = 6;
  strcpy(motf3.laChaine, "yoyos");
  motf3.longueur = 5;
  strcpy(motf4.laChaine, "tset");
  motf4.longueur = 4;
  strcpy(motf5.laChaine, "yn");
  motf5.longueur = 2;
  strcpy(motf6.laChaine, "écire");
  motf6.longueur = 5;

  CO_fixerMot(&corr,motf1);
  lensemble=CO_proposerCorrections(corr);
  CU_ASSERT_TRUE(E_estPresent(lensemble,mot1));

  CO_fixerMot(&corr,motf2);
  lensemble=CO_proposerCorrections(corr);
  CU_ASSERT_TRUE(E_estPresent(lensemble,mot2));

  CO_fixerMot(&corr,motf3);
  lensemble=CO_proposerCorrections(corr);
  CU_ASSERT_TRUE(E_estPresent(lensemble,mot3));

  CO_fixerMot(&corr,motf4);
  lensemble=CO_proposerCorrections(corr);
  CU_ASSERT_TRUE(E_estPresent(lensemble,mot4));

  CO_fixerMot(&corr,motf6);
  lensemble=CO_proposerCorrections(corr);
  CU_ASSERT_TRUE(E_estPresent(lensemble,mot12));


  CO_fixerMot(&corr,motf5);
  lensemble=CO_proposerCorrections(corr);
  CU_ASSERT_TRUE(E_estPresent(lensemble,mot5)==TRUE);

  CU_ASSERT_TRUE(E_estPresent(lensemble,mot6)==TRUE);
  CU_ASSERT_TRUE(E_estPresent(lensemble,mot7)==TRUE);
  CU_ASSERT_TRUE(E_estPresent(lensemble,mot8)==TRUE);
  CU_ASSERT_TRUE(E_estPresent(lensemble,mot9)==TRUE);
  CU_ASSERT_TRUE(E_estPresent(lensemble,mot10)==FALSE);
  CU_ASSERT_TRUE(E_estPresent(lensemble,mot11)==FALSE);
  // On ne trouvera jamais mot12 car on ne fait d'operation pour obtenir un
  // caractere special
  CU_ASSERT_TRUE(E_estPresent(lensemble,mot12)==FALSE);

  free(fils);
  free(ledico);
}

int main(int argc, char** argv){

  CU_pSuite pSuite = NULL;

  /* initialisation du registre de tests */
  if (CUE_SUCCESS != CU_initialize_registry())
    return CU_get_error();

  /* ajout d'une suite de test */
  pSuite = CU_add_suite("Tests boite noire : correcteurOrthographiqueTU.c",
			init_suite_success, clean_suite_success);
  if (NULL == pSuite) {
    CU_cleanup_registry();
    return CU_get_error();
  }

  /* Ajout des tests Ã  la suite de tests boite noire */
  if ((NULL == CU_add_test(pSuite, "CO_obtenirMot", test_CO_obtenirMot))
      ||(NULL == CU_add_test(pSuite, "CO_obtenirDictionnaire",
			     test_CO_obtenirDictionnaire))
      ||(NULL == CU_add_test(pSuite, "CO_fixerDictionnaire",
			     test_CO_fixerDictionnaire))
      ||(NULL == CU_add_test(pSuite, "CO_fixerMot", test_CO_fixerMot))
      ||(NULL == CU_add_test(pSuite, "CO_estBienOrthographie",
			     test_CO_estBienOrthographie))
      ||(NULL == CU_add_test(pSuite, "CO_proposerCorrections",
			     test_CO_proposerCorrections))
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
