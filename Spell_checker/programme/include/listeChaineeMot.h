/**
 * \file listeChaineeMot.h
 * \brief Implantation du TAD Liste Chain�e
 * \author BOUTAYEB Dounia, SAURON Thibault, SESBO�� Matthias, TOOMEY Damien
 * \version 1.0
 * \date 06/12/2017
 */

#ifndef _LISTE_CHAINEE_MOT_
#define _LISTE_CHAINEE_MOT_

#include <errno.h>
#include "mot.h"

/**
 * \brief LCM_ERREUR_MEMOIRE 1
 * \brief D�finition d'une constante utilis�e pour v�rifier le fonctionnement de l'allocation m�moire avec errno
 */
 #define LCM_ERREUR_MEMOIRE 1

/**
 * \typedef LCM_Noeud *LCM_ListeChaineeMot
 * \brief Le type ListeChainee permet de repr�senter une liste chain�e de mots
 */
typedef struct LCM_Noeud *LCM_ListeChaineeMot;

/**
 * \struct LCM_Noeud {
 * M_Mot element;
 * LCM_ListeChaineeMot listeSuivante;
 * } LCM_Noeud;
 * \brief Le type LCM_Noeud est une structure contenant un element et la liste suivante
 */
typedef struct LCM_Noeud {
	M_Mot element;
	LCM_ListeChaineeMot listeSuivante;
} LCM_Noeud;

/**
 * \fn LCM_ListeChaineeMot LCM_listeChaineeMot();
 * \brief Fonction de cr�ation d'une liste chain�e de Mot
 * \return LCM_ListeChaineeMot
 */
LCM_ListeChaineeMot LCM_listeChaineeMot();

/**
 * \fn int LCM_estVide(LCM_ListeChaineeMot l)
 * \brief Fonction qui permet de savoir si une liste de Mot est vide
 * \param l une liste chain�e de mot
 * \return int
 */
int LCM_estVide(LCM_ListeChaineeMot l);

/**
 * \fn void LCM_ajouter(LCM_ListeChaineeMot *pl, M_Mot mot)
 * \brief Proc�dure qui permet d'ajouter un Mot dans une liste de Mot
 * \param *pl une liste chainee de mot
 * \param mot un mot
 */
void LCM_ajouter(LCM_ListeChaineeMot *pl, M_Mot mot);

/**
 * \fn M_Mot LCM_obtenirElement(LCM_ListeChaineeMot l)
 * \pre assert(!LCM_estVide(l))
 * \brief Fonction qui permet d'obtenir le mot du noeud d'une Liste de Mot
 * \param l une liste chainee de mot
 * \return M_Mot
 */
M_Mot LCM_obtenirElement(LCM_ListeChaineeMot l);

/**
 * \fn LCM_ListeChaineeMot LCM_obtenirListeSuivante(LCM_ListeChaineeMot l)
 * \pre assert (!LCM_estVide(l))
 * \brief Fonction qui permet d'obtenir la liste suivante du noeud courant d'une liste de Mot
 * \param l une liste chainee de mot
 * \return LCM_ListeChaineeMot
 */
LCM_ListeChaineeMot LCM_obtenirListeSuivante(LCM_ListeChaineeMot l);

/**
 * \fn void LCM_fixerListeSuivante(LCM_ListeChaineeMot* pl, LCM_ListeChaineeMot l)
 * \pre assert (!LCM_estVide(pl))
 * \brief Proc�dure qui permet de fixer la liste suivante du noeud courant d'une liste de Mot
 * \param pl une liste chainee de mot
 * \param l une liste chainee de mot
 */
void LCM_fixerListeSuivante(LCM_ListeChaineeMot pl, LCM_ListeChaineeMot l);

/**
 * \fn void LCM_fixerElement(LCM_ListeChaineeMot* pl, M_Mot mot)
 * \pre assert (!LCM_estVide(pl))
 * \brief Proc�dure qui permet de fixer le champ �l�ment du noeud courant d'une liste de Mot avec un mot donn� en entr�e
 * \param pl une liste chainee de mot
 * \param mot un mot
 */
void LCM_fixerElement(LCM_ListeChaineeMot pl, M_Mot mot);

/**
 * \fn void LCM_supprimerTete(LCM_ListeChaineeMot *pl)
 * \pre assert (!LCM_estVide(*pl))
 * \brief Proc�dure qui permet de supprimer le noeud courant (la t�te de la liste) d'une liste de Mot
 * \param *pl une liste chainee de mot
 */
void LCM_supprimerTete(LCM_ListeChaineeMot *pl);

/**
 * \fn void LCM_supprimer(LCM_ListeChaineeMot* pl)
 * \brief Proc�dure qui permet de supprimer une liste de Mot
 * \param *pl une liste chainee de mot
 */
void LCM_supprimer(LCM_ListeChaineeMot *pl);

#endif
