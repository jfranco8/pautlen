#ifndef TABLA_SIMBOLOS_H
#define TABLA_SIMBOLOS_H
#include "alfa.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symbol.h"

#define TRUE 0
#define FALSE -1
#define HASH_TAM 50
#define GLOBAL 0
#define LOCAL 1

#define BUF_SIZE 1024
#define ALFA_VAL_THRESH -1
#define ALFA_CLOSE_ID "cierre"
#define ALFA_CLOSE_VAL -999
#define ALFA_HELP "Para ejecutar el programa: ./pruebaTabla fichero_entrada fichero_salida\n"

typedef struct {
    ht_symbol **symbols;
    int len;
} ht_item;

typedef struct {
    int count;
    ht_item** items;
} ht_hash_table;

typedef struct {
    ht_hash_table * global;
    ht_hash_table* local;
} tabla_simbolo;

// extern int ambit;
// extern int global_ambit_check;

/* Funciones del .c */

void alfa_parse(char *buf, FILE *out, tabla_simbolo* ts);

ht_item* ht_new_item();

tabla_simbolo* new_tabla_simbolos();

ht_hash_table* ts_get_global(tabla_simbolo *ts);

ht_hash_table* ts_get_local(tabla_simbolo *ts);

void ts_set_local(tabla_simbolo *ts, ht_hash_table *ht);

void ht_item_insert_symbol(ht_item *list, ht_symbol *sym);

int get_pos_symbol_in_list(ht_item *list, char* id_sym);

void ht_del_item(ht_item* item);

ht_hash_table* ht_new();

void ht_del_hash_table(ht_hash_table* ht);

int ht_hash(char *key );

int ht_insert_symbol(ht_hash_table* ht, ht_symbol* sym);

ht_symbol* get_symbol_in_ht(ht_hash_table* ht, char* id);

int new_ambit(ht_hash_table* ht, char* id, int value, int clase, int tipo, int s_category,
              int len, int num_param, int pos_param, int num_var_local, int pos_var_local);

int new_global(ht_hash_table* ht, char* id, int value, int clase, int tipo, int s_category,
              int len, int num_param, int pos_param, int num_var_local, int pos_var_local);

int new_local(ht_hash_table* ht, char* id, int value, int clase, int tipo, int s_category,
              int len, int num_param, int pos_param, int num_var_local, int pos_var_local);

ht_symbol* is_global_symbol(ht_hash_table* ht_global, char* id);

ht_symbol* is_local_or_global_symbol(ht_hash_table* ht_global, ht_hash_table* ht_local, char* id);

int ht_new_function(ht_hash_table* ht_global, ht_hash_table* ht_local, char* id, int value);

int get_ambit();

void set_ambit(int am);

void set_check(int ch);

void printHashTable(ht_hash_table *h);

#endif /* TABLA_HASH_H */
