-- SQLD yellow book
-- p57 38.

create table msales
(year   number(4),
 month  number(2),
 sales  number(10));
 
desc msales;

insert into msales values (2014, 01, 1000);
insert into msales values (2014, 02, 2000);
insert into msales values (2014, 03, 3000);
insert into msales values (2014, 11, 4000);
insert into msales values (2014, 12, 5000);
insert into msales values (2015, 01, 6000);
insert into msales values (2015, 02, 1000);
insert into msales values (2015, 03, 8000);
insert into msales values (2015, 11, 9000);
insert into msales values (2015, 12, 10000);

update msales
    set sales = 7000
    where year = 2015 and month = 02;
    
select * from msales;

drop table msales;

desc msales;

commit;

create table msales
(year   varchar2(4),
 month  varchar2(2),
 sales  number(10));
 
desc msales;

insert into msales values ('2014', '01', 1000);
insert into msales values ('2014', '02', 2000);
insert into msales values ('2014', '03', 3000);
insert into msales values ('2014', '11', 4000);
insert into msales values ('2014', '12', 5000);
insert into msales values ('2015', '01', 6000);
insert into msales values ('2015', '02', 7000);
insert into msales values ('2015', '03', 8000);
insert into msales values ('2015', '11', 9000);
insert into msales values ('2015', '12', 10000);

TRUNCATE table msales;

select * from msales;

-- 1.
select sum(sales) as 매출금액합계
from msales
where year between '2014' and '2015'
and   month between '03' and '12';

-- 2.
select sum(sales) as 매출금액합계
from msales
where year in ('2014', '2015')
and   month in ('11', '12', '03', '04', '05');

-- 3.
select sum(sales) as 매출금액합계
from msales
where (year = '2014' or year = '2015')
and   (month between '01' and '03' or month between '11' and '12');

-- 4.
select sum(sales) as 매출금액합계
from msales
where year = '2014' and month between '11' and '12'
or    year = '2015' and month between '01' and '03';

commit;

