; Terence Tong
; igPay atinLay
; R0 is used for TRAP commands 
; R1 is used a the pointer to the user's word
; R2 stores the first letter 
; R3 pointer for vowels
; R4 used as value to check for equality


        .ORIG x3000      ;
RESET   LEA R1, DATA     ;
        LEA R0, PROMPT   ;
        PUTS             ; prompts user for English Word
USER    GETC             ; ask user for input
        OUT              ; writes what user wrote
        ADD R2, R0, x-A  ; compares user input to ascii of /n
        BRz DONE         ; if r2 is 0 don't store
        STR R0, R1, #0   ; store the letter at DATA
        ADD R1, R1, #1   ; increment the value of DATA
        BRnzp USER       ; loops back to ask user input
DONE    
        LEA R0, RESULT   
        PUTS            ; print "Pig-Latin Word: "
        LEA R0, DATA    ; get location of first letter
        LDR R2, R0, #0  ; load the first letter to R2
        LEA R3, VWL     ; R3 is memory locations for vowels
CHK     LDR R4, R3, #0  ; load R3 into R4
        BRz STP         ; because VWL only has vowels it should stop when its 0
        NOT R4, R4
        ADD R4, R2, R4  ; comparison of vowel and first letter
        NOT R4, R4      ; not for comparison
        BRz NVWL        ; if its 0 then it is vowel and print 
        ADD R3, R3, #1  ; change mem location of vowel
        BRnzp CHK
STP     STR R2, R1, #0   ; put the first letter at the end of DATA
        ADD R0, R0, #1   ; ignore the first character (for printing)
NVWL    PUTS            ; outputs translated word
        LEA R0, AY      ; print "ay"
        PUTS
        
        AND R1, R1, #0   ; clear DATA
        LEA R2, DATA
CLR     LDR R0, R2, #0  ; clears the DATA so code can be run again
        BRz noRE
        STR R1, R2, #0
        ADD R2, R2, #1
        BRnzp CLR
noRE    BRnzp RESET      ; starts the code from beginning
        
PROMPT  .STRINGZ "English Word: "
RESULT  .STRINGZ "Pig-Latin Word: "
AY      .STRINGZ "ay\n"
VWL     .STRINGZ "aeiou"
DATA    .BLKW x20
        .END