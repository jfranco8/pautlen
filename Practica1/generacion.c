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
	declarar_variable(fpasm, "__esp", 0, 1);
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
- tipo puede ser ENTERO o BOOLEANO (observa la declaración de las constantes
del principio del fichero).
- Esta misma función se invocará cuando en el compilador se declaren
vectores, por eso se adjunta un argumento final (tamano) que para esta
primera práctica siempre recibirá el valor 1.
*/
void declarar_variable(FILE* fpasm, char * nombre, int tipo, int tamano){
  if(! fpasm) return;
  fprintf(fpasm, "\t_%s resd %d", nombre, tamano);
}


/*
Para escribir el comienzo del segmento .text, básicamente se indica que se
exporta la etiqueta main y que se usarán las funciones declaradas en la librería
olib.o
*/
void escribir_segmento_codigo(FILE* fpasm){
  if(! fpasm) return;
  /*Segmento código*/
  fprintf(fpasm, "\n segment .text\n");
  fprintf(fpasm, "global main");
  /*Métodos externos*/
  fprintf(fpasm, "extern print_boolean, print_int, print_blank, print_string, print_endofline, scan_boolean, scan_int");
}


/*
En este punto se debe escribir, al menos, la etiqueta main y la sentencia que
guarda el puntero de pila en su variable (se recomienda usar __esp).
*/
void escribir_inicio_main(FILE* fpasm){
  if(! pasm) return;
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
  if(! pasm) return;
  fprintf(fpasm, "\n;\tFIN DE PROGRAMA\n");
  /*En caso de que no haya errores, saltamos a fin*/
  fprintf(fpasm, "\t\tjmp near fin");
  /*Error División por cero*/
  fprintf(fpasm, "error_1:\n");
  fprintf(fpasm, "\t\tpush dword mensaje_1");
  fprintf(fpasm, "\t\tcall print_string");
  fprintf(fpasm, "\t\tadd esp, 4");
  fprintf(fpasm, "\t\tjmp near fin");
  /*Etiqueta fin*/
  fprintf(fpasm, "fin\n");
  fprintf(fpasm, "\t\tmov dword esp, [__esp]");
  fprintf(fpasm, "\t\tret");
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
  if(! pasm) return;
  fprintf(pasm, "\t\tpush dword %s%s", es_variable ? "=" : "", nombre);

}

void asignar(FILE* fpasm, char* nombre, int es_variable){

}

/* OPERACIONES */
void sumar(FILE* fpasm, int es_variable_1, int es_variable_2){

}
void restar(FILE* fpasm, int es_variable_1, int es_variable_2){

}
void multiplicar(FILE* fpasm, int es_variable_1, int es_variable_2){

}
void dividir(FILE* fpasm, int es_variable_1, int es_variable_2){

}
void o(FILE* fpasm, int es_variable_1, int es_variable_2){

}
void y(FILE* fpasm, int es_variable_1, int es_variable_2){

}
void cambiar_signo(FILE* fpasm, int es_variable){

}

void no(FILE* fpasm, int es_variable, int cuantos_no){

}

/* FUNCIONES COMPARATIVAS */
void igual(FILE* fpasm, int es_variable1, int es_variable2, int etiqueta){

}
void distinto(FILE* fpasm, int es_variable1, int es_variable2, int etiqueta){

}
void menor_igual(FILE* fpasm, int es_variable1, int es_variable2, int etiqueta){

}
void mayor_igual(FILE* fpasm, int es_variable1, int es_variable2, int etiqueta){

}
void menor(FILE* fpasm, int es_variable1, int es_variable2, int etiqueta){

}
void mayor(FILE* fpasm, int es_variable1, int es_variable2, int etiqueta){

}

/* FUNCIONES DE ESCRITURA Y LECTURA */
void leer(FILE* fpasm, char* nombre, int tipo){

}
void escribir(FILE* fpasm, int es_variable, int tipo){

}
