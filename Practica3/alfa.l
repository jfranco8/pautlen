%{

  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include "tokens.h"

  int linea = 1;
  int columna = 0;
  extern FILE * yyout;

%}

%option noyywrap

ENTERO [0-9]+
IDENTIFICADOR ([a-z]|[A-Z])([0-9]|[a-z]|[A-Z])*
ERROR .
LETRA [a-zA-Z]
SALTO \n
COMENTARIO ("//".*\n)
BLANCO [ ]
TABULADOR [\t]

%%


; {
  columna+=yyleng;
	fprintf(yyout, "TOK_PUNTOYCOMA\t%d %s\n", TOK_PUNTOYCOMA, yytext);
	return TOK_PUNTOYCOMA;
}

true {
  columna+=yyleng;
	fprintf(yyout, "TOK_TRUE\t%d %s\n", TOK_TRUE, yytext);
	return TOK_TRUE;
}

false {
  columna+=yyleng;
	fprintf(yyout, "TOK_FALSE\t%d %s\n", TOK_FALSE, yytext);
	return TOK_FALSE;
}

int {
  columna+=yyleng;
	fprintf(yyout, "TOK_INT\t%d %s\n", TOK_INT, yytext);
	return TOK_INT;
}

boolean {
  columna+=yyleng;
	fprintf(yyout, "TOK_BOOLEAN\t%d %s\n", TOK_BOOLEAN, yytext);
	return TOK_BOOLEAN;
}

{BLANCO} {
  columna += yyleng;
}

{TABULADOR} {
  columna += yyleng;
}

{COMENTARIO} {
  linea++;
  columna = 0;
}

{SALTO} {
  linea++;
  columna = 0;
}

array {
  columna+=yyleng;
	fprintf(yyout, "TOK_ARRAY\t%d %s\n", TOK_ARRAY, yytext);
	return TOK_ARRAY;
}

function {
  columna+=yyleng;
	fprintf(yyout, "TOK_FUNCTION\t%d %s\n", TOK_FUNCTION, yytext);
	return TOK_FUNCTION;
}

if {
  columna+=yyleng;
	fprintf(yyout, "TOK_IF\t%d %s\n", TOK_IF, yytext);
	return TOK_IF;
}

else {
  columna+=yyleng;
	fprintf(yyout, "TOK_ELSE\t%d %s\n", TOK_ELSE, yytext);
	return TOK_ELSE;
}

while {
  columna+=yyleng;
	fprintf(yyout, "TOK_WHILE\t%d %s\n", TOK_WHILE, yytext);
	return TOK_WHILE;
}

scanf {
  columna+=yyleng;
	fprintf(yyout, "TOK_SCANF\t%d %s\n", TOK_SCANF, yytext);
	return TOK_SCANF;
}

printf {
  columna+=yyleng;
	fprintf(yyout, "TOK_PRINTF\t%d %s\n", TOK_PRINTF, yytext);
	return TOK_PRINTF;
}

return {
  columna+=yyleng;
	fprintf(yyout, "TOK_RETURN\t%d %s\n", TOK_RETURN, yytext);
	return TOK_RETURN;
}

main {
  columna+=yyleng;
	fprintf(yyout, "TOK_MAIN\t%d %s\n", TOK_MAIN, yytext);
	return TOK_MAIN;
}

, {
  columna+=yyleng;
	fprintf(yyout, "TOK_COMA\t%d %s\n", TOK_COMA, yytext);
	return TOK_COMA;
}

"(" {
  columna+=yyleng;
	fprintf(yyout, "TOK_PARENTESISIZQUIERDO\t%d %s\n", TOK_PARENTESISIZQUIERDO, yytext);
	return TOK_PARENTESISIZQUIERDO;
}

")" {
  columna+=yyleng;
	fprintf(yyout, "TOK_PARENTESISDERECHO\t%d %s\n", TOK_PARENTESISDERECHO, yytext);
	return TOK_PARENTESISDERECHO;
}

"[" {
  columna+=yyleng;
	fprintf(yyout, "TOK_CORCHETEIZQUIERDO\t%d %s\n", TOK_CORCHETEIZQUIERDO, yytext);
	return TOK_CORCHETEIZQUIERDO;
}

"]" {
  columna+=yyleng;
	fprintf(yyout, "TOK_CORCHETEDERECHO\t%d %s\n", TOK_CORCHETEDERECHO, yytext);
	return TOK_CORCHETEDERECHO;
}

"{" {
  columna+=yyleng;
	fprintf(yyout, "TOK_LLAVEIZQUIERDA\t%d %s\n", TOK_LLAVEIZQUIERDA, yytext);
	return TOK_LLAVEIZQUIERDA;
}

"}" {
  columna+=yyleng;
	fprintf(yyout, "TOK_LLAVEDERECHA\t%d %s\n", TOK_LLAVEDERECHA, yytext);
	return TOK_LLAVEDERECHA;
}

"=" {
  columna+=yyleng;
	fprintf(yyout, "TOK_ASIGNACION\t%d %s\n", TOK_ASIGNACION, yytext);
	return TOK_ASIGNACION;
}

"+" {
  columna+=yyleng;
	fprintf(yyout, "TOK_MAS\t%d %s\n", TOK_MAS, yytext);
	return TOK_MAS;
}

"-" {
  columna+=yyleng;
	fprintf(yyout, "TOK_MENOS\t%d %s\n", TOK_MENOS, yytext);
	return TOK_MENOS;
}

"/" {
  columna+=yyleng;
	fprintf(yyout, "TOK_DIVISION\t%d %s\n", TOK_DIVISION, yytext);
	return TOK_DIVISION;
}

"*" {
  columna+=yyleng;
	fprintf(yyout, "TOK_ASTERISCO\t%d %s\n", TOK_ASTERISCO, yytext);
	return TOK_ASTERISCO;
}

"&&" {
  columna+=yyleng;
	fprintf(yyout, "TOK_AND\t%d %s\n", TOK_AND, yytext);
	return TOK_AND;
}

"||" {
  columna+=yyleng;
	fprintf(yyout, "TOK_OR\t%d %s\n", TOK_OR, yytext);
	return TOK_OR;
}

"!" {
  columna+=yyleng;
	fprintf(yyout, "TOK_NOT\t%d %s\n", TOK_NOT, yytext);
	return TOK_NOT;
}

"==" {
  columna+=yyleng;
	fprintf(yyout, "TOK_IGUAL\t%d %s\n", TOK_IGUAL, yytext);
	return TOK_IGUAL;
}

"!=" {
  columna+=yyleng;
	fprintf(yyout, "TOK_DISTINTO\t%d %s\n", TOK_DISTINTO, yytext);
	return TOK_DISTINTO;
}

"<=" {
  columna+=yyleng;
	fprintf(yyout, "TOK_MENORIGUAL\t%d %s\n", TOK_MENORIGUAL, yytext);
	return TOK_MENORIGUAL;
}

">=" {
  columna+=yyleng;
	fprintf(yyout, "TOK_MAYORIGUAL\t%d %s\n", TOK_MAYORIGUAL, yytext);
	return TOK_MAYORIGUAL;
}

"<" {
  columna+=yyleng;
	fprintf(yyout, "TOK_MENOR\t%d %s\n", TOK_MENOR, yytext);
	return TOK_MENOR;
}

">" {
  columna+=yyleng;
	fprintf(yyout, "TOK_MAYOR\t%d %s\n", TOK_MAYOR, yytext);
	return TOK_MAYOR;
}

{IDENTIFICADOR} {
  if(yyleng > 100){
    columna+=yyleng;
  	fprintf(stderr, "****Error en [lin %d, col %d]: identificador demasiado largo (%s)\n", linea, columna, yytext);
  	return TOK_ERROR;
  }
  else{
    columna+=yyleng;
  	fprintf(yyout, "TOK_IDENTIFICADOR\t%d %s\n", TOK_IDENTIFICADOR, yytext);
  	return TOK_IDENTIFICADOR;
  }
}

{ENTERO} {
  columna+=yyleng;
	fprintf(yyout, "TOK_CONSTANTE_ENTERA\t%d %s\n", TOK_CONSTANTE_ENTERA, yytext);
	return TOK_CONSTANTE_ENTERA;
}

{ERROR} {
  columna+=yyleng;
	fprintf(stderr, "****Error en [lin %d, col %d]: simbolo no permitido (%s)\n", linea, columna, yytext);
	return TOK_ERROR;
}


%%
