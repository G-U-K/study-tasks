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
; 1111 << 3 = 8888

; 1111: 0b 0001 0001 0001 0001
; 8888: 0b 1000 1000 1000 1000
; ---------------------------------------
.CSEG

RJMP Start

Start:
			LDI  num_low, val_low
			LDI  num_high, val_high
			LDI  counter, count
Loop:
			LSL  num_high
			CLC
			LSL  num_low
			BRCC SkipRaising
			SBR  num_high, 1
SkipRaising:
			DEC  counter
			CPI  counter,0
			BRNE Loop
End: 
			RJMP End
