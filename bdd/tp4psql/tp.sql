-----   TP 4 Analyse de données avec SQL (2) - fonctions Analytiques ----

-- Jeu de données pour le TP:
create table bricks (
  brick_id integer,
  colour   varchar2(10),
  shape    varchar2(10),
  weight   integer
);

insert into bricks values ( 1, 'blue', 'cube', 1 );
insert into bricks values ( 2, 'blue', 'pyramid', 2 );
insert into bricks values ( 3, 'red', 'cube', 1 );
insert into bricks values ( 4, 'red', 'cube', 2 );
insert into bricks values ( 5, 'red', 'pyramid', 3 );
insert into bricks values ( 6, 'green', 'pyramid', 1 );

commit;

--  1. clause over permet de rajouter l'agrégat global aux attributs dans le SELECT (sans group by)
select B.*, count(*) over () from bricks;

-- 2. clause over combinée à Partition By permet de rajouter l'agrégat différencié par partition
select b.*,
       count(*) over (
         partition by colour
       ) bricks_per_colour,
       sum ( weight ) over (
         partition by colour
       ) weight_per_colour
from   bricks b;

-- 3. clause over combinée à Order By retourne des valeurs cumulatives de l'agrégat
select b.*,
       count(*) over (
         order by brick_id
       ) running_total,
       sum ( weight ) over (
         order by brick_id
       ) running_weight
from   bricks b;

-- 4. clause over, partition et order combinées permet d'appliquer l'agrégat cumulatif par partition
select b.*,
       count(*) over (
         partition by colour
         order by brick_id
       ) running_total,
       sum ( weight ) over (
         partition by colour
         order by brick_id
       ) running_weight
from   bricks b;

-- 5. Fenêtre glissante : applique un agrégat cumulatif entre les k valeurs précédentes et/ou k' suivantes la valeur du tuple en cours
select b.*,
       sum ( weight ) over (
         order by weight
         rows between 1 preceding and current row
       ) running_row_weight,
       sum ( weight ) over (
         order by weight
         range between 1 preceding and current row
       ) running_value_weight
from   bricks b
order  by weight, brick_id;

-- 6. Fenêtre glissante avant et après selon l'ordre défini
select b.*,
       sum ( weight ) over (
         order by weight
         rows between 1 preceding and 1 following
       ) sliding_row_window,
       sum ( weight ) over (
         order by weight
         range between 1 preceding and 1 following
       ) sliding_value_window
from   bricks b
order  by weight;

-- 7.a Filrage selon une fonction agrégat (le truc est l'usage de sous-requetes dans le FROM)
select * from (
  select b.*,
         count(*) over ( partition by colour ) colour_count
  from   bricks b
)
where  colour_count >= 2;

-- peut s'écrire aussi avec la clause with :
with tmp as (select b.*,
count(*) over ( partition by colour ) colour_count
select * from tmp
where  colour_count >= 2;

-- 7.b Quelle difference avec la clause Having ? exemple:
select colour from bricks
group  by colour
having count(*) >= 2;

-- 8. clause over avec la fonction rank (rank: numéro avec exhequos et saut, dense_rank: idem mais sans saut; rank_number: numéro différent même si valeurs exhequo)
select brick_id, weight,
       row_number() over ( order by weight ) rn,
       rank() over ( order by weight ) rk,
       dense_rank() over ( order by weight ) dr
from   bricks;

-- 9. fonction LAG (avant)), LEAD (après) d'un attribut selon l'ordre d'un autre attribut:
select b.*,
       lag ( shape ) over ( order by brick_id ) prev_shape,
       lead ( shape ) over ( order by brick_id ) next_shape
from   bricks b;

-- 10. FIRST et LAST (même principe que LAG et LEAD) :
select b.*,
       first_value ( weight ) over ( order by brick_id ) first_weight_by_id,
       last_value ( weight ) over ( order by brick_id ) last_weight_by_id
from   bricks b;

-- NTILE et PERCENT_RANK :
SELECT last_name, salary, NTILE(4) OVER (ORDER BY salary DESC) AS quartile
  FROM employees
  WHERE department_id = 100
  ORDER BY last_name, salary, quartile;

LAST_NAME                     SALARY   QUARTILE
------------------------- ---------- ----------
Chen                            8200          2
Faviet                          9000          1
Greenberg                      12008          1
Popp                            6900          4
Sciarra                         7700          3
Urman                           7800          2

--
SELECT department_id, last_name, salary, PERCENT_RANK()
       OVER (PARTITION BY department_id ORDER BY salary DESC) AS pr
  FROM employees
  ORDER BY pr, salary, last_name;

DEPARTMENT_ID LAST_NAME                     SALARY         PR
------------- ------------------------- ---------- ----------
           10 Whalen                          4400          0
           40 Mavris                          6500          0
              Grant                           7000          0
. . .
           80 Vishney                        10500 .181818182
           80 Zlotkey                        10500 .181818182
           30 Khoo                            3100         .2
. . .
           50 Markle                          2200 .954545455
           50 Philtanker                      2200 .954545455
           50 Olson                           2100          1
. . .
-- extrait du tutoriel SQL Functions sous Live SQL: https://livesql.oracle.com/apex/livesql/file/tutorial_GNRYA4548AQNXC0S04DXVEV08.html
-- et de la doc Oracle: https://docs.oracle.com/en/database/oracle/oracle-database/18/sqlrf/PERCENT_RANK.html#GUID-66A868F5-9EBA-482A-BF8C-09300B9EE165