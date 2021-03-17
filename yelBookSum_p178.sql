-- yelBookSum_p178
-- 6. on 조건절

select e.empno, e.ename, e.deptno, d.dname
    from emp e join dept d
    on (e.deptno = d.deptno);
    
select e.ename, e.deptno, d.deptno, d.dname
    from emp e join dept d
    on (e.deptno = d.deptno)
    where e.deptno = 30;
    
select e.ename, e.mgr, d.deptno, d.dname
    from emp e join dept d
    on (e.deptno = d.deptno and e.mgr = 7698);
    
select team_name, team.stadium_id, stadium_name
    from team join stadium
    on team.stadium_id = stadium.stadium_id
    order by stadium_id;
    
select *
    from stadium;
    
select *
    from team;
    
select team_name, team_id, stadium_name
    from team join stadium
    on team.team_id = stadium.hometeam_id
    order by team_id;
    
select team_name, team_id, stadium_name
    from team, stadium
    where team.team_id = stadium.hometeam_id
    order by team_id;
    
-- 라. 다중 테이블 JOIN
-- p180

select e.empno, d.deptno, d.dname, t.dname as New_DNAME
    from emp e join dept d
    on (e.deptno = d.deptno)
    join dept_tp t
    on (e.deptno = t.deptno);
    
select e.empno, d.deptno, d.dname, t.dname as New_DNAME
    from emp e, dept d, dept_tp t
    where e.deptno = d.deptno and e.deptno = t.deptno;
    
select * from player_temp;
select * from team;

create table team_temp
    as select * from team;
    
desc team_temp;

select * from team_temp;
select * from stadium;

create table stadium_temp
    as select * from stadium;

select p.player_name, p.position, t.region_name, t.team_name, s.stadium_name
    from player_temp p join team_temp t
    on (p.team_id = t.team_id)
    join stadium_temp s
    on (t.stadium_id = s.stadium_id)
    where p.position = 'GK'
    order by p.player_name;
    
select p.player_name, p.position, t.region_name, t.team_name, s.stadium_name
    from player_temp p, team_temp t, stadium_temp s
    where p.team_id = t.team_id and t.stadium_id = s.stadium_id
      and p.position = 'GK'
    order by p.player_name;
    
select * from player_temp;
select * from team_temp;
select * from stadium_temp;
select * from schedule;

create table schedule_temp
    as select * from schedule;

select * from schedule_temp;

select st.stadium_name, sc.stadium_id, sche_date, ht.team_name, at.team_name, home_score, away_score
    from schedule_temp sc
    join stadium_temp st
    on sc.stadium_id = st.stadium_id
    join team ht
    on sc.hometeam_id = ht.team_id
    join team at
    on sc.awayteam_id = at.team_id
    where home_score >= away_score + 3;
    
select st.stadium_name, sc.stadium_id, sche_date, ht.team_name, at.team_name, home_score, away_score
    from schedule_temp sc, stadium_temp st, team_temp ht, team at
    where sc.stadium_id = st.stadium_id
      and sc.hometeam_id = ht.team_id
      and sc.awayteam_id = at.team_id
      and home_score >= away_score + 3;
      
-- 7. CROSS JOIN
-- p181

select ename, dname
    from emp cross join dept
    order by ename;
    
