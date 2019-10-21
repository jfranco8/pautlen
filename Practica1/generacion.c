// PRACTICA 1 - PAUTLEN 2019/2010
//
//   generacion.c
//
// Marta García Marín
// Jesús Daniel Franco López

#include <stdio.h>
#include "generacion.h"


/*
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
  /*Cabecera bss*/
	fprintf(fpasm, "\nsegment .bss\n");
  /*Declaración de la variable pila*/
	declarar_variable(fpasm, "_esp", 0, 1);
}


/*
Declaración (con directiva db) de las variables que contienen el texto de los
mensajes para la identificación de errores en tiempo de ejecución.
En este punto, al menos, debes ser capaz de detectar la división por 0.
*/
void escribir_subseccion_data(FILE* fpasm){
  if(! fpasm) return;
  /*Cabecera segmento data*/
	fprintf(fpasm, "segment .data\n");
  /*Mensaje para la identificacion del error division por cero*/
	fprintf(fpasm, "mensaje_1 db \"Division por cero\", 0\n");
}


/*
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
  fprintf(fpasm, "\t_%s resd %d\n", nombre, tamano);
}


/*
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
  fprintf(fpasm, "extern print_boolean, print_int, print_blank, print_string, print_endofline, scan_boolean, scan_int");
}


/*
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


/*
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
  /*Etiqueta fin*/
  fprintf(fpasm, "fin:\n");
  fprintf(fpasm, "\t\tmov dword esp, [__esp]\n");
  fprintf(fpasm, "\t\tret\n");
}


/*
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


/*
- Genera el código para asignar valor a la variable de nombre nombre.
- Se toma el valor de la cima de la pila.
- El último argumento es el que indica si lo que hay en la cima de la pila es
una referencia (1) o ya un valor explícito (0).
*/
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
void asignar(FILE* fpasm, char* nombre, int es_variable){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tASIGNACION A %s DESDE LA PILA\n", nombre);
  fprintf(fpasm, "\t\tpop dword eax\n");
  if(es_variable) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  fprintf(fpasm, "\t\tmov dword [_%s], eax\n", nombre);
}


/* OPERACIONES */


//  SUMA
void sumar(FILE* fpasm, int es_variable_1, int es_variable_2){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tSUMA\n");
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  if(es_variable_1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable_2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}


  fprintf(fpasm, "\t\tadd eax, ebx\n");
  fprintf(fpasm, "\t\tpush dword eax\n");
}


//  RESTA
void restar(FILE* fpasm, int es_variable_1, int es_variable_2){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tRESTA\n");
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  if(es_variable_1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable_2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}


  fprintf(fpasm, "\t\tsub eax, ebx\n");
  fprintf(fpasm, "\t\tpush dword eax\n");
}


// MULTIPLICACION
void multiplicar(FILE* fpasm, int es_variable_1, int es_variable_2){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tMULTIPLICACION\n");
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  if(es_variable_1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable_2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}


  fprintf(fpasm, "\t\timul ebx\n");
  fprintf(fpasm, "\t\tpush dword eax\n");
}


// DIVISION
void dividir(FILE* fpasm, int es_variable_1, int es_variable_2){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tDIVISION\n");
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  if(es_variable_1) {fprintf(fpasm, "\t\tmov eax, dword [eax]\n");}
  if(es_variable_2) {fprintf(fpasm, "\t\tmov ebx, dword [ebx]\n");}

  fprintf(fpasm, "\t\tcmp ebx, 0\n");
  fprintf(fpasm, "\t\tje error_1\n");
  fprintf(fpasm, "\t\tcdq\n"); //Extendemos el signo de EAX para la division con signo

  fprintf(fpasm, "\t\tidiv ebx\n");
  fprintf(fpasm, "\t\tpush dword eax\n");
}


// OR
void o(FILE* fpasm, int es_variable_1, int es_variable_2){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tOR\n");
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  if(es_variable_1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable_2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}

  fprintf(fpasm, "\t\tor eax, ebx\n");
  fprintf(fpasm, "\t\tpush dword eax\n");
}


// AND
void y(FILE* fpasm, int es_variable_1, int es_variable_2){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tAND\n");
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  if(es_variable_1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable_2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}

  fprintf(fpasm, "\t\tand eax, ebx\n");
  fprintf(fpasm, "\t\tpush dword eax\n");
}


// CAMBIAR SIGNO
void cambiar_signo(FILE* fpasm, int es_variable){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tCAMBIAR SIGNO\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  if(es_variable) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}

  fprintf(fpasm, "\t\tneg eax\n");
  fprintf(fpasm, "\t\tpush dword eax\n");
}


// NEGACION
void no(FILE* fpasm, int es_variable, int cuantos_no){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tNEGACION LOGICA\n");
  fprintf(fpasm, "\t\tpop eax\n");

  if(es_variable) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}

  // Si eax es 0 -> Saltamos a negar_falso
  fprintf(fpasm, "\t\tcmp dword eax, 0\n");
  fprintf(fpasm, "\t\tje negar_falso_%d\n", cuantos_no);

  // Cargamos 0 en eax y salto a fin_negacion
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
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  if(es_variable1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}

  // comparamos eax con ebx
  fprintf(fpasm, "\t\tcmp eax, ebx\n");
  // si son iguales -> Salto a iguales
  fprintf(fpasm, "\t\tje iguales_%d\n", etiqueta);
  fprintf(fpasm, "\t\tpush dword 0\n");
  fprintf(fpasm, "\t\tjmp final_igual_%d\n", etiqueta);

  // Etiqueta IGUALES
  fprintf(fpasm, "iguales_%d:\n", etiqueta);
  fprintf(fpasm, "\t\tpush dword 1\n");

  //Etiqueta FINAL_IGUAL
  fprintf(fpasm, "final_igual_%d:\n", etiqueta);
}


// DISTINTO
void distinto(FILE* fpasm, int es_variable1, int es_variable2, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tDISTINTO\n");
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

  if(es_variable1) {fprintf(fpasm, "\t\tmov dword eax, [eax]\n");}
  if(es_variable2) {fprintf(fpasm, "\t\tmov dword ebx, [ebx]\n");}

  // comparamos eax con ebx
  fprintf(fpasm, "\t\tcmp eax, ebx\n");
  // si no son iguales -> Salto a no iguales
  fprintf(fpasm, "\t\tjne no_iguales_%d\n", etiqueta);
  fprintf(fpasm, "\t\tpush dword 0\n"); // no se cumple que son distintos
  fprintf(fpasm, "\t\tjmp final_distinto_%d\n", etiqueta);

  // Etiqueta NO_IGUALES
  fprintf(fpasm, "no_iguales_%d:\n", etiqueta);
  fprintf(fpasm, "\t\tpush dword 1\n");

  //Etiqueta FINAL_IGUAL
  fprintf(fpasm, "final_distinto_%d:\n", etiqueta);
}


// MENOR IGUAL
void menor_igual(FILE* fpasm, int es_variable1, int es_variable2, int etiqueta){
  if(! fpasm) return;
  fprintf(fpasm, "\n;\tMENOR IGUAL\n");
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

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
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

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
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

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
  fprintf(fpasm, "\t\tpop dword ebx\n");
  fprintf(fpasm, "\t\tpop dword eax\n");

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
