-- Règle 1 : 
CREATE OR REPLACE TRIGGER trg_product_prodid
BEFORE INSERT ON PRODUCT
FOR EACH ROW
BEGIN
    IF :NEW.PRODID IS NULL THEN
        SELECT PRODID.NEXTVAL INTO :NEW.PRODID FROM DUAL;
    END IF;
END;
/

-- Règle 2 :
CREATE OR REPLACE TRIGGER trg_item_itemtot
BEFORE INSERT OR UPDATE OF ACTUALPRICE, QTY ON ITEM
FOR EACH ROW
BEGIN
    :NEW.ITEMTOT := :NEW.ACTUALPRICE * :NEW.QTY;
END;
/

-- Règle 3 :
CREATE OR REPLACE TRIGGER trg_customer_repid
BEFORE INSERT OR UPDATE OF REPID ON CUSTOMER
FOR EACH ROW
DECLARE
    v_job VARCHAR2(9);
BEGIN
    SELECT JOB INTO v_job FROM EMP WHERE EMPNO = :NEW.REPID;
    
    IF v_job != 'SALESMAN' THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le représentant doit être un SALESMAN');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Employé non trouvé avec cet EMPNO');
END;
/

-- Règle 4 :
CREATE OR REPLACE TRIGGER trg_price_dates
BEFORE INSERT OR UPDATE OF STARTDATE, ENDDATE ON PRICE
FOR EACH ROW
BEGIN
    IF :NEW.ENDDATE IS NOT NULL AND :NEW.STARTDATE > :NEW.ENDDATE THEN
        RAISE_APPLICATION_ERROR(-20003, 'La date de début doit être antérieure à la date de fin');
    END IF;
END;
/

-- Règle 5 :
CREATE OR REPLACE TRIGGER trg_item_price_check
BEFORE INSERT OR UPDATE OF ACTUALPRICE, PRODID, ORDID ON ITEM
FOR EACH ROW
DECLARE
    v_min_price NUMBER(8,2);
    v_order_date DATE;
BEGIN
    -- Récupérer la date de la commande
    SELECT ORDERDATE INTO v_order_date FROM ORD WHERE ORDID = :NEW.ORDID;
    
    -- Trouver le prix minimum valide à la date de la commande
    SELECT MIN(MINPRICE) INTO v_min_price
    FROM PRICE
    WHERE PRODID = :NEW.PRODID
    AND STARTDATE <= v_order_date
    AND (ENDDATE >= v_order_date OR ENDDATE IS NULL);
    
    -- Si aucun prix trouvé, on considère qu'il n'y a pas de restriction
    IF v_min_price IS NOT NULL AND :NEW.ACTUALPRICE < v_min_price THEN
        RAISE_APPLICATION_ERROR(-20004, 'Le prix appliqué doit être supérieur ou égal au prix minimum de ' || v_min_price);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        NULL; -- Aucun prix trouvé, on ne fait pas de vérification
END;
/