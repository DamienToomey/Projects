/**
 * \file mot.h
 * \brief Implantation du TAD Mot
 * \author BOUTAYEB Dounia, SAURON Thibault, SESBO�� Matthias, TOOMEY Damien
 * \version 1.0
 * \date 07/12/2017
 */
#ifndef __mot__
#define __mot__
/**
 * \brief TAILLE_MAX_MOT 40
 * \brief D�finition d'une constante correspondant � la taille max du mot
 */
#define TAILLE_MAX_MOT 40
/**
 * \struct M_Mot {
 * char laChaine[TAILLE_MAX_MOT]
 * unsigned int longueur;
 * } M_Mot;
 * \brief D�finition du type M_Mot qui est une structure contenant la cha�ne de caract�res de longueur maximum TAILLE_MAX_MOT et la longueur du mot
*/
typedef struct M_Mot {
  char laChaine[TAILLE_MAX_MOT];
  unsigned int longueur;
} M_Mot;
/**
 * \fn unsigned int M_longueur (M_Mot mot)
 * \brief Fonction qui retourne la longueur d'un mot calcul�e avec strlen
 * \param mot le mot
 * \return unsigned int
 */
unsigned int M_longueur (M_Mot mot);
/**
 * \fn char M_obtenirIemeCaractere (M_Mot mot, unsigned int pos)
 * \brief Fonction qui retourne l'i�me caract�re d'un mot
 * \param mot le mot
 * \param pos la position du mot � laquelle on veut acc�der (la position 0 �tant la prem�re lettre de la cha�ne)
 * \return char
 */
char M_obtenirIemeCaractere (M_Mot mot, unsigned int pos);
/**
 * \fn void M_fixerIemeCaractere (M_Mot mot, unsigned int pos, char lettre)
 * \brief Permet de fixer l'i�me caractere d'un mot
 * \param mot le mot
 * \param pos la position du mot � laquelle on veut acc�der
 * \param lettre le caract�re qu'on veut ins�rer � cette position
 */
void M_fixerIemeCaractere (M_Mot *mot, unsigned int pos, char lettre);
/**
 * \fn M_Mot M_remplacerLettre (M_Mot mot, unsigned int pos, char lettre)
 * \brief Fonction qui retourne un nouveau mot � partir d'un mot initial en rempla�ant une lettre par une autre � une position donn�e en entr�e
 * \param mot le mot
 * \param pos la position du mot � laquelle on remplacer la lettre
 * \param lettre lettre qu'on veut mettre � la place d'une autre
 * \return Mot le nouveau mot obtenu
 */
M_Mot M_remplacerLettre (M_Mot mot, unsigned int pos, char lettre);
/**
 * \fn M_Mot M_inverserDeuxLettresConsecutives (M_Mot mot, unsigned int pos)
 * \brief Fonction qui retourne un nouveau mot � partir d'un mot initial en inversant deux lettres cons�cutives � une position donn�e en entr�e
 * \brief On inverse la lettre � la position donn�e en entr�e avec la lettre suivante
 * \param mot le mot
 * \param pos la position du mot � laquelle on veut inverser la lettre avec la lettre suivante
 * \return Mot
 */
M_Mot M_inverserDeuxLettresConsecutives (M_Mot mot, unsigned int pos);
/**
 * \fn M_Mot M_supprimerLettre (M_Mot mot, unsigned int pos)
 * \brief Fonction qui retourne un nouveau mot � partir d'un mot initial en supprimant une lettre � une position donn�e en entr�e
 * \brief La taille du mot est donc r�duite de 1
 * \param mot le mot
 * \param pos la position du mot � laquelle on veut supprimer la lettre
 * \return Mot
 */
M_Mot M_supprimerLettre (M_Mot mot, unsigned int pos);
/**
 * \fn M_Mot M_insererLettre (M_Mot mot, char lettre, unsigned int pos)
 * \brief Fonction qui retourne un nouveau mot � partir d'un mot initial en ins�rant une lettre � une position donn�e en entr�e
 * \brief La taille du mot est donc augment�e de 1
 * \param mot le mot
 * \param lettre la lettre qu'on veut ins�rer
 * \param pos la position du mot � laquelle on veut ins�rer la lettre
 * \return Mot
 */
M_Mot M_insererLettre (M_Mot mot, char lettre, unsigned int pos);

/**
 * \fn void M_obtenirMotEntreeStandard (int *posDepuisDebutFlux, M_Mot *mot, int *arret);
 * \brief Obtient le mot suivant (sans s�parateur (, ; : / ...)) dans l'entr�e standard
 * \param *posDepuisDebutFlux position du mot de depuis le d�but du flux d'entr�e (la position du d�but de l'entr�e standard est 0)
 * \param mot mot sans s�parateur qu'on obtient � partir de l'entr�e standard
 * \param *arret booleen qui permet de savoir si on est arriv� � la fin de l'entr�e standard
 */
void M_obtenirMotEntreeStandard (int *posDepuisDebutFlux, M_Mot *mot, int *arret);
/**
 * \fn void M_fixerLaChaine (M_Mot *mot, char *chaine)
 * \brief Permet de fixer le champ laChaine d'un mot � partir d'une chaine onn�e en entr�e
 * \param *mot une cha�ne de caract�res et sa taille
 * \param *chaine la cha�ne de caract�res qu'on veut stocker dans mot
 */
void M_fixerLaChaine (M_Mot *mot, char *chaine);
/**
 * \fn char* M_obtenirLaChaine(M_Mot mot)
 * \brief Permet d'obtenir la cha�ne de carat�res d'un mot donn� en entr�e
 * \param mot une cha�ne de caract�res et sa taille
 * \return char*
 */
char* M_obtenirLaChaine(M_Mot mot);
/**
 * \fn void M_fixerLongueur(M_Mot *mot, unsigned int length)
 * \brief Permet de fixer le champ longueur d'un mot � partir d'un mot et d'une longueur donn�e en entr�e
 * \param *mot une cha�ne de caract�res et sa taille
 * \param length la longueur de la cha�ne de caract�res du mot
 */
void M_fixerLongueur(M_Mot *mot, unsigned int length);
/**
 * \fn unsigned int M_obtenirLongueur(M_Mot mot)
 * \brief Fonction qui retourne la taille de la cha�ne de carat�res d'un mot donn� en entr�e
 * \param mot une cha�ne de caract�res et sa taille
 * \return unsigned int la longueur de la cha�ne de caract�res du mot
 */
unsigned int M_obtenirLongueur(M_Mot mot);
/**
 * \fn int M_sontEgaux (M_Mot mot1, M_Mot mot2)
 * \brief Fonction qui permet de savoir si deux mots donn�s en entr�e sont �gaux
 * \param mot1 un mot
  * \param mot2 un deuxi�me mot
 * \return int
 */
int M_sontEgaux (M_Mot mot1, M_Mot mot2);
/**
 * \fn int M_estUneLettre (char c)
 * \brief Fonction qui permet de savoir si un caract�re est une lettre
 * \param c caract�re qui peut �tre une lettre ou non
 * \return int
 */
int M_estUneLettre (char c);
#endif
