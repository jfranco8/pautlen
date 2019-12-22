# all: prueba_tabla
#
# prueba_tabla: tabla.c tabla_simbolos.c symbol.c
# 	gcc -Wall -g -o prueba_tabla tabla.c tabla_simbolos.c symbol.c
#
# clean:
# 	rm -rf *.o prueba_tabla

all: prueba_compilador.c lex.yy.c alfa.c generacion.c tabla_simbolos.c symbol.c
	gcc -Wall -o pruebaSemantico prueba_compilador.c lex.yy.c alfa.c generacion.c tabla_simbolos.c symbol.c

lex.yy.c: alfa.l
	$ flex alfa.l

y.tab.c: alfa.y
	$ bison -dyv alfa.y
