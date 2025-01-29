SECTION INTVEC
    B main

SECTION CODE
main
    LDR R1, a  ; Charger a dans R1
    LDR R2, b  ; Charger b dans R2
    ADD R1, R1, R2 ; som = a + b
    STR R1, som

    ADD R3, R1, R1 ; som2 = som + som
    STR R3, som2   ; Stocker som2 en mémoire

fin
    B fin

SECTION DATA
a ASSIGN32 0x8
b ASSIGN32 0x2
som ALLOC32 1
som2 ALLOC32 1
