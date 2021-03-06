;D: main
;D: {
;escribir_subseccion_data
segment .data
mensaje_1 db "Division por cero", 0
mensaje_2 db "Indice de vector fuera de rango", 10
;escribir_cabecera_bss

segment .bss
;declarar_variable
	__esp resd 1
;D: int
;R10:	<tipo> ::= int
;R9:	<clase_escalar> ::= <tipo>
;R5:	<clase> ::= <clase_escalar>
;D: x
;declarar_variable
	_x resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ,
;D: y
;declarar_variable
	_y resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <TOK_IDENTIFICADOR>
;R19:	<identificadores> ::= <TOK_IDENTIFICADOR> , <identificadores>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: scanf
;R2:	<declaraciones> ::= <declaracion>

segment .text
global main
extern malloc, free
extern print_boolean, print_int, print_blank, print_string, print_endofline, scan_boolean, scan_int
;R21:	<funciones> ::= 

;	INICIO DEL PROGRAMA
main:
		mov dword [__esp], esp
;D: x

;	LECTURA
		push dword _x
		call scan_int
		add esp, 4
;R54:	<lectura> ::= scanf <TOK_IDENTIFICADOR>
;R35:	<sentencia_simple> ::= <lectura>
;D: ;
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: scanf
;D: y

;	LECTURA
		push dword _y
		call scan_int
		add esp, 4
;R54:	<lectura> ::= scanf <TOK_IDENTIFICADOR>
;R35:	<sentencia_simple> ::= <lectura>
;D: ;
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: x
;D: +

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: y
;D: ;

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R72:	<exp> ::= <exp> + <exp>

;	SUMA
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		add eax, ebx
		push dword eax
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: x
;D: -

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: y
;D: ;

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R73:	<exp> ::= <exp> - <exp>

;	RESTA
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		sub eax, ebx
		push dword eax
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: x
;D: *

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: y
;D: ;

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R75:	<exp> ::= <exp> * <exp>

;	MULTIPLICACION
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		imul ebx
		push dword eax
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: x
;D: /

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: y
;D: ;

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R74:	<exp> ::= <exp> / <exp>

;	DIVISION
		pop dword ebx
		pop dword eax
		mov eax, dword [eax]
		mov ebx, dword [ebx]
		cmp ebx, 0
		je error_1
		cdq
		idiv ebx
		push dword eax
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: -
;D: x
;D: ;

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R76:	<exp> ::= -<exp>

;	CAMBIAR SIGNO
		pop dword eax
		mov dword eax, [eax]
		neg eax
		push dword eax
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: }
;R30:	<sentencias> ::= <sentencia>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R1: <programa> ::= main { <declaraciones> <funciones> <sentencias> }

;	FIN DE PROGRAMA
		jmp near fin
error_1:
		push dword mensaje_1
		call print_string
		add esp, 4
		jmp near fin
fin_indice_fuera_rango:
		push dword mensaje_2
		call print_string
		add esp, 4
		jmp near fin
fin:
		mov dword esp, [__esp]
		ret
