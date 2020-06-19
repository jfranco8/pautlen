#include <stdio.h>
#include <stdlib.h>
#include "generacion.h"
#include "y.tab.h"

/* Globales externas de flex y bison */
extern int yylex();
extern int yyparse();

extern FILE *yyin;
// FILE *yyout;
FILE *out;

int main(int argc, char *argv[])
{
    /* Comprobacion args de entrada */
    if (argc != 3)
    {
        printf("Formato entrada: pruebaSintactico <fin> <out>\n");
        return EXIT_FAILURE;
    }

    /* Apertura dichero entrada */
    yyin = fopen(argv[1], "r");
    if (!yyin)
    {
        printf("Apertura fichero entrada fallida\n");
        return EXIT_FAILURE;
    }


    /* Apertura fichero salida */
    // yyout = fopen(argv[2], "w");
    // if (!yyout)
    // {
    //     printf("Apertura fichero salida fallida\n");
    //     return EXIT_FAILURE;
    // }

    out = fopen(argv[2], "w");
    if (!out)
    {
        printf("Apertura fichero salida asm fallida\n");
        return EXIT_FAILURE;
    }

    printf("[Leyendo desde %s para volcar el asm en %s]...\n", argv[1], argv[2]);

    /* Llamada a la funcion que realiza el analisis */
    if (yyparse() != 0)
    {
        fclose(yyin);
        // fclose(yyout);
        fclose(out);
        return EXIT_FAILURE;
    }


    /* Cierre de ficheros */
    fclose(yyin);
    escribir_fin(out);
    // fclose(yyout);
    fclose(out);

    return EXIT_SUCCESS;
}
//
//
//
// #include <stdio.h>
// #include <stdlib.h>
// #include "alfa.h"
// #include "y.tab.h"
//
// extern FILE* yyin;
// extern FILE* yyout;
// extern int yyleng;
// extern char* yytext;
// extern int line_count;
// extern int col_count;
//
// FILE* yyout;
// FILE* out;
//
// int main(int argc, char **argv){
//
// 	if (argc!= 3){
// 		printf("Especifica fichero de entrada y de salida\n");
// 		return 0;
// 	}
//
// 	if ((yyin = fopen(argv[1],"r")) == NULL){
// 		printf("Error al abrir el fichero de entrada\n");
// 		return -1;
// 	}
//
// 	if ((yyout = fopen(argv[2],"w")) == NULL){
// 		printf("Error al abrir el fichero de salida\n");
// 		return -1;
// 	}
//
// 	out = fopen("omicron.asm","w");
// 	yyout = fopen("residuo.txt","w");
//
// 	yyparse();
//
// 	fclose(yyin);
// 	fclose(yyout);
// 	fclose(yyout);
// 	escribir_fin(out);
//   fclose(out);
//
// 	return 1;
// }
