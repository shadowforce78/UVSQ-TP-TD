SECTION INTVEC

B main

SECTION CODE

main
MOV R1, #0xAA        ; Initialize R1 with 0xAA
LDR R2, =maVar       ; Load address of maVar
LDR R2, [R2]         ; Load value of maVar
MOV R3, #0x4         ; Load 4 for comparison
CMP R2, R3           ; Compare maVar with 4
BNE skip             ; Branch if not equal
MOV R1, #0xBB        ; If equal, set R1 to 0xBB
skip
LDR R2, =res         ; Load address of res
STR R1, [R2]         ; Store R1 in res

fin
B fin

SECTION DATA

maVar DCD 0x7        ; Initialize maVar with 7 (change to 4 to test other case)
res   DCD 0x0        ; Declare res variable
