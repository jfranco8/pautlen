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
;R18:	<identificadores> ::= <identificador>
;R19:	<identificadores> ::= <identificador> , <identificadores>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: 

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
;R18:	<identificadores> ::= <identificador>
;R19:	<identificadores> ::= <identificador> , <identificadores>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: 

;D: 

;D: 

;D: 

;D: 

;D: 

;D: 

;D: function
;R2:	<declaraciones> ::= <declaracion>
;R3:	<declaraciones> ::= <declaracion> <declaraciones>

segment .text
global main
extern malloc, free
extern print_boolean, print_int, print_blank, print_string, print_endofline, scan_boolean, scan_int
;D: int
;R10:	<tipo> ::= int
;D: suma
;D: (
;D: int
;R10:	<tipo> ::= int
;D: n1
;R27: <parametro_funcion> ::= <tipo> <idpf>
;D: ;
;D: int
;R10:	<tipo> ::= int
;D: n2
;R27: <parametro_funcion> ::= <tipo> <idpf>
;D: )
;R26:	<resto_parametros_funcion> ::= 
;R25: <resto_parametros_funcion> ::= ; <parametro_funcion> <resto_parametros_funcion>
;R23:	<parametros_funcion> ::= <parametro_funcion> <resto_parametros_funcion>
;D: {
;D: 

;D: int
;R10:	<tipo> ::= int
;R9:	<clase_escalar> ::= <tipo>
;R5:	<clase> ::= <clase_escalar>
;D: z
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <identificador>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: 

;D: return
;R2:	<declaraciones> ::= <declaracion>
;R28: <declaraciones_funcion> ::= <declaraciones>

;	DECLARACION DE FUNCION
_suma:
		push ebp
		mov ebp, esp
		sub esp, 4*1
;D: n1
;D: +

;	ESCRITURA DE DIRECCION  DE PARAMETRO EN PILA
		lea eax, [ebp+12]
		push dword eax
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: n2
;D: ;

;	ESCRITURA DE DIRECCION  DE PARAMETRO EN PILA
		lea eax, [ebp+8]
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
;R22: <funcion> ::= function <tipo> <TOK_IDENTIFICADOR> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }
;R22: <funcion> ::= function <tipo> <TOK_IDENTIFICADOR> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }
;D: 

;D: 

;D: 

;D: 

;D: x
;R21:	<funciones> ::= 
;R20:	<funciones> ::= <funcion> <funciones>

;	INICIO DEL PROGRAMA
main:
		mov dword [__esp], esp
;D: =
;D: a
;D: ;

;	ESCRIBE OPERANDO
		push dword _a
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
RECUERDO. BOOLEAN=1. INT=0 
tipo que tenemos (simbolo x): 0. tipo de 3 (simbolo a): 1 
**** 2 Error semantico en lin 20: Asignacion incompatible.
