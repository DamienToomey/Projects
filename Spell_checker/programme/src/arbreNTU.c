#include <stdlib.h>
#include <CUnit/Basic.h>
#include <string.h>
#include "arbreN.h"

#define TRUE 1
#define FALSE 0
#define charnul '\0'

int init_suite_success(void) {
  return 0;
}

int clean_suite_success(void) {
  return 0;
}

void test_AbN_creerArbreNonInit(void) {
  AbN_ArbreN a;
  a = AbN_creerArbreNonInit();

  CU_ASSERT_TRUE((*a).lettre == charnul);
  CU_ASSERT_TRUE((*a).motValide == FALSE);
  CU_ASSERT_TRUE((*a).Fils == NULL);
  CU_ASSERT_TRUE((*a).Frere == NULL);
}

void test_AbN_estVide(void) {
  AbN_ArbreN a;
  a = NULL;

  CU_ASSERT_TRUE(AbN_estVide(a));
}

void test_AbN_obtenirBool(void) {
  AbN_ArbreN a;

  a = AbN_creerArbreNonInit();
  CU_ASSERT_TRUE(AbN_obtenirBool(a) == FALSE);

  a->motValide = TRUE;
  CU_ASSERT_TRUE(AbN_obtenirBool(a) == TRUE);
}

void test_AbN_obtenirChar(void) {
  AbN_ArbreN a;

  a = AbN_creerArbreNonInit();
  CU_ASSERT_TRUE(AbN_obtenirChar(a) == charnul);

  a->lettre = 'b';
  CU_ASSERT_TRUE(AbN_obtenirChar(a) == 'b');

  a = AbN_creerArbreNonInit();
  CU_ASSERT_TRUE(AbN_obtenirChar(a) == charnul);

  a->lettre = 'é';
  CU_ASSERT_TRUE(AbN_obtenirChar(a) == 'é');
}

void test_AbN_fixerBool(void) {
  AbN_ArbreN a;

  a = AbN_creerArbreNonInit();
  AbN_fixerBool(&a, TRUE);
  CU_ASSERT_TRUE(AbN_obtenirBool(a) == TRUE);

  AbN_fixerBool(&a, FALSE);
  CU_ASSERT_TRUE(AbN_obtenirBool(a) == FALSE);
}

void test_AbN_fixerChar(void) {
  AbN_ArbreN a;

  a = AbN_creerArbreNonInit();
  AbN_fixerChar(&a, 'b');
  CU_ASSERT_TRUE(AbN_obtenirChar(a) == 'b');

  AbN_fixerChar(&a, 'é');
  CU_ASSERT_TRUE(AbN_obtenirChar(a) == 'é');

  AbN_fixerChar(&a, charnul);
  CU_ASSERT_TRUE(AbN_obtenirChar(a) == charnul);
}

void test_AbN_obtenirFrere(void) {
  AbN_ArbreN a, a1, a2, a3;

  a = AbN_creerArbreNonInit();
  CU_ASSERT_TRUE(AbN_estVide(AbN_obtenirFrere(a)));

  a1 = AbN_creerArbreNonInit();
  AbN_fixerBool(&a1, TRUE);
  AbN_fixerChar(&a1, 'b');
  AbN_fixerFrere(&a, a1);

  CU_ASSERT_TRUE(!(AbN_estVide(AbN_obtenirFrere(a))));
  CU_ASSERT_TRUE(AbN_obtenirChar(AbN_obtenirFrere(a)) == 'b');
  CU_ASSERT_TRUE(AbN_obtenirBool(AbN_obtenirFrere(a)) == TRUE);

  a2 = AbN_creerArbreNonInit();
  CU_ASSERT_TRUE(AbN_estVide(AbN_obtenirFrere(a2)));

  a3 = AbN_creerArbreNonInit();
  AbN_fixerBool(&a3, FALSE);
  AbN_fixerChar(&a3, 'é');
  AbN_fixerFrere(&a2, a3);

  CU_ASSERT_TRUE(!(AbN_estVide(AbN_obtenirFrere(a2))));
  CU_ASSERT_TRUE(AbN_obtenirChar(AbN_obtenirFrere(a2)) == 'é');
  CU_ASSERT_TRUE(AbN_obtenirBool(AbN_obtenirFrere(a2)) == FALSE);
}

void test_AbN_obtenirFils(void) {
  AbN_ArbreN a, a1, a2, a3;

  a = AbN_creerArbreNonInit();
  CU_ASSERT_TRUE(AbN_estVide(AbN_obtenirFils(a)));

  a1 = AbN_creerArbreNonInit();
  AbN_fixerBool(&a1, TRUE);
  AbN_fixerChar(&a1, 'b');
  AbN_fixerFils(&a, a1);

  CU_ASSERT_TRUE(!(AbN_estVide(AbN_obtenirFils(a))));
  CU_ASSERT_TRUE(AbN_obtenirChar(AbN_obtenirFils(a)) == 'b');
  CU_ASSERT_TRUE(AbN_obtenirBool(AbN_obtenirFils(a)) == TRUE);

  a2 = AbN_creerArbreNonInit();
  CU_ASSERT_TRUE(AbN_estVide(AbN_obtenirFils(a2)));

  a3 = AbN_creerArbreNonInit();
  AbN_fixerBool(&a3, FALSE);
  AbN_fixerChar(&a3, 'é');
  AbN_fixerFils(&a2, a3);

  CU_ASSERT_TRUE(!(AbN_estVide(AbN_obtenirFils(a2))));
  CU_ASSERT_TRUE(AbN_obtenirChar(AbN_obtenirFils(a2)) == 'é');
  CU_ASSERT_TRUE(AbN_obtenirBool(AbN_obtenirFils(a2)) == FALSE);
}

void test_AbN_fixerFrere(void) {
  AbN_ArbreN a, a1, a2, a3;

  a = AbN_creerArbreNonInit();
  CU_ASSERT_TRUE(AbN_estVide(AbN_obtenirFrere(a)));

  a1 = AbN_creerArbreNonInit();
  AbN_fixerBool(&a1, TRUE);
  AbN_fixerChar(&a1, 'b');
  AbN_fixerFrere(&a, a1);

  CU_ASSERT_TRUE(!(AbN_estVide(AbN_obtenirFrere(a))));
  CU_ASSERT_TRUE(AbN_obtenirChar(AbN_obtenirFrere(a)) == 'b');
  CU_ASSERT_TRUE(AbN_obtenirBool(AbN_obtenirFrere(a)) == TRUE);

  a2 = AbN_creerArbreNonInit();
  CU_ASSERT_TRUE(AbN_estVide(AbN_obtenirFrere(a2)));

  a3 = AbN_creerArbreNonInit();
  AbN_fixerBool(&a3, FALSE);
  AbN_fixerChar(&a3, 'é');
  AbN_fixerFrere(&a2, a3);

  CU_ASSERT_TRUE(!(AbN_estVide(AbN_obtenirFrere(a2))));
  CU_ASSERT_TRUE(AbN_obtenirChar(AbN_obtenirFrere(a2)) == 'é');
  CU_ASSERT_TRUE(AbN_obtenirBool(AbN_obtenirFrere(a2)) == FALSE);
}

void test_AbN_fixerFils(void) {
  AbN_ArbreN a, a1, a2, a3;

  a = AbN_creerArbreNonInit();
  CU_ASSERT_TRUE(AbN_estVide(AbN_obtenirFils(a)));

  a1 = AbN_creerArbreNonInit();
  AbN_fixerBool(&a1, TRUE);
  AbN_fixerChar(&a1, 'b');
  AbN_fixerFils(&a, a1);

  CU_ASSERT_TRUE(!(AbN_estVide(AbN_obtenirFils(a))));
  CU_ASSERT_TRUE(AbN_obtenirChar(AbN_obtenirFils(a)) == 'b');
  CU_ASSERT_TRUE(AbN_obtenirBool(AbN_obtenirFils(a)) == TRUE);

  a2 = AbN_creerArbreNonInit();
  CU_ASSERT_TRUE(AbN_estVide(AbN_obtenirFils(a2)));

  a3 = AbN_creerArbreNonInit();
  AbN_fixerBool(&a3, FALSE);
  AbN_fixerChar(&a3, 'é');
  AbN_fixerFils(&a2, a3);

  CU_ASSERT_TRUE(!(AbN_estVide(AbN_obtenirFils(a2))));
  CU_ASSERT_TRUE(AbN_obtenirChar(AbN_obtenirFils(a2)) == 'é');
  CU_ASSERT_TRUE(AbN_obtenirBool(AbN_obtenirFils(a2)) == FALSE);
}


int main(int argc, char** argv){
  CU_pSuite pSuite = NULL;

  /* initialisation du registre de tests */
  if (CUE_SUCCESS != CU_initialize_registry())
    return CU_get_error();

  /* ajout d'une suite de test */
  pSuite = CU_add_suite("Tests boite noire : arbreNTU.c",
			init_suite_success, clean_suite_success);
  if (NULL == pSuite) {
    CU_cleanup_registry();
    return CU_get_error();
  }

  /* Ajout des tests a la suite de tests boite noire */
  if ((NULL == CU_add_test(pSuite, "AbN_creerArbreNonInit",
			   test_AbN_creerArbreNonInit))
      || (NULL == CU_add_test(pSuite, "AbN_estVide", test_AbN_estVide))
      || (NULL == CU_add_test(pSuite, "AbN_obtenirBool", test_AbN_obtenirBool))
      || (NULL == CU_add_test(pSuite, "AbN_obtenirChar", test_AbN_obtenirChar))
      || (NULL == CU_add_test(pSuite, "AbN_fixerBool", test_AbN_fixerBool))
      || (NULL == CU_add_test(pSuite, "AbN_fixerChar", test_AbN_fixerChar))
      || (NULL == CU_add_test(pSuite, "AbN_obtenirFils", test_AbN_obtenirFils))
      || (NULL == CU_add_test(pSuite, "AbN_obtenirFrere",
			      test_AbN_obtenirFrere))
      || (NULL == CU_add_test(pSuite, "AbN_obtenirFils", test_AbN_fixerFils))
      || (NULL == CU_add_test(pSuite, "AbN_obtenirFrere", test_AbN_fixerFrere))
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
