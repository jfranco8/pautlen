#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

extern FILE * yyin;
extern FILE * yyout;

int main(int argc, char **argv){
  if (argc != 3){
    printf("Error en los argumentos de entrada: pruebaSintactico <nombre fichero entrada> <nombre fichero salida>\n");
    return -1;
  }

  if ((yyin = fopen(argv[1],"r")) == NULL){
		printf("Error al abrir el fichero de entrada");
	}

  if ((yyout = fopen(argv[2],"w")) == NULL){
		printf("Error al abrir el fichero de salida");
	}

  yyparse();
  fclose(yyin);
	fclose(yyout);
  return 0;
}
