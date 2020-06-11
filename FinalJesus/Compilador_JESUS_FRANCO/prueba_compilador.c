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
