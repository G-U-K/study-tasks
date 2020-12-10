/* 
 Напишите программу сложения 16-разрядной и 8-разрядной регистровых 
 переменных для случаев, когда обе переменные - знаковые .
*/
.INCLUDE "m324PBdef.inc"

; ЗАДАВАТЬ ЗНАЧЕНИЯ ЗДЕСЬ
; ---------------------------------------
.EQU val_num1 = -1521
.EQU val_num2 = 96
; ---------------------------------------
; РЕЗУЛЬТАТ В r18:17

.EQU val_num1_low = LOW(val_num1)
.EQU val_num1_high = HIGH(val_num1)


.DEF num1_low = r17
.DEF num1_high = r18
.DEF num2 = r19
.DEF complement = r20


.DSEG
; .ORG 0x60
; arr: .BYTE 10

.CSEG

RJMP Start

Start:
			LDI  num1_low,val_num1_low
			LDI  num1_high,val_num1_high
			LDI  num2,val_num2

			CLR  complement
			SBRC num2,7
			LDI  complement,0xFF
			
			ADD  num1_low,num2
			ADC  num1_high,complement
End: 
			RJMP End
; arr_const : .DB 10 20 30 40
