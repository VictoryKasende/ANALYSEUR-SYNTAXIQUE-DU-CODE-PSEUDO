#include <stdio.h>
#include <stdlib.h>
#include <unistd.h> 
#include <string.h> 

int yyparse(void);

extern FILE *yyin;

void yyerror(const char *s) {
    if (strcmp(s, "syntax error") == 0) {
        fprintf(stderr, "Erreur syntaxique : expression incorrecte\n");
    } else {
        fprintf(stderr, "Erreur : %s\n", s);
    }
}

int main() {
    char cwd[300];
    if (getcwd(cwd, sizeof(cwd)) == NULL) {
        perror("Erreur lors de la récupération du répertoire de travail actuel");
        return 1;
    }

    char filename[500];
    snprintf(filename, sizeof(filename), "%s/%s", cwd, "input.txt");

    FILE *file = fopen(filename, "r");
    if (!file) {
        perror("Erreur lors de l'ouverture du fichier");
        return 1;
    }

    yyin = file;

    yyparse();

    fclose(file);

    return 0;
}
