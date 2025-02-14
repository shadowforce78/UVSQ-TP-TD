CREATE OR REPLACE PROCEDURE augmenter_commission(p_nombre_clients IN NUMBER) IS
BEGIN
    -- Création d'une table temporaire
    EXECUTE IMMEDIATE 'CREATE GLOBAL TEMPORARY TABLE top_clients (
        empno NUMBER(4)
    ) ON COMMIT PRESERVE ROWS';

    -- Insertion des N plus gros vendeurs
    INSERT INTO top_clients
    SELECT empno
    FROM (
        SELECT empno
        FROM emp
        WHERE comm IS NOT NULL
        ORDER BY (sal + NVL(comm, 0)) DESC
    ) WHERE ROWNUM <= p_nombre_clients;

    -- Mise à jour des commissions
    UPDATE emp
    SET comm = comm * 1.1
    WHERE empno IN (SELECT empno FROM top_clients);

    -- Affichage des résultats
    DBMS_OUTPUT.PUT_LINE('Employés dont la commission a été augmentée :');
    FOR emp_rec IN (
        SELECT ename, sal, comm
        FROM emp
        WHERE empno IN (SELECT empno FROM top_clients)
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(emp_rec.ename || ': Salaire=' || emp_rec.sal || ', Commission=' || emp_rec.comm);
    END LOOP;

    -- Nettoyage
    EXECUTE IMMEDIATE 'DROP TABLE top_clients';
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        -- En cas d'erreur, on essaie de nettoyer la table temporaire
        EXECUTE IMMEDIATE 'DROP TABLE top_clients';
        RAISE_APPLICATION_ERROR(-20001, 'Erreur lors de l''augmentation des commissions: ' || SQLERRM);
END augmenter_commission;
/

-- Exemple d'utilisation :
SET SERVEROUTPUT ON
EXEC augmenter_commission(3);
