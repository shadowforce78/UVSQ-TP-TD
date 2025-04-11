
------ TP5 - Analyse de données avec SQL (1) -----

-- Ce n'est pas un TP à proprement dit, mais des exemples à tester pour comprendre ces nouvelles requetes. Vous pouvez commenter chaque exemple et le garder pour vous.


-- jeu de données pour le TP :
create table match_results (
  match_date       date,
  location         varchar2(20),
  home_team_name   varchar2(20),
  away_team_name   varchar2(20),
  home_team_points integer,
  away_team_points integer
);

insert into match_results values ( date'2018-01-01', 'Snowley', 'Underrated United', 'Terrible Town', 2, 0 );
insert into match_results values ( date'2018-01-01', 'Coldgate', 'Average Athletic', 'Champions City', 1, 4 );
insert into match_results values ( date'2018-02-01', 'Dorwall', 'Terrible Town', 'Average Athletic', 0, 1 );
insert into match_results values ( date'2018-03-01', 'Coldgate', 'Average Athletic', 'Underrated United', 3, 3 );
insert into match_results values ( date'2018-03-02', 'Newdell', 'Champions City', 'Terrible Town', 8, 0 );

commit;

-- 1. Afficher la table, puis le nombre de matchs par endroit

-- 2. Pivotage "manuel" (contournement en utilisant case) :
select count ( case when location = 'Snowley' then 1 end ) snowley,
       count ( case when location = 'Coldgate' then 1 end ) coldgate,
       count ( case when location = 'Dorwall' then 1 end ) dorwall,
       count ( case when location = 'Newdell' then 1 end ) newdell
from   match_results;

-- 3. avec PIVOT :
select * from (
  select location from match_results
)
  pivot (
    count(*) for location in (
      'Snowley', 'Coldgate', 'Dorwall', 'Newdell'
    )
  )
  
-- peut s'écrire aussi :
with rws as (
  select location from match_results
)
  select * from rws
  pivot (
    count(*) for location in (
      'Snowley', 'Coldgate', 'Dorwall', 'Newdell'
    )
  );
  
-- 4. la clause UNPIVOT - l'inverse de PIVOT

select match_date, location, home_or_away, team
from   match_results
unpivot (
  team for home_or_away in (
    home_team_name as 'HOME', away_team_name as 'AWAY'
  )
)
order  by match_date, location, home_or_away;
  
-- cf. https://livesql.oracle.com/apex/livesql/file/tutorial_GNZ3LQPJ0K6RTD1NEEPNRQT0R.html

-- jeu de données pour la suite du TP :
create table bricks (
  colour varchar2(10),
  shape  varchar2(10),
  weight integer
);

insert into bricks values ( 'red', 'cube', 1 );
insert into bricks values ( 'red', 'pyramid', 2 );
insert into bricks values ( 'red', 'cuboid', 1 );

insert into bricks values ( 'blue', 'cube', 1 );
insert into bricks values ( 'blue', 'pyramid', 2 );

insert into bricks values ( 'green', 'cube', 3 );

commit;

-- 5. statistiques descriptives :
select sum ( weight ), min ( weight ), max ( weight ),
       avg ( weight ), stddev ( weight ),
       median ( weight ), variance ( weight ),
       stats_mode ( weight )
from   bricks;

--  6. Clause ROLLUP (ajout d'agrégats dans le passage d'un groupe à l'autres et globaux tq des sous-totaux) :
select colour, shape, count (*)
from   bricks
group  by rollup ( colour, shape );

-- 7. exemple de rollup partiel (sur 1 seul attribut) :
select colour, shape, count (*)
from   bricks
group  by colour, rollup ( shape );

-- 8. Clause CUBE  : calcul les agrégats partiels selon toutes les combinaisons de valeurs d'attributs et leur nombre
select colour, shape, count (*)
from   bricks
group  by cube ( colour, shape );

--------------

