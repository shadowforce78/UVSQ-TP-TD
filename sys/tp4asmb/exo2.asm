SECTION INTVEC
B main

SECTION CODE
main
    LDR R0, =tableau    ; R0 contains base address of array
    MOV R1, #0          ; R1 is our counter and offset (0-9)
loop
    MOV R2, R1          ; R2 gets the current value (same as counter)
    STR R2, [R0, R1, LSL #2]  ; Store R2 at address R0 + (R1 << 2)
    ADD R1, R1, #1      ; Increment counter
    CMP R1, #10         ; Check if we reached the end
    BLT loop           ; If R1 < 10, continue loop
fin
    B fin

SECTION DATA
tableau ALLOC32 10