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