/* */
.INCLUDE "m324PBdef.inc"

.DEF var1 = r17
.DEF var2 = r18

; гюдюбюрэ гмювемхъ гдеяэ
; ---------------------------------------
.EQU val_var1 = 25
.EQU val_var2 = 45
; ---------------------------------------

.DSEG
; .ORG 0x60
; arr: .BYTE 10

.CSEG

RJMP Start

Start:
			LDI  var1,val_var1
			LDI  var2,val_var2
			ADD  var1,var2
End: 
			RJMP End
; arr_const : .DB 10 20 30 40
