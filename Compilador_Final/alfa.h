#ifndef _ALFA_H
#define _ALFA_H

#define MAX_LONG_ID 100
#define MAX_TAMANIO_VECTOR 64

// /*Tipo actual*/
// #define INT 1
// #define BOOLEAN 2
//
// /*Clase actual*/
// #define ESCALAR 1
// #define VECTOR 2

/* otros defines */
typedef struct
{
  char lexema[MAX_LONG_ID+1];
  int tipo;
  int valor_entero;
  int es_direccion;
  int etiqueta;
  int clase_actual;
  int tipo_actual;
}tipo_atributos;

#endif
