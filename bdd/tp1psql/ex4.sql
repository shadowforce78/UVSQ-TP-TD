-- Création de la table clients
DROP TABLE clients;

CREATE TABLE clients (
    no NUMBER PRIMARY KEY,
    nom VARCHAR2(50),
    ventes NUMBER,
    remise NUMBER,
    departement NUMBER
);

-- Insertion de données de test
INSERT INTO clients VALUES (1, 'Martin', 1500, 5, 75);
INSERT INTO clients VALUES (2, 'Dupont', 2500, 8, 92);
INSERT INTO clients VALUES (3, 'Durant', 800, 3, 75);
INSERT INTO clients VALUES (4, 'Bernard', 3000, 10, 91);
INSERT INTO clients VALUES (5, 'Thomas', 1200, 5, 78);
INSERT INTO clients VALUES (6, 'Robert', 2000, 7, 92);

-- Bloc pour la gestion des remises

CREATE OR REPLACE PROCEDURE update_discount(p_client_no IN NUMBER) IS
    v_moyenne_ventes NUMBER;
    v_ventes_client NUMBER;
    v_remise_actuelle NUMBER;
BEGIN
    -- Calcul de la moyenne des ventes
    SELECT AVG(ventes) INTO v_moyenne_ventes
    FROM clients;
    
    -- Récupération des ventes du client spécifié
    SELECT ventes, remise INTO v_ventes_client, v_remise_actuelle
    FROM clients
    WHERE no = p_client_no;
    
    -- Vérification et mise à jour de la remise
    IF v_ventes_client > v_moyenne_ventes THEN
        UPDATE clients
        SET remise = remise * 1.1
        WHERE no = p_client_no;
        
        DBMS_OUTPUT.PUT_LINE('Remise accordée ! La remise passe de ' || 
            v_remise_actuelle || '% à ' || (v_remise_actuelle * 1.1) || '%');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Remise non accordée. Ventes inférieures à la moyenne.');
    END IF;
    
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Client non trouvé.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Une erreur est survenue.');
        ROLLBACK;
END;
/