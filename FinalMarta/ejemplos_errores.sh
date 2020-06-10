make clean
make

./pruebaCompilador ejemplosFin/correccion_errores/error_se15.alf ejemplosFin/correccion_errores/error_se15_mi_salida.asm

nasm -g -o ejem1.o -f elf32 ejemplosFin/correccion_errores/error_se15_mi_salida.asm
gcc -ggdb -Wall -pedantic -m32 -o ej1 ejem1.o ejemplosFin/alfalib.o

make clean
