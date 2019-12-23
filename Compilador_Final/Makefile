# all: prueba_tabla
#
# prueba_tabla: tabla.c tabla_simbolos.c symbol.c
# 	gcc -Wall -g -o prueba_tabla tabla.c tabla_simbolos.c symbol.c
#
# clean:
# 	rm -rf *.o prueba_tabla

# all: prueba_compilador.c lex.yy.c alfa.c generacion.c tabla_simbolos.c symbol.c
# 	gcc -Wall -o pruebaSemantico prueba_compilador.c lex.yy.c alfa.c generacion.c tabla_simbolos.c symbol.c
#
# lex.yy.c: alfa.l
# 	$ flex alfa.l
#
# y.tab.c: alfa.y
# 	$ bison -dyv alfa.y

pruebaCompilador:
	flex alfa.l
	bison -d --debug -y -v alfa.y
	gcc -c symbol.c
	gcc -c lex.yy.c
	gcc -c genereacion.c
	gcc -c tabla_simbolos.c
	gcc -o pruebaCompilador y.tab.c generacion.o symbol.o lex.yy.o tabla_simbolos.o

clean:
	rm -rf *.o pruebaCompilador lex* e.tab.* alfa.tab.*
