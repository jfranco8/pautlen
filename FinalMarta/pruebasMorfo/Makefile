CC = gcc -ansi
CFLAGS = -g
OBJ = *.o

all: lex.yy.c
	$(CC) $(CFLAGS) -o pruebaMorfo lex.yy.c main.c

lex.yy.c: alfa.l
	flex alfa.l

clean:
	rm -rf pruebaMorfo $(OBJ) lex.yy.c
