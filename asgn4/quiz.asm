; Terence Tong
; R0 MEMORY POINTER
; R1 STORE POINT VALUE FOR QUESTION
; R2 NET POINTS
; R5 pointer to next memory address
; always prints 

	
	.ORIG x3000
	AND R2, R2, #0 	; Reset R2 to zero
	LD     R0, Q1 	; Load first question to R0
	PUTS 			; Print question to display
	LEA R5, #1 		; Set R5 to the next address
	JSR INPT 		; take an input from user
	LD R1, ANS1 	; 
	LEA R5, #1 		; load
	JSR ADDP		;
	
	LD R0, Q2 ; Load second question
	PUTS
	LEA R5, #1
	JSR INPT
    LD R1, ANS2
	LEA R5, #1
	JSR ADDP

	LD     R0, Q3 ; Load third question
	PUTS
	LEA R5, #1
	JSR INPT
	LD R1, ANS3
	LEA R5, #1
	JSR ADDP

	; add up all the points
	ADD R2, R2, #-3
	BRnz WORST
	ADD R2, R2, #-3
	BRnz BAD
	ADD R2, R2, #-3
	BRnz GOOD
	BRnzp BEST

; Reponses according to points
BEST
	LD R0, BESTR
	PUTS
	HALT
GOOD
	LD R0, GOODR
	PUTS
	HALT
BAD
	LD R0, BADR
	PUTS
	HALT
WORST
	LD R0, WORSTR
	PUTS
	HALT

INPT ; Gets answer input from 0 to 3
    LEA R0, promptAns
	PUTS
	GETC
	OUT
	ADD R7, R5, #0
	RET

ADDP	; add to points
	ADD R1, R1, R0
	LDR R1, R1, #0
	ADD R2, R2, R1
	ADD R7, R5, #0
	RET

Q1	.FILL   x3300 
Q2	.FILL 	x3351
Q3	.FILL	x3397
promptAns .STRINGZ "Answer: "
ANS1	.FILL   x0000
ANS2	.FILL	x0000
ANS3	.FILL	x0000
BESTR	.FILL	x3416
GOODR	.FILL	X3404
BADR	.FILL	x33F1
WORSTR	.FILL	x33D9
	
.END