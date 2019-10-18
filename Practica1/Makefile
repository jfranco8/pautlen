CFLAGS = -ggdb -W -pedantic

CC = gcc

LDADO = -lm -m64

LIB = olib.o

CLEANFILES = core core.* *.core *.o *.a temp.* *.out typescript* \
		*.[234]c *.[234]h *.bsdi *.sparc *.uw

PROGS = ejemplo1

all: $(PROGS)

ejemplo1: ejemplo1.o generacion.o
	$(CC) -o ejemplo1 ejemplo1.o generacion.o $(LDADD)

clean:
	@ rm -fr ${PROGS} ${CLEANFILES}
