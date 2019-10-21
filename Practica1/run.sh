make
./ejemplo1 ej1.asm
nasm -g -o ejem1.o -f elf32 ej1.asm
gcc -ggdb -Wall -pedantic -m32 -o ejem1 ejem1.o alfalib.o

./ejemplo2 ej2.asm
nasm -g -o ejem2.o -f elf32 ej2.asm
gcc -ggdb -Wall -pedantic -m32 -o ejem2 ejem2.o alfalib.o
