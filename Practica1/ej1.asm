segment .data
mensaje_1 db "Division por cero", 0

segment .bss
	__esp resd 1
	_x resd 1
	_y resd 1
	_z resd 1

segment .text
global main
extern print_boolean, print_int, print_blank, print_string, print_endofline, scan_boolean, scan_int
;	INICIO DEL PROGRAMA
main:
		mov dword [__esp], esp

;	ESCRIBE OPERANDO
		push dword 8

;	ASIGNACION A x DESDE LA PILA
		pop dword eax
		mov dword [_x], eax

;	LECTURA
		push dword _y
		call scan_int
		add esp, 4

;	ESCRIBE OPERANDO
		push dword _x

;	ESCRIBE OPERANDO
		push dword _y

;	SUMA
		pop dword ebx
		pop dword eax
		mov dword eax, [eax]
		mov dword ebx, [ebx]
		add eax, ebx
		push dword eax

;	ASIGNACION A z DESDE LA PILA
		pop dword eax
		mov dword [_z], eax

;	ESCRIBE OPERANDO
		push dword _z

;	ESCRITURA
		pop dword eax
		push dword [eax]
		call print_int
		call print_endofline
		add esp, 4

;	ESCRIBE OPERANDO
		push dword 7

;	ESCRIBE OPERANDO
		push dword _y

;	SUMA
		pop dword ebx
		pop dword eax
		mov dword ebx, [ebx]
		add eax, ebx
		push dword eax

;	ASIGNACION A z DESDE LA PILA
		pop dword eax
		mov dword [_z], eax

;	ESCRIBE OPERANDO
		push dword _z

;	ESCRITURA
		pop dword eax
		push dword [eax]
		call print_int
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
