;escribir_subseccion_data
segment .data
	msg_error_indice_vector db "Indice de vector fuera de rango", 0
	msg_error_division db "Error division por 0", 0
;escribir_cabecera_bss
segment .bss
	__esp resd 1
;D:	main
;D:	{
;D:	boolean
;R11:	<tipo> ::= boolean
;R9:	<clase_escalar> ::= <tipo>
;R5:	<clase> ::= <clase_escalar>
;D:	a
;declarar_variable
	_a resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D:	,
;D:	b
;declarar_variable
	_b resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D:	,
;D:	c
;declarar_variable
	_c resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D:	;
;R18:	<identificadores> ::= <identificador>
;R19:	<identificadores> ::= <identificador> , <identificadores>
;R19:	<identificadores> ::= <identificador> , <identificadores>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D:	scanf
;R2:	<declaraciones> ::= <declaracion>
;escribir_segmento_codigo
segment .text
	global main
	extern malloc, free
	extern scan_int, print_int, scan_boolean, print_boolean
	extern print_endofline, print_blank, print_string
;R21:	<funciones> ::=
;escribir_inicio_main
; -----------------------
; PROCEDIMIENTO PRINCIPAL
main:
	mov dword [__esp], esp
;D:	a
;leer
	push dword _a
	call scan_boolean
	add esp, 4
;R54:	<lectura> ::= scanf <identificador>
;R35:	<sentencia_simple> ::= <lectura>
;D:	;
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	scanf
;D:	b
;leer
	push dword _b
	call scan_boolean
	add esp, 4
;R54:	<lectura> ::= scanf <identificador>
;R35:	<sentencia_simple> ::= <lectura>
;D:	;
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	scanf
;D:	c
;leer
	push dword _c
	call scan_boolean
	add esp, 4
;R54:	<lectura> ::= scanf <identificador>
;R35:	<sentencia_simple> ::= <lectura>
;D:	;
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	printf
;D:	a
;D:	||
;escribir_operando
	push dword _a
;R80:	<exp> ::= <identificador>
;D:	b
;D:	&&
;escribir_operando
	push dword _b
;R80:	<exp> ::= <identificador>
;D:	c
;D:	;
;escribir_operando
	push dword _c
;R80:	<exp> ::= <identificador>
;y
	pop dword ebx
	mov dword ebx, [ebx]
	pop dword eax
	mov dword eax, [eax]
	and eax, ebx
	push dword eax
;R77:	<exp> ::= <exp> && <exp>
;o
	pop dword ebx
	pop dword eax
	mov dword eax, [eax]
	or eax, ebx
	push dword eax
;R77:	<exp> ::= <exp> && <exp>
;R78:	<exp> ::= <exp> || <exp>
;escribir
	call print_boolean
	add esp, 4
	call print_endofline
;R56:	<escritura> ::= printf <exp>
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	printf
;D:	(
;D:	a
;D:	||
;escribir_operando
	push dword _a
;R80:	<exp> ::= <identificador>
;D:	b
;D:	)
;escribir_operando
	push dword _b
;R80:	<exp> ::= <identificador>
;o
	pop dword ebx
	mov dword ebx, [ebx]
	pop dword eax
	mov dword eax, [eax]
	or eax, ebx
	push dword eax
;R77:	<exp> ::= <exp> && <exp>
;R78:	<exp> ::= <exp> || <exp>
;R82:	<exp> ::= ( <exp> )
;D:	&&
;D:	c
;D:	;
;escribir_operando
	push dword _c
;R80:	<exp> ::= <identificador>
;y
	pop dword ebx
	mov dword ebx, [ebx]
	pop dword eax
	and eax, ebx
	push dword eax
;R77:	<exp> ::= <exp> && <exp>
;escribir
	call print_boolean
	add esp, 4
	call print_endofline
;R56:	<escritura> ::= printf <exp>
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	printf
;D:	!
;D:	a
;D:	&&
;escribir_operando
	push dword _a
;R80:	<exp> ::= <identificador>
;no
	pop dword eax
	mov dword eax, [eax]
	cmp eax, 0
	je _uno0
	push dword 0
	jmp _fin_not0
_uno0: push dword 1
_fin_not0:
;R79:	<exp> ::= ! <exp>
;D:	b
;D:	&&
;escribir_operando
	push dword _b
;R80:	<exp> ::= <identificador>
;y
	pop dword ebx
	mov dword ebx, [ebx]
	pop dword eax
	and eax, ebx
	push dword eax
;R77:	<exp> ::= <exp> && <exp>
;D:	!
;D:	c
;D:	;
;escribir_operando
	push dword _c
;R80:	<exp> ::= <identificador>
;no
	pop dword eax
	mov dword eax, [eax]
	cmp eax, 0
	je _uno1
	push dword 0
	jmp _fin_not1
_uno1: push dword 1
_fin_not1:
;R79:	<exp> ::= ! <exp>
;y
	pop dword ebx
	pop dword eax
	and eax, ebx
	push dword eax
;R77:	<exp> ::= <exp> && <exp>
;escribir
	call print_boolean
	add esp, 4
	call print_endofline
;R56:	<escritura> ::= printf <exp>
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	}
;R30:	<sentencias> ::= <sentencia>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R1:	<programa> ::= main { <declaraciones> <funciones> <sentencias> }
;escribir_fin

	jmp near fin
fin_error_division: 
	push dword msg_error_division
	call print_string
	add esp, 4
	call print_endofline
	jmp near fin
fin_indice_fuera_rango: 
	push dword msg_error_indice_vector
	call print_string
	add esp, 4
	call print_endofline
	jmp near fin
fin: 
	mov esp, [__esp]
	ret
