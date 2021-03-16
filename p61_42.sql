-- SQLD yellow book
-- p61 42

select to_char(to_date('2015.01.10 10', 'YYYY.MM.DD HH24') + 1/24/(60/10), 'YYYY.MM.DD HH24:MI:SS') from dual;

select to_char(to_date('2015.01.10 10', 'YYYY.MM.DD HH24')) from dual;

select to_char(1/24/(60/10), 'YYYY.MM.DD HH24:MI:SS') from dual;

