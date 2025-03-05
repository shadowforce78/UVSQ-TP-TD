# Compte Rendu - TP5 : Fonctions

---

## Exercice 1 - Fonction `Triple`

### Objectif

Créer une fonction `Triple` qui prend un paramètre en `R0` et retourne `3 * R0` en utilisant uniquement des additions.

### Implémentation

- La fonction `Triple` sauvegarde `LR` et `R1` sur la pile.
- Effectue l'opération `3 * R0` par additions successives.
- Restaure les registres et retourne le résultat dans `R0`.

### Code

```assembly
SECTION CODE
Triple:
    PUSH {R1,LR}     ; Sauvegarde R1 et LR
    ADD R1, R0, R0
    ADD R1, R1, R0
    MOV R0, R1       ; Place résultat dans R0
    POP {R1,LR}      ; Restaure R1 et LR
    BX LR            ; Retour à l'appelant
```

### Test

Nous avons testé la fonction en l'appelant avec `R0 = 8`. Le résultat obtenu est `24` (`3 * 8`).

---

## Exercice 2 - Fonction `valeurAbsolue`

### Objectif

Écrire une fonction `valeurAbsolue` qui retourne la valeur absolue d'un entier stocké dans `R0`.

### Implémentation

- Sauvegarde de `LR` sur la pile.
- Vérification du signe avec `CMP`.
- Si négatif, conversion en positif avec `RSBS`.
- Restauration et retour du résultat.

### Code

```assembly
SECTION CODE
valeurAbsolue:
    PUSH {LR}        ; Sauvegarde LR sur la pile
    CMP R0, #0       ; Compare R0 avec 0
    BGE endAbs       ; Si R0 >= 0, on saute à la fin
    RSBS R0, R0, #0  ; R0 = -R0
endAbs:
    POP {LR}         ; Restaure LR
    BX LR            ; Retour à l'appelant
```

### Test

Nous avons testé avec `R0 = -5`, `R0 = 8` et `R0 = 0`. Les résultats sont corrects :

- `-5` → `5`
- `8` → `8`
- `0` → `0`

---

## Exercice 3 - Valeur absolue des éléments d'un tableau

### Objectif

Utiliser `valeurAbsolue` pour transformer un tableau contenant des nombres positifs et négatifs en un tableau contenant uniquement des valeurs absolues.

### Implémentation

- Chargement de l'adresse du tableau.
- Boucle sur chaque élément.
- Application de `valeurAbsolue`.
- Stockage du résultat.

### Code

```assembly
SECTION CODE
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
```

### Test

Tableau initial : `[0x1, -0x2, 0x5, -0x7]`  
Tableau après exécution : `[0x1, 0x2, 0x5, 0x7]` ✅

---

## Exercice 4 - Fonction `valAbsTab`

### Objectif

Écrire une fonction `valAbsTab` qui utilise `valeurAbsolue` pour modifier un tableau en appliquant la valeur absolue à chacun de ses éléments.

### Code

```assembly
SECTION CODE
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
```

### Test

Le tableau initial et le tableau transformé sont identiques à ceux de l'exercice 3.

---

## Exercice 5 - Fonction `factorielle`

### Objectif

Écrire une fonction qui calcule la factorielle d'un nombre en utilisant une boucle décroissante.

### Code

```assembly
SECTION CODE
factorielle:
    PUSH {LR}        ; Sauvegarde LR
    MOV R1, #1       ; Initialisation du résultat à 1
loop:
    MUL R1, R1, R0   ; Multiplie R1 par R0
    SUBS R0, R0, #1  ; Décrémente R0
    BNE loop         ; Continue tant que R0 != 0
    MOV R0, R1       ; Place le résultat final dans R0
    POP {LR}         ; Restaure LR
    BX LR            ; Retour à l'appelant
```

### Test

Nous avons testé avec `R0 = 5` et obtenu `120` (`5! = 5 × 4 × 3 × 2 × 1`). ✅

---
