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
;D: int
;R10:	<tipo> ::= int
;D: [
;D: 100
;D: ]
;R15:	<clase_vector> ::= array <tipo> [constante_entera]
****Error semantico en lin 3: El tamanyo del vector excede los limites permitidos (1,64)
