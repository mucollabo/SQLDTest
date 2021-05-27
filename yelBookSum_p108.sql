-- yellowbook
-- p108 105번

create table SERVICE01
(sID      varchar(10),
 sNAME      varchar2(20));
 
insert into SERVICE01 values(001, 'service1');
insert into SERVICE01 values(002, 'service2');
insert into SERVICE01 values(003, 'service3');
insert into SERVICE01 values(004, 'service4');

commit;

create table regSERVICE01
(mno        number(10),
 sID        number(10),
 regdate    varchar(20));
 
 desc regservice01;
 
insert into regSERVICE01 values(1, 001, '2013-01-01');
insert into regSERVICE01 values(1, 002, '2013-01-02');
insert into regSERVICE01 values(2, 001, '2013-01-01');
insert into regSERVICE01 values(2, 002, '2013-01-02');
insert into regSERVICE01 values(2, 003, '2013-01-03');
insert into regSERVICE01 values(3, 001, '2013-01-01');
insert into regSERVICE01 values(3, 002, '2013-01-02');
insert into regSERVICE01 values(3, 003, '2013-01-03');

commit;

select * from service01;

select * from regservice01;

select case when grouping(A.sid) = 0 then A.sid else 'total' end as serviceid,
        case when grouping(B.regdate) = 0 then NVL(B.regdate, '-') else 'subtotal' end as registerdate,
        count(B.mno) as subno
    from service01 A left outer join regservice01 B
    on (A.sid = B.sid
        and B.regdate between '2013-01-01' and '2013-01-31')
    group by rollup(A.sid, B.regdate);
    
alter table regservice01 modify regdate varchar(20);

drop table regservice01;

commit;

drop table service01;
