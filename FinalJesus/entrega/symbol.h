#ifndef SYMBOL_H
#define SYMBOL_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef enum { VARIABLE, PARAMETRO, FUNCION } SYMBOL_CATEGORY;
typedef enum { INT, BOOLEAN } TYPE;
typedef enum { ESCALAR, VECTOR } CATEGORY;

typedef struct {
    char *id;
    SYMBOL_CATEGORY s_category;
    TYPE type;
    CATEGORY category;
    int value;
    int len;
    int num_param;
    int num_var_local;
    int posision;
} ht_symbol;

ht_symbol* create_symbol(char* id, int value);

void delete_symbol(ht_symbol* sym);

/* --- SETTERS --- */

void set_symbol_category(ht_symbol* sym, SYMBOL_CATEGORY cat);

void set_category(ht_symbol* sym, CATEGORY cat);

void set_type(ht_symbol* sym, TYPE t);

void set_value(ht_symbol* sym, int val);

void set_len(ht_symbol* sym, int len);

void set_num_param(ht_symbol* sym, int n);

void set_num_var_global(ht_symbol* sym, int n);

void set_posicion(ht_symbol* sym, int p);

/* --- GETTERS --- */

char* get_id(ht_symbol* sym);

SYMBOL_CATEGORY get_symbol_category(ht_symbol* sym);

CATEGORY get_category(ht_symbol* sym);

TYPE get_type(ht_symbol* sym);

int get_value(ht_symbol* sym);

int get_len(ht_symbol* sym);

int get_num_param(ht_symbol* sym);

int get_num_var_global(ht_symbol* sym);

int get_posicion(ht_symbol* sym);


#endif /* TABLA_HASH_H */
