CREATE OR REPLACE PROCEDURE inserer_employe(
    p_empno    IN emp.empno%TYPE,
    p_ename    IN emp.ename%TYPE,
    p_job      IN emp.job%TYPE,
    p_mgr      IN emp.mgr%TYPE,
    p_hiredate IN emp.hiredate%TYPE,
    p_sal      IN emp.sal%TYPE,
    p_comm     IN emp.comm%TYPE,
    p_deptno   IN emp.deptno%TYPE
) IS
    -- Exceptions personnalisées
    e_invalid_salesman EXCEPTION;
    e_invalid_comm EXCEPTION;
    
    -- Variables de travail
    v_job_upper VARCHAR2(9);
BEGIN
    -- Conversion en majuscules pour la comparaison
    v_job_upper := UPPER(p_job);
    
    -- Vérification des règles métier
    IF v_job_upper = 'SALESMAN' AND p_comm IS NULL THEN
        RAISE e_invalid_salesman;
    END IF;
    
    IF v_job_upper != 'SALESMAN' AND p_comm IS NOT NULL THEN
        RAISE e_invalid_comm;
    END IF;
    
    -- Insertion si les vérifications sont OK
    INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (p_empno, p_ename, p_job, p_mgr, p_hiredate, p_sal, p_comm, p_deptno);
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Employé inséré avec succès.');

EXCEPTION
    WHEN e_invalid_salesman THEN
        DBMS_OUTPUT.PUT_LINE('Erreur: Un SALESMAN doit avoir une commission.');
        ROLLBACK;
        
    WHEN e_invalid_comm THEN
        DBMS_OUTPUT.PUT_LINE('Erreur: Seul un SALESMAN peut avoir une commission.');
        ROLLBACK;
        
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Erreur: Numéro d''employé déjà existant.');
        ROLLBACK;
        
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Erreur: Dépassement de format pour un des champs.');
        ROLLBACK;
        
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur Oracle ' || SQLCODE || ': ' || SQLERRM);
        ROLLBACK;
END inserer_employe;
/

-- Exemples d'utilisation :
SET SERVEROUTPUT ON

-- Test 1: Insertion valide d'un SALESMAN
EXEC inserer_employe(8000, 'DUPONT', 'SALESMAN', 7839, SYSDATE, 2000, 500, 30);

-- Test 2: SALESMAN sans commission (doit échouer)
EXEC inserer_employe(8001, 'MARTIN', 'SALESMAN', 7839, SYSDATE, 2000, NULL, 30);

-- Test 3: CLERK avec commission (doit échouer)
EXEC inserer_employe(8002, 'ROBERT', 'CLERK', 7839, SYSDATE, 2000, 500, 20);

-- Test 4: Dépassement de format nom (doit échouer)
EXEC inserer_employe(8003, 'NOM_TROP_LONG', 'CLERK', 7839, SYSDATE, 2000, NULL, 20);
