CFLAGS = -ggdb -W -pedantic

CC = gcc

LIB = olib.o

CLEANFILES = core core.* *.core *.asm *.o *.a temp.* *.out typescript* \
		*.[234]c *.[234]h *.bsdi *.sparc *.uw

PROGS = ejemplo1 ejemplo2 ejemplo3 ejemplo4

all: $(PROGS)

ejemplo1: generacion.o generacion.h
	gcc -c ejemplo1.c
	gcc -o ejemplo1 ejemplo1.o generacion.o

ejemplo2: generacion.o generacion.h
	gcc -c ejemplo2.c
	gcc -o ejemplo2 ejemplo2.o generacion.o

ejemplo3: generacion.o generacion.h
	gcc -c ejemplo3.c
	gcc -o ejemplo3 ejemplo3.o generacion.o

ejemplo4: generacion.o generacion.h
	gcc -c ejemplo4.c
	gcc -o ejemplo4 ejemplo4.o generacion.o

clean:
	@ rm -rf ${PROGS} ${CLEANFILES}
