#include <stdio.h>

#define TRUE 1
#define FALSE 0

int F_fichierExiste (char *nomFichier) {
  FILE* fichier=NULL;

  fichier=fopen(nomFichier, "r");
  // j'essaie d'ouvrir le fichier en lecture seule

  if (fichier != NULL) { // si le fichier existe
    fclose(fichier);
    return TRUE;
  }
  else {
    return FALSE;
  }
}
