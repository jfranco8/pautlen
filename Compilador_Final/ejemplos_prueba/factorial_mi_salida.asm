;D: main
;D: {
segment .data
mensaje_1 db "Division por cero", 10
mensaje_2 db "Indice de vector fuera de rango", 10

segment .bss
	__esp resd 1

segment .text
global main
extern malloc, free
extern print_boolean, print_int, print_blank, print_string, print_endofline, scan_boolean, scan_int
;D: int
;R10:	<tipo> ::= int
;R9:	<clase_escalar> ::= <tipo>
;R5:	<clase> ::= <clase_escalar>
;D: x
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ,
;D: y
****Error semantico en lin 2: Identificador  duplicado.
;R108:	<identificador> ::= TOK_IDENTIFICADOR
;D: ;
;R18:	<identificadores> ::= <TOK_IDENTIFICADOR>
;R19:	<identificadores> ::= <TOK_IDENTIFICADOR> , <identificadores>
;R4:	<declaracion> ::= <clase> <identificadores> ;
;D: scanf
;R2:	<declaraciones> ::= <declaracion>

;	INICIO DEL PROGRAMA
main:
		mov dword [__esp], esp
;R21:	<funciones> ::= 
;D: x

;	LECTURA
		push dword _
		call scan_int
		add esp, 4
;R54:	<lectura> ::= scanf <TOK_IDENTIFICADOR>
;R35:	<sentencia_simple> ::= <lectura>
;D: ;
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: y
;D: =
;D: 1
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: ;

;	ASIGNACION A  DESDE LA PILA
		pop dword eax
		mov dword [_], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: while
;D: (

;	WHILE INCIO
inicio_while_0:
;R: <while> ::= while (
;D: (
;D: x
;D: >

;	ESCRIBE OPERANDO
		push dword _
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 1
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: )
;R98: <comparacion> ::= <exp> > <exp>

;	MAYOR
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		cmp eax, ebx
		jg mayor_1
		push dword 0
		jmp final_mayor_1
mayor_1:
		push dword 1
final_mayor_1:
;R83:	<exp> ::= ( <comparacion> )
;D: )
;D: {

;	WHILE PILA
		pop eax
		cmp eax, 0
		je near fin_while_0
;R: <while_exp> ::= <while> <exp> ) {
;D: y
;D: =
;D: x
;D: *

;	ESCRIBE OPERANDO
		push dword _
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: y
;D: ;

;	ESCRIBE OPERANDO
		push dword _
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;R75:	<exp> ::= <exp> * <exp>

;	MULTIPLICACION
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		imul ebx
		push dword eax

;	ASIGNACION A  DESDE LA PILA
		pop dword eax
		mov dword [_], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: x
;D: =
;D: x
;D: -

;	ESCRIBE OPERANDO
		push dword _
;R80:	<exp> ::= <TOK_IDENTIFICADOR>
;D: 1
;R104: <constante_entera> ::= TOK_CONSTANTE_ENTERA

;	ESCRIBE OPERANDO
		push dword 
;R100: <constante> ::= <constante_entera>
;R81:	<exp> ::= <constante>
;D: ;
;R73:	<exp> ::= <exp> - <exp>

;	RESTA
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		sub eax, ebx
		push dword eax

;	ASIGNACION A  DESDE LA PILA
		pop dword eax
		mov dword [_], eax
;R43:	<asignacion> ::= <TOK_IDENTIFICADOR> = <exp>
;R34:	<sentencia_simple> ::= <asignacion>
;R32:	<sentencia> ::= <sentencia_simple> ;
;D: }
;R30:	<sentencias> ::= <sentencia>
;R31:	<sentencias> ::= <sentencia> <sentencias>

;	WHILE FIN
		jmp near inicio_while_0
fin_while_0:
;R52: <bucle> ::= <while_exp> <sentencias> }
;R41:	<bloque> ::= <bucle>
;R33:	<sentencia> ::= <bloque>
;D: printf
;D: y
;D: ;

;	ESCRIBE OPERANDO
		push dword _
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
;R1: <programa> ::= main { <declaraciones> <funciones> <sentencias> }
