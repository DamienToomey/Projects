/**
 * \file correcteurOrthographique.h
 * \brief Implantation du TAD CorrecteurOrthographique
 * \author BOUTAYEB Dounia, SAURON Thibault, SESBOÜÉ Matthias, TOOMEY Damien
 * \version 1.0
 * \date 3/12/2017
 */

#ifndef __CORRECTEUR_ORTHOGRAPHIQUE__
#define __CORRECTEUR_ORTHOGRAPHIQUE__

#include "listeChaineeMot.h"
#include "mot.h"
#include "ensemble.h"
#include "dictionnaire.h"

/**
 * \struct CO_CorrecteurOrthographique {
 * M_Mot mot;
 * D_Dictionnaire dico;
 * } CO_CorrecteurOrthographique;
 * \brief Définition du type CO_CorrecteurOrthographique qui est une structure contenant un mot et un dictionnaire
 */
typedef struct CO_CorrecteurOrthographique {
  M_Mot mot;
  D_Dictionnaire dico;
} CO_CorrecteurOrthographique;

/**
 * \fn CO_CorrecteurOrthographique CO_correcteurOrthographique()
 * \brief Fonction permettant de créer une variable de type CO_CorrecteurOrthographique
 * \return CO_CorrecteurOrthographique
 */
CO_CorrecteurOrthographique CO_correcteurOrthographique();

/**
 * \fn M_Mot CO_obtenirMot(CO_CorrecteurOrthographique co)
 * \brief Fonction accesseur permettant d'obtenir le mot contenu dans la variable de type CO_CorrecteurOrthographique.
 * \param co un correcteur orhtographique
 * \return M_Mot
 */
M_Mot CO_obtenirMot(CO_CorrecteurOrthographique co);

/**
 * \fn D_Dictionnaire CO_obtenirDictionnaire(CO_CorrecteurOrthographique co);
 * \brief Fonction accesseur permettant d'obtenir le dictionnaire contenu dans la variable de type CO_CorrecteurOrthographique.
 * \param co un correcteur orhtographique
 * \return D_Dictionnaire
 */
D_Dictionnaire CO_obtenirDictionnaire(CO_CorrecteurOrthographique co);

/**
 * \fn void CO_fixerDictionnaire(CO_CorrecteurOrthographique* co, D_Dictionnaire dico)
 * \brief Procédure permettant de fixer le champ dico de co avec un dictionnaire dico donné en entrée
 * \param *co un correcteur orthographique
 * \param dico un dictionnaire
 */
void CO_fixerDictionnaire(CO_CorrecteurOrthographique* co, D_Dictionnaire dico);

/**
 * \fn void CO_fixerMot(CO_CorrecteurOrthographique* co, M_Mot mot)
 * \brief Procédure permettant de fixer le champ mot de co avec un mot donné entrée
 * \param *co un correcteur orthographique
 * \param mot le mot
 */
void CO_fixerMot(CO_CorrecteurOrthographique* co, M_Mot mot);

/**
 * \fn E_Ensemble CO_proposerCorrections(CO_CorrecteurOrthographique co)
 * \pre assert(!(CO_estBienOrthographie(co)))
 * \brief Fonction retournant l'ensemble des corrections possibles d'un mot
 * \param *co un correcteur orthographique
 * \return E_Ensemble
 */
E_Ensemble CO_proposerCorrections(CO_CorrecteurOrthographique co);

/**
 * \fn int CO_estBienOrthographie(CO_CorrecteurOrthographique co)
 * \brief Fonction permettant de savoir si un mot est présent dans un dictionnaire
 * \brief et donc de savoir s'il est bien orthographié ou non.
 * \param co un correcteur orhtographique
 * \return int
 */
int CO_estBienOrthographie(CO_CorrecteurOrthographique co);

#endif
