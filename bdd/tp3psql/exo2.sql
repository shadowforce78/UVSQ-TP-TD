-- Test règle 1 :
-- Test 1.1: Insertion sans spécifier PRODID
INSERT INTO PRODUCT (DESCRIP) VALUES ('NOUVELLE RAQUETTE DE TENNIS');
-- Vérification
SELECT * FROM PRODUCT WHERE DESCRIP = 'NOUVELLE RAQUETTE DE TENNIS';
-- Doit montrer un PRODID auto-généré (200381 ou suivant)

-- Test 1.2: Insertion en spécifiant PRODID
INSERT INTO PRODUCT (PRODID, DESCRIP) VALUES (999999, 'RAQUETTE TEST');
-- Vérification
SELECT * FROM PRODUCT WHERE PRODID = 999999;
-- Doit montrer le PRODID spécifié manuellement

-- Test règle 2 : 
-- Test 2.1: Insertion nouvelle ligne dans ITEM
INSERT INTO ITEM (ORDID, ITEMID, PRODID, ACTUALPRICE, QTY) 
VALUES (610, 4, '100890', 58, 2);
-- Vérification
SELECT ITEMTOT FROM ITEM WHERE ORDID = 610 AND ITEMID = 4;
-- Doit afficher 116 (58 * 2)

-- Test 2.2: Mise à jour de la quantité
UPDATE ITEM SET QTY = 3 WHERE ORDID = 610 AND ITEMID = 4;
-- Vérification
SELECT ITEMTOT FROM ITEM WHERE ORDID = 610 AND ITEMID = 4;
-- Doit afficher 174 (58 * 3)

-- Test 2.3: Mise à jour du prix
UPDATE ITEM SET ACTUALPRICE = 60 WHERE ORDID = 610 AND ITEMID = 4;
-- Vérification
SELECT ITEMTOT FROM ITEM WHERE ORDID = 610 AND ITEMID = 4;
-- Doit afficher 180 (60 * 3)

-- Test règle 3 : 
-- Test 3.1: Insertion avec REPID valide (SALESMAN)
-- 7499 est un SALESMAN (ALLEN)
INSERT INTO CUSTOMER (CUSTID, NAME, REPID) VALUES (999, 'TEST CLIENT', 7499);
-- Doit fonctionner

-- Test 3.2: Insertion avec REPID non valide (CLERK)
-- 7369 est un CLERK (SMITH)
BEGIN
    INSERT INTO CUSTOMER (CUSTID, NAME, REPID) VALUES (998, 'TEST CLIENT INVALIDE', 7369);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur attendue: ' || SQLERRM);
END;
/
-- Doit échouer avec le message d'erreur sur SALESMAN

-- Test 3.3: Mise à jour avec REPID non valide
-- 7902 est un ANALYST (FORD)
BEGIN
    UPDATE CUSTOMER SET REPID = 7902 WHERE CUSTID = 999;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur attendue: ' || SQLERRM);
END;
/
-- Doit échouer avec le message d'erreur sur SALESMAN

-- Test règle 4 :
-- Test 4.1: Insertion avec dates valides (STARTDATE < ENDDATE)
INSERT INTO PRICE (PRODID, STDPRICE, MINPRICE, STARTDATE, ENDDATE)
VALUES ('100860', 40, 32, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'), TO_DATE('31-DEC-2023', 'DD-MON-YYYY'));
-- Doit fonctionner

-- Test 4.2: Insertion avec ENDDATE null
INSERT INTO PRICE (PRODID, STDPRICE, MINPRICE, STARTDATE)
VALUES ('100860', 42, 34, TO_DATE('01-JAN-2024', 'DD-MON-YYYY'));
-- Doit fonctionner

-- Test 4.3: Insertion avec dates invalides (STARTDATE > ENDDATE)
BEGIN
    INSERT INTO PRICE (PRODID, STDPRICE, MINPRICE, STARTDATE, ENDDATE)
    VALUES ('100860', 38, 30, TO_DATE('01-JAN-2025', 'DD-MON-YYYY'), TO_DATE('31-DEC-2024', 'DD-MON-YYYY'));
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur attendue: ' || SQLERRM);
END;
/
-- Doit échouer avec le message d'erreur sur les dates

-- Test 4.4: Mise à jour rendant les dates invalides
BEGIN
    UPDATE PRICE 
    SET ENDDATE = TO_DATE('31-DEC-2022', 'DD-MON-YYYY')
    WHERE PRODID = '100860' AND STARTDATE = TO_DATE('01-JAN-2023', 'DD-MON-YYYY');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur attendue: ' || SQLERRM);
END;
/
-- Doit échouer avec le message d'erreur sur les dates


-- Test règle 5 : 
-- D'abord, créons un prix de référence pour les tests
INSERT INTO PRICE (PRODID, STDPRICE, MINPRICE, STARTDATE)
VALUES ('200381', 50, 40, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'));

-- Créons aussi une commande de test
INSERT INTO ORD (ORDID, ORDERDATE, CUSTID) 
VALUES (999, TO_DATE('15-JAN-2023', 'DD-MON-YYYY'), 100);

-- Test 5.1: Insertion avec prix valide (>= min price)
INSERT INTO ITEM (ORDID, ITEMID, PRODID, ACTUALPRICE, QTY)
VALUES (999, 1, '200381', 45, 1);
-- Doit fonctionner (45 >= 40)

-- Test 5.2: Insertion avec prix trop bas
BEGIN
    INSERT INTO ITEM (ORDID, ITEMID, PRODID, ACTUALPRICE, QTY)
    VALUES (999, 2, '200381', 35, 1);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur attendue: ' || SQLERRM);
END;
/
-- Doit échouer avec le message sur le prix minimum (40)

-- Test 5.3: Mise à jour rendant le prix invalide
BEGIN
    UPDATE ITEM SET ACTUALPRICE = 38 WHERE ORDID = 999 AND ITEMID = 1;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur attendue: ' || SQLERRM);
END;
/
-- Doit échouer avec le message sur le prix minimum (40)

-- Test 5.4: Cas avec plusieurs prix selon la période
-- Ajoutons un autre prix pour la même période
INSERT INTO PRICE (PRODID, STDPRICE, MINPRICE, STARTDATE, ENDDATE)
VALUES ('200381', 60, 50, TO_DATE('01-FEB-2023', 'DD-MON-YYYY'), TO_DATE('28-FEB-2023', 'DD-MON-YYYY'));

-- Créons une commande en février
INSERT INTO ORD (ORDID, ORDERDATE, CUSTID) 
VALUES (998, TO_DATE('15-FEB-2023', 'DD-MON-YYYY'), 100);

-- Test avec le nouveau prix minimum (50)
BEGIN
    INSERT INTO ITEM (ORDID, ITEMID, PRODID, ACTUALPRICE, QTY)
    VALUES (998, 1, '200381', 45, 1);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur attendue: ' || SQLERRM);
END;
/
-- Doit échouer car 45 < 50 (nouveau min price en février)

-- Test avec prix valide pour février
INSERT INTO ITEM (ORDID, ITEMID, PRODID, ACTUALPRICE, QTY)
VALUES (998, 1, '200381', 55, 1);
-- Doit fonctionner (55 >= 50)