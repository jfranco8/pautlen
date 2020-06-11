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
;D: y
;declarar_variable
	_y resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ,
;D: resultado
;declarar_variable
	_resultado resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <identificador>
;R19:	<identificadores> ::= <identificador> , <identificadores>
;R19:	<identificadores> ::= <identificador> , <identificadores>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: 

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
;D: suma
;D: (
;D: int
;R10:	<tipo> ::= int
;D: num1
;R27: <parametro_funcion> ::= <tipo> <idpf>
;D: ;
;D: int
;R10:	<tipo> ::= int
;D: num2
;R27: <parametro_funcion> ::= <tipo> <idpf>
;D: )
;R26:	<resto_parametros_funcion> ::= 
;R25: <resto_parametros_funcion> ::= ; <parametro_funcion> <resto_parametros_funcion>
;R23:	<parametros_funcion> ::= <parametro_funcion> <resto_parametros_funcion>
;D: 

;D: {
;D: 

;D: return
;R29: <declaraciones_funcion> ::= 

;	DECLARACION DE FUNCION
_suma:
		push ebp
		mov ebp, esp
		sub esp, 4*0
;D: num1
;D: +

;	ESCRITURA DE DIRECCION  DE PARAMETRO EN PILA
		lea eax, [ebp+12]
		push dword eax
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: num2
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

;D: function
;D: int
;R10:	<tipo> ::= int
;D: resta
;D: (
;D: int
;R10:	<tipo> ::= int
;D: num1
;R27: <parametro_funcion> ::= <tipo> <idpf>
;D: ;
;D: int
;R10:	<tipo> ::= int
;D: num2
;R27: <parametro_funcion> ::= <tipo> <idpf>
;D: )
;R26:	<resto_parametros_funcion> ::= 
;R25: <resto_parametros_funcion> ::= ; <parametro_funcion> <resto_parametros_funcion>
;R23:	<parametros_funcion> ::= <parametro_funcion> <resto_parametros_funcion>
;D: 

;D: {
;D: 

;D: return
;R29: <declaraciones_funcion> ::= 

;	DECLARACION DE FUNCION
_resta:
		push ebp
		mov ebp, esp
		sub esp, 4*0
;D: num1
;D: -

;	ESCRITURA DE DIRECCION  DE PARAMETRO EN PILA
		lea eax, [ebp+12]
		push dword eax
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: num2
;D: ;

;	ESCRITURA DE DIRECCION  DE PARAMETRO EN PILA
		lea eax, [ebp+8]
		push dword eax
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R73:	<exp> ::= <exp> - <exp>

;	RESTA
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		sub eax, ebx
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

;D: scanf
;R21:	<funciones> ::= 
;R20:	<funciones> ::= <funcion> <funciones>
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

;D: 

;D: resultado
;D: =
;D: suma
;D: (
;D: resta
;D: (
;D: 8
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 8
;D: ,

;	VALOR VARIABLE EN PILA
;D: 4
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 4
;D: )

;	VALOR VARIABLE EN PILA
;R92: <resto_lista_expresiones> ::= 
;R91 <resto_lista_expresiones> ::= , <exp> <resto_lista_expresiones>
;R89 <lista_expresiones> ::= <exp> <resto_lista_expresiones>

;	LLAMANDO A UNA FUNCION
		call _resta
		add esp, 8
		push dword eax
;R88:	<exp> ::= <TOK_IDENTIFICADOR> ( <lista_expresiones> )
;D: ,

;	VALOR VARIABLE EN PILA
;D: y
;D: )

;	ESCRIBE OPERANDO
		push dword _y
;R80:	<exp> ::= <TOK_IDENTIFICADOR>

;	VALOR VARIABLE EN PILA
		pop eax
		mov eax, [eax]
		push eax
;R92: <resto_lista_expresiones> ::= 
;R91 <resto_lista_expresiones> ::= , <exp> <resto_lista_expresiones>
;R89 <lista_expresiones> ::= <exp> <resto_lista_expresiones>
****Error semantico en lin 20: Numero incorrecto de parametros en llamada a funcion.
