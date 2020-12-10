/*
Напишите программу, выполняющую вращение 16-разрядной 
переменной на 4 разряда влево.
 */
.INCLUDE "m324PBdef.inc"

.DEF num_low = r17
.DEF num_high = r18
.DEF suppl = r19
.DEF counter = r20

; ЗАДАВАТЬ ЗНАЧЕНИЯ ЗДЕСЬ
; ---------------------------------------
.EQU val_num_16x = 0xABED ;ABED -> DABE
; ---------------------------------------

.EQU count = 4
.EQU val_high = HIGH(val_num_16x)
.EQU val_low = LOW(val_num_16x)

.DSEG
; .ORG 0x60
; arr: .BYTE 10

.CSEG

RJMP Start

Start:
			LDI  num_low,val_low
			LDI  num_high,val_high
			LDI  counter,count
Loop1:
			SBRC num_low,0 ; младший разряд определит флаг C
			SEC
			ROR  num_high
			ROR  num_low
			DEC  counter
			CPI  counter,0
			BRNE Loop1
End:
			RJMP End
; arr_const : .DB 10 20 30 40
