-- yelBookSum_p236
-- 2과목 Part3. SQL 최적화와 기본원리
-- 1) 옵티마이저 실행계획
-- 1. 옵티마이저
-- 가. 규칙기반 옵티마이저
-- p238

select ename 
    from emp 
    where job = 'SALESMAN' 
    and sal between 3000 and 6000;
    
-- 나. 비용기반 옵티마이저

