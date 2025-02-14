SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE update_salary(p_ename IN VARCHAR2) IS
    v_current_sal EMP.SAL%TYPE;
    v_job EMP.JOB%TYPE;
    v_avg_sal EMP.SAL%TYPE;
    v_new_sal EMP.SAL%TYPE;
BEGIN
    -- Récupérer le salaire actuel et le job de l'employé
    SELECT SAL, JOB INTO v_current_sal, v_job
    FROM EMP
    WHERE ENAME = UPPER(p_ename);
    
    DBMS_OUTPUT.PUT_LINE('Salaire actuel de ' || p_ename || ': ' || v_current_sal);
    
    -- Calculer le salaire moyen pour le même job
    SELECT AVG(SAL) INTO v_avg_sal
    FROM EMP
    WHERE JOB = v_job;
    
    DBMS_OUTPUT.PUT_LINE('Salaire moyen pour le poste ' || v_job || ': ' || v_avg_sal);
    
    -- Déterminer le nouveau salaire
    IF v_current_sal >= v_avg_sal THEN
        v_new_sal := v_current_sal * 1.1; -- Augmentation de 10%
    ELSE
        v_new_sal := v_avg_sal; -- Attribution du salaire moyen
    END IF;
    
    -- Mettre à jour le salaire
    UPDATE EMP
    SET SAL = v_new_sal
    WHERE ENAME = UPPER(p_ename);
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Nouveau salaire de ' || p_ename || ': ' || v_new_sal);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employé non trouvé: ' || p_ename);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Une erreur est survenue: ' || SQLERRM);
        ROLLBACK;
END;