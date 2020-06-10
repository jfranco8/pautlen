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
;D: ,
;D: b
;declarar_variable
	_b resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <TOK_IDENTIFICADOR>
;R19:	<identificadores> ::= <TOK_IDENTIFICADOR> , <identificadores>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: array
;D: int
;R10:	<tipo> ::= int
;D: [
;D: 10
;D: ]
;R15:	<clase_vector> ::= array <tipo> [constante_entera]
;R7:	<clase> ::= <clase_vector>
;D: v
;declarar_variable
	_v resd 10
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <TOK_IDENTIFICADOR>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: v
;R2:	<declaraciones> ::= <declaracion>
;R3:	<declaraciones> ::= <declaracion> <declaraciones>
;R3:	<declaraciones> ::= <declaracion> <declaraciones>

segment .text
global main
extern malloc, free
extern print_boolean, print_int, print_blank, print_string, print_endofline, scan_boolean, scan_int
;R21:	<funciones> ::= 

;	INICIO DEL PROGRAMA
main:
		mov dword [__esp], esp
;D: [
;D: 12
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 12
;D: ]
;R48: <elemento_vector> ::= <TOK_IDENTIFICADOR> [ <exp> ]

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, -1
		jg near fin_indice_fuera_rango
		mov dword edx, _v
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;D: =
;D: 3
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 3
;D: ;

;	ESCRIBE OPERANDO
		push dword 12

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, -1
		jg near fin_indice_fuera_rango
		mov dword edx, _v
		lea eax, [edx+ eax*4]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R44:	<asignacion> ::= <elemento_vector> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: }
;R30:	<sentencias> ::= <sentencia>
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
