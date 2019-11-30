%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>

  extern int linea;
  extern int columna;
  extern FILE * yyout;
%}


/* Palabras reservadas */
%token TOK_MAIN
%token TOK_INT
%token TOK_BOOLEAN
%token TOK_ARRAY
%token TOK_FUNCTION
%token TOK_IF
%token TOK_ELSE
%token TOK_WHILE
%token TOK_SCANF
%token TOK_PRINTF
%token TOK_RETURN


/* Símbolos */
%token TOK_PUNTOYCOMA
%token TOK_PUNTOYCOMA
%token TOK_PARENTESISIZQUIERDO
%token TOK_PARENTESISDERECHO
%token TOK_CORCHETEIZQUIERDO
%token TOK_CORCHETEDERECHO
%token TOK_LLAVEIZQUIERDA
%token TOK_LLAVEDERECHA
%token TOK_ASIGNACION
%token TOK_MAS
%token TOK_MENOS
%token TOK_DIVISION
%token TOK_ASTERISCO
%token TOK_AND
%token TOK_OR
%token TOK_NOT
%token TOK_IGUA
%token TOK_DISTINTO
%token TOK_MENORIGUAL
%token TOK_MAYORIGUAL
%token TOK_MENOR
%token TOK_MAYOR


/* Identificadores  */
%token TOK_IDENTIFICADOR

/* Constantes */
%token TOK_CONSTANTE_ENTERA
%token TOK_TRUE
%token TOK_FALSE


/* Errores */
%token TOK_ERROR

%%

/* No se muy bien como hacer lo de los numeros */
/*;R1:	<programa> ::= main { <declaraciones> <funciones> <sentencias> }*/
programa: TOK_MAIN TOK_LLAVEIZQUIERDA declaraciones funciones sentencias TOK_LLAVEDERECHA
          {fprintf(out, ";R%d:\t<programa> ::= main { <declaraciones> <funciones> <sentencias> }\n", linea);};

/*;R2:	<declaraciones> ::= <declaracion>*/
/*;R3:	<declaraciones> ::= <declaracion> <declaraciones>*/
declaraciones: declaracion {fprintf(fout, ";R%d:	<declaraciones> ::= <declaracion>\n", linea);}
			           | declaracion declaraciones {fprintf(fout, ";R%d:	<declaraciones> ::= <declaracion> <declaraciones>\n", linea);};

/*;R4:	<declaracion> ::= <clase> <identificadores>*/
declaracion:




%%

void yyerror(const char * s) {
    if(!is_morpho) {
        printf("****Error sintactico en [linea %ld, columna %ld]\n", linea, columna);
    }
}
