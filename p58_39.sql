-- SQLD yellow book
-- p58 39.

create table svc_join
(cust_id    varchar2(10) not null,
 svc_id     varchar2(5) not null,
 join_ymd   varchar2(8) not null,
 join_hh    varchar2(4) not null,
 svc_start_date date null,
 svc_end_date   date null);
 
 commit;
 
 select * from svc_join;
 
 desc svc_join;
 
-- 1.
select svc_id, count(*) as cnt
    from svc_join
    where svc_end_date >= to_date('20150101000000', 'YYYYMMDDHH24MISS')
    and   svc_end_date <= to_date('20150131235959', 'YYYYMMDDHH24MISS')
    and concat(join_ymd, join_hh) = '2014120100'
    group by svc_id;
    
-- 2.
select svc_id, count(*) as cnt
    from svc_join
    where svc_end_date >= to_date('20150101', 'YYYYMMDD')
    and   svc_end_date <  to_date('20150201', 'YYYYMMDD')
    and  (join_ymd, join_hh) in(('20141201', '00'))
    group by svc_id;
    
-- 3.
select svc_id, count(*) as cnt
    from svc_join
    where '201501' = to_char(svc_end_date, 'YYYYMM')
    and   join_ymd = '20141201'
    and   join_hh = '00'
    group by svc_id;
    
-- 4.
select svc_id, count(*) as cnt
    from svc_join
    where to_date('201501', 'YYYYMM') = svc_end_date
    and  join_ymd || join_hh = '2014120100'
    group by svc_id;
    
commit;
