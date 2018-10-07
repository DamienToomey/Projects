/**
 * \file ensemble.h
 * \brief Implantation du TAD Ensemble
 * \author BOUTAYEB Dounia, SAURON Thibault, SESBOÜÉ Matthias, TOOMEY Damien
 * \version 1.0
 * \date 04/12/2017
 */

 #ifndef __ENSEMBLE__
 #define __ENSEMBLE__

 #include "listeChaineeMot.h"
 #include "mot.h"

 /**
  * \typedef M_Mot E_Element
  * \brief Le type E_Element permet de représenter le type des éléments de E_Ensemble
  */
typedef M_Mot E_Element;

 /**
  * \struct E_Ensemble {
  *  LCM_ListeChaineeMot lesElements;
  *  unsigned int nbElement;
  * } E_Ensemble;
  * \brief Le type E_Ensemble est une structure contenant lesElements (lien vers l'élément suivant) et le nombre d'éléments
  * \brief Elle permet de représenter une liste d'éléments uniques sans ordre
  */
typedef struct E_Ensemble {
  LCM_ListeChaineeMot lesElements;
  unsigned int nbElement;
} E_Ensemble;

/**
 * \fn LCM_ListeChaineeMot E_obtenirLesElements (E_Ensemble e)
 * \brief Fonction qui permet d'obtenir le champe lesElements d'un ensemble
 * \param e l'ensemble
 * \return LCM_ListeChaineeMot
 */
LCM_ListeChaineeMot E_obtenirLesElements (E_Ensemble e);

/**
 * \fn unsigned int E_obtenirNbElement (E_Ensemble e)
 * \brief Fonction qui permet d'obtenir le nombre d'éléments d'un ensemble
 * \param e l'ensemble
 * \return unsigned int
 */
unsigned int E_obtenirNbElement (E_Ensemble e);

/**
 * \fn void E_fixerLesElements (E_Ensemble* e, LCM_ListeChaineeMot listeElements)
 * \brief Fonction qui permet de fixer le champ lesElements de E_Ensemble à partir d'une liste chaînée en entrée
 * \param *e l'ensemble
 * \param listeElements la liste à fixer
 */
void E_fixerLesElements (E_Ensemble* e, LCM_ListeChaineeMot listeElements);

/**
 * \fn E_Ensemble E_ensemble()
 * \brief Fonction de création d'un ensemble
 * \return E_Ensemble
 */
E_Ensemble E_ensemble();

/**
 * \fn void E_ajouter(E_Ensemble* e, E_Element el)
 * \brief Procedure qui permet d'ajouter un élément (donné en entrée) dans un ensemble
 * \param *e l'ensemble
 * \param el l'élément donné en entrée
 */
void E_ajouter(E_Ensemble* e, E_Element el);

/**
 * \fn unsigned int E_cardinalite(E_Ensemble e)
 * \brief Fonction qui permet de connaître le nombre d'élément d'un ensemble
 * \param e l'ensemble
 * \return unsigned int
 */
unsigned int E_cardinalite(E_Ensemble e);

/**
 * \fn int E_estPresent(E_Ensemble e, E_Element el)
 * \brief Fonction qui permet de savoir si un élément est présent dans un ensemble
 * \param e l'ensemble
 * \param el l'élément
 * \return int
 */
int E_estPresent(E_Ensemble e, E_Element el);

/**
 * \fn void E_retirer(E_Ensemble* e, E_Element el)
 * \brief Fonction qui permet de retirer un élément d'un ensemble
 * \param *e l'ensembe
 * \param el l'élément à retirer
 */
void E_retirer(E_Ensemble* e, E_Element el);

#endif
