%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include "tabla_simbolos.h"
  #include "generacion.h"
  #include "symbol.h"
  #include "alfa.h"
  #include "y.tab.h"

  extern int linea;
  extern int columna;
  extern FILE * out; /*Fichero ASM*/

  extern int yylex(void);
  void yyerror(const char *s);

  int tipo_actual = -1;
  int clase_actual = -1;
  int pos_vector_actual = 0;
  int tamanio_vector_actual = 1;
  int pos_variable_local_actual = 0;
  int pos_parametro_actual = 0;
  int num_parametros_llamada_actual = 0;
  int num_variables_locales_actual = 0;
  int num_parametros_actual = 0;
  int posicion_parametro = 0;
  int es_variable_actual = 0; // no sé si es así
  int en_explist = 0;
  int cuantos_no = 0;
  int cuantos_condicionales = 0;
  int cuantos_bucles = 0;
  int cuantas_comparaciones = 0;
  int es_funcion = 0;

  int _return = 0;
  int return_type;

  tabla_simbolo *ts = NULL;
  ht_symbol *simbolo = NULL;


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
%token <atributos> TOK_IDENTIFICADOR

/* Constantes */
%token <atributos> TOK_CONSTANTE_ENTERA
%token TOK_TRUE
%token TOK_FALSE

/* Errores */
%token TOK_ERROR

%type <atributos> programa
%type <atributos> inicioTabla
%type <atributos> escritura1
%type <atributos> escritura2
%type <atributos> declaraciones
%type <atributos> declaracion
%type <atributos> clase
%type <atributos> clase_escalar
%type <atributos> tipo
%type <atributos> clase_vector
%type <atributos> identificadores
%type <atributos> funciones
%type <atributos> funcion
%type <atributos> fn_declaration
%type <atributos> fn_name
%type <atributos> parametros_funcion
%type <atributos> resto_parametros_funcion
%type <atributos> parametro_funcion
%type <atributos> idpf
%type <atributos> declaraciones_funcion
%type <atributos> sentencias
%type <atributos> sentencia
%type <atributos> sentencia_simple
%type <atributos> bloque
%type <atributos> asignacion
%type <atributos> elemento_vector
%type <atributos> condicional
%type <atributos> if_exp
%type <atributos> if_exp_sentencias
%type <atributos> bucle
%type <atributos> while
%type <atributos> while_exp
%type <atributos> lectura
%type <atributos> escritura
%type <atributos> exp
%type <atributos> idf_llamada_funcion
%type <atributos> lista_expresiones
%type <atributos> resto_lista_expresiones
%type <atributos> comparacion
%type <atributos> constante
%type <atributos> constante_logica
%type <atributos> constante_entera
%type <atributos> identificador

/* Asociatividad de los operadores para precedencia*/

%left TOK_ASIGNACION
%left TOK_MAS TOK_MENOS TOK_OR
%left TOK_DIVISION TOK_ASTERISCO TOK_AND
%right TOK_NOT MENOSU
%left TOK_PARENTESISIZQUIERDO TOK_PARENTESISDERECHO TOK_CORCHETEIZQUIERDO TOK_CORCHETEDERECHO

/* Comienzo del programa */
%start programa

%%

/* No se muy bien como hacer lo de los numeros, me imagino que seran las lineas */
/*;R1:	<programa> ::= main { <declaraciones> <funciones> <sentencias> }*/
programa: inicioTabla TOK_MAIN TOK_LLAVEIZQUIERDA escritura1 declaraciones escritura_codigo funciones escritura2 sentencias TOK_LLAVEDERECHA
          {fprintf(out, ";R1: <programa> ::= main { <declaraciones> <funciones> <sentencias> }\n");}
          |inicioTabla TOK_MAIN TOK_LLAVEIZQUIERDA escritura1 escritura_codigo funciones escritura2 sentencias TOK_LLAVEDERECHA
          {fprintf(out, ";R1: <programa> ::= main { <funciones> <sentencias> }\n");};

inicioTabla: {ts = new_tabla_simbolos();};

escritura1: {
  escribir_subseccion_data(out);
  escribir_cabecera_bss(out);
};

escritura_codigo: {
  escribir_segmento_codigo(out);
}

escritura2: {
  escribir_inicio_main(out);
};

/*;R2:	<declaraciones> ::= <declaracion>*/
/*;R3:	<declaraciones> ::= <declaracion> <declaraciones>*/
declaraciones: declaracion {fprintf(out, ";R2:	<declaraciones> ::= <declaracion>\n");}
			       | declaracion declaraciones {fprintf(out, ";R3:	<declaraciones> ::= <declaracion> <declaraciones>\n");};

/*;R4:	<declaracion> ::= <clase> <identificadores> ;*/
declaracion: clase identificadores TOK_PUNTOYCOMA
              {fprintf(out, ";R4:	<declaracion> ::= <clase> <identificadores> ;\n");};

/*;R5:	<clase> ::= <clase_escalar>*/
/*;R7:	<clase> ::= <clase_vector>*/
clase: clase_escalar {clase_actual = ESCALAR;
                      fprintf(out, ";R5:	<clase> ::= <clase_escalar>\n");}
     | clase_vector {clase_actual = VECTOR;
                     fprintf(out, ";R7:	<clase> ::= <clase_vector>\n");};

/*;R9:	<clase_escalar> ::= <tipo>*/
clase_escalar: tipo {fprintf(out, ";R9:	<clase_escalar> ::= <tipo>\n");};

/*;R10:	<tipo> ::= int*/
/*;R11:	<tipo> ::= boolean*/
tipo: TOK_INT {tipo_actual = INT;
               $$.tipo = INT;
               fprintf(out, ";R10:	<tipo> ::= int\n");}
    | TOK_BOOLEAN {tipo_actual = BOOLEAN;
                   $$.tipo = BOOLEAN;
                   fprintf(out, ";R11:	<tipo> ::= boolean\n");};

/*;R15:	<clase_vector> ::= array <tipo> [<constante_entera]*/
clase_vector: TOK_ARRAY tipo TOK_CORCHETEIZQUIERDO TOK_CONSTANTE_ENTERA TOK_CORCHETEDERECHO
              {fprintf(out, ";R15:	<clase_vector> ::= array <tipo> [constante_entera]\n");
               tamanio_vector_actual = $4.valor_entero;
               if ((tamanio_vector_actual < 1) || (tamanio_vector_actual > MAX_TAMANIO_VECTOR)){
                 fprintf(out, "****Error semantico en lin %d: El tamanyo del vector <%s> excede los limites permitidos (1,64)\n", linea, $$.lexema);
                 return -1;
               }
              };

/*;R18:	<identificadores> ::= <identificador>*/
/*;R19:	<identificadores> ::= <identificador> , <identificadores>*/
identificadores: identificador {fprintf(out, ";R18:	<identificadores> ::= <identificador>\n");}
			         | identificador TOK_COMA identificadores {fprintf(out, ";R19:	<identificadores> ::= <identificador> , <identificadores>\n");};

/*;R20:	<funciones> ::= <funcion> , <funciones>*/
/*;R21:	<funciones> ::= */
funciones: funcion funciones {fprintf(out, ";R20:	<funciones> ::= <funcion> <funciones>\n");}
			     | /* vacio en tabla moodle */ {fprintf(out, ";R21:	<funciones> ::= \n");}; /*Está vacio a posta */


/*;R22: <funcion> ::= function <tipo> <identificador> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }*/
funcion:  fn_declaration sentencias  TOK_LLAVEDERECHA{
           //ERROR SI LA FUNCION NO TIENE SENTENCIA DE RETORNO
           if(_return == 0){
             fprintf(out, "****Error semantico en lin %d: Funcion %s sin sentencia de retorno.",linea, $1.lexema);
             return -1;
           }
           //COMPROBACIONES SEMANTICAS
           if(tipo_actual != return_type){
             fprintf(out, "****Error semantico en lin %d: Tipo de función %s, (%d) no coincide con tipo de retorno (%d)",linea, $2.lexema, $2.tipo, return_type);
             return -1;
           }

           fprintf(out, ";R22: <funcion> ::= function <tipo> <TOK_IDENTIFICADOR> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }\n");

           //ERROR SI YA SE HA DECLARADO UNA FUNCION CON NOMBRE $1.nombre
           //CIERRE DE AMBITO, ETC

           /* fprintf(out, ALFA_CLOSE_ID "\n");
           free(id); */

           set_ambit(GLOBAL);
           set_check(TRUE);
           ts_set_local(ts, NULL);
           es_funcion = 0;

           if(get_ambit() == GLOBAL){
             simbolo = is_global_symbol(ts_get_global(ts), (char *)$1.lexema);
           } else {
             simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (char *)$1.lexema);
           }

           if(simbolo == NULL){
             fprintf(stderr, "****2Error semantico en lin %d: Declaracion duplicada.\n", linea);
             return -1;
           }

           simbolo->num_param = num_parametros_actual;

           //retornarFuncion(out, es_variable_actual);
           fprintf(out, ";R22: <funcion> ::= function <tipo> <TOK_IDENTIFICADOR> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }\n");

};

fn_declaration: fn_name TOK_PARENTESISIZQUIERDO parametros_funcion TOK_PARENTESISDERECHO TOK_LLAVEIZQUIERDA declaraciones_funcion {
  //COMPROBACIONES SEMANTICAS
  //ERROR SI YA SE HA DECLARADO UNA FUNCION CON NOMBRE $1.nombre

  if(get_ambit() == GLOBAL){
    simbolo = is_global_symbol(ts_get_global(ts), (char *)$1.lexema);
  } else {
    simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (char *)$1.lexema);
  }

  if(simbolo == NULL){
    fprintf(stderr, "****2Error semantico en lin %d: Declaracion duplicada.\n", linea);
    return -1;
  }

  simbolo->num_param = num_parametros_actual;
  strcpy($$.lexema, $1.lexema);
  $$.tipo = $1.tipo;
  //GENERACION DE CODIGO
  declararFuncion(out, $1.lexema, num_variables_locales_actual);

};

fn_name: TOK_FUNCTION tipo TOK_IDENTIFICADOR {
  _return = 0;
  es_funcion = 1;
  //COMPROBACIONES SEMANTICAS
  //ERROR SI YA SE HA DECLARADO UNA FUNCION CON NOMBRE $3.nombre
  if(get_ambit() == GLOBAL){
    simbolo = is_global_symbol(ts_get_global(ts), (char *)$3.lexema);
  } else {
    simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (char *)$3.lexema);
  }

  if(simbolo != NULL){
    fprintf(stderr, "****2Error semantico en lin %d: Declaracion duplicada.\n", linea);
    return -1;
  }


  //strcpy(simbolo->id, $3.lexema);
  //simbolo->s_category = FUNCION;
  //simbolo->type = tipo_actual;
  //$$.tipo = tipo_actual;
  //num_variables_locales_actual = 0;


  strcpy($$.lexema, $3.lexema);

  //ABRIR AMBITO EN LA TABLA DE SIMBOLOS CON IDENTIFICADOR $3.nombre
  //RESETEAR VARIABLES QUE NECESITAMOS PARA PROCESAR LA FUNCION:
  //posicion_variable_local, num_variables_locales, posicion_parametro, num_parametros

  $$.tipo = tipo_actual;
  //declararFuncion(out, $3.lexema, num_variables_locales_actual);
  new_global(ts_get_global(ts), $3.lexema, FALSE, clase_actual, tipo_actual, FUNCION);
  if(get_ambit() != LOCAL){
    set_ambit(LOCAL);
    ts_set_local(ts, ht_new());
  }
  pos_variable_local_actual = 0;
  num_variables_locales_actual = 0;
  num_parametros_actual = 0;
  pos_parametro_actual = 0;
};

/*;R23: <parametros_funcion> ::= <parametro_funcion> <resto_parametros_funcion>*/
/*;R24: <parametros_funcion> ::= */
parametros_funcion: parametro_funcion resto_parametros_funcion {fprintf(out, ";R23:	<parametros_funcion> ::= <parametro_funcion> <resto_parametros_funcion>\n");}
			     | /* vacio en tabla moodle */ {fprintf(out, ";R24:	<parametros_funcion> ::= \n");}; /*Está vacio a posta*/


/*;R25: <resto_parametros_funcion> ::= ; <parametro_funcion> <resto_parametros_funcion>*/
/*;R26: <resto_parametros_funcion> ::= */
resto_parametros_funcion: TOK_PUNTOYCOMA parametro_funcion resto_parametros_funcion
                          {fprintf(out, ";R25: <resto_parametros_funcion> ::= ; <parametro_funcion> <resto_parametros_funcion>\n");}
			                  | /* vacio en tabla moodle */ {fprintf(out, ";R26:	<resto_parametros_funcion> ::= \n");}; /*Está vacio a posta*/

/*;R27: <parametro_funcion> ::= <tipo> <identificador>*/
parametro_funcion: tipo idpf {
  fprintf(out, ";R27: <parametro_funcion> ::= <tipo> <idpf>\n");
  //INCREMENTAR CONTADORES
  num_parametros_actual++;
  posicion_parametro++;
};

idpf: TOK_IDENTIFICADOR {
    //COMPROBACIONES SEMANTICAS PARA $1.nombre
    //EN ESTE CASO SE MUESTRA ERROR SI EL NOMBRE DEL PARAMETRO YA SE HA UTILIZADO
    //simbolo->id = $1.lexema;
    //simbolo->s_category = PARAMETRO;
    //simbolo->type = tipo_actual;
    //simbolo->category = ESCALAR;
    //simbolo->posision = posicion_parametro;
    //DECLARAR SIMBOLO EN LA TABLA
    if(get_ambit() == GLOBAL){
      simbolo = is_global_symbol(ts_get_global(ts), (char *)$1.lexema);
    } else {
      simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (char *)$1.lexema);
    }
    if(simbolo != NULL){
      fprintf(out,"****Error semantico en lin %d: Declaracion duplicada.\n", linea);
      return -1;
    }

    new_local(ts_get_local(ts), $1.lexema, FALSE, ESCALAR, tipo_actual, PARAMETRO);
    //pos_parametro_actual++;
    //num_parametros_actual++;
};

/*;R28: <declaraciones_funcion> ::= <declaraciones>*/
/*;R29: <declaraciones_funcion> ::= */
declaraciones_funcion: declaraciones {fprintf(out, ";R28: <declaraciones_funcion> ::= <declaraciones>\n");}
			               | /* vacio en tabla moodle */ {fprintf(out, ";R29: <declaraciones_funcion> ::= \n");}; /*Está vacio a posta*/

/*;R30:	<sentencias> ::= <sentencia>*/
/*;R31:	<sentencias> ::= <sentencia> <sentencias>*/
sentencias: sentencia {fprintf(out, ";R30:	<sentencias> ::= <sentencia>\n");}
			    | sentencia sentencias {fprintf(out, ";R31:	<sentencias> ::= <sentencia> <sentencias>\n");};

/*;R32:	<sentencia> ::= <sentencia_simple> ;*/
/*;R33:	<sentencia> ::= <bloque> ;*/
sentencia: sentencia_simple TOK_PUNTOYCOMA {fprintf(out, ";R32:	<sentencia> ::= <sentencia_simple> ;\n");}
         | bloque {fprintf(out, ";R33:	<sentencia> ::= <bloque>\n");};

 /*;R34:	<sentencia_simple> ::= <asignacion>*/
 /*;R35:	<sentencia_simple> ::= <lectura>*/
/*;R36:	<sentencia_simple> ::= <escritura>*/
/*;R38:	<sentencia_simple> ::= <retorno_funcion>*/
sentencia_simple: asignacion {fprintf(out, ";R34:	<sentencia_simple> ::= <asignacion>\n");}
                | lectura {fprintf(out, ";R35:	<sentencia_simple> ::= <lectura>\n");}
                | escritura {fprintf(out, ";R36:	<sentencia_simple> ::= <escritura>\n");}
                | retorno_funcion {
                  fprintf(out, ";R36:	<sentencia_simple> ::= <retorno_funcion>\n");};

/*;R40 <bloque> ::= <condicional>*/
/*;R41 | <bucle>*/
bloque: condicional {fprintf(out, ";R40:	<bloque> ::= <condicional>\n");}
      | bucle {fprintf(out, ";R41:	<bloque> ::= <bucle>\n");};

/*;R43:	<asignacion> ::= <identificador> = <exp>*/
/*;R44:	<asignacion> ::= <elemento_vector> = <exp>*/
asignacion: TOK_IDENTIFICADOR TOK_ASIGNACION exp {
                  printf("ENTRA EN ASIGNACION. LEXEMA = %s\n", (char *)$1.lexema);
                  if(get_ambit() == GLOBAL){
                    simbolo = is_global_symbol(ts_get_global(ts), (char *)$1.lexema);
                  } else {
                    simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), (char *)$1.lexema);
                  }

                  if(simbolo == NULL){
                    fprintf(out,"****Error semantico en lin %d: Acceso a variable no declarada (%s).\n", linea, $1.lexema);
                    return -1;
                  }
                  else{
                    if(simbolo->s_category == FUNCION){
                      fprintf(out,"**** 1 Error semantico en lin %d: Asignacion incompatible.\n", linea);
          						return -1;
                    }
                    else if(simbolo->type != $3.tipo){
                      fprintf(out, "RECUERDO. BOOLEAN=%d. INT=%d \n", BOOLEAN, INT);
                      fprintf(out, "tipo que tenemos (simbolo %s): %d. tipo de 3 (simbolo %s): %d \n", simbolo->id, simbolo->type, $3.lexema, $3.tipo);
                      fprintf(out,"**** 2 Error semantico en lin %d: Asignacion incompatible.\n", linea);
          						return -1;
                    }
                    else if (simbolo->category == VECTOR){
                      fprintf(out,"**** 3 Error semantico en lin %d: Asignacion incompatible.\n", linea);
          						return -1;
                    }
                  }

                  if(is_global_symbol(ts_get_global(ts), (char *)$1.lexema) == NULL){
                    if(simbolo->category == PARAMETRO){
                      printf("HOLA\n");
                      escribirVariableLocal(out, simbolo->num_param+1);
                      asignarDestinoEnPila(out, $3.es_direccion);
                      //escribirParametro(out, simbolo->num_param, num_parametros_actual);
                    } else {
                      printf("ADIOS\n");
                      escribirVariableLocal(out, simbolo->num_param+1);
                      asignarDestinoEnPila(out, $3.es_direccion);
                    }
                  } else {
                    printf("AMPS\n");
                    asignar(out, $1.lexema, $3.es_direccion);

                    fprintf(out, ";R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>\n");}
                  }


          | elemento_vector TOK_ASIGNACION exp {

            if(get_ambit() == GLOBAL){
              simbolo = is_global_symbol(ts_get_global(ts), $1.lexema);
            } else {
              simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), $1.lexema);
            }

            if(simbolo == NULL){
              fprintf(out,"****Error semantico en lin %d: Acceso a variable no declarada (%s).\n", linea, $1.lexema);
              return -1;
            }

            if($1.tipo != $3.tipo){
  						fprintf(out,"****Error semantico en lin %d: Asignacion incompatible.\n", linea);
  						return -1;
  					}

            char buffer_cte[256];
            //sprintf(buffer_cte, "%d", pos_vector_actual);
            pos_vector_actual ++;
            //escribir_operando(out, buffer_cte, $$.es_direccion);
            if ($1.indice == 0) {
              sprintf(buffer_cte, "%d", $1.valor_entero);
              printf("valor entero = %s\n", buffer_cte);
              escribir_operando(out, buffer_cte, 0);
            }
            if ($1.indice == 1) {
              printf("---> pilla indice 1\n");
              escribir_operando(out, $1.nombre_indice, 1);
            }
            //escribir_elemento_vector(out, simbolo->id, simbolo->len, $3.es_direccion);
            escribir_elemento_vector(out, $1.lexema, simbolo->num_param, $3.es_direccion);
            asignarDestinoEnPila(out, $3.es_direccion);
            fprintf(out, ";R44:	<asignacion> ::= <elemento_vector> = <exp>\n");};

/*;R48: <elemento_vector> ::= <identificador> [ <exp> ]*/
elemento_vector: TOK_IDENTIFICADOR TOK_CORCHETEIZQUIERDO exp TOK_CORCHETEDERECHO{
               fprintf(out, ";R48: <elemento_vector> ::= <TOK_IDENTIFICADOR> [ <exp> ]\n");
               if ($3.tipo != INT){
  							fprintf(out,"****Error semantico en lin %d: El indice en una operacion de indexacion tiene que ser de tipo entero.", linea);
  							return -1;
							 }
               else if(get_ambit() == GLOBAL){
                 simbolo = is_global_symbol(ts_get_global(ts), $1.lexema);
               } else {
                 simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), $1.lexema);
               }
               if(simbolo == NULL){
                 fprintf(out,"****Error semantico en lin %d: Acceso a variable no declarada (%s).\n", linea, $1.lexema);
                 return -1;
               }
               else if (get_category(simbolo) != VECTOR){
                 fprintf(out,"****Error semantico en lin %d: Intento de indexacion de una variable que no es de tipo vector.\n", linea);
                 return -1;
               }
							 $$.tipo = simbolo->type;
               $$.es_direccion = 1;
               if ($3.es_direccion == 0) {
                  $$.indice = 0;
                  $$.valor_entero = $3.valor_entero;
                }
                if ($3.es_direccion == 1) {
                  $$.indice = 1;
                  strcpy($$.nombre_indice, $3.lexema);
                }
							 escribir_elemento_vector(out, simbolo->id, simbolo->len, $3.es_direccion);
							 fprintf(out, ";R:\telemento_vector:	TOK_IDENTIFICADOR '[' exp ']'\n");
              };

/*;R50: <condicional> ::= if ( <exp> ) { <sentencias> }*/
/*R51:  <condicional> ::= if ( <exp> ) { <sentencias> } else { <sentencias> }*/
condicional: if_exp_sentencias TOK_LLAVEDERECHA
             {ifthenelse_fin(out, $1.etiqueta);
              fprintf(out, ";R50: <condicional> ::= <if_exp_sentencias> { \n");}
           | if_exp_sentencias TOK_LLAVEDERECHA TOK_ELSE TOK_LLAVEIZQUIERDA sentencias TOK_LLAVEDERECHA
             {ifthenelse_fin(out, $1.etiqueta);
              fprintf(out, ";R51:  <condicional> ::= <if_exp_sentencias> } else { <sentencias> }\n");};

if_exp: TOK_IF TOK_PARENTESISIZQUIERDO exp TOK_PARENTESISDERECHO TOK_LLAVEIZQUIERDA {
  //COMPROBACIONES SEMANTICAS
  if($3.tipo != BOOLEAN){
					fprintf(out,"****Error semantico en lin %d: Condicional con condicion de tipo int.\n", linea);
					return -1;
	}
  //GESTION ETIQUETA
  //cuantos_condicionales++;
	$$.etiqueta = cuantos_condicionales++;
  ifthenelse_inicio(out, $3.es_direccion, $$.etiqueta);
  fprintf(out, ";R: <if_exp> ::=	if ( <exp> ) { \n");
};

if_exp_sentencias: if_exp sentencias {
 $$.etiqueta = $1.etiqueta;
 ifthenelse_fin_then(out, $$.etiqueta);
 fprintf(out, ";R: <if_exp_sentencias> ::=	<if_exp> <sentencias> \n");
};

/*;R52: <bucle> ::= while ( <exp> ) { <sentencias> }*/
bucle: while_exp sentencias TOK_LLAVEDERECHA
       {while_fin(out, $1.etiqueta);
        fprintf(out, ";R52: <bucle> ::= <while_exp> <sentencias> }\n");
};

while: TOK_WHILE TOK_PARENTESISIZQUIERDO {
 //GESTION ETIQUETA
 $$.etiqueta = cuantos_bucles ++;
 while_inicio(out, $$.etiqueta);
 fprintf(out, ";R: <while> ::= while (\n");
};

while_exp: while exp TOK_PARENTESISDERECHO TOK_LLAVEIZQUIERDA {
  //COMPROBACIONES SEMANTICAS
  if($2.tipo != BOOLEAN) {
    fprintf(out,"****Error semantico en lin %d: Bucle con condicion de tipo int.\n", linea);
   	return -1;
  }
 $$.etiqueta = $1.etiqueta;
 while_exp_pila(out, $2.es_direccion, $$.etiqueta);
 fprintf(out, ";R: <while_exp> ::= <while> <exp> ) {\n");
};

/*;R54:	<lectura> ::= scanf <identificador>*/
lectura: TOK_SCANF TOK_IDENTIFICADOR {
          printf("HA ENTRADO EN LECTURA. LEXEMA = %s\n", $2.lexema);
          if(get_ambit() == GLOBAL){
            simbolo = is_global_symbol(ts_get_global(ts), $2.lexema);
          } else {
            simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), $2.lexema);
          }

          if(simbolo == NULL){
            fprintf(out,"**** 1 Error semantico en lin %d: Variable no declarada.\n", linea);
            return -1;
          }
          else if(get_symbol_category(simbolo) == FUNCION || get_symbol_category(simbolo) == VECTOR){
            fprintf(out,"****Error semantico en lin %d: Asignacion incompatible.\n", linea);
            return -1;
          }
          else if (get_category(simbolo) == VECTOR){
              fprintf(out,"****Error semantico en lin %d: Variable local de tipo no escalar.\n", linea);
              return -1;
          }

          leer(out, $2.lexema, $2.tipo_actual);
          fprintf(out, ";R54:	<lectura> ::= scanf <TOK_IDENTIFICADOR>\n");};

/*;R56:	<escritura> ::= printf <exp>*/
escritura: TOK_PRINTF exp {
            fprintf(out, ";R56:	<escritura> ::= printf <exp>\n");
            escribir(out, $2.es_direccion, $2.tipo);};

/*;R61:	<retorno_funcion> ::= return <exp>*/
retorno_funcion: TOK_RETURN exp {
            /*if(get_ambit() == GLOBAL){
              fprintf(out,"**** 2 Error semantico en lin %d: Variable no declarada.\n", linea);
              return -1;
            } else {*/
              _return = 1; // variable que nos indica si la función tiene retorno o no
              return_type = $2.tipo;
              retornarFuncion(out, $2.es_direccion);
              fprintf(out, ";R61:	<retorno_funcion> ::= return <exp>\n");};
            //};

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
exp: exp TOK_MAS exp {
      fprintf(out, ";R72:	<exp> ::= <exp> + <exp>\n");
      if ($1.tipo != INT || $3.tipo != INT){
  			fprintf(out,"****Error semántico en lin %d: Operacion aritmetica con operandos boolean.\n", linea);
  			return -1;
  		}
      sumar(out, $1.es_direccion, $3.es_direccion);
  		$$.es_direccion = 0;
  		$$.tipo = INT;
    }
   | exp TOK_MENOS exp {
     fprintf(out, ";R73:	<exp> ::= <exp> - <exp>\n");
     if ($1.tipo != INT || $3.tipo != INT){
       fprintf(out,"****Error semántico en lin %d: Operacion aritmetica con operandos boolean.\n", linea);
       return -1;
     }
     restar(out, $1.es_direccion, $3.es_direccion);
     $$.es_direccion = 0;
     $$.tipo = INT;
   }
   | exp TOK_DIVISION exp {
     fprintf(out, ";R74:	<exp> ::= <exp> / <exp>\n");
     if ($1.tipo != INT || $3.tipo != INT){
       fprintf(out,"****Error semántico en lin %d: Operacion aritmetica con operandos boolean.\n", linea);
       return -1;
     }
     dividir(out, $1.es_direccion, $3.es_direccion);
     $$.es_direccion = 0;
     $$.tipo = INT;
   }
   | exp TOK_ASTERISCO exp {
     fprintf(out, ";R75:	<exp> ::= <exp> * <exp>\n");
     if ($1.tipo != INT || $3.tipo != INT){
       fprintf(out,"****Error semántico en lin %d: Operacion aritmetica con operandos boolean.\n", linea);
       return -1;
     }
     multiplicar(out, $1.es_direccion, $3.es_direccion);
     $$.es_direccion = 0;
     $$.tipo = INT;
   }
   | TOK_MENOS exp {
     fprintf(out, ";R76:	<exp> ::= -<exp>\n");
     if ($2.tipo!=INT){
				fprintf(out,"****Error semántico en lin %d: Operacion aritmetica con operandos boolean.\n", linea);
				return -1;
			}
			cambiar_signo(out, $2.es_direccion?1:0);
			$$.es_direccion = 0;
			$$.tipo = INT;
   }
   | exp TOK_AND exp {
     fprintf(out, ";R77:	<exp> ::= <exp> && <exp>\n");
     if ($1.tipo != BOOLEAN || $3.tipo != BOOLEAN) {
				fprintf(out,"****Error semántico en lin %d: Operacion logica con operandos int.\n", linea);
				return -1;
			}
			y(out, $1.es_direccion, $3.es_direccion);
			$$.es_direccion = 0;
			$$.tipo = BOOLEAN;
   }
   | exp TOK_OR exp {
     fprintf(out, ";R78:	<exp> ::= <exp> || <exp>\n");
     if ($1.tipo != BOOLEAN || $3.tipo != BOOLEAN) {
				fprintf(out,"****Error semántico en lin %d: Operacion logica con operandos int.\n", linea);
				return -1;
			}
			o(out, $1.es_direccion, $3.es_direccion);
			$$.es_direccion = 0;
			$$.tipo = BOOLEAN;
   }
   | TOK_NOT exp {
     fprintf(out, ";R79:	<exp> ::= ! <exp>\n");
     if ($2.tipo!=BOOLEAN) {
				fprintf(out,"****Error semántico en lin %d: Operacion logica con operandos int.\n", linea);
				return -1;
			}
			no(out, $2.es_direccion?1:0, cuantos_no++);
			$$.es_direccion = 0;
			$$.tipo = BOOLEAN;
   }
   | TOK_IDENTIFICADOR {
    strcpy($$.lexema, $1.lexema);
     if(get_ambit() == GLOBAL){
       simbolo = is_global_symbol(ts_get_global(ts), $1.lexema);
     } else {
       simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), $1.lexema);
     }

     if(simbolo == NULL){
       fprintf(out,"**** 3 Error semantico en lin %d: Variable no declarada.\n", linea);
       return -1;
     }
     /*else{
       if(get_symbol_category(simbolo) == FUNCION || get_symbol_category(simbolo) == VECTOR){
         fprintf(out,"****Error semantico en lin %d: Asignacion incompatible.\n", linea);
         return -1;
       }
       $$.tipo = get_type(simbolo);
       $$.es_direccion = 1;
     }
     escribir_operando(out, $1.lexema, $$.es_direccion);*/

     if (is_global_symbol(ts_get_global(ts), $1.lexema) == NULL){
         if(get_symbol_category(simbolo) == PARAMETRO){
           escribirParametro(out, simbolo->num_param, num_parametros_actual);
           num_parametros_actual--;
         }else{
           escribirVariableLocal(out, simbolo->num_param+1);
         }
       } else{
         escribir_operando(out, $1.lexema, 1);
       }
     $$.tipo = get_type(simbolo);
     $$.es_direccion = 1;

     fprintf(out, ";R80:	<exp> ::= <TOK_IDENTIFICADOR>\n");
   }
   | constante
     {fprintf(out, ";R81:	<exp> ::= <constante>\n");
      $$.tipo = $1.tipo;
      $$.es_direccion = $1.es_direccion;
      escribir_operando(out, $1.lexema, 0);
      }
   | TOK_PARENTESISIZQUIERDO exp TOK_PARENTESISDERECHO
     {fprintf(out, ";R82:	<exp> ::= ( <exp> )\n");
      $$.tipo = $2.tipo;
      $$.es_direccion = $2.es_direccion;}
   | TOK_PARENTESISIZQUIERDO comparacion TOK_PARENTESISDERECHO
     {fprintf(out, ";R83:	<exp> ::= ( <comparacion> )\n");
      $$.tipo = $2.tipo;
      $$.es_direccion = $2.es_direccion;}
   | elemento_vector
     {fprintf(out, ";R85:	<exp> ::= <elemento_vector>\n");
      $$.tipo = $1.tipo;
      $$.es_direccion = $1.es_direccion;}
   | idf_llamada_funcion TOK_PARENTESISIZQUIERDO lista_expresiones TOK_PARENTESISDERECHO
     {
     if(get_ambit() == GLOBAL){
       simbolo = is_global_symbol(ts_get_global(ts), $1.lexema);
     } else {
       simbolo = is_local_or_global_symbol(ts_get_global(ts), ts_get_local(ts), $1.lexema);
     }
       if(simbolo == NULL){
         fprintf(out,"****Error semantico en lin %d: Funcion no declarada.\n", linea);
         return -1;
       }
       en_explist = 0;
       $$.tipo = simbolo->type;
       llamarFuncion(out, $1.lexema, simbolo->num_param);
       fprintf(out, ";R88:	<exp> ::= <TOK_IDENTIFICADOR> ( <lista_expresiones> )\n");

      };

idf_llamada_funcion: TOK_IDENTIFICADOR { //NO se muy bien que hace esta cosa
  //Control de Errores como arriba
  num_parametros_llamada_actual = 0;
  en_explist = 1;
  strcpy($$.lexema, $1.lexema);
};

/*;R89 <lista_expresiones> ::= <exp> <resto_lista_expresiones>*/
/*;R90:	<lista_expresiones> ::=*/
lista_expresiones: expf resto_lista_expresiones
                   {
                   en_explist = 0;
                   fprintf(out, ";R89 <lista_expresiones> ::= <exp> <resto_lista_expresiones>\n");
                    num_parametros_llamada_actual++;}
			           | /* vacio en tabla moodle */ {fprintf(out, ";R90:	<lista_expresiones> ::= \n");}; /*Está vacio a posta*/

/*;R91 <resto_lista_expresiones> ::= , <exp> <resto_lista_expresiones>*/
/*;R92: <resto_lista_expresiones> ::= */
resto_lista_expresiones: TOK_COMA expf resto_lista_expresiones
                         {fprintf(out, ";R91 <resto_lista_expresiones> ::= , <exp> <resto_lista_expresiones>\n");
                          num_parametros_llamada_actual++;}
			                 | /* vacio en tabla moodle */ {fprintf(out, ";R92: <resto_lista_expresiones> ::= \n");}; /*Está vacio a posta*/

expf: exp {
  operandoEnPilaAArgumento(out, $1.es_direccion);
}

/*;R93: <comparacion> ::= <exp> == <exp>*/
/*;R94: <comparacion> ::= <exp> != <exp>*/
/*;R95: <comparacion> ::= <exp> <= <exp>*/
/*;R96: <comparacion> ::= <exp> >= <exp>*/
/*;R97: <comparacion> ::= <exp> < <exp>*/
/*;R98: <comparacion> ::= <exp> > <exp>*/
comparacion: exp TOK_IGUAL exp {
              fprintf(out, ";R93: <comparacion> ::= <exp> == <exp>\n");
              if ($1.tipo!=INT || $3.tipo!=INT){
        				fprintf(out,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
        				return -1;
        			}
        			igual(out, $1.es_direccion, $3.es_direccion, cuantas_comparaciones++);
        			$$.etiqueta = cuantas_comparaciones;
        			$$.es_direccion = 0;
        			$$.tipo = BOOLEAN;
            }
           | exp TOK_DISTINTO exp {
             fprintf(out, ";R94: <comparacion> ::= <exp> != <exp>\n");
             if ($1.tipo!=INT || $3.tipo!=INT){
               fprintf(out,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
               return -1;
             }
             distinto(out, $1.es_direccion, $3.es_direccion, cuantas_comparaciones++);
             $$.etiqueta = cuantas_comparaciones;
             $$.es_direccion = 0;
             $$.tipo = BOOLEAN;
           }
           | exp TOK_MENORIGUAL exp {
             fprintf(out, ";R95: <comparacion> ::= <exp> <= <exp>\n");
             if ($1.tipo!=INT || $3.tipo!=INT){
               fprintf(out,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
               return -1;
             }
             menor_igual(out, $1.es_direccion, $3.es_direccion, cuantas_comparaciones++);
             $$.etiqueta = cuantas_comparaciones;
             $$.es_direccion = 0;
             $$.tipo = BOOLEAN;
           }
           | exp TOK_MAYORIGUAL exp {
             fprintf(out, ";R96: <comparacion> ::= <exp> >= <exp>\n");
             if ($1.tipo!=INT || $3.tipo!=INT){
               fprintf(out,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
               return -1;
             }
             mayor_igual(out, $1.es_direccion, $3.es_direccion, cuantas_comparaciones++);
             $$.etiqueta = cuantas_comparaciones;
             $$.es_direccion = 0;
             $$.tipo = BOOLEAN;
           }
           | exp TOK_MENOR exp {
             fprintf(out, ";R97: <comparacion> ::= <exp> < <exp>\n");
             if ($1.tipo!=INT || $3.tipo!=INT){
               fprintf(out,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
               return -1;
             }
             menor(out, $1.es_direccion, $3.es_direccion, cuantas_comparaciones++);
             $$.etiqueta = cuantas_comparaciones;
             $$.es_direccion = 0;
             $$.tipo = BOOLEAN;
           }
           | exp TOK_MAYOR exp {
             fprintf(out, ";R98: <comparacion> ::= <exp> > <exp>\n");
             if ($1.tipo!=INT || $3.tipo!=INT){
               fprintf(out,"****Error semántico en lin %d: Comparacion con operandos boolean.\n", linea);
               return -1;
             }
             mayor(out, $1.es_direccion, $3.es_direccion, cuantas_comparaciones++);
             $$.etiqueta = cuantas_comparaciones;
             $$.es_direccion = 0;
             $$.tipo = BOOLEAN;
           };

/*;R99 <constante> ::= <constante_logica>*/
/*;R100 <constante> ::= <constante_entera>*/
constante: constante_logica
           {fprintf(out, ";R99: <constante> ::= <constante_logica>\n");
            $$.tipo = $1.tipo;
            $$.es_direccion = $1.es_direccion;
            strcpy($$.lexema, $1.lexema);}
         | constante_entera
           {fprintf(out, ";R100: <constante> ::= <constante_entera>\n");
            $$.tipo = $1.tipo;
            $$.es_direccion = $1.es_direccion;
            strcpy($$.lexema, $1.lexema);};

/*;R102: <constante_logica> ::= true*/
/*;R103: <constante_logica> ::= false*/
constante_logica: TOK_TRUE
                  {fprintf(out, ";R102: <constante_logica> ::= true\n");
                   $$.tipo = BOOLEAN;
                   $$.es_direccion = 0;
                   strcpy($$.lexema, "1");}
                | TOK_FALSE
                  {fprintf(out, ";R103: <constante_logica> ::= false\n");
                  $$.tipo = BOOLEAN;
                  $$.es_direccion = 0;
                  strcpy($$.lexema, "0");};

/*;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA*/
constante_entera: TOK_CONSTANTE_ENTERA
                  {fprintf(out, ";R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA\n");
                   $$.tipo = INT;
                   $$.es_direccion = 0;
                   //$$.valor_entero = $1.valor_entero;
                   //char buffer_cte[100];
                   //sprintf(buffer_cte, "%d", $$.valor_entero);
                   //escribir_operando(out, buffer_cte, $$.es_direccion);
                   sprintf($$.lexema, "%d", $$.valor_entero);
                 };



/*;R108: <identificador> ::= TOK_IDENTIFICADOR*/
identificador: TOK_IDENTIFICADOR {
  if(get_ambit() == GLOBAL){
    if(new_global(ts_get_global(ts), $1.lexema, FALSE, clase_actual, tipo_actual, VARIABLE) == FALSE){
      fprintf(out,"****Error semantico en lin %d: Identificador %s duplicado.\n", linea, $1.lexema);
      return -1;
    }
    if(clase_actual == VECTOR){
      declarar_variable(out, $1.lexema, tipo_actual, tamanio_vector_actual);
    } else {
      declarar_variable(out, $1.lexema, tipo_actual, 1);
    }
    //declarar_variable(out, $1.lexema, tipo_actual, tamanio_vector_actual);
  } else {
    if(es_funcion){
      if(clase_actual != ESCALAR){
        fprintf(out,"****Error semantico en lin %d: Variable local de tipo no escalar\n", linea);
      }
      num_variables_locales_actual ++;
      pos_variable_local_actual++;
    } else {
      if(clase_actual == VECTOR){
        declarar_variable(out, $1.lexema, tipo_actual, tamanio_vector_actual);
      } else {
        declarar_variable(out, $1.lexema, tipo_actual, 1);
      }
    }

    if(new_local(ts_get_local(ts), $1.lexema, FALSE, clase_actual, tipo_actual, VARIABLE) == FALSE){
      fprintf(out,"****Error semantico en lin %d: Identificador %s duplicado.\n", linea, $1.lexema);
    }

  }
  fprintf(out, ";R108:	<identificador> ::= TOK_IDENTIFICADOR\n");};
%%

void yyerror(const char *s) {
  fprintf(out,"****Error sintactico en [linea %d, columna %d]\n", linea, columna);
}
