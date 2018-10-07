/**
 * \file ensemble.h
 * \brief Implantation du TAD Ensemble
 * \author BOUTAYEB Dounia, SAURON Thibault, SESBO�� Matthias, TOOMEY Damien
 * \version 1.0
 * \date 04/12/2017
 */

 #ifndef __ENSEMBLE__
 #define __ENSEMBLE__

 #include "listeChaineeMot.h"
 #include "mot.h"

 /**
  * \typedef M_Mot E_Element
  * \brief Le type E_Element permet de repr�senter le type des �l�ments de E_Ensemble
  */
typedef M_Mot E_Element;

 /**
  * \struct E_Ensemble {
  *  LCM_ListeChaineeMot lesElements;
  *  unsigned int nbElement;
  * } E_Ensemble;
  * \brief Le type E_Ensemble est une structure contenant lesElements (lien vers l'�l�ment suivant) et le nombre d'�l�ments
  * \brief Elle permet de repr�senter une liste d'�l�ments uniques sans ordre
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
 * \brief Fonction qui permet d'obtenir le nombre d'�l�ments d'un ensemble
 * \param e l'ensemble
 * \return unsigned int
 */
unsigned int E_obtenirNbElement (E_Ensemble e);

/**
 * \fn void E_fixerLesElements (E_Ensemble* e, LCM_ListeChaineeMot listeElements)
 * \brief Fonction qui permet de fixer le champ lesElements de E_Ensemble � partir d'une liste cha�n�e en entr�e
 * \param *e l'ensemble
 * \param listeElements la liste � fixer
 */
void E_fixerLesElements (E_Ensemble* e, LCM_ListeChaineeMot listeElements);

/**
 * \fn E_Ensemble E_ensemble()
 * \brief Fonction de cr�ation d'un ensemble
 * \return E_Ensemble
 */
E_Ensemble E_ensemble();

/**
 * \fn void E_ajouter(E_Ensemble* e, E_Element el)
 * \brief Procedure qui permet d'ajouter un �l�ment (donn� en entr�e) dans un ensemble
 * \param *e l'ensemble
 * \param el l'�l�ment donn� en entr�e
 */
void E_ajouter(E_Ensemble* e, E_Element el);

/**
 * \fn unsigned int E_cardinalite(E_Ensemble e)
 * \brief Fonction qui permet de conna�tre le nombre d'�l�ment d'un ensemble
 * \param e l'ensemble
 * \return unsigned int
 */
unsigned int E_cardinalite(E_Ensemble e);

/**
 * \fn int E_estPresent(E_Ensemble e, E_Element el)
 * \brief Fonction qui permet de savoir si un �l�ment est pr�sent dans un ensemble
 * \param e l'ensemble
 * \param el l'�l�ment
 * \return int
 */
int E_estPresent(E_Ensemble e, E_Element el);

/**
 * \fn void E_retirer(E_Ensemble* e, E_Element el)
 * \brief Fonction qui permet de retirer un �l�ment d'un ensemble
 * \param *e l'ensembe
 * \param el l'�l�ment � retirer
 */
void E_retirer(E_Ensemble* e, E_Element el);

#endif
