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
****Error semantico en lin 9: Asignacion incompatible.