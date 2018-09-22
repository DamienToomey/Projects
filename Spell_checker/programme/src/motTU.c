#include <stdlib.h>
#include <CUnit/Basic.h>
#include <string.h>
#include "mot.h"

#define TRUE 1
#define FALSE 0

int init_suite_success(void) {
  return 0;
}

int clean_suite_success(void) {
  return 0;
}

void test_M_longueur(void) {
  M_Mot mot;

  M_fixerLaChaine(&mot, "");
  CU_ASSERT_TRUE(M_longueur(mot)==0);
  M_fixerLaChaine(&mot, "1");
  CU_ASSERT_TRUE(M_longueur(mot)==1);
  M_fixerLaChaine(&mot, "12345678");
  CU_ASSERT_TRUE(M_longueur(mot)==8);
  M_fixerLaChaine(&mot, "écrire");
  CU_ASSERT_TRUE(M_longueur(mot)==6);
}

void test_M_obtenirIemeCaractere(void) {
  M_Mot mot;

  M_fixerLaChaine(&mot, "bonsoir");
  M_fixerLongueur(&mot, 7);
  CU_ASSERT_TRUE(M_obtenirIemeCaractere(mot, 0)=='b');
  CU_ASSERT_TRUE(M_obtenirIemeCaractere(mot, 3)=='s');
  CU_ASSERT_TRUE(M_obtenirIemeCaractere(mot, 6)=='r');

  M_fixerLaChaine(&mot, "écrire");
  M_fixerLongueur(&mot, 6);
  CU_ASSERT_TRUE(M_obtenirIemeCaractere(mot, 0)=='é');
  CU_ASSERT_TRUE(M_obtenirIemeCaractere(mot, 3)=='i');
  CU_ASSERT_TRUE(M_obtenirIemeCaractere(mot, 5)=='e');
}

void test_M_remplacerLettre(void) {
  M_Mot mot;
  M_Mot temp;

  M_fixerLaChaine(&mot, "bonsoir");
  M_fixerLongueur(&mot, 7);

  temp=M_remplacerLettre(mot, 0, 'a');
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "aonsoir")==0);
  temp=M_remplacerLettre(mot, 3, 'a');
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "bonaoir")==0);
  temp=M_remplacerLettre(mot, 6, 'a');
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "bonsoia")==0);

  M_fixerLaChaine(&mot, "écrire");
  M_fixerLongueur(&mot, 6);

  temp=M_remplacerLettre(mot, 0, 'a');
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "acrire")==0);
  temp=M_remplacerLettre(mot, 3, 'a');
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "écrare")==0);
  temp=M_remplacerLettre(mot, 5, 'a');
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "écrira")==0);
}

void test_M_inverserDeuxLettresConsecutives(void) {
  M_Mot mot;
  M_Mot temp;

  M_fixerLaChaine(&mot, "bonsoir");
  M_fixerLongueur(&mot, 7);

  temp=M_inverserDeuxLettresConsecutives(mot, 0);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "obnsoir")==0);
  temp=M_inverserDeuxLettresConsecutives(mot, 3);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "bonosir")==0);
  temp=M_inverserDeuxLettresConsecutives(mot, 5);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "bonsori")==0);

  M_fixerLaChaine(&mot, "écrire");
  M_fixerLongueur(&mot, 6);

  temp=M_inverserDeuxLettresConsecutives(mot, 0);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "cérire")==0);
  temp=M_inverserDeuxLettresConsecutives(mot, 3);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "écrrie")==0);
  temp=M_inverserDeuxLettresConsecutives(mot, 4);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "écrier")==0);
}

void test_M_supprimerLettre(void) {
  M_Mot mot;
  M_Mot temp;

  M_fixerLaChaine(&mot, "bonsoir");
  M_fixerLongueur(&mot, 7);

  temp=M_supprimerLettre(mot, 0);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "onsoir")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(temp))==6);
  temp=M_supprimerLettre(mot, 3);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "bonoir")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(temp))==6);
  temp=M_supprimerLettre(mot, 6);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "bonsoi")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(temp))==6);

  M_fixerLaChaine(&mot, "écrire");
  M_fixerLongueur(&mot, 6);

  temp=M_supprimerLettre(mot, 0);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "crire")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(temp))==5);
  temp=M_supprimerLettre(mot, 3);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "écrre")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(temp))==5);
  temp=M_supprimerLettre(mot, 5);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "écrir")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(temp))==5);
}

void test_M_insererLettre(void) {
  M_Mot mot;
  M_Mot temp;

  M_fixerLaChaine(&mot, "bonsoir");
  M_fixerLongueur(&mot, 7);

  temp=M_insererLettre(mot, 'a', 0);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "abonsoir")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(temp))==8);
  temp=M_insererLettre(mot, 'a', 3);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "bonasoir")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(temp))==8);
  temp=M_insererLettre(mot, 'a', 6);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "bonsoiar")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(temp))==8);
  temp=M_insererLettre(mot, 'a', 7);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "bonsoira")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(temp))==8);

  M_fixerLaChaine(&mot, "écrire");
  M_fixerLongueur(&mot, 6);

  temp=M_insererLettre(mot, 'a', 0);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "aécrire")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(temp))==7);
  temp=M_insererLettre(mot, 'a', 3);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "écraire")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(temp))==7);
  temp=M_insererLettre(mot, 'a', 5);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "écrirae")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(temp))==7);
  temp=M_insererLettre(mot, 'a', 6);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "écrirea")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(temp))==7);
}

void test_M_fixerIemeCaractere(void) {
  M_Mot mot;
  M_Mot temp;

  M_fixerLaChaine(&mot, "bonsoir");
  M_fixerLongueur(&mot, 7);

  temp=mot;
  M_fixerIemeCaractere(&temp, 0, 'a');
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "aonsoir")==0);

  temp=mot;
  M_fixerIemeCaractere(&temp, 3, 'a');
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "bonaoir")==0);

  temp=mot;
  M_fixerIemeCaractere(&temp, 6, 'a');
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "bonsoia")==0);

  M_fixerLaChaine(&mot, "écrire");
  M_fixerLongueur(&mot, 6);

  temp=mot;
  M_fixerIemeCaractere(&temp, 0, 'a');
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "acrire")==0);

  temp=mot;
  M_fixerIemeCaractere(&temp, 3, 'a');
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "écrare")==0);

  temp=mot;
  M_fixerIemeCaractere(&temp, 5, 'a');
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(temp), "écrira")==0);
}

void test_M_fixerLaChaine(void) {
  M_Mot mot;
  char temp[10];

  M_fixerLaChaine (&mot, "bonsoir");
  M_fixerLongueur(&mot, 7);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(mot), "bonsoir")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(mot))==7);
  strcpy(temp, M_obtenirLaChaine(mot));
  // Je ne peux pas utiliser M_obtenirIemeCaractere à cause de sa précondition
  CU_ASSERT_TRUE(temp[7]=='\0');

  M_fixerLaChaine (&mot, "écrire");
  M_fixerLongueur(&mot, 6);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(mot), "écrire")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(mot))==6);
  strcpy(temp, M_obtenirLaChaine(mot));
  CU_ASSERT_TRUE(temp[6]=='\0');

}

void test_M_obtenirLaChaine(void) {
  M_Mot mot;
  char temp[10];

  M_fixerLaChaine(&mot, "bonsoir");
  M_fixerLongueur(&mot, 7);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(mot), "bonsoir")==0);
  CU_ASSERT_TRUE(strlen(M_obtenirLaChaine(mot))==7);
  strcpy(temp, M_obtenirLaChaine(mot));
  CU_ASSERT_TRUE(temp[7]=='\0');

  M_fixerLaChaine(&mot, "");
  M_fixerLongueur(&mot, 0);
  CU_ASSERT_TRUE(strcmp(M_obtenirLaChaine(mot), "")==0);
  strcpy(temp, M_obtenirLaChaine(mot));
  // Je ne peux pas utiliser M_obtenirIemeCaractere à cause de sa précondition
  CU_ASSERT_TRUE(temp[0]=='\0');
}

void test_M_fixerLongueur(void) {
  M_Mot mot;

  M_fixerLaChaine(&mot, "bonsoir");
  M_fixerLongueur(&mot, 7);
  CU_ASSERT_TRUE(M_obtenirLongueur(mot)==strlen(M_obtenirLaChaine(mot)));

  M_fixerLaChaine(&mot, "écrire");
  M_fixerLongueur(&mot, 6);
  CU_ASSERT_TRUE(M_obtenirLongueur(mot)==strlen(M_obtenirLaChaine(mot)));
}

void test_M_obtenirLongueur(void) {
  M_Mot mot;

  M_fixerLaChaine(&mot, "bonsoir");
  M_fixerLongueur(&mot, 7);
  CU_ASSERT_TRUE(M_obtenirLongueur(mot)==strlen(M_obtenirLaChaine(mot)));

  M_fixerLaChaine(&mot, "écrire");
  M_fixerLongueur(&mot, 6);
  CU_ASSERT_TRUE(M_obtenirLongueur(mot)==strlen(M_obtenirLaChaine(mot)));
}

void test_M_sontEgaux(void) {
  M_Mot mot1, mot2;

  M_fixerLaChaine(&mot1, "bonsoir");
  M_fixerLongueur(&mot1, 7);
  M_fixerLaChaine(&mot2, "bonsoir");
  M_fixerLongueur(&mot2, 7);
  CU_ASSERT_TRUE(M_sontEgaux(mot1, mot2)==TRUE);

  M_fixerLaChaine(&mot2, "bonsoi");
  M_fixerLongueur(&mot2, 6);
  CU_ASSERT_TRUE(M_sontEgaux(mot1, mot2)==FALSE);


  M_fixerLaChaine(&mot2, "bonjour");
  M_fixerLongueur(&mot2, 7);
  CU_ASSERT_TRUE(M_sontEgaux(mot1, mot2)==FALSE);

  M_fixerLaChaine(&mot1, "");
  M_fixerLongueur(&mot1, 0);
  M_fixerLaChaine(&mot2, "");
  M_fixerLongueur(&mot2, 0);
  CU_ASSERT_TRUE(M_sontEgaux(mot1, mot2)==TRUE);

  M_fixerLongueur(&mot2, 1);
  CU_ASSERT_TRUE(M_sontEgaux(mot1, mot2)==FALSE);

  M_fixerLaChaine(&mot1, "écrire");
  M_fixerLongueur(&mot1, 6);
  M_fixerLaChaine(&mot2, "écrire");
  M_fixerLongueur(&mot2, 6);
  CU_ASSERT_TRUE(M_sontEgaux(mot1, mot2)==TRUE);
}

void test_M_estUneLettre(void) {

  CU_ASSERT_TRUE(M_estUneLettre('e')==TRUE);
  CU_ASSERT_TRUE(M_estUneLettre('E')==TRUE);
  CU_ASSERT_TRUE(M_estUneLettre('%')==FALSE);
  CU_ASSERT_TRUE(M_estUneLettre('!')==FALSE);
}

int main(int argc, char** argv){
  CU_pSuite pSuite = NULL;

  /* initialisation du registre de tests */
  if (CUE_SUCCESS != CU_initialize_registry())
    return CU_get_error();

  /* ajout d'une suite de test */
  pSuite = CU_add_suite("Tests boite noire : MotTU.c", init_suite_success,
			clean_suite_success);
  if (NULL == pSuite) {
    CU_cleanup_registry();
    return CU_get_error();
  }

  /* Ajout des tests a la suite de tests boite noire */
  if ((NULL == CU_add_test(pSuite, "M_longueur", test_M_longueur))
      || (NULL == CU_add_test(pSuite, "M_obtenirIemeCaractere",
			      test_M_obtenirIemeCaractere))
      || (NULL == CU_add_test(pSuite, "M_remplacerLettre",
			      test_M_remplacerLettre))
      || (NULL == CU_add_test(pSuite, "M_inverserDeuxLettresConsecutives",
			      test_M_inverserDeuxLettresConsecutives))
      || (NULL == CU_add_test(pSuite, "M_supprimerLettre",
			      test_M_supprimerLettre))
      || (NULL == CU_add_test(pSuite, "M_insererLettre", test_M_insererLettre))
      || (NULL == CU_add_test(pSuite, "M_fixerIemeCaractere",
			      test_M_fixerIemeCaractere))
      || (NULL == CU_add_test(pSuite, "M_fixerLaChaine", test_M_fixerLaChaine))
      || (NULL == CU_add_test(pSuite, "M_obtenirLaChaine",
			      test_M_obtenirLaChaine))
      || (NULL == CU_add_test(pSuite, "M_fixerLongueur", test_M_fixerLongueur))
      || (NULL == CU_add_test(pSuite, "M_obtenirLongueur",
			      test_M_obtenirLongueur))
      || (NULL == CU_add_test(pSuite, "M_sontEgaux", test_M_sontEgaux))
      || (NULL == CU_add_test(pSuite, "M_estUneLettre", test_M_estUneLettre))
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
