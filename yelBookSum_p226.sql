-- yelBookSum_p226
-- 7) 절차형 SQL

-- 1. 절차형 SQL 개요

-- 2. P/SQL 개요
-- 가. PL/SQL 특징
-- 나. PL/SQL 구조
-- 다. PL/SQL 기본 문법(Syntax)

-- 3. T-SQL 개요
-- 가. T-SQL 특징
-- p228
-- p229
-- 4. Procedure의 생성과 활용
-- p230

desc dept;

select * from dept;
select * from dept_temp;

create or replace procedure p_DEPT_insert
(v_DEPTNO in number,
 v_dname  in varchar2,
 v_loc    in varchar2,
 v_result out varchar2)
IS cnt number := 0;
begin
select count(*) into cnt
from dept where deptno = v_deptno and rownum = 1;
if cnt > 0 then
v_result := '이미 등록된 부서번호이다.';
else INSERT INTO DEPT (DEPTNO, DNAME, LOC)
values (v_deptno, v_dname, v_loc);
commit;
v_result := '입력 완료!!';
end if;
EXCEPTION
when OTHERS THEN ROLLBACK;
v_result := 'ERROR 발생';
end;
/

select * from dept;

variable rslt varchar2(30);

execute p_dept_insert(10, 'dev', 'seoul',:rslt);

print rslt;

execute p_dept_insert(50, 'NewDev', 'seoul', :rslt);

print rslt;

select * from dept;

-- p231
-- 5.User Defined Function의 생성과 활용

select sche_date 경기일자, hometeam_id || '-' || awayteam_id 팀들, home_score || '-' || away_score score, abs(home_score - away_score) 점수차
    from schedule
    where gubun = 'Y' and sche_date between '20120801' and '20120831'
    order by sche_date;
    
-- p232

-- p233

create table order_list
(order_date char(8) not null,
 product    varchar2(10) not null,
 qty        number not null,
 amount     number not null);
 
 create table sales_per_date
 (sale_date     char(8)     not null,
  product       varchar2(10) not null,
  qty           number      not null,
  amount        number      not null);
  
create or replace trigger summary_sales
after insert on order_list for each row declare
o_date order_list.order_date%TYPE;
o_prod order_list.product%TYPE;
begin
o_date := :NEW.order_date;
o_prod := :NEW.product;
update sales_per_date
set qty = qty + :NEW.qty,
    amount = amount + :NEW.amount
    where sale_date = o_date and product = o_prod;
    if SQL%NOTFOUND then
insert into sales_per_date
    values(o_date, o_prod, :NEW.qty, :NEW.amount);
end if;
end;
/

-- p234

select * from order_list;

select * from sales_per_date;

insert into order_list values('20120901', 'MONOPACK', 10, 300000);

select * from order_list;
select * from sales_per_date;

insert into order_list values('20120901', 'MONOPACK', 20, 600000);
commit;

select * from order_list;
select * from sales_per_date;

-- p235

insert into order_list values('20120901', 'MULTIBACK', 10, 300000);

select * from order_list;

select * from sales_per_date;

rollback;

select * from order_list;
select * from sales_per_date;

-- 7. 프로시저와 트리거의 차이점

