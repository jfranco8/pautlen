#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tabla_simbolos.h"

#define BUF_SIZE 1024
#define ALFA_VAL_THRESH -1
#define ALFA_CLOSE_ID "cierre"
#define ALFA_CLOSE_VAL -999
#define ALFA_HELP "Para ejecutar el programa: ./pruebaTabla fichero_entrada fichero_salida\n"

tabla_simbolo *ts = NULL;
int flag = 0;

void help() {
    printf("Error en los argumentos de entrada \n");
    printf(ALFA_HELP);
}


int main(int argc, char **argv) {
    FILE *in = NULL, *out = NULL;

    ts = new_tabla_simbolos();

    char buf[BUF_SIZE];
    if(argc != 3) {
        help();
        return FALSE;
    }
    in = fopen(argv[1], "r");
    if(in == NULL) {
        printf("El archivo de entrada no puede abrirse");
        return FALSE;
    }
    out = fopen(argv[2], "w");
    if(out == NULL) {
        printf("El archivo de salida no puede abrirse");
        fclose(in);
        return FALSE;
    }
    while(fgets(buf, BUF_SIZE, in) != NULL) {
        alfa_parse(buf, out, ts);
    }
    if(ts_get_global(ts) != NULL)
      ht_del_hash_table(ts_get_global(ts));
    if(ts_get_local(ts) != NULL)
      ht_del_hash_table(ts_get_local(ts));
    free(ts);
    fclose(in);
    fclose(out);

    return TRUE;
}
