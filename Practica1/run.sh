make
./ejemplo1 ej1.asm
nasm -g -o $ej1.o -f elf ej1.asm
gcc -o $ej1 $ej1.o alfalib.o
./ej1
