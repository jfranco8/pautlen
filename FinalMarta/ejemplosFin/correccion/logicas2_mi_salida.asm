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
;D: ,
;D: b
;declarar_variable
	_b resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ,
;D: c
;declarar_variable
	_c resd 1
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
;D: a

;	LECTURA
		push dword _a
		call scan_int
		add esp, 4
;R54:	<lectura> ::= scanf <TOK_IDENTIFICADOR>
;R35:	<sentencia_simple> ::= <lectura>
;D: ;
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: scanf
;D: b

;	LECTURA
		push dword _b
		call scan_int
		add esp, 4
;R54:	<lectura> ::= scanf <TOK_IDENTIFICADOR>
;R35:	<sentencia_simple> ::= <lectura>
;D: ;
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: scanf
;D: c

;	LECTURA
		push dword _c
		call scan_int
		add esp, 4
;R54:	<lectura> ::= scanf <TOK_IDENTIFICADOR>
;R35:	<sentencia_simple> ::= <lectura>
;D: ;
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: a
;D: ||

;	ESCRIBE OPERANDO
		push dword _a
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: b
;D: &&

;	ESCRIBE OPERANDO
		push dword _b
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R78:	<exp> ::= <exp> || <exp>

;	OR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		or eax, ebx
		push dword eax
;D: c
;D: ;

;	ESCRIBE OPERANDO
		push dword _c
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R77:	<exp> ::= <exp> && <exp>

;	AND
		pop dword ebx
		pop dword eax
		mov dword ebx, [ebx]
		and eax, ebx
		push dword eax
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_boolean
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: (
;D: a
;D: ||

;	ESCRIBE OPERANDO
		push dword _a
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: b
;D: )

;	ESCRIBE OPERANDO
		push dword _b
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R78:	<exp> ::= <exp> || <exp>

;	OR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		or eax, ebx
		push dword eax
;R82:	<exp> ::= ( <exp> )
;D: &&
;D: c
;D: ;

;	ESCRIBE OPERANDO
		push dword _c
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R77:	<exp> ::= <exp> && <exp>

;	AND
		pop dword ebx
		pop dword eax
		mov dword ebx, [ebx]
		and eax, ebx
		push dword eax
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
		call print_boolean
		call print_endofline
		add esp, 4
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: printf
;D: !
;D: a
;D: &&

;	ESCRIBE OPERANDO
		push dword _a
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R79:	<exp> ::= ! <exp>

;	NEGACION LOGICA
		pop eax
		mov dword eax, [eax]
		cmp dword eax, 0
		je negar_falso_0
		push dword 0
		jmp fin_negacion_0
negar_falso_0:
		push dword 1
fin_negacion_0:
;D: b
;D: &&

;	ESCRIBE OPERANDO
		push dword _b
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R77:	<exp> ::= <exp> && <exp>

;	AND
		pop dword ebx
		pop dword eax
		mov dword ebx, [ebx]
		and eax, ebx
		push dword eax
;D: !
;D: c
;D: ;

;	ESCRIBE OPERANDO
		push dword _c
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R79:	<exp> ::= ! <exp>

;	NEGACION LOGICA
		pop eax
		mov dword eax, [eax]
		cmp dword eax, 0
		je negar_falso_1
		push dword 0
		jmp fin_negacion_1
negar_falso_1:
		push dword 1
fin_negacion_1:
;R77:	<exp> ::= <exp> && <exp>

;	AND
		pop dword ebx
		pop dword eax
		and eax, ebx
		push dword eax
;R56:	<escritura> ::= printf <exp>

;	ESCRITURA
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
