; Terence Tong
; Trap26
; a. Save the PC from UP1 into a hard-coded memory location (x32FF).
; 	(Where is the PC from UP1?)
; b. Turn on the interrupt enable bit in the KBSR
; c. JMP to UP2.

	.ORIG x3300
	ST R1, REG1		; dont alter values of regs
	ST R2, REG2     ; dont alter values of regs
	
	STI R7, STPC	; save PC from up1 to x32FF
	; HALT	L x32FF make sure it is equal to R7
	
	LDI R1, KBSR
	LD  R2, ENBL
	NOT R1, R1		; R1 OR R2 to make bit[14] = 1
	NOT R2, R2      ; R1 OR R2 
	AND R1, R1, R2  ; R1 OR R2 
	NOT R1, R1      ; R1 OR R2 
	STI R1, KBSR	; enables interrupt
	
	LD R1, REG1		; RESTORE REGS
	LD R2, REG2		; RESTORE REGS
	LD R3, REG3		; idk if i can modify other registries
	
	JMP R3			; JMP x3400 which is UP2.asm
	
ENBL .FILL x4000 ; 0100 0000 0000 0000 to enable the interrupt-bit (bit[14])
STPC .FILL x32FF	
KBSR .FILL xFE00
KBDR .FILL xFE02
REG1 .FILL x0000
REG2 .FILL x0000
REG3 .FILL x3400
	.END