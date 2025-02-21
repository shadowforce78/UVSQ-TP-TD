create or replace procedure generer_table_ventes as
   v_sql        varchar2(4000);
   v_cols       varchar2(2000);
   v_insert     varchar2(4000);
   v_col_exists number;
begin
    -- Vérifier si la table existe déjà et la supprimer
   begin
      execute immediate 'DROP TABLE ventes_mensuelles_produits';
   exception
      when others then
         if sqlcode != -942 then -- Si l'erreur n'est pas "table inexistante"
            raise;
         end if;
   end;

    -- Construction de la requête CREATE TABLE
   v_sql := 'CREATE TABLE ventes_mensuelles_produits (
        produit VARCHAR2(50),';
    
    -- Ajout des colonnes pour chaque mois
   for i in 1..12 loop
      v_sql := v_sql
               || 'mois_'
               || lpad(
         i,
         2,
         '0'
      )
               || ' NUMBER(10,2)';
      if i < 12 then
         v_sql := v_sql || ',';
      end if;
   end loop;
   v_sql := v_sql || ')';

    -- Création de la table
   execute immediate v_sql;

    -- Construction de la requête d'insertion
   v_insert := '
    INSERT INTO ventes_mensuelles_produits
    SELECT p.descrip as produit,';
    
    -- Construction des colonnes PIVOT
   for i in 1..12 loop
      v_insert := v_insert
                  || '
        NVL(SUM(CASE WHEN EXTRACT(MONTH FROM o.orderdate) = '
                  || i
                  || ' 
            THEN i.qty * i.actualprice END), 0) as mois_'
                  || lpad(
         i,
         2,
         '0'
      );
      if i < 12 then
         v_insert := v_insert || ',';
      end if;
   end loop;

    -- Complétion de la requête avec les jointures et le regroupement
   v_insert := v_insert || '
    FROM product p
    LEFT JOIN item i ON p.prodid = i.prodid
    LEFT JOIN ord o ON i.ordid = o.ordid
    GROUP BY p.descrip
    ORDER BY p.descrip';

    -- Exécution de l'insertion
   execute immediate v_insert;

    -- Afficher un message de confirmation
   dbms_output.put_line('Table ventes_mensuelles_produits créée et remplie avec succès.');
    
    -- Afficher le nombre de lignes insérées
   execute immediate 'SELECT COUNT(*) FROM ventes_mensuelles_produits'
     into v_col_exists;
   dbms_output.put_line('Nombre de produits traités : ' || v_col_exists);
exception
   when others then
      dbms_output.put_line('Erreur lors de la création de la table : ' || sqlerrm);
      raise;
end;
/

-- Exemple d'utilisation de la procédure
begin
   generer_table_ventes;
end;
/

-- Afficher le contenu de la table créée
select *
  from ventes_mensuelles_produits;