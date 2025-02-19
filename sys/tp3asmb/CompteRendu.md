# Compte Rendu TP3 Assembly

## Exercice 1 Big Endian / Little Endian pour stocker des données en mémoire

### Observations

1. Pour 0x12345678:
   - En mémoire: 78 56 34 12
   
2. Pour 0xAABBCCDD:
   - En mémoire: DD CC BB AA

### Conclusion

Oui, le microprocesseur utilise le stockage Little Endian pour les données. On peut le constater car:
- Les octets sont stockés dans l'ordre inversé
- L'octet de poids faible est stocké à l'adresse la plus basse
- L'octet de poids fort est stocké à l'adresse la plus haute

C'est une caractéristique typique de l'architecture x86.

## Exercice 2 Big VS little Endian pour stocker les programmes en mémoire

### Code binaire de MOV R1, R0

Code binaire original: E1 A0 10 00

### Observations

En mémoire, l'instruction MOV R1, R0 est stockée comme:
00 10 A0 E1

### Conclusion

Les instructions sont également stockées en Little Endian dans la mémoire du programme, comme on peut le voir avec l'inversion des octets du code machine de l'instruction MOV R1, R0.

## Exercice 3 : Tableau d'instructions

| Instruction    | Code en mémoire  | Code original    |
|---------------|------------------|------------------|
| MOV R1, R0    | 00 10 A0 E1     | E1 A0 10 00     |
| MOV R2, R0    | 00 20 A0 E1     | E1 A0 20 00     |
| MOV R2, R1    | 01 20 A0 E1     | E1 A0 20 01     |
| MOV R3, R1    | 01 30 A0 E1     | E1 A0 30 01     |
| ADD R0, R0, R0| 00 00 80 E0     | E0 80 00 00     |
| ADD R0, R0, R1| 01 00 80 E0     | E0 80 00 01     |
| SUB R0, R0, R1| 01 00 40 E0     | E0 40 00 01     |
| CMP R0, R1    | 01 00 50 E1     | E1 50 00 01     |
| CMP R0, R2    | 02 00 50 E1     | E1 50 00 02     |
| CMP R0, R3    | 03 00 50 E1     | E1 50 00 03     |

### Observations

- Les instructions sont stockées en Little Endian
- Le format des instructions suit un pattern cohérent
- Le dernier octet (premier en mémoire) indique généralement les registres sources
- L'avant-dernier octet (deuxième en mémoire) indique le registre destination
- Les deux premiers octets (derniers en mémoire) définissent le type d'opération

## Exercice 4 Décodage

Ce programme semble vouloir limiter une note à 20/20. Il compare la note actuelle (probablement augmentée du bonus) avec 20, et si elle dépasse 20, la ramène à 20.

Test avec note=15 et bonus=2:
- R0 = 15 (note)
- R1 = 2 (bonus)
- 15 + 2 = 17 < 20
- Résultat final: la note reste à 17

Test avec note=18 et bonus=4:
- R0 = 18 (note)
- R1 = 4 (bonus)
- 18 + 4 = 22 > 20
- Résultat final: la note est ramenée à 20

Cependant, le programme contient une erreur : il manque l'addition de R0 et R1 avant la comparaison avec 20 (0x14). De plus, l'instruction BGT est utilisée sans CMP préalable.
