%{
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
int yylex(void);
void yyerror(const char *s);
%}

%union {
    char *str;
    int ival;
    float fval;
}

%token <str> ID
%token <ival> INT
%token <fval> FLOAT
%token CHAR
%token BOOLEAN
%token DEBUT
%token FIN
%token LIRE
%token ECRIRE
%token AFFECTATION
%token CHAINE
%token SI
%token SINON
%token FIN_SI
%token ALORS
%token LE
%token GE
%token EQ
%token NE
%token ET OU NON ou
%token SUIVANT CAS FAIRE AUTRES
%token POUR DE FIN_POUR   
%token TANT QUE FIN_TANT_QUE
%token REPETER JUSQUA
%token FONCTION RETOURNE
%token STRUCTURE
%%

programme: DEBUT instructions FIN
         {
             printf("Analyse syntaxique réussie !\n");
             printf("Le pseudo code fourni est correct\n");
             exit(EXIT_SUCCESS);
         }
         ;

instructions: instruction
            | instructions instruction
            ;

instruction: declaration
           | affectation 
           | lecture
           | ecriture
           | conditionnelle
           | test_suivant_cas
           | boucle_pour
           | boucle_tant_que
           | boucle_repeter
           | fonction
           | appel_fonction
           | structure
           ;

declaration: type ID ';'
           | type ID AFFECTATION expression ';'
           | type ID AFFECTATION appel_fonction
           ;

affectation: ID AFFECTATION expression ';'
            | ID AFFECTATION appel_fonction 
           ;

lecture: LIRE '(' ID ')' ';'
        ;

ecriture: ECRIRE '(' parametres_ecriture ')' ';'
        | ECRIRE parametres_ecriture ';'
        ;

parametres_ecriture: guillemets | expression | parametres_ecriture ',' guillemets | parametres_ecriture ',' expression
                    ;

guillemets: '"' ID '"'
          ;

conditionnelle: SI '(' condition ')' ALORS instructions SINON instructions FIN_SI
               | SI '(' condition ')' ALORS instructions FIN_SI
               | SI '(' condition ')' ALORS SINON instructions FIN_SI
               | SI '(' condition ')' FIN_SI
               | SI condition ALORS instructions SINON instructions FIN_SI
               | SI condition ALORS instructions FIN_SI
               | SI condition ALORS SINON instructions FIN_SI
               | SI condition FIN_SI
               ;

test_suivant_cas:SUIVANT expression FAIRE
                | CAS ou expression instruction
                | AUTRES CAS expression instruction
                ;

boucle_pour: POUR ID DE expression ID expression FAIRE instruction
           ;

boucle_tant_que:TANT QUE condition FAIRE instruction
                ;

boucle_repeter: REPETER instructions JUSQUA condition
              ;

fonction: FONCTION type ID '(' parametres_fonction ')' instruction
        | FONCTION type ID '(' parametres_fonction ')' instruction RETOURNE expression ';'
        ;
        

appel_fonction: ID '(' arguments_fonction ')' ';'
              ;

parametres_fonction: 
                   | parametre
                   | parametres_fonction ',' parametre
                   ;

parametre: type ID
         ;

arguments_fonction: 
                  | argument
                  | arguments_fonction ',' argument
                  ;

argument: expression
        ;


structure: STRUCTURE ID membres 
         ;

membres: declaration
       | membres declaration
       ;

condition: expression '<' expression
          | expression '>' expression
          | expression '=' expression
          | expression LE expression
          | expression GE expression
          | expression EQ expression
          | expression NE expression
          | expression ET expression
          | expression OU expression
          | expression NON expression
          ;


type: INT
    | FLOAT
    | CHAR
    | BOOLEAN
    ;

expression: CHAINE
          | ID
          | INT
          | FLOAT
          | CHAR
          | expression '+' expression
          | expression '-' expression
          | expression '*' expression
          | expression '/' expression
          ;

%%


