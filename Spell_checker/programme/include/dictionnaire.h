/**
  * \file dictionnaire.h
  * \brief Implantation du TAD Dictionnaire
  * \author BOUTAYEB Dounia, SAURON Thibault, SESBO�� Matthias, TOOMEY Damien
  * \version 1.0
  * \date 06/12/2017
  */

#ifndef __dictionnaire__
#define __dictionnaire__

#include "arbreN.h"

/**
 * \typedef AbN_ArbreN D_Dictionnaire;
 * \brief Le type D_Dictionnaire permet de repr�senter un dictionnaire
 */
typedef AbN_ArbreN D_Dictionnaire;

/**
  * \fn D_Dictionnaire D_creerDico ()
  * \brief Fonction qui permet de cr�er une racine avec des champs initialis�s � "rien"
  * (NULL pour le fr�re et le fils, 0 pour le champs motValide et charnull ('\0') pour le champ lettre)
  * \return D_Dictionnaire
  */
D_Dictionnaire D_creerDico ();

/**
  * \fn int D_estVide (D_Dictionnaire dico)
  * \brief Fonction qui permet de savoir si un dictionnaire est vide
  * \param dico un dictionnaire
  * \return int
  */
int D_estVide (D_Dictionnaire dico);

/**
  * \fn int D_estPresent (D_Dictionnaire dico, M_Mot mot)
  * \brief Fonction qui permet de savoir si mot est pr�sent dans un dictionnaire
  * \param dico un dictionnaire
  * \param mot le mot
  * \return int
  */
int D_estPresent (D_Dictionnaire dico, M_Mot mot);

/**
  * \fn void D_insererMot(D_Dictionnaire* dico, M_Mot mot)
  * \brief Proc�dure permettant d'ins�rer un mot dans un dictionnaire
  * \param *dico un dictionnaire
  * \param mot un mot
  */
void D_insererMot(D_Dictionnaire* dico, M_Mot lemot);

/**
  * \fn void D_sauvegarderDico (char nomFichier[], Dictionnaire dico)
  * \brief Proc�dure qui permer la sauvegarde du SDD Dictionnaire � partir
  * \brief du nom du fichier du dictionnaire et le SDD Dictionnaire
  * \param nomFichier[] le nom du fichier o� l'on va sauvegarder le Dictionnaire (francais.dico par exemple)
  * \param dico un dictionnaire
  */
void D_sauvegarderDico (char nomFichier[], D_Dictionnaire dico);

/**
  * \fn D_Dictionnaire D_chargerDico (char nomFichier[])
  * \pre assert(F_fichierExiste(nomFichier)==TRUE)
  * \brief Fonction qui permet de charger un Dictionnaire � partir du nom du fichier contenant le dictionnaire (francais.dico par exemple)
  * \param nomFichier[] le nom du fichier d'o� on va charger le Dictionnaire (francais.dico par exemple)
  * \return D_Dictionnaire
  */
D_Dictionnaire D_chargerDico (char nomFichier[]);

#endif
