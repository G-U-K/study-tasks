//ћодифицируйте программу из примера 6 таким образом, чтобы она подсчитывала число единиц в 8-разр€дной переменной (используйте команду SWAP).
.INCLUDE "m324PBdef.inc"

.DEF temp = r19
.DEF number = r20
.DEF ones_counter = r21
.DEF cycle_counter = r22

.DSEG ;начало сегмента данных ќ«”
.SET VALUE = 0b01101001
; VALUE			  0b 0110 1001
; SWAPPED VALUE = 0b 1001 0110

.CSEG
rjmp RESET
RESET:
	ldi number, VALUE
	ldi ones_counter, 0
	ldi cycle_counter, 2 ; цикл из двух итераций: на каждую тетраду

LOOP:
	; сбрасываем указатель Z на начало массива
	ldi ZH, HIGH(num_of_ones*2)
	ldi ZL, LOW(num_of_ones*2)

	; подсчитываем количество единиц
	ldi temp, 0x0F
	and temp, number
	add ZL, temp
	clr r2
	adc ZL, r2
	lpm ; загружаем содержимое (кол-во единиц) по указателю ZL в r0
	add ones_counter, r0 ; добавл€ем r0 к общему количеству единиц

	; переходим к следующей тетраде
	dec cycle_counter	 
	cpi cycle_counter,0
	swap number
	brne LOOP

END:
	rjmp END

num_of_ones:
	.DB 0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4