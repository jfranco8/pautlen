
make clean
make

# ./pruebaCompilador prueba_final/aritmeticas1.alf prueba_final/aritmeticas1_mi_salida.asm
#
# nasm -g -o prueba_final/aritmeticas1_mi_salida.o -f elf32 prueba_final/aritmeticas1_mi_salida.asm
# gcc -o prueba_final/aritmetica1 -m32 prueba_final/aritmeticas1_mi_salida.o prueba_final/alfalib.o
#
# ./pruebaCompilador prueba_final/aritmeticas2.alf prueba_final/aritmeticas2_mi_salida.asm
#
# nasm -g -o prueba_final/aritmeticas2_mi_salida.o -f elf32 prueba_final/aritmeticas2_mi_salida.asm
# gcc -o prueba_final/aritmetica2 -m32 prueba_final/aritmeticas2_mi_salida.o prueba_final/alfalib.o
#
# ./pruebaCompilador prueba_final/comparaciones.alf prueba_final/comparaciones_mi_salida.asm
#
# nasm -g -o prueba_final/comparaciones_mi_salida.o -f elf32 prueba_final/comparaciones_mi_salida.asm
# gcc -o prueba_final/comparaciones -m32 prueba_final/comparaciones_mi_salida.o prueba_final/alfalib.o
#
# valgrind --leak-check=full -v ./pruebaCompilador prueba_final/funciones1.alf prueba_final/funciones1_mi_salida.asm
# ./pruebaCompilador prueba_final/funciones1.alf prueba_final/funciones1_mi_salida.asm
#
# nasm -g -o prueba_final/funciones1_mi_salida.o -f elf32 prueba_final/funciones1_mi_salida.asm
# gcc -o prueba_final/funciones1 -m32 prueba_final/funciones1_mi_salida.o prueba_final/alfalib.o
#
# ./pruebaCompilador prueba_final/funciones2.alf prueba_final/funciones2_mi_salida.asm
#
# nasm -g -o prueba_final/funciones2_mi_salida.o -f elf32 prueba_final/funciones2_mi_salida.asm
# gcc -o prueba_final/funciones2 -m32 prueba_final/funciones2_mi_salida.o prueba_final/alfalib.o
#
# ./pruebaCompilador prueba_final/if1.alf prueba_final/if1_mi_salida.asm
#
# nasm -g -o prueba_final/if1_mi_salida.o -f elf32 prueba_final/if1_mi_salida.asm
# gcc -o prueba_final/if1 -m32 prueba_final/if1_mi_salida.o prueba_final/alfalib.o
#
# ./pruebaCompilador prueba_final/if2.alf prueba_final/if2_mi_salida.asm
#
# nasm -g -o prueba_final/if2_mi_salida.o -f elf32 prueba_final/if2_mi_salida.asm
# gcc -o prueba_final/if2 -m32 prueba_final/if2_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/if3.alf prueba_final/if3_mi_salida.asm

nasm -g -o prueba_final/if3_mi_salida.o -f elf32 prueba_final/if3_mi_salida.asm
gcc -o prueba_final/if3 -m32 prueba_final/if3_mi_salida.o prueba_final/alfalib.o

# make clean
