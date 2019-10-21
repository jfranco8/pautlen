CFLAGS = -ggdb -W -pedantic

CC = gcc

LIB = olib.o

CLEANFILES = core core.* *.core *.o *.a temp.* *.out typescript* \
		*.[234]c *.[234]h *.bsdi *.sparc *.uw

PROGS = ejemplo1 ejemplo2

all: $(PROGS)

ejemplo1: generacion.o generacion.h
	gcc -c ejemplo1.c
	gcc -o ejemplo1 ejemplo1.o generacion.o

ejemplo2: generacion.o generacion.h
	gcc -c ejemplo2.c
	gcc -o ejemplo2 ejemplo2.o generacion.o

clean:
	@ rm -fr ${PROGS} ${CLEANFILES}
