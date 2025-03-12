−1 → 11111111

−2 → 11111110

−127 → 10000001

−128 → 10000000

−129 → stack overflow (il faut 9 bits)

| Opération        | Résultat attendu | Calculé | Correct ? |
|-----------------|-----------------|---------|-----------|
| **5 - 3**       | 2               | 2       | ✅ |
| **-1 + 3**      | 2               | 2       | ✅ |
| **-65 + (-2)**  | -67             | -67     | ✅ |
| **-65 + (-64)** | -129 (overflow) | 127 (overflow) | ❌ |
| **-1 × 3**      | -3              | -3      | ✅ |
| **-65 × -2**    | 130 (overflow)  | Overflow | ❌ |
| **-65 × -3**    | 195 (overflow)  | Overflow | ❌ |
| **-13 × -6**    | 78              | 78      | ✅ |

**Conclusion** : Certaines opérations entraînent un dépassement de capacité en 8 bits (overflow). Pour des nombres plus grands, il faudrait utiliser plus de bits (ex. 16 bits, 32 bits).
