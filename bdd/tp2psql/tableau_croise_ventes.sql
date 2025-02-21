DECLARE
    -- Type pour stocker les totaux mensuels d'un produit
    TYPE t_mois IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
    -- Type pour stocker tous les produits et leurs ventes mensuelles
    TYPE t_produits IS TABLE OF t_mois INDEX BY VARCHAR2(50);
    
    -- Variables
    v_produits t_produits;
    v_descrip product.descrip%TYPE;
    v_mois NUMBER;
    v_total NUMBER;
    v_ligne VARCHAR2(200);
    v_max_length NUMBER := 20; -- Longueur maximale pour le nom du produit
    
BEGIN
    -- En-tête des mois
    v_ligne := RPAD('PRODUIT', v_max_length) || ' |';
    FOR i IN 1..12 LOOP
        v_ligne := v_ligne || LPAD(TO_CHAR(i, '00'), 8) || ' |';
    END LOOP;
    
    -- Affichage de l'en-tête
    DBMS_OUTPUT.PUT_LINE(RPAD('-', LENGTH(v_ligne), '-'));
    DBMS_OUTPUT.PUT_LINE(v_ligne);
    DBMS_OUTPUT.PUT_LINE(RPAD('-', LENGTH(v_ligne), '-'));
    
    -- Collecte des données
    FOR r_vente IN (
        SELECT 
            p.descrip,
            EXTRACT(MONTH FROM o.orderdate) as mois,
            SUM(i.qty * i.actualprice) as total_ventes
        FROM 
            product p
            JOIN item i ON p.prodid = i.prodid
            JOIN ord o ON i.ordid = o.ordid
        GROUP BY 
            p.descrip,
            EXTRACT(MONTH FROM o.orderdate)
        ORDER BY 
            p.descrip,
            EXTRACT(MONTH FROM o.orderdate)
    ) LOOP
        -- Initialisation du tableau pour un nouveau produit si nécessaire
        IF NOT v_produits.EXISTS(r_vente.descrip) THEN
            v_produits(r_vente.descrip) := t_mois();
            -- Initialisation de tous les mois à 0
            FOR i IN 1..12 LOOP
                v_produits(r_vente.descrip)(i) := 0;
            END LOOP;
        END IF;
        
        -- Stockage du total des ventes pour ce mois
        v_produits(r_vente.descrip)(r_vente.mois) := r_vente.total_ventes;
    END LOOP;
    
    -- Affichage des données
    v_descrip := v_produits.FIRST;
    WHILE v_descrip IS NOT NULL LOOP
        -- Préparation de la ligne
        v_ligne := RPAD(SUBSTR(v_descrip, 1, v_max_length), v_max_length) || ' |';
        
        -- Ajout des totaux mensuels
        FOR i IN 1..12 LOOP
            v_ligne := v_ligne || 
                      LPAD(NVL(TO_CHAR(ROUND(v_produits(v_descrip)(i), 2), '9999.99'), '    0.00'), 8) || 
                      ' |';
        END LOOP;
        
        -- Affichage de la ligne
        DBMS_OUTPUT.PUT_LINE(v_ligne);
        DBMS_OUTPUT.PUT_LINE(RPAD('-', LENGTH(v_ligne), '-'));
        
        -- Passage au produit suivant
        v_descrip := v_produits.NEXT(v_descrip);
    END LOOP;

END;
/
