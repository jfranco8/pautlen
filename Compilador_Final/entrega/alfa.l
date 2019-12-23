%{
  #include "alfa.h"
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include "y.tab.h"

  int linea = 1;
  int columna = 0;
  extern FILE * out;

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
	fprintf(out, ";D: %s\n",yytext);
	return TOK_PUNTOYCOMA;
}

true {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_TRUE;
}

false {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_FALSE;
}

int {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_INT;
}

boolean {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
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
	fprintf(out, ";D: %s\n",yytext);
	return TOK_ARRAY;
}

function {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_FUNCTION;
}

if {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_IF;
}

else {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_ELSE;
}

while {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_WHILE;
}

scanf {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_SCANF;
}

printf {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_PRINTF;
}

return {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_RETURN;
}

main {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_MAIN;
}

, {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_COMA;
}

"(" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_PARENTESISIZQUIERDO;
}

")" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_PARENTESISDERECHO;
}

"[" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_CORCHETEIZQUIERDO;
}

"]" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_CORCHETEDERECHO;
}

"{" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_LLAVEIZQUIERDA;
}

"}" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_LLAVEDERECHA;
}

"=" {
  columna+=yyleng;
  fprintf(out, ";D: %s\n",yytext);
	return TOK_ASIGNACION;
}

"+" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_MAS;
}

"-" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_MENOS;
}

"/" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_DIVISION;
}

"*" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_ASTERISCO;
}

"&&" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_AND;
}

"||" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_OR;
}

"!" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_NOT;
}

"==" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_IGUAL;
}

"!=" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_DISTINTO;
}

"<=" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_MENORIGUAL;
}

">=" {
  columna+=yyleng;
  fprintf(out, ";D: %s\n",yytext);
	return TOK_MAYORIGUAL;
}

"<" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
	return TOK_MENOR;
}

">" {
  columna+=yyleng;
	fprintf(out, ";D: %s\n",yytext);
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
    strcpy(yylval.atributos.lexema, yytext);
    fprintf(out, ";D: %s\n",yytext);
  	return TOK_IDENTIFICADOR;
  }
}

{ENTERO} {
  columna+=yyleng;
  yylval.atributos.valor_entero = atoi(yytext);
	fprintf(out, ";D: %s\n",yytext);
	return TOK_CONSTANTE_ENTERA;
}

{ERROR} {
  columna+=yyleng;
  /* fprintf(out, ";D: %s\n",yytext); */
	return TOK_ERROR;
}


%%
