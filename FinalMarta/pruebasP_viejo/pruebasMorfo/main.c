#include <stdio.h>
#include <stdlib.h>
#include "tokens.h"

FILE * yyout;
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
  yyout = fopen(argv[2], "w");

  while(ret){
  	ret = yylex();
		if(ret == TOK_ERROR){
			break;
		}
  };
  fclose(yyin);
  fclose(yyout);
  return 0;
}
