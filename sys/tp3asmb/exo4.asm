SECTION INTVEC

B main
SECTION CODE
main

LDR R0, note ; R0 <- note
LDR R1, bonus ; R1 <- bonus

MOV R3, #0x14 ; 0x14 = 20 en décimal
BGT seuil ; saute au label seuil si ?????
B continue
seuil
MOV R0, #0x14 ; 0x14 = 20 en décimal
continue
STR R0, note ; note <- R0
fin
B fin

SECTION DATA
note ASSIGN32 0x12
bonus ASSIGN32 0x4