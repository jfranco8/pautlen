segment .data
mensaje_1 db "Division por cero", 0

segment .bss
	__esp resd 1
	_b1 resd 1

segment .text
global main
extern print_boolean, print_int, print_blank, print_string, print_endofline, scan_boolean, scan_int
;	INICIO DEL PROGRAMA
main:
		mov dword [__esp], esp

;	LECTURA
		push dword _b1
		call scan_boolean
		add esp, 4

;	ESCRIBE OPERANDO
		push dword _b1

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

;	ESCRITURA
		call print_boolean
		call print_endofline
		add esp, 4

;	ESCRIBE OPERANDO
		push dword _b1

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

;	NEGACION LOGICA
		pop eax
		cmp dword eax, 0
		je negar_falso_2
		push dword 0
		jmp fin_negacion_2
negar_falso_2:
		push dword 1
fin_negacion_2:

;	ESCRITURA
		call print_boolean
		call print_endofline
		add esp, 4

;	FIN DE PROGRAMA
		jmp near fin
error_1:
		push dword mensaje_1
		call print_string
		add esp, 4
		jmp near fin
fin:
		mov dword esp, [__esp]
		ret
