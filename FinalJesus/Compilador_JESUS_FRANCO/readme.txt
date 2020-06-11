Entrega de PAUTLEN. Junio 2020

Jesús Daniel Franco López. Grupo 1402

Entrego los archivos fuente del compilador en su versión final.
Las pruebas que he realizado y el script que he usado para llevarlas a cabo no.
Entrego, además, el alfalib.o en la carpeta alfalib (para evitar su borrado
al hacer make clean)

El archivo que ejecuta el compilador es prueba_compilador.c
La construcción del ejecutable está en el makefile.

Los pasos para conseguir el fichero asm y el ejecutable a partir del .alf que
he seguido han sido:

  ./prueba_compilador fichero.alf mi_salida.asm
  nasm -g -o mi_salida.o -f elf32 mi_salida.asm
  gcc -o nombre_ejecutable -m32 mi_salida.o alfalib/alfalib.o
