-- Script Projbld.sql Version 2022 BUT1 Info --

alter session set nls_date_language = english;
alter session set nls_numeric_characters = '. ';

drop table emp;
drop table dept;
drop table salgrade;
drop table item;
drop table price;
drop table product;
drop table ord;
drop table customer;
drop sequence ordid;
drop sequence custid;
drop sequence prodid;

drop table emp;
drop table dept;
drop table bonus;
drop table salgrade;
drop table dummy;

create table emp (
   empno    number(4) not null,
   ename    varchar2(10),
   job      varchar2(9),
   mgr      number(4),
   hiredate date,
   sal      number(7,2),
   comm     number(7,2),
   deptno   number(2)
);

insert into emp values ( 7369,
                         'SMITH',
                         'CLERK',
                         7902,
                         to_date('17-DEC-1980','DD-MON-YYYY'),
                         800,
                         null,
                         20 );
insert into emp values ( 7499,
                         'ALLEN',
                         'SALESMAN',
                         7698,
                         to_date('20-FEB-1981','DD-MON-YYYY'),
                         1600,
                         300,
                         30 );
insert into emp values ( 7521,
                         'WARD',
                         'SALESMAN',
                         7698,
                         to_date('22-FEB-1981','DD-MON-YYYY'),
                         1250,
                         500,
                         30 );
insert into emp values ( 7566,
                         'JONES',
                         'MANAGER',
                         7839,
                         to_date('2-APR-1981','DD-MON-YYYY'),
                         2975,
                         null,
                         20 );
insert into emp values ( 7654,
                         'MARTIN',
                         'SALESMAN',
                         7698,
                         to_date('28-SEP-1981','DD-MON-YYYY'),
                         1250,
                         1400,
                         30 );
insert into emp values ( 7698,
                         'BLAKE',
                         'MANAGER',
                         7839,
                         to_date('1-MAY-1981','DD-MON-YYYY'),
                         2850,
                         null,
                         30 );
insert into emp values ( 7782,
                         'CLARK',
                         'MANAGER',
                         7839,
                         to_date('9-JUN-1981','DD-MON-YYYY'),
                         2450,
                         null,
                         10 );
insert into emp values ( 7788,
                         'SCOTT',
                         'ANALYST',
                         7566,
                         to_date('09-DEC-1982','DD-MON-YYYY'),
                         3000,
                         null,
                         20 );
insert into emp values ( 7839,
                         'KING',
                         'PRESIDENT',
                         null,
                         to_date('17-NOV-1981','DD-MON-YYYY'),
                         5000,
                         null,
                         10 );
insert into emp values ( 7844,
                         'TURNER',
                         'SALESMAN',
                         7698,
                         to_date('8-SEP-1981','DD-MON-YYYY'),
                         1500,
                         0,
                         30 );
insert into emp values ( 7876,
                         'ADAMS',
                         'CLERK',
                         7788,
                         to_date('12-JAN-1983','DD-MON-YYYY'),
                         1100,
                         null,
                         20 );
insert into emp values ( 7900,
                         'JAMES',
                         'CLERK',
                         7698,
                         to_date('3-DEC-1981','DD-MON-YYYY'),
                         950,
                         null,
                         30 );
insert into emp values ( 7902,
                         'FORD',
                         'ANALYST',
                         7566,
                         to_date('3-DEC-1981','DD-MON-YYYY'),
                         3000,
                         null,
                         20 );
insert into emp values ( 7934,
                         'MILLER',
                         'CLERK',
                         7782,
                         to_date('23-JAN-1982','DD-MON-YYYY'),
                         1300,
                         null,
                         10 );

create table dept (
   deptno number(2),
   dname  varchar2(14),
   loc    varchar2(13)
);

insert into dept values ( 10,
                          'ACCOUNTING',
                          'NEW YORK' );
insert into dept values ( 20,
                          'RESEARCH',
                          'DALLAS' );
insert into dept values ( 30,
                          'SALES',
                          'CHICAGO' );
insert into dept values ( 40,
                          'OPERATIONS',
                          'BOSTON' );

create table bonus (
   ename varchar2(10),
   job   varchar2(9),
   sal   number,
   comm  number
);

create table salgrade (
   grade number,
   losal number,
   hisal number
);

insert into salgrade values ( 1,
                              700,
                              1200 );
insert into salgrade values ( 2,
                              1201,
                              1400 );
insert into salgrade values ( 3,
                              1401,
                              2000 );
insert into salgrade values ( 4,
                              2001,
                              3000 );
insert into salgrade values ( 5,
                              3001,
                              9999 );

create table customer (
   custid      number(6) not null,
   name        varchar2(45),
   address     varchar2(40),
   city        varchar2(30),
   state       varchar2(2),
   zip         varchar2(9),
   area        number(3),
   phone       varchar2(9),
   repid       number(4) not null,
   creditlimit number(9,2),
   comments    long,
   constraint customer_primary_key primary key ( custid ),
   constraint custid_zero check ( custid > 0 )
);

create table ord (
   ordid     number(4) not null,
   orderdate date,
   commplan  varchar2(1),
   custid    number(6) not null,
   shipdate  date,
   total     number(8,2)
      constraint total_zero check ( total >= 0 ),
   constraint ord_foreign_key foreign key ( custid )
      references customer ( custid ),
   constraint ord_primary_key primary key ( ordid )
);

create table item (
   ordid       number(4) not null,
   itemid      number(4) not null,
   prodid      number(6),
   actualprice number(8,2),
   qty         number(8),
   itemtot     number(8,2),
   constraint item_foreign_key foreign key ( ordid )
      references ord ( ordid ),
   constraint item_primary_key primary key ( ordid,
                                             itemid )
);

create table product (
   prodid  number(6)
      constraint product_primary_key primary key,
   descrip varchar2(30)
);

create table price (
   prodid    number(6) not null,
   stdprice  number(8,2),
   minprice  number(8,2),
   startdate date,
   enddate   date
);

insert into customer (
   zip,
   state,
   repid,
   phone,
   name,
   custid,
   creditlimit,
   city,
   area,
   address,
   comments
) values ( '96711',
           'CA',
           '7844',
           '598-6609',
           'JOCKSPORTS',
           '100',
           '5000',
           'BELMONT',
           '415',
           '345 VIEWRIDGE',
           'Very friendly people to work with -- sales rep likes to be called Mike.' );

insert into customer (
   zip,
   state,
   repid,
   phone,
   name,
   custid,
   creditlimit,
   city,
   area,
   address,
   comments
) values ( '94061',
           'CA',
           '7521',
           '368-1223',
           'TKB SPORT SHOP',
           '101',
           '10000',
           'REDWOOD CITY',
           '415',
           '490 BOLI RD.',
           'Rep called 5/8 about change in order - contact shipping.' );

insert into customer (
   zip,
   state,
   repid,
   phone,
   name,
   custid,
   creditlimit,
   city,
   area,
   address,
   comments
) values ( '95133',
           'CA',
           '7654',
           '644-3341',
           'VOLLYRITE',
           '102',
           '7000',
           'BURLINGAME',
           '415',
           '9722 HAMILTON',
           'Company doing heavy promotion beginning 10/89. Prepare for large orders during
 winter.' );

insert into customer (
   zip,
   state,
   repid,
   phone,
   name,
   custid,
   creditlimit,
   city,
   area,
   address,
   comments
) values ( '97544',
           'CA',
           '7521',
           '677-9312',
           'JUST TENNIS',
           '103',
           '3000',
           'BURLINGAME',
           '415',
           'HILLVIEW MALL',
           'Contact rep about new line of tennis rackets.' );

insert into customer (
   zip,
   state,
   repid,
   phone,
   name,
   custid,
   creditlimit,
   city,
   area,
   address,
   comments
) values ( '93301',
           'CA',
           '7499',
           '996-2323',
           'EVERY MOUNTAIN',
           '104',
           '10000',
           'CUPERTINO',
           '408',
           '574 SURRY RD.',
           'Customer with high market share (23%) due to aggressive advertising.' );

insert into customer (
   zip,
   state,
   repid,
   phone,
   name,
   custid,
   creditlimit,
   city,
   area,
   address,
   comments
) values ( '91003',
           'CA',
           '7844',
           '376-9966',
           'K + T SPORTS',
           '105',
           '5000',
           'SANTA CLARA',
           '408',
           '3476 EL PASEO',
           'Tends to order large amounts of merchandise at once. Accounting is considering
 raising their credit limit. Usually pays on time.' );

insert into customer (
   zip,
   state,
   repid,
   phone,
   name,
   custid,
   creditlimit,
   city,
   area,
   address,
   comments
) values ( '94301',
           'CA',
           '7521',
           '364-9777',
           'SHAPE UP',
           '106',
           '6000',
           'PALO ALTO',
           '415',
           '908 SEQUOIA',
           'Support intensive. Orders small amounts (< 800) of merchandise at a time.' );

insert into customer (
   zip,
   state,
   repid,
   phone,
   name,
   custid,
   creditlimit,
   city,
   area,
   address,
   comments
) values ( '93301',
           'CA',
           '7499',
           '967-4398',
           'WOMENS SPORTS',
           '107',
           '10000',
           'SUNNYVALE',
           '408',
           'VALCO VILLAGE',
           'First sporting goods store geared exclusively towards women. Unusual promotion
al style and very willing to take chances towards new products!' );

insert into customer (
   zip,
   state,
   repid,
   phone,
   name,
   custid,
   creditlimit,
   city,
   area,
   address,
   comments
) values ( '55649',
           'MN',
           '7844',
           '566-9123',
           'NORTH WOODS HEALTH AND FITNESS SUPPLY CENTER',
           '108',
           '8000',
           'HIBBING',
           '612',
           '98 LONE PINE WAY',
           '' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '101.4',
           '08-JAN-1987',
           '610',
           '07-JAN-1987',
           '101',
           'A' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '45',
           '11-JAN-1987',
           '611',
           '11-JAN-1987',
           '102',
           'B' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '5860',
           '20-JAN-1987',
           '612',
           '15-JAN-1987',
           '104',
           'C' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '2.4',
           '30-MAY-1986',
           '601',
           '01-MAY-1986',
           '106',
           'A' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '56',
           '20-JUN-1986',
           '602',
           '05-JUN-1986',
           '102',
           'B' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '698',
           '30-JUN-1986',
           '604',
           '15-JUN-1986',
           '106',
           'A' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '8324',
           '30-JUL-1986',
           '605',
           '14-JUL-1986',
           '106',
           'A' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '3.4',
           '30-JUL-1986',
           '606',
           '14-JUL-1986',
           '100',
           'A' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '97.5',
           '15-AUG-1986',
           '609',
           '01-AUG-1986',
           '100',
           'B' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '5.6',
           '18-JUL-1986',
           '607',
           '18-JUL-1986',
           '104',
           'C' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '35.2',
           '25-JUL-1986',
           '608',
           '25-JUL-1986',
           '104',
           'C' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '224',
           '05-JUN-1986',
           '603',
           '05-JUN-1986',
           '102',
           '' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '4450',
           '12-MAR-1987',
           '620',
           '12-MAR-1987',
           '100',
           '' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '6400',
           '01-FEB-1987',
           '613',
           '01-FEB-1987',
           '108',
           '' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '23940',
           '05-FEB-1987',
           '614',
           '01-FEB-1987',
           '102',
           '' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '764',
           '10-FEB-1987',
           '616',
           '03-FEB-1987',
           '103',
           '' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '1260',
           '04-FEB-1987',
           '619',
           '22-FEB-1987',
           '104',
           '' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '46370',
           '03-MAR-1987',
           '617',
           '05-FEB-1987',
           '105',
           '' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '710',
           '06-FEB-1987',
           '615',
           '01-FEB-1987',
           '107',
           '' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '3510.5',
           '06-MAR-1987',
           '618',
           '15-FEB-1987',
           '102',
           'A' );

insert into ord (
   total,
   shipdate,
   ordid,
   orderdate,
   custid,
   commplan
) values ( '730',
           '01-JAN-1987',
           '621',
           '15-MAR-1987',
           '100',
           'A' );


insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '1',
           '100890',
           '610',
           '58',
           '3',
           '58' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '1',
           '100861',
           '611',
           '45',
           '1',
           '45' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '100',
           '100860',
           '612',
           '3000',
           '1',
           '30' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '1',
           '200376',
           '601',
           '2.4',
           '1',
           '2.4' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '20',
           '100870',
           '602',
           '56',
           '1',
           '2.8' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '3',
           '100890',
           '604',
           '174',
           '1',
           '58' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '2',
           '100861',
           '604',
           '84',
           '2',
           '42' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '10',
           '100860',
           '604',
           '440',
           '3',
           '44' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '4',
           '100860',
           '603',
           '224',
           '2',
           '56' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '1',
           '100860',
           '610',
           '35',
           '1',
           '35' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '3',
           '100870',
           '610',
           '8.4',
           '2',
           '2.8' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '200',
           '200376',
           '613',
           '440',
           '4',
           '2.2' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '444',
           '100860',
           '614',
           '15540',
           '1',
           '35' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '1000',
           '100870',
           '614',
           '2800',
           '2',
           '2.8' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '20',
           '100861',
           '612',
           '810',
           '2',
           '40.5' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '150',
           '101863',
           '612',
           '1500',
           '3',
           '10' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '10',
           '100860',
           '620',
           '350',
           '1',
           '35' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '1000',
           '200376',
           '620',
           '2400',
           '2',
           '2.4' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '500',
           '102130',
           '620',
           '1700',
           '3',
           '3.4' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '100',
           '100871',
           '613',
           '560',
           '1',
           '5.6' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '200',
           '101860',
           '613',
           '4800',
           '2',
           '24' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '150',
           '200380',
           '613',
           '600',
           '3',
           '4' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '100',
           '102130',
           '619',
           '340',
           '3',
           '3.4' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '50',
           '100860',
           '617',
           '1750',
           '1',
           '35' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '100',
           '100861',
           '617',
           '4500',
           '2',
           '45' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '1000',
           '100871',
           '614',
           '5600',
           '3',
           '5.6' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '10',
           '100861',
           '616',
           '450',
           '1',
           '45' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '50',
           '100870',
           '616',
           '140',
           '2',
           '2.8' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '2',
           '100890',
           '616',
           '116',
           '3',
           '58' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '10',
           '102130',
           '616',
           '34',
           '4',
           '3.4' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '10',
           '200376',
           '616',
           '24',
           '5',
           '2.4' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '100',
           '200380',
           '619',
           '400',
           '1',
           '4' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '100',
           '200376',
           '619',
           '240',
           '2',
           '2.4' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '4',
           '100861',
           '615',
           '180',
           '1',
           '45' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '1',
           '100871',
           '607',
           '5.6',
           '1',
           '5.6' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '100',
           '100870',
           '615',
           '280',
           '2',
           '2.8' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '500',
           '100870',
           '617',
           '1400',
           '3',
           '2.8' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '500',
           '100871',
           '617',
           '2800',
           '4',
           '5.6' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '500',
           '100890',
           '617',
           '29000',
           '5',
           '58' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '100',
           '101860',
           '617',
           '2400',
           '6',
           '24' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '200',
           '101863',
           '617',
           '2500',
           '7',
           '12.5' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '100',
           '102130',
           '617',
           '340',
           '8',
           '3.4' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '200',
           '200376',
           '617',
           '480',
           '9',
           '2.4' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '300',
           '200380',
           '617',
           '1200',
           '10',
           '4' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '5',
           '100870',
           '609',
           '12.5',
           '2',
           '2.5' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '1',
           '100890',
           '609',
           '50',
           '3',
           '50' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '23',
           '100860',
           '618',
           '805',
           '1',
           '35' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '50',
           '100861',
           '618',
           '2255.5',
           '2',
           '45.11' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '10',
           '100870',
           '618',
           '450',
           '3',
           '45' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '10',
           '100861',
           '621',
           '450',
           '1',
           '45' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '100',
           '100870',
           '621',
           '280',
           '2',
           '2.8' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '50',
           '100871',
           '615',
           '250',
           '3',
           '5' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '1',
           '101860',
           '608',
           '24',
           '1',
           '24' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '2',
           '100871',
           '608',
           '11.2',
           '2',
           '5.6' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '1',
           '100861',
           '609',
           '35',
           '1',
           '35' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '1',
           '102130',
           '606',
           '3.4',
           '1',
           '3.4' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '100',
           '100861',
           '605',
           '4500',
           '1',
           '45' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '500',
           '100870',
           '605',
           '1400',
           '2',
           '2.8' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '5',
           '100890',
           '605',
           '290',
           '3',
           '58' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '50',
           '101860',
           '605',
           '1200',
           '4',
           '24' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '100',
           '101863',
           '605',
           '900',
           '5',
           '9' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '10',
           '102130',
           '605',
           '34',
           '6',
           '3.4' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '100',
           '100871',
           '612',
           '550',
           '4',
           '5.5' );

insert into item (
   qty,
   prodid,
   ordid,
   itemtot,
   itemid,
   actualprice
) values ( '50',
           '100871',
           '619',
           '280',
           '4',
           '5.6' );


insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '4.8',
           '01-JAN-1985',
           '100871',
           '3.2',
           '01-DEC-1985' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '58',
           '01-JAN-1985',
           '100890',
           '46.4',
           '' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '54',
           '01-JUN-1984',
           '100890',
           '40.5',
           '31-MAY-1984' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '35',
           '01-JUN-1986',
           '100860',
           '28',
           '' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '32',
           '01-JAN-1986',
           '100860',
           '25.6',
           '31-MAY-1986' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '30',
           '01-JAN-1985',
           '100860',
           '24',
           '31-DEC-1985' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '45',
           '01-JUN-1986',
           '100861',
           '36',
           '' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '42',
           '01-JAN-1986',
           '100861',
           '33.6',
           '31-MAY-1986' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '39',
           '01-JAN-1985',
           '100861',
           '31.2',
           '31-DEC-1985' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '2.8',
           '01-JAN-1986',
           '100870',
           '2.4',
           '' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '2.4',
           '01-JAN-1985',
           '100870',
           '1.9',
           '01-DEC-1985' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '5.6',
           '01-JAN-1986',
           '100871',
           '4.8',
           '' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '24',
           '15-FEB-1985',
           '101860',
           '18',
           '' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '12.5',
           '15-FEB-1985',
           '101863',
           '9.4',
           '' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '3.4',
           '18-AUG-1985',
           '102130',
           '2.8',
           '' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '2.4',
           '15-NOV-1986',
           '200376',
           '1.75',
           '' );

insert into price (
   stdprice,
   startdate,
   prodid,
   minprice,
   enddate
) values ( '4',
           '15-NOV-1986',
           '200380',
           '3.2',
           '' );

create index price_index on
   price (
      prodid,
      startdate
   );

insert into product (
   prodid,
   descrip
) values ( '100860',
           'ACE TENNIS RACKET I' );

insert into product (
   prodid,
   descrip
) values ( '100861',
           'ACE TENNIS RACKET II' );

insert into product (
   prodid,
   descrip
) values ( '100870',
           'ACE TENNIS BALLS-3 PACK' );

insert into product (
   prodid,
   descrip
) values ( '100871',
           'ACE TENNIS BALLS-6 PACK' );

insert into product (
   prodid,
   descrip
) values ( '100890',
           'ACE TENNIS NET' );

insert into product (
   prodid,
   descrip
) values ( '101860',
           'SP TENNIS RACKET' );

insert into product (
   prodid,
   descrip
) values ( '101863',
           'SP JUNIOR RACKET' );

insert into product (
   prodid,
   descrip
) values ( '102130',
           'RH: "GUIDE TO TENNIS"' );

insert into product (
   prodid,
   descrip
) values ( '200376',
           'SB ENERGY BAR-6 PACK' );

insert into product (
   prodid,
   descrip
) values ( '200380',
           'SB VITA SNACK-6 PACK' );

create sequence ordid increment by 1 start with 622 nocache;

create sequence prodid increment by 1 start with 200381 nocache;

create sequence custid increment by 1 start with 109 nocache;