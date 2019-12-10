// hash_table.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "tabla_simbolos.h"

int ambit = 0;
int global_ambit_check = 0;

ht_item* ht_new_item() {
    ht_item* i = malloc(sizeof(ht_item));
    i->symbols = NULL;
    i->len = 0;
    return i;
}

void ht_item_insert_symbol(ht_item *list, ht_symbol *sym){
  if(!list || !sym){
    return;
  }
  int new_num_symbols = list->len + 1;
  list->symbols = (ht_symbol **)realloc(list->symbols, new_num_symbols*sizeof(ht_symbol*));
  list->symbols[list->len] = sym;
  list->len = new_num_symbols;
}

int get_pos_symbol_in_list(ht_item *list, char* id_sym){
  int i;
  for(i=0; i<list->len; i++){
    if(list->symbols[i]){
      if(strcmp(list->symbols[i]->id, id_sym) == 0 ){
        return i;
      }
    }
  }
  return FALSE;
}

void ht_del_item(ht_item* item) {
  int i;
  for(i=0; i<item->len; i++){
    free(item->symbols[i]);
  }
  free(item->symbols);
  free(item);
}

ht_hash_table* ht_new() {
  int i;

  if(global_ambit_check == TRUE){
    global_ambit_check = FALSE;
    ambit = GLOBAL;
  } else {
    ambit = LOCAL;
  }

  ht_hash_table* ht = malloc(sizeof(ht_hash_table));
  ht->items = (ht_item **)malloc(HASH_TAM*sizeof(ht_item*));
  for(i=0; i<HASH_TAM; i++){
    ht->items[i] = ht_new_item();
  }
  ht->count = 0;
  return ht;
}

void ht_del_hash_table(ht_hash_table* ht) {
  ambit = LOCAL;
  for (int i = 0; i < HASH_TAM; i++) {
    if (ht->items[i]){
       ht_del_item(ht->items[i]);
    }
  }
  free(ht->items);
  free(ht);
}

int ht_hash(char *key ) {
  if(!key){
    return FALSE;
  }
	unsigned long int hashval = 0;
	int i = 0;
	/* Convert our string to an integer */
	while( hashval < HASH_TAM && i < strlen( key ) ) {
		hashval = hashval << 8;
		hashval += key[i];
		i++;
	}
	return hashval % HASH_TAM;
}

int ht_insert_symbol(ht_hash_table* ht, ht_symbol* sym){
  int h;
  ht_item *item = malloc(sizeof(ht_item));

  if(!ht | !sym){
    return FALSE;
  }

  h = ht_hash(sym->id);
  item = ht->items[h];

  if(item->len > 0){
    if(get_pos_symbol_in_list(item, sym->id) != FALSE){
      delete_symbol(sym);
      return FALSE;
    }
  }

  ht_item_insert_symbol(item, sym);
  return TRUE;

}

ht_symbol* get_symbol_in_ht(ht_hash_table* ht, char* id){
  int h, pos;
  ht_item *item;

  if(!ht | !id){
    return NULL;
  }

  h = ht_hash(id);
  item = ht->items[h];
  pos = get_pos_symbol_in_list(item, id);

  if(pos != FALSE){
    return item->symbols[pos];
  }

  return NULL;
}

int new_ambit(ht_hash_table* ht, char* id, int value){
  ht_symbol *sym = create_symbol(id, value);
  return ht_insert_symbol(ht, sym);
}

int new_global(ht_hash_table* ht, char* id, int value){
  global_ambit_check = TRUE;
  return new_ambit(ht, id, value);
}

int new_local(ht_hash_table* ht, char* id, int value){
  global_ambit_check = FALSE;
  return new_ambit(ht, id, value);
}

ht_symbol* is_global_symbol(ht_hash_table* ht_global, char* id){
  return get_symbol_in_ht(ht_global, id);
  /* Devuelve NULL si el símbolo no se puede usar en el ámbito global,
  o el símbolo en caso contrario */
}

ht_symbol* is_local_or_global_symbol(ht_hash_table* ht_global, ht_hash_table* ht_local, char* id){
  ht_symbol *sym = is_global_symbol(ht_global, id);
  /* si no pertenece al ámbito global, mira a ver si es local */
  if(sym == NULL){
    return get_symbol_in_ht(ht_local, id);
  }
  return sym;
}

int ht_new_function(ht_hash_table* ht_global, ht_hash_table* ht_local, char* id, int value){
  /*
  Vamos a crear la funcion en la tabla global y en una nueva local.
  Lo primero que haremos será ver si la funcion ya existe, por lo que no podremos crearla
  */
  ht_symbol *sym;

  if (get_symbol_in_ht(ht_global, id) == NULL){
    sym = create_symbol(id, value);
    if(ht_insert_symbol(ht_global, sym) == FALSE){
      return FALSE;
    }
    if(ht_insert_symbol(ht_local, sym) == FALSE){
      return FALSE;
    }
    return TRUE;
  }

  return FALSE;
}

int get_ambit(){
  return ambit;
}
