;D: 

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
;D: resultado
;declarar_variable
	_resultado resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <identificador>
;R19:	<identificadores> ::= <identificador> , <identificadores>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: 

;D: 

;D: function
;R2:	<declaraciones> ::= <declaracion>

segment .text
global main
extern malloc, free
extern print_boolean, print_int, print_blank, print_string, print_endofline, scan_boolean, scan_int
;D: int
;R10:	<tipo> ::= int
;D: fibonacci
;D: (
;D: int
;R10:	<tipo> ::= int
;D: num1
;R27: <parametro_funcion> ::= <tipo> <idpf>
;D: )
;R26:	<resto_parametros_funcion> ::= 
;R23:	<parametros_funcion> ::= <parametro_funcion> <resto_parametros_funcion>
;D: 

;D: {
;D: 

;D: int
;R10:	<tipo> ::= int
;R9:	<clase_escalar> ::= <tipo>
;R5:	<clase> ::= <clase_escalar>
;D: res1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ,
;D: res2
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <identificador>
;R19:	<identificadores> ::= <identificador> , <identificadores>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: 

;D: 

;D: if
;R2:	<declaraciones> ::= <declaracion>
;R28: <declaraciones_funcion> ::= <declaraciones>

;	DECLARACION DE FUNCION
_fibonacci:
		push ebp
		mov ebp, esp
		sub esp, 4*2
;D: (
;D: (
;D: num1
;D: ==

;	ESCRITURA DE DIRECCION  DE PARAMETRO EN PILA
		lea eax, [ebp+8]
		push dword eax
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
;D: )
;D: 

;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_0
;R: <if_exp> ::=	if ( <exp> ) { 
;D: 

;D: return
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
;D: ;

;	RETORNO A LA FUNCION
		pop eax
		mov esp, ebp
		pop ebp
		ret
;R61:	<retorno_funcion> ::= return <exp>
;R36:	<sentencia_simple> ::= <retorno_funcion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
	jmp near fin_ifthen_0
fin_then_0:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: 

;D: if

;	IF THEN ELSE FIN
fin_ifthen_0:
;R50: <condicional> ::= <if_exp_sentencias> { 
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: (
;D: (
;D: num1
;D: ==

;	ESCRITURA DE DIRECCION  DE PARAMETRO EN PILA
		lea eax, [ebp+8]
		push dword eax
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 1
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 1
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
;D: )
;D: 

;D: {

;	IF THEN ELSE INICIO
		pop eax
		cmp eax, 0
		je near fin_then_1
;R: <if_exp> ::=	if ( <exp> ) { 
;D: 

;D: return
;D: 1
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 1
;D: ;

;	RETORNO A LA FUNCION
		pop eax
		mov esp, ebp
		pop ebp
		ret
;R61:	<retorno_funcion> ::= return <exp>
;R36:	<sentencia_simple> ::= <retorno_funcion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>

;	IF THEN ELSE FIN THEN
	jmp near fin_ifthen_1
fin_then_1:
;R: <if_exp_sentencias> ::=	<if_exp> <sentencias> 
;D: 

;D: res1

;	IF THEN ELSE FIN
fin_ifthen_1:
;R50: <condicional> ::= <if_exp_sentencias> { 
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D: =
;D: fibonacci
;D: (
;D: num1
;D: -

;	ESCRITURA DE DIRECCION  DE PARAMETRO EN PILA
		lea eax, [ebp+8]
		push dword eax
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 1
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 1
;D: )
;R73:	<exp> ::= <exp> - <exp>

;	RESTA
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		sub eax, ebx
		push dword eax

;	VALOR VARIABLE EN PILA
;R92: <resto_lista_expresiones> ::= 
;R89 <lista_expresiones> ::= <exp> <resto_lista_expresiones>

;	LLAMANDO A UNA FUNCION
		call _fibonacci
		add esp, 4
		push dword eax
;R88:	<exp> ::= <TOK_IDENTIFICADOR> ( <lista_expresiones> )
;D: ;

;	ESCRITURA DE DIR DE DIRECCION DE VARIABLE EN LA PILA
		lea eax, [ebp-4]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: res2
;D: =
;D: fibonacci
;D: (
;D: num1
;D: -

;	ESCRITURA DE DIRECCION  DE PARAMETRO EN PILA
		lea eax, [ebp+8]
		push dword eax
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 2
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 2
;D: )
;R73:	<exp> ::= <exp> - <exp>

;	RESTA
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		sub eax, ebx
		push dword eax

;	VALOR VARIABLE EN PILA
;R92: <resto_lista_expresiones> ::= 
;R89 <lista_expresiones> ::= <exp> <resto_lista_expresiones>

;	LLAMANDO A UNA FUNCION
		call _fibonacci
		add esp, 4
		push dword eax
;R88:	<exp> ::= <TOK_IDENTIFICADOR> ( <lista_expresiones> )
;D: ;

;	ESCRITURA DE DIR DE DIRECCION DE VARIABLE EN LA PILA
		lea eax, [ebp-8]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: return
;D: res1
;D: +

;	ESCRITURA DE DIR DE DIRECCION DE VARIABLE EN LA PILA
		lea eax, [ebp-4]
		push dword eax
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: res2
;D: ;

;	ESCRITURA DE DIR DE DIRECCION DE VARIABLE EN LA PILA
		lea eax, [ebp-8]
		push dword eax
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R72:	<exp> ::= <exp> + <exp>

;	SUMA
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		add eax, ebx
		push dword eax

;	RETORNO A LA FUNCION
		pop eax
		mov esp, ebp
		pop ebp
		ret
;R61:	<retorno_funcion> ::= return <exp>
;R36:	<sentencia_simple> ::= <retorno_funcion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R22: <funcion> ::= function <tipo> <TOK_IDENTIFICADOR> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }
;R22: <funcion> ::= function <tipo> <TOK_IDENTIFICADOR> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }
;D: 

;D: 

;D: 

;D: scanf
;R21:	<funciones> ::= 
;R20:	<funciones> ::= <funcion> <funciones>

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

;D: 

;D: resultado
;D: =
;D: fibonacci
;D: (
;D: x
;D: )

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>

;	VALOR VARIABLE EN PILA
		pop eax
		mov eax, [eax]
		push eax
;R92: <resto_lista_expresiones> ::= 
;R89 <lista_expresiones> ::= <exp> <resto_lista_expresiones>

;	LLAMANDO A UNA FUNCION
		call _fibonacci
		add esp, 4
		push dword eax
;R88:	<exp> ::= <TOK_IDENTIFICADOR> ( <lista_expresiones> )
;D: ;

;	ASIGNACION A resultado DESDE LA PILA
		pop dword eax
		mov dword [_resultado], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: 

;D: printf
;D: resultado
;D: ;

;	ESCRIBE OPERANDO
		push dword _resultado
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		pop dword eax
		push dword [eax]
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R1: <programa> ::= main { <declaraciones> <funciones> <sentencias> }
;D: 

;D: 

;D: 

;D: 

;D: 

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
