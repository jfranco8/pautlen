make
./ej1 opcional_p1.asm
nasm -g -o opcional_p1.o -f elf opcional_p1.asm
gcc -o opcional_p1 opcional_p1.o alfalib.o
./opcional_p1


