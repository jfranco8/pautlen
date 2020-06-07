;escribir_subseccion_data
segment .data
	msg_error_indice_vector db "Indice de vector fuera de rango", 0
	msg_error_division db "Error division por 0", 0
;escribir_cabecera_bss
segment .bss
	__esp resd 1
;D:	main
;D:	{
;D:	int
;R10:	<tipo> ::= int
;R9:	<clase_escalar> ::= <tipo>
;R5:	<clase> ::= <clase_escalar>
;D:	x
;declarar_variable
	_x resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D:	,
;D:	y
;declarar_variable
	_y resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D:	,
;D:	i
;declarar_variable
	_i resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D:	,
;D:	resultado
;declarar_variable
	_resultado resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D:	;
;R18:	<identificadores> ::= <identificador>
;R19:	<identificadores> ::= <identificador> , <identificadores>
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
;D:	x
;leer
	push dword _x
	call scan_int
	add esp, 4
;R54:	<lectura> ::= scanf <identificador>
;R35:	<sentencia_simple> ::= <lectura>
;D:	;
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	scanf
;D:	y
;leer
	push dword _y
	call scan_int
	add esp, 4
;R54:	<lectura> ::= scanf <identificador>
;R35:	<sentencia_simple> ::= <lectura>
;D:	;
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	resultado
;D:	=
;D:	0
;R104:	<constante_entera> ::= <numero>
;R99:	<constante> ::= <constante_logica>
;escribir_operando
	push dword 0
;R81:	<exp> ::= <constante>
;D:	;
;asignar
	pop dword eax
	mov dword [_resultado], eax
;R43:	<asignacion> ::= <identificador> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	i
;D:	=
;D:	0
;R104:	<constante_entera> ::= <numero>
;R99:	<constante> ::= <constante_logica>
;escribir_operando
	push dword 0
;R81:	<exp> ::= <constante>
;D:	;
;asignar
	pop dword eax
	mov dword [_i], eax
;R43:	<asignacion> ::= <identificador> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	while
;D:	(
; while_inicio 0
inicio_while0:
;D:	(
;D:	i
;D:	<
;escribir_operando
	push dword _i
;R80:	<exp> ::= <identificador>
;D:	y
;D:	)
;escribir_operando
	push dword _y
;R80:	<exp> ::= <identificador>
;menor
	pop dword ebx
	mov dword ebx, [ebx]
	pop dword eax
	mov dword eax, [eax]
	cmp eax, ebx
	jl near si_menor0
	push dword 0
	jmp near fin_menor0
si_menor0:
	push dword 1
fin_menor0:
;R97:	<comparacion> ::= <exp> < <exp>
;R82:	<exp> ::= ( <exp> )
;R83:	<exp> ::= ( <comparacion> )
;D:	)
;D:	{
; while_exp_pila 0
	pop eax
	cmp eax, 0
	je near fin_while0
;D:	resultado
;D:	=
;D:	resultado
;D:	+
;escribir_operando
	push dword _resultado
;R80:	<exp> ::= <identificador>
;D:	x
;D:	;
;escribir_operando
	push dword _x
;R80:	<exp> ::= <identificador>
;sumar
	pop dword ebx
	mov dword ebx, [ebx]
	pop dword eax
	mov dword eax, [eax]
	add eax, ebx
	push dword eax
;R72:	<exp> ::= <exp> + <exp>
;asignar
	pop dword eax
	mov dword [_resultado], eax
;R43:	<asignacion> ::= <identificador> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	i
;D:	=
;D:	i
;D:	+
;escribir_operando
	push dword _i
;R80:	<exp> ::= <identificador>
;D:	1
;R104:	<constante_entera> ::= <numero>
;R99:	<constante> ::= <constante_logica>
;escribir_operando
	push dword 1
;R81:	<exp> ::= <constante>
;D:	;
;sumar
	pop dword ebx
	pop dword eax
	mov dword eax, [eax]
	add eax, ebx
	push dword eax
;R72:	<exp> ::= <exp> + <exp>
;asignar
	pop dword eax
	mov dword [_i], eax
;R43:	<asignacion> ::= <identificador> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	}
;R30:	<sentencias> ::= <sentencia>
;R31:	<sentencias> ::= <sentencia> <sentencias>
; while_fin 0
	jmp near inicio_while0
fin_while0:
;R52:	<bucle> ::= while ( <exp> ) { <sentencias> }
;R41:	<bloque> ::= <bucle>
;R33:	<sentencia> ::= <bloque>
;D:	printf
;D:	resultado
;D:	;
;escribir_operando
	push dword _resultado
;R80:	<exp> ::= <identificador>
;escribir
	pop eax
	mov eax, [eax]
	push dword eax
	call print_int
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
