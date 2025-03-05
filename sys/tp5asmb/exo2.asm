SECTION INTVEC
    B main          ; Reset vector - branch to main

SECTION CODE
main:
    MOV R0, #-42    ; Test avec une valeur négative
    BL valeurAbsolue
    MOV R0, #25     ; Test avec une valeur positive
    BL valeurAbsolue
    B .             ; Infinite loop at end of main

; Exercice 2 - Fonction valeurAbsolue
valeurAbsolue:
    PUSH {LR}       ; Sauvegarde LR sur la pile
    CMP R0, #0      ; Compare R0 avec 0
    BGE endAbs      ; Si R0 >= 0, on saute à la fin
    RSBS R0, R0, #0 ; R0 = -R0
endAbs:
    POP {LR}        ; Restaure LR
    BX LR           ; Retour à l'appelant
