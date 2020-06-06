CC = gcc -ansi -g
OBJ = *.o

all: pruebaSintactico

pruebaSintactico: lex.yy.c bison
	$(CC) -o pruebaSintactico pruebaSintactico.c lex.yy.c y.tab.c y.tab.h

lex.yy.c: alfa.l
	flex alfa.l

bison: alfa.y
	bison -d -y -v alfa.y

clean:
	rm -rf $(OBJ) y.output y.tab.c y.tab.h lex.yy.c pruebaSintactico
