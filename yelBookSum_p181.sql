-- yelBookSum_p181
-- 8.OUTER JOIN

-- 가. LEFT OUTER JOIN
-- P182

select * from stadium_temp;

select stadium_name, stadium.stadium_id, seat_count, hometeam_id, team_name
    from stadium left outer join team
    on stadium.hometeam_id = team.team_id
    order by hometeam_id;
    
-- 나. RIGHT OUTER JOIN

SELECT E.ENAME, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E RIGHT OUTER JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO;
    
-- P183
-- 다. FULL OUTER JOIN

SELECT * FROM DEPT_TP;

RENAME DEPT_TP TO DEPT_TEMP;

UPDATE DEPT_TEMP
    SET DEPTNO = DEPTNO + 20;
    
SELECT * FROM DEPT_TEMP;

COMMIT;

SAVEPOINT SVPT01;

SELECT *
    FROM DEPT FULL OUTER JOIN DEPT_TEMP
    ON DEPT.DEPTNO = DEPT_TEMP.DEPTNO;