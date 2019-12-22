#include <stdio.h>
#include <stdlib.h>

/* Globales externas de flex y bison */
extern int yylex();
extern int yyparse();

extern FILE *yyin;
FILE *fout;

int main(int argc, char *argv[])
{
    /* Comprobacion args de entrada */
    if (argc != 3)
    {
        printf("Formato entrada: pruebaSintactico <fin> <fout>\n");
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
    fout = fopen(argv[2], "w");
    if (!fout)
    {
        printf("Apertura fichero salida fallida\n");
        return EXIT_FAILURE;
    }

    printf("[Leyendo desde %s para volcar el asm en %s]...\n", argv[1], argv[2]);

    /* Llamada a la funcion que realiza el analisis */
    if (yyparse() != 0)
    {
        fclose(yyin);
        fclose(fout);
        return EXIT_FAILURE;
    }


    /* Cierre de ficheros */
    fclose(yyin);
    fclose(fout);

    return EXIT_SUCCESS;
}
