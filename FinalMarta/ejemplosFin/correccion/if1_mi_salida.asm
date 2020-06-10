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
;D: a
;R2:	<declaraciones> ::= <declaracion>

segment .text
global main
extern malloc, free
extern print_boolean, print_int, print_blank, print_string, print_endofline, scan_boolean, scan_int
;R21:	<funciones> ::= 

;	INICIO DEL PROGRAMA
main:
		mov dword [__esp], esp
;D: =
;D: true
;R102: <constante_logica> ::= true
;R99: <constante> ::= <constante_logica>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 1
;D: ;

;	ASIGNACION A a DESDE LA PILA
		pop dword eax
		mov dword [_a], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: if
;D: (
;D: a
;D: )

;	ESCRIBE OPERANDO
		push dword _a
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: {

;	IF THEN ELSE INICIO
		pop eax
		mov eax, [eax]
		cmp eax, 0
		je near fin_if_0
;R: <if_exp> ::=	if ( <exp> ) { 
;D: printf
;D: 1
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 1
;D: ;
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
		jmp near fin_ifnot_0
fin_if_0:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: if

;	IF THEN ELSE FIN
fin_ifnot_0:
;R50: <condicional> ::= <if_exp_sentencias> { 
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: (
;D: a
;D: )

;	ESCRIBE OPERANDO
		push dword _a
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: {

;	IF THEN ELSE INICIO
		pop eax
		mov eax, [eax]
		cmp eax, 0
		je near fin_if_1
;R: <if_exp> ::=	if ( <exp> ) { 
;D: printf
;D: 1
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 1
;D: ;
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
		jmp near fin_ifnot_1
fin_if_1:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: }

;	IF THEN ELSE FIN
fin_ifnot_1:
;R50: <condicional> ::= <if_exp_sentencias> { 
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;R30:	<sentencias> ::= <sentencia>
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
