#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "symbol.h"

ht_symbol* create_symbol(char* id, int value){
  ht_symbol *sym = (ht_symbol*)malloc(sizeof(ht_symbol));
  if (sym == NULL){
    return NULL;
  }
  sym->id = (char *)malloc(strlen(id)*sizeof(char)+8);
  strcpy(sym->id, id);
  sym->value = value;
  return sym;
}

void delete_symbol(ht_symbol* sym){
  if(sym == NULL) return;
  if(sym->id != NULL)
    free(sym->id);
  if(sym != NULL)
    free(sym);
}

void set_symbol_category(ht_symbol* sym, SYMBOL_CATEGORY cat){
  sym->s_category = cat;
}

void set_category(ht_symbol* sym, CATEGORY cat){
  sym->category = cat;
}

void set_type(ht_symbol* sym, TYPE t){
  sym->type = t;
}

void set_value(ht_symbol* sym, int val){
  sym->value = val;
}

void set_len(ht_symbol* sym, int len){
  sym->len = len;
}

void set_num_param(ht_symbol* sym, int n){
  sym->num_param = n;
}

void set_num_var_global(ht_symbol* sym, int n){
  sym->num_var_local = n;
}

void set_pos_param(ht_symbol* sym, int p){
  sym->pos_param = p;
}

void set_pos_var_local(ht_symbol* sym, int p){
  sym->pos_var_local = p;
}

char* get_id(ht_symbol* sym){
  return sym->id;
}

SYMBOL_CATEGORY get_symbol_category(ht_symbol* sym){
  return sym->s_category;
}

CATEGORY get_category(ht_symbol* sym){
  return sym->category;
}

TYPE get_type(ht_symbol* sym){
  return sym->type;
}

int get_value(ht_symbol* sym){
  return sym->value;
}

int get_len(ht_symbol* sym){
  return sym->len;
}

int get_num_param(ht_symbol* sym){
  return sym->num_param;
}

int get_num_var_global(ht_symbol* sym){
  return sym->num_var_local;
}
