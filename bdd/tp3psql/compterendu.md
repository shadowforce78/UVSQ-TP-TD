# Compte Rendu - TP3 PSQL

## Exercice 1 : Création des Triggers

### Objectif
L'objectif de cet exercice était de créer des triggers pour automatiser certaines règles métier dans la base de données.

### Triggers Créés
1. **`trg_product_prodid`** : Génère automatiquement un `PRODID` si celui-ci n'est pas spécifié lors de l'insertion dans la table `PRODUCT`.
2. **`trg_item_itemtot`** : Calcule automatiquement la valeur totale (`ITEMTOT`) d'un article dans la table `ITEM` en fonction du prix unitaire (`ACTUALPRICE`) et de la quantité (`QTY`).
3. **`trg_customer_repid`** : Vérifie que le représentant (`REPID`) associé à un client est un employé ayant le rôle de `SALESMAN`. Sinon, une erreur est levée.
4. **`trg_price_dates`** : Vérifie que la date de début (`STARTDATE`) est antérieure à la date de fin (`ENDDATE`) dans la table `PRICE`. Sinon, une erreur est levée.
5. **`trg_item_price_check`** : Vérifie que le prix appliqué (`ACTUALPRICE`) d'un article est supérieur ou égal au prix minimum (`MINPRICE`) valide à la date de la commande. Sinon, une erreur est levée.

---

## Exercice 2 : Tests des Triggers

### Objectif
L'objectif de cet exercice était de tester les triggers créés dans l'exercice 1 pour s'assurer qu'ils fonctionnent correctement.

### Résultats des Tests
1. **Test du Trigger `trg_product_prodid`** :
   - Insertion sans spécifier `PRODID` : Un `PRODID` est généré automatiquement.
   - Insertion avec un `PRODID` spécifié : Le `PRODID` fourni est utilisé.

2. **Test du Trigger `trg_item_itemtot`** :
   - Insertion d'un nouvel article : Le total (`ITEMTOT`) est calculé correctement.
   - Mise à jour de la quantité (`QTY`) : Le total est recalculé.
   - Mise à jour du prix unitaire (`ACTUALPRICE`) : Le total est recalculé.

3. **Test du Trigger `trg_customer_repid`** :
   - Insertion avec un `REPID` valide (`SALESMAN`) : L'insertion réussit.
   - Insertion avec un `REPID` non valide : Une erreur est levée.
   - Mise à jour avec un `REPID` non valide : Une erreur est levée.

4. **Test du Trigger `trg_price_dates`** :
   - Insertion avec des dates valides : L'insertion réussit.
   - Insertion avec une date de fin (`ENDDATE`) nulle : L'insertion réussit.
   - Insertion avec des dates invalides (`STARTDATE > ENDDATE`) : Une erreur est levée.
   - Mise à jour rendant les dates invalides : Une erreur est levée.

5. **Test du Trigger `trg_item_price_check`** :
   - Insertion avec un prix valide (≥ `MINPRICE`) : L'insertion réussit.
   - Insertion avec un prix trop bas (< `MINPRICE`) : Une erreur est levée.
   - Mise à jour rendant le prix invalide : Une erreur est levée.
   - Gestion de plusieurs prix selon la période : Les règles sont respectées en fonction des périodes définies.

---

## Conclusion
Les triggers créés dans l'exercice 1 fonctionnent comme prévu et respectent les règles métier définies. Les tests réalisés dans l'exercice 2 ont permis de valider leur bon fonctionnement dans différents scénarios.
