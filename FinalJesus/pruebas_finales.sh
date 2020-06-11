
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

# valgrind --leak-check=full -v ./pruebaCompilador prueba_final/funciones1.alf prueba_final/funciones1_mi_salida.asm
./pruebaCompilador prueba_final/funciones1.alf prueba_final/funciones1_mi_salida.asm

nasm -g -o prueba_final/funciones1_mi_salida.o -f elf32 prueba_final/funciones1_mi_salida.asm
gcc -o prueba_final/funciones1 -m32 prueba_final/funciones1_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/funciones2.alf prueba_final/funciones2_mi_salida.asm

nasm -g -o prueba_final/funciones2_mi_salida.o -f elf32 prueba_final/funciones2_mi_salida.asm
gcc -o prueba_final/funciones2 -m32 prueba_final/funciones2_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/funciones3.alf prueba_final/funciones3_mi_salida.asm

nasm -g -o prueba_final/funciones3_mi_salida.o -f elf32 prueba_final/funciones3_mi_salida.asm
gcc -o prueba_final/funciones3 -m32 prueba_final/funciones3_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/funciones4.alf prueba_final/funciones4_mi_salida.asm

nasm -g -o prueba_final/funciones4_mi_salida.o -f elf32 prueba_final/funciones4_mi_salida.asm
gcc -o prueba_final/funciones4 -m32 prueba_final/funciones4_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/if1.alf prueba_final/if1_mi_salida.asm

nasm -g -o prueba_final/if1_mi_salida.o -f elf32 prueba_final/if1_mi_salida.asm
gcc -o prueba_final/if1 -m32 prueba_final/if1_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/if2.alf prueba_final/if2_mi_salida.asm

nasm -g -o prueba_final/if2_mi_salida.o -f elf32 prueba_final/if2_mi_salida.asm
gcc -o prueba_final/if2 -m32 prueba_final/if2_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/if3.alf prueba_final/if3_mi_salida.asm

nasm -g -o prueba_final/if3_mi_salida.o -f elf32 prueba_final/if3_mi_salida.asm
gcc -o prueba_final/if3 -m32 prueba_final/if3_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/logicas1.alf prueba_final/logicas1_mi_salida.asm

nasm -g -o prueba_final/logicas1_mi_salida.o -f elf32 prueba_final/logicas1_mi_salida.asm
gcc -o prueba_final/logicas1 -m32 prueba_final/logicas1_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/logicas2.alf prueba_final/logicas2_mi_salida.asm

nasm -g -o prueba_final/logicas2_mi_salida.o -f elf32 prueba_final/logicas2_mi_salida.asm
gcc -o prueba_final/logicas2 -m32 prueba_final/logicas2_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/while.alf prueba_final/while_mi_salida.asm

nasm -g -o prueba_final/while_mi_salida.o -f elf32 prueba_final/while_mi_salida.asm
gcc -o prueba_final/while -m32 prueba_final/while_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/vectores1.alf prueba_final/vectores1_mi_salida.asm

nasm -g -o prueba_final/vectores1_mi_salida.o -f elf32 prueba_final/vectores1_mi_salida.asm
gcc -o prueba_final/vectores1 -m32 prueba_final/vectores1_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/vectores2.alf prueba_final/vectores2_mi_salida.asm

nasm -g -o prueba_final/vectores2_mi_salida.o -f elf32 prueba_final/vectores2_mi_salida.asm
gcc -o prueba_final/vectores2 -m32 prueba_final/vectores2_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/vectores3.alf prueba_final/vectores3_mi_salida.asm

nasm -g -o prueba_final/vectores3_mi_salida.o -f elf32 prueba_final/vectores3_mi_salida.asm
gcc -o prueba_final/vectores3 -m32 prueba_final/vectores3_mi_salida.o prueba_final/alfalib.o

./pruebaCompilador prueba_final/vectores4.alf prueba_final/vectores4_mi_salida.asm

nasm -g -o prueba_final/vectores4_mi_salida.o -f elf32 prueba_final/vectores4_mi_salida.asm
gcc -o prueba_final/vectores4 -m32 prueba_final/vectores4_mi_salida.o prueba_final/alfalib.o

# make clean
