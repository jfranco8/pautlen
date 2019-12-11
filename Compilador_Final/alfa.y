%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include "alfa.h"
  #include "tabla_simbolos.h"
  #include "genercion.h"

  extern int linea;
  extern int columna;
  extern FILE * yyout;

  int yylex();
  void yyerror(const char *s);

  int tipo_actual;
  int clase_actual;
  int tamanio_vector_actual;
  int pos_variable_local_actual;
  int pos_parametro_actual;
  int num_parametros_llamada_actual;
  int num_variables_locales_actual;
  int en_explist;


%}

%union
{
  tipo_atributos atributos;
}

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
%token TOK_COMA
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
%token TOK_IGUAL
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

/* Resto de los tokens sin valor semantico --> NO SE MUY BIEN CUALES SON, he puesto todas*/
%type <atributos> programa
%type <atributos> declaraciones
%type <atributos> declaracion
%type <atributos> clase
%type <atributos> clase_escalar
%type <atributos> tipo
%type <atributos> clase_vector
%type <atributos> identificadores
%type <atributos> funciones
%type <atributos> funcion
%type <atributos> parametros_funcion
%type <atributos> resto_parametros_funcion
%type <atributos> parametro_funcion
%type <atributos> declaraciones_funcion
%type <atributos> sentencias
%type <atributos> sentencia
%type <atributos> sentencia_simple
%type <atributos> bloque
%type <atributos> asignacion
%type <atributos> elemento_vector
%type <atributos> condicional
%type <atributos> bucle
%type <atributos> lectura
%type <atributos> escritura
%type <atributos> retorno_funcion
%type <atributos> exp
%type <atributos> lista_expresiones
%type <atributos> resto_lista_expresiones
%type <atributos> comparacion
%type <atributos> constante
%type <atributos> constante_logica
%type <atributos> idpf

/* Asociatividad de los operadores para precedencia*/
%left TOK_MAS TOK_MENOS
%left TOK_DIVISION TOK_ASTERISCO
%left TOK_AND TOK_OR TOK_NOT
%left TOK_IGUAL TOK_DISTINTO TOK_MENORIGUAL TOK_MAYORIGUAL TOK_MENOR TOK_MAYOR


/* Comienzo del programa */
%start programa

%%

/* No se muy bien como hacer lo de los numeros, me imagino que seran las lineas */
/*;R1:	<programa> ::= main { <declaraciones> <funciones> <sentencias> }*/
programa: inicioTabla TOK_MAIN TOK_LLAVEIZQUIERDA declaraciones funciones sentencias TOK_LLAVEDERECHA
          {fprintf(yyout, ";R1: <programa> ::= main { <declaraciones> <funciones> <sentencias> }\n");};

inicioTabla: {tabla_simbolos = };

/*;R2:	<declaraciones> ::= <declaracion>*/
/*;R3:	<declaraciones> ::= <declaracion> <declaraciones>*/
declaraciones: declaracion {fprintf(yyout, ";R2:	<declaraciones> ::= <declaracion>\n");}
			       | declaracion declaraciones {fprintf(yyout, ";R3:	<declaraciones> ::= <declaracion> <declaraciones>\n");};

/*;R4:	<declaracion> ::= <clase> <identificadores> ;*/
declaracion: clase identificadores TOK_PUNTOYCOMA
              {fprintf(yyout, ";R4:	<declaracion> ::= <clase> <identificadores> ;\n");};

/*;R5:	<clase> ::= <clase_escalar>*/
/*;R7:	<clase> ::= <clase_vector>*/
clase: clase_escalar {clase_actual = ESCALAR;
                      fprintf(yyout, ";R5:	<clase> ::= <clase_escalar>\n");}
     | clase_vector {clase_actual = VECTOR;
                     fprintf(yyout, ";R7:	<clase> ::= <clase_vector>\n");};

/*;R9:	<clase_escalar> ::= <tipo>*/
clase_escalar: tipo {fprintf(yyout, ";R9:	<clase_escalar> ::= <tipo>\n");};

/*;R10:	<tipo> ::= int*/
/*;R11:	<tipo> ::= boolean*/
tipo: TOK_INT {tipo_actual = INT;
               fprintf(yyout, ";R10:	<tipo> ::= int\n");}
    | TOK_BOOLEAN {tipo_actual = BOOLEAN;
                   fprintf(yyout, ";R11:	<tipo> ::= boolean\n");};

/*;R15:	<clase_vector> ::= array <tipo> [<constante_entera]*/
clase_vector: TOK_ARRAY tipo TOK_CORCHETEIZQUIERDO constante_entera TOK_CORCHETEDERECHO
              {fprintf(yyout, ";R15:	<clase_vector> ::= array <tipo> [constante_entera]\n");
               tamanio_vector_actual = $4.valor_entero;
               if ((tamanio_vector_actual < 1) || (tamanio_vector_actual > MAX_TAMANIO_VECTOR)){
                 fprintf(yyout, "****Error semantico en lin %d: El tamanyo del vector <%s> excede los limites permitidos (1,64)\n", linea, )
                 }};

/*;R18:	<identificadores> ::= <identificador>*/
/*;R19:	<identificadores> ::= <identificador> , <identificadores>*/
identificadores: TOK_IDENTIFICADOR {fprintf(yyout, ";R18:	<identificadores> ::= <TOK_IDENTIFICADOR>\n");}
			         | TOK_IDENTIFICADOR TOK_COMA identificadores {fprintf(yyout, ";R19:	<identificadores> ::= <TOK_IDENTIFICADOR> , <identificadores>\n");};

/*;R20:	<funciones> ::= <funcion> , <funciones>*/
/*;R21:	<funciones> ::= */
funciones: funcion funciones {fprintf(yyout, ";R20:	<funciones> ::= <funcion> <funciones>\n");}
			     | /* vacio en tabla moodle */ {fprintf(yyout, ";R21:	<funciones> ::= \n");}; /*Está vacio a posta */

fn_name: TOK_FUNCTION tipo TOK_IDENTIFICADOR;
fn_declaration: fn_name TOK_PARENTESISIZQUIERDO parametros_funcion TOK_PARENTESISDERECHO TOK_LLAVEIZQUIERDA declaraciones_funcion;
/*;R22: <funcion> ::= function <tipo> <identificador> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }*/
funcion:  fn_declaration sentencias  TOK_LLAVEDERECHA
         {fprintf(yyout, ";R22: <funcion> ::= function <tipo> <TOK_IDENTIFICADOR> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }\n");};

/*;R23: <parametros_funcion> ::= <parametro_funcion> <resto_parametros_funcion>*/
/*;R24: <parametros_funcion> ::= */
parametros_funcion: parametro_funcion resto_parametros_funcion {fprintf(yyout, ";R23:	<parametros_funcion> ::= <parametro_funcion> <resto_parametros_funcion>\n");}
			     | /* vacio en tabla moodle */ {fprintf(yyout, ";R24:	<parametros_funcion> ::= \n");}; /*Está vacio a posta*/


/*;R25: <resto_parametros_funcion> ::= ; <parametro_funcion> <resto_parametros_funcion>*/
/*;R26: <resto_parametros_funcion> ::= */
resto_parametros_funcion: TOK_PUNTOYCOMA parametro_funcion resto_parametros_funcion
                          {fprintf(yyout, ";R25: <resto_parametros_funcion> ::= ; <parametro_funcion> <resto_parametros_funcion>\n");}
			                  | /* vacio en tabla moodle */ {fprintf(yyout, ";R26:	<resto_parametros_funcion> ::= \n");}; /*Está vacio a posta*/

/*;R27: <parametro_funcion> ::= <tipo> <identificador>*/
parametro_funcion: tipo idpf {fprintf(yyout, ";R27: <parametro_funcion> ::= <tipo> <idpf>\n");};

/*;R28: <declaraciones_funcion> ::= <declaraciones>*/
/*;R29: <declaraciones_funcion> ::= */
declaraciones_funcion: declaraciones {fprintf(yyout, ";R28: <declaraciones_funcion> ::= <declaraciones>\n");}
			               | /* vacio en tabla moodle */ {fprintf(yyout, ";R29: <declaraciones_funcion> ::= \n");}; /*Está vacio a posta*/

/*;R30:	<sentencias> ::= <sentencia>*/
/*;R31:	<sentencias> ::= <sentencia> <sentencias>*/
sentencias: sentencia {fprintf(yyout, ";R30:	<sentencias> ::= <sentencia>\n");}
			    | sentencia sentencias {fprintf(yyout, ";R31:	<sentencias> ::= <sentencia> <sentencias>\n");};

/*;R32:	<sentencia> ::= <sentencia_simple> ;*/
/*;R33:	<sentencia> ::= <bloque> ;*/
sentencia: sentencia_simple TOK_PUNTOYCOMA {fprintf(yyout, ";R32:	<sentencia> ::= <sentencia_simple> ;\n");}
         | bloque {fprintf(yyout, ";R33:	<sentencia> ::= <bloque>\n");};

 /*;R34:	<sentencia_simple> ::= <asignacion>*/
 /*;R35:	<sentencia_simple> ::= <lectura>*/
/*;R36:	<sentencia_simple> ::= <escritura>*/
/*;R38:	<sentencia_simple> ::= <retorno_funcion>*/
sentencia_simple: asignacion {fprintf(yyout, ";R34:	<sentencia_simple> ::= <asignacion>\n");}
                | lectura {fprintf(yyout, ";R35:	<sentencia_simple> ::= <lectura>\n");}
                | escritura {fprintf(yyout, ";R36:	<sentencia_simple> ::= <escritura>\n");}
                | retorno_funcion {fprintf(yyout, ";R36:	<sentencia_simple> ::= <retorno_funcion>\n");};

/*;R40 <bloque> ::= <condicional>*/
/*;R41 | <bucle>*/
bloque: condicional {fprintf(yyout, ";R40:	<bloque> ::= <condicional>\n");}
      | bucle {fprintf(yyout, ";R41:	<bloque> ::= <bucle>\n");};

/*;R43:	<asignacion> ::= <identificador> = <exp>*/
/*;R44:	<asignacion> ::= <elemento_vector> = <exp>*/
asignacion: TOK_IDENTIFICADOR TOK_ASIGNACION exp {fprintf(yyout, ";R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>\n");}
          | elemento_vector TOK_ASIGNACION exp {fprintf(yyout, ";R44:	<asignacion> ::= <elemento_vector> = <exp>\n");};

/*;R48: <elemento_vector> ::= <identificador> [ <exp> ]*/
elemento_vector: TOK_IDENTIFICADOR TOK_CORCHETEIZQUIERDO exp TOK_CORCHETEDERECHO
                 {fprintf(yyout, ";R48: <elemento_vector> ::= <TOK_IDENTIFICADOR> [ <exp> ]\n");};

/*;R50: <condicional> ::= if ( <exp> ) { <sentencias> }*/
/*R51:  <condicional> ::= if ( <exp> ) { <sentencias> } else { <sentencias> }*/
condicional: TOK_IF TOK_PARENTESISIZQUIERDO exp TOK_PARENTESISDERECHO TOK_CORCHETEIZQUIERDO sentencias TOK_CORCHETEDERECHO
             {fprintf(yyout, "R50: <condicional> ::= if ( <exp> ) { <sentencias> }\n");}
           | TOK_IF TOK_PARENTESISIZQUIERDO exp TOK_PARENTESISDERECHO TOK_CORCHETEIZQUIERDO sentencias TOK_CORCHETEDERECHO TOK_ELSE TOK_CORCHETEIZQUIERDO sentencias TOK_CORCHETEDERECHO
             {fprintf(yyout, "R51:  <condicional> ::= if ( <exp> ) { <sentencias> } else { <sentencias> }\n");};

/*;R52: <bucle> ::= while ( <exp> ) { <sentencias> }*/
bucle: TOK_WHILE TOK_PARENTESISIZQUIERDO exp TOK_PARENTESISDERECHO TOK_CORCHETEIZQUIERDO sentencias TOK_CORCHETEDERECHO
       {fprintf(yyout, ";R52: <bucle> ::= while ( <exp> ) { <sentencias> }\n");};

/*;R54:	<lectura> ::= scanf <identificador>*/
lectura: TOK_SCANF TOK_IDENTIFICADOR {fprintf(yyout, ";R54:	<lectura> ::= scanf <TOK_IDENTIFICADOR>\n");};

/*;R56:	<escritura> ::= printf <exp>*/
escritura: TOK_PRINTF exp {fprintf(yyout, ";R56:	<escritura> ::= printf <exp>\n");};

/*;R61:	<retorno_funcion> ::= return <exp>*/
retorno_funcion: TOK_RETURN exp {fprintf(yyout, ";R61:	<retorno_funcion> ::= return <exp>\n");};


/*;R72-75:	<exp> ::= <exp> (+ - / *) <exp>*/
/*;R76:	<exp> ::= -<exp>*/
/*;R77-78:	<exp> ::= <exp> (&& ||) <exp>*/
/*;R79:	<exp> ::= !<exp>*/
/*;R80:	<exp> ::= <identificador>*/
/*;R81:	<exp> ::= <constante>*/
/*;R82:	<exp> ::= ( <exp> )*/
/*;R83:	<exp> ::= ( <constante> )*/
/*;R85:	<exp> ::= <elemento_vector>*/
/*;R88:	<exp> ::= <identificador> ( <lista_expresiones> )*/
exp: exp TOK_MAS exp {fprintf(yyout, ";R72:	<exp> ::= <exp> + <exp>\n");}
   | exp TOK_MENOS exp {fprintf(yyout, ";R73:	<exp> ::= <exp> - <exp>\n");}
   | exp TOK_DIVISION exp {fprintf(yyout, ";R74:	<exp> ::= <exp> / <exp>\n");}
   | exp TOK_ASTERISCO exp {fprintf(yyout, ";R75:	<exp> ::= <exp> * <exp>\n");}
   | TOK_MENOS exp {fprintf(yyout, ";R76:	<exp> ::= -<exp>\n");}
   | exp TOK_AND exp {fprintf(yyout, ";R77:	<exp> ::= <exp> && <exp>\n");}
   | exp TOK_OR exp {fprintf(yyout, ";R78:	<exp> ::= <exp> || <exp>\n");}
   | TOK_NOT exp {fprintf(yyout, ";R79:	<exp> ::= ! <exp>\n");}
   | TOK_IDENTIFICADOR {fprintf(yyout, ";R80:	<exp> ::= <TOK_IDENTIFICADOR>\n");}
   | constante
     {fprintf(yyout, ";R81:	<exp> ::= <constante>\n");
      $$.tipo = $1;
      $$.direccion = $1;}
   | TOK_PARENTESISIZQUIERDO exp TOK_PARENTESISDERECHO
     {fprintf(yyout, ";R82:	<exp> ::= ( <exp> )\n");
      $$.tipo = $2;
      $$.direccion = $2;}
   | TOK_PARENTESISIZQUIERDO comparacion TOK_PARENTESISDERECHO
     {fprintf(yyout, ";R83:	<exp> ::= ( <comparacion> )\n");
      $$.tipo = $2;
      $$.direccion = $2;}
   | elemento_vector
     {fprintf(yyout, ";R85:	<exp> ::= <elemento_vector>\n")
      $$.tipo = $1;
      $$.direccion = $1;}
   | idf_llamada_funcion TOK_PARENTESISIZQUIERDO lista_expresiones TOK_PARENTESISDERECHO
     {fprintf(yyout, ";R88:	<exp> ::= <TOK_IDENTIFICADOR> ( <lista_expresiones> )\n");
      en_explist = 0;};

idf_llamada_funcion: TOK_IDENTIFICADOR {};

/*;R89 <lista_expresiones> ::= <exp> <resto_lista_expresiones>*/
/*;R90:	<lista_expresiones> ::=*/
lista_expresiones: exp resto_lista_expresiones
                   {fprintf(yyout, ";R89 <lista_expresiones> ::= <exp> <resto_lista_expresiones>\n");
                    num_parametros_llamada_actual++;}
			           | /* vacio en tabla moodle */ {fprintf(yyout, ";R90:	<lista_expresiones> ::= \n");}; /*Está vacio a posta*/

/*;R91 <resto_lista_expresiones> ::= , <exp> <resto_lista_expresiones>*/
/*;R92: <resto_lista_expresiones> ::= */
resto_lista_expresiones: TOK_COMA exp resto_lista_expresiones
                         {fprintf(yyout, ";R91 <resto_lista_expresiones> ::= , <exp> <resto_lista_expresiones>\n");
                          num_parametros_llamada_actual++;}
			                 | /* vacio en tabla moodle */ {fprintf(yyout, ";R92: <resto_lista_expresiones> ::= \n");}; /*Está vacio a posta*/

/*;R93: <comparacion> ::= <exp> == <exp>*/
/*;R94: <comparacion> ::= <exp> != <exp>*/
/*;R95: <comparacion> ::= <exp> <= <exp>*/
/*;R96: <comparacion> ::= <exp> >= <exp>*/
/*;R97: <comparacion> ::= <exp> < <exp>*/
/*;R98: <comparacion> ::= <exp> > <exp>*/
comparacion: exp TOK_IGUAL exp {fprintf(yyout, ";R93: <comparacion> ::= <exp> == <exp>\n");}
           | exp TOK_DISTINTO exp {fprintf(yyout, ";R94: <comparacion> ::= <exp> != <exp>\n");}
           | exp TOK_MENORIGUAL exp {fprintf(yyout, ";R95: <comparacion> ::= <exp> <= <exp>\n");}
           | exp TOK_MAYORIGUAL exp {fprintf(yyout, ";R96: <comparacion> ::= <exp> >= <exp>\n");}
           | exp TOK_MENOR exp {fprintf(yyout, ";R97: <comparacion> ::= <exp> < <exp>\n");}
           | exp TOK_MAYOR exp {fprintf(yyout, ";R98: <comparacion> ::= <exp> > <exp>\n");};

/*;R99 <constante> ::= <constante_logica>*/
/*;R100 <constante> ::= <constante_entera>*/
constante: constante_logica{
           {fprintf(yyout, ";R99: <constante> ::= <constante_logica>\n");
            $$.tipo = $1.tipo;
            $$.es_direccion = $1.es_direccion;}
         | constante_entera
           {fprintf(yyout, ";R100: <constante> ::= <constante_entera>\n");
            $$.tipo = $1.tipo;
            $$.es_direccion = $1.es_direccion;};

/*;R102: <constante_logica> ::= true*/
/*;R103: <constante_logica> ::= false*/
constante_logica: TOK_TRUE
                  {fprintf(yyout, ";R102: <constante_logica> ::= true\n");
                   $$.tipo = BOOLEAN;
                   $$.es_direccion = 0;}
                | TOK_FALSE
                  {fprintf(yyout, ";R103: <constante_logica> ::= false\n");
                  $$.tipo = BOOLEAN;
                  $$.es_direccion = 0;};

/*;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA*/
constante_entera: TOK_CONSTANTE_ENTERA
                  {fprintf(yyout, ";R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA\n");
                   $$.tipo = INT;
                   $$.es_direccion = 0;};


/*;R108: <identificador> ::= TOK_IDENTIFICADOR*/
idpf: TOK_IDENTIFICADOR {fprintf(yyout, ";R108:	<idpf> ::= TOK_IDENTIFICADOR\n");};
%%

void yyerror(const char *s) {
  printf("****Error sintactico en [linea %d, columna %d]\n", linea, columna);
}
