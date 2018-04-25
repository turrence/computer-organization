	.ORIG	x3000

	LEA R6, #-1 	; R6 <- x3000
	
	LD  R1, TRP 	; trap x26 to x3300
	STI R1, IND
	
	LD  R1, ISR		; mem[x0180] -> x3500
	STI R1, IND2
	
LOOP	TRAP	x26	; get char
	TRAP	x21  	; print char to screen
	TRAP	x26  	; get char
	TRAP	x21  	; print char to screen
	TRAP	x26  	; get char
	TRAP	x21  	; print char to screen
	TRAP	x26  	; get char
	TRAP	x21  	; print char to screen
	TRAP	x26  	; get char
	TRAP	x21  	; print char to screen
	LEA	R0, END_MSG
	PUTS
	BRnzp LOOP

END_MSG .STRINGZ "\nSuccess!  Running again...\n"
TRP 	.FILL x3300
IND		.FILL x26
ISR		.FILL x3500
IND2	.FILL x0180
        .END