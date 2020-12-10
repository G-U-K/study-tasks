/*
Ќапишите программу, выполн€ющую умножение двух 8-разр€дных
чисел без знака, использу€ команды сдвигов и сложени€.
 */ 
.INCLUDE "m324PBdef.inc"

.DEF num1 = r17
.DEF num2 = r18
.DEF result = r19

; «јƒј¬ј“№ «Ќј„≈Ќ»я «ƒ≈—№
; ---------------------------------------
.EQU val_num1 = 35 ;14
.EQU val_num2 = 5 ;9
; ---------------------------------------
; –≈«”Ћ№“ј“ ¬ R19

.DSEG
; .ORG 0x60
; arr: .BYTE 10

.CSEG

RJMP Start

Start:
			LDI  num1,val_num1
			LDI  num2,val_num2
			CLR  result
			;CPI  num1,0
			;BREQ End
Loop1:
			CPI  num2,0
			BREQ End
			SBRC num2,0
			ADD  result,num1
			LSL  num1
			LSR  num2
			RJMP Loop1
End: 
			RJMP End
; arr_const : .DB 10 20 30 40
