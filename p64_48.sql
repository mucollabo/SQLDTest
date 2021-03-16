-- SQLD yellow book
-- p64 48

create table tab1
(c1     number(1),
 c2     number(1),
 c3     number(1));
 
 insert into tab1 values(1, 2, 3);
 insert into tab1 values(null, 2, 3);
 insert into tab1 values(null, null, 3);
 
 desc tab1;
 
 select * from tab1;
 
 select sum(coalesce(c1, c2, c3))
    from tab1;
    
