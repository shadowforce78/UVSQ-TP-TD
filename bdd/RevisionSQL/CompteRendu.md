# Compte Rendu - TP Révision SQL

## 1. Requêtes SQL demandées

### a) Projection
```sql
SELECT ename, job, sal FROM emp;
```

### b) Sélection
```sql
SELECT * FROM emp WHERE deptno = 30;
```

### c) Jointure
```sql
SELECT e.ename, e.job, d.dname 
FROM emp e 
JOIN dept d ON e.deptno = d.deptno;
```

---

## 2. Jointure avec requêtes imbriquées

### Exemple valide (semi-jointure)
```sql
SELECT ename FROM emp WHERE deptno IN (SELECT deptno FROM dept WHERE dname = 'SALES');
```

### Contre-exemple (jointure plus adaptée)
```sql
SELECT e.ename, d.dname 
FROM emp e 
JOIN dept d ON e.deptno = d.deptno;
```

---

## 3. Trier les employés par département (croissant) et salaire (décroissant)
```sql
SELECT d.dname, e.ename, e.job, e.sal 
FROM emp e 
JOIN dept d ON e.deptno = d.deptno 
ORDER BY e.deptno ASC, e.sal DESC;
```

---

## 4. Employés gagnant plus que le salaire moyen
```sql
SELECT ename, job, sal FROM emp WHERE sal > (SELECT AVG(sal) FROM emp);
```

---

## 5. Employés gagnant plus qu'un employé du département 30
```sql
SELECT ename, job, sal FROM emp WHERE sal > ANY (SELECT sal FROM emp WHERE deptno = 30);
```
```sql
SELECT ename, job, sal FROM emp WHERE sal > (SELECT MIN(sal) FROM emp WHERE deptno = 30);
```

---

## 6. Employés gagnant plus que tous les employés du département 30
```sql
SELECT ename, job, sal FROM emp WHERE sal > ALL (SELECT sal FROM emp WHERE deptno = 30);
```
```sql
SELECT ename, job, sal FROM emp WHERE sal > (SELECT MAX(sal) FROM emp WHERE deptno = 30);
```

---

## 7. Employés gagnant plus que la moyenne de leur département
```sql
SELECT e1.ename, e1.sal, e1.deptno 
FROM emp e1 
WHERE e1.sal > (SELECT AVG(e2.sal) FROM emp e2 WHERE e1.deptno = e2.deptno);
```

---

## 8. Employés gagnant plus que leur manager
```sql
SELECT e1.ename, e1.sal FROM emp e1 
JOIN emp e2 ON e1.mgr = e2.empno 
WHERE e1.sal > e2.sal;
```
```sql
SELECT ename FROM emp WHERE sal > (SELECT sal FROM emp WHERE empno = mgr);
```

---

## 9. Départements avec ou sans employés
```sql
SELECT d.dname, e.ename FROM dept d 
LEFT JOIN emp e ON d.deptno = e.deptno;
```

---

## 10. Moyenne des salaires annuels par poste (>2 employés)
```sql
SELECT job, AVG(sal) * 12 AS salaire_annuel_moyen 
FROM emp 
GROUP BY job 
HAVING COUNT(*) > 2;
```

---

## 11. Emplois avec un salaire moyen supérieur aux managers
```sql
SELECT job FROM emp 
GROUP BY job 
HAVING AVG(sal) > (SELECT AVG(sal) FROM emp WHERE job = 'MANAGER');