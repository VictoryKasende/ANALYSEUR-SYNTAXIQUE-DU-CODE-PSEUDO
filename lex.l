%{
#include "grammaire.tab.h"
extern FILE *yyin;
%}

%%

debut { return DEBUT; }
fin { return FIN; }
entier { return INT; }
reel { return FLOAT; }
caractere { return CHAR; }
boolean {return BOOLEAN; }
lire { return LIRE; }
ecrire { return ECRIRE; }
si { return SI; }
sinon { return SINON; }
alors { return ALORS; }
fin_si {return FIN_SI; }
"<="            { return LE; } 
">="            { return GE; } 
"=="            { return EQ; } 
"!="            { return NE; } 
"ET" {return ET;}
"OU" {return OU;}
"NON" {return NON;}
"suivant" {return SUIVANT;}
"faire" {return FAIRE; }
"cas" {return CAS; }
"autres" {return AUTRES;}
"ou" {return ou;}

"pour" {return POUR;}
"de" {return DE;}
"fin_pour" {return FIN_POUR;}

"tant" {return TANT;}
"que" {return QUE;}
"fin_tant_que" {return FIN_TANT_QUE;}

repeter { return REPETER; }
"jusqu'a" { return JUSQUA; }

fonction { return FONCTION; }
retourne { return RETOURNE; }
structure { return STRUCTURE; }

[a-zA-Z][a-zA-Z0-9]* { yylval.str = strdup(yytext); return ID; }
[0-9]+ { yylval.ival = atoi(yytext); return INT; }  
[0-9]+\.[0-9]+ { yylval.fval = atof(yytext); return FLOAT; } 
"'"[^']*"'" { yylval.str = strdup(yytext); return CHAR; } 
\"([^"\\]|\\.)*\"   { yylval.str = strdup(yytext); return CHAINE; }
":=" { return AFFECTATION; } 
[ \t\n] ;
. { return yytext[0]; } 

%%

int yywrap() {
    return 1;
}
