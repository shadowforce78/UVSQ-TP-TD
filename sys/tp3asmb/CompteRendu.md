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