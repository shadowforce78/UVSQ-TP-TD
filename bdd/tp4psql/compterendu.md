# TP4 - Analyse de données avec SQL - Fonctions Analytiques

## Structure des données
La table `bricks` contient des informations sur des briques avec les colonnes suivantes :
- brick_id : identifiant unique
- colour : couleur de la brique (blue, red, green)
- shape : forme de la brique (cube, pyramid)
- weight : poids de la brique

## Analyse des commandes

### 1. Clause OVER simple
```sql
select B.*, count(*) over () from bricks;
```
Cette commande affiche toutes les colonnes de la table plus le nombre total de briques. La clause `OVER()` permet d'ajouter un agrégat global sans utiliser GROUP BY.

### 2. OVER avec PARTITION BY
```sql
select b.*,
       count(*) over (partition by colour) bricks_per_colour
```
Affiche pour chaque ligne le nombre de briques de la même couleur. Le `PARTITION BY` crée des groupes par couleur.

### 3. OVER avec ORDER BY
Cette commande calcule des totaux cumulatifs ordonnés par brick_id :
- `running_total` : nombre cumulé de briques
- `running_weight` : somme cumulée des poids

### 4. OVER avec PARTITION BY et ORDER BY combinés
Calcule les totaux cumulatifs mais séparément pour chaque couleur.

### 5. Fenêtres glissantes
Utilise `ROWS` et `RANGE` pour définir des fenêtres d'analyse :
- `ROWS` : basé sur le nombre de lignes physiques
- `RANGE` : basé sur les valeurs logiques

### 6. Fenêtres avant/après
Analyse les valeurs précédentes et suivantes dans une fenêtre glissante.

### 7. Filtrage avec fonctions d'agrégation
Deux approches pour filtrer sur des agrégats :
- Sous-requête dans le FROM
- Clause HAVING (mais donne un résultat différent)

### 8. Fonctions de classement
Trois types de ranking :
- `row_number()` : numérotation unique
- `rank()` : avec ex-aequo et sauts
- `dense_rank()` : avec ex-aequo sans sauts

### 9. Fonctions LAG et LEAD
Permettent d'accéder aux valeurs des lignes précédentes/suivantes.

### 10. Fonctions FIRST_VALUE et LAST_VALUE
Accès à la première/dernière valeur d'une fenêtre.

### Fonctions additionnelles
- `NTILE` : divise les résultats en groupes égaux
- `PERCENT_RANK` : calcule le rang relatif d'une ligne
