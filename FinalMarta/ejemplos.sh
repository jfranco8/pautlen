make clean
make

./pruebaCompilador ejemplosFin/correccion/logicas2.alf ejemplosFin/correccion/logicas2_mi_salida.asm
#valgrind --leak-check=yes ./pruebaCompilador ejemplosFin/correccion/if1.alf ejemplosFin/correccion/if1_mi_salida.asm

nasm -g -o ejem1.o -f elf32 ejemplosFin/correccion/logicas2_mi_salida.asm
gcc -ggdb -Wall -pedantic -m32 -o ej1 ejem1.o ejemplosFin/alfalib.o

make clean
