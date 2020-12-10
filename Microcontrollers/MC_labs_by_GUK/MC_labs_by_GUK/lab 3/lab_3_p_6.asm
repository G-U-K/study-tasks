/*
Напишите программу, выполняющую зеркальную перестановку разрядов 8-разрядного регистра.
 */ 
.INCLUDE "m324PBdef.inc"

.DEF var1 = r17
.DEF result = r18
.DEF counter = r20

; ЗАДАВАТЬ ЗНАЧЕНИЯ ЗДЕСЬ
; ---------------------------------------
.EQU val = 0b010110111 ; 010110111 -> 111011010
; ---------------------------------------
; РЕЗУЛЬТАТ В РЕГ 18

.EQU count = 8

.DSEG
; .ORG 0x60
; arr: .BYTE 10

.CSEG

RJMP Start

Start:
			LDI  var1,val
			CLR  result
			LDI  counter,count
Loop1:
			LSL  var1
			ROR  result
			DEC  counter
			CPI  counter,0
			BRNE Loop1
End: 
			RJMP End
; arr_const : .DB 10 20 30 40
