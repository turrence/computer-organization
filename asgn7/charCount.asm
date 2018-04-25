; Terence Tong
; CSC 225 - 01
; ASGN 7

; CHAR_COUNT FUNCTION
;
;R0 - counter
;R2 - arithmetic of character
;R3 - comparison character
;R4 - pointer to character in a word
;R5 - used for dynamic link
;R6 - used for stack pointer
;R7 - used for PC counter


; *************** CHAR_COUNT SETUP *****************************
	.ORIG x3300
	; charCount(word, search) parameters are already in the stack
	; R6 currently points to word always to the top of the stack
	; R5 points to the local variables of the function
CHAR_COUNT	
	
	ADD R6, R6, #-2 ; save one spot for the return value and skip to the copy of R7
	STR R7, R6, #0	; store caller PC to R6
	
	ADD R6, R6, #-1
	STR R5, R6, #0	; local variable pointer for the caller function
	
	ADD R6, R6, #-1		
	ADD R5, R6, #0	; R6 points to the top of the stack which happens to be R5 which is the base of the local variables
	
; *************** CHAR_COUNT CODE *****************************

	LDR R4, R5, #4
	LDR R4, R4, #0	; word[index] being searched in R4
	BRz LAST
	
	LDR R3, R5, #5	; character to be searched for
	NOT R2, R3
	ADD R2, R2, #1
	ADD R2, R2, R4
	BRz SAME
	
	; not same
		ADD R6, R6, #-1
		STR R3, R6, #0	; character parameter to stack
		ADD R6, R6, #-1
		LDR R4, R5, #4
		ADD R4, R4, #1
		STR R4, R6, #0	; the next word[index] to stack
		JSR CHAR_COUNT
		
		LDR R0, R6, #0	; put return values in R0
		ADD R6, R6, #1
		
		ADD R6, R6, #2	; pop the 2 arguments when function was called
		
		; ADD R0, R0, #0 dont know how to save lines between different conditions
		STR R0, R5, #0	; store for the recursive called
		BRnzp RETURN
	
SAME	ADD R6, R6, #-1
		STR R3, R6, #0	; character parameter to stack
		ADD R6, R6, #-1
		LDR R4, R5, #4
		ADD R4, R4, #1
		STR R4, R6, #0	; the next word[index] to stack
		JSR CHAR_COUNT
		
		LDR R0, R6, #0	; put return values in R0
		ADD R6, R6, #1
		
		ADD R6, R6, #2	; pop the 2 arguments when function was called
		
		ADD R0, R0, #1
		STR R0, R5, #0	; store for the recursive called
		BRnzp RETURN
		
LAST
	AND R2, R2, #0	; clear R2, should only run once
	STR R2, R5, #0

; *************** CHAR_COUNT RETURN *****************************
RETURN
	LDR R0, R5, #0
	STR R0, R5, #3
	
	ADD R6, R6, #1	; POP A LOCAL
	
	LDR R5, R6, #0	; restore the dynamic link
	ADD R6, R6, #1
	
	LDR R7, R6, #0	; restore original
	ADD R6, R6, #1
	; return result;
	; R6 is mem location of the return value? 
	
	RET
	.END