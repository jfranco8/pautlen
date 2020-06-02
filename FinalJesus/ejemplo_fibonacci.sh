
make clean
make

valgrind --leak-check=full ./pruebaCompilador ejemplos_prueba/fibonacci.alfa ejemplos_prueba/fibonacci_mi_salida.asm

make clean
