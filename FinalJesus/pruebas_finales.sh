
make clean
make

./pruebaCompilador prueba_final/aritmeticas1.alf prueba_final/aritmeticas1_mi_salida.asm

nasm -g -o prueba_final/aritmeticas1_mi_salida.o -f elf32 prueba_final/aritmeticas1_mi_salida.asm
gcc -o prueba_final/aritmetica1 -m32 prueba_final/aritmeticas1_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/aritmeticas2.alf prueba_final/aritmeticas2_mi_salida.asm

nasm -g -o prueba_final/aritmeticas2_mi_salida.o -f elf32 prueba_final/aritmeticas2_mi_salida.asm
gcc -o prueba_final/aritmetica2 -m32 prueba_final/aritmeticas2_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/comparaciones.alf prueba_final/comparaciones_mi_salida.asm

nasm -g -o prueba_final/comparaciones_mi_salida.o -f elf32 prueba_final/comparaciones_mi_salida.asm
gcc -o prueba_final/comparaciones -m32 prueba_final/comparaciones_mi_salida.o prueba_final/alfalib.o

# make clean
