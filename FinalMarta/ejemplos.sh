make clean
make

./pruebaCompilador ejemplosFin/correccion/funciones2.alf ejemplosFin/correccion/funciones2_mi_salida.asm
#valgrind --leak-check=yes ./pruebaCompilador ejemplosFin/correccion/funciones2.alf ejemplosFin/correccion/funciones2_mi_salida.asm

nasm -g -o ejem1.o -f elf32 ejemplosFin/correccion/funciones2_mi_salida.asm
gcc -ggdb -Wall -pedantic -m32 -o ej1 ejem1.o ejemplosFin/alfalib.o

make clean
