SECTION INTVEC

SECTION CODE

    ; Charger les adresses en mémoire avant d'accéder aux valeurs
    LDR R3, var1           ; Charger l'adresse de n1 dans R3
    LDR R1, [R3]         ; Charger la valeur de n1 dans R1

    LDR R3, var2           ; Charger l'adresse de n2 dans R3       
    LDR R2, [R3]          ; Charger la valeur de n2 dans R2

    END

SECTION DATA

var1 ASSIGN32 0x12345678
var2 ASSIGN32 0xAABBCCDD