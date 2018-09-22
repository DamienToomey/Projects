/**
  * \file arbreN.h
  * \brief Implantation des fonctions et procédures d'arbre N-aire
  * \author BOUTAYEB Dounia, SAURON Thibault, SESBOÜÉ Matthias, TOOMEY Damien
  * \version 1.0
  * \date 24/12/2017
  */

#ifndef __arbreN__
#define __arbreN__

/**
 * \typedef AbN_Noeud* AbN_ArbreN
 * \brief Définition du type AbN_ArbreN qui est un pointeur sur la structure noeud
 */
typedef struct AbN_Noeud* AbN_ArbreN;

/**
 * \struct AbN_Noeud {
 * char lettre;
 * int motValide;
 * AbN_ArbreN Fils;
 * AbN_ArbreN Frere;
 * } AbN_Noeud;
 * \brief Définition du type AbN_Noeud qui est une structure contenant une lettre, un booleen pour indiquer si on est arrivé à la fin du mot, le fils et le frère du noeud
 */
typedef struct AbN_Noeud {
  char lettre;
  int motValide;
  AbN_ArbreN Fils;
  AbN_ArbreN Frere;
} AbN_Noeud;

/**
 * \fn AbN_ArbreN AbN_creerArbreNonInit()
 * \brief Crée un arbre non initialisé et l'assigne à une variable
 * \return AbN_ArbreN
 */
AbN_ArbreN AbN_creerArbreNonInit();

/**
 * \fn int AbN_estVide(AbN_ArbreN arbre)
 * \brief Permet de savoir si un arbre est vide ou non
 * \param arbre un arbre N-aire
 * \return int
 */
int AbN_estVide(AbN_ArbreN arbre);

/**
 * \fn int AbN_obtenirBool (AbN_ArbreN arbre)
 * \pre assert(!AbN_estVide(arbre))
 * \brief Accesseur peemettant d'acceder au champ motValide de la structure
 * \param arbre un arbre N-aire
 * \return int
 */
int AbN_obtenirBool (AbN_ArbreN arbre);

/**
 * \fn int AbN_obtenirChar (AbN_ArbreN arbre)
 * \pre assert(!AbN_estVide(arbre))
 * \brief Accesseur permettant d'acceder au champ lettre de la structure
 * \param arbre un arbre N-aire
 * \return char
 */
char AbN_obtenirChar (AbN_ArbreN arbre);

/**
 * \fn void AbN_fixerBool (AbN_ArbreN* arbre, int valide)
 * \pre assert(!AbN_estVide(*arbre))
 * \brief Procédure permettant de fixer le champ motValide de la structure
 * \param arbre un arbre N-aire
 * \param valide le booleen du noeud qui permet de savoir si on est arrivé à la fin du mot
 */
void AbN_fixerBool (AbN_ArbreN* arbre, int valide);

/**
 * \fn void AbN_fixerChar (AbN_ArbreN* arbre, char lalettre)
 * \pre assert(!AbN_estVide(*arbre))
 * \brief Procédure permettant de fixer le champ lettre de la structure
 * \param *arbre un arbre N-aire
 * \param lalettre la lettre du noeud
 */
void AbN_fixerChar (AbN_ArbreN* arbre, char lalettre);

/**
 * \fn AbN_ArbreN AbN_obtenirFils (AbN_ArbreN arbre)
 * \pre assert(!AbN_estVide(arbre))
 * \brief Permet de se déplacer vers le fils de l'arbre en entrée
 * \param arbre un arbre N-aire
 * \return AbN_ArbreN
 */
AbN_ArbreN AbN_obtenirFils (AbN_ArbreN arbre);

/**
 * \fn ArbreN AbN_obtenirFrere (ArbreN arbre)
 * \pre assert(!AbN_estVide(arbre))
 * \brief Permet de se déplacer vers le frère de l'arbre en entrée
 * \param arbre un arbre N-aire
 * \return AbN_ArbreN
 */
AbN_ArbreN AbN_obtenirFrere (AbN_ArbreN arbre);

/**
 * \fn void AbN_fixerFils (AbN_ArbreN* arbre, AbN_ArbreN fils)
 * \brief Permet de fixer un fils à l'arbre courant
 * \param *arbre un arbre N-aire
 * \param fils fils qu'on veut fixer à l'arbre
 */
void AbN_fixerFils (AbN_ArbreN* arbre, AbN_ArbreN fils);

/**
 * \fn void AbN_fixerFrere (AbN_ArbreN* arbre, AbN_ArbreN frere)
 * \brief Permet de fixer un frère à l'arbre courant
 * \param *arbre un arbre N-aire
 * \param frere frère qu'on veut fixer à l'arbre
 */
void AbN_fixerFrere (AbN_ArbreN* arbre, AbN_ArbreN frere);

#endif
