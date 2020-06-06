all: prueba_tabla

prueba_tabla: tabla.c tabla_simbolos.c symbol.c
	gcc -Wall -g -o prueba_tabla tabla.c tabla_simbolos.c symbol.c

clean:
	rm -rf *.o prueba_tabla
