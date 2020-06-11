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
;D: ,
;D: resultado
;declarar_variable
	_resultado resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <TOK_IDENTIFICADOR>
;R19:	<identificadores> ::= <TOK_IDENTIFICADOR> , <identificadores>
;R19:	<identificadores> ::= <TOK_IDENTIFICADOR> , <identificadores>
;R4:	<declaracion> ::= <clase> <identificadores> ;
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
;D: {
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

;		num_parametros: 2

;		pos_parametro: 0
		lea eax, [ebp+12]
		push dword eax
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: num2
;D: ;

;	ESCRITURA DE DIRECCION  DE PARAMETRO EN PILA

;		num_parametros: 2

;		pos_parametro: 1
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
;R38:	<sentencia_simple> ::= <retorno_funcion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: }
;R30:	<sentencias> ::= <sentencia>
;R22: <funcion> ::= function <tipo> <TOK_IDENTIFICADOR> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }
;D: x
;R21:	<funciones> ::= 
;R20:	<funciones> ::= <funcion> <funciones>

;	INICIO DEL PROGRAMA
main:
		mov dword [__esp], esp
;D: =
;D: 1
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 1
;D: ;

;	ASIGNACION A x DESDE LA PILA
		pop dword eax
		mov dword [_x], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: y
;D: =
;D: 3
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 3
;D: ;

;	ASIGNACION A y DESDE LA PILA
		pop dword eax
		mov dword [_y], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: resultado
;D: =
;D: suma
;D: (
;D: x
;D: ,

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>

;	VALOR VARIABLE EN PILA
		pop eax
		mov eax, [eax]
		push eax
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
;R88:	<exp> ::= <TOK_IDENTIFICADOR> ( <lista_expresiones> )

;	LLAMANDO A UNA FUNCION
		call _suma
		add esp, 8
		push dword eax
;D: ;

;	ASIGNACION A resultado DESDE LA PILA
		pop dword eax
		mov dword [_resultado], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
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
;D: resultado
;D: =
;D: suma
;D: (
;D: x
;D: ,

;	ESCRIBE OPERANDO
		push dword _x
;R80:	<exp> ::= <TOK_IDENTIFICADOR>

;	VALOR VARIABLE EN PILA
		pop eax
		mov eax, [eax]
		push eax
;D: 1
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 1
;D: )

;	VALOR VARIABLE EN PILA
;R92: <resto_lista_expresiones> ::= 
;R91 <resto_lista_expresiones> ::= , <exp> <resto_lista_expresiones>
;R89 <lista_expresiones> ::= <exp> <resto_lista_expresiones>
;R88:	<exp> ::= <TOK_IDENTIFICADOR> ( <lista_expresiones> )

;	LLAMANDO A UNA FUNCION
		call _suma
		add esp, 8
		push dword eax
;D: ;

;	ASIGNACION A resultado DESDE LA PILA
		pop dword eax
		mov dword [_resultado], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
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
;D: resultado
;D: =
;D: suma
;D: (
;D: 10
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 10
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
;R88:	<exp> ::= <TOK_IDENTIFICADOR> ( <lista_expresiones> )

;	LLAMANDO A UNA FUNCION
		call _suma
		add esp, 8
		push dword eax
;D: ;

;	ASIGNACION A resultado DESDE LA PILA
		pop dword eax
		mov dword [_resultado], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
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
;D: resultado
;D: =
;D: suma
;D: (
;D: 3
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 3
;D: ,

;	VALOR VARIABLE EN PILA
;D: 5
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 5
;D: )

;	VALOR VARIABLE EN PILA
;R92: <resto_lista_expresiones> ::= 
;R91 <resto_lista_expresiones> ::= , <exp> <resto_lista_expresiones>
;R89 <lista_expresiones> ::= <exp> <resto_lista_expresiones>
;R88:	<exp> ::= <TOK_IDENTIFICADOR> ( <lista_expresiones> )

;	LLAMANDO A UNA FUNCION
		call _suma
		add esp, 8
		push dword eax
;D: ;

;	ASIGNACION A resultado DESDE LA PILA
		pop dword eax
		mov dword [_resultado], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
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
