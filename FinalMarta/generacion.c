// PRACTICA 1 - PAUTLEN 2019/2010
//
//   generacion.c
//
// Marta García Marín
// Jesús Daniel Franco López

#include <stdio.h>
#include "generacion.h"


/* CABECERA y SEGMENTO BSS
Código para el principio de la sección .bss.
Con seguridad sabes que deberás reservar una variable entera para guardar el
puntero de pila extendido (esp). Se te sugiere el nombre __esp para esta variable.
*/
void escribir_cabecera_bss(FILE* fpasm){
  /*
  * Comprobación de que el fichero existe. Se hara de aquí en adelanteen
  * todas las funciones que reciban el FILE* como parámetro.
  */
  if(! fpasm) return;
  fprintf(fpasm, ";escribir_cabecera_bss\n");
  /*Cabecera bss*/
	fprintf(fpasm, "\nsegment .bss\n");
  /*Declaración de la variable pila*/
	declarar_variable(fpasm, "_esp", 0, 1);
}


/* SEGMENTO DATA
Declaración (con directiva db) de las variables que contienen el texto de los
mensajes para la identificación de errores en tiempo de ejecución.
En este punto, al menos, debes ser capaz de detectar la división por 0.
*/
void escribir_subseccion_data(FILE* fpasm){
  if(! fpasm) return;
  fprintf(fpasm, ";escribir_subseccion_data\n");
  /*Cabecera segmento data*/
	fprintf(fpasm, "segment .data\n");
  /*Mensaje para la identificacion del error division por cero*/
	fprintf(fpasm, "mensaje_1 db \"Division por cero\", 0\n");
  /*Error de fuera de rango*/
  fprintf(fpasm, "mensaje_2 db \"Indice de vector fuera de rango\", 10\n");
}


/* DECLARACION DE VARIABLES
Para ser invocada en la sección .bss cada vez que se quiera declarar una
variable:
- El argumento nombre es el de la variable.
- tipo puede ser ENTERO o BOOLEANOO (observa la declaración de las constantes
del principio del fichero).
- Esta misma función se invocará cuando en el compilador se declaren
vectores, por eso se adjunta un argumento final (tamano) que para esta
primera práctica siempre recibirá el valor 1.
*/
void declarar_variable(FILE* fpasm, char * nombre, int tipo, int tamano){
  if(! fpasm) return;
  fprintf(fpasm, ";declarar_variable\n");
  fprintf(fpasm, "\t_%s resd %d\n", nombre, tamano);
}


/* SECCION DE CODIGO
Para escribir el comienzo del segmento .text, básicamente se indica que se
exporta la etiqueta main y que se usarán las funciones declaradas en la librería
olib.o
*/
void escribir_segmento_codigo(FILE* fpasm){
  if(! fpasm) return;
  /*Segmento código*/
  fprintf(fpasm, "\nsegment .text\n");
  fprintf(fpasm, "global main\n");
  /*Métodos externos*/
  fprintf(fpasm, "extern malloc, free\nextern print_boolean, print_int, print_blank, print_string, print_endofline, scan_boolean, scan_int\n");
}


/* ETIQUETA MAIN e INICIO DEL PREOGRAMA
En este punto se debe escribir, al menos, la etiqueta main y la sentencia que
guarda el puntero de pila en su variable (se recomienda usar __esp).
*/
void escribir_inicio_main(FILE* fpasm){
  if(! fpasm) return;
  /*Comentario y etiqueta para el procedimiento main*/
  fprintf(fpasm, "\n;\tINICIO DEL PROGRAMA\n");
  fprintf(fpasm, "main:\n");
  /*Actualización del puntero a pila*/
  fprintf(fpasm, "\t\tmov dword [__esp], esp\n");
}


/* FIN DEL PROGRAMA
Al final del programa se escribe:
- El código NASM para salir de manera controlada cuando se detecta un error
en tiempo de ejecución (cada error saltará a una etiqueta situada en esta
zona en la que se imprimirá el correspondiente mensaje y se saltará a la
zona de finalización del programa).
- En el final del programa se debe:
·Restaurar el valor del puntero de pila (a partir de su variable __esp)
·Salir del programa (ret).
*/
void escribir_fin(FILE* fpasm){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tFIN DE PROGRAMA\n");
  /*En caso de que no haya errores, saltamos a fin*/
  fprintf(fpasm, "\t\tjmp near fin\n");
  /*Error División por cero*/
  fprintf(fpasm, "error_1:\n");
  fprintf(fpasm, "\t\tpush dword mensaje_1\n");
  fprintf(fpasm, "\t\tcall print_string\n");
  fprintf(fpasm, "\t\tadd esp, 4\n");
  fprintf(fpasm, "\t\tjmp near fin\n");
  /*Error indice fuera de rango*/
  fprintf(fpasm, "fin_indice_fuera_rango:\n");
  fprintf(fpasm, "\t\tpush dword mensaje_2\n");
  fprintf(fpasm, "\t\tcall print_string\n");
  fprintf(fpasm, "\t\tadd esp, 4\n");
  fprintf(fpasm, "\t\tjmp near fin\n");
  /*Etiqueta fin*/
  fprintf(fpasm, "fin:\n");
  fprintf(fpasm, "\t\tmov dword esp, [__esp]\n");
  fprintf(fpasm, "\t\tret\n");
}


/* ESCRITURA DE OPERANDOS
Función que debe ser invocada cuando se sabe un operando de una operación
aritmético-lógica y se necesita introducirlo en la pila.
- nombre es la cadena de caracteres del operando tal y como debería aparecer
en el fuente NASM
- es_variable indica si este operando es una variable (como por ejemplo b1)
con un 1 u otra cosa (como por ejemplo 34) con un 0. Recuerda que en el
primer caso internamente se representará como _b1 y, sin embargo, en el
segundo se representará tal y como esté en el argumento (34).
*/
void escribir_operando(FILE* fpasm, char* nombre, int es_variable){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tESCRIBE OPERANDO\n");
  if(es_variable){
    fprintf(fpasm, "\t\tpush dword _%s\n", nombre);
  } else{
    fprintf(fpasm, "\t\tpush dword %s\n", nombre);
  }
}


/* ASIGNACION DE EXPRESIONES A VARIABLES
- Genera el código para asignar valor a la variable de nombre nombre.
- Se toma el valor de la cima de la pila.
- El último argumento es el que indica si lo que hay en la cima de la pila es
una referencia (1) o ya un valor explícito (0).
*/
void asignar(FILE* fpasm, char* nombre, int es_variable){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tASIGNACION A %s DESDE LA PILA\n", nombre);
  fprintf(fpasm, "\t\tpop dword eax\n");
  if(es_variable) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  fprintf(fpasm, "\t\tmov dword [_%s], eax\n", nombre);
}

/* FUNCIONES ARITMÉTICO-LÓGICAS BINARIAS */

/*
En todas ellas se realiza la operación como se ha resumido anteriormente:
- Se extrae de la pila los operandos
- Se realiza la operación
- Se guarda el resultado en la pila
Los dos últimos argumentos indican respectivamente si lo que hay en la pila es
una referencia a un valor o un valor explícito.
Deben tenerse en cuenta las peculiaridades de cada operación. En este sentido
sí hay que mencionar explícitamente que, en el caso de la división, se debe
controlar si el divisor es “0” y en ese caso se debe saltar a la rutina de error
controlado (restaurando el puntero de pila en ese caso y comprobando en el retorno
que no se produce “Segmentation Fault”)
*/

/* OPERACIONES */

//  SUMA
void sumar(FILE* fpasm, int es_variable_1, int es_variable_2){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tSUMA\n");

  // Extraemos de la pila los operandos
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  // Guardamos los operandos en los registros
  if(es_variable_1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable_2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}

  // Realizamos operacion --> SUMA
  fprintf(fpasm, "\t\tadd eax, ebx\n");

  // Guardamos resultado en la pila
  fprintf(fpasm, "\t\tpush dword eax\n");
}


//  RESTA
void restar(FILE* fpasm, int es_variable_1, int es_variable_2){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tRESTA\n");

  // Extraemos de la pila los operandos
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  // Guardamos los operandos en los registros
  if(es_variable_1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable_2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}

  // Realizamos operacion --> RESTA
  fprintf(fpasm, "\t\tsub eax, ebx\n");

  // Guardamos resultado en la pila
  fprintf(fpasm, "\t\tpush dword eax\n");
}


// MULTIPLICACION
void multiplicar(FILE* fpasm, int es_variable_1, int es_variable_2){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tMULTIPLICACION\n");

  // Extraemos de la pila los operandos
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  // Guardamos los operandos en los registros
  if(es_variable_1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable_2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}

  // Realizamos operacion --> MULTIPLICACION --> guarda en eax eax*ebx
  fprintf(fpasm, "\t\timul ebx\n");

  // Guardamos resultado en la pila
  fprintf(fpasm, "\t\tpush dword eax\n");
}


// DIVISION
void dividir(FILE* fpasm, int es_variable_1, int es_variable_2){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tDIVISION\n");

  // Extraemos de la pila los operandos
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  // Guardamos los operandos en los registros
  if(es_variable_1) {fprintf(fpasm, "\t\tmov eax, dword [eax]\n");}
  if(es_variable_2) {fprintf(fpasm, "\t\tmov ebx, dword [ebx]\n");}

  // Comprobamos que no se trata de una division por cero (ebx = 0)
  fprintf(fpasm, "\t\tcmp ebx, 0\n");
  fprintf(fpasm, "\t\tje error_1\n");

  //Extendemos el signo de EAX para la division con signo
  fprintf(fpasm, "\t\tcdq\n");

  // Realizamos operacion --> DIVISION --> guarda en eax eax/ebx
  fprintf(fpasm, "\t\tidiv ebx\n");

  // Guardamos resultado en la pila
  fprintf(fpasm, "\t\tpush dword eax\n");
}


// OR
void o(FILE* fpasm, int es_variable_1, int es_variable_2){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tOR\n");

  // Extraemos de la pila los operandos
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  // Guardamos los operandos en los registros
  if(es_variable_1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable_2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}

  // Realizamos operacion --> OR
  fprintf(fpasm, "\t\tor eax, ebx\n");

  // Guardamos resultado en la pila
  fprintf(fpasm, "\t\tpush dword eax\n");
}


// AND
void y(FILE* fpasm, int es_variable_1, int es_variable_2){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tAND\n");

  // Extraemos de la pila los operandos
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  // Guardamos los operandos en los registros
  if(es_variable_1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable_2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}

  // Realizamos operacion --> AND
  fprintf(fpasm, "\t\tand eax, ebx\n");

  // Guardamos resultado en la pila
  fprintf(fpasm, "\t\tpush dword eax\n");
}


// CAMBIAR SIGNO
void cambiar_signo(FILE* fpasm, int es_variable){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tCAMBIAR SIGNO\n");

  // Extraemos de la pila el operando
  fprintf(fpasm, "\t\tpop dword eax\n");

  // Guardamos el operando en el registro
  if(es_variable) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}

  // Realizamos operacion --> NEGATIVO (cambio de signo)
  fprintf(fpasm, "\t\tneg eax\n");

  // Guardamos resultado en la pila
  fprintf(fpasm, "\t\tpush dword eax\n");
}


// NEGACION
void no(FILE* fpasm, int es_variable, int cuantos_no){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tNEGACION LOGICA\n");

  // Extraemos de la pila el operando
  fprintf(fpasm, "\t\tpop eax\n");

  // Guardamos el operando en el registro
  if(es_variable) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}

  // Si eax es 0 -> Saltamos a negar_falso
  fprintf(fpasm, "\t\tcmp dword eax, 0\n");
  fprintf(fpasm, "\t\tje negar_falso_%d\n", cuantos_no);

  // Cargamos 0 en la pila y salto a fin_negacion
  fprintf(fpasm, "\t\tpush dword 0\n");
  fprintf(fpasm, "\t\tjmp fin_negacion_%d\n", cuantos_no);

  // Etiqueta negar_falso
  fprintf(fpasm, "negar_falso_%d:\n", cuantos_no);
  fprintf(fpasm, "\t\tpush dword 1\n");

  //Etiqueta fin_negacion
  fprintf(fpasm, "fin_negacion_%d:\n", cuantos_no);
}

/* FUNCIONES COMPARATIVAS */


// IGUAL
void igual(FILE* fpasm, int es_variable1, int es_variable2, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tIGUAL\n");

  // Extraemos de la pila los operandos
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  // Guardamos los operandos en los registros
  if(es_variable1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}

  // Realizamos operacion --> comparamos eax con ebx
  fprintf(fpasm, "\t\tcmp eax, ebx\n");
  // si son iguales -> Salto a iguales
  fprintf(fpasm, "\t\tje iguales_%d\n", etiqueta);

  // si no son iguales, guardamos 0 en la pila y salto al final
  fprintf(fpasm, "\t\tpush dword 0\n");
  fprintf(fpasm, "\t\tjmp final_igual_%d\n", etiqueta);

  // Etiqueta IGUALES
  fprintf(fpasm, "iguales_%d:\n", etiqueta);

  // si son iguales, guardamos la en la pila
  fprintf(fpasm, "\t\tpush dword 1\n");

  //Etiqueta FINAL_IGUAL
  fprintf(fpasm, "final_igual_%d:\n", etiqueta);
}


// DISTINTO
void distinto(FILE* fpasm, int es_variable1, int es_variable2, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tDISTINTO\n");

  // Extraemos de la pila los operandos
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  // Guardamos los operandos en los registros
  if(es_variable1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}

  // // Realizamos operacion --> comparamos eax con ebx
  fprintf(fpasm, "\t\tcmp eax, ebx\n");

  // si no son iguales -> Salto a no iguales
  fprintf(fpasm, "\t\tjne no_iguales_%d\n", etiqueta);

  // si son iguales, guardamos 0 en la pila --> no se cumple que son distintos
  fprintf(fpasm, "\t\tpush dword 0\n");
  fprintf(fpasm, "\t\tjmp final_distinto_%d\n", etiqueta);

  // Etiqueta NO_IGUALES
  fprintf(fpasm, "no_iguales_%d:\n", etiqueta);
  // si son distintos, guardamos 1 en la pila
  fprintf(fpasm, "\t\tpush dword 1\n");

  //Etiqueta FINAL_IGUAL
  fprintf(fpasm, "final_distinto_%d:\n", etiqueta);
}

// A partir de aqui todos siguen el mismo procedimiento:
//    Si se cumple, 1 en la pila; si no se cumple, 0
// MENOR IGUAL
void menor_igual(FILE* fpasm, int es_variable1, int es_variable2, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tMENOR IGUAL\n");

  // Extraemos de la pila los operandos
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  // Guardamos los operandos en los registros
  if(es_variable1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}

  // comparamos eax con ebx
  fprintf(fpasm, "\t\tcmp eax, ebx\n");
  // si son iguales o eax es menor -> Salto a menor_igual
  fprintf(fpasm, "\t\tjle menor_igual_%d\n", etiqueta);
  fprintf(fpasm, "\t\tpush dword 0\n");
  fprintf(fpasm, "\t\tjmp final_menor_igual_%d\n", etiqueta);

  // Etiqueta MENOR_IGUAL
  fprintf(fpasm, "menor_igual_%d:\n", etiqueta);
  fprintf(fpasm, "\t\tpush dword 1\n");

  //Etiqueta FINAL_MENOR_IGUAL
  fprintf(fpasm, "final_menor_igual_%d:\n", etiqueta);
}


// MAYOR IGUAL
void mayor_igual(FILE* fpasm, int es_variable1, int es_variable2, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tMAYOR IGUAL\n");

  // Extraemos de la pila los operandos
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  // Guardamos los operandos en los registros
  if(es_variable1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}

  // comparamos eax con ebx
  fprintf(fpasm, "\t\tcmp eax, ebx\n");
  // si son iguales o eax es menor -> Salto a mayor_igual
  fprintf(fpasm, "\t\tjge mayor_igual_%d\n", etiqueta);
  fprintf(fpasm, "\t\tpush dword 0\n");
  fprintf(fpasm, "\t\tjmp final_mayor_igual_%d\n", etiqueta);

  // Etiqueta mayor_igual
  fprintf(fpasm, "mayor_igual_%d:\n", etiqueta);
  fprintf(fpasm, "\t\tpush dword 1\n");

  //Etiqueta FINAL_mayor_igual
  fprintf(fpasm, "final_mayor_igual_%d:\n", etiqueta);
}


// MENOR
void menor(FILE* fpasm, int es_variable1, int es_variable2, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tMENOR\n");

  // Extraemos de la pila los operandos
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  // Guardamos los operandos en los registros
  if(es_variable1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}

  // comparamos eax con ebx
  fprintf(fpasm, "\t\tcmp eax, ebx\n");
  // si son iguales o eax es menor -> Salto a menor
  fprintf(fpasm, "\t\tjl menor_%d\n", etiqueta);
  fprintf(fpasm, "\t\tpush dword 0\n");
  fprintf(fpasm, "\t\tjmp final_menor_%d\n", etiqueta);

  // Etiqueta menor
  fprintf(fpasm, "menor_%d:\n", etiqueta);
  fprintf(fpasm, "\t\tpush dword 1\n");

  //Etiqueta FINAL_menor
  fprintf(fpasm, "final_menor_%d:\n", etiqueta);
}


// MAYOR
void mayor(FILE* fpasm, int es_variable1, int es_variable2, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tMAYOR\n");

  // Extraemos de la pila los operandos
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  // Guardamos los operandos en los registros
  if(es_variable1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}

  // comparamos eax con ebx
  fprintf(fpasm, "\t\tcmp eax, ebx\n");
  // si son iguales o eax es menor -> Salto a mayor
  fprintf(fpasm, "\t\tjg mayor_%d\n", etiqueta);
  fprintf(fpasm, "\t\tpush dword 0\n");
  fprintf(fpasm, "\t\tjmp final_mayor_%d\n", etiqueta);

  // Etiqueta mayor
  fprintf(fpasm, "mayor_%d:\n", etiqueta);
  fprintf(fpasm, "\t\tpush dword 1\n");

  //Etiqueta FINAL_mayor
  fprintf(fpasm, "final_mayor_%d:\n", etiqueta);
}


/* FUNCIONES DE ESCRITURA Y LECTURA */


// LEER
void leer(FILE* fpasm, char* nombre, int tipo){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tLECTURA\n");
  fprintf(fpasm, "\t\tpush dword _%s\n", nombre);
  if (tipo == ENTERO) {fprintf(fpasm, "\t\tcall scan_int\n");}
  if (tipo == BOOLEANO) {fprintf(fpasm, "\t\tcall scan_boolean\n");}

  fprintf(fpasm, "\t\tadd esp, 4\n");
}


// ESCRITURA
void escribir(FILE* fpasm, int es_variable, int tipo){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tESCRITURA\n");

  if(es_variable){
    fprintf(fpasm, "\t\tpop dword eax\n");
    fprintf(fpasm, "\t\tpush dword [eax]\n");
  }

  if (tipo == ENTERO) {fprintf(fpasm, "\t\tcall print_int\n");}
  if (tipo == BOOLEANO) {fprintf(fpasm, "\t\tcall print_boolean\n");}

  fprintf(fpasm, "\t\tcall print_endofline\n");
  fprintf(fpasm, "\t\tadd esp, 4\n");

}

// BUCLES --> necesario llevar un contados de etiquetas, para distinguirlas:
//        fprintf(fpasm, "\t\tje near fin_then_%d\n", etiqueta);
// IF THEN ELSE INICIO
void ifthenelse_inicio(FILE * fpasm, int exp_es_variable, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tIF THEN ELSE INICIO\n");
  //SE SACA DE LA PILA EL VALOR DE LA EXPRESION
  fprintf(fpasm, "\t\tpop eax\n");
  if(exp_es_variable) {fprintf(fpasm, "\t\tmov eax, [eax]\n");}
  fprintf(fpasm, "\t\tcmp eax, 0\n");
  //SI ES CERO SE SALTA AL FINAL DE LA RAMA THEN
  fprintf(fpasm, "\t\tje near fin_if_%d\n", etiqueta);
}

// IF THEN INICIO --> creo que es igual que la de arriba
void ifthen_inicio(FILE * fpasm, int exp_es_variable, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tIF THEN INICIO\n");
  fprintf(fpasm, "\t\tpop eax\n");
  if(exp_es_variable) {fprintf(fpasm, "\t\tmov eax, [eax]\n");}
  fprintf(fpasm, "\t\tcmp eax, 0\n");
  //SI ES CERO SE SALTA AL FINAL DE LA RAMA THEN
  fprintf(fpasm, "\t\tje near fin_if_%d\n", etiqueta);
}

// IF THEN FIN -> se cumple if
void ifthen_fin(FILE * fpasm, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tIF THEN FIN\n");
  //SE IMPRIME LA ETIQUETA DE FINAL DE BLOQUE THEN
  fprintf(fpasm, "fin_if_%d:\n", etiqueta);
}

// IF THEN ELSE FIN THEN -> se cumple if
void ifthenelse_fin_then( FILE * fpasm, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tIF THEN ELSE FIN THEN\n");
  //SE ESCRIBE LA ETIQUETA DE FIN DE LA RAMA THEN
  fprintf(fpasm, "\t\tjmp near fin_ifnot_%d\n", etiqueta);
  fprintf(fpasm, "fin_if_%d:\n", etiqueta);
}

// IF THEN ELSE FIN -> se cumple else
void ifthenelse_fin( FILE * fpasm, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tIF THEN ELSE FIN\n");
  //SE ESCRIBE LA ETIQUETA DEL FINAL DE LA ESTRUCTURA IFTHENELSE
  fprintf(fpasm, "fin_ifnot_%d:\n", etiqueta);
}

//WHILE INICIO
void while_inicio(FILE * fpasm, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tWHILE INCIO\n");
  //SE ESCRIBE LA ETIQUETA DE INICIO DE WHILE
  fprintf(fpasm, "inicio_while_%d:\n", etiqueta);

}

// WHILE PILA
void while_exp_pila (FILE * fpasm, int exp_es_variable, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tWHILE PILA\n");
  //SE SACA DE LA CIMA DE LA PILA EL VALOR DE LA EXPRESIÓN QUE GOBIERNA EL BUCLE
  fprintf(fpasm, "\t\tpop eax\n");
  if(exp_es_variable) {fprintf(fpasm, "\t\tmov eax, [eax]\n");}
  fprintf(fpasm, "\t\tcmp eax, 0\n");
  //SI ES 0 SE SALTA AL FINAL DEL WHILE, HABRÍAMOS TERMINADO
  fprintf(fpasm, "\t\tje near fin_while_%d\n", etiqueta);
}

// WHILE FIN
void while_fin( FILE * fpasm, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tWHILE FIN\n");
  //SE SALTA DE NUEVO AL PRINCIIO DEL BUCLE PARA VOLVER A EVALUAR LA CONDICION DE SALIDA
  fprintf(fpasm, "\t\tjmp near inicio_while_%d\n", etiqueta);
  //SE ESCRIBE LA ETIQUETA DE FIN DEL BUCLE
  fprintf(fpasm, "fin_while_%d:\n", etiqueta);
}

// INDEXACION DE VECTOR
void escribir_elemento_vector(FILE * fpasm,char * nombre_vector, int tam_max, int exp_es_direccion){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tINDEXACION DE VECTOR\n");

  //SE SACA DE LA PILA A UN REGISTRO EL VALOR DEL ÍNDICE
  fprintf(fpasm, "\t\tpop dword eax\n");

  //HACIENDO LO QUE PROCEDA EN EL CASO DE QUE SEA UNA DIRECCIÓN (VARIABLE O EQUIVALENTE)
  if(exp_es_direccion) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}

  //SE PROGRAMA EL CONTROL DE ERRORES EN TIEMPO DE EJECUCIÓN
  //SI EL INDICE ES <0 SE TERMINA EL PROGRAMA, SI NO, CONTINUA
  fprintf(fpasm, "\t\tcmp eax, 0\n");

  //SE SUPONE QUE EN LA DIRECCIÓN fin_indice_fuera_rango SE PROCESA ESTE ERROR EN TIEMPO DE EJECUCIÓN
  fprintf(fpasm, "\t\t jl near fin_indice_fuera_rango\n");

  //SI EL INDICE ES > MAXIMO PERMITIDO SE TERMINA EL PROGRAMA, SI NO, CONTINUA*/
  //EL TAMANO MÁXIMO SE PROPORCIONA COMO ARGUMENTO
  fprintf(fpasm, "\t\tcmp eax, %d\n", tam_max-1);
  fprintf(fpasm, "\t\tjg near fin_indice_fuera_rango\n");

  //UNA OPCIÓN ES CALCULAR CON lea LA DIRECCIÓN EFECTIVA DEL ELEMENTO INDEXADO TRAS CALCULARLA
  //DESPLAZANDO DESDE EL INICIO DEL VECTOR EL VALOR DEL INDICE
  fprintf(fpasm, "\t\tmov dword edx, _%s\n", nombre_vector);
  fprintf(fpasm, "\t\tlea eax, [edx+ eax*4]\n"); //DIR DEL ELEMENTO INDEXADO EN EAX
  fprintf(fpasm, "\t\tpush dword eax\n"); //DIR DEL ELEMENTO INDEXADO EN CIMA PILA
}

// DECLARACIÓN DE FUNCION
void declararFuncion(FILE * fd_asm, char * nombre_funcion, int num_var_loc){
  if(! fd_asm) return;
  fprintf(fd_asm, "\n;\tDECLARACION DE FUNCION\n");

  //ETIQUETA DE INICIO DE LA FUNCIÓN
  fprintf(fd_asm, "_%s:\n", nombre_funcion);

  //PRESERVACIÓN DE ebp/ esp
  fprintf(fd_asm, "\t\tpush ebp\n");
  fprintf(fd_asm, "\t\tmov ebp, esp\n");

  //RESERVA DE ESPACIO PARA LAS VARIABLES LOCALES EN LA PILA
  fprintf(fd_asm, "\t\tsub esp, 4*%d\n", num_var_loc);
}

// RETORNO A LA FUNCION
void retornarFuncion(FILE * fd_asm, int es_variable){
  if(! fd_asm) return;
  fprintf(fd_asm, "\n;\tRETORNO A LA FUNCION\n");

  // RETORNO DE LA FUNCIÓN (EL VALOR DE LA EXPRESIÓN ESTÁ EN top de LA PILA
  fprintf(fd_asm, "\t\tpop eax\n");

  // Y TIENE QUE DEJARSE EN eax
  if(es_variable) {fprintf(fd_asm, "\t\tmov eax, [eax]\n");}

  //restaurar el puntero de pila
  fprintf(fd_asm, "\t\tmov esp, ebp\n");

  //sacar de la pila ebp
  fprintf(fd_asm, "\t\tpop ebp\n");

  //vuelve al programa llamante y saca de la pila la dir de retorno
  fprintf(fd_asm, "\t\tret\n");
}

// ESCRITURA DE DIRECCION  DE PARAMETRO EN PILA
/*Funcion para dejar en la cima de la pila la direccion efectiva del parametro
en lcierta posicion de un numero total de parametros*/
void escribirParametro(FILE* fpasm, int pos_parametro, int num_total_parametros){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tESCRITURA DE DIRECCION  DE PARAMETRO EN PILA\n");
  fprintf(fpasm, "\n;\t\tnum_parametros: %d\n", num_total_parametros);
  fprintf(fpasm, "\n;\t\pos_parametro: %d\n", pos_parametro);

  // Obtenemos la verdadera posicion en memoria
  int d_ebp = 4*( 1 + (num_total_parametros - pos_parametro));

  // Guardamos el valor en eax
  fprintf(fpasm, "\t\tlea eax, [ebp+%d]\n", d_ebp);

  // Introducimos el valor en la cima de la pila
  fprintf(fpasm, "\t\tpush dword eax\n");
}

// ESCRITURA DE DIR DE DIRECCION DE VARIABLE EN LA PILA
void escribirVariableLocal(FILE* fpasm, int posicion_variable_local){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tESCRITURA DE DIR DE DIRECCION DE VARIABLE EN LA PILA\n");
  int d_ebp = 4*posicion_variable_local;
  fprintf(fpasm, "\t\tlea eax, [ebp-%d]\n", d_ebp);
  fprintf(fpasm, "\t\tpush dword eax\n");
}

// ASIGNACION DE DESTINO EN LA PILA
void asignarDestinoEnPila(FILE* fpasm, int es_variable){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tASIGNACION DE DESTINO EN LA PILA\n");

  //TOMAMOS LA DIRECCIÓN DONDE TENEMOS QUE ASIGNAR de la pila
  fprintf(fpasm, "\t\tpop dword ebx\n");

  //TOMAMOS EL VALOR QUE SE DEBE ASIGNAR INCLUSO DESREFERENCIANDO EN EL CASO DE QUE SEA UNA VARIABLE de debajo
  fprintf(fpasm, "\t\tpop dword eax\n");

  // si es variable, volcamos el valor de esta
  if(es_variable) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}

  //ASIGNAMOS
  fprintf(fpasm, "\t\tmov dword [ebx], eax\n");
}

// VALOR VARIABLE EN PILA
/* Dado un operando en la pila, deja su valor correspondiente en esta
  (sea variable o no) --> si no es variable, su valor ya esta*/
void operandoEnPilaAArgumento(FILE * fd_asm, int es_variable){
  if(! fd_asm) return;
  fprintf(fd_asm, "\n;\tVALOR VARIABLE EN PILA\n");
  if(es_variable) {
    fprintf(fd_asm, "\t\tpop eax\n");
    fprintf(fd_asm, "\t\tmov eax, [eax]\n");
    fprintf(fd_asm, "\t\tpush eax\n");
  }
}

// LLAMANDO A UNA FUNCION
void llamarFuncion(FILE * fd_asm, char * nombre_funcion, int num_argumentos){
  if(! fd_asm) return;
  fprintf(fd_asm, "\n;\tLLAMANDO A UNA FUNCION\n");

  // llamada a funcion
  fprintf(fd_asm, "\t\tcall _%s\n", nombre_funcion);

  // limpeza de pila
  fprintf(fd_asm, "\t\tadd esp, %d\n", num_argumentos*4);

  // dejamos en la cima el retorno
  fprintf(fd_asm, "\t\tpush dword eax\n");
}

// LIMPIEZA DE PILA
void limpiarPila(FILE * fd_asm, int num_argumentos){
  if(! fd_asm) return;
  fprintf(fd_asm, "\n;\tLIMPIEZA DE PILA\n");
  fprintf(fd_asm, "\t\tadd esp, 4*%d\n", num_argumentos);
}
