/**
 * \file mot.h
 * \brief Implantation du TAD Mot
 * \author BOUTAYEB Dounia, SAURON Thibault, SESBOÜÉ Matthias, TOOMEY Damien
 * \version 1.0
 * \date 07/12/2017
 */
#ifndef __mot__
#define __mot__
/**
 * \brief TAILLE_MAX_MOT 40
 * \brief Définition d'une constante correspondant à la taille max du mot
 */
#define TAILLE_MAX_MOT 40
/**
 * \struct M_Mot {
 * char laChaine[TAILLE_MAX_MOT]
 * unsigned int longueur;
 * } M_Mot;
 * \brief Définition du type M_Mot qui est une structure contenant la chaîne de caractères de longueur maximum TAILLE_MAX_MOT et la longueur du mot
*/
typedef struct M_Mot {
  char laChaine[TAILLE_MAX_MOT];
  unsigned int longueur;
} M_Mot;
/**
 * \fn unsigned int M_longueur (M_Mot mot)
 * \brief Fonction qui retourne la longueur d'un mot calculée avec strlen
 * \param mot le mot
 * \return unsigned int
 */
unsigned int M_longueur (M_Mot mot);
/**
 * \fn char M_obtenirIemeCaractere (M_Mot mot, unsigned int pos)
 * \brief Fonction qui retourne l'ième caractère d'un mot
 * \param mot le mot
 * \param pos la position du mot à laquelle on veut accéder (la position 0 étant la premère lettre de la chaîne)
 * \return char
 */
char M_obtenirIemeCaractere (M_Mot mot, unsigned int pos);
/**
 * \fn void M_fixerIemeCaractere (M_Mot mot, unsigned int pos, char lettre)
 * \brief Permet de fixer l'ième caractere d'un mot
 * \param mot le mot
 * \param pos la position du mot à laquelle on veut accéder
 * \param lettre le caractère qu'on veut insérer à cette position
 */
void M_fixerIemeCaractere (M_Mot *mot, unsigned int pos, char lettre);
/**
 * \fn M_Mot M_remplacerLettre (M_Mot mot, unsigned int pos, char lettre)
 * \brief Fonction qui retourne un nouveau mot à partir d'un mot initial en remplaçant une lettre par une autre à une position donnée en entrée
 * \param mot le mot
 * \param pos la position du mot à laquelle on remplacer la lettre
 * \param lettre lettre qu'on veut mettre à la place d'une autre
 * \return Mot le nouveau mot obtenu
 */
M_Mot M_remplacerLettre (M_Mot mot, unsigned int pos, char lettre);
/**
 * \fn M_Mot M_inverserDeuxLettresConsecutives (M_Mot mot, unsigned int pos)
 * \brief Fonction qui retourne un nouveau mot à partir d'un mot initial en inversant deux lettres consécutives à une position donnée en entrée
 * \brief On inverse la lettre à la position donnée en entrée avec la lettre suivante
 * \param mot le mot
 * \param pos la position du mot à laquelle on veut inverser la lettre avec la lettre suivante
 * \return Mot
 */
M_Mot M_inverserDeuxLettresConsecutives (M_Mot mot, unsigned int pos);
/**
 * \fn M_Mot M_supprimerLettre (M_Mot mot, unsigned int pos)
 * \brief Fonction qui retourne un nouveau mot à partir d'un mot initial en supprimant une lettre à une position donnée en entrée
 * \brief La taille du mot est donc réduite de 1
 * \param mot le mot
 * \param pos la position du mot à laquelle on veut supprimer la lettre
 * \return Mot
 */
M_Mot M_supprimerLettre (M_Mot mot, unsigned int pos);
/**
 * \fn M_Mot M_insererLettre (M_Mot mot, char lettre, unsigned int pos)
 * \brief Fonction qui retourne un nouveau mot à partir d'un mot initial en insérant une lettre à une position donnée en entrée
 * \brief La taille du mot est donc augmentée de 1
 * \param mot le mot
 * \param lettre la lettre qu'on veut insérer
 * \param pos la position du mot à laquelle on veut insérer la lettre
 * \return Mot
 */
M_Mot M_insererLettre (M_Mot mot, char lettre, unsigned int pos);

/**
 * \fn void M_obtenirMotEntreeStandard (int *posDepuisDebutFlux, M_Mot *mot, int *arret);
 * \brief Obtient le mot suivant (sans séparateur (, ; : / ...)) dans l'entrée standard
 * \param *posDepuisDebutFlux position du mot de depuis le début du flux d'entrée (la position du début de l'entrée standard est 0)
 * \param mot mot sans séparateur qu'on obtient à partir de l'entrée standard
 * \param *arret booleen qui permet de savoir si on est arrivé à la fin de l'entrée standard
 */
void M_obtenirMotEntreeStandard (int *posDepuisDebutFlux, M_Mot *mot, int *arret);
/**
 * \fn void M_fixerLaChaine (M_Mot *mot, char *chaine)
 * \brief Permet de fixer le champ laChaine d'un mot à partir d'une chaine onnée en entrée
 * \param *mot une chaîne de caractères et sa taille
 * \param *chaine la chaîne de caractères qu'on veut stocker dans mot
 */
void M_fixerLaChaine (M_Mot *mot, char *chaine);
/**
 * \fn char* M_obtenirLaChaine(M_Mot mot)
 * \brief Permet d'obtenir la chaîne de caratères d'un mot donné en entrée
 * \param mot une chaîne de caractères et sa taille
 * \return char*
 */
char* M_obtenirLaChaine(M_Mot mot);
/**
 * \fn void M_fixerLongueur(M_Mot *mot, unsigned int length)
 * \brief Permet de fixer le champ longueur d'un mot à partir d'un mot et d'une longueur donnée en entrée
 * \param *mot une chaîne de caractères et sa taille
 * \param length la longueur de la chaîne de caractères du mot
 */
void M_fixerLongueur(M_Mot *mot, unsigned int length);
/**
 * \fn unsigned int M_obtenirLongueur(M_Mot mot)
 * \brief Fonction qui retourne la taille de la chaîne de caratères d'un mot donné en entrée
 * \param mot une chaîne de caractères et sa taille
 * \return unsigned int la longueur de la chaîne de caractères du mot
 */
unsigned int M_obtenirLongueur(M_Mot mot);
/**
 * \fn int M_sontEgaux (M_Mot mot1, M_Mot mot2)
 * \brief Fonction qui permet de savoir si deux mots donnés en entrée sont égaux
 * \param mot1 un mot
  * \param mot2 un deuxième mot
 * \return int
 */
int M_sontEgaux (M_Mot mot1, M_Mot mot2);
/**
 * \fn int M_estUneLettre (char c)
 * \brief Fonction qui permet de savoir si un caractère est une lettre
 * \param c caractère qui peut être une lettre ou non
 * \return int
 */
int M_estUneLettre (char c);
#endif
