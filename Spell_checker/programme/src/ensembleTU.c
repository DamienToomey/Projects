#include <stdlib.h>
#include <CUnit/Basic.h>
#include <string.h>
#include "mot.h"
#include "ensemble.h"
#include "listeChaineeMot.h"

#define TRUE 1
#define FALSE 0

int init_suite_success(void) {
  return 0;
}

int clean_suite_success(void) {
  return 0;
}

void test_E_ensemble(void) {
  E_Ensemble e;
  e=E_ensemble();

  CU_ASSERT_TRUE(e.lesElements==LCM_listeChaineeMot());
  CU_ASSERT_TRUE(e.nbElement==0);
}

void test_E_obtenirLesElements(void) {
  E_Ensemble e;
  M_Mot mot;
  E_Element el;

  e=E_ensemble();
  M_fixerLaChaine(&mot, "bonsoir");
  M_fixerLongueur(&mot, 7);
  el=mot;
  E_ajouter(&e, el);

  CU_ASSERT_TRUE(!(LCM_estVide(E_obtenirLesElements(e))));

  e=E_ensemble();
  M_fixerLaChaine(&mot, "écrire");
  M_fixerLongueur(&mot, 6);
  el=mot;
  E_ajouter(&e, el);

  CU_ASSERT_TRUE(!(LCM_estVide(E_obtenirLesElements(e))));
}

void test_E_obtenirNbElement(void) {
  E_Ensemble e;

  e=E_ensemble();
  e.nbElement=3;

  CU_ASSERT_TRUE(E_obtenirNbElement(e)==3);
}

void test_E_cardinalite(void) {
  E_Ensemble e;

  e=E_ensemble();
  e.nbElement=3;

  CU_ASSERT_TRUE(E_cardinalite(e)==3);
}

void test_E_fixerLesElements(void) {
  E_Ensemble e1, e2;
  M_Mot mot;
  E_Element el;

  e1=E_ensemble();
  M_fixerLaChaine(&mot, "bonsoir");
  M_fixerLongueur(&mot, 7);
  el=mot;
  E_ajouter(&e1, el);

  e2=E_ensemble();
  M_fixerLaChaine(&mot, "hello");
  M_fixerLongueur(&mot, 5);
  el=mot;
  E_ajouter(&e2, el);

  E_fixerLesElements(&e1, e2.lesElements);

  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(
	    LCM_obtenirListeSuivante(E_obtenirLesElements(e1)))), "hello")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(LCM_obtenirListeSuivante(
					       E_obtenirLesElements(e1))))==5);

  e1=E_ensemble();
  M_fixerLaChaine(&mot, "bonsoir");
  M_fixerLongueur(&mot, 7);
  el=mot;
  E_ajouter(&e1, el);

  e2=E_ensemble();
  M_fixerLaChaine(&mot, "écrire");
  M_fixerLongueur(&mot, 6);
  el=mot;
  E_ajouter(&e2, el);

  E_fixerLesElements(&e1, e2.lesElements);

  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(
	   LCM_obtenirListeSuivante(E_obtenirLesElements(e1)))), "écrire")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(LCM_obtenirListeSuivante(
					       E_obtenirLesElements(e1))))==6);
}

void test_E_ajouter(void) {
  E_Ensemble e;
  M_Mot mot;
  LCM_ListeChaineeMot listeTest;

  e=E_ensemble();

  M_fixerLaChaine(&mot, "bonjour");
  M_fixerLongueur(&mot, 7);

  listeTest=LCM_listeChaineeMot();

  E_ajouter(&e, mot);

  listeTest=E_obtenirLesElements(e);

  CU_ASSERT_TRUE(!(LCM_estVide(listeTest)));
  CU_ASSERT_TRUE(E_obtenirNbElement(e)==1);

  e=E_ensemble();

  M_fixerLaChaine(&mot, "écrire");
  M_fixerLongueur(&mot, 6);

  listeTest=LCM_listeChaineeMot();

  E_ajouter(&e, mot);

  listeTest=E_obtenirLesElements(e);

  CU_ASSERT_TRUE(!(LCM_estVide(listeTest)));
  CU_ASSERT_TRUE(E_obtenirNbElement(e)==1);
}

void test_E_estPresent(void) {
  E_Ensemble e;
  M_Mot mot1, mot2;
  E_Element el1, el2;

  e=E_ensemble();

  M_fixerLaChaine(&mot1, "bonjour");
  M_fixerLongueur(&mot1, 7);
  el1=mot1;

  M_fixerLaChaine(&mot2, "bonsoir");
  M_fixerLongueur(&mot2, 7);
  el2=mot2;

  E_ajouter(&e, el1);
  E_ajouter(&e, el2);

  CU_ASSERT_TRUE(E_estPresent(e, el1));
  CU_ASSERT_TRUE(E_estPresent(e, el2));

  e=E_ensemble();

  M_fixerLaChaine(&mot1, "écrire");
  M_fixerLongueur(&mot1, 6);
  el1=mot1;

  M_fixerLaChaine(&mot2, "bonsoir");
  M_fixerLongueur(&mot2, 7);
  el2=mot2;

  E_ajouter(&e, el1);
  E_ajouter(&e, el2);

  CU_ASSERT_TRUE(E_estPresent(e, el1));
  CU_ASSERT_TRUE(E_estPresent(e, el2));
}

void test_E_retirer(void) {
  E_Ensemble e;
  M_Mot mot1, mot2, mot3, mot4;
  E_Element el1, el2, el3, el4;

  e=E_ensemble();

  M_fixerLaChaine(&mot1, "bonjour");
  M_fixerLongueur(&mot1, 7);
  el1=mot1;

  M_fixerLaChaine(&mot2, "bonsoir");
  M_fixerLongueur(&mot2, 7);
  el2=mot2;

  M_fixerLaChaine(&mot3, "hello");
  M_fixerLongueur(&mot3, 5);
  el3=mot3;

  M_fixerLaChaine(&mot4, "écrire");
  M_fixerLongueur(&mot4, 6);
  el4=mot4;

  E_ajouter(&e, el1);
  E_ajouter(&e, el2);
  E_ajouter(&e, el4);

  CU_ASSERT_TRUE(E_estPresent(e, el3)==FALSE);
  E_retirer(&e, el3);
  CU_ASSERT_TRUE(E_cardinalite(e)==3);

  E_retirer(&e, el1);

  CU_ASSERT_TRUE(E_estPresent(e, el1)==FALSE);
  CU_ASSERT_TRUE(E_estPresent(e, el2)==TRUE);
  CU_ASSERT_TRUE(E_estPresent(e, el4)==TRUE);
  CU_ASSERT_TRUE(E_cardinalite(e)==2);

  E_retirer(&e, el2);

  CU_ASSERT_TRUE(E_estPresent(e, el2)==FALSE);
  CU_ASSERT_TRUE(E_cardinalite(e)==1);

  E_retirer(&e, el4);
  CU_ASSERT_TRUE(E_estPresent(e, el4)==FALSE);
  CU_ASSERT_TRUE(E_cardinalite(e)==0);
}

int main(int argc, char** argv){
  CU_pSuite pSuite = NULL;

  /* initialisation du registre de tests */
  if (CUE_SUCCESS != CU_initialize_registry())
    return CU_get_error();

  /* ajout d'une suite de test */
  pSuite = CU_add_suite("Tests boite noire : ensembleTU.c",
			init_suite_success, clean_suite_success);
  if (NULL == pSuite) {
    CU_cleanup_registry();
    return CU_get_error();
  }

  /* Ajout des tests à la suite de tests boite noire */
  if ((NULL == CU_add_test(pSuite, "E_ensemble", test_E_ensemble))
      || (NULL == CU_add_test(pSuite, "E_obtenirLesElements",
			      test_E_obtenirLesElements))
      || (NULL == CU_add_test(pSuite, "E_obtenirNbElement",
			      test_E_obtenirNbElement))
      || (NULL == CU_add_test(pSuite, "E_fixerLesElements",
			      test_E_fixerLesElements))
      || (NULL == CU_add_test(pSuite, "E_ajouter", test_E_ajouter))
      || (NULL == CU_add_test(pSuite, "E_cardinalite", test_E_cardinalite))
      || (NULL == CU_add_test(pSuite, "E_estPresent", test_E_estPresent))
      || (NULL == CU_add_test(pSuite, "E_retirer", test_E_retirer))
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
