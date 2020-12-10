//������������� ��������� �� ������� 6 ����� �������, ����� ��� ������������ ����� ������ � 8-��������� ���������� (����������� ������� SWAP).
.INCLUDE "m324PBdef.inc"

.DEF temp = r19
.DEF number = r20
.DEF ones_counter = r21
.DEF cycle_counter = r22

.DSEG ;������ �������� ������ ���
.SET VALUE = 0b01101001
; VALUE			  0b 0110 1001
; SWAPPED VALUE = 0b 1001 0110

.CSEG
rjmp RESET
RESET:
	ldi number, VALUE
	ldi ones_counter, 0
	ldi cycle_counter, 2 ; ���� �� ���� ��������: �� ������ �������

LOOP:
	; ���������� ��������� Z �� ������ �������
	ldi ZH, HIGH(num_of_ones*2)
	ldi ZL, LOW(num_of_ones*2)

	; ������������ ���������� ������
	ldi temp, 0x0F
	and temp, number
	add ZL, temp
	clr r2
	adc ZL, r2
	lpm ; ��������� ���������� (���-�� ������) �� ��������� ZL � r0
	add ones_counter, r0 ; ��������� r0 � ������ ���������� ������

	; ��������� � ��������� �������
	dec cycle_counter	 
	cpi cycle_counter,0
	swap number
	brne LOOP

END:
	rjmp END

num_of_ones:
	.DB 0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4