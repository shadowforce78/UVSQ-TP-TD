# Compte Rendu TP4 Assembly

## Exercice 1 Observation du PC (Program Counter)

### Code

```assembly
SECTION INTVEC
B main
SECTION CODE
main
MOV R0, #0xAA
MOV R1, #0xBB
MOV R2, #0xCC
MOV R3, #0xDD
fin
B fin

SECTION DATA
```

### 1. Première exécution

Observations:

- Ligne 5 sélectionnée (en rouge)
- R0 = 0 (ligne 5 non exécutée)
- PC = 0x88

Pipeline:
| Instruction | Adresse |
|-------------|---------|
| Prête à être lue | MOV R2, #0xCC |
| Prête à être décodée | MOV R1, #0xBB |
| Prête à être exécutée | MOV R0, #0xAA | 0x80 |

### 2. Deuxième exécution

Observations:

- Ligne 6 sélectionnée (en rouge)
- R0 = 0xAA, R1 = 0
- PC = 0x8C (augmentation de 4)

Pipeline:
| Instruction | Adresse |
|-------------|---------|
| Prête à être lue | MOV R3, #0xDD |
| Prête à être décodée | MOV R2, #0xCC |
| Prête à être exécutée | MOV R1, #0xBB |

- Nouvelle instruction entrée dans le pipeline : MOV R3, #0xDD
- Instruction sortie du pipeline : MOV R0, #0xAA

Conclusion : Oui, on peut dire que PC contient l'adresse de l'instruction à exécuter + 8, car il y a toujours 2 instructions d'avance dans le pipeline.

## Exercice 2 Ecriture dans un tableau

### Explications

- Un tableau de 10 cases est réservé en mémoire (ALLOC32)
- R0 contient l'adresse de base du tableau
- R1 sert de compteur et d'offset pour l'adressage
- R2 stocke la valeur à écrire dans le tableau
- L'adressage [R0, R1, LSL #2] permet de calculer l'adresse de chaque case:
  - R0 : adresse de base
  - R1 : index (0-9)
  - LSL #2 : multiplication par 4 (taille d'un mot)

## Exercice 3 Ecriture des puissances de 2

### Explications

- Un tableau de 10 cases est réservé en mémoire (ALLOC32)
- R0 contient l'adresse de base du tableau
- R1 sert de compteur et d'offset pour l'adressage (0-9)
- R2 stocke la valeur à écrire dans le tableau
- R3 maintient la puissance de 2 courante
- L'instruction LSL R3, R3, #1 multiplie R3 par 2 à chaque itération
- Le tableau contiendra : 1, 2, 4, 8, 16, 32, 64, 128, 256, 512
