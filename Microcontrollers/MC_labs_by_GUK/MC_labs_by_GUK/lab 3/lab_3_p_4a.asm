//�������� ���������, ����������� ���������� ����� 16-��������� ���������� �� 3 ������� �) �����, �) ������

.INCLUDE "m324PBdef.inc"

.DEF num_low = r26
.DEF num_high = r27
.DEF counter = r19

; �������� �������� �����
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
			LSR  num_low		; �������� ������� 8 ��� ������
			CLC					; ������� ���� ��������
			LSR  num_high		; �������� ������� 8 ��� ������
			BRCC SkipRaising	; ���� ���� �������� ������, ���������� ��������� �������
			SBR  num_low, 0x80  ; �������� ������� ��� � num_low
SkipRaising:
			DEC  counter
			CPI  counter,0
			BRNE Loop
End: 
			RJMP End
