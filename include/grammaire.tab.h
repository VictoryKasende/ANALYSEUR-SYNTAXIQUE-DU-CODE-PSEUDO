/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_GRAMMAIRE_TAB_H_INCLUDED
# define YY_YY_GRAMMAIRE_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    INT = 259,
    FLOAT = 260,
    CHAR = 261,
    BOOLEAN = 262,
    DEBUT = 263,
    FIN = 264,
    LIRE = 265,
    ECRIRE = 266,
    AFFECTATION = 267,
    CHAINE = 268,
    SI = 269,
    SINON = 270,
    FIN_SI = 271,
    ALORS = 272,
    LE = 273,
    GE = 274,
    EQ = 275,
    NE = 276,
    ET = 277,
    OU = 278,
    NON = 279,
    ou = 280,
    SUIVANT = 281,
    CAS = 282,
    FAIRE = 283,
    AUTRES = 284,
    ERROR_DECLARATION = 285,
    ERROR_CONDITION = 286,
    POUR = 287,
    A = 288,
    DE = 289,
    FIN_POUR = 290,
    TANT = 291,
    QUE = 292,
    FIN_TANT_QUE = 293,
    REPETER = 294,
    JUSQUA = 295,
    FONCTION = 296,
    RETOURNE = 297,
    STRUCTURE = 298
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 9 "grammaire.y"

    char *str;
    int ival;
    float fval;

#line 107 "grammaire.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_GRAMMAIRE_TAB_H_INCLUDED  */
