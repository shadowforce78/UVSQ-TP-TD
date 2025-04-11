# Compte-rendu TP5 - Analyse de données avec SQL

## Structure des données
Le TP utilise deux tables principales :
- **match_results** : Contient des données sur des matchs de football
- **bricks** : Contient des données sur des briques de différentes caractéristiques

## Analyse des requêtes

### 1. Données des matchs

Les données incluent 5 matchs avec différentes équipes dans 4 lieux différents :
- Snowley
- Coldgate
- Dorwall
- Newdell

### 2. Techniques de pivotage

#### Pivotage manuel
La première méthode utilise `CASE WHEN` pour créer un comptage par lieu. Cette méthode est plus verbeuse mais plus flexible car elle permet des conditions complexes.

#### Pivotage avec PIVOT
La clause `PIVOT` simplifie grandement la syntaxe. Deux écritures équivalentes sont présentées :
- Version directe avec subquery
- Version avec CTE (WITH)

Les deux produisent le même résultat : un tableau croisé des lieux avec leur nombre de matchs.

### 3. UNPIVOT
La clause `UNPIVOT` permet de transformer des colonnes en lignes. Dans l'exemple, elle est utilisée pour :
- Transformer les colonnes home_team_name et away_team_name en lignes
- Créer une vue normalisée des équipes par match

### 4. Statistiques descriptives
Sur la table bricks, plusieurs fonctions statistiques sont utilisées :
- SUM, MIN, MAX : Mesures basiques
- AVG, MEDIAN : Tendances centrales
- STDDEV, VARIANCE : Mesures de dispersion
- STATS_MODE : Mode statistique

### 5. Agrégations avancées

#### ROLLUP
- Permet de générer des sous-totaux hiérarchiques
- Exemple sur colour et shape avec totaux intermédiaires
- Version partielle montrée sur un seul attribut

#### CUBE
Génère toutes les combinaisons possibles d'agrégations sur les attributs spécifiés, permettant une analyse multidimensionnelle complète.

## Conclusion
Ces fonctionnalités SQL avancées permettent :
- Une analyse multidimensionnelle des données
- Des transformations de données flexibles
- Des calculs statistiques robustes
- Des agrégations à plusieurs niveaux
