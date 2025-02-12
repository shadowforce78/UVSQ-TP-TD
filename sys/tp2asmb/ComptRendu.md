# **TP 2 - Branchement et boucle**

## **Exercice 1 - Branchement inconditionnel**
```assembly
SECTION INTVEC
    B main

SECTION CODE
main
    MOV R2, #0x2  ; R2 <- 0x2
    B suite       ; Saut inconditionnel vers suite
    MOV R3, #0x3  ; Cette instruction est sautée

suite
    MOV R4, #0x4  ; R4 <- 0x4

fin
    B fin         ; Boucle infinie

SECTION DATA
```
### **Réponse :**
L'instruction `MOV R3, #0x3` **n'est pas exécutée** car il y a un branchement (`B suite`) avant cette instruction. Le programme saute directement à `suite`, évitant ainsi l'exécution de `MOV R3, #0x3`.

---

## **Exercice 2 - Branchement conditionnel if .. then**
```assembly
SECTION DATA
maVar DCD 0x4  ; Déclaration de la variable
res DCD 0      ; Résultat stocké en mémoire

SECTION CODE
main
    LDR R1, =0xAA  ; R1 <- 0xAA
    LDR R0, maVar  ; Charger maVar en R0
    CMP R0, #0x4   ; Comparer maVar avec 4
    BNE suite      ; Si différent de 4, sauter
    MOV R1, #0xBB  ; R1 <- 0xBB

suite
    STR R1, res    ; Stocker R1 dans res
    B fin

fin
    B fin
```
---

## **Exercice 3 - Branchement conditionnel if .. else**
```assembly
SECTION DATA
maVar DCD 0x7  ; Tester avec 0x7 et 0x4
res DCD 0      ; Résultat stocké en mémoire

SECTION CODE
main
    LDR R0, maVar  ; Charger maVar en R0
    CMP R0, #0x4   ; Comparer maVar avec 4
    BEQ then_part  ; Si égal à 4, aller à then_part
    MOV R1, #0xAA  ; Sinon, R1 <- 0xAA
    B suite

then_part
    MOV R1, #0xBB  ; R1 <- 0xBB

suite
    STR R1, res    ; Stocker R1 dans res
    B fin

fin
    B fin
```
---

## **Exercice 4 - Branchement conditionnel (BLT)**
```assembly
SECTION DATA
a DCD 0x8   ; Tester avec 0x8 et 0x14
b DCD 0

SECTION CODE
main
    LDR R0, a     ; Charger a dans R0
    MOV R1, #0x12 ; Charger 0x12 dans R1
    CMP R0, R1    ; Comparer a avec 0x12
    BLT less_than ; Si a < 0x12, sauter

    MOV R2, #0x1  ; Si a >= 0x12, mettre 1 dans R2
    B store_b

less_than
    MOV R2, #0x0  ; Si a < 0x12, mettre 0 dans R2

store_b
    STR R2, b     ; Stocker R2 dans b
    B fin

fin
    B fin
```
### **Réponses :**
- `0x12` en décimal : **18**
- `0x8` en décimal : **8**
- `0x14` en décimal : **20**
- **Explication du programme :** 
  - Si `a < 0x12` alors `b = 0`
  - Sinon `b = 1`

---

## **Exercice 5 - Boucle**
```assembly
SECTION DATA
n DCD 5  ; Nombre d'itérations

SECTION CODE
main
    LDR R1, n    ; Charger n dans R1
    MOV R4, #0x0 ; Initialisation compteur

DebutDeBoucle
    CMP R4, R1   ; Vérifier si R4 >= n
    BGE FinDeBoucle

    ; Instructions répétées ici

    ADD R4, R4, #0x1 ; Incrémentation
    B DebutDeBoucle

FinDeBoucle
    B FinDeBoucle
```
---

## **Exercice 6 - Calcul de a puissance n**
```assembly
SECTION DATA
a DCD 2
n DCD 10
result DCD 1

SECTION CODE
main
    LDR R0, a      ; Charger a
    LDR R1, n      ; Charger n
    MOV R2, #1     ; Initialiser le résultat à 1

DebutDeBoucle
    CMP R1, #0     ; Vérifier si n == 0
    BEQ FinDeBoucle

    MUL R2, R2, R0 ; R2 *= a
    SUB R1, R1, #1 ; Décrémenter n
    B DebutDeBoucle

FinDeBoucle
    STR R2, result ; Stocker le résultat
    B FinDeBoucle
```
---

## **Exercice 7 - Noms de variables et mémoire**
### **Question : Les noms des variables sont-ils stockés en mémoire ?**
Non, les noms des variables ne sont **pas stockés en mémoire**. En assembleur, seule l'adresse de la variable et sa valeur sont stockées. Les noms sont utilisés uniquement pour l'écriture du code source.

---

## **Exercice 8 - Calcul de n!**
```assembly
SECTION DATA
n DCD 5
result DCD 1

SECTION CODE
main
    LDR R1, n      ; Charger n
    MOV R2, #1     ; Initialiser résultat à 1

DebutDeBoucle
    CMP R1, #1     ; Si n <= 1, fin
    BLE FinDeBoucle

    MUL R2, R2, R1 ; R2 *= n
    SUB R1, R1, #1 ; n -= 1
    B DebutDeBoucle

FinDeBoucle
    STR R2, result ; Stocker résultat
    B FinDeBoucle
```