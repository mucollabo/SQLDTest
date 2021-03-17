-- 3.inner join

select emp.deptno, empno, ename, dname
    from emp, dept
    where emp.deptno = dept.deptno;

select emp.deptno, empno, ename, dname
    from emp inner join dept
    on emp.deptno = dept.deptno;

-- 4.natural join

select deptno, empno, ename, dname
    from emp natural join dept;

/*
select emp.deptno, empno, ename, dname
    from emp natural join dept;           -- error
*/

select *
    from emp natural join dept;
    
create table dept_tp
    as select * from dept;
    
desc dept_tp;

select * from dept_tp;

commit;


-- p176

select *
    from emp inner join dept
    on emp.deptno = dept.deptno;
    
update dept_tp
    set dname = 'R&D'
    where dname = 'R0';
    
update dept_tp
    set dname = 'MARKETING'
    where dname = 'SALES';
    
select *
    from dept natural join dept_tp;
    
select * from dept;
select * from dept_tp;

alter table dept_tp drop column sumsal;
alter table dept drop column sumsal;

commit;

select *
    from dept join dept_tp
    on dept.deptno = dept_tp.deptno
    and dept.dname = dept_tp.dname
    and dept.loc = dept_tp.loc;
    
select *
    from dept, dept_tp
    where dept.deptno = dept_tp.deptno
    and dept.dname = dept_tp.dname
    and dept.loc = dept_tp.loc;
    
-- p177
-- 5.using 조건절

select *
    from dept join dept_tp
    using (deptno);
    
select dept.deptno, dept.dname, dept.loc, dept_tp.dname, dept_tp.loc
    from dept join dept_tp
    using (deptno);
    
select deptno, dept.dname, dept.loc, dept_tp.dname, dept_tp.loc
    from dept join dept_tp
    using (deptno);
    
select *
    from dept join dept_tp
    using (dname);
    
-- p178

select *
    from dept join dept_tp
    using (loc, deptno);
    
commit;

select *
    from dept join dept_tp
    using (deptno, dname);
    
