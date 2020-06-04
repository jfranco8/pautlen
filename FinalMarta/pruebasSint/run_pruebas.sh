
make clean
make

./pruebaSintactico ficherosES/entrada_sin_1.txt ficherosES/misalida_sin_1.txt
./pruebaSintactico ficherosES/entrada_sin_2.txt ficherosES/misalida_sin_2.txt
./pruebaSintactico ficherosES/entrada_sin_3.txt ficherosES/misalida_sin_3.txt

# Para comprobar si los ficheros de salida contienen diferencias 

# diff -bB ficherosES/salida_sin_1.txt ficherosES/misalida_sin_1.txt
# diff -bB ficherosES/salida_sin_2.txt ficherosES/misalida_sin_2.txt
# diff -bB ficherosES/salida_sin_3.txt ficherosES/misalida_sin_3.txt

make clean
