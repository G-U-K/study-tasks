/* 
 �������� ���������, ������� ������� ������ �������� ���� 8-��������� ����� �� ������.
*/
.INCLUDE "m324PBdef.inc"

; �������� �������� �����
; ---------------------------------------
.EQU val_num1 = -26
.EQU val_num2 = -12
; ---------------------------------------
; ��������� � r17

.DEF num1 = r17
.DEF num2 = r18


.DSEG
; .ORG 0x60
; arr: .BYTE 10

.CSEG

RJMP Start

Start:
			LDI  num1,val_num1
			LDI  num2,val_num2
			SUB  num1,num2
			BRPL End
			NEG  num1
End: 
			RJMP End
; arr_const : .DB 10 20 30 40
