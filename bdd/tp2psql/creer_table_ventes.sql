CREATE OR REPLACE PROCEDURE generer_table_ventes AS
    v_sql VARCHAR2(4000);
    v_cols VARCHAR2(2000);
    v_insert VARCHAR2(4000);
    v_col_exists NUMBER;
BEGIN
    -- Vérifier si la table existe déjà et la supprimer
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE ventes_mensuelles_produits';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN -- Si l'erreur n'est pas "table inexistante"
                RAISE;
            END IF;
    END;

    -- Construction de la requête CREATE TABLE
    v_sql := 'CREATE TABLE ventes_mensuelles_produits (
        produit VARCHAR2(50),';
    
    -- Ajout des colonnes pour chaque mois
    FOR i IN 1..12 LOOP
        v_sql := v_sql || 'mois_' || LPAD(i, 2, '0') || ' NUMBER(10,2)';
        IF i < 12 THEN
            v_sql := v_sql || ',';
        END IF;
    END LOOP;
    v_sql := v_sql || ')';

    -- Création de la table
    EXECUTE IMMEDIATE v_sql;

    -- Construction de la requête d'insertion
    v_insert := '
    INSERT INTO ventes_mensuelles_produits
    SELECT p.descrip as produit,';
    
    -- Construction des colonnes PIVOT
    FOR i IN 1..12 LOOP
        v_insert := v_insert || '
        NVL(SUM(CASE WHEN EXTRACT(MONTH FROM o.orderdate) = ' || i || ' 
            THEN i.qty * i.actualprice END), 0) as mois_' || LPAD(i, 2, '0');
        IF i < 12 THEN
            v_insert := v_insert || ',';
        END IF;
    END LOOP;

    -- Complétion de la requête avec les jointures et le regroupement
    v_insert := v_insert || '
    FROM product p
    LEFT JOIN item i ON p.prodid = i.prodid
    LEFT JOIN ord o ON i.ordid = o.ordid
    GROUP BY p.descrip
    ORDER BY p.descrip';

    -- Exécution de l'insertion
    EXECUTE IMMEDIATE v_insert;

    -- Afficher un message de confirmation
    DBMS_OUTPUT.PUT_LINE('Table ventes_mensuelles_produits créée et remplie avec succès.');
    
    -- Afficher le nombre de lignes insérées
    EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ventes_mensuelles_produits' INTO v_col_exists;
    DBMS_OUTPUT.PUT_LINE('Nombre de produits traités : ' || v_col_exists);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur lors de la création de la table : ' || SQLERRM);
        RAISE;
END;
/

-- Exemple d'utilisation de la procédure
BEGIN
    generer_table_ventes;
END;
/

-- Afficher le contenu de la table créée
SELECT * FROM ventes_mensuelles_produits;
