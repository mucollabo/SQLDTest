--SQLD p94
-- 87

desc TAB1;

select * from TAB1;

drop table TAB1;

create table TAB1
(C1     number,
 C2     number,
 C3     CHAR(2));
 
desc TAB1;
 
insert into TAB1 values(1, NULL, 'A');
insert into TAB1 values(2, 1, 'B');
insert into TAB1 values(3, 2, 'C');
insert into TAB1 values(4, 2, 'D');
 
select * from TAB1;
 
update TAB1 set C2 = 1
    where C1 = 3;
    
select C3
    from TAB1
    start with C2 is NULL
    connect by prior C1 = C2
    order siblings by C3 desc;
    
-- 89

select * from emp;

create table sawon1
(empno      number(3),
 ename    varchar(20),
 hiredate   date,
 mgr        number(3));
 
insert into sawon1 values(001, '홍길동', '2012-01-01', NULL);
insert into sawon1 values(002, '강감찬', '2012-01-01', 001);
insert into sawon1 values(003, '이순신', '2013-01-01', 001);
insert into sawon1 values(004, '이민정', '2013-01-01', 001);
insert into sawon1 values(005, '이병헌', '2013-01-01', NULL);
insert into sawon1 values(006, '안성기', '2014-01-01', 005);
insert into sawon1 values(007, '이수근', '2014-01-01', 005);
insert into sawon1 values(008, '김병만', '2014-01-01', 005);

select * from sawon1;

commit;

select empno, ename, hiredate, mgr
    from sawon1
    start with mgr is NULL
    connect by prior empno = mgr
    and hiredate between '2013-01-01' and '2013-12-31'
    order siblings by empno;
    
--91

desc dept7;
select * from dept7;

alter table dept7 RENAME COLUMN loc TO prdeptno;

insert into dept7 values(100, '아시아부', NULL);
insert into dept7 values(110, '한국지사', 100);
insert into dept7 values(111, '서울지점', 110);
insert into dept7 values(112, '부산지점', 110);
insert into dept7 values(120, '일본지사', 100);
insert into dept7 values(121, '도쿄지점', 120);
insert into dept7 values(122, '오사카지점', 120);
insert into dept7 values(130, '중국지사', 100);
insert into dept7 values(131, '베이징지점', 130);
insert into dept7 values(132, '상하이지점', 130);
insert into dept7 values(200, '남유렵지부', NULL);
insert into dept7 values(210, '스페인지사', 200);
insert into dept7 values(212, '마드리드지점', 210);

update dept7 set deptno = 211
    where dname = '마드리드지점';

insert into dept7 values(212, '그라나다지점', 210);
insert into dept7 values(220, '포르투갈지사', 200);
insert into dept7 values(221, '리스본지점', 220);
insert into dept7 values(222, '포르투지점', 220);

commit;

select * from sales_per_date;

create table sales01
(deptno     number(10),
 sales      number(10));
 
insert into sales01 values(111, 1000);
insert into sales01 values(112, 2000);
insert into sales01 values(121, 1500);
insert into sales01 values(122, 1000);
insert into sales01 values(131, 1500);
insert into sales01 values(132, 2000);
insert into sales01 values(211, 2000);
insert into sales01 values(212, 1500);
insert into sales01 values(221, 1000);
insert into sales01 values(222, 2000);

commit;

select * from sales01;

-- 보기1번

select A.deptno, A.dname, A.prdeptno, B.sales, LVL
    from (select deptno, dname, prdeptno, level as LVL
            from dept7
                start with deptno = 120
                connect by prior prdeptno = deptno
                union
          select deptno, dname, prdeptno, level as LVL
            from dept7
                start with deptno = 120
                connect by prdeptno = prior deptno) A left outer join sales01 B
on (A.deptno = B.deptno)
order by A.deptno;

/*
select deptno, dname, prdeptno, level as LVL
            from dept7
                start with deptno = 120
                connect by prior prdeptno = deptno;
                
select deptno, dname, prdeptno, level as LVL
            from dept7
                start with deptno = 120
                connect by prdeptno = prior deptno;
*/

-- 보기2번

select A.deptno, A.dname, A.prdeptno, B.sales, LVL
    from (select deptno, dname, prdeptno, level as LVL
            from dept7
                start with deptno = 100
                connect by prdeptno = prior deptno) A left outer join sales01 B
on (A.deptno = B.deptno)
order by A.deptno;

-- 보기3번

select A.deptno, A.dname, A.prdeptno, B.sales, LVL
    from (select deptno, dname, prdeptno, level as LVL
            from dept7
                start with deptno = 121
                connect by prior prdeptno = deptno) A left outer join sales01 B
on (A.deptno = B.deptno)
order by A.deptno;

-- 보기4번

select A.deptno, A.dname, A.prdeptno, B.sales, LVL
    from (select deptno, dname, prdeptno, level as LVL
            from dept7
                start with deptno = (select deptno
                                        from dept7
                                        where prdeptno is null
                                        start with deptno = 120
                                        connect by prior prdeptno = deptno)
                connect by prdeptno = prior deptno) A left outer join sales01 B
on (A.deptno = B.deptno)
order by A.deptno;

