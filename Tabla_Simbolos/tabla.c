#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tabla_simbolos.h"

#define BUF_SIZE 1024
#define ALFA_VAL_THRESH -1
#define ALFA_CLOSE_ID "cierre"
#define ALFA_CLOSE_VAL -999
#define ALFA_HELP "Para ejecutar el programa: ./pruebaTabla fichero_entrada fichero_salida\n"

ht_hash_table *ht_global = NULL;
ht_hash_table *ht_local = NULL;

void help() {
    printf("Error en los argumentos de entrada \n");
    printf(ALFA_HELP);
}

void alfa_parse(char *buf, FILE *out) {
    ht_symbol *info = NULL;
    char *id = NULL, *c_value = NULL;
    int scan, value, funct;
    scan = sscanf(buf, "%ms\t%i", &id, &value);
    if(scan == 2) {
        if(value < ALFA_VAL_THRESH) {
            if(!strcmp(id, ALFA_CLOSE_ID) && value == ALFA_CLOSE_VAL) {
                fprintf(out, ALFA_CLOSE_ID "\n");
                free(id);
                // if(ht_local != NULL){
                //   ht_del_hash_table(ht_local);
                //   ht_local = NULL;
                // }
                ht_local = NULL;
            } else {
                info = create_symbol(id, value);
                if(info == NULL) {
                    free(id);
                    return;
                }
                set_symbol_category(info, FUNCION);
                set_type(info, INT);
                set_category(info, ESCALAR);
                ht_local = ht_new();
                funct = ht_new_function(ht_global, ht_local, id, value);
                if(funct==FALSE){
                  fprintf(out, "-1\t%s\n", id);
                } else {
                  fprintf(out, "%s\n", id);
                }
                delete_symbol(info);
                free(id);
            }
        } else if(value > ALFA_VAL_THRESH) {
            info = create_symbol(id, value);
            printf("Crea el simbolo %s con el valor %d\n", id, value);
            if(info == NULL) {
                free(id);
                return;
            }
            set_symbol_category(info, VARIABLE);
            set_type(info, INT);
            set_category(info, ESCALAR);
            if(get_ambit() == GLOBAL){
              if(new_global(ht_global, id, value)==FALSE){
                fprintf(out, "-1\t%s\n", id);
              } else {
                fprintf(out, "%s\n", id);
              }
            } else {
              if(new_local(ht_local, id, value)==FALSE){
                fprintf(out, "-1\t%s\n", id);
              } else {
                fprintf(out, "%s\n", id);
              }
            }
            delete_symbol(info);
            free(id);
        }
    } else if(scan == 1) {
        info = is_local_or_global_symbol(ht_global, ht_local, id);
        if(info == NULL){
          fprintf(out, "%s\t-1\n", id);
        } else {
          fprintf(out, "%s\t%d\n", id, get_value(info));
        }
        free(id);
    }
}

int main(int argc, char **argv) {
    FILE *in = NULL, *out = NULL;

    ht_global = ht_new();

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
        alfa_parse(buf, out);
    }
    if(ht_global != NULL)
      ht_del_hash_table(ht_global);
    if(ht_local != NULL)
      ht_del_hash_table(ht_local);
    fclose(in);
    fclose(out);

    return TRUE;
}
