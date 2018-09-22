/**
 * \file affichages.h
 * \brief Implantation des proc�dures d'affichage
 * \author BOUTAYEB Dounia, SAURON Thibault, SESBO�� Matthias, TOOMEY Damien
 * \version 1.0
 * \date 16/12/2017
 */

#ifndef __affichages__
#define __affichages__

#include "ensemble.h"

/**
 * \fn void A_afficherCorrectionEtPosMot(E_Ensemble lesCorrections, M_Mot leMot, unsigned int pos)
 * \brief Affiche le mot qui �tait � corriger, la position du mot depuis le d�but de l'entr�e standard, les corrections corrections possibles et le nombre de corrections propos�es
 */
void A_afficherCorrectionEtPosMot(E_Ensemble lesCorrections, M_Mot leMot, unsigned int pos);

/**
 * \fn A_affichageMotBienEcrit()
 * \brief Affiche une * quand le mot donn� par l'utilisateur dans l'entr�e standard est bien orthographi�
 */
void A_affichageMotBienEcrit();

/**
 * \fn A_afficherAide()
 * \brief Affiche une aide concernant l'utilisation du programme ASIspell
 */
void A_afficherAide();

#endif
