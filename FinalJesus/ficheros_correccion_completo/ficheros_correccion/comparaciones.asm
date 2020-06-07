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
;D:	;
;R18:	<identificadores> ::= <identificador>
;R19:	<identificadores> ::= <identificador> , <identificadores>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D:	boolean
;R11:	<tipo> ::= boolean
;R9:	<clase_escalar> ::= <tipo>
;R5:	<clase> ::= <clase_escalar>
;D:	a
;declarar_variable
	_a resd 1
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D:	;
;R18:	<identificadores> ::= <identificador>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D:	x
;R2:	<declaraciones> ::= <declaracion>
;R3:	<declaraciones> ::= <declaracion> <declaraciones>
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
;D:	=
;D:	13
;R104:	<constante_entera> ::= <numero>
;R99:	<constante> ::= <constante_logica>
;escribir_operando
	push dword 13
;R81:	<exp> ::= <constante>
;D:	;
;asignar
	pop dword eax
	mov dword [_x], eax
;R43:	<asignacion> ::= <identificador> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	y
;D:	=
;D:	54
;R104:	<constante_entera> ::= <numero>
;R99:	<constante> ::= <constante_logica>
;escribir_operando
	push dword 54
;R81:	<exp> ::= <constante>
;D:	;
;asignar
	pop dword eax
	mov dword [_y], eax
;R43:	<asignacion> ::= <identificador> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	a
;D:	=
;D:	(
;D:	x
;D:	<
;escribir_operando
	push dword _x
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
;D:	;
;asignar
	pop dword eax
	mov dword [_a], eax
;R43:	<asignacion> ::= <identificador> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	printf
;D:	a
;D:	;
;escribir_operando
	push dword _a
;R80:	<exp> ::= <identificador>
;escribir
	pop eax
	mov eax, [eax]
	push dword eax
	call print_boolean
	add esp, 4
	call print_endofline
;R56:	<escritura> ::= printf <exp>
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	a
;D:	=
;D:	(
;D:	x
;D:	<=
;escribir_operando
	push dword _x
;R80:	<exp> ::= <identificador>
;D:	y
;D:	)
;escribir_operando
	push dword _y
;R80:	<exp> ::= <identificador>
;menor_igual
	pop dword ebx
	mov dword ebx, [ebx]
	pop dword eax
	mov dword eax, [eax]
	cmp eax, ebx
	jle near si_menor_igual1
	push dword 0
	jmp near fin_menor_igual1
si_menor_igual1:
	push dword 1
fin_menor_igual1:
;R95:	<comparacion> ::= <exp> <= <exp>
;R82:	<exp> ::= ( <exp> )
;R83:	<exp> ::= ( <comparacion> )
;D:	;
;asignar
	pop dword eax
	mov dword [_a], eax
;R43:	<asignacion> ::= <identificador> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	printf
;D:	a
;D:	;
;escribir_operando
	push dword _a
;R80:	<exp> ::= <identificador>
;escribir
	pop eax
	mov eax, [eax]
	push dword eax
	call print_boolean
	add esp, 4
	call print_endofline
;R56:	<escritura> ::= printf <exp>
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	a
;D:	=
;D:	(
;D:	x
;D:	!=
;escribir_operando
	push dword _x
;R80:	<exp> ::= <identificador>
;D:	y
;D:	)
;escribir_operando
	push dword _y
;R80:	<exp> ::= <identificador>
;distinto
	pop dword ebx
	mov dword ebx, [ebx]
	pop dword eax
	mov dword eax, [eax]
	cmp eax, ebx
	jne near no_igual2
	push dword 0
	jmp near fin_no_igual2
no_igual2:
	push dword 1
fin_no_igual2:
;R94:	<comparacion> ::= <exp> != <exp>
;R82:	<exp> ::= ( <exp> )
;R83:	<exp> ::= ( <comparacion> )
;D:	;
;asignar
	pop dword eax
	mov dword [_a], eax
;R43:	<asignacion> ::= <identificador> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	printf
;D:	a
;D:	;
;escribir_operando
	push dword _a
;R80:	<exp> ::= <identificador>
;escribir
	pop eax
	mov eax, [eax]
	push dword eax
	call print_boolean
	add esp, 4
	call print_endofline
;R56:	<escritura> ::= printf <exp>
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	a
;D:	=
;D:	(
;D:	x
;D:	>
;escribir_operando
	push dword _x
;R80:	<exp> ::= <identificador>
;D:	y
;D:	)
;escribir_operando
	push dword _y
;R80:	<exp> ::= <identificador>
;mayor
	pop dword ebx
	mov dword ebx, [ebx]
	pop dword eax
	mov dword eax, [eax]
	cmp eax, ebx
	jg near si_mayor3
	push dword 0
	jmp near fin_mayor3
si_mayor3:
	push dword 1
fin_mayor3:
;R98:	<comparacion> ::= <exp> > <exp>
;R82:	<exp> ::= ( <exp> )
;R83:	<exp> ::= ( <comparacion> )
;D:	;
;asignar
	pop dword eax
	mov dword [_a], eax
;R43:	<asignacion> ::= <identificador> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	printf
;D:	a
;D:	;
;escribir_operando
	push dword _a
;R80:	<exp> ::= <identificador>
;escribir
	pop eax
	mov eax, [eax]
	push dword eax
	call print_boolean
	add esp, 4
	call print_endofline
;R56:	<escritura> ::= printf <exp>
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	a
;D:	=
;D:	(
;D:	x
;D:	>=
;escribir_operando
	push dword _x
;R80:	<exp> ::= <identificador>
;D:	y
;D:	)
;escribir_operando
	push dword _y
;R80:	<exp> ::= <identificador>
;mayor_igual
	pop dword ebx
	mov dword ebx, [ebx]
	pop dword eax
	mov dword eax, [eax]
	cmp eax, ebx
	jge near si_mayor_igual4
	push dword 0
	jmp near fin_mayor_igual4
si_mayor_igual4:
	push dword 1
fin_mayor_igual4:
;R96:	<comparacion> ::= <exp> >= <exp>
;R82:	<exp> ::= ( <exp> )
;R83:	<exp> ::= ( <comparacion> )
;D:	;
;asignar
	pop dword eax
	mov dword [_a], eax
;R43:	<asignacion> ::= <identificador> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	printf
;D:	a
;D:	;
;escribir_operando
	push dword _a
;R80:	<exp> ::= <identificador>
;escribir
	pop eax
	mov eax, [eax]
	push dword eax
	call print_boolean
	add esp, 4
	call print_endofline
;R56:	<escritura> ::= printf <exp>
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	a
;D:	=
;D:	(
;D:	x
;D:	==
;escribir_operando
	push dword _x
;R80:	<exp> ::= <identificador>
;D:	y
;D:	)
;escribir_operando
	push dword _y
;R80:	<exp> ::= <identificador>
;igual
	pop dword ebx
	mov dword ebx, [ebx]
	pop dword eax
	mov dword eax, [eax]
	cmp eax, ebx
	je near igual5
	push dword 0
	jmp near fin_igual5
igual5:
	push dword 1
fin_igual5:
;R93:	<comparacion> ::= <exp> == <exp>
;R82:	<exp> ::= ( <exp> )
;R83:	<exp> ::= ( <comparacion> )
;D:	;
;asignar
	pop dword eax
	mov dword [_a], eax
;R43:	<asignacion> ::= <identificador> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	printf
;D:	a
;D:	;
;escribir_operando
	push dword _a
;R80:	<exp> ::= <identificador>
;escribir
	pop eax
	mov eax, [eax]
	push dword eax
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
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
;R31:	<sentencias> ::= <sentencia> <sentencias>
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
