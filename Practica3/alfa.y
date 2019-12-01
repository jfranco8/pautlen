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

/* No se muy bien como hacer lo de los numeros, me imagino que seran las lineas */
/*;R1:	<programa> ::= main { <declaraciones> <funciones> <sentencias> }*/
programa: TOK_MAIN TOK_LLAVEIZQUIERDA declaraciones funciones sentencias TOK_LLAVEDERECHA
          {fprintf(out, ";R%d:\t<programa> ::= main { <declaraciones> <funciones> <sentencias> }\n", linea);};

/*;R2:	<declaraciones> ::= <declaracion>*/
/*;R3:	<declaraciones> ::= <declaracion> <declaraciones>*/
declaraciones: declaracion {fprintf(fout, ";R%d:	<declaraciones> ::= <declaracion>\n", linea);}
			       | declaracion declaraciones {fprintf(fout, ";R%d:	<declaraciones> ::= <declaracion> <declaraciones>\n", linea);};

/*;R4:	<declaracion> ::= <clase> <identificadores> ;*/
declaracion: clase identificadores ';'
              {fprintf(fout, ";R%d:	<declaracion> ::= <clase> <identificadores> ';'\n", linea);};

/*;R5:	<clase> ::= <clase_escalar>*/
clase: clase_escalar {fprintf(fout, ";R%d:	<clase> ::= <clase_escalar>\n", linea);};

/*;R9:	<clase_escalar> ::= <tipo>*/
clase_escalar: tipo {fprintf(fout, ";R%d:	<clase_escalar> ::= <tipo>\n", linea);};

/*;R10:	<tipo> ::= int*/
tipo: TOK_INT {fprintf(fout, ";R%d:	<tipo> ::= int\n", linea);}
    | TOK_BOOLEAN {fprintf(fout, ";R%d:	<tipo> ::= boolean\n", linea);};

/*;R19:	<identificadores> ::= <identificador> , <identificadores>*/
/*;R18:	<identificadores> ::= <identificador>*/
identificadores: identificador {fprintf(fout, ";R%d:	<identificadores> ::= <identificador>\n", linea);}
			         | identificador identificadores {fprintf(fout, ";R%d:	<identificadores> ::= <identificador> <identificadores>\n", linea);};

/*;R108:	<identificador> ::= TOK_IDENTIFICADOR*/
identificador: TOK_IDENTIFICADOR {fprintf(fout, ";R%d:	<identificador> ::= TOK_IDENTIFICADOR\n", linea);};

/*;R31:	<sentencias> ::= <sentencia> <sentencias>*/
/*;R30:	<sentencias> ::= <sentencia>*/
sentencias: sentencia {fprintf(fout, ";R%d:	<sentencias> ::= <identificador>\n", linea);}
			    | sentencia sentencias {fprintf(fout, ";R%d:	<sentencias> ::= <sentencia> <sentencias>\n", linea);};

/*;R32:	<sentencia> ::= <sentencia_simple> ;*/
sentencia: sentencia_simple {fprintf(fout, ";R%d:	<sentencia> ::= <sentencia_simple>\n", linea);};

/*;R36:	<sentencia_simple> ::= <escritura>*/
/*;R34:	<sentencia_simple> ::= <asignacion>*/
/*;R35:	<sentencia_simple> ::= <lectura>*/
sentencia_simple: escritura {fprintf(fout, ";R%d:	<sentencia_simple> ::= <escritura>\n", linea);}
                | asignacion {fprintf(fout, ";R%d:	<sentencia_simple> ::= <asignacion>\n", linea);}
                | lectura {fprintf(fout, ";R%d:	<sentencia_simple> ::= <lectura>\n", linea);};

/*;R56:	<escritura> ::= printf <exp>*/
/*No se por que no pone el TOK en el print*/
escritura: TOK_PRINTF exp {fprintf(fout, ";R%d:	<escritura> ::= printf <exp>\n", linea);};


/*;R80:	<exp> ::= <identificador>*/
/*;R75:	<exp> ::= <exp> * <exp>*/
/*;R72:	<exp> ::= <exp> + <exp>*/
/*#define TOK_MAS                 209
#define TOK_MENOS               210
#define TOK_DIVISION            211
#define TOK_ASTERISCO           212
#define TOK_AND                 213
#define TOK_OR                  214
#define TOK_NOT                 215
#define TOK_IGUAL               216
#define TOK_DISTINTO            217
#define TOK_MENORIGUAL          218
#define TOK_MAYORIGUAL          219
#define TOK_MENOR               220
#define TOK_MAYOR               221*/
exp: identificador {fprintf(fout, ";R%d:	<exp> ::= <identificador>\n", linea);}
   | exp TOK_MAS exp {fprintf(fout, ";R%d:	<exp> ::= <exp> + <exp>\n", linea);}
   | exp TOK_MENOS exp {fprintf(fout, ";R%d:	<exp> ::= <exp> - <exp>\n", linea);}
   | exp TOK_DIVISION exp {fprintf(fout, ";R%d:	<exp> ::= <exp> / <exp>\n", linea);}
   | exp TOK_ASTERISCO exp {fprintf(fout, ";R%d:	<exp> ::= <exp> * <exp>\n", linea);}
   | exp TOK_AND exp {fprintf(fout, ";R%d:	<exp> ::= <exp> && <exp>\n", linea);}
   | exp TOK_OR exp {fprintf(fout, ";R%d:	<exp> ::= <exp> || <exp>\n", linea);}
   | exp TOK_NOT exp {fprintf(fout, ";R%d:	<exp> ::= <exp> ! <exp>\n", linea);}
   | exp TOK_IGUAL exp {fprintf(fout, ";R%d:	<exp> ::= <exp> = <exp>\n", linea);}
   | exp TOK_DISTINTO exp {fprintf(fout, ";R%d:	<exp> ::= <exp> != <exp>\n", linea);}
   | exp TOK_MENORIGUAL exp {fprintf(fout, ";R%d:	<exp> ::= <exp> <= <exp>\n", linea);}
   | exp TOK_MAYORIGUAL exp {fprintf(fout, ";R%d:	<exp> ::= <exp> >= <exp>\n", linea);}
   | exp TOK_MENOR exp {fprintf(fout, ";R%d:	<exp> ::= <exp> < <exp>\n", linea);}
   | exp TOK_MAYOR exp {fprintf(fout, ";R%d:	<exp> ::= <exp> > <exp>\n", linea);};

/*;R43:	<asignacion> ::= <identificador> = <exp>*/
asignacion: identificador TOK_IGUAL exp {fprintf(fout, ";R%d:	<asignacion> ::= <identificador> = <exp>\n", linea);};

/*;R54:	<lectura> ::= scanf <identificador>*/
lectura: TOK_SCANF identificador {fprintf(fout, ";R%d:	scanf <identificador>n", linea);};

%%

void yyerror(const char * s) {
    if(!is_morpho) {
        printf("****Error sintactico en [linea %ld, columna %ld]\n", linea, columna);
    }
}
