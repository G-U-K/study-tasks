//2.	Измените программу из примера 7 таким образом, чтобы она подсчитывала число нулей
.INCLUDE "m324PBdef.inc"

.DEF zeroes_counter = r0
.DEF number = r1
.DEF temp = r20
.DEF cycle_counter = r21

.DSEG ;начало сегмента данных ОЗУ
.SET VALUE = 0b00000011

.CSEG
rjmp RESET
RESET:
	ldi temp, VALUE
	mov number, temp
	clr zeroes_counter
	ldi cycle_counter, 8
LOOP:
	sbrs number, 0		; если первый бит поднят, то пропускаем инкремент
	inc zeroes_counter
	sbrc number, 0		; если первый бит опущен, то пропускаем поднятие флага переноса
	sec
	ror number			; циклически сдвигаем все биты вправо

	dec cycle_counter			; запускаем следующую итерацию
	cpi cycle_counter, 0x00
	brne LOOP
END:
	rjmp END