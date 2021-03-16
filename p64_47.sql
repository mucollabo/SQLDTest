-- SQLD yellow book
-- p64 47

create table emp_q
(ename  varchar2(10),
 sal    number(10),
 comm   number(10));
 
 desc emp_q;
 
 insert into emp_q values('KING', 0, 3000);
 insert into emp_q values('KING', 5000, 0);
 insert into emp_q values('SCOTT', 1000, null);
 
 update emp_q
    set ename = 'FORD'
    where sal = 5000;
    
select * from emp_q;

commit;

select sal/comm
    from emp_q
    where ename = 'KING';
    
select sal/comm
    from emp_q
    where ename = 'FORD';
    
select sal/comm
    from emp_q
    where ename = 'SCOTT';
    
commit;
