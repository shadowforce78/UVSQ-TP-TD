SECTION INTVEC

SECTION CODE
    MOV R1, R0    ; Test MOV avec différents registres
    MOV R2, R0
    MOV R2, R1  
    MOV R3, R1

    ADD R0, R0, R0 ; Test ADD
    ADD R0, R0, R1

    SUB R0, R0, R1 ; Test SUB

    CMP R0, R1    ; Test CMP avec différents registres
    CMP R0, R2
    CMP R0, R3

    END

SECTION DATA
