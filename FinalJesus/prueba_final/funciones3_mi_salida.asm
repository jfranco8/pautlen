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

;D: boolean
;R11:	<tipo> ::= boolean
;R9:	<clase_escalar> ::= <tipo>
;R5:	<clase> ::= <clase_escalar>
;D: b
;declarar_variable
	_b resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <identificador>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: 

;D: 

;D: function
;R2:	<declaraciones> ::= <declaracion>

segment .text
global main
extern malloc, free
extern print_boolean, print_int, print_blank, print_string, print_endofline, scan_boolean, scan_int
;D: boolean
;R11:	<tipo> ::= boolean
;D: imprimir
;D: (
;D: )
;R24:	<parametros_funcion> ::= 
;D: 

;D: {
;D: 

;D: printf
;R29: <declaraciones_funcion> ::= 

;	DECLARACION DE FUNCION
_imprimir:
		push ebp
		mov ebp, esp
		sub esp, 4*0
;D: 1000
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 1000
;D: ;
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_int
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: return
;D: true
;R102: <constante_logica> ::= true
;R99: <constante> ::= <constante_logica>
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
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R22: <funcion> ::= function <tipo> <TOK_IDENTIFICADOR> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }
;R22: <funcion> ::= function <tipo> <TOK_IDENTIFICADOR> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }
;D: 

;D: 

;D: b
;R21:	<funciones> ::= 
;R20:	<funciones> ::= <funcion> <funciones>

;	INICIO DEL PROGRAMA
main:
		mov dword [__esp], esp
;D: =
;D: imprimir
;D: (
;D: )
;R90:	<lista_expresiones> ::= 

;	LLAMANDO A UNA FUNCION
		call _imprimir
		add esp, 0
		push dword eax
;R88:	<exp> ::= <TOK_IDENTIFICADOR> ( <lista_expresiones> )
;D: ;

;	ASIGNACION A b DESDE LA PILA
		pop dword eax
		mov dword [_b], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: 

;D: 

;D: }
;R30:	<sentencias> ::= <sentencia>
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
