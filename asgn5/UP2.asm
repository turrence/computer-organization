; Terence Tong 
; UP2

	.ORIG x3400
	LD R0, AST
RST	AND R1, R1, #0
LP	ADD R1, R1, #1
	BRzp LP
	OUT
	BRnzp RST
	
AST	.FILL x2A
	.END