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
;D: array
;D: boolean
;R11:	<tipo> ::= boolean
;D: [
;D: 3
;D: ]
;R15:	<clase_vector> ::= array <tipo> [constante_entera]
;R7:	<clase> ::= <clase_vector>
;D: vector1
;declarar_variable
	_vector1 resd 3
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
;D: vector2
;declarar_variable
	_vector2 resd 3
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
;D: vector3
;declarar_variable
	_vector3 resd 3
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <TOK_IDENTIFICADOR>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: vector1
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
		mov dword edx, _vector1
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
		push dword 0

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector1
		lea eax, [edx+ eax*4]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R44:	<asignacion> ::= <elemento_vector> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: vector1
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
		mov dword edx, _vector1
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
		push dword 1

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector1
		lea eax, [edx+ eax*4]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R44:	<asignacion> ::= <elemento_vector> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: vector1
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
		mov dword edx, _vector1
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
		push dword 2

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector1
		lea eax, [edx+ eax*4]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R44:	<asignacion> ::= <elemento_vector> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: vector2
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
		mov dword edx, _vector2
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
		mov dword edx, _vector2
		lea eax, [edx+ eax*4]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R44:	<asignacion> ::= <elemento_vector> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: vector2
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
		mov dword edx, _vector2
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
		push dword 1

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector2
		lea eax, [edx+ eax*4]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R44:	<asignacion> ::= <elemento_vector> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: vector2
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
		mov dword edx, _vector2
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
		mov dword edx, _vector2
		lea eax, [edx+ eax*4]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R44:	<asignacion> ::= <elemento_vector> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: vector3
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
		mov dword edx, _vector3
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;D: =
;D: vector1
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
		mov dword edx, _vector1
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;R85:	<exp> ::= <elemento_vector>
;D: ||
;D: vector2
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
		mov dword edx, _vector2
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;R85:	<exp> ::= <elemento_vector>
;D: ;
;R78:	<exp> ::= <exp> || <exp>

;	OR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		or eax, ebx
		push dword eax

;	ESCRIBE OPERANDO
		push dword 0

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector3
		lea eax, [edx+ eax*4]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R44:	<asignacion> ::= <elemento_vector> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: vector3
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
		mov dword edx, _vector3
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;D: =
;D: vector1
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
		mov dword edx, _vector1
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;R85:	<exp> ::= <elemento_vector>
;D: ||
;D: vector2
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
		mov dword edx, _vector2
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;R85:	<exp> ::= <elemento_vector>
;D: ;
;R78:	<exp> ::= <exp> || <exp>

;	OR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		or eax, ebx
		push dword eax

;	ESCRIBE OPERANDO
		push dword 1

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector3
		lea eax, [edx+ eax*4]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R44:	<asignacion> ::= <elemento_vector> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: vector3
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
		mov dword edx, _vector3
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;D: =
;D: vector1
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
		mov dword edx, _vector1
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;R85:	<exp> ::= <elemento_vector>
;D: ||
;D: vector2
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
		mov dword edx, _vector2
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;R85:	<exp> ::= <elemento_vector>
;D: ;
;R78:	<exp> ::= <exp> || <exp>

;	OR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		or eax, ebx
		push dword eax

;	ESCRIBE OPERANDO
		push dword 2

;	INDEXACION DE VECTOR
		pop dword eax
		cmp eax, 0
		 jl near fin_indice_fuera_rango
		cmp eax, 2
		jg near fin_indice_fuera_rango
		mov dword edx, _vector3
		lea eax, [edx+ eax*4]
		push dword eax

;	ASIGNACION DE DESTINO EN LA PILA
		pop dword ebx
		pop dword eax
		mov dword [ebx], eax
;R44:	<asignacion> ::= <elemento_vector> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: vector3
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
		mov dword edx, _vector3
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;R85:	<exp> ::= <elemento_vector>
;D: ;
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		pop dword eax
		push dword [eax]
		call print_boolean
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: vector3
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
		mov dword edx, _vector3
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;R85:	<exp> ::= <elemento_vector>
;D: ;
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		pop dword eax
		push dword [eax]
		call print_boolean
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: vector3
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
		mov dword edx, _vector3
		lea eax, [edx+ eax*4]
		push dword eax
;R:	elemento_vector:	TOK_IDENTIFICADOR '[' exp ']'
;R85:	<exp> ::= <elemento_vector>
;D: ;
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
