# Dossier de tests pour la calculatrice

## 1. Introduction

### Objectifs du test
L'objectif de ces tests est de vérifier le bon fonctionnement des opérations de base implémentées dans la calculatrice, à savoir l'addition, la soustraction, la multiplication et la division. Ces tests permettent d'identifier d'éventuelles erreurs et de valider la robustesse des algorithmes utilisés.

### Présentation de ce qui est testé
Les méthodes suivantes de la classe `Calculatrice` sont testées :
- `addition(int a, int b)`
- `soustraction(int a, int b)`
- `multiplication(int a, int b)`
- `division(int a, int b)`

## 2. Description du test

### Type de test
Les tests effectués sont des **tests unitaires**, réalisés à l'aide de **JUnit**. Ils visent à tester chaque fonction indépendamment.

### Stratégie adoptée
La stratégie adoptée est celle de la **boîte noire**, où nous vérifions les entrées et sorties sans nous préoccuper de l'implémentation interne. Nous avons également utilisé la **partition d'équivalence**, où nous testons différents cas représentatifs des entrées possibles.

### Présentation de la procédure
Chaque fonction est soumise à des cas de test spécifiques, prenant en compte des valeurs positives, négatives et nulles. Pour la division, nous avons également testé les cas provoquant des exceptions.

## 3. Tests

### Cas de test et résultats

#### 3.1 Addition
| Cas de test | Entrée (a, b) | Attendu | Résultat |
|------------|--------------|---------|----------|
| a et b positifs | (3, 2) | 5 | ✅ |
| a = 0, b > 0 | (0, 4) | 4 | ✅ |
| a > 0, b = 0 | (5, 0) | 5 | ✅ |
| a et b négatifs | (-4, -6) | -10 | ✅ |
| a < 0, b > 0, | (-3, 5) | 2 | ✅ |
| a > 0, b < 0 | (7, -7) | 0 | ✅ |

#### 3.2 Soustraction
| Cas de test | Entrée (a, b) | Attendu | Résultat |
|------------|--------------|---------|----------|
| a > 0, b > 0 | (5, 2) | 3 | ✅ |
| a = 0, b > 0 | (0, 4) | -4 | ✅ |
| a > 0, b = 0 | (3, 0) | 3 | ✅ |
| a et b négatifs | (-5, -2) | -3 | ✅ |
| a > 0, b < 0 | (4, -2) | 6 | ✅ |

#### 3.3 Multiplication
| Cas de test | Entrée (a, b) | Attendu | Résultat |
|------------|--------------|---------|----------|
| a > 0, b > 0 | (3, 2) | 6 | ✅ |
| a = 0, b > 0 | (0, 4) | 0 | ✅ |
| a et b négatifs | (-3, -2) | 6 | ✅ |
| a > 0, b < 0 | (4, -2) | -8 | ✅ |

#### 3.4 Division
| Cas de test | Entrée (a, b) | Attendu | Résultat |
|------------|--------------|---------|----------|
| a > 0, b > 0 | (6, 2) | 3 | ✅ |
| a = 0, b > 0 | (0, 4) | 0 | ✅ |
| a > 0, b = 0 | (5, 0) | Exception | ✅ |
| a < 0, b < 0 | (-6, -2) | 3 | ✅ |
| a = 0, b = 0 | (0, 0) | Exception | ✅ |

### Analyse des résultats
Tous les tests ont été validés avec succès. Les résultats obtenus sont conformes aux attentes. La gestion des erreurs dans la division par zéro est bien prise en charge par des exceptions.

## 4. Conclusion
La calculatrice a passé l'ensemble des tests unitaires sans erreur. Elle est capable d'effectuer correctement les opérations de base tout en gérant les cas particuliers. Cependant, des optimisations peuvent être envisagées pour améliorer l'efficacité des calculs, notamment en remplaçant les boucles par des opérations natives pour l'addition et la soustraction.

