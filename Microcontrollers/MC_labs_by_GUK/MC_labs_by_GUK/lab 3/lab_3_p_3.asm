//2.	�������� ��������� �� ������� 7 ����� �������, ����� ��� ������������ ����� �����
.INCLUDE "m324PBdef.inc"

.DEF zeroes_counter = r0
.DEF number = r1
.DEF temp = r20
.DEF cycle_counter = r21

.DSEG ;������ �������� ������ ���
.SET VALUE = 0b00000011

.CSEG
rjmp RESET
RESET:
	ldi temp, VALUE
	mov number, temp
	clr zeroes_counter
	ldi cycle_counter, 8
LOOP:
	sbrs number, 0		; ���� ������ ��� ������, �� ���������� ���������
	inc zeroes_counter
	sbrc number, 0		; ���� ������ ��� ������, �� ���������� �������� ����� ��������
	sec
	ror number			; ���������� �������� ��� ���� ������

	dec cycle_counter			; ��������� ��������� ��������
	cpi cycle_counter, 0x00
	brne LOOP
END:
	rjmp END