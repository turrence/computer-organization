.ORIG x3300
;Store  Registers to temporary
ST R7, TEMP7
ST R1, TEMP1
ST R2, TEMP2
ST R3, TEMP3
AND R2, R2, #0
ADD R2, R2, R0
; Keyboard input
LOOP1: 
  LDI R3, KBSR
  BRzp LOOP1
  LDI R3, KBDR 

; Display input
LOOP2: LDI R1, DSR
BRzp LOOP2
GOBACK:
  STI R3, DDR
  ADD R1, R3, #-10
  BRz FINISHED
  STR R3, R2, #0
  ADD R2, R2, #1
  BR LOOP1	
FINISHED:
  AND R3, R3, #0
  STR R3, R2, #0 
  LD R1, TEMP1
  LD R7, TEMP7
  LD R2, TEMP2
  LD R3, TEMP3
  RET

KBSR .FILL xFE00 ; Keyboard Source Reg
KBDR .FILL xFE02 ; Keyboard Data Reg
DSR .FILL xFE04 ; Display Source Reg
DDR .FILL xFE06 ; Display Data Reg
TEMP7 .FILL x0000
TEMP1 .FILL x0000
TEMP2 .FILL x0000
TEMP3 .FILL x0000
.END