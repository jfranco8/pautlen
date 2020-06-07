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
;D: boolean
;R11:	<tipo> ::= boolean
;R9:	<clase_escalar> ::= <tipo>
;R5:	<clase> ::= <clase_escalar>
;D: a
;declarar_variable
	_a resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <TOK_IDENTIFICADOR>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: x
;R2:	<declaraciones> ::= <declaracion>
;R3:	<declaraciones> ::= <declaracion> <declaraciones>

segment .text
global main
extern malloc, free
extern print_boolean, print_int, print_blank, print_string, print_endofline, scan_boolean, scan_int
;R21:	<funciones> ::= 

;	INICIO DEL PROGRAMA
main:
		mov dword [__esp], esp
;D: =
;D: 13
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 13
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: ;

;	ASIGNACION A x DESDE LA PILA
		pop dword eax
		mov dword [_x], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: y
;D: =
;D: 54
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 54
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: ;

;	ASIGNACION A y DESDE LA PILA
		pop dword eax
		mov dword [_y], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: a
;D: =
;D: (
;D: x
;D: <

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: y
;D: )

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R97: <comparacion> ::= <exp> < <exp>

;	MENOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		cmp eax, ebx
		jl menor_0
		push dword 0
		jmp final_menor_0
menor_0:
		push dword 1
final_menor_0:
;R83:	<exp> ::= ( <comparacion> )
;D: ;

;	ASIGNACION A a DESDE LA PILA
		pop dword eax
		mov dword [_a], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: a
;D: ;

;	ESCRIBE OPERANDO
		push dword _a
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		pop dword eax
		push dword [eax]
		call print_boolean
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: a
;D: =
;D: (
;D: x
;D: <=

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: y
;D: )

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R95: <comparacion> ::= <exp> <= <exp>

;	MENOR IGUAL
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		cmp eax, ebx
		jle menor_igual_1
		push dword 0
		jmp final_menor_igual_1
menor_igual_1:
		push dword 1
final_menor_igual_1:
;R83:	<exp> ::= ( <comparacion> )
;D: ;

;	ASIGNACION A a DESDE LA PILA
		pop dword eax
		mov dword [_a], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: a
;D: ;

;	ESCRIBE OPERANDO
		push dword _a
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		pop dword eax
		push dword [eax]
		call print_boolean
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: a
;D: =
;D: (
;D: x
;D: !=

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: y
;D: )

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R94: <comparacion> ::= <exp> != <exp>

;	DISTINTO
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		cmp eax, ebx
		jne no_iguales_2
		push dword 0
		jmp final_distinto_2
no_iguales_2:
		push dword 1
final_distinto_2:
;R83:	<exp> ::= ( <comparacion> )
;D: ;

;	ASIGNACION A a DESDE LA PILA
		pop dword eax
		mov dword [_a], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: a
;D: ;

;	ESCRIBE OPERANDO
		push dword _a
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		pop dword eax
		push dword [eax]
		call print_boolean
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: a
;D: =
;D: (
;D: x
;D: >

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: y
;D: )

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R98: <comparacion> ::= <exp> > <exp>

;	MAYOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		cmp eax, ebx
		jg mayor_3
		push dword 0
		jmp final_mayor_3
mayor_3:
		push dword 1
final_mayor_3:
;R83:	<exp> ::= ( <comparacion> )
;D: ;

;	ASIGNACION A a DESDE LA PILA
		pop dword eax
		mov dword [_a], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: a
;D: ;

;	ESCRIBE OPERANDO
		push dword _a
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		pop dword eax
		push dword [eax]
		call print_boolean
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: a
;D: =
;D: (
;D: x
;D: >=

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: y
;D: )

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R96: <comparacion> ::= <exp> >= <exp>

;	MAYOR IGUAL
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		cmp eax, ebx
		jge mayor_igual_4
		push dword 0
		jmp final_mayor_igual_4
mayor_igual_4:
		push dword 1
final_mayor_igual_4:
;R83:	<exp> ::= ( <comparacion> )
;D: ;

;	ASIGNACION A a DESDE LA PILA
		pop dword eax
		mov dword [_a], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: a
;D: ;

;	ESCRIBE OPERANDO
		push dword _a
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		pop dword eax
		push dword [eax]
		call print_boolean
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: a
;D: =
;D: (
;D: x
;D: ==

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: y
;D: )

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R93: <comparacion> ::= <exp> == <exp>

;	IGUAL
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		cmp eax, ebx
		je iguales_5
		push dword 0
		jmp final_igual_5
iguales_5:
		push dword 1
final_igual_5:
;R83:	<exp> ::= ( <comparacion> )
;D: ;

;	ASIGNACION A a DESDE LA PILA
		pop dword eax
		mov dword [_a], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: a
;D: ;

;	ESCRIBE OPERANDO
		push dword _a
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		pop dword eax
		push dword [eax]
		call print_boolean
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
;R31:	<sentencias> ::= <sentencia> <sentencias>
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
