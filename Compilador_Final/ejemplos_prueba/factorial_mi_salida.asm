segment .data
mensaje_1 db "Division por cero", 10
mensaje_2 db "Indice de vector fuera de rango", 10

segment .bss
	__esp resd 1

segment .text
global main
extern print_boolean, print_int, print_blank, print_string, print_endofline, scan_boolean, scan_int
;	INICIO DEL PROGRAMA
main:
		mov dword [__esp], esp

;	LECTURA
		push dword _
		call scan_int
		add esp, 4

;	ESCRIBE OPERANDO
		push dword 

;	ASIGNACION A  DESDE LA PILA
		pop dword eax
		mov dword [_], eax

;	WHILE INCIO
inicio_while_0:

;	ESCRIBE OPERANDO
		push dword _

;	ESCRIBE OPERANDO
		push dword 

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

;	WHILE PILA
		pop eax
		cmp eax, 0
		je near fin_while_0

;	ESCRIBE OPERANDO
		push dword _

;	ESCRIBE OPERANDO
		push dword _

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

;	ESCRIBE OPERANDO
		push dword _

;	ESCRIBE OPERANDO
		push dword 

;	RESTA
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		sub eax, ebx
		push dword eax

;	ASIGNACION A  DESDE LA PILA
		pop dword eax
		mov dword [_], eax

;	WHILE FIN
		jmp near inicio_while_0
fin_while_0:

;	ESCRIBE OPERANDO
		push dword _

;	ESCRITURA
		pop dword eax
		push dword [eax]
		call print_int
		call print_endofline
		add esp, 4
