//2.	Измените программу из примера 7 таким образом, чтобы она подсчитывала число нулей
.INCLUDE "m324PBdef.inc"

.DEF zeroes_counter = r0
.DEF number = r20
.DEF cycle_counter = r21

.DSEG ;начало сегмента данных ОЗУ
.SET VALUE = 0b01101001
; VALUE			  0b 0110 1001
; SWAPPED VALUE = 0b 1001 0110

.CSEG
rjmp RESET
RESET:
	ldi number, VALUE
	ldi cycle_counter, 8
LOOP:
	sbrs number, 0
	inc zeroes_counter
	lsr number
	dec cycle_counter
	cpi cycle_counter, 0x00
	brne LOOP
END:
	rjmp END