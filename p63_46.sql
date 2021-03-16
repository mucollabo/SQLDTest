-- SQLD yellow book
-- p63 46

select ename, empno, mgr, nullif(mgr, 7698) as NM
    from emp;
    
