CFLAGS = -ggdb -W 

CC = gcc

LIB = olib.o

CLEANFILES = core core.* *.core *.asm *.o *.a temp.* *.out typescript* \
		*.[234]c *.[234]h *.bsdi *.sparc *.uw

PROGS = ejemplo1 ejemplo2 ejemplo3 ejemplo4 ejemplo5 ejemplo6 ejemplo7

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

ejemplo5: generacion.o generacion.h
	gcc -c ejemplo5.c
	gcc -o ejemplo5 ejemplo5.o generacion.o

ejemplo6: generacion.o generacion.h
	gcc -c ejemplo6.c
	gcc -o ejemplo6 ejemplo6.o generacion.o

ejemplo7: generacion.o generacion.h
	gcc -c ejemplo7.c
	gcc -o ejemplo7 ejemplo7.o generacion.o

clean:
	@ rm -rf ${PROGS} ${CLEANFILES}
