SECTION INTVEC
    B main          ; Reset vector - branch to main

SECTION CODE
main:
    BL valAbsTab    ; Appel à la fonction de traitement du tableau
    B .             ; Infinite loop at end of main

; Fonction valeur absolue (nécessaire pour valAbsTab)
valeurAbsolue:
    PUSH {LR}       ; Sauvegarde LR sur la pile
    CMP R0, #0      ; Compare R0 avec 0
    BGE endAbs      ; Si R0 >= 0, on saute à la fin
    RSBS R0, R0, #0 ; R0 = -R0
endAbs:
    POP {LR}        ; Restaure LR
    BX LR           ; Retour à l'appelant

; Exercice 3 - Valeur absolue d'un tableau
valAbsTab:
    PUSH {LR}       ; Sauvegarde LR sur la pile
    LDR R1, =tableau ; Charge l'adresse du tableau
    MOV R2, #4      ; Nombre d'éléments
loop:
    LDR R0, [R1]    ; Charge un élément du tableau
    BL valeurAbsolue; Appelle valeurAbsolue
    STR R0, [R1]    ; Stocke la valeur absolue
    ADD R1, R1, #4  ; Passe à l'élément suivant
    SUBS R2, R2, #1 ; Décrémente le compteur
    BNE loop        ; Boucle tant que R2 != 0
    POP {LR}        ; Restaure LR
    BX LR           ; Retour à l'appelant

SECTION DATA
tableau: .WORD 0x1, -0x2, 0x5, -0x7
