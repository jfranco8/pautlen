// hash_table.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "tabla_simbolos.h"

int ambit = 0;
int global_ambit_check = 0;

ht_item* ht_new_item() {
    ht_item* i = malloc(sizeof(ht_item)+12);
    i->symbols = NULL;
    i->len = 0;
    return i;
}

void ht_item_insert_symbol(ht_item *list, ht_symbol *sym){
  if(!list || !sym){
    return;
  }
  int new_num_symbols = (list->len) + 1;
  if(list->symbols == NULL){
    list->symbols = (ht_symbol**)malloc(sizeof(ht_symbol*)+8);
  } else {
    list->symbols = (ht_symbol **)realloc(list->symbols, new_num_symbols*(sizeof(ht_symbol*)+8));
  }
  list->symbols[new_num_symbols - 1] = sym;
  list->len = new_num_symbols;
  printf("--------  LO INSERTA CON VALUE %d  -------\n", get_value(sym));
}

int get_pos_symbol_in_list(ht_item *list, char* id_sym){
  int i;
  if(!list || !id_sym) return FALSE;
  for(i=(list->len)-1; i>=0; i--){
    if(list->symbols[i]){
      if(strcmp(get_id(list->symbols[i]), id_sym) == 0 ){
        printf("Encuentra en la posicion %d el simbolo %s con valor %d\n", i, get_id(list->symbols[i]), get_value(list->symbols[i]));
        return i;
      }
    }
  }
  return FALSE;
}

void ht_del_item(ht_item* item) {
  if(!item) return;
  int i;
  for(i=item->len-1; i>=0; i--){
    if(item->symbols[i] != NULL)
      delete_symbol(item->symbols[i]);
  }
  if(item->symbols)
    free(item->symbols);
  if(item)
    free(item);
}

ht_hash_table* ht_new() {
  int i;

  if(global_ambit_check == TRUE){
    global_ambit_check = FALSE;
    // ambit = GLOBAL;
  } else {
    ambit = LOCAL;
  }

  ht_hash_table* ht = malloc(sizeof(ht_hash_table)+8);
  ht->items = (ht_item **)malloc(HASH_TAM*(sizeof(ht_item*)+8));
  for(i=0; i<HASH_TAM; i++){
    ht->items[i] = ht_new_item();
  }
  ht->count = 0;
  return ht;
}

void ht_del_hash_table(ht_hash_table* ht) {
  if(!ht){
    return;
  }
  // ambit = LOCAL;
  for (int i = HASH_TAM-1; i >= 0; i--) {
    if (ht->items[i] != NULL){
       ht_del_item(ht->items[i]);
    }
  }

  free(ht->items);
  free(ht);
}

int ht_hash(char *key ) {
  if(!key){
    return -999;
  }
	unsigned long int hashval = 0;
	int i = 0;
	/* Convert our string to an integer */
	while( i < strlen( key ) ) {
		// hashval = hashval << 8;
		hashval += key[i];
		i++;
	}
	return (hashval % HASH_TAM);
}

int ht_insert_symbol(ht_hash_table* ht, ht_symbol* sym){
  int h;
  ht_item *item;

  if(!ht | !sym){
    return FALSE;
  }

  h = ht_hash(sym->id);
  item = ht->items[h];

  if(item->len > 0){
    if(get_pos_symbol_in_list(item, get_id(sym)) != FALSE){
      // delete_symbol(sym);
      return FALSE;
    }
  }

  ht_item_insert_symbol(ht->items[h], sym);
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
    printf("AL COGER %s TIENE EL VALUE %d\n", id, get_value(item->symbols[pos]));
    return item->symbols[pos];
  }

  return NULL;
}

int new_ambit(ht_hash_table* ht, char* id, int value){
  ht_symbol *sym = create_symbol(id, value);
  printf("DENTRO CREAL EL SIMBOLO %s CON EL VALOR %d", id, get_value(sym));
  return ht_insert_symbol(ht, sym);
}

int new_global(ht_hash_table* ht, char* id, int value){
  global_ambit_check = TRUE;
  ambit = GLOBAL;
  return new_ambit(ht, id, value);
}

int new_local(ht_hash_table* ht, char* id, int value){
  global_ambit_check = FALSE;
  ambit = LOCAL;
  return new_ambit(ht, id, value);
}

ht_symbol* is_global_symbol(ht_hash_table* ht_global, char* id){
  return get_symbol_in_ht(ht_global, id);
  /* Devuelve NULL si el símbolo no se puede usar en el ámbito global,
  o el símbolo en caso contrario */
}

ht_symbol* is_local_or_global_symbol(ht_hash_table* ht_global, ht_hash_table* ht_local, char* id){
  // if(ambit != LOCAL){
  //   return get_symbol_in_ht(ht_global, id);
  // }
  ht_symbol *sym = get_symbol_in_ht(ht_local, id);
  /* si no pertenece al ámbito global, mira a ver si es local */

  if(sym == NULL){
    return get_symbol_in_ht(ht_global, id);
  }
  return sym;
}

int ht_new_function(ht_hash_table* ht_global, ht_hash_table* ht_local, char* id, int value){
  if(!ht_global){
    return FALSE;
  }

  /*
  Vamos a crear la funcion en la tabla global y en una nueva local.
  Lo primero que haremos será ver si la funcion ya existe, por lo que no podremos crearla
  */
  ht_symbol *sym;

  if (get_symbol_in_ht(ht_global, id) == NULL){
    sym = create_symbol(id, value);
    if(sym == NULL){
      return FALSE;
    }
    if(ht_insert_symbol(ht_global, sym) == FALSE){
      return FALSE;
    }
    if(ht_insert_symbol(ht_local, sym) == FALSE){
      return FALSE;
    }
    // global_ambit_check = FALSE;
    ambit = LOCAL;
    return TRUE;
  }

  return FALSE;
}

int get_ambit(){
  return ambit;
}

void set_ambit(int am){
  ambit = am;
}

void set_check(int ch){
  global_ambit_check = ch;
}


/* FUNCIONES AUXILIARES PRINT */

void printSimbolo(ht_symbol *s){
  if(s){
    printf("SIMBOLO: %s VALUE: %d", s->id, s->value);
  }
}
void printLista(ht_item *l){
  int i, len;
  if(l){
    len = l->len;
    if(len <= 0)
      printf("VACIA");
    else{
      printf("ITEM: ");
      for(i=0; i<len; i++){
        printf(" %d--> ", i);
        printSimbolo(*(l->symbols + i));
      }
    }
  }
}

void printHashTable(ht_hash_table *h){
  int i;
  if(h){
    printf("HASH TABLE:\n");
    for(i=0; i<HASH_TAM; i++){
      printLista(*(h->items + i));
      printf("\n");
    }
  }
}
