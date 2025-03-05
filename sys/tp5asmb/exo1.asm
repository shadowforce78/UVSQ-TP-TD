SECTION INTVEC
B main
SECTION CODE
main
LDR SP, =maPile ; Préparons une pile (de 16 octets)
ADD SP, SP, #16 ; On positionne SP à la fin
MOV R0, #0xAA ; On veut retrouver 0xAA à la fin
PUSH {R0} ; Sauvegarde R0
MOV R0, #8
BL Triple ; Appel de fonction
MOV R2, R0
POP {R0} ; Restaure R0 (R0 reprend la valeur AA)
fin
B fin
Triple
; paramètre : R0
; valeur de retour : R0
; Calcule 3*R0 par des additions
PUSH {R1,LR} ; Sauvegarde R1 et LR
ADD R1, R0, R0
ADD R1, R1, R0
MOV R0, R1 ; Place résultat dans R0
POP {R1,LR} ; Restaure R1 et LR
BX LR ; Fonction terminée
SECTION DATA
maPile ALLOC32 4