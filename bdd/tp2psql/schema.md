# Schéma Entité/Association de la Base de Données

## Entités

### EMPLOYEE (EMP)
- **empno** (clé primaire)
- ename
- job
- mgr (clé étrangère vers EMPLOYEE)
- hiredate
- sal
- comm
- deptno (clé étrangère vers DEPARTMENT)

### DEPARTMENT (DEPT)
- **deptno** (clé primaire)
- dname
- loc

### BONUS
- ename
- job
- sal
- comm

### SALGRADE
- **grade** (clé primaire)
- losal
- hisal

### CUSTOMER
- **custid** (clé primaire)
- name
- address
- city
- state
- zip
- area
- phone
- repid (clé étrangère vers EMPLOYEE)
- creditlimit
- comments

### ORDER (ORD)
- **ordid** (clé primaire)
- orderdate
- commplan
- custid (clé étrangère vers CUSTOMER)
- shipdate
- total

### ITEM
- **ordid, itemid** (clé primaire composite)
- prodid (clé étrangère vers PRODUCT)
- actualprice
- qty
- itemtot
- ordid (clé étrangère vers ORDER)

### PRODUCT
- **prodid** (clé primaire)
- descrip

### PRICE
- prodid (clé étrangère vers PRODUCT)
- stdprice
- minprice
- startdate
- enddate

## Relations

1. **EMPLOYEE - DEPARTMENT** (N:1)
   - Un employé appartient à un seul département
   - Un département peut avoir plusieurs employés

2. **EMPLOYEE - EMPLOYEE** (N:1)
   - Un employé peut être manager de plusieurs employés
   - Un employé a au plus un manager

3. **CUSTOMER - EMPLOYEE** (N:1)
   - Un client est géré par un représentant (employé)
   - Un employé peut gérer plusieurs clients

4. **ORDER - CUSTOMER** (N:1)
   - Un client peut passer plusieurs commandes
   - Une commande appartient à un seul client

5. **ITEM - ORDER** (N:1)
   - Une commande peut contenir plusieurs articles
   - Un article appartient à une seule commande

6. **ITEM - PRODUCT** (N:1)
   - Un produit peut apparaître dans plusieurs articles
   - Un article concerne un seul produit

7. **PRICE - PRODUCT** (N:1)
   - Un produit peut avoir plusieurs prix (historique)
   - Un prix correspond à un seul produit

## Contraintes particulières

1. `custid > 0` sur CUSTOMER
2. `total >= 0` sur ORDER
3. Index sur PRICE(prodid, startdate)
4. Séquences auto-incrémentées pour:
   - ordid (commence à 622)
   - prodid (commence à 200381)
   - custid (commence à 109)
