make
./ejemplo1 ej1.asm
nasm -g -o ejem1.o -f elf32 ej1.asm
gcc -ggdb -Wall -pedantic -m32 -o ej1 ejem1.o alfalib.o

./ejemplo2 ej2.asm
nasm -g -o ejem2.o -f elf32 ej2.asm
gcc -ggdb -Wall -pedantic -m32 -o ej2 ejem2.o alfalib.o

./ejemplo3 ej3.asm
nasm -g -o ejem3.o -f elf32 ej3.asm
gcc -ggdb -Wall -pedantic -m32 -o ej3 ejem3.o alfalib.o

./ejemplo4 ej4.asm
nasm -g -o ejem4.o -f elf32 ej4.asm
gcc -ggdb -Wall -pedantic -m32 -o ej4 ejem4.o alfalib.o

./ejemplo5 ej5.asm
nasm -g -o ejem5.o -f elf32 ej5.asm
gcc -ggdb -Wall -pedantic -m32 -o ej5 ejem5.o alfalib.o

./ejemplo6 ej6.asm
nasm -g -o ejem6.o -f elf32 ej6.asm
gcc -ggdb -Wall -pedantic -m32 -o ej6 ejem6.o alfalib.o

./ejemplo7 ej7.asm
nasm -g -o ejem7.o -f elf32 ej7.asm
gcc -ggdb -Wall -pedantic -m32 -o ej7 ejem7.o alfalib.o
