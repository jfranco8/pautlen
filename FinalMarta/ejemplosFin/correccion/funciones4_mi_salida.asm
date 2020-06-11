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
;D: resultado
;declarar_variable
	_resultado resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <TOK_IDENTIFICADOR>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: array
;D: boolean
;R11:	<tipo> ::= boolean
;D: [
;D: 3
;D: ]
;R15:	<clase_vector> ::= array <tipo> [constante_entera]
;R7:	<clase> ::= <clase_vector>
;D: vector
;declarar_variable
	_vector resd 3
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <TOK_IDENTIFICADOR>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: function
;R2:	<declaraciones> ::= <declaracion>
;R3:	<declaraciones> ::= <declaracion> <declaraciones>

segment .text
global main
extern malloc, free
extern print_boolean, print_int, print_blank, print_string, print_endofline, scan_boolean, scan_int
;D: boolean
;R11:	<tipo> ::= boolean
;D: or
;D: (
;D: boolean
;R11:	<tipo> ::= boolean
;D: b1
;R27: <parametro_funcion> ::= <tipo> <idpf>
;D: ;
;D: boolean
;R11:	<tipo> ::= boolean
;D: b2
;R27: <parametro_funcion> ::= <tipo> <idpf>
;D: ;
;D: boolean
;R11:	<tipo> ::= boolean
;D: b3
;R27: <parametro_funcion> ::= <tipo> <idpf>
;D: )
;R26:	<resto_parametros_funcion> ::= 
;R25: <resto_parametros_funcion> ::= ; <parametro_funcion> <resto_parametros_funcion>
;R25: <resto_parametros_funcion> ::= ; <parametro_funcion> <resto_parametros_funcion>
;R23:	<parametros_funcion> ::= <parametro_funcion> <resto_parametros_funcion>
;D: {
;D: boolean
;R11:	<tipo> ::= boolean
;R9:	<clase_escalar> ::= <tipo>
;R5:	<clase> ::= <clase_escalar>
;D: a
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <TOK_IDENTIFICADOR>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: a
;R2:	<declaraciones> ::= <declaracion>
;R28: <declaraciones_funcion> ::= <declaraciones>

;	DECLARACION DE FUNCION
_or:
		push ebp
		mov ebp, esp
		sub esp, 4*1
;D: =
;D: b1
;D: ||

;	ESCRITURA DE DIRECCION  DE PARAMETRO EN PILA

;		num_parametros: 3

;		pos_parametro: 0
		lea eax, [ebp+16]
		push dword eax
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: b2
;D: ||

;	ESCRITURA DE DIRECCION  DE PARAMETRO EN PILA

;		num_parametros: 3

;		pos_parametro: 1
		lea eax, [ebp+12]
		push dword eax
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R78:	<exp> ::= <exp> || <exp>

;	OR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		or eax, ebx
		push dword eax
;D: b3
;D: ;

;	ESCRITURA DE DIRECCION  DE PARAMETRO EN PILA

;		num_parametros: 3

;		pos_parametro: 2
		lea eax, [ebp+8]
		push dword eax
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R78:	<exp> ::= <exp> || <exp>

;	OR
		pop dword ebx
		pop dword eax
		mov dword ebx, [ebx]
		or eax, ebx
		push dword eax

;	ESCRITURA DE DIR DE DIRECCION DE VARIABLE EN LA PILA
		lea eax, [ebp-4]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: return
;D: a
;D: ;

;	ESCRITURA DE DIR DE DIRECCION DE VARIABLE EN LA PILA
		lea eax, [ebp-4]
		push dword eax
;R80:	<exp> ::= <TOK_IDENTIFICADOR>

;	RETORNO A LA FUNCION
		pop eax
		mov eax, [eax]
		mov esp, ebp
		pop ebp
		ret
;R61:	<retorno_funcion> ::= return <exp>
;R38:	<sentencia_simple> ::= <retorno_funcion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: }
;R30:	<sentencias> ::= <sentencia>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R22: <funcion> ::= function <tipo> <TOK_IDENTIFICADOR> ( <parametros_funcion> ) { <declaraciones_funcion> <sentencias> }
;D: vector
;R21:	<funciones> ::= 
;R20:	<funciones> ::= <funcion> <funciones>

;	INICIO DEL PROGRAMA
main:
		mov dword [__esp], esp
;D: [
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
;D: ]
;R48: <elemento_vector> ::= <TOK_IDENTIFICADOR> [ <exp> ]

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;D: =
;D: false
;R103: <constante_logica> ::= false
;R99: <constante> ::= <constante_logica>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
;D: ;

;	ESCRIBE OPERANDO
		push dword 0

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector
		lea eax, [edx+ eax*4]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R44:	<asignacion> ::= <elemento_vector> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: vector
;D: [
;D: 1
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 1
;D: ]
;R48: <elemento_vector> ::= <TOK_IDENTIFICADOR> [ <exp> ]

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;D: =
;D: true
;R102: <constante_logica> ::= true
;R99: <constante> ::= <constante_logica>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 1
;D: ;

;	ESCRIBE OPERANDO
		push dword 1

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector
		lea eax, [edx+ eax*4]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R44:	<asignacion> ::= <elemento_vector> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: vector
;D: [
;D: 2
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 2
;D: ]
;R48: <elemento_vector> ::= <TOK_IDENTIFICADOR> [ <exp> ]

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;D: =
;D: false
;R103: <constante_logica> ::= false
;R99: <constante> ::= <constante_logica>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
;D: ;

;	ESCRIBE OPERANDO
		push dword 2

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector
		lea eax, [edx+ eax*4]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R44:	<asignacion> ::= <elemento_vector> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: resultado
;D: =
;D: or
;D: (
;D: vector
;D: [
;D: 0
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 0
;D: ]
;R48: <elemento_vector> ::= <TOK_IDENTIFICADOR> [ <exp> ]

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;R85:	<exp> ::= <elemento_vector>
;D: ,

;	VALOR VARIABLE EN PILA
		pop eax
		mov eax, [eax]
		push eax
;D: vector
;D: [
;D: 1
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 1
;D: ]
;R48: <elemento_vector> ::= <TOK_IDENTIFICADOR> [ <exp> ]

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;R85:	<exp> ::= <elemento_vector>
;D: ,

;	VALOR VARIABLE EN PILA
		pop eax
		mov eax, [eax]
		push eax
;D: vector
;D: [
;D: 2
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>

;	ESCRIBE OPERANDO
		push dword 2
;D: ]
;R48: <elemento_vector> ::= <TOK_IDENTIFICADOR> [ <exp> ]

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;R85:	<exp> ::= <elemento_vector>
;D: )

;	VALOR VARIABLE EN PILA
		pop eax
		mov eax, [eax]
		push eax
;R92: <resto_lista_expresiones> ::= 
;R91 <resto_lista_expresiones> ::= , <exp> <resto_lista_expresiones>
;R91 <resto_lista_expresiones> ::= , <exp> <resto_lista_expresiones>
;R89 <lista_expresiones> ::= <exp> <resto_lista_expresiones>
;R88:	<exp> ::= <TOK_IDENTIFICADOR> ( <lista_expresiones> )

;	LLAMANDO A UNA FUNCION
		call _or
		add esp, 12
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
		call print_boolean
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
