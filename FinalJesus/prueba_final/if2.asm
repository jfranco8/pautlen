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
;D:	;
;R18:	<identificadores> ::= <identificador>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D:	a
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
;D:	=
;D:	true
;R102:	<constante_logica> ::= true
;R100:	<constante> ::= <constante_entera>
;escribir_operando
	push dword 1
;R81:	<exp> ::= <constante>
;D:	;
;asignar
	pop dword eax
	mov dword [_a], eax
;R43:	<asignacion> ::= <identificador> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	if
;D:	(
;D:	a
;D:	)
;escribir_operando
	push dword _a
;R80:	<exp> ::= <identificador>
;D:	{
; ifthen_inicio 0
	pop eax
	mov eax, [eax]
	cmp eax, 0
	je near fin_then0
;D:	printf
;D:	1
;R104:	<constante_entera> ::= <numero>
;R99:	<constante> ::= <constante_logica>
;escribir_operando
	push dword 1
;R81:	<exp> ::= <constante>
;D:	;
;escribir
	call print_int
	add esp, 4
	call print_endofline
;R56:	<escritura> ::= printf <exp>
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	}
;R30:	<sentencias> ::= <sentencia>
; ifthenelese_fin_then 0
	jmp near fin_ifelse0
fin_then0:
;D:	else
;D:	{
;D:	printf
;D:	0
;R104:	<constante_entera> ::= <numero>
;R99:	<constante> ::= <constante_logica>
;escribir_operando
	push dword 0
;R81:	<exp> ::= <constante>
;D:	;
;escribir
	call print_int
	add esp, 4
	call print_endofline
;R56:	<escritura> ::= printf <exp>
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	}
;R30:	<sentencias> ::= <sentencia>
; ifthenelse_fin 0
fin_ifelse0:
;R51:	<condicional> ::= if ( <exp> ) { <sentencias> } else { <sentencias> }
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D:	a
;D:	=
;D:	false
;R103:	<constante_logica> ::= false
;R100:	<constante> ::= <constante_entera>
;escribir_operando
	push dword 0
;R81:	<exp> ::= <constante>
;D:	;
;asignar
	pop dword eax
	mov dword [_a], eax
;R43:	<asignacion> ::= <identificador> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	if
;D:	(
;D:	a
;D:	)
;escribir_operando
	push dword _a
;R80:	<exp> ::= <identificador>
;D:	{
; ifthen_inicio 1
	pop eax
	mov eax, [eax]
	cmp eax, 0
	je near fin_then1
;D:	printf
;D:	1
;R104:	<constante_entera> ::= <numero>
;R99:	<constante> ::= <constante_logica>
;escribir_operando
	push dword 1
;R81:	<exp> ::= <constante>
;D:	;
;escribir
	call print_int
	add esp, 4
	call print_endofline
;R56:	<escritura> ::= printf <exp>
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	}
;R30:	<sentencias> ::= <sentencia>
; ifthenelese_fin_then 1
	jmp near fin_ifelse1
fin_then1:
;D:	else
;D:	{
;D:	printf
;D:	0
;R104:	<constante_entera> ::= <numero>
;R99:	<constante> ::= <constante_logica>
;escribir_operando
	push dword 0
;R81:	<exp> ::= <constante>
;D:	;
;escribir
	call print_int
	add esp, 4
	call print_endofline
;R56:	<escritura> ::= printf <exp>
;R36:	<sentencia_simple> ::= <escritura>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D:	}
;R30:	<sentencias> ::= <sentencia>
; ifthenelse_fin 1
fin_ifelse1:
;R51:	<condicional> ::= if ( <exp> ) { <sentencias> } else { <sentencias> }
;R40:	<bloque> ::= <condicional>
;R33:	<sentencia> ::= <bloque>
;D:	}
;R30:	<sentencias> ::= <sentencia>
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
