#include <stdio.h>
#include "generacionEj1.h"

/* OBSERVACIÓN GENERAL A TODAS LAS FUNCIONES:
   Todas ellas escriben el código NASM a un FILE* proporcionado como primer argumento.
*/

void escribir_cabecera_bss(FILE* fpasm){ /*segment.bss*/
	fprintf(fpasm, "\nsegment .bss\n");
	declarar_variable(fpasm, "_esp", 0, 1);
}
/*
   Código para el principio de la sección .bss.
   Con seguridad sabes que deberás reservar una variable entera para guardar el puntero de pila extendido (esp). Se te sugiere el nombre __esp para esta variable.
*/

void escribir_subseccion_data(FILE* fpasm){ /*segment.data*/
	fprintf(fpasm, "segment .data\n");
}
/*
   Declaración (con directiva db) de las variables que contienen el texto de los mensajes para la identificación de errores en tiempo de ejecución.
   En este punto, al menos, debes ser capaz de detectar la división por 0.
*/

void declarar_variable(FILE* fpasm, char * nombre,  int tipo,  int tamano){ /*invocar segment.bss*/
	fprintf(fpasm, "\t_%s %c %d\n", nombre, tipo, tamano);
}
/*
   Para ser invocada en la sección .bss cada vez que se quiera declarar una variable:
    • El argumento nombre es el de la variable.
    • tipo puede ser ENTERO o BOOLEANO (observa la declaración de las constantes del principio del fichero).
    • Esta misma función se invocará cuando en el compilador se declaren vectores, por eso se adjunta un argumento final (tamano) que para esta primera práctica siempre recibirá el valor 1.
*/

void escribir_segmento_codigo(FILE* fpasm){ /*segment.text*/
	fprintf(fpasm, "segment .text\n");
	fprintf(fpasm, "global main\n");
	fprintf(fpasm, "extern scan_int, print_int, scan_float, print_float\n");
	fprintf(fpasm, "extern print_endofline, print_blank, print_string\n");
	fprintf(fpasm, "extern alfa_malloc, alfa_free, ld_float\n");
}
/*
   Para escribir el comienzo del segmento .text, básicamente se indica que se exporta la etiqueta main y que se usarán las funciones declaradas en la librería olib.o
*/

void escribir_inicio_main(FILE* fpasm){ /* main*/
	fprintf(fpasm, ";----------\n");
	fprintf(fpasm, "main:\n");
	fprintf(fpasm, "\tmov dword [__esp] , esp ; Guarda el puntero de la pila\n");
}
/*
   En este punto se debe escribir, al menos, la etiqueta main y la sentencia que guarda el puntero de pila en su variable (se recomienda usar __esp).
*/

void escribir_fin(FILE* fpasm){
	fprintf(fpasm, "fin: mov dword esp, [__esp] ; Restauración de puntero de pila\n");
	fprintf(fpasm, "\tret\n");
}
/*
   Al final del programa se escribe:
    • El código NASM para salir de manera controlada cuando se detecta un error en tiempo de ejecución (cada error saltará a una etiqueta situada en esta zona en la que se imprimirá el correspondiente mensaje y se saltará a la zona de finalización del programa).
    • En el final del programa se debe:
         ·Restaurar el valor del puntero de pila (a partir de su variable __esp)
         ·Salir del programa (ret).
*/

void suma_iterativa(FILE *fpasm, char *nombre1, char *nombre2){
  fprintf(fpasm, "\tmov dword eax, [eax]\n");
  fprintf(fpasm, "bucle:\tmov dword ebx, [ebx]\n");
  fprintf(fpasm, "\tcmp ebx, 0\n");
  /*salta a fin si igual a 0*/
  fprintf(fpasm, "\tje fin\n");
  /*si no es cero sigue por aqui*/
  fprintf(fpasm, "\add eax, ebx\n");
  fprintf(fpasm, "\tjmp bucle\n");
}
/*
Genera el código NASM necesario para:

 * leer al menos dos operandos enteros del teclado
 * si el segundo operando es igual a 0, no hace nada más
 * si el segundo operando es distinto de 0
     * realizar y presentar por el terminal el resultado de la suma de los dos operandos
     * seguir leyendo operandos, acumulando la suma de cada operando al resultado y presentando este resultado por pantalla para cada operando introducido, hasta que el usuario introduzca un operando de valor igual a 0
*/
