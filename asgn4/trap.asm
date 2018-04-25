; Terence Tong
; 1. is the KBSR interrupt enabled? 
    ; it is not enabled 

; 2. what is OUT doing? polling or interrupt? 
    ; TOUT_R1 <- R1 saves value R1 to TOUT_R1
    ; LDI R1, OS_DSR which is (R1 <- 0000) *only the first bit changes 
        ; depending on whether or not the display is ready*
    ; BRZP branches back to LDI above, when the first bit is set,
        ; mem[mem[os_dsr]] changes when its ready?
    ; STI R0, OS_DDR takes whatever is in R0 puts it to
        ; mem address xFE06 which is DDR- the character to be written
    ; LD r1, TOUT_R1 restores R1 to original value
    ; RET jumps back to R7 
    ; OUT uses polling

; write your own TRAP command that prints the user input
		.ORIG x3300
		ST R0, REG0	; save R0
		ST R1, REG1	; save R1 
		ST R2, REG2	; save R2
		ST R3, REG3
		ST R4, REG4
		AND R4, R4, #0
CHAR	LDI R3, KBSR	; wait for a character to be typed
		BRzp CHAR		; polling....
		LDI R3, KBDR	; the character stored is at mem[KBDR]
		ADD R2, R3, x-A	; if the character is "\n" 
		BRz PRN				; branch to a PRN label
OTPT	LDI R2, DSR	;
		BRzp OTPT
		STI R3, DDR	; print the character from input 
		STR R3, R0, #0 	; else store the character to allocated memory at R0
		ADD R0, R0, #1	; incremement pointer
		BRnzp	CHAR	; branch to continue taking characters
PRN		STR R4, R0, #0
		LD R0, REG0
		LD R1, REG1
		LD R2, REG2
		LD R3, REG3
		LD R4, REG4
		RET

KBSR	.FILL xFE00 ; Keyboard Source Reg
KBDR	.FILL xFE02 ; Keyboard Data Reg
DSR		.FILL xFE04 ; Display Source Reg
DDR		.FILL xFE06 ; Display Data Reg	
REG0	.FILL x0000	
REG1	.FILL x0000	
REG2	.FILL x0000	
REG3	.FILL x0000	
REG4	.FILL x0000	
.END

		