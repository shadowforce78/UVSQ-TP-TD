SECTION INTVEC
B main

SECTION CODE
main
    LDR R0, =tableau    ; R0 contains base address of array
    MOV R1, #0          ; R1 is our counter/exponent (0-9)
    MOV R3, #1          ; R3 will hold our power of 2
loop
    MOV R2, R3          ; R2 gets the current power of 2
    STR R2, [R0, R1, LSL #2]  ; Store R2 at address R0 + (R1 << 2)
    LSL R3, R3, #1      ; Calculate next power of 2 (R3 = R3 * 2)
    ADD R1, R1, #1      ; Increment counter
    CMP R1, #10         ; Check if we reached the end
    BLT loop           ; If R1 < 10, continue loop
fin
    B fin

SECTION DATA
tableau ALLOC32 10
