#ifndef TABLA_SIMBOLOS_H
#define TABLA_SIMBOLOS_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symbol.h"

#define TRUE 0
#define FALSE -1
#define HASH_TAM 50
#define GLOBAL 0
#define LOCAL 1

typedef struct {
    ht_symbol **symbols;
    int len;
} ht_item;

typedef struct {
    int count;
    ht_item** items;
} ht_hash_table;

// extern int ambit;
// extern int global_ambit_check;

/* Funciones del .c */

ht_item* ht_new_item();

void ht_item_insert_symbol(ht_item *list, ht_symbol *sym);

int get_pos_symbol_in_list(ht_item *list, char* id_sym);

void ht_del_item(ht_item* item);

ht_hash_table* ht_new();

void ht_del_hash_table(ht_hash_table* ht);

int ht_hash(char *key );

int ht_insert_symbol(ht_hash_table* ht, ht_symbol* sym);

ht_symbol* get_symbol_in_ht(ht_hash_table* ht, char* id);

int new_ambit(ht_hash_table* ht, char* id, int value);

int new_global(ht_hash_table* ht, char* id, int value);

int new_local(ht_hash_table* ht, char* id, int value);

ht_symbol* is_global_symbol(ht_hash_table* ht_global, char* id);

ht_symbol* is_local_or_global_symbol(ht_hash_table* ht_global, ht_hash_table* ht_local, char* id);

int ht_new_function(ht_hash_table* ht_global, ht_hash_table* ht_local, char* id, int value);

int get_ambit();

void set_ambit(int am);

void set_check(int ch);

void printHashTable(ht_hash_table *h);

#endif /* TABLA_HASH_H */
