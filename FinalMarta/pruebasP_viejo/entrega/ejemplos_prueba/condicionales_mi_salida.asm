;D: main
;D: {
;escribir_subseccion_data
segment .data
mensaje_1 db "Division por cero", 10
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
;D: ,
;D: z
;declarar_variable
	_z resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <TOK_IDENTIFICADOR>
;R19:	<identificadores> ::= <TOK_IDENTIFICADOR> , <identificadores>
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
;D: scanf
;D: z

;	LECTURA
		push dword _z
		call scan_int
		add esp, 4
;R54:	<lectura> ::= scanf <TOK_IDENTIFICADOR>
;R35:	<sentencia_simple> ::= <lectura>
;D: ;
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: if
;D: (
;D: (
;D: x
;D: ==

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R93: <comparacion> ::= <exp> == <exp>

;	IGUAL
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		je iguales_0
		push dword 0
		jmp final_igual_0
iguales_0:
		push dword 1
final_igual_0:
;R83:	<exp> ::= ( <comparacion> )
;D: &&
;D: (
;D: y
;D: ==

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R93: <comparacion> ::= <exp> == <exp>

;	IGUAL
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		je iguales_1
		push dword 0
		jmp final_igual_1
iguales_1:
		push dword 1
final_igual_1:
;R83:	<exp> ::= ( <comparacion> )
;R77:	<exp> ::= <exp> && <exp>

;	AND
		pop dword ebx
		pop dword eax
		and eax, ebx
		push dword eax
;D: &&
;D: (
;D: z
;D: ==

;	ESCRIBE OPERANDO
		push dword _z
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R93: <comparacion> ::= <exp> == <exp>

;	IGUAL
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		je iguales_2
		push dword 0
		jmp final_igual_2
iguales_2:
		push dword 1
final_igual_2:
;R83:	<exp> ::= ( <comparacion> )
;R77:	<exp> ::= <exp> && <exp>

;	AND
		pop dword ebx
		pop dword eax
		and eax, ebx
		push dword eax
;D: )
;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_3
;R: <if_exp> ::=	if ( <exp> ) { 
;D: printf
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
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
fin_then_3:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: else
;D: {
;D: if
;D: (
;D: (
;D: x
;D: >

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R98: <comparacion> ::= <exp> > <exp>

;	MAYOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jg mayor_4
		push dword 0
		jmp final_mayor_4
mayor_4:
		push dword 1
final_mayor_4:
;R83:	<exp> ::= ( <comparacion> )
;D: &&
;D: (
;D: y
;D: >

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R98: <comparacion> ::= <exp> > <exp>

;	MAYOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jg mayor_5
		push dword 0
		jmp final_mayor_5
mayor_5:
		push dword 1
final_mayor_5:
;R83:	<exp> ::= ( <comparacion> )
;R77:	<exp> ::= <exp> && <exp>

;	AND
		pop dword ebx
		pop dword eax
		and eax, ebx
		push dword eax
;D: )
;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_6
;R: <if_exp> ::=	if ( <exp> ) { 
;D: if
;D: (
;D: (
;D: z
;D: >

;	ESCRIBE OPERANDO
		push dword _z
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R98: <comparacion> ::= <exp> > <exp>

;	MAYOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jg mayor_7
		push dword 0
		jmp final_mayor_7
mayor_7:
		push dword 1
final_mayor_7:
;R83:	<exp> ::= ( <comparacion> )
;D: )
;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_8
;R: <if_exp> ::=	if ( <exp> ) { 
;D: printf
;D: 1
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 1
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
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
fin_then_8:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: else
;D: {
;D: printf
;D: 5
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 5
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
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

;	IF THEN ELSE FIN
fin_ifthen_8:
;R51:  <condicional> ::= <if_exp_sentencias> } else { <sentencias> }
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
fin_then_6:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: if

;	IF THEN FIN
fin_then_6:
;R50: <condicional> ::= <if_exp_sentencias> { 
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: (
;D: (
;D: x
;D: <

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R97: <comparacion> ::= <exp> < <exp>

;	MENOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jl menor_9
		push dword 0
		jmp final_menor_9
menor_9:
		push dword 1
final_menor_9:
;R83:	<exp> ::= ( <comparacion> )
;D: &&
;D: (
;D: y
;D: >

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R98: <comparacion> ::= <exp> > <exp>

;	MAYOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jg mayor_10
		push dword 0
		jmp final_mayor_10
mayor_10:
		push dword 1
final_mayor_10:
;R83:	<exp> ::= ( <comparacion> )
;R77:	<exp> ::= <exp> && <exp>

;	AND
		pop dword ebx
		pop dword eax
		and eax, ebx
		push dword eax
;D: )
;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_11
;R: <if_exp> ::=	if ( <exp> ) { 
;D: if
;D: (
;D: (
;D: z
;D: >

;	ESCRIBE OPERANDO
		push dword _z
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R98: <comparacion> ::= <exp> > <exp>

;	MAYOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jg mayor_12
		push dword 0
		jmp final_mayor_12
mayor_12:
		push dword 1
final_mayor_12:
;R83:	<exp> ::= ( <comparacion> )
;D: )
;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_13
;R: <if_exp> ::=	if ( <exp> ) { 
;D: printf
;D: 2
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 2
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
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
fin_then_13:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: else
;D: {
;D: printf
;D: 6
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 6
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
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

;	IF THEN ELSE FIN
fin_ifthen_13:
;R51:  <condicional> ::= <if_exp_sentencias> } else { <sentencias> }
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
fin_then_11:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: if

;	IF THEN FIN
fin_then_11:
;R50: <condicional> ::= <if_exp_sentencias> { 
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: (
;D: (
;D: x
;D: <

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R97: <comparacion> ::= <exp> < <exp>

;	MENOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jl menor_14
		push dword 0
		jmp final_menor_14
menor_14:
		push dword 1
final_menor_14:
;R83:	<exp> ::= ( <comparacion> )
;D: &&
;D: (
;D: y
;D: <

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R97: <comparacion> ::= <exp> < <exp>

;	MENOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jl menor_15
		push dword 0
		jmp final_menor_15
menor_15:
		push dword 1
final_menor_15:
;R83:	<exp> ::= ( <comparacion> )
;R77:	<exp> ::= <exp> && <exp>

;	AND
		pop dword ebx
		pop dword eax
		and eax, ebx
		push dword eax
;D: )
;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_16
;R: <if_exp> ::=	if ( <exp> ) { 
;D: if
;D: (
;D: (
;D: z
;D: >

;	ESCRIBE OPERANDO
		push dword _z
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R98: <comparacion> ::= <exp> > <exp>

;	MAYOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jg mayor_17
		push dword 0
		jmp final_mayor_17
mayor_17:
		push dword 1
final_mayor_17:
;R83:	<exp> ::= ( <comparacion> )
;D: )
;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_18
;R: <if_exp> ::=	if ( <exp> ) { 
;D: printf
;D: 3
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 3
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
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
fin_then_18:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: else
;D: {
;D: printf
;D: 7
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 7
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
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

;	IF THEN ELSE FIN
fin_ifthen_18:
;R51:  <condicional> ::= <if_exp_sentencias> } else { <sentencias> }
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
fin_then_16:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: if

;	IF THEN FIN
fin_then_16:
;R50: <condicional> ::= <if_exp_sentencias> { 
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: (
;D: (
;D: x
;D: >

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R98: <comparacion> ::= <exp> > <exp>

;	MAYOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jg mayor_19
		push dword 0
		jmp final_mayor_19
mayor_19:
		push dword 1
final_mayor_19:
;R83:	<exp> ::= ( <comparacion> )
;D: &&
;D: (
;D: y
;D: <

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R97: <comparacion> ::= <exp> < <exp>

;	MENOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jl menor_20
		push dword 0
		jmp final_menor_20
menor_20:
		push dword 1
final_menor_20:
;R83:	<exp> ::= ( <comparacion> )
;R77:	<exp> ::= <exp> && <exp>

;	AND
		pop dword ebx
		pop dword eax
		and eax, ebx
		push dword eax
;D: )
;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_21
;R: <if_exp> ::=	if ( <exp> ) { 
;D: if
;D: (
;D: (
;D: z
;D: >

;	ESCRIBE OPERANDO
		push dword _z
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 0
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R98: <comparacion> ::= <exp> > <exp>

;	MAYOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jg mayor_22
		push dword 0
		jmp final_mayor_22
mayor_22:
		push dword 1
final_mayor_22:
;R83:	<exp> ::= ( <comparacion> )
;D: )
;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_23
;R: <if_exp> ::=	if ( <exp> ) { 
;D: printf
;D: 4
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 4
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
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
fin_then_23:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: else
;D: {
;D: printf
;D: 8
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 8
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
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

;	IF THEN ELSE FIN
fin_ifthen_23:
;R51:  <condicional> ::= <if_exp_sentencias> } else { <sentencias> }
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
fin_then_21:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: }

;	IF THEN FIN
fin_then_21:
;R50: <condicional> ::= <if_exp_sentencias> { 
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;R30:	<sentencias> ::= <sentencia>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>

;	IF THEN ELSE FIN
fin_ifthen_3:
;R51:  <condicional> ::= <if_exp_sentencias> } else { <sentencias> }
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: }
;R30:	<sentencias> ::= <sentencia>
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
