pruebaCompilador:
	flex alfa.l
	bison -d -y -v alfa.y
	gcc -c symbol.c
	gcc -c lex.yy.c -o lex.yy.o
	gcc -c generacion.c
	gcc -c tabla_simbolos.c
	gcc -o pruebaCompilador prueba_compilador.c y.tab.c generacion.o symbol.o lex.yy.o tabla_simbolos.o

clean:
	rm -rf *.o pruebaCompilador y.output y.tab.c y.tab.h lex.yy.c
