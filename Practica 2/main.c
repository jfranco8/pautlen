#include <stdio.h>
#include <stdlib.h>

FILE * yyout;
FILE* errores;
extern FILE* yyin;
extern int yylex();

int main(int argc, char const *argv[]) {
	int ret=1;
  /* code */
  if(argc != 3){
    printf("Se deben de meter 3 parametros de entrada:\n");
    printf("./ nombre_ejecutable  fichero_entrada fichero_salida \n");
    return -1;
  }

  yyin = fopen(argv[1], "r");
  errores = fopen("errores.txt", "w+");
  yyout = fopen(argv[2], "w");

  while(ret){
  	ret = yylex();
  };
  fclose(yyin);
  fclose(yyout);
  fclose(errores);
  return 0;
}
