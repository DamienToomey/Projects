#include <stdlib.h>
#include <stdio.h>
#include <CUnit/Basic.h>
#include <string.h>
#include "listeChaineeMot.h"
#include "mot.h"

#define TRUE 1
#define FALSE 0

int init_suite_success(void) {
  return 0;
}

int clean_suite_success(void) {
  return 0;
}

/* Partie privée */
void initialiserListePourTestsUnitaires(LCM_ListeChaineeMot *l, char *laChaine,
					unsigned int longueur) {
  M_Mot mot;

  M_fixerLaChaine(&mot, laChaine);
  M_fixerLongueur(&mot, longueur);
  LCM_ajouter(l, mot);
}

/* Partie publique */
void test_LCM_listeChaineeMot(void) {
  CU_ASSERT_TRUE(LCM_listeChaineeMot()==NULL);
}

void test_LCM_estVide(void) {
  LCM_ListeChaineeMot l;

  l=LCM_listeChaineeMot();
  CU_ASSERT_TRUE(LCM_estVide(l)==TRUE);

  initialiserListePourTestsUnitaires(&l, "bonsoir", 7);
  CU_ASSERT_TRUE(LCM_estVide(l)==FALSE);

  l=LCM_listeChaineeMot();
  CU_ASSERT_TRUE(LCM_estVide(l)==TRUE);

  initialiserListePourTestsUnitaires(&l, "écrire", 6);
  CU_ASSERT_TRUE(LCM_estVide(l)==FALSE);
}

void test_LCM_ajouter(void) {
  LCM_ListeChaineeMot l;

  l=LCM_listeChaineeMot();

  initialiserListePourTestsUnitaires(&l, "bonsoir", 7);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(l)),
			"bonsoir")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(l))==7);

  initialiserListePourTestsUnitaires(&l, "hello", 5);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(l)), "hello")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(l))==5);

  initialiserListePourTestsUnitaires(&l, "écrire", 6);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(l)),
			"écrire")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(l))==6);
}

void test_LCM_obtenirElement(void) {
  LCM_ListeChaineeMot l;

  l=LCM_listeChaineeMot();

  initialiserListePourTestsUnitaires(&l, "bonsoir", 7);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(l)),
			"bonsoir")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(l))==7);

  initialiserListePourTestsUnitaires(&l, "hello", 5);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(l)),
			"hello")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(l))==5);

  initialiserListePourTestsUnitaires(&l, "écrire", 5);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(l)),
			"écrire")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(l))==5);
}

void test_LCM_obtenirListeSuivante(void) {
  LCM_ListeChaineeMot l;

  l=LCM_listeChaineeMot();

  initialiserListePourTestsUnitaires(&l, "bonsoir", 7);
  initialiserListePourTestsUnitaires(&l, "hello", 5);

  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(
				 LCM_obtenirListeSuivante(l))), "bonsoir")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(
					     LCM_obtenirListeSuivante(l)))==7);

  l=LCM_listeChaineeMot();

  initialiserListePourTestsUnitaires(&l, "écrire", 6);
  initialiserListePourTestsUnitaires(&l, "hello", 5);

  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(
				  LCM_obtenirListeSuivante(l))), "écrire")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(
					     LCM_obtenirListeSuivante(l)))==6);
}

void test_LCM_fixerListeSuivante(void) {
  LCM_ListeChaineeMot l1, l2;

  l1=LCM_listeChaineeMot();
  l2=LCM_listeChaineeMot();

  initialiserListePourTestsUnitaires(&l1, "bonsoir", 7);
  initialiserListePourTestsUnitaires(&l2, "hello", 5);

  LCM_fixerListeSuivante(l1, l2);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(
				  LCM_obtenirListeSuivante(l1))), "hello")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(
					    LCM_obtenirListeSuivante(l1)))==5);

  l1=LCM_listeChaineeMot();
  l2=LCM_listeChaineeMot();

  initialiserListePourTestsUnitaires(&l1, "écrire", 6);
  initialiserListePourTestsUnitaires(&l2, "hello", 5);

  LCM_fixerListeSuivante(l1, l2);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(
				  LCM_obtenirListeSuivante(l1))), "hello")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(
					    LCM_obtenirListeSuivante(l1)))==5);
}

void test_LCM_fixerElement(void) {
  LCM_ListeChaineeMot l=(LCM_ListeChaineeMot)malloc(sizeof(LCM_Noeud));
  M_Mot mot;

  M_fixerLaChaine(&mot, "bonsoir");
  M_fixerLongueur(&mot, 7);

  LCM_fixerElement(l, mot);

  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(l)),
			"bonsoir")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(l))==7);

  l=(LCM_ListeChaineeMot)malloc(sizeof(LCM_Noeud));

  M_fixerLaChaine(&mot, "écrire");
  M_fixerLongueur(&mot, 6);

  LCM_fixerElement(l, mot);

  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(l)),
			"écrire")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(l))==6);
}

void test_LCM_supprimerTete(void) {
  LCM_ListeChaineeMot l;

  l=LCM_listeChaineeMot();

  initialiserListePourTestsUnitaires(&l, "bonsoir", 7);
  initialiserListePourTestsUnitaires(&l, "hello", 5);

  LCM_supprimerTete(&l);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(l)),
			"bonsoir")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(l))==7);

  l=LCM_listeChaineeMot();

  initialiserListePourTestsUnitaires(&l, "écrire", 6);
  initialiserListePourTestsUnitaires(&l, "hello", 5);

  LCM_supprimerTete(&l);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(LCM_obtenirElement(l)),
			"écrire")==0);
  CU_ASSERT_TRUE(M_obtenirLongueur(LCM_obtenirElement(l))==6);
}

void test_LCM_supprimer(void) {
  LCM_ListeChaineeMot l;

  l=LCM_listeChaineeMot();

  initialiserListePourTestsUnitaires(&l, "bonsoir", 7);
  initialiserListePourTestsUnitaires(&l, "hello", 5);
  initialiserListePourTestsUnitaires(&l, "écrire", 6);

  LCM_supprimer(&l);

  CU_ASSERT_TRUE(LCM_estVide(l)==TRUE);
}


int main(int argc, char** argv){
  CU_pSuite pSuite = NULL;

  /* initialisation du registre de tests */
  if (CUE_SUCCESS != CU_initialize_registry())
    return CU_get_error();

  /* ajout d'une suite de test */
  pSuite = CU_add_suite("Tests boite noire : listeChaineeMotTU.c",
			init_suite_success, clean_suite_success);
  if (NULL == pSuite) {
    CU_cleanup_registry();
    return CU_get_error();
  }

  /* Ajout des tests a la suite de tests boite noire */
  if ((NULL == CU_add_test(pSuite, "LCM_listeChaineeMot",
			   test_LCM_listeChaineeMot))
      || (NULL == CU_add_test(pSuite, "LCM_estVide", test_LCM_estVide))
      || (NULL == CU_add_test(pSuite, "LCM_ajouter", test_LCM_ajouter))
      || (NULL == CU_add_test(pSuite, "LCM_obtenirElement",
			      test_LCM_obtenirElement))
      || (NULL == CU_add_test(pSuite, "LCM_obtenirListeSuivante",
			      test_LCM_obtenirListeSuivante))
      || (NULL == CU_add_test(pSuite, "LCM_fixerListeSuivante",
			      test_LCM_fixerListeSuivante))
      || (NULL == CU_add_test(pSuite, "LCM_fixerElement",
			      test_LCM_fixerElement))
      || (NULL == CU_add_test(pSuite, "LCM_supprimerTete",
			      test_LCM_supprimerTete))
      || (NULL == CU_add_test(pSuite, "LCM_supprimer", test_LCM_supprimer))
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
