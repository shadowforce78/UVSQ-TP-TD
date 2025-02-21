-- Requête SQL pour le total des ventes par produit et par mois
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
    EXTRACT(MONTH FROM o.orderdate);
