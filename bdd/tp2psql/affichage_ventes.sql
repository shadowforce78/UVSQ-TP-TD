DECLARE
    -- Variables pour stocker les données du produit courant
    v_prodid_courant product.prodid%TYPE := 0;
    v_descrip_courant product.descrip%TYPE;
    -- Variable pour formater l'affichage
    v_ligne_separation VARCHAR2(50) := '------------------------------------------------';
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_ligne_separation);
    DBMS_OUTPUT.PUT_LINE('RAPPORT DES VENTES MENSUELLES PAR PRODUIT');
    DBMS_OUTPUT.PUT_LINE(v_ligne_separation);

    -- Curseur pour parcourir les résultats
    FOR r_vente IN (
        SELECT 
            p.prodid,
            p.descrip,
            EXTRACT(MONTH FROM o.orderdate) as mois,
            SUM(i.qty * i.actualprice) as total_ventes
        FROM 
            product p
            JOIN item i ON p.prodid = i.prodid
            JOIN ord o ON i.ordid = o.ordid
        GROUP BY 
            p.prodid,
            p.descrip,
            EXTRACT(MONTH FROM o.orderdate)
        ORDER BY 
            p.prodid,
            EXTRACT(MONTH FROM o.orderdate)
    ) LOOP
        -- Si on change de produit, on affiche l'en-tête
        IF v_prodid_courant != r_vente.prodid THEN
            IF v_prodid_courant != 0 THEN
                DBMS_OUTPUT.PUT_LINE(v_ligne_separation);
            END IF;
            DBMS_OUTPUT.PUT_LINE('Produit: ' || r_vente.prodid || ' - ' || r_vente.descrip);
            DBMS_OUTPUT.PUT_LINE(v_ligne_separation);
            v_prodid_courant := r_vente.prodid;
        END IF;

        -- Affichage des ventes pour le mois
        DBMS_OUTPUT.PUT_LINE(
            'Mois ' || 
            LPAD(r_vente.mois, 2, '0') || 
            ': ' || 
            LPAD(TO_CHAR(r_vente.total_ventes, '999999.99'), 12, ' ') || 
            ' €'
        );
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(v_ligne_separation);
END;
/
