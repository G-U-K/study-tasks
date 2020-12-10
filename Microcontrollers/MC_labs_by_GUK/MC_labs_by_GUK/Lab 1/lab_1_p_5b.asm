/* 
 Напишите программу, которая находит модуль разности двух 8-разрядных чисел со знаком.
*/
.INCLUDE "m324PBdef.inc"

; ЗАДАВАТЬ ЗНАЧЕНИЯ ЗДЕСЬ
; ---------------------------------------
.EQU val_num1 = -26
.EQU val_num2 = -12
; ---------------------------------------
; РЕЗУЛЬТАТ В r17

.DEF num1 = r17
.DEF num2 = r18


.DSEG
; .ORG 0x60
; arr: .BYTE 10

.CSEG

RJMP Start

Start:
			LDI  num1,val_num1
			LDI  num2,val_num2
			SUB  num1,num2
			BRPL End
			NEG  num1
End: 
			RJMP End
; arr_const : .DB 10 20 30 40
