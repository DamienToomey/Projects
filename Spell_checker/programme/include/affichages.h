/**
 * \file affichages.h
 * \brief Implantation des procédures d'affichage
 * \author BOUTAYEB Dounia, SAURON Thibault, SESBOÜÉ Matthias, TOOMEY Damien
 * \version 1.0
 * \date 16/12/2017
 */

#ifndef __affichages__
#define __affichages__

#include "ensemble.h"

/**
 * \fn void A_afficherCorrectionEtPosMot(E_Ensemble lesCorrections, M_Mot leMot, unsigned int pos)
 * \brief Affiche le mot qui était à corriger, la position du mot depuis le début de l'entrée standard, les corrections corrections possibles et le nombre de corrections proposées
 */
void A_afficherCorrectionEtPosMot(E_Ensemble lesCorrections, M_Mot leMot, unsigned int pos);

/**
 * \fn A_affichageMotBienEcrit()
 * \brief Affiche une * quand le mot donné par l'utilisateur dans l'entrée standard est bien orthographié
 */
void A_affichageMotBienEcrit();

/**
 * \fn A_afficherAide()
 * \brief Affiche une aide concernant l'utilisation du programme ASIspell
 */
void A_afficherAide();

#endif
