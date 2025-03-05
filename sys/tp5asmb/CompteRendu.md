# Compte Rendu - TP5 ARM Assembly

## Exercice 1: Fonction Triple

### Analyse de l'exécution

#### Différence entre "Exécuter la ligne courante" et "Exécuter l'instruction courante"

- **"Exécuter la ligne courante"** exécute l'instruction assembleur complète
- **"Exécuter l'instruction courante"** exécute seulement l'instruction machine actuelle (une ligne d'assembleur peut correspondre à plusieurs instructions machine)

#### La taille de la Pile est-elle suffisante?

La pile est définie avec `maPile ALLOC32 4` (16 octets). La fonction Triple utilise `PUSH {R1,LR}` (8 octets) et le programme principal utilise `PUSH {R0}` (4 octets), soit 12 octets au maximum. **Donc oui, la taille est suffisante.**

#### Valeurs dans la Pile après exécution

À la fin de l'exécution, la pile est vide car tous les registres ont été dépilés.
Pendant l'exécution, on trouve dans l'ordre: R0, LR, puis R1 (du haut vers le bas).

---

## Exercice 2: Fonction valeurAbsolue

```
valeurAbsolue
; paramètre : R
; valeur de retour : R
PUSH {R3, LR} ; Sauvegarde R3 et LR
MOV R3, #-1 ; R3 = -
CMP R0, #0 ; Compare R0 à 0
BGE fn ; Si R0  0, aller à fn
MUL R0, R0, R3 ; Sinon, R0 = R0 * (-1)
fn
POP {R3, LR} ; Restaure R3 et LR
BX LR ; Retour au programme appelant
```

# Question : La fonction valeurAbsolue empile et dépile le registre LR, et quoi d'autre?

# Réponse : Elle empile et dépile également le registre R3 qu'elle utilise pour stocker la constante -1.

## SECTION INTVEC

```
B main
```

## SECTION CODE

```
main
LDR SP, =maPile ; Initialisation de la pile
ADD SP, SP, #16 ; Positionnement de SP à la fn
LDR R3, =tableau ; R3 = adresse du tableau
MOV R2, #4 ; R2 = taille du tableau (éléments)
MOV R1, #0 ; R1 = indice de boucle, varie de 0 à 3
boucle
CMP R1, R2 ; Comparer avec la taille du tableau
BGE fn ; Si fn du tableau, terminer
LDR R0, [R3, R1, LSL #2] ; R0 = tableau[R1]
BL valeurAbsolue ; Appel de valeurAbsolue
STR R0, [R3, R1, LSL #2] ; tableau[R1] = |tableau[R1]|
ADD R1, R1, #1 ; Incrémenter indice
B boucle ; Continuer la boucle
fn
B fn ; Boucle infnie
```

# Pour la fonction valAbsTab, je définis les paramètres:

```
valeurAbsolue
; paramètre & val de retour : R
PUSH {R3, LR} ; Sauvegarde R3 et LR
MOV R3, #-1 ; R3 = -
CMP R0, #0 ; Compare R0 à 0
BGE fnValAbs ; Si R0  0, aller à fnValAbs
MUL R0, R0, R3 ; Sinon, R0 = R0 * (-1)
fnValAbs
POP {R3, LR} ; Restaure R3 et LR
BX LR ; Retour au programme appelant
```

## SECTION DATA

```
tableau ASSIGN32 01, -02, 05, -0
maPile ALLOC32 4
```

## SECTION INTVEC

```
B main
```

## SECTION CODE

```
main
LDR SP, =maPile ; Initialisation de la pile
ADD SP, SP, #16 ; Positionnement de SP à la fn
LDR R0, =tableau ; R0 = adresse du tableau
MOV R1, #4 ; R1 = taille du tableau
BL valAbsTab ; Appel de valAbsTab
fn
B fn ; Boucle infnie
```

```
valAbsTab
; paramètre R0 : adresse du tableau
; paramètre R1 : taille du tableau
PUSH {R0-R4, LR} ; Sauvegarde des registres
MOV R2, #0 ; R2 = indice de boucle
MOV R4, R0 ; R4 = sauvegarde de l'adresse
boucleTAB
CMP R2, R1 ; Comparer avec la taille du tableau
BGE fnTAB ; Si fn du tableau, terminer
LDR R0, [R4, R2, LSL #2] ; R0 = tableau[R2]
BL valeurAbsolue ; Appel de valeurAbsolue
STR R0, [R4, R2, LSL #2] ; tableau[R2] = R
ADD R2, R2, #1 ; Incrémenter index
B boucleTAB ; Continuer la boucle
fnTAB
POP {R0-R4, LR} ; Restaure les registres
BX LR ; Retour au programme appelant
```

## SECTION DATA

```
tableau ASSIGN32 01, -02, 05, -0    
maPile ALLOC32 4
```

## SECTION INTVEC

```
B main
```

## SECTION CODE

```
main
LDR SP, =maPile ; Initialisation de la pile
ADD SP, SP, #16 ; Positionnement de SP à la fn
MOV R0, #5 ; R0 = 5 pour calculer 5!
BL factorielle ; Appel de factorielle
fn
B fn ; Boucle infnie
```

```
factorielle
; paramètre d'appel R
; valeur de retour R
; calcule factorielle(R0)
PUSH {R0, R2, LR} ; Sauvegarde des registres
MOV R1, #1 ; Initialiser résultat à 1
boucleFacto
CMP R0, #1 ; Comparer R0 à 1
BLE fnFacto ; Si R0  1, sortir de la boucle
MUL R1, R1, R0 ; R1 = R1 * R
SUB R0, R0, #1 ; R0 = R0 - 1 (décroissant)
B boucleFacto ; Répéter la boucle
fnFacto
POP {R0, R2, LR} ; Restaure les registres
BX LR ; Retour au programme appelant
```

## SECTION DATA

```
maPile ALLOC32 4
```

# Le résultat pour 5! est 120 (5×4×3×2×1 = 120) et sera stocké dans R1.

## SECTION INTVEC

```
B main
```

## SECTION CODE

```
main
LDR SP, =maPile ; Initialisation de la pile
ADD SP, SP, #32 ; Positionnement de SP à la fn (pile plus grande)
MOV R0, #5 ; R0 = 5 pour calculer 5!
BL factorielleRec ; Appel de factorielleRec
fn
B fn ; Boucle infnie
```

```
factorielleRec
; paramètre d'appel R
; valeur de retour R
PUSH {R1, LR} ; Sauvegarde des registres
CMP R0, #1 ; Comparer R0 à 1
BLE casBase ; Si R0  1, aller au cas de base
; Cas récursif
MOV R1, R0 ; R1 = sauvegarde de n
SUB R0, R0, #1 ; R0 = n-
BL factorielleRec ; Appel récursif factorielleRec(n-1)
MUL R0, R0, R1 ; R0 = factorielleRec(n-1) * n
B fnRec
casBase
MOV R0, #1 ; Cas de base : retourne 1
fnRec
POP {R1, LR} ; Restaure les registres
BX LR ; Retour au programme appelant
```

## SECTION DATA

```
maPile ALLOC32 8 ; Plus grande pile pour la récursion (quitte à augmenter la pile plus tard)
```


