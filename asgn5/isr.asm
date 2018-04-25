; Terence Tong
; ISR

	.ORIG x3500
	; HALT l x32ff
	LDI R0, KDR
	AND R2, R2, #0
	STI R2, KSR
	LDI R2, UPPC
	STR R2, R6, #0	; mem[32FF] has the UP1 PC
	RTI

KSR  .FILL xFE00
KDR  .FILL xFE02
UPPC .FILL x32FF
	.END