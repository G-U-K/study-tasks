//Ќапишите программу, выполн€ющую логический сдвиг 16-разр€дной переменной на 3 разр€да а) влево, б) вправо

.INCLUDE "m324PBdef.inc"

.DEF num_low = r26
.DEF num_high = r27
.DEF counter = r19

; «јƒј¬ј“№ «Ќј„≈Ќ»я «ƒ≈—№
; ---------------------------------------
.EQU val_num_16x = 0x1111
.EQU count = 3
.EQU val_high = HIGH(val_num_16x)
.EQU val_low = LOW(val_num_16x)
; 1111 >> 3 = 222
; 1111: 0b 0001 0001 0001 0001
;  222: 0b 0000 0010 0010 0010
; 0x80: 0b 0000 0000 1000 0000
; ---------------------------------------
.CSEG

RJMP Start

Start:
			LDI  num_low, val_low
			LDI  num_high, val_high
			LDI  counter, count
Loop:
			LSR  num_low		; сдвигаем младшие 8 бит вправо
			CLC					; очищаем флаг переноса
			LSR  num_high		; сдвигаем старшие 8 бит вправо
			BRCC SkipRaising	; если флаг переноса опущен, пропускаем следующую команду
			SBR  num_low, 0x80  ; подымаем старший бит в num_low
SkipRaising:
			DEC  counter
			CPI  counter,0
			BRNE Loop
End: 
			RJMP End
