#include <stdio.h>
#include "generacion.h"

int main(int argc, char **argv) {
  FILE *fpasm = NULL;
  int num = 0;

  if (argc != 2) {
    fprintf(stdout, "Error: pocos argumentos\n");
    return -1;
  }

  fpasm = fopen(argv[1], "w");

  escribir_subseccion_data(fpasm);
  escribir_cabecera_bss(fpasm);

  declarar_variable(fpasm, "x", ENTERO, 1);
  declarar_variable(fpasm, "y", ENTERO, 1);

  escribir_segmento_codigo(fpasm);

  escribir_inicio_main(fpasm);

  suma_iterativa(fpasm, "x", "y");

  escribir_fin(fpasm);

  fclose(fpasm);

  return 0;
}
