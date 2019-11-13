CC = gcc -ansi
CFLAGS = -Wall -g
OBJ = *.o

all: lex.yy.c
	$(CC) $(CFLAGS) -o morfologico lex.yy.c main.c

lex.yy.c: alfa.l
	flex alfa.l

clean:
	rm -rf morfologico $(OBJ) lex.yy.c
