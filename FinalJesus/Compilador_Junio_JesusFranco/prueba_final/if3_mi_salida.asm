;D: main
;D: 

;D: {
;escribir_subseccion_data
segment .data
mensaje_1 db "Division por cero", 0
mensaje_2 db "Indice de vector fuera de rango", 10
;escribir_cabecera_bss

segment .bss
;declarar_variable
	__esp resd 1
;D: 

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
;R18:	<identificadores> ::= <identificador>
;R19:	<identificadores> ::= <identificador> , <identificadores>
;R19:	<identificadores> ::= <identificador> , <identificadores>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: 

;D: 

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
;D: 

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
;D: 

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
;D: 

;D: 

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
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
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
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
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
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
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
;D: 

;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_0
;R: <if_exp> ::=	if ( <exp> ) { 
;D: 

;D: printf
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
;D: ;
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
	jmp near fin_ifthen_0
fin_then_0:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: 

;D: 

;D: else
;D: 

;D: {
;D: 

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
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
;D: )
;R98: <comparacion> ::= <exp> > <exp>

;	MAYOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jg mayor_3
		push dword 0
		jmp final_mayor_3
mayor_3:
		push dword 1
final_mayor_3:
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
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
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
;R77:	<exp> ::= <exp> && <exp>

;	AND
		pop dword ebx
		pop dword eax
		and eax, ebx
		push dword eax
;D: )
;D: 

;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_1
;R: <if_exp> ::=	if ( <exp> ) { 
;D: 

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
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
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
;D: )
;D: 

;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_2
;R: <if_exp> ::=	if ( <exp> ) { 
;D: 

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
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
	jmp near fin_ifthen_2
fin_then_2:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: 

;D: else
;D: 

;D: {
;D: 

;D: printf
;D: 5
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 5
;D: ;
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN
fin_ifthen_2:
;R51:  <condicional> ::= <if_exp_sentencias> } else { <sentencias> }
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
	jmp near fin_ifthen_1
fin_then_1:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: 

;D: if

;	IF THEN ELSE FIN
fin_ifthen_1:
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
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
;D: )
;R97: <comparacion> ::= <exp> < <exp>

;	MENOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jl menor_6
		push dword 0
		jmp final_menor_6
menor_6:
		push dword 1
final_menor_6:
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
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
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
;R77:	<exp> ::= <exp> && <exp>

;	AND
		pop dword ebx
		pop dword eax
		and eax, ebx
		push dword eax
;D: )
;D: 

;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_3
;R: <if_exp> ::=	if ( <exp> ) { 
;D: 

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
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
;D: )
;R98: <comparacion> ::= <exp> > <exp>

;	MAYOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jg mayor_8
		push dword 0
		jmp final_mayor_8
mayor_8:
		push dword 1
final_mayor_8:
;R83:	<exp> ::= ( <comparacion> )
;D: )
;D: 

;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_4
;R: <if_exp> ::=	if ( <exp> ) { 
;D: 

;D: printf
;D: 2
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 2
;D: ;
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
	jmp near fin_ifthen_4
fin_then_4:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: 

;D: else
;D: 

;D: {
;D: 

;D: printf
;D: 6
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 6
;D: ;
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN
fin_ifthen_4:
;R51:  <condicional> ::= <if_exp_sentencias> } else { <sentencias> }
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
	jmp near fin_ifthen_3
fin_then_3:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: 

;D: if

;	IF THEN ELSE FIN
fin_ifthen_3:
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
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
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
;D: <

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
;D: )
;R97: <comparacion> ::= <exp> < <exp>

;	MENOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jl menor_10
		push dword 0
		jmp final_menor_10
menor_10:
		push dword 1
final_menor_10:
;R83:	<exp> ::= ( <comparacion> )
;R77:	<exp> ::= <exp> && <exp>

;	AND
		pop dword ebx
		pop dword eax
		and eax, ebx
		push dword eax
;D: )
;D: 

;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_5
;R: <if_exp> ::=	if ( <exp> ) { 
;D: 

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
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
;D: )
;R98: <comparacion> ::= <exp> > <exp>

;	MAYOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jg mayor_11
		push dword 0
		jmp final_mayor_11
mayor_11:
		push dword 1
final_mayor_11:
;R83:	<exp> ::= ( <comparacion> )
;D: )
;D: 

;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_6
;R: <if_exp> ::=	if ( <exp> ) { 
;D: 

;D: printf
;D: 3
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 3
;D: ;
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
	jmp near fin_ifthen_6
fin_then_6:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: 

;D: else
;D: 

;D: {
;D: 

;D: printf
;D: 7
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 7
;D: ;
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN
fin_ifthen_6:
;R51:  <condicional> ::= <if_exp_sentencias> } else { <sentencias> }
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
	jmp near fin_ifthen_5
fin_then_5:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: 

;D: if

;	IF THEN ELSE FIN
fin_ifthen_5:
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
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
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
;D: &&
;D: (
;D: y
;D: <

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
;D: )
;R97: <comparacion> ::= <exp> < <exp>

;	MENOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jl menor_13
		push dword 0
		jmp final_menor_13
menor_13:
		push dword 1
final_menor_13:
;R83:	<exp> ::= ( <comparacion> )
;R77:	<exp> ::= <exp> && <exp>

;	AND
		pop dword ebx
		pop dword eax
		and eax, ebx
		push dword eax
;D: )
;D: 

;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_7
;R: <if_exp> ::=	if ( <exp> ) { 
;D: 

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
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
;D: )
;R98: <comparacion> ::= <exp> > <exp>

;	MAYOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jg mayor_14
		push dword 0
		jmp final_mayor_14
mayor_14:
		push dword 1
final_mayor_14:
;R83:	<exp> ::= ( <comparacion> )
;D: )
;D: 

;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_8
;R: <if_exp> ::=	if ( <exp> ) { 
;D: 

;D: printf
;D: 4
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 4
;D: ;
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
	jmp near fin_ifthen_8
fin_then_8:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: 

;D: else
;D: 

;D: {
;D: 

;D: printf
;D: 8
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 8
;D: ;
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN
fin_ifthen_8:
;R51:  <condicional> ::= <if_exp_sentencias> } else { <sentencias> }
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
	jmp near fin_ifthen_7
fin_then_7:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: 

;D: }

;	IF THEN ELSE FIN
fin_ifthen_7:
;R50: <condicional> ::= <if_exp_sentencias> { 
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;R30:	<sentencias> ::= <sentencia>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>

;	IF THEN ELSE FIN
fin_ifthen_0:
;R51:  <condicional> ::= <if_exp_sentencias> } else { <sentencias> }
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R1: <programa> ::= main { <declaraciones> <funciones> <sentencias> }
;D: 


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
