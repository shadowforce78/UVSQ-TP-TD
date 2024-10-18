

-- Initialisation de la base
-- suppression de la base si elle existe


drop table lecture;
drop table message;
drop table moderateur;
drop table groupe;
drop sequence idm;
drop trigger clemsgnewsgroup;

-- creation des tables

create table groupe(
idgroupe number primary key,
nomgroupe varchar(30));

create table moderateur(
idgroupe number references groupe(idgroupe),
mod varchar(10),
primary key (idgroupe,mod));

create table message(
idmessage number  primary key,
titre varchar(50) not null,
datemsg timestamp default sysdate,
auteur varchar(10)  default user,
texte varchar(250) not null,
idgroupe number not null references groupe(idgroupe),
msgpere number references message(idmessage) on delete cascade );

create table lecture(
idmessage number  references message(idmessage) on delete cascade,
datelecture timestamp default sysdate,
lecteur varchar(10)  default user,
primary key (idmessage,lecteur));

-- incrementation automatique des numeros de messages
-- Vous aurez plus tard des cours sur les sequences et triggers. 

create sequence idm start with 1;

create trigger clemsgnewsgroup  
before insert on message 
for each row begin
select idm.nextval into :new.idmessage  from dual;
end;
/


-- Definition des groupes

insert into groupe values (0,'Global');
insert into groupe values (1,'Projet BD');
insert into groupe values (2,'DUT info 1 / groupe A');
insert into groupe values (3,'DUT info 1 / groupe B');
insert into groupe values (4,'DUT info 1 / groupe C');
insert into groupe values (5,'DUT info 1 / groupe D');
insert into groupe values (6,'Jeux');
insert into groupe values (7,'Cinema');
insert into groupe values (8,'BD');
commit;


-- Definition des moderateurs
insert into moderateur values (0,'LOYER');
insert into moderateur values (1,'LOYER');
insert into moderateur values (6,'USER1');
insert into moderateur values (7,'USER1');
insert into moderateur values (8,'USER2');
insert into moderateur values (6,'USER7');
insert into moderateur values (4,'LOYER');
commit;

-- Insertion de messages

insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('Projet BD S1',to_date('12/09/20','dd/mm/yy'),'LOYER','Le projet portera sur un programme incluant du SQL. Il se terminera par une soutenance.',1,null);
insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('Projet BD S2',to_date('12/09/20','dd/mm/yy'),'LOYER','Le projet consistera à developper une interface graphique d interaction avec une base de donnees. Il se terminera par une soutenance.',1,null);
insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('Utilisation de ce forum',to_date('28/08/20','dd/mm/yy'),'LOYER','Ce forum sert de base a des TP. Les messages doivent rester corrects.',0,null);

insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('Re: Projet BD S1',to_date('12/09/20','dd/mm/yy'),'USER4','Quand aura lieu la soutenance ?',1,1);
insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('Re: Projet BD S1',to_date('14/09/20','dd/mm/yy'),'USER8','On doit le faire seul ou en groupes ?',1,1);
insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('Re: Projet BD S1',to_date('13/09/20','dd/mm/yy'),'LOYER','en janvier.',1,4);
insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('Re: Projet BD S1',to_date('16/09/20','dd/mm/yy'),'USER4','OK, merci.',1,6);
insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('Re: Projet BD S1',to_date('16/09/20','dd/mm/yy'),'LOYER','en binomes.',1,5);

insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('Finale LoL',current_date,'USER8','Qui a suivi la finale cette annee ?',6,null);
insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('Finale LoL 2020',current_date,'USER43','Qui a gagne ?',6,10);
insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('Meilleurs jeux de cette annee',current_date,'USER88','On fait un classement ?',6,null);

insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('Quelle BD avez-vous lues ce mois-ci ?',current_date,'USER98','Avez-vous des nouveautés à me conseiller ?',8,null);
insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('ici, BD = bases de donnees',current_date,'USER88','Je crois que tu te trompe de groupe de discussion...',8,12);
insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('ici, BD = bases de donnees',current_date,'USER56','malheureusement...',8,13);

insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('Re: Projet BD S1',current_date,'USER33','heureusement...',1,8);
insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('Re: Projet BD S1',current_date,'USER4','tranquille...',1,6);
insert into message(titre,datemsg,auteur,texte,idgroupe,msgpere) 
	values ('Re: Projet BD S1',current_date,'USER8','Ouais, large...',1,16);

insert into lecture values (1,current_date,'USER4');
insert into lecture values (1,current_date,'USER6');
insert into lecture values (1,current_date,'USER7');
insert into lecture values (1,current_date,'USER8');
insert into lecture values (2,current_date,'USER5');
insert into lecture values (2,current_date,'USER4');
insert into lecture values (2,current_date,'USER6');
insert into lecture values (2,current_date,'USER7');
insert into lecture values (2,current_date,'USER8');
insert into lecture values (3,current_date,'USER1');
insert into lecture values (3,current_date,'USER4');
insert into lecture values (3,current_date,'USER6');
insert into lecture values (3,current_date,'USER7');
insert into lecture values (3,current_date,'USER8');
insert into lecture values (3,current_date,'LOYER');
insert into lecture values (3,current_date,'USER43');
insert into lecture values (3,current_date,'USER61');
insert into lecture values (3,current_date,'USER73');
insert into lecture values (3,current_date,'USER85');
insert into lecture values (4,current_date,'LOYER');
insert into lecture values (4,current_date,'USER4');
insert into lecture values (4,current_date,'USER6');
insert into lecture values (4,current_date,'USER7');
insert into lecture values (4,current_date,'USER8');
insert into lecture values (6,current_date,'USER4');
insert into lecture values (6,current_date,'USER6');
insert into lecture values (6,current_date,'USER7');
insert into lecture values (6,current_date,'USER8');
insert into lecture values (5,current_date,'LOYER');
insert into lecture values (9,current_date,'USER13');
insert into lecture values (9,current_date,'USER43');
insert into lecture values (9,current_date,'USER14');
insert into lecture values (8,current_date,'USER6');
insert into lecture values (11,current_date,'USER56');
insert into lecture values (11,current_date,'USER88');
insert into lecture values (11,current_date,'USER53');
insert into lecture values (11,current_date,'USER62');
insert into lecture values (11,current_date,'USER26');
insert into lecture values (11,current_date,'USER28');
insert into lecture values (11,current_date,'USER33');
insert into lecture values (11,current_date,'USER22');
insert into lecture values (12,current_date,'USER53');
insert into lecture values (12,current_date,'USER62');
insert into lecture values (12,current_date,'USER26');
insert into lecture values (12,current_date,'USER28');
insert into lecture values (12,current_date,'USER33');
insert into lecture values (13,current_date,'USER62');
insert into lecture values (13,current_date,'USER26');
insert into lecture values (13,current_date,'USER28');
insert into lecture values (13,current_date,'USER33');
insert into lecture values (16,current_date,'USER8');
insert into lecture values (16,current_date,'USER4');
insert into lecture values (16,current_date,'USER6');

commit;